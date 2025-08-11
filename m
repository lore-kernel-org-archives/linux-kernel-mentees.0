Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFEC260583
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 05:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754891126; cv=none; b=SChshnnzfjt8CWT0mqpPlT6sFYIFbKcxZPemfapgKRUmPbovrR2kGW5G/U4uFZkMF/j1G5XYC6vuqSFemg+7xjbqj/Av/BXVqNP7pzBig7A2+VDVeEXnKFXxXn8ODipwGTnX/HuADIoVF8V4D1N1/BKj+SDhZLLt2BRsxcYOCHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754891126; c=relaxed/simple;
	bh=UVGowK4VGDbNTdcg1OrwPZcSwbr78Z/2wjqAenselDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ApUFlbxns7AuQomNcuiBACAdOLekCVKRJu6laRvpYMj+SX9VyX4vTq42OOHUQjwXKhP1U6bEJOMBU8Lf/7IaH1ldhxWDR6xBqeHnEjIW3exTU2AUfvTeW8+SverDHjR6dIzTuUrEN/P3kxGGhYYyP35A3DRG/Ckn7sY2MEKaamU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCBYgqGg; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCBYgqGg"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-242d8dff9deso12922365ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 10 Aug 2025 22:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754891124; x=1755495924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k+SbwLGlkzo48QtnyEGdu0tVgjZp6bv0qkAFAWLUh5M=;
        b=iCBYgqGg5TmPse++4WteZrcpL+fi0UAMO6dA9G3IHJs/IhMyu0e1g9OwZv1b/F6iXm
         IZlxmWm3yhUUzI30tpaqCOjM5MH6esTiHJOBbagcuZIFnXg6I1Mig7t5mS2VyudaETwq
         tyUyo08+y7utcCEJzVJD2rQ9sQW43SM+x2yoPnyyb3kpMwtaHGv5hHwlKEEFX4JYJBq8
         YPbbhj3ZudSO4qUjUbGxuoNCxQfKHFi3DSWw1QCREIEAgkuiMxTmSxVSX0KAQ0rX1UMZ
         rPXL8/A5951S8GrVShI/cnRt0Qa4q8kc5PvkAmSmARie92aW2NdC9ztqmYyltULRRrGH
         vECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754891124; x=1755495924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+SbwLGlkzo48QtnyEGdu0tVgjZp6bv0qkAFAWLUh5M=;
        b=K5LAlORK60kGW8//XHBFW4b9VdOkBDEuzYks2GMiiJrE72JYP4Q9l0/QUuJS+CN88R
         d7gnHDZZRm1TROcOKL/pWwr0Ts4PGUvyCsrAABH2/aOQEAIyRrgwX4H8ThcBsXbuS2Ox
         x5UD8nxMSb4vKbFHLk+D6lOIDFdGBpKArcwEojgNBRBnl0CPO7qLQ4t2oYwapG04HaRG
         F/pdQ5WK6bGBkbmNLDg2NJ0mQumzFdSVSLYhoEb2ZQ9sZxIEDDkqIMncJr+SWvQb3Z+x
         5KWv5F0iKISBpGFbXMXfil7/TofdUjTuzwvQTMAuMMhfs+To7mJtYoTx9jwBhLkzLWaP
         SNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO/degm+6m5A3PnUsHXeGBdaYzggaC6TgnQZesk6Sl/hbE0kfX0qK8DjP3jvfKtqgbYMO8Ypqirzm74K4bREO2MsfYIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDj/pPbd3HlcAkpu77HXrRFf5MVB9uAAPxJiXCjXQxz04+LKPP
	ZfcB3AXUavox8z2Ij6yLh3VRe3yylZFSENrR/GJd5ZIppTJq4DoxkGrN
X-Gm-Gg: ASbGnct+tZ1cNAhpRHF9tRApO6upJUNXhIsB05Dy6rmIBnnHqOajFB+P5pTDZ77zl3M
	byId4ElzStFZdGjtc/e75i9HHC1Vi3tvl7pnThacqinaBWKroO5GxiBciCyd4tIVY4xKRwbEQBu
	vi03g97POElAQ2LBoH3imK6RjQ+K3Wl2VREMBzN6kFlvq1pYIjXUhCNqREvfb6Go6XpL+o6wxRi
	6VmY7dMOfohrTKIM2qB/MOYx7KQPZFzsZ6/TWCsf6n22+YgqJjDfUWdqXEXSB0aiTCRybh7AynB
	K6LG2sGBNACMyi3OGSTHyEgr+9qC0XMpmN0TgnqFEbopVbI35bFCUY3M/RaVQpUJFzHD6LVc9/F
	F4n40LSwwKuDsWODj5ZsaXzh/igVFNlgH95ul
X-Google-Smtp-Source: AGHT+IExwAT9Sif1a2vkzk3Xy0KYiI6G1iRI9mcV03pG4buJeritwA3KFQH/LWMzNVpt++ddECdstA==
X-Received: by 2002:a17:902:e5ca:b0:240:9f9:46b1 with SMTP id d9443c01a7336-242c21df7ccmr155670745ad.37.1754891124095;
        Sun, 10 Aug 2025 22:45:24 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89a3acfsm262957025ad.146.2025.08.10.22.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 22:45:23 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com
Subject: [PATCH] drm/komeda: Convert logging in komeda_crtc.c to drm_* with drm_device parameter
Date: Mon, 11 Aug 2025 11:14:59 +0530
Message-ID: <20250811054459.15851-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO()
calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the
corresponding drm_err(), drm_warn(), and drm_info() helpers.

The new drm_*() logging functions take a struct drm_device * as the
first argument. This allows the DRM core to prefix log messages with
the specific DRM device name and instance, which is essential for
distinguishing logs when multiple GPUs or display controllers are present.

This change aligns komeda with the DRM TODO item: "Convert logging to
drm_* functions with drm_device parameter".

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 37 +++++++++++--------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 2ad33559a33a..b50ce3653ff6 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -111,6 +111,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,
 static int
 komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 {
+	struct drm_device *drm = kcrtc->base.dev;
 	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
 	struct komeda_pipeline *master = kcrtc->master;
 	struct komeda_crtc_state *kcrtc_st = to_kcrtc_st(kcrtc->base.state);
@@ -128,8 +129,8 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 
 	err = mdev->funcs->change_opmode(mdev, new_mode);
 	if (err) {
-		DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
-			  mdev->dpmode, new_mode);
+		drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
+			mdev->dpmode, new_mode);
 		goto unlock;
 	}
 
@@ -142,18 +143,18 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 	if (new_mode != KOMEDA_MODE_DUAL_DISP) {
 		err = clk_set_rate(mdev->aclk, komeda_crtc_get_aclk(kcrtc_st));
 		if (err)
-			DRM_ERROR("failed to set aclk.\n");
+			drm_err(drm, "failed to set aclk.\n");
 		err = clk_prepare_enable(mdev->aclk);
 		if (err)
-			DRM_ERROR("failed to enable aclk.\n");
+			drm_err(drm, "failed to enable aclk.\n");
 	}
 
 	err = clk_set_rate(master->pxlclk, mode->crtc_clock * 1000);
 	if (err)
-		DRM_ERROR("failed to set pxlclk for pipe%d\n", master->id);
+		drm_err(drm, "failed to set pxlclk for pipe%d\n", master->id);
 	err = clk_prepare_enable(master->pxlclk);
 	if (err)
-		DRM_ERROR("failed to enable pxl clk for pipe%d.\n", master->id);
+		drm_err(drm, "failed to enable pxl clk for pipe%d.\n", master->id);
 
 unlock:
 	mutex_unlock(&mdev->lock);
@@ -164,6 +165,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 static int
 komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
 {
+	struct drm_device *drm = kcrtc->base.dev;
 	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
 	struct komeda_pipeline *master = kcrtc->master;
 	u32 new_mode;
@@ -180,8 +182,8 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
 
 	err = mdev->funcs->change_opmode(mdev, new_mode);
 	if (err) {
-		DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
-			  mdev->dpmode, new_mode);
+		drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
+			mdev->dpmode, new_mode);
 		goto unlock;
 	}
 
@@ -200,6 +202,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
 void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 			      struct komeda_events *evts)
 {
+	struct drm_device *drm = kcrtc->base.dev;
 	struct drm_crtc *crtc = &kcrtc->base;
 	u32 events = evts->pipes[kcrtc->master->id];
 
@@ -212,7 +215,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 		if (wb_conn)
 			drm_writeback_signal_completion(&wb_conn->base, 0);
 		else
-			DRM_WARN("CRTC[%d]: EOW happen but no wb_connector.\n",
+			drm_warn(drm, "CRTC[%d]: EOW happen but no wb_connector.\n",
 				 drm_crtc_index(&kcrtc->base));
 	}
 	/* will handle it together with the write back support */
@@ -236,7 +239,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 			crtc->state->event = NULL;
 			drm_crtc_send_vblank_event(crtc, event);
 		} else {
-			DRM_WARN("CRTC[%d]: FLIP happened but no pending commit.\n",
+			drm_warn(drm, "CRTC[%d]: FLIP happened but no pending commit.\n",
 				 drm_crtc_index(&kcrtc->base));
 		}
 		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
@@ -309,7 +312,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
 
 	/* wait the flip take affect.*/
 	if (wait_for_completion_timeout(flip_done, HZ) == 0) {
-		DRM_ERROR("wait pipe%d flip done timeout\n", kcrtc->master->id);
+		drm_err(drm, "wait pipe%d flip done timeout\n", kcrtc->master->id);
 		if (!input_flip_done) {
 			unsigned long flags;
 
@@ -562,6 +565,7 @@ static const struct drm_crtc_funcs komeda_crtc_funcs = {
 int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
 			   struct komeda_dev *mdev)
 {
+	struct drm_device *drm = &kms->base;
 	struct komeda_crtc *crtc;
 	struct komeda_pipeline *master;
 	char str[16];
@@ -581,7 +585,7 @@ int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
 		else
 			sprintf(str, "None");
 
-		DRM_INFO("CRTC-%d: master(pipe-%d) slave(%s).\n",
+		drm_info(drm, "CRTC-%d: master(pipe-%d) slave(%s).\n",
 			 kms->n_crtcs, master->id, str);
 
 		kms->n_crtcs++;
@@ -609,10 +613,11 @@ get_crtc_primary(struct komeda_kms_dev *kms, struct komeda_crtc *crtc)
 	return NULL;
 }
 
-static int komeda_attach_bridge(struct device *dev,
-				struct komeda_pipeline *pipe,
+static int komeda_attach_bridge(struct komeda_pipeline *pipe,
 				struct drm_encoder *encoder)
 {
+	struct drm_device *drm = pipe->mdev->drm;
+	struct device *dev = drm->dev;
 	struct drm_bridge *bridge;
 	int err;
 
@@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev,
 
 	err = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (err)
-		dev_err(dev, "bridge_attach() failed for pipe: %s\n",
+		drm_err(drm, "bridge_attach() failed for pipe: %s\n",
 			of_node_full_name(pipe->of_node));
 
 	return err;
@@ -658,7 +663,7 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
 		return err;
 
 	if (pipe->of_output_links[0]) {
-		err = komeda_attach_bridge(base->dev, pipe, encoder);
+		err = komeda_attach_bridge(pipe, encoder);
 		if (err)
 			return err;
 	}
-- 
2.43.0

