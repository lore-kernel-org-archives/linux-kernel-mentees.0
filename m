Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BD4261B71
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758879034; cv=none; b=lpUUNVozJcZpBhaeswOweUf1LS+Gv8QbT2IXpBSArlThv4tSr30TpDjIfz28szCd0DUexoIxliO3DKgJdDCnghaYYGAVlwUCzdbjtzWVPwfXm77hZpDJbltmmaPPjKIe6kgn8MH4z7gmCP6ZovM/oJyQZKBVyXa2yjnml9o0djw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758879034; c=relaxed/simple;
	bh=jsaDXrvFd+opyQe9qY5lje0lqnMdfeVW1SeWz23pFVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2Zav+8bBp3nYX7ryTTAM1R5EPp99otkTTqD8IBicEUEInnSDxFtgZyLTSAl70aun6LQ8OwdnNtt3XHJoJD0/GMvKf+OqHIsZdV166qG184+l98WT3m/EBMdQCuc9x2VeLJesEIMBMVQ7OXFRpKE7D8Co+uiyJaeP45aLqpe61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWld5J3F; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWld5J3F"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b555ab7fabaso1847356a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758879031; x=1759483831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xIrcfuajKloRdvJjcJcWDV/tHO/j0RB4pp+HMPl3L4g=;
        b=iWld5J3FTpOLLB51eKShOhfRn1BaDOg09i+TxzC3/jAtVqERodTtdme7fv25wcPGOg
         6Lh1VW/w5TsZtqhbm0zpVFP3Qwct0UY2HLiZXu2fOMIl/OgUCPyhPtTcPpIA8d5+Fw+Y
         iqZWiHxhiel4/7Mzjfp0i1RtxIGSCUId1JCK3j7RL33cCqWPs5kwN45Mha1sD/rHgmkJ
         GOJ6aOVqwp1B8NicT3fJGMMS3SR5ruYzivPVjw96HhPpkfvsB1lNGl7/tsCjY+OBZ6MN
         FFhmRpWElvchlx6H2g1Jynd6pZSiwf7raZHXuJ2NhsehPOdszJ9EJZ1HPVOnQImLft76
         fEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879031; x=1759483831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIrcfuajKloRdvJjcJcWDV/tHO/j0RB4pp+HMPl3L4g=;
        b=maelUq5a0FhkdcWOncKEspxiamkiyoUk51Hm4hDy8GJIbwsBeZ5UGr88cjBN0eqqEU
         ZLiJdocp/zait8DpWdUsVpqH1I4JAGgrsFwhzILubXujMvmP+Ql3gQmmpmVUwl2Wmozm
         S5ObnnhtQKZ8ubeedw13oUHMfCM4/zrvPBxzpyFmE45987mBBh5nymCCyKHOqkAyBLFO
         42x0Iu3w/YtXbLgVa+dKJwiZqlY9MOLG3+BF3zphurc5bxVb0jq/7+GDz1qGknDHlN7L
         GpdiEnVBgJaFTIJa+1zVIVqjcZhGXCKrGtgx9rwIQd1R1HVZQuoI69ckCyFJbdAwKSry
         /Idg==
X-Forwarded-Encrypted: i=1; AJvYcCWGV9eke18sgGIsaiNvnoKftwb8bzR445+4/93GXA+QsPC9g6t/xO7MB467cYH/7d0b+fbQRRvIqG/NV4I4+8LBVtwo9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlZ4OtaklnLdGMet99S90cRfgWzObaYE5WU5wCZ3vvZ6Twq0RN
	YLM1YlrxL5Unbtp5SUVAPw7X1nDME0rRSTfLp9mXZEd5pySmVuT26570
X-Gm-Gg: ASbGncueSQ9a++Dq7S7jXoqWWav8K3sD9x27AC+f4W4UWcxLkZQwkEwkNFYW8Xeotss
	Vt3eA4TBIO0StZOH7pAcjcCUSDDEQFhVm6ySdiICTjkfKigPOssNGQQ2oGPBj6P5V9ybfDpKgUC
	sEmFswg/UPZPZZ8SppytpfQj1haA2vO53Fh+KgOK09dcLbYaCtOuLLcrrlUVQHVTGft5PtDSWQk
	DQMNr3/RNjFPmy7qZAoA1bNAZyoDvk9p7Hvd4xdJwH1ejfHdxYpXLOPpcv1+m3z9kzjYqciePII
	zJhWu/7Fvo7pqEI+l22UNaChQE3DFhZnBKi7HfZyqlJeSS3TBtRAdaerRKXzjrUeYViLmpnGKss
	lTua0KHhcmFj8D/SUedtJMYSqAnDIK8jiXZ6MFdY+e/5kPqw=
X-Google-Smtp-Source: AGHT+IFh/+YHDIq4RGXYffEQZgqis2V02Xt7mq2qDUgh7Tj46rZmWeOaWQ9Ju5fqSzoyMvNSy1QcEA==
X-Received: by 2002:a05:6a20:9150:b0:249:d3d:a4d4 with SMTP id adf61e73a8af0-2e7c7ea3a75mr8452854637.26.1758879031332;
        Fri, 26 Sep 2025 02:30:31 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238b19dsm4048646b3a.10.2025.09.26.02.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 02:30:31 -0700 (PDT)
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
Subject: [PATCH v3] drm/komeda: Convert logging in komeda_crtc.c to drm_* with drm_device parameter
Date: Fri, 26 Sep 2025 15:00:08 +0530
Message-ID: <20250926093008.1949131-1-rk0006818@gmail.com>
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
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
Changes since v2:
- Added Reviewed-by tag from Liviu Dudau

Link to v1:
https://lore.kernel.org/all/aJshoswGslcYQFLI@e110455-lin.cambridge.arm.com/
---
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 31 +++++++++++--------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 2ad33559a33a..5a66948ffd24 100644
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
@@ -613,6 +617,7 @@ static int komeda_attach_bridge(struct device *dev,
 				struct komeda_pipeline *pipe,
 				struct drm_encoder *encoder)
 {
+	struct drm_device *drm = encoder->dev;
 	struct drm_bridge *bridge;
 	int err;
 
@@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev,
 
 	err = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (err)
-		dev_err(dev, "bridge_attach() failed for pipe: %s\n",
+		drm_err(drm, "bridge_attach() failed for pipe: %s\n",
 			of_node_full_name(pipe->of_node));
 
 	return err;
-- 
2.43.0

