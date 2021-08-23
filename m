Return-Path: <SRS0=WoZ7=NO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1173CC4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 17:15:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBC28613D5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 17:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBC28613D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86ABA80ADC;
	Mon, 23 Aug 2021 17:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDmDMlnb_hPv; Mon, 23 Aug 2021 17:15:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A45B580B4E;
	Mon, 23 Aug 2021 17:15:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91285C001A;
	Mon, 23 Aug 2021 17:15:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B504C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 17:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED732401F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 17:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgS9J9JLCBUT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 17:15:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7105E401FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 17:15:42 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id 2so1883713pfo.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 10:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LBNnbRdOB7gSyGYfTznXsYtZJZQrtVufmncq+RbfE9Q=;
 b=hG8Mzg+1ySiHuITmyp+yvPuFpdEA3NP/19iTrD/Y0g0PtxF/8NMH2RdPjpY+kbjKoC
 lgv6NuYvXX+ah1Ke3DNhU9t+K2wY7IXGibMNDyvyWvRGRz8ST+sNlTJrgXezunIw4Y8Z
 GwOykfo+d5qT42m40aTeOUsNhh+aYQzE7lPgiQ6SDVXJu443TytjA87r6yaN1S+1aABn
 4q7ueSkFnhzrZdi95OgKPwaCwFOnpBWcG/utpwxSqpbNwBwCSUFbDw3zRKeeb8QyvQYq
 tfX37J3sQ7cVKCRDvHwOLFTchIfpZNpfFtppYryIroIl0qB/zmOfRs8guAGNwPt+IbA3
 /lOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LBNnbRdOB7gSyGYfTznXsYtZJZQrtVufmncq+RbfE9Q=;
 b=J5z4klVOElfmtvsvWViqBmEnCdSP7iKrXHlaXaZc3IvawEDPhfqUJ7P1u5bjPwEmS8
 Z/8DrHhF5xqJolxhTBWttXmtnWKEGP/a2E6TVeIIYlIfoIeIArJaKbB+yEX317Li4BIc
 YJ+a9ibcn1P2Oo1M13NkjXhQ5iJ4o9AbAhoTLX7BvhFS4rEtaSeKZnXM+C0WoYUZc8aA
 mmKBkLTF15ZYENuW1t+kzd9sIT+swXKkhkemd1kjPhHfcW8jm0zH9cB1dWWPNjDuwyBg
 VqyuKZR8mH8HFYlHNOzdHqFvALzoHvxJOu0ZsgnKgL6QKn012IzNT27Dtqg04JsHheCs
 5VUA==
X-Gm-Message-State: AOAM531zlVurCQ07dyOyGZ4Sj6CitnXZr5T+E0oNBZDaO2kVLFb2vG2M
 uhouTxi8qBCUjbUj5j/Nudo=
X-Google-Smtp-Source: ABdhPJzxaeW8uzTG1uHXrwZSAw+OnE8hM7SpDAvhq7TC2oOZJYxygouMsEegHA38RAs8r14uZK+YzA==
X-Received: by 2002:aa7:850c:0:b0:3e2:edf3:3d09 with SMTP id
 v12-20020aa7850c000000b003e2edf33d09mr28372462pfn.42.1629738941879; 
 Mon, 23 Aug 2021 10:15:41 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q4sm14290830pjd.52.2021.08.23.10.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 10:15:41 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v5 5/6] drm: avoid circular locks with modeset_mutex and
 master_rwsem
Date: Tue, 24 Aug 2021 01:14:36 +0800
Message-Id: <20210823171437.829404-6-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823171437.829404-1-desmondcheongzx@gmail.com>
References: <20210823171437.829404-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

drm_device.master_rwsem is an outer lock that's grabbed in the ioctl
handler. However, in a future patch, master_rwsem will replace
drm_file.master_lookup_lock in drm_file_get_master, which is sometimes
called while holding other locks that depend on master_rwsem. This
circular locking should be avoided to prevent deadlocks.

_drm_lease_held and drm_lease_held call drm_file_get_master. However,
both functions are called while holding on to modeset_mutex, inverting
the master_rwsem --> modeset_mutex lock hierarchy.

To fix this, we do two things:

1. Wrap __drm_mode_object_find with read locks on master_rwsem before
locking modeset mutex so that we can still safely access
drm_file.master without drm_file_get_master

2. Call drm_file_get_master before locking modeset_mutex, then check
for leases with the new drm_lease_held_master function instead of
drm_lease_held

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  4 +++-
 drivers/gpu/drm/drm_auth.c        |  3 +++
 drivers/gpu/drm/drm_encoder.c     |  7 ++++++-
 drivers/gpu/drm/drm_framebuffer.c |  2 +-
 drivers/gpu/drm/drm_lease.c       | 34 ++++++++-----------------------
 drivers/gpu/drm/drm_mode_object.c | 16 +++++++++++----
 drivers/gpu/drm/drm_plane.c       | 17 +++++++++++++---
 drivers/gpu/drm/drm_property.c    |  6 +++---
 include/drm/drm_lease.h           |  4 +++-
 9 files changed, 53 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 909f31833181..203b0936f7f4 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1366,6 +1366,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	if (!state)
 		return -ENOMEM;
 
+	down_read(&dev->master_rwsem);
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
@@ -1385,7 +1386,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 			goto out;
 		}
 
-		obj = drm_mode_object_find(dev, file_priv, obj_id, DRM_MODE_OBJECT_ANY);
+		obj = __drm_mode_object_find(dev, file_priv, obj_id, DRM_MODE_OBJECT_ANY);
 		if (!obj) {
 			ret = -ENOENT;
 			goto out;
@@ -1474,6 +1475,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
+	up_read(&dev->master_rwsem);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 65065f7e1499..f2b2f197052a 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -410,6 +410,9 @@ struct drm_master *drm_file_get_master(struct drm_file *file_priv)
 {
 	struct drm_master *master = NULL;
 
+	if (!file_priv)
+		return NULL;
+
 	spin_lock(&file_priv->master_lookup_lock);
 	if (!file_priv->master)
 		goto unlock;
diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 72e982323a5e..a4852876f91f 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -22,6 +22,7 @@
 
 #include <linux/export.h>
 
+#include <drm/drm_auth.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -281,6 +282,7 @@ int drm_mode_getencoder(struct drm_device *dev, void *data,
 	struct drm_mode_get_encoder *enc_resp = data;
 	struct drm_encoder *encoder;
 	struct drm_crtc *crtc;
+	struct drm_master *master = NULL;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
@@ -289,13 +291,16 @@ int drm_mode_getencoder(struct drm_device *dev, void *data,
 	if (!encoder)
 		return -ENOENT;
 
+	master = drm_file_get_master(file_priv);
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
 	crtc = drm_encoder_get_crtc(encoder);
-	if (crtc && drm_lease_held(file_priv, crtc->base.id))
+	if (crtc && drm_lease_held_master(master, crtc->base.id))
 		enc_resp->crtc_id = crtc->base.id;
 	else
 		enc_resp->crtc_id = 0;
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+	if (master)
+		drm_master_put(&master);
 
 	enc_resp->encoder_type = encoder->encoder_type;
 	enc_resp->encoder_id = encoder->base.id;
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 07f5abc875e9..9c1db91b150d 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -887,7 +887,7 @@ struct drm_framebuffer *drm_framebuffer_lookup(struct drm_device *dev,
 	struct drm_mode_object *obj;
 	struct drm_framebuffer *fb = NULL;
 
-	obj = __drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_FB);
+	obj = drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_FB);
 	if (obj)
 		fb = obj_to_fb(obj);
 	return fb;
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index bed6f7636cbe..4d434ee6730d 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -85,7 +85,7 @@ _drm_find_lessee(struct drm_master *master, int lessee_id)
 	return idr_find(&drm_lease_owner(master)->lessee_idr, lessee_id);
 }
 
-static int _drm_lease_held_master(struct drm_master *master, int id)
+bool _drm_lease_held_master(struct drm_master *master, int id)
 {
 	lockdep_assert_held(&master->dev->mode_config.idr_mutex);
 	if (master->lessor)
@@ -105,20 +105,16 @@ static bool _drm_has_leased(struct drm_master *master, int id)
 	return false;
 }
 
-/* Called with idr_mutex held */
-bool _drm_lease_held(struct drm_file *file_priv, int id)
+bool drm_lease_held_master(struct drm_master *master, int id)
 {
 	bool ret;
-	struct drm_master *master;
 
-	if (!file_priv)
+	if (!master || !master->lessor)
 		return true;
 
-	master = drm_file_get_master(file_priv);
-	if (!master)
-		return true;
+	mutex_lock(&master->dev->mode_config.idr_mutex);
 	ret = _drm_lease_held_master(master, id);
-	drm_master_put(&master);
+	mutex_unlock(&master->dev->mode_config.idr_mutex);
 
 	return ret;
 }
@@ -128,22 +124,11 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
 	struct drm_master *master;
 	bool ret;
 
-	if (!file_priv)
-		return true;
-
 	master = drm_file_get_master(file_priv);
-	if (!master)
-		return true;
-	if (!master->lessor) {
-		ret = true;
-		goto out;
-	}
-	mutex_lock(&master->dev->mode_config.idr_mutex);
-	ret = _drm_lease_held_master(master, id);
-	mutex_unlock(&master->dev->mode_config.idr_mutex);
+	ret = drm_lease_held_master(master, id);
+	if (master)
+		drm_master_put(&master);
 
-out:
-	drm_master_put(&master);
 	return ret;
 }
 
@@ -159,9 +144,6 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 	int count_in, count_out;
 	uint32_t crtcs_out = 0;
 
-	if (!file_priv)
-		return crtcs_in;
-
 	master = drm_file_get_master(file_priv);
 	if (!master)
 		return crtcs_in;
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index 86d9e907c0b2..911f658a8ffc 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -139,6 +139,7 @@ struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
 {
 	struct drm_mode_object *obj = NULL;
 
+	lockdep_assert_held_once(&dev->master_rwsem);
 	mutex_lock(&dev->mode_config.idr_mutex);
 	obj = idr_find(&dev->mode_config.object_idr, id);
 	if (obj && type != DRM_MODE_OBJECT_ANY && obj->type != type)
@@ -146,9 +147,11 @@ struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
 	if (obj && obj->id != id)
 		obj = NULL;
 
-	if (obj && drm_mode_object_lease_required(obj->type) &&
-	    !_drm_lease_held(file_priv, obj->id))
-		obj = NULL;
+	if (obj && drm_mode_object_lease_required(obj->type)) {
+		if (file_priv && file_priv->master &&
+		    !_drm_lease_held_master(file_priv->master, obj->id))
+			obj = NULL;
+	}
 
 	if (obj && obj->free_cb) {
 		if (!kref_get_unless_zero(&obj->refcount))
@@ -176,7 +179,9 @@ struct drm_mode_object *drm_mode_object_find(struct drm_device *dev,
 {
 	struct drm_mode_object *obj = NULL;
 
+	down_read(&dev->master_rwsem);
 	obj = __drm_mode_object_find(dev, file_priv, id, type);
+	up_read(&dev->master_rwsem);
 	return obj;
 }
 EXPORT_SYMBOL(drm_mode_object_find);
@@ -408,9 +413,12 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
+	down_read(&dev->master_rwsem);
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
-	obj = drm_mode_object_find(dev, file_priv, arg->obj_id, arg->obj_type);
+	obj = __drm_mode_object_find(dev, file_priv, arg->obj_id,
+				     arg->obj_type);
+	up_read(&dev->master_rwsem);
 	if (!obj) {
 		ret = -ENOENT;
 		goto out;
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 82afb854141b..90f056169331 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_auth.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
@@ -687,6 +688,7 @@ int drm_mode_getplane(struct drm_device *dev, void *data,
 	struct drm_mode_get_plane *plane_resp = data;
 	struct drm_plane *plane;
 	uint32_t __user *format_ptr;
+	struct drm_master *master = NULL;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
@@ -695,10 +697,13 @@ int drm_mode_getplane(struct drm_device *dev, void *data,
 	if (!plane)
 		return -ENOENT;
 
+	master = drm_file_get_master(file_priv);
 	drm_modeset_lock(&plane->mutex, NULL);
-	if (plane->state && plane->state->crtc && drm_lease_held(file_priv, plane->state->crtc->base.id))
+	if (plane->state && plane->state->crtc &&
+	    drm_lease_held_master(master, plane->state->crtc->base.id))
 		plane_resp->crtc_id = plane->state->crtc->base.id;
-	else if (!plane->state && plane->crtc && drm_lease_held(file_priv, plane->crtc->base.id))
+	else if (!plane->state && plane->crtc &&
+		 drm_lease_held_master(master, plane->crtc->base.id))
 		plane_resp->crtc_id = plane->crtc->base.id;
 	else
 		plane_resp->crtc_id = 0;
@@ -710,6 +715,8 @@ int drm_mode_getplane(struct drm_device *dev, void *data,
 	else
 		plane_resp->fb_id = 0;
 	drm_modeset_unlock(&plane->mutex);
+	if (master)
+		drm_master_put(&master);
 
 	plane_resp->plane_id = plane->base.id;
 	plane_resp->possible_crtcs = drm_lease_filter_crtcs(file_priv,
@@ -1100,6 +1107,7 @@ static int drm_mode_cursor_common(struct drm_device *dev,
 {
 	struct drm_crtc *crtc;
 	struct drm_modeset_acquire_ctx ctx;
+	struct drm_master *master = NULL;
 	int ret = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
@@ -1114,6 +1122,7 @@ static int drm_mode_cursor_common(struct drm_device *dev,
 		return -ENOENT;
 	}
 
+	master = drm_file_get_master(file_priv);
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 retry:
 	ret = drm_modeset_lock(&crtc->mutex, &ctx);
@@ -1128,7 +1137,7 @@ static int drm_mode_cursor_common(struct drm_device *dev,
 		if (ret)
 			goto out;
 
-		if (!drm_lease_held(file_priv, crtc->cursor->base.id)) {
+		if (!drm_lease_held_master(master, crtc->cursor->base.id)) {
 			ret = -EACCES;
 			goto out;
 		}
@@ -1168,6 +1177,8 @@ static int drm_mode_cursor_common(struct drm_device *dev,
 
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
+	if (master)
+		drm_master_put(&master);
 
 	return ret;
 
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 6c353c9dc772..9f04dcb81d07 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -656,7 +656,7 @@ struct drm_property_blob *drm_property_lookup_blob(struct drm_device *dev,
 	struct drm_mode_object *obj;
 	struct drm_property_blob *blob = NULL;
 
-	obj = __drm_mode_object_find(dev, NULL, id, DRM_MODE_OBJECT_BLOB);
+	obj = drm_mode_object_find(dev, NULL, id, DRM_MODE_OBJECT_BLOB);
 	if (obj)
 		blob = obj_to_blob(obj);
 	return blob;
@@ -919,8 +919,8 @@ bool drm_property_change_valid_get(struct drm_property *property,
 		if (value == 0)
 			return true;
 
-		*ref = __drm_mode_object_find(property->dev, NULL, value,
-					      property->values[0]);
+		*ref = drm_mode_object_find(property->dev, NULL, value,
+					    property->values[0]);
 		return *ref != NULL;
 	}
 
diff --git a/include/drm/drm_lease.h b/include/drm/drm_lease.h
index 5c9ef6a2aeae..62d9de6ecada 100644
--- a/include/drm/drm_lease.h
+++ b/include/drm/drm_lease.h
@@ -16,7 +16,9 @@ void drm_lease_destroy(struct drm_master *lessee);
 
 bool drm_lease_held(struct drm_file *file_priv, int id);
 
-bool _drm_lease_held(struct drm_file *file_priv, int id);
+bool _drm_lease_held_master(struct drm_master *master, int id);
+
+bool drm_lease_held_master(struct drm_master *master, int id);
 
 void drm_lease_revoke(struct drm_master *master);
 
-- 
2.25.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
