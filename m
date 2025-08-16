Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCEB283CBE
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 Aug 2025 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755357985; cv=none; b=uCkdRUZvJSSN1loF/vEPQwZJNndh2MDm8Q0EIF04qd1Xk4hCmxvyfEUN/Pm8tC4r/Pwnx3fKvNj/sZdMMqaGjIomBD4A9Uiwx4kponwZQHt9BpAqRtu+jUw3rBuqJUA1+mBA5Nub/zT0576GkDjYGz3sKzmj4QcMXO8IcdrqqcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755357985; c=relaxed/simple;
	bh=BfAvAFLlIpC3b2DyuXLmbkTf7L8vxGNdTxCkyuHNgwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=minW9ZgZef/9ARbwgvMkHfdNoHWjQmsBHQ+qLG1yhkCGr7JWBZIy0oCNF3tux1hQTKwL2EqF85ewArxv7lJinr+36KPKblRC2t5p1a0hIxC1ThXmWjIUKKCuPbEevQMJK3iOG7ECFV+nod13Ff2X3ui0CrqW1LVmkKyrPZG2zzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ms7hYPHb; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms7hYPHb"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-244581c3b43so24380135ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 Aug 2025 08:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755357983; x=1755962783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mnxj9j4ujZHlmAKFH0J5lQUtJG4DrJODQ1fx+MjoZI=;
        b=ms7hYPHbk2YDxYp/Mlgs7N9YikU5rMAiHC1A1eCtFajQzY0lAxVhjbGyKrup9OmMTE
         YtjdnqQi+EmtvS0tbtkVdHdYKUPeHFwI/HKzg+cyEbLy4xl3Xp65G8F/pvVIEhWvNhiJ
         LEsAY4sUCh4m4ZfNfNbObJ6xAWYjZEWUUXWym7/3eRhaTCDaQ9wQ+iKmXeFLz5ly71kT
         qI1XHGXL1pbHWv+uC7BrguhkWBXePopUhMG7Zo9KAtxMX2GUQzzTO0pmcAX29K1Q81F+
         Pgy+JHvsdFRTB6sa9Rj5ZwDC+DwrR4rf1O7pT09faGFT6TF6/V/7Sl6IxvDAmQs75qdk
         snCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755357983; x=1755962783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mnxj9j4ujZHlmAKFH0J5lQUtJG4DrJODQ1fx+MjoZI=;
        b=plOzCoKmjJlG73/QEAIuS2F6UP1Zxh8l5X6VDwJp9WHY7jx4z5lvL8R2YDUuFfq1Jb
         OtAUaqEsUhjpOvwImyxl452gqqLLvmU7IfHCJQKcKiOFvIgD+rv1zxVAB8ZZOOfaGpRl
         cSUkGo6Z3Ge4kgbsweVvZxOI/c66I9KP62xeywvhotQHLVQc0ZLNxgvpFAuJ/4V8vJGW
         mIYQ1fJ3Y3d2vVutZV4Hf44kAXXAmMwni2PvRrBDvAtM/HFAi0OtwP2CmNcOX/xfv8dZ
         Tau/h01vYuPpxDMPXPE8H8Y/78EFrYpLsHe55jCHL5FILf6a49t6lX+0DJcieRw76iwa
         VjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkuAg5MdU5C1YEBEh/NZ+S2ZsFwYMiEkhrLZ2Odgsomvo8zzrgj4rjHeLCn+XKTcNVteG4Ttf19aTtsEqn7nndIJGqWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7p11rPJyiJm2JBBXRbU1IWcLHIQ5DgiE9clN/ZbhlbAGpY3MX
	RjqaE/ZharKlFxMbRL9iFTq9pi4XFfMa1wA38SdiDW3MWqmatZ1EVX5p
X-Gm-Gg: ASbGncuEn1WJ+cPuP8V4rzVONPhZXL0JUIBBKRCanyA2fdHo2K3o1a6pYi7IVmUrfuX
	IXP6U41XA18+zl108ZVQYTPoZMXxKxzvF7/b88eiBFoBTmYf2RdLv9yerNpoREcx3YMiHWfwfpS
	ImlyDy7JxGoqgo/NZ7hBQjnX52joHCSpuyq7jPjdgTfYEs/HSqomArh4ZDN4SXT/YjLVerFZR0/
	hF0s4FfDujPEwWNgQMtpimijiwYaWW3HYbaIG5tErYR0m2bfNtJvuttw53OKANcmFTB26YwjNAM
	rc18jncp0f64CGBD9a4iRJkc8DV2a8UT0MhDH7u2ukT0Ld7d5LVWP5/dKqZFMEr6GJLmJpZGTwr
	AJuQkxYAwtYZaP61nN5c=
X-Google-Smtp-Source: AGHT+IFw/4392JeGo+4oIC6CNMmWWYGFfVUHQ0o5Vvd3MPIQwmDgr00+svvnyoZjozRFHuSkH1e3Gw==
X-Received: by 2002:a17:902:f64d:b0:243:17f:b767 with SMTP id d9443c01a7336-2446d75ce15mr85010495ad.25.1755357983551;
        Sat, 16 Aug 2025 08:26:23 -0700 (PDT)
Received: from Terra ([2001:df0:b240:417c:391a:2d23:2970:dee9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb09ff8sm37861245ad.50.2025.08.16.08.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 08:26:23 -0700 (PDT)
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	skhan@linuxfoundation.org
Cc: Athul Raj Kollareth <krathul3152@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/drm: Replace the deprecated logging functions in drm_gem* files
Date: Sat, 16 Aug 2025 20:56:02 +0530
Message-ID: <20250816152604.14667-1-krathul3152@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated logging functions used in drm_gem* helper files
with their appropriate ones specified in drm_print.h.

Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
---
 drivers/gpu/drm/drm_gem.c            | 4 ++--
 drivers/gpu/drm/drm_gem_dma_helper.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4a89b6acb6af..91f528d8900f 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)
 	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
 					  GFP_KERNEL);
 	if (!vma_offset_manager) {
-		DRM_ERROR("out of memory\n");
+		drm_err(dev, "out of memory\n");
 		return -ENOMEM;
 	}
 
@@ -805,7 +805,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 
 	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
 		ret = -EFAULT;
-		DRM_DEBUG("Failed to copy in GEM handles\n");
+		drm_dbg_core(NULL, "Failed to copy in GEM handles\n");
 		goto out;
 	}
 
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 4f0320df858f..a507cf517015 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
 
 	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
 	if (ret) {
-		DRM_ERROR("Failed to vmap PRIME buffer\n");
+		drm_err(dev, "Failed to vmap PRIME buffer\n");
 		return ERR_PTR(ret);
 	}
 
-- 
2.50.1

