Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6282E19D06B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 13:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721915614; cv=none; b=ErT78bi+vNTYe/+EGGLW3wkjpw+DR/qq1j4RUqzcMdE4fI1WZWMJDdPCpABokLDZuxgyP3RdB7wnY5LYcEqR2idduU5B+NfBDjUmH4LjUhHCFaah7ELuatUocT4obxNVsg9qWbaial44MULKfDu7ZFgxWDrkYqWlno7NeiXsQ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721915614; c=relaxed/simple;
	bh=3DptWcwLjh9g8zYQkDpmU927nteARjkuZE/FKXChKm8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=D0U0jnkOK3g5M3miRPqGt6qvBDGBgLcQEDLm0z2R3J2pRuBmWIk4bjbadEnPoVdiZXLQpLLahdO9QOf7XO9Pq2RjX9/yP8OqdGqIvovbyQAvu8WEw2Wal+3lj6yUQB0A6sD8WNtvsigrgb7gmy4GuxW/mVSrytfCccXjNC8FgLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVw0ouLo; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVw0ouLo"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0657981E40
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 13:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cvayiGKuVhm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jul 2024 13:53:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00A1580BD9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00A1580BD9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gVw0ouLo
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 00A1580BD9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 13:53:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4266dc7591fso7159005e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 06:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721915608; x=1722520408; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dab5/E/NnHy054SxC+iMfAJWhgRYTq8/+i+ln2dGsjE=;
        b=gVw0ouLoLgGxbfcqQUUrQiG860KdMDrGIi+a7rzz8KWPvp3xrqeRBrNKbVEXRUW8MN
         WIXE313jDk4QHkSw/8sXdiaYZLPymcaMjheHBEi6pUNhHpFcFzxjO/GxJ/C9B2oRBD5S
         nPxz3Dexib+Y+5d/JQ9TDEj3aj62a9r37RI52UObxkxtIw2KgPLZ0Z1r0LxBDB8IXLku
         PJJ6gJUlv1eoi2wjrzs0o1ypUsFmkmxWxTAbw0q6Kd0+E9UDbg7n5TnVczzTDTn5aAJs
         d6BdwLghKl2bgbDmCl2aBORFhFDZfQuvKH5+dBTV4PT9dH+W8Wpa/9qebZNMuT5Awfm9
         r2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721915608; x=1722520408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dab5/E/NnHy054SxC+iMfAJWhgRYTq8/+i+ln2dGsjE=;
        b=wyvV0nUWygGjdqtGuYDJGYpOH3uF4dslrQ3q7uzafFKGQSRHT/+QrjoJiBS9lclqXM
         niZOgHEB4U3HBA3rJfFG3gct6kxStVmVT/reCamiLPbvnesj5QIztJbiTkzHZq6++sy3
         ethwfiSdNBxLE9y92yka/nBVLEjrixA6beV6desfWfX/qitJzaNfx2nkCGLngndri4Ue
         TyZPNJo9z0NXrr5oeU8Fm0fxeGmcU5FT//ObyT1Wj9q24HJ9Qq//YfKOrchVYY9Cfp7n
         NkG81r5qNOmy6SrxoEvOapUhBojsgkPTQKsr5yIo2Nj0AHUMtpSCdxgQ3p9RYhTA/rHX
         cvbg==
X-Gm-Message-State: AOJu0YwBz0MEqUO4rk7W+KfLfLDUjPR8xJE4sUCvAVkNF84ggRfXq1F0
	ae6iszw/8o+tMT+w0ZmM93j68YIGnQwLDgXntso0W/5RdWiWGmF3
X-Google-Smtp-Source: AGHT+IHzz8LAg/s+R1f5EuJfRWlCMZSCRRkZpdHPCkcQgZoUg3S21f/crO6UqpXKM6CHObn42fUOWw==
X-Received: by 2002:adf:f38c:0:b0:367:9803:bfe7 with SMTP id ffacd0b85a97d-36b367b1d98mr1670746f8f.53.1721915607770;
        Thu, 25 Jul 2024 06:53:27 -0700 (PDT)
Received: from laptop.home (83.50.134.37.dynamic.jazztel.es. [37.134.50.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280574b2c2sm35909005e9.28.2024.07.25.06.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 06:53:27 -0700 (PDT)
From: =?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
To: stable@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Jan Kara <jack@suse.cz>,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>,
	syzbot+600a32676df180ebc4af@syzkaller.appspotmail.com
Subject: [PATCH 6.1.y] udf: Convert udf_mkdir() to new directory iteration code
Date: Thu, 25 Jul 2024 15:53:13 +0200
Message-Id: <20240725135313.155137-1-sergio.collado@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jan Kara <jack@suse.cz>

[ Upstream commit 00bce6f792caccefa73daeaf9bde82d24d50037f ]

Convert udf_mkdir() to new directory iteration code.

Signed-off-by: Jan Kara <jack@suse.cz>
(cherry picked from commit 00bce6f792caccefa73daeaf9bde82d24d50037f)
Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
Reported-by: syzbot+600a32676df180ebc4af@syzkaller.appspotmail.com
---
 fs/udf/namei.c | 48 +++++++++++++++++++++---------------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/fs/udf/namei.c b/fs/udf/namei.c
index 7c95c549dd64..a33e6d762716 100644
--- a/fs/udf/namei.c
+++ b/fs/udf/namei.c
@@ -665,8 +665,7 @@ static int udf_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
 		     struct dentry *dentry, umode_t mode)
 {
 	struct inode *inode;
-	struct udf_fileident_bh fibh;
-	struct fileIdentDesc cfi, *fi;
+	struct udf_fileident_iter iter;
 	int err;
 	struct udf_inode_info *dinfo = UDF_I(dir);
 	struct udf_inode_info *iinfo;
@@ -678,47 +677,42 @@ static int udf_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
 	iinfo = UDF_I(inode);
 	inode->i_op = &udf_dir_inode_operations;
 	inode->i_fop = &udf_dir_operations;
-	fi = udf_add_entry(inode, NULL, &fibh, &cfi, &err);
-	if (!fi) {
-		inode_dec_link_count(inode);
+	err = udf_fiiter_add_entry(inode, NULL, &iter);
+	if (err) {
+		clear_nlink(inode);
 		discard_new_inode(inode);
-		goto out;
+		return err;
 	}
 	set_nlink(inode, 2);
-	cfi.icb.extLength = cpu_to_le32(inode->i_sb->s_blocksize);
-	cfi.icb.extLocation = cpu_to_lelb(dinfo->i_location);
-	*(__le32 *)((struct allocDescImpUse *)cfi.icb.impUse)->impUse =
+	iter.fi.icb.extLength = cpu_to_le32(inode->i_sb->s_blocksize);
+	iter.fi.icb.extLocation = cpu_to_lelb(dinfo->i_location);
+	*(__le32 *)((struct allocDescImpUse *)iter.fi.icb.impUse)->impUse =
 		cpu_to_le32(dinfo->i_unique & 0x00000000FFFFFFFFUL);
-	cfi.fileCharacteristics =
+	iter.fi.fileCharacteristics =
 			FID_FILE_CHAR_DIRECTORY | FID_FILE_CHAR_PARENT;
-	udf_write_fi(inode, &cfi, fi, &fibh, NULL, NULL);
-	brelse(fibh.sbh);
+	udf_fiiter_write_fi(&iter, NULL);
+	udf_fiiter_release(&iter);
 	mark_inode_dirty(inode);
 
-	fi = udf_add_entry(dir, dentry, &fibh, &cfi, &err);
-	if (!fi) {
+	err = udf_fiiter_add_entry(dir, dentry, &iter);
+	if (err) {
 		clear_nlink(inode);
-		mark_inode_dirty(inode);
 		discard_new_inode(inode);
-		goto out;
+		return err;
 	}
-	cfi.icb.extLength = cpu_to_le32(inode->i_sb->s_blocksize);
-	cfi.icb.extLocation = cpu_to_lelb(iinfo->i_location);
-	*(__le32 *)((struct allocDescImpUse *)cfi.icb.impUse)->impUse =
+	iter.fi.icb.extLength = cpu_to_le32(inode->i_sb->s_blocksize);
+	iter.fi.icb.extLocation = cpu_to_lelb(iinfo->i_location);
+	*(__le32 *)((struct allocDescImpUse *)iter.fi.icb.impUse)->impUse =
 		cpu_to_le32(iinfo->i_unique & 0x00000000FFFFFFFFUL);
-	cfi.fileCharacteristics |= FID_FILE_CHAR_DIRECTORY;
-	udf_write_fi(dir, &cfi, fi, &fibh, NULL, NULL);
+	iter.fi.fileCharacteristics |= FID_FILE_CHAR_DIRECTORY;
+	udf_fiiter_write_fi(&iter, NULL);
+	udf_fiiter_release(&iter);
 	inc_nlink(dir);
 	dir->i_ctime = dir->i_mtime = current_time(dir);
 	mark_inode_dirty(dir);
 	d_instantiate_new(dentry, inode);
-	if (fibh.sbh != fibh.ebh)
-		brelse(fibh.ebh);
-	brelse(fibh.sbh);
-	err = 0;
 
-out:
-	return err;
+	return 0;
 }
 
 static int empty_dir(struct inode *dir)
-- 
2.39.2

