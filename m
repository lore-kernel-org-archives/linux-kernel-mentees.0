Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0FC537E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 13:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759499264; cv=none; b=Sz2Pb2BCjMYvhvU44EFs9tz1G1dhYdpUwd3si1IsTOCeVtgJBEsA78ldCGnRBjsKaJ14oDIC1LWu0ooCHwh/Rvpky+uVXXibB9gVNHXe9jTM2PUmyDwvTD9VQXJn9eXSys+RMcrCNIwTrofV0o1TH64Kr3RVMYBZgPQakI30W/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759499264; c=relaxed/simple;
	bh=B83U5Fb924a+CtxXo1Lus3OG+QNUvJeFsmwJTwagFxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qiel2NZ7jLqwRA3I8pQPY5oHWn7VPJMbiRaok1dsmAoL7ABpOfwcYKloznoxWyzGD7dMf6y96tsVGZNPBra/xVze+Igtl2P/XclV9s/5MT6Dl5PLGOEANzL6SyTW4d2Ug84w9nDgn8Mw7T+DamgBfctCOviOP1gXbGNTn5z2/zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bx5Iuc8x; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bx5Iuc8x"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48EB5611D5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 13:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qt6fHPFn4ENy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Oct 2025 13:47:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 379AC610FE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 379AC610FE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bx5Iuc8x
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 379AC610FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 13:47:42 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-62fc28843ecso3378489a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 03 Oct 2025 06:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759499260; x=1760104060; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXz1taGyCnsjIOklnSCeHrVpWlskjbKzfy7PmtERQsU=;
        b=bx5Iuc8xUtqu79S+/ed/Y4hXQd1wrUz06jGGPO0evz2XvFcdUgQq//F4FGTebaAShh
         zsWBPL4AEmc+PCnbazJ8N9LInclrAJS78nyIm4dV7uIpCwr8lPvXvEdEOzvztm9YNKQ5
         EDhgX+jJy/m/yHE9DW7FJrrNVv0RNy4QdsQrafMQ8Uikz9/4NB+RgwMNLOFowCMwW9+o
         n/YQ2yOTp2iq2ldVzHjkjfWPrOs/Zsz+bxVDrrsb/O3OzzA25/hWYW2M+jBlWt6ZreZU
         g12t/rhtDSqIgRuQ37VenEyXZsIW8dQhjF2wYLtrkOzSDDDZSbz4r23vD5RjK4qfEooA
         UxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759499260; x=1760104060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXz1taGyCnsjIOklnSCeHrVpWlskjbKzfy7PmtERQsU=;
        b=K7+0cOFh3bcRypI0ATEvzKUQIBRAiiCb41v6gfDUBSCNoBTBsJaj7iZvvr/uAC2ssW
         0nysPew8Zg0MrqwxMXH8akcvwDNGFe+/WP05PFF9PRz5HtAFj+veqCFTlf+KxVB+6Etx
         HNkOF0GpRuaEegU3BXIoK5+xSaPEp4dqtQur8b78b+r+LCqUCzCiCiAYGKU84kgMcUst
         NNu/kS4BGcdpJKZ888ZGEyNG9Wjtwwzvr0SWyIt6+t3mgombOcHEdBDu6RTfeMCXBAFF
         zt/ZeZtxoFvVueCb1K09i3uU/jTPTAO9k5t1Ici2MVtqQTneGM024zSddfvRjUXyNosq
         JURQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXNG2nW8MUBC3P4mQgv8YkIZMLcGqc92np1XXINUYa39yks3gededcED6RVF0szx+vZ+s+F+gZ1T+ww/2YU9ni+9Go+A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyMqsTnsjAsU4QLhcAQqymgdMKqvxInJBHid3IZfJ1F6TcshrKS
	BYffCunmmCGTUPa70wTTWlj7WUbRbi9FYPeBJP9jeZccUz+o+qtIEF7l
X-Gm-Gg: ASbGncuIFfT7VjBmvHQIY7cIb7Xecc805HnjRw+gGg/qZ797aKC3usVJRvdmpWFkXxr
	9mjp5WaZpOB0eZDgpaY+8wxA4gh8sQaHJ4LevH206CINd8KNUaFR9wjMkRFZbQFZ3u9vbIm9Uwl
	6mlV5w/RKUP5i1Lj1+Gk942QE1huAFaGFiB6ZeXml+UByw5XUF+fulI61MehZ5Tj1l5F1IfdnRD
	RslUlVB5vyLpuS0Fya/1ZHwAOMG6S/YNL0HO1esKveGpPL8TT8g51b7DU8Vtr2dwvOB7YAoslPE
	nya0kVMcEKj1//huEBbf2NorfHvR5VXfPRBq5lNYiav1h9dK8G5+S/W1LgO46sIPdkZVBsalSj/
	q53OFF8U8qBnRYZ4jV4fvMaa59MKRDLJ1YP2mMsNViiLRcy/tR5P0dr6JNnIGQi59tOa5CeYXEA
	hDhx66QPJyRPG+7A==
X-Google-Smtp-Source: AGHT+IGT22rMOS7zpkVXCQktJ+CXsz5d60nlco16amfiTaRrE8PNlBBx+BmcaTn1+GNMGJdxBxc5Uw==
X-Received: by 2002:a05:6402:5250:b0:62f:2afa:60e6 with SMTP id 4fb4d7f45d1cf-639346c8b7dmr3139059a12.7.1759499259990;
        Fri, 03 Oct 2025 06:47:39 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881011e9sm4009560a12.25.2025.10.03.06.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 06:47:39 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	khalid@kernel.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>,
	syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Subject: [PATCH] f2fs: Perform sanity check before unlinking directory inode
Date: Fri,  3 Oct 2025 16:47:31 +0300
Message-ID: <20251003134731.470392-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current i_nlink corruption check does not take into account
directory inodes which have one additional i_nlink for their "." entry.

Add additional check and a common corruption path.

Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index b882771e4699..68b33e8089b0 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 		goto out;
 	}
 
-	if (inode->i_nlink == 0) {
+	if (unlikely(inode->i_nlink == 0)) {
 		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
 			  __func__, inode->i_ino);
-		err = -EFSCORRUPTED;
-		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
-		goto out_iput;
+		goto corrupted;
+	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
+		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
+			  __func__, inode->i_ino);
+		goto corrupted;
 	}
 
 	if (IS_ENCRYPTED(dir) &&
@@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
 				ino, IS_ERR(new) ? PTR_ERR(new) : err);
 	return new;
+corrupted:
+	err = -EFSCORRUPTED;
+	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 out_iput:
 	iput(inode);
 out:
@@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	if (unlikely(inode->i_nlink == 0)) {
 		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
 			  __func__, inode->i_ino);
-		err = -EFSCORRUPTED;
-		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
-		f2fs_folio_put(folio, false);
-		goto fail;
+		goto corrupted;
+	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
+		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
+			  __func__, inode->i_ino);
+		goto corrupted;
 	}
 
 	f2fs_balance_fs(sbi, true);
@@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 
 	if (IS_DIRSYNC(dir))
 		f2fs_sync_fs(sbi->sb, 1);
+
+	goto fail;
+corrupted:
+	err = -EFSCORRUPTED;
+	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
+	f2fs_folio_put(folio, false);
 fail:
 	trace_f2fs_unlink_exit(inode, err);
 	return err;
-- 
2.51.0

