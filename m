Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A9A28C5B1
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Jul 2025 10:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623981; cv=none; b=YF9xm1EywGBQ9tNSacT/LxuUUBSO273JU+coH0WaTDUXjFGf+fOaLZ42E0GAgPhqq0zOm+ggv/kO3owCFBDRm7edJOYEDvzn4HtXGcZQTSmmzZVQQs/PZqLchCj+55m94kkRLzroXzsjILDsiUUzhAip1WVSiofoujpCoYKkegg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623981; c=relaxed/simple;
	bh=strF/qF+HXTlakY4UdqZE40XmR25ZXBwyUj3EmP1zvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJh2Wm+bRwoDXS94B+wkDSvI2YSCjxlWUJ0JH52Tqs+SwJ3mL8PhwiEFrHwsCLTC9i7T2FA/P7Xv6V13bfX8VCGjCVd1EHwef49YD0XhGxLlozIrZ/LcOPjj8AOHiu9ncBOvTkMfL8fUXC5L/oumW8Pi0Kx5REGDbF9SzThIkvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0Y5Mwb3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0Y5Mwb3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23c8a505177so1699575ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 04 Jul 2025 03:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751623979; x=1752228779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1y1NR7p8TbbSgnXEpVgZrK6g8G4GQPFzDyyvDynoD8=;
        b=b0Y5Mwb3OpIbzBNFzguvXNhlulxRdZybkBzI6dtRLvy0PZXxFyqKksf1VmYuT57YG5
         +IWF4kG9h5zrawy3kR7bIw3D3BKngGQ1ukDJhbIIdmHP3cMkccbjsdxF7weDP/w1Fpsm
         So6zyCSPFGTzp+EfLpJJ9bniIA19uoUnIRZ8ygle01FTZanklaitsOVm3aHEWNdQb69E
         XTfwKkDP9xTCH4yUYP8wbO1cwhAxjLFildFB8LIMoZo3Txy7Je1Q8k7UHkxomHWyagsw
         Cmhz+RmML8WLeHrFFxdWWMvQ8d/e6W1mKUUDkYNad9SPdQftL6GDQ3bGYah05DQqrkWG
         0+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751623979; x=1752228779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1y1NR7p8TbbSgnXEpVgZrK6g8G4GQPFzDyyvDynoD8=;
        b=ozs+f8ciUcgI0Ri35loq8sVg8iDMsfy0qArRP3EIn4feV/wGxOLzUa/n++JDlHn0Ak
         nU1SQ+EHhrfBuGr6k+atll6wG35ff4IIDw5YciL6fe3eAa6KkuLS68OtFPVXHKQYM1gz
         Smq4EmSMjVE3YD6wMeyzs0sGlMKRsMle2yE47ImVPdK4JflDDJENQuIZLKNLkpNSCenc
         9Y7gyrs3m58Tdlu2ChJvSN4BZ21l/UvN3tSpxRpK+ArPZSaOGsvsDxvvKl1k/pFhojLp
         YP93HitPXdfnww8GpIyge9t36o6zqd0hQCkPln+SChueQgslTJCIDePU6vs1jxNv6qKF
         8n8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhaKqJXegj39bdTMDSdnMmAMVxcSouS7TF7rkDVlIJ7tj46SO6eCKZBLlBhFDEceMzwg7Z+X3B0rfL7gzWwjl9+WvS8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz8sU14T7IFtO6nPTo5me702DsgFSJEp3cyODNdosdkg9csADc
	X9aNUt8hi5YqxPcvwF/zKtUDTF/ueFubCFUu8I7vmegsbXqPOApdeTkq
X-Gm-Gg: ASbGnct2+VMZrudCPAX9FbB3oZw+IB2PzHnKDsoy/bfPXTTuHaLhuQyciND2OoTudNJ
	oOFl6h5h+ChNXNWQqcgOtt/umXYjn6RMmJRg+ykbShj/Zvk7jSDGT44/GJ9QRBQqy/UsHG1R2Lr
	e8ykgSgK4o1KEC0anqmqzBwHWvxYTwdzg4nts54iw+XjX9E+aOVAoBNU8PD0+Lx1A40n7igutgT
	HCHJsAwcsVQgnodY8i5tvoxRbHrw4pZy9Nle+AYHFY4+c+yS2h0eJpiVlvLlyz+6cnCJLhHTzgk
	D+WwhjUq/iT9cvOsRzPiMbev66J/7CWtJ619eGvz+dW07oxhGuFof+4bveiOYK9n2fcKi55UcRg
	F2+rU5Q==
X-Google-Smtp-Source: AGHT+IEhlz75hcIMScbZOGrIIhpGBtexZtJVFZxnnJZmRv2uDCi7FVBVuU1Wr0ccc3OHMr11OZfp6A==
X-Received: by 2002:a17:90b:3d43:b0:311:eb85:96f0 with SMTP id 98e67ed59e1d1-31aac53b7ccmr3344373a91.29.1751623979053;
        Fri, 04 Jul 2025 03:12:59 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c30:6f3f:3d1:c4c0:3855:2a18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cd0cfd9sm4465076a91.39.2025.07.04.03.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 03:12:58 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: cem@kernel.org,
	djwong@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH v2] fs/xfs: replace strncpy with memtostr_pad()
Date: Fri,  4 Jul 2025 15:42:50 +0530
Message-ID: <20250704101250.24629-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated strncpy() with memtostr_pad(). This also avoids
the need for separate zeroing using memset(). Mark sb_fname buffer with
__nonstring as its size is XFSLABEL_MAX and so no terminating NULL for
sb_fname.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 fs/xfs/libxfs/xfs_format.h | 2 +-
 fs/xfs/xfs_ioctl.c         | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index 9566a7623365..779dac59b1f3 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -112,7 +112,7 @@ typedef struct xfs_sb {
 	uint16_t	sb_sectsize;	/* volume sector size, bytes */
 	uint16_t	sb_inodesize;	/* inode size, bytes */
 	uint16_t	sb_inopblock;	/* inodes per block */
-	char		sb_fname[XFSLABEL_MAX]; /* file system name */
+	char		sb_fname[XFSLABEL_MAX] __nonstring; /* file system name */
 	uint8_t		sb_blocklog;	/* log2 of sb_blocksize */
 	uint8_t		sb_sectlog;	/* log2 of sb_sectsize */
 	uint8_t		sb_inodelog;	/* log2 of sb_inodesize */
diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index d250f7f74e3b..c3e8c5c1084f 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -990,9 +990,8 @@ xfs_ioc_getlabel(
 	BUILD_BUG_ON(sizeof(sbp->sb_fname) > FSLABEL_MAX);
 
 	/* 1 larger than sb_fname, so this ensures a trailing NUL char */
-	memset(label, 0, sizeof(label));
 	spin_lock(&mp->m_sb_lock);
-	strncpy(label, sbp->sb_fname, XFSLABEL_MAX);
+	memtostr_pad(label, sbp->sb_fname);
 	spin_unlock(&mp->m_sb_lock);
 
 	if (copy_to_user(user_label, label, sizeof(label)))
-- 
2.49.0

