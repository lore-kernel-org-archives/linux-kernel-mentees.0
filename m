Received: from 12.mo584.mail-out.ovh.net (12.mo584.mail-out.ovh.net [178.33.104.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62231DA4E
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Nov 2023 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.146.20])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id A7B0727758
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Nov 2023 15:31:55 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-lljcm (unknown [10.110.208.139])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CE6831FEBC;
	Mon, 20 Nov 2023 15:31:54 +0000 (UTC)
Received: from RCM-web2.webmail.mail.ovh.net ([176.31.232.109])
	by ghost-submission-6684bf9d7b-lljcm with ESMTPSA
	id Gli7Lup7W2WsAgAAgGBV+g
	(envelope-from <jose.pekkarinen@foxhound.fi>); Mon, 20 Nov 2023 15:31:54 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 20 Nov 2023 17:31:53 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: viro@zeniv.linux.org.uk, skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 syzbot+cb729843d0f42a5c1a50@syzkaller.appspotmail.com
Subject: Re: [PATCH] iov_iter: fix memleak in iov_iter_extract_pages
In-Reply-To: <20231111075323.208181-1-jose.pekkarinen@foxhound.fi>
References: <20231111075323.208181-1-jose.pekkarinen@foxhound.fi>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <8ab69336548dfe4f556d7be83d90afeb@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 192.42.116.182
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8929230686578320904
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudegjedgheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepvdffhfegtdeuiefgkefhgeefheektdekffeufeehgeeuueehjeeijeelleetjeeinecuffhomhgrihhnpehshiiikhgrlhhlvghrrdgrphhpshhpohhtrdgtohhmnecukfhppeduvdejrddtrddtrddupdduledvrdegvddrudduiedrudekvddpudejiedrfedurddvfedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigrdguvghvpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth

On 2023-11-11 09:53, José Pekkarinen wrote:
> syzbot reports there is a memory leak in iov_iter_extract_pages where 
> in
> the unlikely case of having an error in pin_user_pages_fast, the pages
> aren't free. This patch will free it before returning. Output of mem
> leak follows:
> 
> BUG: memory leak
> unreferenced object 0xffff888109d2e400 (size 1024):
>   comm "syz-executor121", pid 5006, jiffies 4294943225 (age 17.760s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<ffffffff81554bbb>] __do_kmalloc_node mm/slab_common.c:984 
> [inline]
>     [<ffffffff81554bbb>] __kmalloc_node+0x4b/0x150 mm/slab_common.c:992
>     [<ffffffff815440f9>] kmalloc_node include/linux/slab.h:602 [inline]
>     [<ffffffff815440f9>] kvmalloc_node+0x99/0x170 mm/util.c:604
>     [<ffffffff824c52fe>] kvmalloc include/linux/slab.h:720 [inline]
>     [<ffffffff824c52fe>] kvmalloc_array include/linux/slab.h:738 
> [inline]
>     [<ffffffff824c52fe>] want_pages_array lib/iov_iter.c:985 [inline]
>     [<ffffffff824c52fe>] iov_iter_extract_user_pages
> lib/iov_iter.c:1765 [inline]
>     [<ffffffff824c52fe>] iov_iter_extract_pages+0x1ee/0xa40 
> lib/iov_iter.c:1831
>     [<ffffffff824125a7>] bio_map_user_iov+0x167/0x5d0 
> block/blk-map.c:297
>     [<ffffffff82412df3>] blk_rq_map_user_iov+0x3e3/0xb30 
> block/blk-map.c:664
>     [<ffffffff82413943>] blk_rq_map_user block/blk-map.c:691 [inline]
>     [<ffffffff82413943>] blk_rq_map_user_io+0x143/0x160 
> block/blk-map.c:724
>     [<ffffffff82ca0925>] sg_io+0x285/0x510 
> drivers/scsi/scsi_ioctl.c:456
>     [<ffffffff82ca1025>] scsi_cdrom_send_packet+0x1b5/0x480
> drivers/scsi/scsi_ioctl.c:820
>     [<ffffffff82ca13ba>] scsi_ioctl+0xca/0xd30 
> drivers/scsi/scsi_ioctl.c:903
>     [<ffffffff82d35964>] sg_ioctl+0x5f4/0x10a0 drivers/scsi/sg.c:1163
>     [<ffffffff8168e602>] vfs_ioctl fs/ioctl.c:51 [inline]
>     [<ffffffff8168e602>] __do_sys_ioctl fs/ioctl.c:870 [inline]
>     [<ffffffff8168e602>] __se_sys_ioctl fs/ioctl.c:856 [inline]
>     [<ffffffff8168e602>] __x64_sys_ioctl+0xf2/0x140 fs/ioctl.c:856
>     [<ffffffff84ad2bb8>] do_syscall_x64 arch/x86/entry/common.c:50 
> [inline]
>     [<ffffffff84ad2bb8>] do_syscall_64+0x38/0xb0 
> arch/x86/entry/common.c:80
>     [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> BUG: memory leak
> unreferenced object 0xffff888109d2dc00 (size 1024):
>   comm "syz-executor121", pid 5007, jiffies 4294943747 (age 12.540s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<ffffffff81554bbb>] __do_kmalloc_node mm/slab_common.c:984 
> [inline]
>     [<ffffffff81554bbb>] __kmalloc_node+0x4b/0x150 mm/slab_common.c:992
>     [<ffffffff815440f9>] kmalloc_node include/linux/slab.h:602 [inline]
>     [<ffffffff815440f9>] kvmalloc_node+0x99/0x170 mm/util.c:604
>     [<ffffffff824c52fe>] kvmalloc include/linux/slab.h:720 [inline]
>     [<ffffffff824c52fe>] kvmalloc_array include/linux/slab.h:738 
> [inline]
>     [<ffffffff824c52fe>] want_pages_array lib/iov_iter.c:985 [inline]
>     [<ffffffff824c52fe>] iov_iter_extract_user_pages
> lib/iov_iter.c:1765 [inline]
>     [<ffffffff824c52fe>] iov_iter_extract_pages+0x1ee/0xa40 
> lib/iov_iter.c:1831
>     [<ffffffff824125a7>] bio_map_user_iov+0x167/0x5d0 
> block/blk-map.c:297
>     [<ffffffff82412df3>] blk_rq_map_user_iov+0x3e3/0xb30 
> block/blk-map.c:664
>     [<ffffffff82413943>] blk_rq_map_user block/blk-map.c:691 [inline]
>     [<ffffffff82413943>] blk_rq_map_user_io+0x143/0x160 
> block/blk-map.c:724
>     [<ffffffff82ca0925>] sg_io+0x285/0x510 
> drivers/scsi/scsi_ioctl.c:456
>     [<ffffffff82ca1025>] scsi_cdrom_send_packet+0x1b5/0x480
> drivers/scsi/scsi_ioctl.c:820
>     [<ffffffff82ca13ba>] scsi_ioctl+0xca/0xd30 
> drivers/scsi/scsi_ioctl.c:903
>     [<ffffffff82d35964>] sg_ioctl+0x5f4/0x10a0 drivers/scsi/sg.c:1163
>     [<ffffffff8168e602>] vfs_ioctl fs/ioctl.c:51 [inline]
>     [<ffffffff8168e602>] __do_sys_ioctl fs/ioctl.c:870 [inline]
>     [<ffffffff8168e602>] __se_sys_ioctl fs/ioctl.c:856 [inline]
>     [<ffffffff8168e602>] __x64_sys_ioctl+0xf2/0x140 fs/ioctl.c:856
>     [<ffffffff84ad2bb8>] do_syscall_x64 arch/x86/entry/common.c:50 
> [inline]
>     [<ffffffff84ad2bb8>] do_syscall_64+0x38/0xb0 
> arch/x86/entry/common.c:80
>     [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> BUG: memory leak
> unreferenced object 0xffff888109d2d800 (size 1024):
>   comm "syz-executor121", pid 5010, jiffies 4294944269 (age 7.320s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<ffffffff81554bbb>] __do_kmalloc_node mm/slab_common.c:984 
> [inline]
>     [<ffffffff81554bbb>] __kmalloc_node+0x4b/0x150 mm/slab_common.c:992
>     [<ffffffff815440f9>] kmalloc_node include/linux/slab.h:602 [inline]
>     [<ffffffff815440f9>] kvmalloc_node+0x99/0x170 mm/util.c:604
>     [<ffffffff824c52fe>] kvmalloc include/linux/slab.h:720 [inline]
>     [<ffffffff824c52fe>] kvmalloc_array include/linux/slab.h:738 
> [inline]
>     [<ffffffff824c52fe>] want_pages_array lib/iov_iter.c:985 [inline]
>     [<ffffffff824c52fe>] iov_iter_extract_user_pages
> lib/iov_iter.c:1765 [inline]
>     [<ffffffff824c52fe>] iov_iter_extract_pages+0x1ee/0xa40 
> lib/iov_iter.c:1831
>     [<ffffffff824125a7>] bio_map_user_iov+0x167/0x5d0 
> block/blk-map.c:297
>     [<ffffffff82412df3>] blk_rq_map_user_iov+0x3e3/0xb30 
> block/blk-map.c:664
>     [<ffffffff82413943>] blk_rq_map_user block/blk-map.c:691 [inline]
>     [<ffffffff82413943>] blk_rq_map_user_io+0x143/0x160 
> block/blk-map.c:724
>     [<ffffffff82ca0925>] sg_io+0x285/0x510 
> drivers/scsi/scsi_ioctl.c:456
>     [<ffffffff82ca1025>] scsi_cdrom_send_packet+0x1b5/0x480
> drivers/scsi/scsi_ioctl.c:820
>     [<ffffffff82ca13ba>] scsi_ioctl+0xca/0xd30 
> drivers/scsi/scsi_ioctl.c:903
>     [<ffffffff82d35964>] sg_ioctl+0x5f4/0x10a0 drivers/scsi/sg.c:1163
>     [<ffffffff8168e602>] vfs_ioctl fs/ioctl.c:51 [inline]
>     [<ffffffff8168e602>] __do_sys_ioctl fs/ioctl.c:870 [inline]
>     [<ffffffff8168e602>] __se_sys_ioctl fs/ioctl.c:856 [inline]
>     [<ffffffff8168e602>] __x64_sys_ioctl+0xf2/0x140 fs/ioctl.c:856
>     [<ffffffff84ad2bb8>] do_syscall_x64 arch/x86/entry/common.c:50 
> [inline]
>     [<ffffffff84ad2bb8>] do_syscall_64+0x38/0xb0 
> arch/x86/entry/common.c:80
>     [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> Reported-by: syzbot+cb729843d0f42a5c1a50@syzkaller.appspotmail.com
> Closes:
> https://syzkaller.appspot.com/bug?id=99c8551967f413d108cfdd2950a0cb5652de07b8
> Fixes: 7d58fe7310281 ("iov_iter: Add a function to extract a page list
> from an iterator")
> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
>  lib/iov_iter.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index 27234a820eeb..c3fd0448dead 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -1780,8 +1780,10 @@ static ssize_t
> iov_iter_extract_user_pages(struct iov_iter *i,
>  	if (!maxpages)
>  		return -ENOMEM;
>  	res = pin_user_pages_fast(addr, maxpages, gup_flags, *pages);
> -	if (unlikely(res <= 0))
> +	if (unlikely(res <= 0)) {
> +		kvfree(*pages);
>  		return res;
> +	}
>  	maxsize = min_t(size_t, maxsize, res * PAGE_SIZE - offset);
>  	iov_iter_advance(i, maxsize);
>  	return maxsize;

     Ping.

     José.
