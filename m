Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F2129DB61
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 08:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762246004; cv=none; b=jS8SpnPSFG99qjbtEtW1FU09hglEgmQjNByY4mZ2fkcm2uq3WpOX/k1iooMPakdhosKQ77h0l9eW62qxr0z+xQzlTwjstPmeBPdfM3bAY5ZVZckpj/O1ZQ1AdS7NzrsHHwm9iaSox9OyKzZFKC1Ejrg+31xFXPbnJwY1oNa5pHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762246004; c=relaxed/simple;
	bh=/Mzq3xJjoScnLlS/YQOCszoPa9oiwh8nNoNQlaFG2vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Td3vLoHKh0taF5IKsZPlHDNSMWW8jC4YmAyn1ZUKIXip/n8VPF2+39F7oz9s5gXqLenQtCdgulTUxL4SCrsapc7aFp7koHq7RoHj7l6TMpEL1FInordVd950msRStD3AjH6J3Lqmm6siLt3y9BWvE7VED6PHjHhhL8Iwk9OcRrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igSA7MAn; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igSA7MAn"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC18A40748
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 08:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nhn67R60Gm_D for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Nov 2025 08:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA1C64007E
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA1C64007E
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=igSA7MAn
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DA1C64007E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 08:46:41 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-475db4ad7e4so20048125e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 04 Nov 2025 00:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762246000; x=1762850800; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=;
        b=igSA7MAnE9fH4x2333bUouVFFsAvQMd17EYZJy466B/rmc7/USBh6RrSGmUbGjBwer
         ta7Y43v54lkOMCMD6/AYNLUHWfotOp9jWP9iq4OgWIvnxNmnnEzJJzYXn0jA202nje3A
         KtwGyFtazW4MIH/GO3Dcl7smMPaokaPCjCaYJjjZnCfwbDl6izlzbCFjitWbQwbV5s3o
         v2APnabniSXdbvmfwa/E4PMXzVLAfztO7lXnoEgE/EpoqgllCkDe0ubaGhuNXCiMXR29
         +k+XTmL6BoaC2i0h+uXz2erEPdsfHJiC0PBdRT/HuyUa4YoI4enH+5mKv85gbGCeoE4g
         U86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762246000; x=1762850800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7tqhsuXnKDfa3LKYm+5yorAhNtlPrbMypXt017HtZM=;
        b=Fx6wqN6Fws/vhskzV6OIJpBSvzw3ukpurGBKbnRE7QxCt3q1Tk+QxAVT4mQr8LuynN
         n6uCEekhdv9X9XbOg+UHHKU96JER1gizGZZNt9szQ6d7kSkLwc8xdeSDV0WRqoP0LipA
         IBWhrk/lVZn3kplMYlBjfJP5PAm/R4XmR9iIeTcMe7YleobFheviibN0Vk94je96Qs+M
         t8Q5FAawq3Ytq9lYcucIsw1npKZmJpB9HX1FeNxteznIHjNYEQhSSl285SbHXPjc5n2o
         BdfoqLiHys+kC9DFStHS3M4I4uq/jPJpw/uWqpXx1cqaholbhBHZoc1rPW0X+9iB3iRD
         dM6A==
X-Forwarded-Encrypted: i=1; AJvYcCVB1weKjj5B3wmGKdVGaDlqlMymif49Pgk5ICzDwAV25EmRB75hRkGJoNfFAuj3TiUbGcQySqtnm4thO4WgP0IyvILiKw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxxV3TqNqpptrhcxk+D1OthvJoc/f4kq8sfiWdanQWM+yLc781E
	yq7gGap6rXhnWiGJkniGpMTmJyi2DCbO5/qhMcr2zzI8X2ocAo+Nya8m
X-Gm-Gg: ASbGncsbxOquGze7yvnLR+O8dEvxveESMni21jfCgC1/kmGt9G3VT1zkcUtwEeV8M0w
	NdbzCyF4pq8X7lvhzsA/TTvixYad46mMGGn+X7gH+UwQp/s8o5e8dKgr70SVujXSCBvhKZa81Bt
	zH6oV+BT0fceWpwM29a3COAG8Z1emqJQ57LEPBAHKkH4gfwHRl/s/3+pq4Fi+tZX91zurgKcBq1
	zMs81xuOLDAf9/Sq9nfbysmvOrFlnn+Hojt/9AFoI7boD14l98rIB68HQS5glsE72N8AItvXqMZ
	izXHnQV66ysrVFf+hdokQcybEy5inik2+TVqBsMu8dsqlG2xSU7CuEKobU0bQ0CzRWyUqukzRd/
	sk6+sxYWSC6SlnuMRd9zHwu0c5+HUiyvBuYXUl93lCHuOj70qs/iQo8UggUV1fpDYo9Nfi0293V
	5co3vxjF6SdNg=
X-Google-Smtp-Source: AGHT+IFhb38nAneVZaZF5aM3zxV3KnOqbfuBCO2751W1VkzDFRk1Db97GT2Fg6NjK0dH9tASMGTE+A==
X-Received: by 2002:a05:600c:528d:b0:477:ad4:4920 with SMTP id 5b1f17b1804b1-47730802698mr124956115e9.10.1762245999651;
        Tue, 04 Nov 2025 00:46:39 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c394e33sm200375535e9.13.2025.11.04.00.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:46:39 -0800 (PST)
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
Subject: [PATCH v3 1/2] f2fs: Rename f2fs_unlink exit label
Date: Tue,  4 Nov 2025 10:46:19 +0200
Message-ID: <e4057114d8f7bd12127e8e276c7b904fea84edfc.1762184787.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1762184787.git.zlatistiv@gmail.com>
References: <cover.1762184787.git.zlatistiv@gmail.com>
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

