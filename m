Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362422FCE3C
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770503; cv=none; b=E6q81Fk85li7ayeEPBEUZIH3Ka2+vb4unC0bpkpv7pdMpUVhS23sItj8lRQMwDfnWYc3IM8UmLCir7tbtOBUnu9/1GqnvhSB3vRV2ZRZjPHQz4aNNu7Xqj1g7dw6hjIDi6yh8zfX8GIvWb0sf5+t5d7hITILO5j/HBCGcAsJHwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770503; c=relaxed/simple;
	bh=YJcap+yEvAid5W9WWkuP6Wec7Pqo1OzPt2QIGwIPW98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nmSy33B+7k/QEET1+I+6h1JLebtOauIo02GsCHckh5JhOqsuDEaLTVp6r1NvFhcqmVaS+ImET6ONC0aovdwRo9xwe6spBD00Lcq5DO7YIyZ3r7DGLlJQXQt6bL5SBBxk3FaJwrcBwfd6VbAFQH+A18JmPbyPnDLMFjySORO3zlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=jqpjwpPo; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="jqpjwpPo"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso1409703a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 09:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752770501; x=1753375301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESsJwhHHQM2UwCSmgVX/iDa6sRNhhsQlObhdf5dpUJc=;
        b=jqpjwpPood1NO2qk8EqYRyM650K6+TshZCINeTqUMgmMyxk83axC/04koQEG+Ud20u
         eo16dR7QvTb19QaycgdVCo954vWcwArBdBeluxjP5M11hKnnxN5L0K/1lgtFP3AkoQqo
         ZnJt0EIp6cFrJvlzuxSMNdnwa/Ib9i63MEBw5UkhF+KlllJotTDlJWD2m6tiTr1Tzo0r
         zYGbH11LgEB+nXojk34+kclKX2mlNP+mItvqAho3aOScx6xgwBO3gpP8v4MWDEx41+Oq
         ln/3txx1qjsqF2G81Ts8QycnN6RVAaWyF3W8BZHEmSy4JcSo4qtq8xlla0Y6rsvw839L
         6KCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770501; x=1753375301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESsJwhHHQM2UwCSmgVX/iDa6sRNhhsQlObhdf5dpUJc=;
        b=riA0YBlBxeevNGOQjp8x6qUSmdFTbNM1kJ3W8TfVeufcra/tG/6I9bgvY8IHeaQY/9
         sgppvp+iPRFUUWygezPzaX2iwGGwkUHIlm+5zVcMamU5wldfZB2rqbH5+SP+/jErFZJP
         5xSprzsA2ejX3hVoBUfbQgbrEpjJnUcaHXuNkoCAszskHW/TRK0YwwuQGqjxL++BK0QL
         OKglwNSpHowMe1Z+H+2MJ6xFYarBgdNjOzugfJD1N6kvlI0Wxd65EjiL0tiuR0JFTih8
         UibsEn+sEmeP5NKjnP+6RLuFjtnSjlHOygP5mUdgVdwIUW79t2J/ZXKUWKKtipJRB06R
         Tj+A==
X-Forwarded-Encrypted: i=1; AJvYcCUSL7XJPPcBqVyWL2Hh3Pl88TZzI4XDKEeFSaZfoIHSGGKQ9pzMKxKjVWWdAR2/0wBL8Mvf11r4K9FKu3fmMZzoCKbSLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfIWoLjvS+y/4v/b4u6fjh/HCUYf3o3mfkjUPeR3yoH+K3oYSy
	qujIztataodOHzYoUy+atvP/sq3X1nwZLc0Ly+XVcYUY2+huoRICKJODUYrjRBG3WzY=
X-Gm-Gg: ASbGnctCcM6wQgwBZmTKZYxZe3/DiljLdcXmlU9HR0fhc1UPei1tZtHZrO6F7N7IglO
	2tfTg8754lVsncXOs9jprQHomR2JDfLjUTOTQlq57451qCDV9rg1GfqCiUfydUCORDMLrKFNtWq
	udTbtnitLiPOkaXtK7hVGXY89sTduRBxGk2Unxirbt0WJWjomERkIKR7/RU8jQj+Mz5eHNYqDhn
	zhniTDUOhXRBtP0WWWsL5AG6CwtL3JCzPu4L/iPxVZk289KoDqVClVqiqBabFEhGVTuKvz//T7A
	B4rROPba0Qhmx9bLy1d3WcLx0yd2BglnIPXHSUCu+SpkhDWQSVfruXAwZ2pOuk1rp82HryMQyGh
	9IvJoa+ZjvRIcZzd+82vE833ddeUnKfFiDp+e4UUgVBMkqncW/Q==
X-Google-Smtp-Source: AGHT+IE1CeicV0sGbGU0VIzyRprxdceU7A8ofLGqRq5vhUsMS9h/1MhYpXvlkdqyMZ62HVrnUhNCVw==
X-Received: by 2002:a17:90b:2682:b0:311:b5ac:6f63 with SMTP id 98e67ed59e1d1-31caf8db5aemr4794419a91.21.1752770501250;
        Thu, 17 Jul 2025 09:41:41 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7e8ae4sm1821750a91.24.2025.07.17.09.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 09:41:40 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	diogo.ivo@tecnico.ulisboa.pt,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v4 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
Date: Thu, 17 Jul 2025 10:40:50 -0600
Message-ID: <20250717164053.284969-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717164053.284969-1-me@brighamcampbell.com>
References: <20250717164053.284969-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix bug in unprepare() which causes the function's return value to be
that of the last mipi "enter sleep mode" command.

Update driver to use the "multi" variant of MIPI functions in order to
facilitate improved error handling and remove the panel's dependency on
deprecated MIPI functions.

Use the new mipi_dsi_dual macro to reduce code duplication.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 197 ++++++------------
 1 file changed, 60 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5b5082efb282..9df67facdc47 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -81,25 +81,25 @@ static int jdi_panel_disable(struct drm_panel *panel)
 static int jdi_panel_unprepare(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_panel_jdi(panel);
-	int ret;
 
-	ret = mipi_dsi_dcs_set_display_off(jdi->link1);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", ret);
+	/*
+	 * One context per panel since we'll continue trying to shut down the
+	 * other panel even if one isn't responding.
+	 */
+	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = jdi->link1 };
+	struct mipi_dsi_multi_context dsi_ctx2 = { .dsi = jdi->link2 };
 
-	ret = mipi_dsi_dcs_set_display_off(jdi->link2);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx1);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx2);
 
 	/* Specified by JDI @ 50ms, subject to change */
 	msleep(50);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
-	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
+	/* Doesn't hurt to try sleep mode even if display off fails */
+	dsi_ctx1.accum_err = 0;
+	dsi_ctx2.accum_err = 0;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx1);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx2);
 
 	/* Specified by JDI @ 150ms, subject to change */
 	msleep(150);
@@ -123,72 +123,47 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
 	/* Specified by JDI @ 20ms, subject to change */
 	msleep(20);
 
-	return ret;
-}
-
-static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
-				       struct mipi_dsi_device *right,
-				       const struct drm_display_mode *mode)
-{
-	int err;
-
-	err = mipi_dsi_dcs_set_column_address(left, 0, mode->hdisplay / 2 - 1);
-	if (err < 0) {
-		dev_err(&left->dev, "failed to set column address: %d\n", err);
-		return err;
-	}
-
-	err = mipi_dsi_dcs_set_column_address(right, 0, mode->hdisplay / 2 - 1);
-	if (err < 0) {
-		dev_err(&right->dev, "failed to set column address: %d\n", err);
-		return err;
-	}
-
-	err = mipi_dsi_dcs_set_page_address(left, 0, mode->vdisplay - 1);
-	if (err < 0) {
-		dev_err(&left->dev, "failed to set page address: %d\n", err);
-		return err;
-	}
-
-	err = mipi_dsi_dcs_set_page_address(right, 0, mode->vdisplay - 1);
-	if (err < 0) {
-		dev_err(&right->dev, "failed to set page address: %d\n", err);
-		return err;
-	}
-
 	return 0;
 }
 
-static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
+static void jdi_setup_symmetrical_split(struct mipi_dsi_multi_context *dsi_ctx,
+					struct mipi_dsi_device *left,
+					struct mipi_dsi_device *right,
+					const struct drm_display_mode *mode)
+{
+	mipi_dsi_dual(mipi_dsi_dcs_set_column_address_multi,
+		      left, right, dsi_ctx,
+		      0, mode->hdisplay / 2 - 1);
+	mipi_dsi_dual(mipi_dsi_dcs_set_page_address_multi,
+		      left, right, dsi_ctx,
+		      0, mode->vdisplay - 1);
+}
+
+static void jdi_write_dcdc_registers(struct mipi_dsi_multi_context *dsi_ctx,
+				     struct jdi_panel *jdi)
 {
 	/* Clear the manufacturer command access protection */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
-				   MCS_CMD_ACS_PROT_OFF);
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
-				   MCS_CMD_ACS_PROT_OFF);
+	mipi_dsi_dual(mipi_dsi_generic_write_seq_multi,
+		      jdi->link1, jdi->link2, dsi_ctx,
+		      MCS_CMD_ACS_PROT, MCS_CMD_ACS_PROT_OFF);
 	/*
-	 * Change the VGH/VGL divide rations to move the noise generated by the
+	 * Change the VGH/VGL divide ratios to move the noise generated by the
 	 * TCONN. This should hopefully avoid interaction with the backlight
 	 * controller.
 	 */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
-				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
-				   MCS_PWR_CTRL_PARAM1_DEFAULT,
-				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
-				   MCS_PWR_CTRL_PARAM2_DEFAULT);
-
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
-				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
-				   MCS_PWR_CTRL_PARAM1_DEFAULT,
-				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
-				   MCS_PWR_CTRL_PARAM2_DEFAULT);
-
-	return 0;
+	mipi_dsi_dual(mipi_dsi_generic_write_seq_multi,
+		      jdi->link1, jdi->link2, dsi_ctx,
+		      MCS_PWR_CTRL_FUNC,
+		      MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
+		      MCS_PWR_CTRL_PARAM1_DEFAULT,
+		      MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
+		      MCS_PWR_CTRL_PARAM2_DEFAULT);
 }
 
 static int jdi_panel_prepare(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_panel_jdi(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .accum_err = 0 };
 	int err;
 
 	/* Disable backlight to avoid showing random pixels
@@ -231,88 +206,36 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 	 * put in place to communicate the configuration back to the DSI host
 	 * controller.
 	 */
-	err = jdi_setup_symmetrical_split(jdi->link1, jdi->link2,
-					  jdi->mode);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set up symmetrical split: %d\n",
-			err);
-		goto poweroff;
-	}
+	jdi_setup_symmetrical_split(&dsi_ctx, jdi->link1, jdi->link2,
+				    jdi->mode);
 
-	err = mipi_dsi_dcs_set_tear_scanline(jdi->link1,
-					     jdi->mode->vdisplay - 16);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_set_tear_scanline_multi,
+		      jdi->link1, jdi->link2, &dsi_ctx,
+		      jdi->mode->vdisplay - 16);
 
-	err = mipi_dsi_dcs_set_tear_scanline(jdi->link2,
-					     jdi->mode->vdisplay - 16);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_set_tear_on_multi,
+		      jdi->link1, jdi->link2, &dsi_ctx,
+		      MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 
-	err = mipi_dsi_dcs_set_tear_on(jdi->link1,
-				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear on: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_set_pixel_format_multi,
+		      jdi->link1, jdi->link2, &dsi_ctx,
+		      MIPI_DCS_PIXEL_FMT_24BIT);
 
-	err = mipi_dsi_dcs_set_tear_on(jdi->link2,
-				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set tear on: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_exit_sleep_mode_multi,
+		      jdi->link1, jdi->link2, &dsi_ctx);
 
-	err = mipi_dsi_dcs_set_pixel_format(jdi->link1, MIPI_DCS_PIXEL_FMT_24BIT);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
-		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_set_pixel_format(jdi->link2, MIPI_DCS_PIXEL_FMT_24BIT);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
-		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link1);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
-		goto poweroff;
-	}
-
-	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link2);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
-		goto poweroff;
-	}
-
-	err = jdi_write_dcdc_registers(jdi);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to write dcdc registers: %d\n", err);
-		goto poweroff;
-	}
+	jdi_write_dcdc_registers(&dsi_ctx, jdi);
 	/*
-	 * We need to wait 150ms between mipi_dsi_dcs_exit_sleep_mode() and
-	 * mipi_dsi_dcs_set_display_on().
+	 * We need to wait 150ms between mipi_dsi_dcs_exit_sleep_mode_multi()
+	 * and mipi_dsi_dcs_set_display_on_multi().
 	 */
-	msleep(150);
+	mipi_dsi_msleep(&dsi_ctx, 150);
 
-	err = mipi_dsi_dcs_set_display_on(jdi->link1);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set display on: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dual(mipi_dsi_dcs_set_display_on_multi,
+		      jdi->link1, jdi->link2, &dsi_ctx);
 
-	err = mipi_dsi_dcs_set_display_on(jdi->link2);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set display on: %d\n", err);
+	if (dsi_ctx.accum_err < 0)
 		goto poweroff;
-	}
 
 	jdi->link1->mode_flags &= ~MIPI_DSI_MODE_LPM;
 	jdi->link2->mode_flags &= ~MIPI_DSI_MODE_LPM;
-- 
2.50.1

