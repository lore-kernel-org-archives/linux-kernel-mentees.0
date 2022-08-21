Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044EFC32772
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Aug 2022 12:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88BEB81A5C;
	Sun, 21 Aug 2022 12:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88BEB81A5C
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=poXDkZKa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwBK4G2bzQV1; Sun, 21 Aug 2022 12:11:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8D73F81A3B;
	Sun, 21 Aug 2022 12:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D73F81A3B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C617C0033;
	Sun, 21 Aug 2022 12:11:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61170C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 12:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CF3881A46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 12:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CF3881A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HrjD9yF9O2M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 12:11:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F00F081A3B
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F00F081A3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 12:11:43 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d10so7683174plr.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 05:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cgzLCp3a55Ep+0cEyKvv7krA21NYDyPYbH2CBGQzucg=;
 b=poXDkZKa0JzQnuD+BhY6e3Qpe4nDrJkPgdPTBRYH/OlRSm6eZmzE2txYKd5dKC+HBw
 DUmgcJYiQ0EZsxDNfyEKWV08OCsb882SCL7aFwQWpsotT9lwnQ5lwBu9UVBP4NiRNdDA
 Xb0HRelNBBr1KPlvYmPANAncDMlD+fmI4txdHDw/Idhg/gPI4VkQ76Bu9cVYjGvAm2Xa
 M1JRyU39Ppwq5Aowd7VMC6y3cAF+URXviAXKRbpasvcpPznqQPLu3fb+gvmQ4tRTv59r
 50yrjR//InHFuuwQlfZ5sRlEibsHohmhZxLVw5W5AMy6XjOnW70YbOnT+/n2AEbbs4L8
 wx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cgzLCp3a55Ep+0cEyKvv7krA21NYDyPYbH2CBGQzucg=;
 b=Z2SxYaiHnCXObLBLovgSM/0bC+WChTfGyKiUXfTLFVtkj3JeevaunAtKqR9a6XefnK
 zin0WnDOFi+gz89JOgLuRe2TjMRn8mMd9Wc0wL4Yf+ihwhQNu+KPG4Kq5i8fvvgknh3e
 8a7gqn1D1EO++lCXPb7l6rcM7SoDmWmFwQhVlX7UHBabIuxGLKrXRZP1756dP2D2Nsfe
 IRd8g1DnTHf04mbYJDQt1n4HfyBBt5T1LpNXwhFOG8AH92V3xOOhbX+gSQQbzOQDX9tP
 Mu3/tLHc5XAoCsV4jhEJYrQuAGWtiJ9eXDEcCjVvXv5a2WLmcyTxBDaiAUP9aspcNoYr
 hmkg==
X-Gm-Message-State: ACgBeo0W+SRxEy2i0nl2eyDNwrdrabpRPirVOcTCP6P1zIaEidKLnoR4
 DS5mKko7RrqB4wUVW25YsLs=
X-Google-Smtp-Source: AA6agR7pAMSWL1n/638qdO1lxqloqjisDk1HkpPCyJeZIn35O3Uvx1FjH0BRNAugQBk352snoSZZ1Q==
X-Received: by 2002:a17:902:8d95:b0:172:e11e:65da with SMTP id
 v21-20020a1709028d9500b00172e11e65damr2698288plo.4.1661083903320; 
 Sun, 21 Aug 2022 05:11:43 -0700 (PDT)
Received: from localhost ([36.112.204.208]) by smtp.gmail.com with ESMTPSA id
 g2-20020a632002000000b0042988a04bfdsm5602411pgg.9.2022.08.21.05.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 05:11:42 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: dvyukov@google.com
Subject: [PATCH] fs: fix WARNING in mark_buffer_dirty (4)
Date: Sun, 21 Aug 2022 20:10:39 +0800
Message-Id: <20220821121038.3527-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CACT4Y+bUtBuhD7_BAN+NavEfhBNOavqF0CJkrZ+Gc4pYeLiy+g@mail.gmail.com>
References: <CACT4Y+bUtBuhD7_BAN+NavEfhBNOavqF0CJkrZ+Gc4pYeLiy+g@mail.gmail.com>
MIME-Version: 1.0
Cc: paskripkin@gmail.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, willy@infradead.org, syzkaller@googlegroups.com,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 Hawkins Jiawei <yin31149@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+2af3bc9585be7f23f290@syzkaller.appspotmail.com
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

Syzkaller reports bug as follows:
------------[ cut here ]------------
WARNING: CPU: 0 PID: 3684 at fs/buffer.c:1081 mark_buffer_dirty+0x59d/0xa20 fs/buffer.c:1081
[...]
Call Trace:
 <TASK>
 minix_put_super+0x199/0x500 fs/minix/inode.c:49
 generic_shutdown_super+0x14c/0x400 fs/super.c:462
 kill_block_super+0x97/0xf0 fs/super.c:1394
 deactivate_locked_super+0x94/0x160 fs/super.c:332
 deactivate_super+0xad/0xd0 fs/super.c:363
 cleanup_mnt+0x3a2/0x540 fs/namespace.c:1186
 task_work_run+0xdd/0x1a0 kernel/task_work.c:177
 ptrace_notify+0x114/0x140 kernel/signal.c:2353
 ptrace_report_syscall include/linux/ptrace.h:420 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:482 [inline]
 syscall_exit_work kernel/entry/common.c:249 [inline]
 syscall_exit_to_user_mode_prepare+0x129/0x280 kernel/entry/common.c:276
 __syscall_exit_to_user_mode_work kernel/entry/common.c:281 [inline]
 syscall_exit_to_user_mode+0x9/0x50 kernel/entry/common.c:294
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
 [...]
 </TASK>
------------------------------------

During VFS releasing the minix's superblock, kernel will calls
sync_filesystem() to write out and wait upon all dirty data
associated with this superblock.

Yet the problem is that this write may fail, then kernel will
clear BH_Uptodate flag in superblock's struct buffer_head
in end_buffer_async_write(). When kernel returns from
sync_filesystem() and calls sop->put_super()
(which is minix_put_super()), it will triggers the warning
for struct buffer_head is not uptodate in mark_buffer_dirty().

This patch solves it by handling sync_filesystem() write error
in minix_put_super(), before calling mark_buffer_dirty()

Reported-and-tested-by: syzbot+2af3bc9585be7f23f290@syzkaller.appspotmail.com
Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
---
 fs/minix/inode.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/minix/inode.c b/fs/minix/inode.c
index da8bdd1712a7..8e9a8057dcfe 100644
--- a/fs/minix/inode.c
+++ b/fs/minix/inode.c
@@ -42,17 +42,27 @@ static void minix_put_super(struct super_block *sb)
 {
 	int i;
 	struct minix_sb_info *sbi = minix_sb(sb);
+	struct buffer_head *sbh = sbi->s_sbh;
 
 	if (!sb_rdonly(sb)) {
 		if (sbi->s_version != MINIX_V3)	 /* s_state is now out from V3 sb */
 			sbi->s_ms->s_state = sbi->s_mount_state;
-		mark_buffer_dirty(sbi->s_sbh);
+
+		lock_buffer(sbh);
+		if (buffer_write_io_error(sbh)) {
+			clear_buffer_write_io_error(sbh);
+			set_buffer_uptodate(sbh);
+			printk("MINIX-fs warning: superblock detected "
+			       "previous I/O error\n");
+		}
+		mark_buffer_dirty(sbh);
+		unlock_buffer(sbh);
 	}
 	for (i = 0; i < sbi->s_imap_blocks; i++)
 		brelse(sbi->s_imap[i]);
 	for (i = 0; i < sbi->s_zmap_blocks; i++)
 		brelse(sbi->s_zmap[i]);
-	brelse (sbi->s_sbh);
+	brelse (sbh);
 	kfree(sbi->s_imap);
 	sb->s_fs_info = NULL;
 	kfree(sbi);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
