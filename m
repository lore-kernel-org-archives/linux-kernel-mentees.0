Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6B41D7E26
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753609907; cv=none; b=V4xGVSY56BZvT9Qcgl/HfUCNAUMX6A26vwKkcVMlmBMObK0xXmTRoOWZmlF4+cGUjIHGbmTZWFF5auoOmY6ewVHOw5QJSmvw44Tf4ln3XkK9YsUZ6y1RSyMIU3GyD2h7I5ThmVWOiGf53+J5vuBiOm7mOcMK9wB+NbojBvW6eT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753609907; c=relaxed/simple;
	bh=D5ppVq3QqCe7Zf1Zc+MyTGFktyD9Tu0/kwUllmqLIxs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TV61aVnFcIff6lbUv4suBdCOdjOi4N8xykIZh5l2h3YwHWz1mzQHReo9t0EJisnUMDSrDlba8cwvyN6ndXXIx/rNHKd13yMiOD85Ej8kRUpbq8Vvz6UUXrHcw9RVnlavH/PvFtiYzPlos72t5+s48wpNnl0I5sH/MhKSY6oKIlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mR86OwOq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mR86OwOq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235f9ea8d08so32691665ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 02:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753609904; x=1754214704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dskf1rATUBFmCQprzjusof8q2SMFT1316UEra5Cd0Z8=;
        b=mR86OwOqP/diZi7fLq+97/brJKJB+sABI0jrFMZnkj0K+Jey9HgeVanSIx4vjdTVv1
         va/nIgT0l0VrJMg8IIbOEmidZOalT8C1k8p8sQ2h0Wza1NyfG1zvAZ7r1DVvRO6OpTNA
         JvtLwa2VwuSNHpGKwZgz3K7zNI4NLiwzc5ckKtbkZGQ0mnJcP2VAO6/S4mBbdtTDAZLU
         NS9y1SyaW5sIV7LvzMS7H63FNvHUT2+kZcH+EeChmnsOxFMKWsQesGbUFczgTEOKwB76
         AdddWhywQc7La58XZ1a0r8OmA9ABoQSkjnCBlXjZd1cTEnVt6vgEf7ynMl9iIejACL9g
         9xIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753609904; x=1754214704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dskf1rATUBFmCQprzjusof8q2SMFT1316UEra5Cd0Z8=;
        b=PCrlyhNx+Dg6csTDK+ZmpqSj00E9KJH5q0dbBxxYbMA6+nbOGcTxOqHwbFy9l06tlI
         Enwah9jQ5xe2NUc2P4ldQKbFMObb+GyysEN2Hd674lLxvOvSoNVnaZIOnmdNZwqNBPyF
         uKEb7kGxMZQU9MLtiCtyTeCGxf8aU5hsPnSrOMZUnNvjANr9Ky0T7+0Y/CXz5/FZiFjC
         rl2fv2fxG2Od4MXJ4glZL+Gmqxl4w00eUdf0RvIvGr/NcV1FNKXRJzg6zyROBXMswADx
         QcNjrU5FWQDqYidHuvsWJcXDDFSCM0uPj8MXZCnuzpFanj3y1EuzERy03UcVJGBxuQ2k
         xm/w==
X-Forwarded-Encrypted: i=1; AJvYcCUr618LC/OkRtG+M+Yt4eLD4sijBWgj7eMo5r+3JUb2Kq/TKFZ+pI0U2rvOJwY1TqQgMURJw7DujxkyUpAco5XHROPGLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YylMRCtT6P7pWJhFK2Q7ZiDSirdeaThErtF+qYuguIwgVGN0eU2
	6BkKsOePtQuf2Y9PLI4vAZt/PilfkKd7A6t6e1mL2dQSn1OKTw2TEBX66PISwaX6
X-Gm-Gg: ASbGncuiyR4jvBDVUSt5Vl5rYzUhIQW+UwLW0RBZwxCjG6G/54BjJo5eTfJ3gkupH4i
	ndgHo9z+q+UUNeQsGKLQ7fLGipl0UhyDLlUOAc7/ano32FoFaUa+gFnCdgXU2PLsC8ofxUQAYFv
	pqhx4kSuojtVGcoU1T/0xqtVQIyTlpms6Xq9bRdBQWNk1siPSFg579Cxs7XPn1AC0d0upYa2Wn+
	fWM7F3lC4nsFDUb09yPNfG9boiqEk1SPeIhZm9k1kpw/W/IYsxfox1G8lhjaTURZv0eNlryR/Vm
	jGHEGhOJuEzf0cy4iXQnNKUWp80wHnLivO1o+eFhaE1FUNgeNOsfdgeM1V/TpKwGdwj/1rUh3Ez
	iO5Z+3dZTMlYJzV7khre15A==
X-Google-Smtp-Source: AGHT+IGpALJ699LdfAv3Y17ZVtcuGR1LM7zGC1tgkOCExgcr3JVyKpBWA7LQwWxspNNgwhzprbznWA==
X-Received: by 2002:a17:902:cf03:b0:236:6f5f:caaf with SMTP id d9443c01a7336-23fb3031402mr119651315ad.15.1753609903645;
        Sun, 27 Jul 2025 02:51:43 -0700 (PDT)
Received: from pop-os.. ([49.207.200.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fc5a9d25bsm27910545ad.83.2025.07.27.02.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 02:51:43 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: stable@vger.kernel.org
Cc: Dmitry Antipov <dmantipov@yandex.ru>,
	Dave Kleikamp <dave.kleikamp@oracle.com>,
	Dave Kleikamp <shaggy@kernel.org>,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	jfs-discussion@lists.sourceforge.net,
	syzbot+ac2116e48989e84a2893@syzkaller.appspotmail.com,
	Aditya Dutt <duttaditya18@gmail.com>
Subject: [PATCH 6.12.y] jfs: reject on-disk inodes of an unsupported type
Date: Sun, 27 Jul 2025 15:21:11 +0530
Message-Id: <20250727095111.527745-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Antipov <dmantipov@yandex.ru>

[ Upstream commit 8c3f9a70d2d4dd6c640afe294b05c6a0a45434d9 ]

Syzbot has reported the following BUG:

kernel BUG at fs/inode.c:668!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 3 UID: 0 PID: 139 Comm: jfsCommit Not tainted 6.12.0-rc4-syzkaller-00085-g4e46774408d9 #0
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
RIP: 0010:clear_inode+0x168/0x190
Code: 4c 89 f7 e8 ba fe e5 ff e9 61 ff ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 7c c1 4c 89 f7 e8 90 ff e5 ff eb b7
 0b e8 01 5d 7f ff 90 0f 0b e8 f9 5c 7f ff 90 0f 0b e8 f1 5c 7f
RSP: 0018:ffffc900027dfae8 EFLAGS: 00010093
RAX: ffffffff82157a87 RBX: 0000000000000001 RCX: ffff888104d4b980
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc900027dfc90 R08: ffffffff82157977 R09: fffff520004fbf38
R10: dffffc0000000000 R11: fffff520004fbf38 R12: dffffc0000000000
R13: ffff88811315bc00 R14: ffff88811315bda8 R15: ffff88811315bb80
FS:  0000000000000000(0000) GS:ffff888135f00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005565222e0578 CR3: 0000000026ef0000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 ? __die_body+0x5f/0xb0
 ? die+0x9e/0xc0
 ? do_trap+0x15a/0x3a0
 ? clear_inode+0x168/0x190
 ? do_error_trap+0x1dc/0x2c0
 ? clear_inode+0x168/0x190
 ? __pfx_do_error_trap+0x10/0x10
 ? report_bug+0x3cd/0x500
 ? handle_invalid_op+0x34/0x40
 ? clear_inode+0x168/0x190
 ? exc_invalid_op+0x38/0x50
 ? asm_exc_invalid_op+0x1a/0x20
 ? clear_inode+0x57/0x190
 ? clear_inode+0x167/0x190
 ? clear_inode+0x168/0x190
 ? clear_inode+0x167/0x190
 jfs_evict_inode+0xb5/0x440
 ? __pfx_jfs_evict_inode+0x10/0x10
 evict+0x4ea/0x9b0
 ? __pfx_evict+0x10/0x10
 ? iput+0x713/0xa50
 txUpdateMap+0x931/0xb10
 ? __pfx_txUpdateMap+0x10/0x10
 jfs_lazycommit+0x49a/0xb80
 ? _raw_spin_unlock_irqrestore+0x8f/0x140
 ? lockdep_hardirqs_on+0x99/0x150
 ? __pfx_jfs_lazycommit+0x10/0x10
 ? __pfx_default_wake_function+0x10/0x10
 ? __kthread_parkme+0x169/0x1d0
 ? __pfx_jfs_lazycommit+0x10/0x10
 kthread+0x2f2/0x390
 ? __pfx_jfs_lazycommit+0x10/0x10
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x4d/0x80
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>

This happens when 'clear_inode()' makes an attempt to finalize an underlying
JFS inode of unknown type. According to JFS layout description from
https://jfs.sourceforge.net/project/pub/jfslayout.pdf, inode types from 5 to
15 are reserved for future extensions and should not be encountered on a valid
filesystem. So add an extra check for valid inode type in 'copy_from_dinode()'.

Reported-by: syzbot+ac2116e48989e84a2893@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ac2116e48989e84a2893
Fixes: 79ac5a46c5c1 ("jfs_lookup(): don't bother with . or ..")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---

As per: https://lore.kernel.org/all/CAODzB9roW_ObEa8K8kowbfQ4bL3w4R78v2b_yBU4BQL4bpXrWw@mail.gmail.com/
this commit is not backported to any of the stable kernels (other than
6.15.y)
I will be sending separate emails for 6.6.y, 6.1.y and 5.15.y

 fs/jfs/jfs_imap.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index 8ddc14c56501..ecb8e05b8b84 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -3029,14 +3029,23 @@ static void duplicateIXtree(struct super_block *sb, s64 blkno,
  *
  * RETURN VALUES:
  *	0	- success
- *	-ENOMEM	- insufficient memory
+ *	-EINVAL	- unexpected inode type
  */
 static int copy_from_dinode(struct dinode * dip, struct inode *ip)
 {
 	struct jfs_inode_info *jfs_ip = JFS_IP(ip);
 	struct jfs_sb_info *sbi = JFS_SBI(ip->i_sb);
+	int fileset = le32_to_cpu(dip->di_fileset);
+
+	switch (fileset) {
+	case AGGR_RESERVED_I: case AGGREGATE_I: case BMAP_I:
+	case LOG_I: case BADBLOCK_I: case FILESYSTEM_I:
+		break;
+	default:
+		return -EINVAL;
+	}
 
-	jfs_ip->fileset = le32_to_cpu(dip->di_fileset);
+	jfs_ip->fileset = fileset;
 	jfs_ip->mode2 = le32_to_cpu(dip->di_mode);
 	jfs_set_inode_flags(ip);
 
-- 
2.34.1

