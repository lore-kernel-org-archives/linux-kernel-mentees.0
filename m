Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DE11D7995
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753610228; cv=none; b=busL5TZCXtNynHHp4GzWrbK8foYxlGZM75Lj3tRSncbbCQArERbCXIWugsej8/OGcGyu50aWR7wv2EYl7IGgRVBhFAwgPrm3K3y3X1iF3o69o3XvG7oNyANjGZDb2Ntd9FDJhSwCXjJskVradH2C+Zb+XIkstgrd2hueIGrTpu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753610228; c=relaxed/simple;
	bh=CD/l3tUdwzeZKZupi/sYgTC59oQJFaZAsMCYQNYsVRE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PooMoJFJ5j6KsyLOEO6fm8gtMh8tKirl0wKENAiYSDJElNtsuOzxGOawdEF2lJq1zVbzuRKSAAPI7xF/Ga/szZG4vTtaTL2foxWVd1ar5HykwmQdWAbrLOF5lAlxAyDPj2kQ76kjbUXMclFO7Glgd9YMexQqdsFDT77Kk8a1fxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjryJRcY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjryJRcY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2402774851fso15145ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 02:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753610226; x=1754215026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=muUtX0lSh6gtM3PBB5xVgiDhmrdOkyfI1XoOF1+/laI=;
        b=DjryJRcYn8pE4K3RjZbFkPV/ViHfcPZUcX6ntPxqX2YIox7juPufXDmvrvWlz+tSSE
         0mwv2TprsvBRHOGrVEXo1sM6D3LwqSYmsM0V7sPGREv4gAwj9BoQY25W95TQa+VbwkXv
         LV/nLffgLlvZVVDMRhlaFxTucl8dZ+DFyQzCvU/muPLtf7r6WB+EmUi57H9lQl+viep6
         Uj+JTW3/zN4D7H5zhWPm4fywU53j4s2J24EeMk8voxXRUgWCJWB8pPML414N9FjScJ1e
         YFVk96zbkuspaMhmm5l4+QCN9A/x3ycVoPkNeyYqFXY4vsZgLk3fJ1P07Uhmvv4Y6Vwk
         auqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753610226; x=1754215026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muUtX0lSh6gtM3PBB5xVgiDhmrdOkyfI1XoOF1+/laI=;
        b=vLwBkR3dV4U2rdZbLf8xD6aAvVGUJ/pVjlKg8AUt6zRnxB6kYrZi3OUvjEaltoJthQ
         pFKw3TWZAy91c22Dfy0Qb911xTmoJgUMNJJaikSqbN45+v3Lv6wgGPjX8QSBQYOjyw5U
         vaQ/6GHtoZSKFKFKZxsEc6O3jO15jXINLkRV62g6ENKRXUYGdYVz/AVOCfQ0DnZFGKo4
         5Qg9vZ8qDFRG/gdIgx8lYDYN2/ift1r4EUiPlFf0fntvARnDsVebopw9bZrC6RvhNuuL
         iS82cyNhpeJdrsyoqIX/D1hcTRVqu1oGRXjweAEu1/FncHSeq2niQWk48hbp3jm9XfmN
         ZIPg==
X-Forwarded-Encrypted: i=1; AJvYcCUPRRBpxjA+XgfROIW0I0VFpVKxTulydNbl+cDs4zw2bGwlx1cZkA50OeY1dPPrv6fyI9HHgjGxe6LP2hYYPxg9f2q/pA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1MWVFGuc1wYbi15Mx+hMKbOTSr/i/ZQ9BZ2VulpoqrNFHiU6R
	GpzrRIaDeujY53g9TjTPOa6StRNdGDtv6uEgG+glx5KWtca49ksFugrC
X-Gm-Gg: ASbGncvz1FburhwvWse4+X/42TSd6LrGZC1WY+A5BuKHwv0vg5snZSXDQhhQfxIrN+0
	Eou5cboBJ1N/fsbysA2AwH2bHTCmrUPgBvZZB5O2s0dVSdRQC5AlAcs/a1GI3CTJnIkt0EmM3RC
	jVtmLVZLH+VsoEpzo8BEHlfrtgQTmC6xoAUTYXr5iv7wJtm8Ch0YoqAGlbBjUWYXcR6/cehAX8X
	xTsvEiIoaWVSwHlo/F7ltEft9TUklp1EeKJCgDnqJCZr4UNbFqM6oR28m1VManDE+4Qq+5bsLFD
	V2D2gb12vRbkiLi1SbW5qpFLh9wTU2aPD4BrEddISJ7BuCMmz6XDpIbABSTY7Qu/VfbOPuJJ8iY
	nxSvswN/E9Fcx/gEXdusS/Q==
X-Google-Smtp-Source: AGHT+IHQG3kLtkocztWO0RATICIWOPiyz9ICOWjSNS+zDpM7I3jFhyHHPhD6/+UKe1O9Fox824bOaw==
X-Received: by 2002:a17:903:230c:b0:240:96a:b81d with SMTP id d9443c01a7336-240096abbc8mr20897525ad.5.1753610225956;
        Sun, 27 Jul 2025 02:57:05 -0700 (PDT)
Received: from pop-os.. ([49.207.200.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2400ac15a9fsm7292685ad.93.2025.07.27.02.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 02:57:05 -0700 (PDT)
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
Subject: [PATCH 6.6.y] jfs: reject on-disk inodes of an unsupported type
Date: Sun, 27 Jul 2025 15:26:45 +0530
Message-Id: <20250727095645.530309-1-duttaditya18@gmail.com>
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
this commit is not backported to any of the stable kernels (other than 6.15.y)
I have already sent an email for 6.12.y: https://lore.kernel.org/stable/20250727095111.527745-1-duttaditya18@gmail.com/
I will be sending separate emails for 6.1.y and 5.15.y

 fs/jfs/jfs_imap.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index 9a6d504228e7..35f3144d703b 100644
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

