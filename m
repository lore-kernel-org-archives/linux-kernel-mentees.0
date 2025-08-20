Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA5333EAF9
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702566; cv=none; b=fxL2OZJykpjj+HWqb8OYNBrnRzMGD278yuG1KCBvDHc0bSLmvvO4UagobXP1Y7C3A96wEPN2/SMXtyOVttVVqRyM4Uq30nZT21b2OQoZ5hEgYnswlrHtYyEuMv//uRHRKNPDAY6xkQaunQuSa5p47e7O7gN+2PlnWelwdMxThEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702566; c=relaxed/simple;
	bh=OSjYCM+QZePSiWEWA+QZ0XnfyYn14Pe1yajip1omtRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCPZEGZH8IXU/oXoYSecv6TSBZ2UW7r4vvWnIZ46UsKGn05IDs10z4jBeDahnmuwCj/yyFPPD/1yvixEMeBneCRS5sQFvi8wXFloPSkHyQUu+fm1RpWA+iWsK/hSBn1aI/T8OvrrFHKQjFZcd9Tz5jLf/B/YpxycIblwlIcO57A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akuZrFe2; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akuZrFe2"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso32882b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 08:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702565; x=1756307365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSgIm4/H7Yu+PP0A4Akgz8hg8ykeT23+87+VAQDW1aE=;
        b=akuZrFe2kqm05uQy1rK0orwTnccsayV0s75h3sVhHmZWy4ukOQiP6x2aKZV2S4wPhp
         4FxMgQRi/BwPaH9CUhXVAS2ph3qsL1MuMyXDIQe377jmnYkIrH1EuUqdJ0zEMzZjrJi9
         C8lPSdN/vbuE6G4VRQ9XKgzd/cJ+rBMP2EhgoIA4mtANWHEA5SG9JMIWg1FKrjHOIXLT
         eaVp8HEt2LbrJ/5dsz2eFcZPphfgqW+DV3ZkoJrQnlB7eJO3Irpjr2VpLSdECuE4+W8H
         NkY316vzwA49hQOMw4tnwErm9HNlxcFP/VHE4UGpUtZYkL1C7GhLveAM5nU2loef5JcG
         kneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702565; x=1756307365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSgIm4/H7Yu+PP0A4Akgz8hg8ykeT23+87+VAQDW1aE=;
        b=rr8LMyMQfcSJPOXIolsul6PZ29dDY2gSrdNJPm39Oar0xSC+d0lR2Jh3j098ggIoZ5
         ZKgU9SoOjPjr2RihWlT6JtXlgCwVxU8GCeXUEnBEbCFfv7vIYneGG9FdxWTG+RO4H2Rp
         N0hDDYdMmSr22EfZtHupzlTLYuq/PthLzgjnSxWCzMSxch0eSNq5S7d50yCX+b2PDmN2
         ZM9jKqui020x1IXp22wszQr1ubGxppvrJ9LUvcfnUzKEy1fMxVgaau3PQBG0Wg6Bk63y
         1Ood8O2vBFQjb3xU3qroJjGpvSp9OnGKu3DEcurCamqJ+6HSgfZWGQkY23YWL1AmOGR/
         FLdg==
X-Forwarded-Encrypted: i=1; AJvYcCUKpOY/BszLBAhweEsk8t78oH7Ax1K9l6taYeoKWxF07vGkGqvBWi7aigXVFEt5LvipWuTDSKbkP/VpDfKoBNAtmVboLA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3GqgM14luUSTslv4bcRmNzAQXv8hQTGw3KBw6q9HwNUjzc/yQ
	dUWWW7DRiu/RFcKpCmC7d97OGFNtSdq/LashKrCoicoZRtv/nXVNYOzo
X-Gm-Gg: ASbGnctl8e0kg8I5ydTqpAYneqccMQZ9XOy4QDPQamQFGFUGj0exuHZ/TDZY1OmQBS4
	ngT8QjrRtakEh3kKRZAcQEGxUZyIDa1AWn4MZVaPFuMhZz0gen9aTLiOl++wI+oYGVpilSptCUK
	CHiM+bGCiP8GcPa6Pxi8jEgUf3Ir5zDZeH4Aj5F0mywjFVy1byfmM1H8TqLJVTAmfZYE7KMa+UU
	gOUzQZ+WD60eQqOTZcecHEyjFaCU9yveMIKOclL3TbVFPnCsFStcZc8wV3+S/yVls2THzhmlKF0
	pZ8/ohWGR6ZbIonSOir5EeT0hIL2pRSveIOvCNyyC9kLbXxqKsyw24YAIjE4wOLX1w1CxOusqub
	aZcFYuW4ehtHlvD3p3Q==
X-Google-Smtp-Source: AGHT+IFeesZgKogpEkYmKt7j1jigdbSSubJrkxWpbElJ8Gev87fyWh8qORnnDmjou3DFP1PVwDj13g==
X-Received: by 2002:a17:902:ce83:b0:243:3da:17bb with SMTP id d9443c01a7336-245ef228930mr46362245ad.32.1755702564482;
        Wed, 20 Aug 2025 08:09:24 -0700 (PDT)
Received: from Terra ([2001:df0:b240:b5e:abe3:8cfd:3fd8:5d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c7494sm29526165ad.99.2025.08.20.08.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:09:24 -0700 (PDT)
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: michal.wajdeczko@intel.com
Cc: airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	krathul3152@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	skhan@linuxfoundation.org,
	tzimmermann@suse.de
Subject: [PATCH v4] drm: Replace the deprecated DRM_* logging macros in gem helper files
Date: Wed, 20 Aug 2025 20:34:25 +0530
Message-ID: <20250820150829.4312-2-krathul3152@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <a5d58430-1ae7-4b7e-8275-dad09a5c8cae@intel.com>
References: <a5d58430-1ae7-4b7e-8275-dad09a5c8cae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the DRM_* logging macros used in gem helper files with the
appropriate ones specified in /include/drm/drm_print.h.

Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
---
Changes in v4:
    - Some codestyle corrections.
    - Remove OOM error logging in drm_gem_init().

Changes in v3:
    - Revert all changes to drm_gem_objects_lookup()
    - Use drm_device as suggested in the discussion [1]. 

Changes in v2:
    - Change drm_gem_objects_lookup() to take a drm_device* argument.
    - Make appropriate changes to all calls of drm_gem_objects_lookup().
---
 drivers/gpu/drm/drm_gem.c            | 13 +++++++------
 drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4a89b6acb6af..dc3d6cfa692b 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -102,7 +102,6 @@ drm_gem_init(struct drm_device *dev)
 	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
 					  GFP_KERNEL);
 	if (!vma_offset_manager) {
-		DRM_ERROR("out of memory\n");
 		return -ENOMEM;
 	}
 
@@ -783,9 +782,10 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
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
@@ -805,7 +805,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 
 	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
 		ret = -EFAULT;
-		DRM_DEBUG("Failed to copy in GEM handles\n");
+		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
 		goto out;
 	}
 
@@ -853,12 +853,13 @@ EXPORT_SYMBOL(drm_gem_object_lookup);
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
2.50.1

