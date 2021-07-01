Return-Path: <SRS0=5SPK=LZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCEBC11F6C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 16:54:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA098613FB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 16:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA098613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B1D783C2A;
	Thu,  1 Jul 2021 16:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uwt1ScQFH8rL; Thu,  1 Jul 2021 16:54:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9F74483C29;
	Thu,  1 Jul 2021 16:54:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BE40C0010;
	Thu,  1 Jul 2021 16:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C576BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 16:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A68D5400F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 16:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7fL6JfV0Btl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 16:54:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 050B8400E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 16:54:47 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id g21so6405439pfc.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Jul 2021 09:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtdxbqSeV/2csKmNSvUS45gYT6/rPtvycxiemXQFqoE=;
 b=beHRMuc24lHXasbRdKRDNS6aTDyIugj8sUzTKr2eEW+qWKPqqi3KWacrdE0QS/QoG0
 uqEXXfqmxcMCBnDnffQC2FkpcxwXIBBxibZQOYhnOXncI5/Rc8FXjLz9l9PwPHH2iQ9l
 LpMhtimOJpvhODJbfnhRoicACZnkaF+y+9BK4kO+14Bw6WmZeVFmLLmN+Z4WSD3/lFeb
 16dqF7RxxdReZLPDhBWlAv5HQ3fkbsAQFuSg0tkOtJdXM4o3zBziNk26dE+v85gBV8Au
 Zdcv2R70XOt4pjLJ1VPEnBoU9MiG6BEzgDGxUC5P08t80hhiPqsuC1bDTyckyEblS3Yd
 g5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtdxbqSeV/2csKmNSvUS45gYT6/rPtvycxiemXQFqoE=;
 b=QWZtXqoQdcUMPSii8eiB9Rrkt+WgAg2TiSCf/YoX6a2dEeuiTYigSmpC1qhKXN7z+w
 dzET+65yAnDjYTbnxeEJxT2Qe24c0PpghNgPSP4LVlHHFTNtld5kDaBWMtgpRSSDbgwq
 CIACTqE7Jo/SXdp0T/XM9aEyuH2fVRbSYzVUglCaM4RMItLlDpHUoZWCxSqPIyiQzJWO
 NoyVYyk6scqz6hnyBdRe07CTEDi8XV6h33KmFYpKv5d1qkt3k6l2oHlCKQZYFoj4S8WY
 Bfcr4D6kA1cTrFlAVTRusa3dxQJvIWI2PTxjJCv4IlO3cn9WTAKMs8KxhupNdekght2I
 rY9Q==
X-Gm-Message-State: AOAM53286wChfJW9RhIf350bF2nv//uMAV6iAxI+/bRCNQJSVLtDqdyP
 AUHChHhp3R2GLxNhjf5CiIc=
X-Google-Smtp-Source: ABdhPJzMfvlwjsGsSNrV3D8bUwQtMWd3aUbOVXuVu70zAOCZMlf8NcIq+j9ejdz5XIkAecpW/kVAOA==
X-Received: by 2002:a05:6a00:2162:b029:308:9346:2f55 with SMTP id
 r2-20020a056a002162b029030893462f55mr624241pff.49.1625158487473; 
 Thu, 01 Jul 2021 09:54:47 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id s20sm398738pgv.1.2021.07.01.09.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 09:54:47 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v7 3/5] drm: add a locked version of drm_is_current_master
Date: Fri,  2 Jul 2021 00:53:56 +0800
Message-Id: <20210701165358.19053-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701165358.19053-1-desmondcheongzx@gmail.com>
References: <20210701165358.19053-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
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

While checking the master status of the DRM file in
drm_is_current_master(), the device's master mutex should be
held. Without the mutex, the pointer fpriv->master may be freed
concurrently by another process calling drm_setmaster_ioctl(). This
could lead to use-after-free errors when the pointer is subsequently
dereferenced in drm_lease_owner().

The callers of drm_is_current_master() from drm_auth.c hold the
device's master mutex, but external callers do not. Hence, we implement
drm_is_current_master_locked() to be used within drm_auth.c, and
modify drm_is_current_master() to grab the device's master mutex
before checking the master status.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 51 ++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f00e5abdbbf4..ab1863c5a5a0 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -61,6 +61,35 @@
  * trusted clients.
  */
 
+static bool drm_is_current_master_locked(struct drm_file *fpriv)
+{
+	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
+
+	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+}
+
+/**
+ * drm_is_current_master - checks whether @priv is the current master
+ * @fpriv: DRM file private
+ *
+ * Checks whether @fpriv is current master on its device. This decides whether a
+ * client is allowed to run DRM_MASTER IOCTLs.
+ *
+ * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
+ * - the current master is assumed to own the non-shareable display hardware.
+ */
+bool drm_is_current_master(struct drm_file *fpriv)
+{
+	bool ret;
+
+	mutex_lock(&fpriv->minor->dev->master_mutex);
+	ret = drm_is_current_master_locked(fpriv);
+	mutex_unlock(&fpriv->minor->dev->master_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_is_current_master);
+
 int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct drm_auth *auth = data;
@@ -223,7 +252,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	if (drm_is_current_master(file_priv))
+	if (drm_is_current_master_locked(file_priv))
 		goto out_unlock;
 
 	if (dev->master) {
@@ -272,7 +301,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 	if (ret)
 		goto out_unlock;
 
-	if (!drm_is_current_master(file_priv)) {
+	if (!drm_is_current_master_locked(file_priv)) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
@@ -321,7 +350,7 @@ void drm_master_release(struct drm_file *file_priv)
 	if (file_priv->magic)
 		idr_remove(&file_priv->master->magic_map, file_priv->magic);
 
-	if (!drm_is_current_master(file_priv))
+	if (!drm_is_current_master_locked(file_priv))
 		goto out;
 
 	drm_legacy_lock_master_cleanup(dev, master);
@@ -342,22 +371,6 @@ void drm_master_release(struct drm_file *file_priv)
 	mutex_unlock(&dev->master_mutex);
 }
 
-/**
- * drm_is_current_master - checks whether @priv is the current master
- * @fpriv: DRM file private
- *
- * Checks whether @fpriv is current master on its device. This decides whether a
- * client is allowed to run DRM_MASTER IOCTLs.
- *
- * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
- * - the current master is assumed to own the non-shareable display hardware.
- */
-bool drm_is_current_master(struct drm_file *fpriv)
-{
-	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
-}
-EXPORT_SYMBOL(drm_is_current_master);
-
 /**
  * drm_master_get - reference a master pointer
  * @master: &struct drm_master
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
