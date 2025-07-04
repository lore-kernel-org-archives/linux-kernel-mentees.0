Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B828725F
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Jul 2025 07:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613981; cv=none; b=Ovd4oxjqNXwR+/tXdO6Q2TSJFablwPNjBMVx0LFUADE6mwpEIRy96JlVgUwNK0KcDVrSFLHH0b1zG0NIlopxDhwtk6Jmuj8RKEwNYx+u84ACNHalJXVf47fmRhwkOE8ZU3a0AKzNROVYBz0RrcEWepP6eks3s9po6SbY5YdaGvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613981; c=relaxed/simple;
	bh=Upigb2pu4dZf0sT6kkLAt84b8rlfCgQMY6Qq/ZtbZrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dBqhspb5ucFkOTciPzq2UHI4Yjpwer+hwSGvACW3Y7dRufn0/xpxmiw2EGlzdGZRvtiMkIkCGDkjK/YifPbG+tMWeyy8AHQuZCpuaJ9E3ieYB7cqkTFmI18gOYJoV09J6652NMpsySvBVBpGrLgrUvUfUIxgfiyqbVE6aklX0DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyRSD6jS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyRSD6jS"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235f9e87f78so8114835ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 04 Jul 2025 00:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751613978; x=1752218778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kDxuxUDgUgDkcVZdx4yl7cOtfH39Xq3bSHZLoPDyb9E=;
        b=JyRSD6jSzilt4MHnONDHrT27gb1i+PIeesSJArjVmAcR7UpSztByGSnQxpSMDCvRm7
         ATxaf6+TPWX11ogDFln+WLPmOZIym+coNzBFDK4IMbfHt68jFvaJbHx2bTfBS5GZrIS7
         vBMtT6sfJjUXsSafamGfmxvgy6GjskVTtWb/Vc64JyKQpy4YPzpU62de9UEyCLCrIzu7
         xQ1HLqXmrIzppbcufsEd1xjRGY872edhCf6KaQxxjY04d3rS1Jyo5fJVstldp9c7BHtY
         k8q3skIX4zEU8+fHSAeyxugB/ijZM5vXBWpwVT/CIy2zeuQ94hqj0acanpLx491X702v
         KcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613978; x=1752218778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDxuxUDgUgDkcVZdx4yl7cOtfH39Xq3bSHZLoPDyb9E=;
        b=mq/7AZa1Qb9cw71EIVlOaSlw8ugzxgImEPJ4eUhw7S/mrq/5dnCjIHcU/LoNymUdq4
         LJ2yDUydHYjy1886eEWAEyub/DKN+S2lyJPYaNTdaf4NJe+mFxeYVelhC6KyvhHg6P+h
         SMEiQRdLkIkj9KfysNY631JSF8Q2YgJuZI+fB1MOR45E70kHCQRlsxYivuyhxa3449zv
         KQqVz+kJhNCLr7quCm1WNMU9ipBnYoeJzTjPJ5+ac6HE1CYopleyQQVad7B+ebiAoCwl
         oOVtkLOjC2ognrXYtkYOGS9G8GTSM7luIVzDvX2V+45jdnQpNI32Yv1idjtfLboFREy6
         WNlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTOohNboVTF+2oDvh2Yi2YMIPzvgx8g4G0ZZqSQ9xszMY2MUhabL3Z0aP1ckNydyljF+gNnd3UVLt+gY1p/JTq7hQHug==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrFaHXpaHG6nqHcZYJE0pTbAkhMuf/Xz1/gSF49maG3DIi8yxm
	ya3eZpLzyg9timBdULD1ngpD5eiaDJm9FwqSxun+zjNjbI6UNmg8BTdB
X-Gm-Gg: ASbGnctXiMwYLT2ZeofeJ38VpMpChv7CzL8gaDln2hmJ7+lwXWTBCDfTL9qhKvQMxvL
	8WFueUO8HTBwHmike7sIcHPR97UA1IyPXas8rYq5CHpHK/FEjBFA+LgHVGKBiCGw3Df47u0hIj3
	eBycy3TJmB3iqYw/wO8I22hDdbtndlikfJH85TzswDwUFc/+iaMlrWaiWVAwiEkhLb9Ul9s5UpK
	ipWgtyqX3GKp4ZfO2fLlQNLp7czYPp1gIkPZgPQcV2jTK/ZAneCm0rK1BZZ7tOEoUJyT5FcCsj8
	2BifIGq6ply0D7tTFtAw6312pkPVmX984B+tSRSHjeiTU1D8E+Df4r7AE7QNZmoPXFYMre7RwIX
	GV2bTXL3lIqsOdDFD
X-Google-Smtp-Source: AGHT+IF868eyucOmTptTbQbUozxpL8rfVAZcdj+zsUMVFE1ZmgFNdh9GJcoKkdvBbd8xKBaEX3JDJw==
X-Received: by 2002:a17:902:fc48:b0:235:27b6:a891 with SMTP id d9443c01a7336-23c85e772c8mr31057695ad.28.1751613978318;
        Fri, 04 Jul 2025 00:26:18 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c30:6f3f:3d1:c4c0:3855:2a18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455dafcsm13455985ad.96.2025.07.04.00.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:26:17 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: cem@kernel.org,
	djwong@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>,
	kernel test robot <oliver.sang@intel.com>
Subject: [PATCH] fs/xfs: replace strncpy with memtostr_pad()
Date: Fri,  4 Jul 2025 12:56:04 +0530
Message-ID: <20250704072604.13605-1-pranav.tyagi03@gmail.com>
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
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202506300953.8b18c4e0-lkp@intel.com
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

