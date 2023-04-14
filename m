Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAABC77B77
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Apr 2023 13:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D5ED405ED;
	Fri, 14 Apr 2023 13:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D5ED405ED
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dlVo8j/W
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcUXh-M40AeZ; Fri, 14 Apr 2023 13:53:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3B9D9400D2;
	Fri, 14 Apr 2023 13:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B9D9400D2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 208E7C0037;
	Fri, 14 Apr 2023 13:53:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62DCEC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Apr 2023 13:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3615C60FEB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Apr 2023 13:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3615C60FEB
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dlVo8j/W
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PKs-gkI4js7G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Apr 2023 13:53:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 411ED60C17
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 411ED60C17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Apr 2023 13:53:35 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 b2-20020a17090a6e0200b002470b249e59so7651921pjk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Apr 2023 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681480414; x=1684072414;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0qGRdodWbglm/4nLuGPq0WWdg9oIMDzxL1+BodNRkNI=;
 b=dlVo8j/WgNCwLlT2hLLArgJlgTvV+mnNkOGmjAYpoTVnIzbheBW1QCUREs8TexfUUC
 7bhaWBC6OpRohj1KH9cl+oEtbisH77S4LnhqZ4U48MZ+ZwOBe7nsvnEYWmY1qrk8cFPn
 O0gka6p/8+5a411fUhdLMGW3s8ik/Ne8spOrP4/JlYc7CIEb1CHJQ1bzwvFI3RGxAmDB
 Awa7Zor/LRs5g0EvTc9JxtdshpAPFoO0BK+1EIXg38hyCEW1eus3GYKHRrP9nYfgrLdm
 4SVbCyisHJVGx460lh4tbOqYrOTtNZGUn+2zz/CUfGdS46V5BBtW/P0FJyp7Eki03wSn
 2qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681480414; x=1684072414;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0qGRdodWbglm/4nLuGPq0WWdg9oIMDzxL1+BodNRkNI=;
 b=BcSbZz8yeie1fKb8L2SOKuCQopOfvNuc86IiH5x0gLbK/rM+MhQpeytNx98gA2LtPE
 URfvLXK5tGCYMbPV3lbC2o0UGjXa+NlHhGKd2GsScgjEjkTmecUjQuLGNJRAaf8Ifm+z
 AeEukiBj5dbz1p7nBVp83ORwbJ6Nui7Kx+xfhaaTBGcU1rY7gYmKyEk0fu17C1jUOnxk
 1rwygMaqQLWXMQeka/e5ZmsYWGOfY9kyM/fLrrsDy0sJlXQxHyaONJOTiaKijl6zMT4K
 hGT8zgWXnitPHLdlpMTdg66RWi9ODX8mTvYVKEuLT003TeXg6HUlGtgyFu1p7TTK2MV9
 srJA==
X-Gm-Message-State: AAQBX9dd5QUsJ+mEJUQsp/gpZOpjWIp+iZ2+LMo9OM6SQOM/srAp77SR
 rlh7VLcH8tF1QeqIHyQvquA=
X-Google-Smtp-Source: AKy350am3+b1JoU2ZPTWq0qpA4UU4l44h0EG3UkOfJ9NGeFylot9I1+e/KeBsqU5tVSVPFNx1B4p9g==
X-Received: by 2002:a17:902:f9c8:b0:19d:553:746b with SMTP id
 kz8-20020a170902f9c800b0019d0553746bmr2587385plb.66.1681480414461; 
 Fri, 14 Apr 2023 06:53:34 -0700 (PDT)
Received: from yoga ([2400:1f00:13:fe48:30c1:6c25:8f15:18bc])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a1709026b0c00b001a229e52c1asm3086455plk.231.2023.04.14.06.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 06:53:34 -0700 (PDT)
Date: Fri, 14 Apr 2023 19:23:28 +0530
From: anupsharma <anupnewsmail@gmail.com>
To: shaggy@kernel.org, r33s3n6@gmail.com, mudongliangabcd@gmail.com,
 liushixin2@huawei.com, wuhoipok@gmail.com
Subject: [PATCH] fs: jfs: fixed UBSAN: shift-out-of-bounds in dbFree
Message-ID: <ZDla2Nuyq2QLdo96@yoga>
MIME-Version: 1.0
Content-Disposition: inline
Cc: jfs-discussion@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

Syzkaller reported the following issue:
         option from the mount to silence this warning.
=======================================================
find_entry called with index = 0
read_mapping_page failed!
ERROR: (device loop0): txCommit:
ERROR: (device loop0): remounting filesystem as read-only
================================================================================
UBSAN: shift-out-of-bounds in fs/jfs/jfs_dmap.c:381:12
shift exponent 134217736 is too large for 64-bit type 'long long'
CPU: 1 PID: 5068 Comm: syz-executor350 Not tainted 6.3.0-rc2-syzkaller-00069-g0ddc84d2dd43 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:217 [inline]
 __ubsan_handle_shift_out_of_bounds+0x3c3/0x420 lib/ubsan.c:387
 dbFree+0x46e/0x650 fs/jfs/jfs_dmap.c:381
 txFreeMap+0x96a/0xd50 fs/jfs/jfs_txnmgr.c:2510
 xtTruncate+0xe5c/0x3260 fs/jfs/jfs_xtree.c:2467
 jfs_free_zero_link+0x46e/0x6e0 fs/jfs/namei.c:758
 jfs_evict_inode+0x35f/0x440 fs/jfs/inode.c:153
 evict+0x2a4/0x620 fs/inode.c:665
 __dentry_kill+0x436/0x650 fs/dcache.c:607
 shrink_dentry_list+0x39c/0x6a0 fs/dcache.c:1201
 shrink_dcache_parent+0xcd/0x480
 do_one_tree+0x23/0xe0 fs/dcache.c:1682
 shrink_dcache_for_umount+0x7d/0x120 fs/dcache.c:1699
 generic_shutdown_super+0x67/0x340 fs/super.c:472
 kill_block_super+0x7e/0xe0 fs/super.c:1398
 deactivate_locked_super+0xa4/0x110 fs/super.c:331
 cleanup_mnt+0x426/0x4c0 fs/namespace.c:1177
 task_work_run+0x24a/0x300 kernel/task_work.c:179
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x68f/0x2290 kernel/exit.c:869
 do_group_exit+0x206/0x2c0 kernel/exit.c:1019
 __do_sys_exit_group kernel/exit.c:1030 [inline]
 __se_sys_exit_group kernel/exit.c:1028 [inline]
 __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1028
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fa87e2289b9
Code: Unable to access opcode bytes at 0x7fa87e22898f.
RSP: 002b:00007fff4bfe3938 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fa87e2a3330 RCX: 00007fa87e2289b9
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000001
RBP: 0000000000000001 R08: ffffffffffffffc0 R09: 00007fa87e29de40
R10: 00007fff4bfe3850 R11: 0000000000000246 R12: 00007fa87e2a3330
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
 </TASK>
================================================================================

db_l2nbperpage which is used as a shift exponent to get the buffer
for the current dmap will be less than and equal to 64. 

Tested via syzbot.

Reported-by: syzbot+d2cd27dcf8e04b232eb2@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=2a70a453331db32ed491f5cbb07e81bf2d225715

Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
---
 fs/jfs/jfs_dmap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index a3eb1e826947..d2cf56dd8f91 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -184,7 +184,10 @@ int dbMount(struct inode *ipbmap)
 		err = -EINVAL;
 		goto err_release_metapage;
 	}
-
+	if (bmp->db_l2nbperpage >= 64) {
+		err = -EINVAL;
+		goto err_release_metapage;
+	}
 	bmp->db_maxlevel = le32_to_cpu(dbmp_le->dn_maxlevel);
 	bmp->db_maxag = le32_to_cpu(dbmp_le->dn_maxag);
 	bmp->db_agpref = le32_to_cpu(dbmp_le->dn_agpref);
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
