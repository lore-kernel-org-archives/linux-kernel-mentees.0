Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE585C54EE9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Sep 2022 23:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56920405C8;
	Thu,  8 Sep 2022 23:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56920405C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUHrcjIqO0kd; Thu,  8 Sep 2022 23:28:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4115F40185;
	Thu,  8 Sep 2022 23:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4115F40185
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2589CC0033;
	Thu,  8 Sep 2022 23:28:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7BB0C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Sep 2022 23:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 512E580C7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Sep 2022 23:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 512E580C7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTwVHtqJeAsO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Sep 2022 23:28:25 +0000 (UTC)
X-Greylist: delayed 00:17:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13EA782EB4
Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn
 [202.108.3.24])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13EA782EB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Sep 2022 23:28:24 +0000 (UTC)
Received: from unknown (HELO pek-lxu-l1.corp.ad.wrs.com)([111.198.225.67])
 by sina.com (172.16.97.23) with ESMTP
 id 631A76550001AB17; Thu, 9 Sep 2022 07:10:14 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
X-SMAIL-MID: 26938254920982
From: eadavis@sina.com
To: tytso@mit.edu
Subject: [PATCH] ext4: fix kernel infoleak via ext4_extent_header
Date: Fri,  9 Sep 2022 07:11:13 +0800
Message-Id: <20220908231113.2401926-1-eadavis@sina.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <YMqNHnTofj9fR8IJ@mit.edu>
References: <YMqNHnTofj9fR8IJ@mit.edu>
MIME-Version: 1.0
Cc: akpm@osdl.org, hdanton@sina.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 mail@anirudhrb.com, adilger.kernel@dilger.ca, shaggy@austin.ibm.com,
 syzbot+2dcfeaf8cb49b05e8f1a@syzkaller.appspotmail.com,
 linux-ext4@vger.kernel.org, alex@clusterfs.com,
 Edward Adam Davis <eadavis@sina.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Edward Adam Davis <eadavis@sina.com>

Hi Ted,

http://syzkaller.appspot.com/bug?id=78e9ad0e6952a3ca16e8234724b2fa92d041b9b8

1. Syzbot report "kernel-infoleak in copy_page_to_iter"
2. Sample crash report:
IPv6: ADDRCONF(NETDEV_UP): veth1: link is not ready
IPv6: ADDRCONF(NETDEV_CHANGE): veth1: link becomes ready
IPv6: ADDRCONF(NETDEV_CHANGE): veth0: link becomes ready
8021q: adding VLAN 0 to HW filter on device team0
==================================================================
BUG: KMSAN: kernel-infoleak in copyout lib/iov_iter.c:140 [inline]
BUG: KMSAN: kernel-infoleak in copy_page_to_iter_iovec lib/iov_iter.c:212 [inline]
BUG: KMSAN: kernel-infoleak in copy_page_to_iter+0x77a/0x1ac0 lib/iov_iter.c:846
CPU: 0 PID: 5005 Comm: blkid Not tainted 4.19.0-rc1+ #39
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x14b/0x190 lib/dump_stack.c:113
 kmsan_report+0x183/0x2b0 mm/kmsan/kmsan.c:956
 kmsan_internal_check_memory+0x17e/0x1f0 mm/kmsan/kmsan.c:1020
 kmsan_copy_to_user+0x73/0xb0 mm/kmsan/kmsan_hooks.c:479
 copyout lib/iov_iter.c:140 [inline]
 copy_page_to_iter_iovec lib/iov_iter.c:212 [inline]
 copy_page_to_iter+0x77a/0x1ac0 lib/iov_iter.c:846
 generic_file_buffered_read mm/filemap.c:2185 [inline]
 generic_file_read_iter+0x3469/0x4430 mm/filemap.c:2362
 blkdev_read_iter+0x20d/0x270 fs/block_dev.c:1936
 call_read_iter include/linux/fs.h:1801 [inline]
 new_sync_read fs/read_write.c:406 [inline]
 __vfs_read+0x7bb/0x9f0 fs/read_write.c:418
 vfs_read+0x36f/0x6a0 fs/read_write.c:452
 ksys_read fs/read_write.c:578 [inline]
 __do_sys_read fs/read_write.c:588 [inline]
 __se_sys_read fs/read_write.c:586 [inline]
 __x64_sys_read+0x1b7/0x3c0 fs/read_write.c:586
 do_syscall_64+0x15b/0x220 arch/x86/entry/common.c:290
 entry_SYSCALL_64_after_hwframe+0x63/0xe7
RIP: 0033:0x7f6bf4959310
Code: 73 01 c3 48 8b 0d 28 4b 2b 00 31 d2 48 29 c2 64 89 11 48 83 c8 ff eb ea 90 90 83 3d e5 a2 2b 00 00 75 10 b8 00 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 6e 8a 01 00 48 89 04 24
RSP: 002b:00007fff70489898 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000000000037000 RCX: 00007f6bf4959310
RDX: 0000000000000029 RSI: 0000000000ddf1c8 RDI: 0000000000000003
RBP: 0000000000ddf1a0 R08: 0000000000000058 R09: 0101010101010101
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000dd9030
R13: 0000000000000029 R14: 0000000000dd9080 R15: 0000000000ddf1b8

Uninit was created at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:256 [inline]
 kmsan_internal_alloc_meta_for_pages+0x146/0x700 mm/kmsan/kmsan.c:694
 kmsan_alloc_page+0x75/0xd0 mm/kmsan/kmsan_hooks.c:250
 __alloc_pages_nodemask+0xf6b/0x5c80 mm/page_alloc.c:4411
 alloc_pages_current+0x6b1/0x970 mm/mempolicy.c:2093
 alloc_pages include/linux/gfp.h:511 [inline]
 __page_cache_alloc+0x95/0x320 mm/filemap.c:946
 page_cache_alloc include/linux/pagemap.h:234 [inline]
 generic_file_buffered_read mm/filemap.c:2273 [inline]
 generic_file_read_iter+0x27a4/0x4430 mm/filemap.c:2362
 blkdev_read_iter+0x20d/0x270 fs/block_dev.c:1936
 call_read_iter include/linux/fs.h:1801 [inline]
 new_sync_read fs/read_write.c:406 [inline]
 __vfs_read+0x7bb/0x9f0 fs/read_write.c:418
 vfs_read+0x36f/0x6a0 fs/read_write.c:452
 ksys_read fs/read_write.c:578 [inline]
 __do_sys_read fs/read_write.c:588 [inline]
 __se_sys_read fs/read_write.c:586 [inline]
 __x64_sys_read+0x1b7/0x3c0 fs/read_write.c:586
 do_syscall_64+0x15b/0x220 arch/x86/entry/common.c:290
 entry_SYSCALL_64_after_hwframe+0x63/0xe7

Bytes 0-40 of 41 are uninitialized
Memory access starts at ffff8801b1729000
==================================================================
3. Why initial the "eh_generation to 0" can prevent the infoleak to user space ?
3.1 In the kernel source code, there is no code that calls eh_generation a except initialization to 0
4. The var kiocb in func "new_sync_read" maybe save old value, it will make the infoleak to user space 
5. So use the following patch must prevent the infoleak to user space
diff --git a/fs/read_write.c b/fs/read_write.c
index 5db58b8c78d0..77b9e6a07626 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -408,6 +408,7 @@ static ssize_t new_sync_read(struct file *filp, char __user *buf, size_t len, lo
 	struct iov_iter iter;
 	ssize_t ret;

+	memset(&kiocb, 0, sizeof(struct kiocb));
 	init_sync_kiocb(&kiocb, filp);
 	kiocb.ki_pos = (ppos ? *ppos : 0);
 	iov_iter_init(&iter, READ, &iov, 1, len);
6. How do you think ?	

Adam, Thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
