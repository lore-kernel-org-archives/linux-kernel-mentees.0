Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9973E33EAE8
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 12:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605849; cv=none; b=ekhgItX5uzRaAzbYbqQ46sg7KwY3qQdV7n5OFDsG35x+Dzgo30POfKnI1/s3BLMofjXC46XVWTVgvDljbnpcPdIWEGIMb/sOj5I3e4LmSJ0XqjzxCraruZ24Mv4juoS7cHJAxX0W8Vp27pcDKoQ0BRhcXnGalq8CGgAHdcGLPZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605849; c=relaxed/simple;
	bh=c6SJfBR+/GbWNLnYTC3q9NWv7hrRufqAdO/HZR4VMuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSgVU44GJcg5Lr8JdQpJn4SpWWVhX/rMkBbIMmNyPlKA2/a08UNee4a6G0kWfY6xpVYmxcJ81WzQtZ0UrZTP3lTeH6zb0goURtchbBwYeqZDWCieOMIQq2ipfMTwLlGvkaA8Eu5kpn3RT5n695Wb886WIkbowII6vTCqJrrw5zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zl2SdlRL; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zl2SdlRL"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b4717390ad7so3480359a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605847; x=1756210647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWV0vVeINjxfROFedsb1z6gg/iy2s16vpsTiJJvBM0c=;
        b=Zl2SdlRL0+Hv2oxOw4VTk6hLOl/DM14T+gNjvn+lmZDAORINt8E8uDCvQmXEAhSq+7
         H58yVOhtyFJEh2LJ6WVDZ20C6ePOnmhW6oOe0SXA5gcU0iPJw3Ja8cjwxDnEHOTdIJBV
         /WP23EvuS/EMDRLWxt3SKoVFlqywQgs2DiVyhFo1n3LKdHh6Bk/KD7WDcADnJ0Kd9JFE
         2UaHSs6skA0HJeJTR+MgBfFWpABTrfjMdOP2CEiusNDc6jiTu3jO2P70ip3Tz5/cfkNo
         XfilKUJSLuDSXLGcY5SzSMGxlnuk9gaIMlBQj7394+84/dP1lHi8KCgOyMusDhVCDQoj
         chUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605847; x=1756210647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWV0vVeINjxfROFedsb1z6gg/iy2s16vpsTiJJvBM0c=;
        b=wr+hI7H31ibaemDP1rliVqPZJZXSY5V4nQlOg1rCrDZ17nLLv3Lpmz51wzvFtxds9r
         nWJe2bX/9J2Lpr9ifgnY2gY/khGLQlsil51odSZEXHCUySDGZxHS6IGe8seFAGncT3Kf
         VoqwVqyaQW0SqzEfhJ0rehMQrJOra4JgzMvT/vYl1wktUHR31TnHj7DRa3pmSLtqaiVy
         Fq+2rUYi2TwEMbxY5KoDt1bu+GkK8eacYWV/KDeOwXJ5xNhF5/5o1ASkiBn96WJxzWxq
         KwcVGD5Vmw6tbboYQqqmou+VYnA1Sr9HJTL95EJpbOWIbTni6oLLxoU/AoZbNNYDTL/Z
         plNg==
X-Forwarded-Encrypted: i=1; AJvYcCUzyizh2mZ7JYfu8ne6ZNRswP1Vu9I3p9tuIKU9JRf+HQwdcL0GoddJJXHhBD8QNdlyuOhb1vMOKfK3vIq2QKtaW+tOmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxaDk9jNd8iF6jZag8B04y1P2gd0wMEglA+cJv2p1Q617pzQeE2
	Bm/Ln6xCRCWoUnjuacQ77TRuk12EVNBNklrKQ7enpVWYKuAESOkRWUoB7fz4C7Mw
X-Gm-Gg: ASbGncuuGNVuhMAolivYyx4cOQr8AUdjGJln5BHwfC+jLHrHaJN1BW77okfMkWDRNdD
	MPHsaJ/dshsm95Eh+J5DQTCcqtmQBmkGkzgekIAPuhPJfKy/7XUZhLJNw3jBCyiI296NEZkwDP9
	+E3UmJz0CdZRqNQwrpIfrO9x3Id3HMdw27BZL9v1LoB5ufZEu+CFMVMEz6sd4cTeZ+f49RAMQnP
	f+1xcgdMrrMenja3yzOZfBGNF1rUWU7VRc9nJZIAX650Faqt9mYMf8yMWKqVLikCQeW1X6lGgW9
	nt/vQZgwGJViYNZsLYp93/ylt1remGHe5HwfzRnTlX/OTzduyCWtR/OnltYLph4nijLlgUj7iDA
	d7I/emh3/P571M0gpeA==
X-Google-Smtp-Source: AGHT+IF4qxL0U9vpZ0HxdELT3VX2+7tfvAlLdXWTxv3BAaxYCg97WMvRMcDAIOayDSjp3fkucWBHtw==
X-Received: by 2002:a17:903:b0d:b0:244:99aa:5484 with SMTP id d9443c01a7336-245e04704dfmr33200635ad.33.1755605846818;
        Tue, 19 Aug 2025 05:17:26 -0700 (PDT)
Received: from Terra ([2001:df0:b240:b5e:abe3:8cfd:3fd8:5d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9ef54sm108352705ad.26.2025.08.19.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:26 -0700 (PDT)
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: michal.wajdeczko@intel.com,
	tzimmermann@suse.de
Cc: airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	krathul3152@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	skhan@linuxfoundation.org
Subject: [PATCH v3] drm: Replace the deprecated DRM_* logging macros in gem helper files
Date: Tue, 19 Aug 2025 17:41:03 +0530
Message-ID: <20250819121517.46998-2-krathul3152@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com>
References: <90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the DRM_* logging macros used in gem helper files with the appropriate
ones specified in /include/drm/drm_print.h.

Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
---
Changes in v3:
    - Revert all changes to drm_gem_objects_lookup()
    - Use drm_device as suggested in [1]. 
Changes in v2:
    - Change drm_gem_objects_lookup() to take a drm_device* argument.
    - Make appropriate changes to all calls of drm_gem_objects_lookup().

[1]
https://lore.kernel.org/dri-devel/90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com
---
 drivers/gpu/drm/drm_gem.c            | 10 +++++++---
 drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4a89b6acb6af..fbea8c50f17c 100644
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
 
@@ -787,6 +787,8 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 	u32 *handles;
 	struct drm_gem_object **objs;
 
+	struct drm_device *dev = filp->minor->dev;
+
 	if (!count)
 		return 0;
 
@@ -805,7 +807,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 
 	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
 		ret = -EFAULT;
-		DRM_DEBUG("Failed to copy in GEM handles\n");
+		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
 		goto out;
 	}
 
@@ -856,9 +858,11 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 	long ret;
 	struct drm_gem_object *obj;
 
+	struct drm_device *dev = filep->minor->dev;
+
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

