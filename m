Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8432147E6
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  2 Sep 2025 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756836627; cv=none; b=rd/YO39C1Xog77etZgh+3yijY+8hCB1txbrwyt5lFPp7Puft+nOkw87J893LiQzY10ZSRkojy0BJJKN+ngfoOywZXfYQ3+9LOjYGGZ0VzmFDLud11Ktcwp4sXTukVR6IY5b8Tzu2drU8sDGeJf1jST4kbuIRx8zl+z5szNyBNbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756836627; c=relaxed/simple;
	bh=HUZUWUJarg7W6rqDCZMjaomtY0RkYmWhDh1YrtdJo2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Q9Al1VWjpXxpp4CBbxXYOP4ygm10IlJD+14THPRciUKxKRyq2HAYyYsIdWUkG7yHFrLPeKOHKxHYdYDlTZ1n5TpIcZiqpf7Ysu9RiByA/Z3QzUXhRKwBaRTYMbio1kAjbzFTdvpdvebvgv4dbxHffX1Y6AvwR7es/JpdUlOtGGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccjt0FUG; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccjt0FUG"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77269d19280so1488663b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 02 Sep 2025 11:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756836625; x=1757441425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1TH0A07StqxqCETJBwzgyuGcbJt6lyB5z/jM8qgdsuU=;
        b=ccjt0FUGtY0RTqLOW6ncnaMpIwVoT3GWTM9l5pQvDMQ1e520gV9XrGh46jaqdRCeWV
         VP7kVMUKPo9kR2e3pEamMXUDDdT+EyNE0L1mBAy1nDDCr4hQRdWONKDrrAqjPg3npljh
         incSShxhdo2SjzQ1VNOCdPIednB9dSA1f2co5TxFWLSNsS9okseEet7ZcwU/CdgJK+XS
         mhrkeUqaoBBygvPcyieJzgeMP6aAGCuDwkzTf40Z+45SlwVhwBVxJVa19rM2hsuX0OLq
         E9DhRoY1p/YNpt2x2SG68gCFTYri314/D+i2LAA63j/R1v8yX4W8eG2zfUYkj3JXPFgj
         z5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756836625; x=1757441425;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TH0A07StqxqCETJBwzgyuGcbJt6lyB5z/jM8qgdsuU=;
        b=JdP9wDXpT7bW3WSBFYPAIjwEk7+DTQwZAIP3S+RrRCU43JjzmAn60xuKDzKj1mowHq
         7j3NifeyMOVrf0J6MQEgaEHTUWf6Xj9jKMnUJCCYOQd8iHg/cxBbwet2RiVixSzbKcaV
         WGJbekHdfbtUGRoQAMEFb1idQQp9JZ4/nHp+GQxAdLKr4FCFRwNyYDfo34mre4RVMth5
         TNL5e21V5LBALXGNYAmM7I/jW/Se/eTEuEcREIQunT3XgrPFyzXutNxu5jZ+XYsX/QL5
         48TiOKUqdFdVMWHKXGfno7/CsLAo928f27xx/uRU1qca90wyiDIR6x6fzGZDEzKRDV3R
         LfsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiFfSBdzvisAe/C67gcByxSqSdYPg6iyu2vMhXwPNIuSRuw7PrJ/3fR/dFcYLPWz8mqsvja7OXJQ+ufo1SgcBLt9/bpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yywey22awWBV1RhryKl6qIxY1Q0od8VglVoeaoWRb36rTJUbi9q
	IYctcC1DiKWJT2pWehQB03AIF19vBDQ1iMnYjoYtcet+q2qIjGCyDxNU
X-Gm-Gg: ASbGnctce2eh0Lobl6u1QFxzr8jSdpJtphix/aKtQKGiekXSeqlV8pe0j5pBYF5TsBe
	d3xLztzIwvyONbI6EFtmP9t7E+1kpboLNWukult3IYdcqYdhWEM96+76qDhVcpQ7KJetdrlPsbP
	/yurb9kwm4QP+0M7eVuR6+ygtMHCqAhzKe//pRvPDoiVpkbIbTmDjhI/qMewUg0+yShAFoDBJ4m
	yjWrYiM0RaUE00miMIkuX4SgLToCIHkbweTHfLMuAZgQcufLehocMeHADARZ9jk088vQPrdBgrd
	A+VxgCnPKX7i2TzIJMc8/p8FH0DyuKFQZCvkZm4A5VSTD6vq9/pIIuUerOKxMNWatO6CwFGOixU
	UgoYEpEJlogWfIVrSNQ==
X-Google-Smtp-Source: AGHT+IGFHCri7WeJln98XxJPVPtUkEe7QIgxGiwCcpWDJ+7ZO0ZQMfaPJ4nVVMR14D8qz0BRhvzB1g==
X-Received: by 2002:a05:6a00:2e04:b0:772:5b16:1081 with SMTP id d2e1a72fcca58-7725b161490mr8303874b3a.28.1756836625470;
        Tue, 02 Sep 2025 11:10:25 -0700 (PDT)
Received: from Terra ([2001:df0:b240:6cbd:e842:2f6a:96d:9188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b362dsm14334484b3a.32.2025.09.02.11.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 11:10:25 -0700 (PDT)
Date: Tue, 2 Sep 2025 23:40:20 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: michal.wajdeczko@intel.com, tzimmermann@suse.de
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	simona@ffwll.ch, mripard@kernel.org
Subject: [PATCH v5] drm: Replace the deprecated DRM_* logging macros in gem
 helper files
Message-ID: <aLczDHV_yGnnRKbr@Terra>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a5cc1e0-ea0a-4d7f-8834-20a371346d79@intel.com>

Replace the DRM_* logging macros used in gem helper files with the
appropriate ones specified in /include/drm/drm_print.h.

Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Changes in v5:
    - Minor style fix.

Changes in v4:
    - Some codestyle corrections.
    - Remove OOM error logging in drm_gem_init().

Changes in v3:
    - Revert all changes to drm_gem_objects_lookup().
    - Use drm_device from minor.

Changes in v2:
    - Change drm_gem_objects_lookup() to take a drm_device* argument.
    - Make appropriate changes to all calls of drm_gem_objects_lookup().
---
 drivers/gpu/drm/drm_gem.c            | 16 ++++++++--------
 drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4a89b6acb6af..fb12cc2051d8 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -101,10 +101,8 @@ drm_gem_init(struct drm_device *dev)
 
 	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
 					  GFP_KERNEL);
-	if (!vma_offset_manager) {
-		DRM_ERROR("out of memory\n");
+	if (!vma_offset_manager)
 		return -ENOMEM;
-	}
 
 	dev->vma_offset_manager = vma_offset_manager;
 	drm_vma_offset_manager_init(vma_offset_manager,
@@ -783,9 +781,10 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
 int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 			   int count, struct drm_gem_object ***objs_out)
 {
-	int ret;
-	u32 *handles;
+	struct drm_device *dev = filp->minor->dev;
 	struct drm_gem_object **objs;
+	u32 *handles;
+	int ret;
 
 	if (!count)
 		return 0;
@@ -805,7 +804,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 
 	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
 		ret = -EFAULT;
-		DRM_DEBUG("Failed to copy in GEM handles\n");
+		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
 		goto out;
 	}
 
@@ -853,12 +852,13 @@ EXPORT_SYMBOL(drm_gem_object_lookup);
 long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 				    bool wait_all, unsigned long timeout)
 {
-	long ret;
+	struct drm_device *dev = filep->minor->dev;
 	struct drm_gem_object *obj;
+	long ret;
 
 	obj = drm_gem_object_lookup(filep, handle);
 	if (!obj) {
-		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
+		drm_dbg_core(dev, "Failed to look up GEM BO %d\n", handle);
 		return -EINVAL;
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
2.51.0

