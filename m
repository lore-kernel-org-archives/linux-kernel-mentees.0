Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAB62BFC7B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  1 Nov 2025 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762001830; cv=none; b=iRwoC0Uv2mNTEqm5Br4GO60tghCgPaZiRcf86scx0S7DXS5p39cMzk8SeS7aEGECz9BSJai65HP45VRsnVbK10ul3vVuQPr5lwy0XhoERuRss7gp3MgypMTkcIM6Egh7ND8qrUAkCzNae6rCtdAm8lHP3YFUwiFYvdaw8qGqobo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762001830; c=relaxed/simple;
	bh=/Mzq3xJjoScnLlS/YQOCszoPa9oiwh8nNoNQlaFG2vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pR27UHLS0DNlJd0X5S8TStgQl3WfSHMOHruzqWx4EpsSHZEuOnXIl4AH7TSTwkSB4bPdbFNVRtS7aNj5ZuOsXAd5AzK1g8f76P3uXui1PLFJD5bIx/OV9zR1R8KDASw8L0s5E8y2KcT+73cPZNqyx/VHwKTLILswws0D9a5VQ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUp2acw/; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUp2acw/"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A40D961C34
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  1 Nov 2025 12:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCMW00IkrwNP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Nov 2025 12:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8B0F61C1C
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B0F61C1C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TUp2acw/
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E8B0F61C1C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  1 Nov 2025 12:57:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-429c2f6a580so1165998f8f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 01 Nov 2025 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762001826; x=1762606626; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=;
        b=TUp2acw/gC6cNUeaUBLeZP++pqRQt24qHLklUGLKayGXnOrW+tfeHvpnzPTQ3DElkw
         6DCr7o20ibRJX5xcJ0Ruv7oDaIDBDs/N9RNLXSnH2Hq+XDDTdGHBEeR1MS+kCEp1lY2f
         5GY9RDi5LJbBQQMccWtTYWiGfNjjK2ZQqY7nxSM6i74ZCVNpYQBE1k8Ufn8kVH2XK2n+
         hb6qfAmzpwWo0dXUax229NlcnPo6LUnxvcM/o9qBeG5P3BtGaDyDdp86EHWuIMG0BtuL
         qole/ljVThKl70ToiUV2ogoEUks+aWQdRRpMj+5OAp+dRYGSaAGi5t7GtvmwYZam76Iq
         aQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762001826; x=1762606626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=;
        b=FXyCt7Oj79eo+kX6IJCMGs6v20BNrNXrD8Tj46oPR92i3YJWyJj88AS9SYTuzlXHin
         4Ib+4HhRmgXAeoySn039tywnq9ECEuzfK1EMz+Dqb3hZTTL+2vHa7p4rzw8pCJbL/1Mc
         K3cpUcjXbQC6IcgY1Iv+rEz+niTr1rTgyFhFk6I4oc2oUjJl0x4FqhNw8+JTGeO/M0fO
         7UAcGt0oiU5E74T0nVRW7Ch3+qxzBlP4yoF6nbAg7aqDUGsw4xUdiCUCu/j3/KPpdLL7
         nOGqn8HvYMZfpN0vsiBrW2MVQTKxtfHI0rTt7tFa7G6dWrYa31yZA2KjTXZH/jqen9cR
         ts9w==
X-Forwarded-Encrypted: i=1; AJvYcCVzC268r6tpHvpFnLwg5xcF0uSM8uvrn+MrTvlkJNSHGhZtfXEpe2/vbtxmdulhLLnNDPg4t0UvDtaYakPuO9qQ0xHbew==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzr1j8+qdkxgJiyvXw++zFLO4K/wZa2lzRO7Ub7jCddFsywtQp2
	sfsKJGIN8Dn5ydBfp6tvUGqtfKxRSzUhWpDygjWbPz+4bJoYiuoP35U2
X-Gm-Gg: ASbGncuVJElXDCG4TJCYVt35EFiOZUNHUu1NumnFPo+mkbM58lLYnp1ZZ+1XlXkFUZZ
	5Qpw1Q0JjjenkHwkcMLu+2JCdcjtwiAgci3cIdpwpZr6VCpwzLjM3M+Xgxq47gB02xj4XYTnD+l
	OX6FMQgWgf2KO0d7+3z2RgksdBSWgUX7ZKzg9Acb1zSVqbGf4Ewjv7wnopHfqx53M6Zk/rDYTUd
	YK+3/TlpSCNmdSUdKwSXHPlr7Cg/8EaxpX00Ht9B2ZePNxfqroshMuYIZsASz0WjVvJ6o4OZqwj
	B6aSxduSlTdjaA9ieGNRkhEpXHs/dihztgTtKUSIK3JEuJGD8uH4vID/e11/uLTuiEZMHdQozGH
	Rq5A6aJ0e4et+gZRbA/dDUNe2RRpH4bI/sQpmuSdBoM5I8V/z/8omdLzfFj6AFaj/d8cXRz0i3a
	/VXHS4t1unWU/9jW6wgTgmeQ==
X-Google-Smtp-Source: AGHT+IF+6hMxdPsypq2OzLkXb6zVTa57M1Qc3zam7TmfTtf8ewM/quVUBy/DpNUn1Mz5toz+WfQ5EA==
X-Received: by 2002:a05:6000:40c7:b0:425:76e3:81c5 with SMTP id ffacd0b85a97d-429bd6827fcmr5619016f8f.17.1762001825457;
        Sat, 01 Nov 2025 05:57:05 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f2b5asm8827647f8f.40.2025.11.01.05.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 05:57:04 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	khalid@kernel.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH v2 1/2] f2fs: Rename f2fs_unlink exit label
Date: Sat,  1 Nov 2025 14:56:15 +0200
Message-ID: <fe3a183f034893e68c6f7ba2773353cfac8de19f.1761993022.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761993022.git.zlatistiv@gmail.com>
References: <cover.1761993022.git.zlatistiv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename "fail" label to "out" as it's used as a default
exit path out of f2fs_unlink as well as error path.

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 fs/f2fs/namei.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index b882771e4699..40cf80fd9d9a 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -552,21 +552,21 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 
 	if (unlikely(f2fs_cp_error(sbi))) {
 		err = -EIO;
-		goto fail;
+		goto out;
 	}
 
 	err = f2fs_dquot_initialize(dir);
 	if (err)
-		goto fail;
+		goto out;
 	err = f2fs_dquot_initialize(inode);
 	if (err)
-		goto fail;
+		goto out;
 
 	de = f2fs_find_entry(dir, &dentry->d_name, &folio);
 	if (!de) {
 		if (IS_ERR(folio))
 			err = PTR_ERR(folio);
-		goto fail;
+		goto out;
 	}
 
 	if (unlikely(inode->i_nlink == 0)) {
@@ -575,7 +575,7 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 		err = -EFSCORRUPTED;
 		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 		f2fs_folio_put(folio, false);
-		goto fail;
+		goto out;
 	}
 
 	f2fs_balance_fs(sbi, true);
@@ -585,7 +585,7 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	if (err) {
 		f2fs_unlock_op(sbi);
 		f2fs_folio_put(folio, false);
-		goto fail;
+		goto out;
 	}
 	f2fs_delete_entry(de, folio, dir, inode);
 	f2fs_unlock_op(sbi);
@@ -601,7 +601,7 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 
 	if (IS_DIRSYNC(dir))
 		f2fs_sync_fs(sbi->sb, 1);
-fail:
+out:
 	trace_f2fs_unlink_exit(inode, err);
 	return err;
 }
-- 
2.51.0

