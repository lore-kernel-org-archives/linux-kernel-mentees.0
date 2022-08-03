Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1048AC19F28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 11:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79A7B4059D;
	Wed,  3 Aug 2022 11:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79A7B4059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R94f7j8E6wk8; Wed,  3 Aug 2022 11:27:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7EA5F4029B;
	Wed,  3 Aug 2022 11:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EA5F4029B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5384FC0033;
	Wed,  3 Aug 2022 11:27:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4F4CC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 11:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97D626F8C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 11:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97D626F8C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pd29R-iEImwD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 11:27:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BBC3605E0
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BBC3605E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 11:27:12 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=guwen@linux.alibaba.com; NM=1; PH=DS; RN=25; SR=0;
 TI=SMTPD_---0VLGi36p_1659526024; 
Received: from 30.227.65.209(mailfrom:guwen@linux.alibaba.com
 fp:SMTPD_---0VLGi36p_1659526024) by smtp.aliyun-inc.com;
 Wed, 03 Aug 2022 19:27:06 +0800
Message-ID: <ecf07c1b-a6f3-2537-aacd-a768c437fa7f@linux.alibaba.com>
Date: Wed, 3 Aug 2022 19:27:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3] net/smc: fix refcount bug in sk_psock_get (2)
To: Hawkins Jiawei <yin31149@gmail.com>,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com
References: <00000000000026328205e08cdbeb@google.com>
 <20220803080338.166730-1-yin31149@gmail.com>
From: Wen Gu <guwen@linux.alibaba.com>
In-Reply-To: <20220803080338.166730-1-yin31149@gmail.com>
Cc: songliubraving@fb.com, ast@kernel.org, edumazet@google.com,
 jakub@cloudflare.com, daniel@iogearbox.net, davem@davemloft.net,
 borisp@nvidia.com, paskripkin@gmail.com, john.fastabend@gmail.com,
 andrii@kernel.org, yhs@fb.com, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, kuba@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kgraul@linux.ibm.com,
 bpf@vger.kernel.org, kafai@fb.com
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On 2022/8/3 16:03, Hawkins Jiawei wrote:
> Syzkaller reports refcount bug as follows:
> ------------[ cut here ]------------
> refcount_t: saturated; leaking memory.
> WARNING: CPU: 1 PID: 3605 at lib/refcount.c:19 refcount_warn_saturate+0xf4/0x1e0 lib/refcount.c:19
> Modules linked in:
> CPU: 1 PID: 3605 Comm: syz-executor208 Not tainted 5.18.0-syzkaller-03023-g7e062cda7d90 #0
>   <TASK>
>   __refcount_add_not_zero include/linux/refcount.h:163 [inline]
>   __refcount_inc_not_zero include/linux/refcount.h:227 [inline]
>   refcount_inc_not_zero include/linux/refcount.h:245 [inline]
>   sk_psock_get+0x3bc/0x410 include/linux/skmsg.h:439
>   tls_data_ready+0x6d/0x1b0 net/tls/tls_sw.c:2091
>   tcp_data_ready+0x106/0x520 net/ipv4/tcp_input.c:4983
>   tcp_data_queue+0x25f2/0x4c90 net/ipv4/tcp_input.c:5057
>   tcp_rcv_state_process+0x1774/0x4e80 net/ipv4/tcp_input.c:6659
>   tcp_v4_do_rcv+0x339/0x980 net/ipv4/tcp_ipv4.c:1682
>   sk_backlog_rcv include/net/sock.h:1061 [inline]
>   __release_sock+0x134/0x3b0 net/core/sock.c:2849
>   release_sock+0x54/0x1b0 net/core/sock.c:3404
>   inet_shutdown+0x1e0/0x430 net/ipv4/af_inet.c:909
>   __sys_shutdown_sock net/socket.c:2331 [inline]
>   __sys_shutdown_sock net/socket.c:2325 [inline]
>   __sys_shutdown+0xf1/0x1b0 net/socket.c:2343
>   __do_sys_shutdown net/socket.c:2351 [inline]
>   __se_sys_shutdown net/socket.c:2349 [inline]
>   __x64_sys_shutdown+0x50/0x70 net/socket.c:2349
>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>   do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
>   entry_SYSCALL_64_after_hwframe+0x46/0xb0
>   </TASK>
> 
> During SMC fallback process in connect syscall, kernel will
> replaces TCP with SMC. In order to forward wakeup
> smc socket waitqueue after fallback, kernel will sets
> clcsk->sk_user_data to origin smc socket in
> smc_fback_replace_callbacks().
> 
> Later, in shutdown syscall, kernel will calls
> sk_psock_get(), which treats the clcsk->sk_user_data
> as psock type, triggering the refcnt warning.
> 
> So, the root cause is that smc and psock, both will use
> sk_user_data field. So they will mismatch this field
> easily.
> 
> This patch solves it by using another bit(defined as
> SK_USER_DATA_PSOCK) in PTRMASK, to mark whether
> sk_user_data points to a psock object or not.
> This patch depends on a PTRMASK introduced in commit f1ff5ce2cd5e
> ("net, sk_msg: Clear sk_user_data pointer on clone if tagged").
> 
> Reported-and-tested-by: syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Acked-by: Wen Gu <guwen@linux.alibaba.com>
> Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
> ---
> v2 -> v3:
>    - use SK_USER_DATA_PSOCK instead of SK_USER_DATA_NOTPSOCK
> to patch the bug
>    - refactor the code on assigning to sk_user_data field
> in psock part
>    - refactor the code on getting and setting the flag
> with sk_user_data field
> 
> v1 -> v2:
>    - add bit in PTRMASK to patch the bug
> 
>   include/linux/skmsg.h |  2 +-
>   include/net/sock.h    | 58 +++++++++++++++++++++++++++++++------------
>   net/core/skmsg.c      |  3 ++-
>   3 files changed, 45 insertions(+), 18 deletions(-)
> 

Hi Hawkins,

Since the fix v3 doesn't involved smc codes any more, I wonder if it's still
appropriate to use 'net/smc:' in subject?

Cheers,
Wen Gu
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
