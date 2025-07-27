Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155952B9BA
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753610742; cv=none; b=Hl5rRJ4WutTLsWRkAhLL6FLx+cDEkQRclHMYL0Gpme9FXlyrACfHy6Cq3rte+2ML+P8djUt7LwUC4YZtStbNsAQud0DwpuksYD22JcOE29i2M6cr/y4hNbFlMQz4azoOjS/QLzaXFJNNa3DTH2scQ4sXfri6PEoc4mj33lFQa74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753610742; c=relaxed/simple;
	bh=wBkZLDu/G6qbAxr1715WKt7sJ8lAdpiG53DxnMPGhTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GlZ4YPrAfPtYc5kl4uo5l5Saxl/FVeDuqJDbJHWHn22zg2mu5PTD/OLFXja5buXVlB6OuyZRizc9otEqKTH5Wr0+AQVKqF+8nJPifbzBKIxXDXiUJ7MBd7fpPQ4A1cqoNCfuEjJFQ6YjAj9XdB1oQbdovHdMdYt7zTk+Xpp/MSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3BTWXfq; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3BTWXfq"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234bfe37cccso28748515ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 03:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753610740; x=1754215540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jSF11apyEe+KNEyiRx0PBYiRle5FXT7umj3tWpgCquo=;
        b=R3BTWXfqhekVzjj1XNiN6/Iv7tDLYXAiHDrMwChF+zRNlHGPPU2vviKE3tkvGATmzx
         36zIQ9MRWTxiC5geuh0IiJDOejNgyUxQNSJXBNDPSTXdRD+aE3zf6eQtRwc17gv30/Z3
         c3sOQCGeYKQ28tZMeWAhG2BW43LfKEWXlsjSAbIkzZRjiidvnurYi/ld1DYLokM1Urq1
         4hKMUXghcc6+9KEpNgcEobEJ6aw5Nl2ybZqADD+RYLPLxHxueXWQMv5RCadjtZTQOdX9
         slqwYdJra6Bd5PePuh/254pSPK5F5sgTphGPW4CVgzt8ujh0npk5Mny9jahlAD1v1dv8
         Rcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753610740; x=1754215540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSF11apyEe+KNEyiRx0PBYiRle5FXT7umj3tWpgCquo=;
        b=LpEXDIwbjMrU1gqZztccInOUys+PQWOYpGNJZNZBvb32oMyi5G8r/rRLpsLXQ2aFgV
         3XhICllEz+KAy1R3WopgO2WKhfpyAau4aX9d2o/vT/pWqrxt3gwxbA5oFBIZSbZd0i94
         V4PEBQz7R7LqqAo+Ry+lYI+H4Vka274KveZrFsYh027K53qieEeCjxV/paWzub2Qaj5l
         5mH9YZSAZ3vs2s83iSc3D5ftu0gjimnDhU5g170gg4Ct8Du9+VeUCLt9f4AVqDFPsYhx
         6wbsFDuzecLV74Pe5qrI39GNFLAtxyz1PAxrDBUoOz8rQ3YtT/b3D2RLLY1hJEK8v6lD
         DqkA==
X-Forwarded-Encrypted: i=1; AJvYcCV5FLKXEuVTQ9wquz+EL0LbrxqCAUhX1TPGshaoK8y0aviIsEm5scr1yi6VKk2txjktOPgln2u4h4kwd3BcMd2/nzpvOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYRlKnGExDn0m2H1hNKCAJwkSonyg6DwPzEK9qWLdKFkg0Dniu
	v5Ae5vMzMIzksee//x0FbB07tsj2NwETBeGqTFWW2lInCWlEQrUL0Vg5
X-Gm-Gg: ASbGnctqdM5RLv0BSaUG6bcr4frQGfzjHVCzV0XSQ7Jv+GYxZZurMxd1L9h3dZUBCvO
	cFc3M9HDvPCH2xwy/VgznDPj1lLhbU6CVkohA1adHLVu5d/tQsCIJR/6fc1N7Jm8sHXPY5fc67d
	UamWd8jTyuZUrBRRXt0H6nhfz58VL0B2kUj2cmmm0X6Gbr2r4PLNNlwYCva/H2ovX1rkwTvQlok
	dkAk0LK3oC0j/OMfnaGvfIUz8ud+U+OQiazPwLLxikxbnHQXkhQC8bEOZhvGDnEVWchi087lKaY
	CIOBpj9xq3EekEzqlN1nGmASXveZ7YIHfJ3EgAXh8Xk15fBdUdAgNKQb52OkcKEbReI+LKL7ZYv
	JPHNzEml4W+xBQ7eR1UqUYg==
X-Google-Smtp-Source: AGHT+IE7fwjOlMqysw1kUYwTQS+rMOFcFJdoQEMQP3a7R9KFNv2nMe5s17veMXMI8hqms5vKKB14Nw==
X-Received: by 2002:a17:903:1893:b0:23f:d861:bd4b with SMTP id d9443c01a7336-23fd861bfcemr41869385ad.5.1753610740143;
        Sun, 27 Jul 2025 03:05:40 -0700 (PDT)
Received: from pop-os.. ([49.207.200.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24007d9a31bsm9794715ad.103.2025.07.27.03.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 03:05:39 -0700 (PDT)
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
Subject: [PATCH 5.15.y] jfs: reject on-disk inodes of an unsupported type
Date: Sun, 27 Jul 2025 15:35:31 +0530
Message-Id: <20250727100531.533179-1-duttaditya18@gmail.com>
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
I have already sent an email for:
  6.12.y: https://lore.kernel.org/stable/20250727095111.527745-1-duttaditya18@gmail.com/
  6.6.y: https://lore.kernel.org/stable/20250727095645.530309-1-duttaditya18@gmail.com/
  6.1.y: https://lore.kernel.org/stable/20250727100255.532093-1-duttaditya18@gmail.com/

 fs/jfs/jfs_imap.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index 9adb29e7862c..1f2e452a7676 100644
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

