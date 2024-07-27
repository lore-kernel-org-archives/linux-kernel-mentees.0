Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A57469D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 04:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722055946; cv=none; b=DLk/VIaxRIFYLdh29RkicxkckfeYMCd3bRt1tz6V+D3kJrCRfSGeW0b1pho63sDqsbAuyPgat6euHmKDBuOzqgnnujKqxaJxa9FPgYEX6SgPjDnF0HY+2JuyY1lew2IOD9Zn7/iVlF6tFjUEGUg34U0GMAe7WmGgEn/oR9AaqBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722055946; c=relaxed/simple;
	bh=qMNOwDqEPPp+DgBQrDwQ0cNff5CQVtBnR1nVvvin7hU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CBV4D6s1n5UOC0NDv4EQ9uBPCh5MR+KFDxEXaHnityA9webM5NNjeuNz/jhhDAGhDWMJEZaG9J+E/Hed2RvYL22qoNjliOCOh8MqB/MVRO3BG39R45wXjrI3TJxSk2eE5y7QgtkFXWGsQrINtiod96qjoLyH2yHDzyRc1tOv60U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGM1Kq3o; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGM1Kq3o"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF4F360605
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 04:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gL9n0CqYmN34 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jul 2024 04:52:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DAB0D605F0
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAB0D605F0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DGM1Kq3o
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DAB0D605F0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 04:52:23 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3db19caec60so1165462b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jul 2024 21:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722055942; x=1722660742; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=74pqFZ6GJTA74j5wcorWmd+opIrR6vm3cHYvIXlwIV8=;
        b=DGM1Kq3o0XfXTkUHd5drRdCAC7pyfQLHVtYgAgUjlxViPfihr3KiIOhHPa5m4SGwP3
         SNkvlQeeUH1vOP3Z8ktConFzMgRDnCce/enKj4cLe/oXgyK8Ol3Fj6GQpLrjXEqEP4Ol
         erhpO+S4wAs2fhk/LyUYAlYeBF0QMb34ZTJlb+hYtcljQr4XIa65tcn/U7az669ZjC/g
         9AgVILwwTioO5Q6784vq445XTX7vITPegoxRKPNfzXoaeOTofC1imJspt1aOY9vr/9Gw
         iDuLv7n+eXbWFi/c6DZvhRy/sq9ooE2qYOPjPdd2x+dsjSw1hyAMtL/qm27ltywNKNse
         xioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722055942; x=1722660742;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=74pqFZ6GJTA74j5wcorWmd+opIrR6vm3cHYvIXlwIV8=;
        b=eXCU/kyjudlwx5N+3HvDbQeN1CZmMb96u0JnF3iFzoKfwP5cU3UfQsU714mUK7GV/U
         5EcbIfc8XzoQYzBeRR8pH0mqeVso6Hl0pwlWyp1OEW1F1XRWIKFNB9zCgTq+4JsPUDPS
         asSpqKdiobssGTWfPBbaKd1eXs4wospno7Ff5Zn5gVIR/9R6XVaBA9RFueHEu+Vd7VTa
         V0Xi6CgmOYQLsTLbiBACwrLJyirgDY5fEcZbca161O/taEOuFrN2EzGzga/lFwxRuxos
         xIxXRXPsRUoWB1GFiBvuG48MnqbZeY+4LW2rB3+H5faLtsXNuH4jyD97aTGMCeQH2kh/
         zx/w==
X-Gm-Message-State: AOJu0Yw/LNDBUsm1dkRU2gCEBF4zwg4wnwS9uFWFjKKseiVcxs4NBDpL
	dwCv9K9dMWOJhy6nKHTvquTJyBllpuyOQK4gzdsmUwnUCiwsoDMj
X-Google-Smtp-Source: AGHT+IEdVjPjAV6ZoMGnQBSHE1FnwwxNe1Iihz1TQMIToInKloGXWcVp+WDSIz/TTbJjEeE5np5vmQ==
X-Received: by 2002:a05:6871:b2c:b0:260:fd20:a885 with SMTP id 586e51a60fabf-267d4de4083mr2266034fac.27.1722055942462;
        Fri, 26 Jul 2024 21:52:22 -0700 (PDT)
Received: from BiscuitBobby.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f9ec424csm3079710a12.59.2024.07.26.21.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 21:52:22 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Siddharth Menon <simeddon@gmail.com>
Subject: hfsplus: Initialize directory subfolders in hfsplus_mknod
Date: Sat, 27 Jul 2024 10:21:29 +0530
Message-Id: <20240727045127.54746-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Author:     Siddharth Menon <simeddon@gmail.com>
AuthorDate: Sat Jul 20 01:39:01 2024 +0530
Commit:     c20838f5588517990bbb54069e93aca19672fbe5
CommitDate: Sat Jul 27 10:14:28 2024 +0530
Content-Transfer-Encoding: 8bit

    hfsplus: Initialize directory subfolders in hfsplus_mknod
    
    Addresses uninitialized subfolders attribute being used in `hfsplus_subfolders_inc` and `hfsplus_subfolders_dec`.
    
    Fixes: https://syzkaller.appspot.com/bug?extid=fdedff847a0e5e84c39f
    Reported-by: syzbot+fdedff847a0e5e84c39f@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/x/report.txt?x=16efda06680000

Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 fs/hfsplus/btree.c | 1 +
 fs/hfsplus/dir.c   | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
index 9e1732a2b92a..13d2e90cb9b1 100644
--- a/fs/hfsplus/btree.c
+++ b/fs/hfsplus/btree.c
@@ -363,6 +363,7 @@ int hfs_bmap_reserve(struct hfs_btree *tree, int rsvd_nodes)
 				HFSPLUS_SB(tree->sb)->alloc_blksz_shift;
 		hip->fs_blocks =
 			hip->alloc_blocks << HFSPLUS_SB(tree->sb)->fs_shift;
+		hip->subfolders = 0;
 		inode_set_bytes(inode, inode->i_size);
 		count = inode->i_size >> tree->node_size_shift;
 		tree->free_nodes += count - tree->node_count;
diff --git a/fs/hfsplus/dir.c b/fs/hfsplus/dir.c
index f5c4b3e31a1c..a4eb287e3d4b 100644
--- a/fs/hfsplus/dir.c
+++ b/fs/hfsplus/dir.c
@@ -485,11 +485,14 @@ static int hfsplus_mknod(struct mnt_idmap *idmap, struct inode *dir,
 
 	mutex_lock(&sbi->vh_mutex);
 	inode = hfsplus_new_inode(dir->i_sb, dir, mode);
+	if (test_bit(HFSPLUS_SB_HFSX, &sbi->flags))
+		HFSPLUS_I(dir)->subfolders = 0;
+
 	if (!inode)
 		goto out;
 
-	if (S_ISBLK(mode) || S_ISCHR(mode) || S_ISFIFO(mode) || S_ISSOCK(mode))
-		init_special_inode(inode, mode, rdev);
+	if (S_ISBLK(mode) || S_ISCHR(mode) || S_ISFIFO(mode) || S_ISSOCK(mode)){
+		init_special_inode(inode, mode, rdev);}
 
 	res = hfsplus_create_cat(inode->i_ino, dir, &dentry->d_name, inode);
 	if (res)
-- 
2.39.2

