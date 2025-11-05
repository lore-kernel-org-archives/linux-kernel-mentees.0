Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AD830FF30
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341003; cv=none; b=CC8KNBQ0uItW/4Bo9EQZUTVup/rOi2rtHwojHIS5PCGJqAep5WzJOUHlmF1/ULTe0hlt85GDrNJK81lL6oXPzHUpK6MH5Rg4yDTrJDXxvdpsLfH7GfEbG3wPIa8lGO2Kb7z4ygCvffZRxM1L6w03BTnrPJ/9vme1KalPs1rGQdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341003; c=relaxed/simple;
	bh=/Mzq3xJjoScnLlS/YQOCszoPa9oiwh8nNoNQlaFG2vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FzkVUHrSk6/pWXa9B252SVQWQpA7u7KJHi6VOpegn61Wl4euPzjhuyV5bQZ3huhAf/Og/oMIpSNjRNZPYY8H1dcZ745EkgcVSlMmRsPQ8PN+VI9Fd3m5N2mx0+ix0nz+7ziMQXYHcyPtlYCoRbBCoF+9qm4HoZ2QUVn0aaGOKkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZtUcAX/; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZtUcAX/"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A24624116A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TL4TlBmyt3PK for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Nov 2025 11:10:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E861541168
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E861541168
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BZtUcAX/
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E861541168
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:09:59 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4711b95226dso84230455e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 05 Nov 2025 03:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762340998; x=1762945798; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=;
        b=BZtUcAX/VNEbGMFv9aeMPH1hj8FEeNqK3X826akloxYH9c7Man+jOFIAZ72EfmgnT/
         jtpjitUCjEyG1syGd4jCBxHFcQ3xyxHKvomY7WYvx1MHOcKF22lIYZ8sXsPIQyAUzcFe
         rHuBdY0QzLsrJ7ZWflsaEzl+EGh2nUhcIbWwGU1TjCI4Pu8EU4CGuMZX7WG2cQhUFZEN
         4Vu7KNBVSka4jlwjLaYj9KpdiFT7sfaa/3ieVbcK4De8NwJeq9pM8efZ9OaQDvlbbRPa
         g255fdTwvz7CGWVO7A5iYZmDqdez+Dz2zVAiKTjRE2h5b7HIb9A6/bsGNmIvsqtev/iX
         cAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762340998; x=1762945798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=;
        b=JfcEMae9N0S2jPu+W613Je+k4IGB43YKSYnBgwrGHq0Fccy6k9O8UqBJ9BOnGt8rm2
         u8E9+G9FB1eWI20cK/M7xkR7esDdkDUO2gwQrUXHR5oe+cJwR4fDc7hyfQ0ThZWMcdEt
         ohpjrF/nZQeaN+Xv4i27hr9mghHdNRlOlG+lj0QcUw2BnlV4cJSDaXar98RljtNDK9mJ
         zhCGqibLxB3K41KiFaPHfRGNJwwGbHDW8tfq6L4pNM6sewAwHzrmPmilroZFn2uuU/6y
         NDsij9VEL65cwQVSYNDrzy3DAvYziOrc79q/7FHbunjcNychYihn/CI/zXhiuKwIDCQK
         5eRA==
X-Forwarded-Encrypted: i=1; AJvYcCX+YEnPWyzBr+Nwb/pEGmG8rkUIMV0/1KwSIs4QBRaetcTOQrU6X1l+xHRdN/WkHqFWDvXkg3o0gX35ll67bXM36aqROA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwlLpx7OvIf3iizMl5uqxwy5pv83CAah7xNl0c1xU9fiMJi1rvP
	nzhOIxPm7jhLafjZ+xqzM/2vtra9+zkaDtlwB4tWHm4bAtQSvMcA6IL4
X-Gm-Gg: ASbGncvWKRPmelDBder4sPASgYg7tVB0AFN3kRfn9ahJ/RYGnJ1VpofExIIaowqZTwP
	iy87CMX1/25pWJ9Ks7OT3sHsq+NVnKlXixGv2ToY3ZXRkNoQM9ATDr+Znwy4QLWQ1/WVzS1O438
	Lon0E7hPtVQa1KvZRSJJ4QJ7T4Upq8kpqtInZT2/O+DLnmrRwoQf/hDzt0DZogdAwe+k4GQ4zXe
	dChPEIEQMShGgLxnQdU12nQMtdTaOgzS4bN3EBZkGYaEabWijE4FJQS9APWMEu/p36g56C4wk3t
	Gw6DUpTLusDhXyaY213YuvY82eMrWdh0imn/tW6d+nkfFR9z282BzCFPIcAwAoWqP+zIUb66lQP
	47TipUlsuRfUJspdAYVMQSdLuYSr0gCwLiVtWkeOXhhxG5/8Pf/4VFGzeJIhDCqCpi/8MT8kRx+
	ATkxO1Fea/uHE=
X-Google-Smtp-Source: AGHT+IHJpcEdw1607F+Ey1V4LbwjmDQawpeGTA8lma3MVtT0pEJj48H/kPwEqm38rL5rx3ziZa4wPw==
X-Received: by 2002:a05:600c:3487:b0:471:115e:9605 with SMTP id 5b1f17b1804b1-4775ce3d8a1mr28339055e9.35.1762340997771;
        Wed, 05 Nov 2025 03:09:57 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c42adsm39728415e9.4.2025.11.05.03.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:09:57 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	khalid@kernel.org,
	stable@kernel.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH v4 1/2] f2fs: Rename f2fs_unlink exit label
Date: Wed,  5 Nov 2025 13:09:42 +0200
Message-ID: <eb59e101f0b201afb65cb40b38e1b1598039ac82.1762339963.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1762339963.git.zlatistiv@gmail.com>
References: <cover.1762339963.git.zlatistiv@gmail.com>
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

