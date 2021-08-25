Return-Path: <SRS0=ojZq=NQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2749C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Aug 2021 14:23:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F2861073
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Aug 2021 14:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1F2861073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83CE0823DD;
	Wed, 25 Aug 2021 14:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUrAFpAOW6Xk; Wed, 25 Aug 2021 14:23:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A4E2882538;
	Wed, 25 Aug 2021 14:23:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91BD0C0010;
	Wed, 25 Aug 2021 14:23:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C721C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EF0482538
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sr9MTuq5oDlx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 14:23:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C06C823DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 14:23:38 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso4285261pjh.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Aug 2021 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uk23yrQj2bYGx5iUQvrvtVaf8WaEKXc6e3h1Qpr0Wxc=;
 b=TVtTp34aCJBzvJ6goeHuIpGYFT2j35xmSVarMK07LV6ssbq6N3Xr3jKAtfwrGbNUJ8
 8KaG/5k0Qk42WlpPCz1Kj51f/hGs4iFfkI7x3d7A0jYCEWm76X1B519CZqXInYNjbYat
 ab+RXSwXTlaQgaOuo21amm9/um2xZwXHg21kqAL7rcVv+J5ez020+0WMZGH7j2GQzGaN
 uibeXX/a1bPEFkgni9Fs2+und/mvkX/EBrti6qDlmoSWEx1zprLl5ANdl4l1w/8d37Qk
 RKVyYSHgQTw0cZ1B+cXkZC9tb71uNiT4fqQas8LIc7cikgXcJAHIJbSLJGgoZiVWz6Uz
 X++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uk23yrQj2bYGx5iUQvrvtVaf8WaEKXc6e3h1Qpr0Wxc=;
 b=dzIjtYMz06eha1sUzkmRyCp58rcn/NLeMgWHD1iX/HoLFYYX8FSLeYAwxt5jmHF5cs
 Hu+LaOZxmyc78VV/TAXz0kKPXd1+/bGARLWja/ESzFUHmOgfROVNro11F0YNgtsAHTJ4
 P2ncWcZquedEX80LBqPpsA8e7Gxb4eVxuSKQuvyEyfyQb19XfINai5ebg1+Puq6m+veg
 05Ua43RWh1Gka0F+NxCSHo3zNHflO5a3+go46iMt2izivF7olt+/nCux3OE54CacFUKP
 p0tlM4veAmVB69Z28LfuzngJfeiMk6+URqU1Zm/tyv7bXsDXXP4/IR66mso7Lv8yWyOB
 SshA==
X-Gm-Message-State: AOAM532p7i/EgHju4dDg4hf+KqEKfJAbJ0+llzCDnbU0/6mMihLnM8VV
 eoL+cXoDMfYcfbswcmRdl1drVSj80Us51A2IkkM=
X-Google-Smtp-Source: ABdhPJx0LuHw9kG8Ds3EmRpX0tdK6PcJPWFO85WfC1runceWmlOp/tS8E3VLMU9luMfPHEsE7LnC6A==
X-Received: by 2002:a17:90a:c481:: with SMTP id
 j1mr10895311pjt.164.1629901418017; 
 Wed, 25 Aug 2021 07:23:38 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id n3sm54431pfo.101.2021.08.25.07.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 07:23:37 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com
Subject: [PATCH v7 6/7] drm: avoid circular locks with modeset_mutex and
 master_rwsem
Date: Wed, 25 Aug 2021 22:22:04 +0800
Message-Id: <20210825142205.1376789-7-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825142205.1376789-1-desmondcheongzx@gmail.com>
References: <20210825142205.1376789-1-desmondcheongzx@gmail.com>
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

drm_lease_held calls drm_file_get_master. However, this function is
sometimes called while holding on to modeset_mutex. Since
drm_device.master_rwsem will replace drm_file.master_lookup_lock in
drm_file_get_master in a future patch, this inverts the master_rwsem
--> modeset_mutex lock hierarchy.

To fix this, we create a new drm_lease_held_master helper function
that enables us to avoid calling drm_file_get_master after locking
modeset_mutex.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c    |  3 +++
 drivers/gpu/drm/drm_encoder.c |  7 ++++++-
 drivers/gpu/drm/drm_lease.c   | 30 +++++++++++++++---------------
 drivers/gpu/drm/drm_plane.c   | 14 +++++++++++---
 include/drm/drm_lease.h       |  2 ++
 5 files changed, 37 insertions(+), 19 deletions(-)

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
index 72e982323a5e..bacb2f6a325c 100644
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
+	struct drm_master *master;
 
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
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 1b156c85d1c8..15bf3a3c76d1 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -114,27 +114,30 @@ bool _drm_lease_held(struct drm_file *file_priv, int id)
 	return _drm_lease_held_master(file_priv->master, id);
 }
 
-bool drm_lease_held(struct drm_file *file_priv, int id)
+bool drm_lease_held_master(struct drm_master *master, int id)
 {
-	struct drm_master *master;
 	bool ret;
 
-	if (!file_priv)
+	if (!master || !master->lessor)
 		return true;
 
-	master = drm_file_get_master(file_priv);
-	if (!master)
-		return true;
-	if (!master->lessor) {
-		ret = true;
-		goto out;
-	}
 	mutex_lock(&master->dev->mode_config.idr_mutex);
 	ret = _drm_lease_held_master(master, id);
 	mutex_unlock(&master->dev->mode_config.idr_mutex);
 
-out:
-	drm_master_put(&master);
+	return ret;
+}
+
+bool drm_lease_held(struct drm_file *file_priv, int id)
+{
+	struct drm_master *master;
+	bool ret;
+
+	master = drm_file_get_master(file_priv);
+	ret = drm_lease_held_master(master, id);
+	if (master)
+		drm_master_put(&master);
+
 	return ret;
 }
 
@@ -150,9 +153,6 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 	int count_in, count_out;
 	uint32_t crtcs_out = 0;
 
-	if (!file_priv)
-		return crtcs_in;
-
 	master = drm_file_get_master(file_priv);
 	if (!master)
 		return crtcs_in;
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index b5566167a798..af9f65bf74d4 100644
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
+	struct drm_master *master;
 
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
@@ -1114,6 +1121,7 @@ static int drm_mode_cursor_common(struct drm_device *dev,
 		return -ENOENT;
 	}
 
+	lockdep_assert_held_once(&dev->master_rwsem);
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 retry:
 	ret = drm_modeset_lock(&crtc->mutex, &ctx);
@@ -1128,7 +1136,7 @@ static int drm_mode_cursor_common(struct drm_device *dev,
 		if (ret)
 			goto out;
 
-		if (!drm_lease_held(file_priv, crtc->cursor->base.id)) {
+		if (file_priv && !drm_lease_held_master(file_priv->master, crtc->cursor->base.id)) {
 			ret = -EACCES;
 			goto out;
 		}
diff --git a/include/drm/drm_lease.h b/include/drm/drm_lease.h
index 5c9ef6a2aeae..426ea86d3c6a 100644
--- a/include/drm/drm_lease.h
+++ b/include/drm/drm_lease.h
@@ -18,6 +18,8 @@ bool drm_lease_held(struct drm_file *file_priv, int id);
 
 bool _drm_lease_held(struct drm_file *file_priv, int id);
 
+bool drm_lease_held_master(struct drm_master *master, int id);
+
 void drm_lease_revoke(struct drm_master *master);
 
 uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
