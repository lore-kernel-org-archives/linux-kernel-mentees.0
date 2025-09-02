Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC703043C3
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  2 Sep 2025 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756825254; cv=none; b=SR0TGqlG1cQeH+ZMD8mM6fNr0QhJZUhKfwrp/wZjME2eosA0IIx1vfpfXkG4zMxmaBzl66Aumo9XD29zzPxBd6h1dU7A/99cBQIfH8Wo1OHn8akNj8MR9+AA8pzWWfkm/1NhxLujvj1gjIqKemZxkGQ3uML+3Skq2CA5cEFt0a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756825254; c=relaxed/simple;
	bh=E1gm4ixWV25iVKcnn7DLy0cpx6LH/SXjVAyuX2kFSPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsPPC2URNTBhPlajjBnpFBbpTesKlqa1wL35wHbAlLgxCUBpOkuDauyiiegt3zhlVzYmZv8PFNe0lWCcAxWMazuCk9ieodlAHg4aa6EosQ5eyGlvcMKeSOTLt5LT7OguP3ihHeVCXXCAkAz1eZZ2KMlhvr2XbGAcAEj66F2t0lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJl6TKCK; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJl6TKCK"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so5336546b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 02 Sep 2025 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756825253; x=1757430053; darn=lists.linux.dev;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tn6ROBb8evHy9I8BKmFlbvpCLLUKX+yfgDwyfCgLRYg=;
        b=nJl6TKCKMdDyM2ZHVPJrA8RPha6Hyu2U/NM9DVMBFFcTLxOqozO2te4ZQWpjFw7PU5
         N+7UgAebhxvKsMbevybejF3IF0oGuLi/Bg3YxMG6QEH6fktjCJTU/KGglBOZe78cXov4
         s0jC0a3BuAfEFjf5QJQHuuUDeg3yIz1iK2biT47wTOdOMBvNg/XLBR5ZgtmMYmbAr+2J
         B1vm4RvYr+7ki4wmSegcSVpMHUGYMLbemivgtfi3fmErVtMcUXM5BRB1q62iYS2KI/7R
         zE3h5fV9GfJyxfq8mOzi9uywn1F3KDNcq5SbxTvOKB5mf47Hw40VIOBN6jwFdf55PnPt
         Y/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756825253; x=1757430053;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tn6ROBb8evHy9I8BKmFlbvpCLLUKX+yfgDwyfCgLRYg=;
        b=Lg0YWwvJeNR7Otdt7CHluluSdOXZaQ+I64+hhImUWwRPDfZGZP5mMKnLTqXOF+ko2u
         uSZ24WzEVzAqxXJobjZesdMcuIwzWnc9tSIJUw7K00v0fTooAFAMUdGOT54Ezd1153PX
         Z4PqRab7EZq2i+5T9L0XOrJ6poBbcvmO9bAHfgWN21GC/4G8clWU5qmAq9mzHfZwoMP0
         e/lxGTmyVruW5aoNNEwqAuGxYKamm5q49KjYa4L0G+V0fgvT+j0Wp85FZFcouu5ZGi3z
         WkLmXdaJihYABZBwHRBJn3GPPsrZDool/q6SauFUvybwvKjw63inWKqsWCJVj6oQHKt6
         2dsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqzcw/a2jNliJFNZMPhOHB099T+sFUlWJcUOOcFn7rex/MDa44Kgrhr6NXlXiIiVCNZ/FBjbOJc5hNPsSDSWCoZ/DoTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAgjm9Kywt4TXGqChe7iUU40sS04uY79Ho3Gjfj7SYzrK+1Ekv
	sZFnPAc4sW96Cz4KVj2+9Z6hxhCZty71iFxVdyRC3tiMJbMgPesncncc
X-Gm-Gg: ASbGncslkmmNSsaj/7nZPj0Ekd461v5ViBdKnYLl/b+E2aZXxpb/l/NIIrt2/xNJhB9
	iUHL4/4Y6AvLtrx0cgDcoywVXWETZzE5qYtauv1XoYemr17MxtkBvc1wdhu5TyZ3RjgRinps2C7
	98j5+q/v+a803I5p/TitPBGMAOncACOCzYE/Wnn1UDOvm9wds0/FKi8jCCYfGXM7YERvGvjlCkO
	hn3ubIFygsMxvXQAIiAAXldcEixZLQaQWIPFPkFZQLk9x+XSmd1EzIexUqSiVbTXEAcq9aA2yvs
	KCB8ic42zrf8oAZbmk8x7tTUDSFuS66Co5s/Egaz68R+SrrW/6IHs8spzkr0P5DfvpU5VMswOcv
	aF4j7L3SKNgQENr95Zw==
X-Google-Smtp-Source: AGHT+IHHxrc0XwRU+HRTrGA57CaD51yo2yh2p0+QXYYFuVfMz4hoSOXX4R8xNZoi2aFYtFEvwTwhMQ==
X-Received: by 2002:a05:6a20:7fa0:b0:243:9845:4137 with SMTP id adf61e73a8af0-243d6e5b2edmr17328160637.26.1756825252323;
        Tue, 02 Sep 2025 08:00:52 -0700 (PDT)
Received: from Terra ([2001:df0:b240:6cbd:e842:2f6a:96d:9188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772608b1b5asm5332937b3a.46.2025.09.02.08.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:00:51 -0700 (PDT)
Date: Tue, 2 Sep 2025 20:30:45 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: michal.wajdeczko@intel.com, tzimmermann@suse.de
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-kernel-mentees@lists.linux.dev, krathul3152@gmail.com,
	linux-kernel@vger.kernel.org, simona@ffwll.ch, mripard@kernel.org
Subject: [PATCH v4 RESEND] drm: Replace the deprecated DRM_* logging macros
 in gem helper files
Message-ID: <aLcGnf_wrY5QuZZC@Terra>
Reply-To: 20250816152604.14667-1-krathul3152@gmail.com
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the DRM_* logging macros used in gem helper files with the
appropriate ones specified in /include/drm/drm_print.h.

Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
---
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
2.51.0

