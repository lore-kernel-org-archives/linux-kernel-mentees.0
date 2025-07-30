Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5D61F4C92
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 06:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753856282; cv=none; b=KyjO9hDiPDpGE9gvmVegPPFiNYLAzXGKQpzmL3gPyCbHmv+6eQ9x56nZzlYUHAJrs7ISYzJ+YOuGyCgZeY6Yslcui/i6ROa/SQbmHQ8uv1gNnfkrz6Gd2xG59J6QJpWACInsCyp/M6zv1IYVYkDyv83nc6Fnh96roAk+jFX+fl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753856282; c=relaxed/simple;
	bh=min3RkzhSY2+BuE9oVHC3RQH8qtFhVDcXi4weEpISO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=otE582rSir21ULQa+guS6d05jEwdOAMe6iq8QkirJHJMW8DOMKQe5T3sDz+xNuI5/VUCcZ1c0iFrRbQtVl/RV/5lGr3C6wpfWGqB5eS4eEF4SW3lpsyPtfU9Yt/CWB3+wy5pmGzPIdy10ou4MI1Ms5Y6YPcmgTaIrrdvnRLPvVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=PDzDsJDM; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="PDzDsJDM"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24022261323so6223875ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 23:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753856279; x=1754461079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR4erbh6ZgobZPCbAljGsIGhNSgdyY2tm2UVINDkl1A=;
        b=PDzDsJDMpI+gVUCROAfm0vQxChLTj5xRrjeQLayb0eIDqLWbqkH8KB/j4+zVVQvDVa
         nhI1hubnk48goQ+mbD+vVI9oiAiAkpJapa1Qlsagvo6Yy8Hv7JCna/oLJyWAOTfBKFvp
         Tp/HUnCwyuxxJc49vha0o8evG53NBxq2Ed8Uq4kt03p6IkoVaaZDcYqI0Gvvi89ldeNA
         mROV27CeonxYdlIE2vn4etQBd8vCEVhLuX/NHxOECK84dDkqmluvEu+rpambVKX9ECF8
         TFebVldEifuT8FnsclpKq1/VGsbspP1K8t0nzcLxUK8i62HB54Iz1007brLK2r8dXwxQ
         +jWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753856279; x=1754461079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR4erbh6ZgobZPCbAljGsIGhNSgdyY2tm2UVINDkl1A=;
        b=cI1RtNxZORcj9lynX1MzqJkJV+nh3xn+EqHowdSwlLWU7OwuzQETO2DLW6f+O0eCOB
         6+xzeybQSC047lKhJzhJa3A79GJDkrve83gCh8p3QIIRwqdMaJhiCs4Z0A4LeAGbRBW4
         BvkO7bpooht44/uYm+fqMIur1JZ2YPO8p3HgtVSXJ3BJr+NEw0OL9FfyoMuIadej+Kcs
         9peUVe5aAJ5UHb7j6Oi6kaxJneqYXfNafv2At/KSVSUKVLP1Sx1NBa8dAbs5obDd0DS1
         3Gc8RWdAHvWswOovTFSJsrdWGDfuXSiR29M7vX/u/WnvgrtTsAh3jSraqoxfiuWWIta8
         yMFA==
X-Forwarded-Encrypted: i=1; AJvYcCVFhkmqvMtAli8u5VhQm1OXub0ahMJ3Bd6+HlAd1/OedD7PU+3qLyBDIn/OQDcX68kll6rFjB5iVIo3Ngurt51REk9lvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQd5t/z5oDXHJxyMNHpnotiQs5gGn9Rmfk/DxT3i65q2e6wWOL
	8UXGRptgODGituKCQUj4Pck1+IIQ4psT7weVwJRjEAJ8P7XFGTfUyK9IQdmTztadbJ0=
X-Gm-Gg: ASbGncsWsEuU+NbEtZJ1gR1uFGw102e85y/Gshk9bbyecTuMHyklNZIv/YjfouOZRg8
	fDK0dMLvB4v5jjSdiZU+L7gHUwVvJ8Se6Jl86DNUodX0O2xn0XTfld5VISRkqKQkMu3rJZXocn2
	Tc1JmuRvlS5L2leg/FnM07PwL7S9GPiS4bWmfXi3Yoyi/BlrrILZoUDS3vutIbuTiqKNGBLM5N1
	4ihxp6oOmT/+aIij+K4pzXiy5n9jYJYT54IxeezD2+2VZQbuz1b4PXfRIiY8Z8WcEEEax8Fbo6J
	vvqM8VJVadAGJp6Kyvcr7n1DV42dQB+qr9tz9b/JimVjFKWs6JYQjwadArbQfVIWB9nGBByk6K+
	hjqhoUBTRT2MofHd0mSZIfH7gzHMS2QDo9eE+fmE55el7HCXkyw==
X-Google-Smtp-Source: AGHT+IGVpWVdI1JvsII9rcUCEpE1cDJVrBru18qi1g44qJSYL9UGrGYbIRyKJKQ8SZpLUGuKbX+kEA==
X-Received: by 2002:a17:903:230d:b0:231:c3c1:babb with SMTP id d9443c01a7336-240968a0178mr31572865ad.18.1753856279535;
        Tue, 29 Jul 2025 23:17:59 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ffa37f078sm75017815ad.115.2025.07.29.23.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 23:17:59 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linus.walleij@linaro.org,
	neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com,
	sam@ravnborg.org
Cc: dianders@chromium.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 3/3] drm/panel: novatek-nt35560: Clean up driver
Date: Wed, 30 Jul 2025 00:17:48 -0600
Message-ID: <20250730061748.1227643-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730061748.1227643-1-me@brighamcampbell.com>
References: <20250730061748.1227643-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update driver to use the "multi" variants of MIPI functions which
facilitate improved error handling and cleaner driver code.

Remove information from a comment which was made obsolete by commit
994ea402c767 ("drm/panel: Rename Sony ACX424 to Novatek NT35560"), which
determined that this driver supports the Novatek NT35560 panel
controller.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 198 ++++++------------
 1 file changed, 60 insertions(+), 138 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 17898a29efe8..561e6643dcbb 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -148,24 +148,20 @@ static inline struct nt35560 *panel_to_nt35560(struct drm_panel *panel)
 static int nt35560_set_brightness(struct backlight_device *bl)
 {
 	struct nt35560 *nt = bl_get_data(bl);
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
-	int period_ns = 1023;
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = to_mipi_dsi_device(nt->dev)
+	};
 	int duty_ns = bl->props.brightness;
+	int period_ns = 1023;
 	u8 pwm_ratio;
 	u8 pwm_div;
-	u8 par;
-	int ret;
 
 	if (backlight_is_blank(bl)) {
 		/* Disable backlight */
-		par = 0x00;
-		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
-					 &par, 1);
-		if (ret < 0) {
-			dev_err(nt->dev, "failed to disable display backlight (%d)\n", ret);
-			return ret;
-		}
-		return 0;
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
+					     MIPI_DCS_WRITE_CONTROL_DISPLAY,
+					     0x00);
+		return dsi_ctx.accum_err;
 	}
 
 	/* Calculate the PWM duty cycle in n/256's */
@@ -176,12 +172,6 @@ static int nt35560_set_brightness(struct backlight_device *bl)
 
 	/* Set up PWM dutycycle ONE byte (differs from the standard) */
 	dev_dbg(nt->dev, "calculated duty cycle %02x\n", pwm_ratio);
-	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
-				 &pwm_ratio, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to set display PWM ratio (%d)\n", ret);
-		return ret;
-	}
 
 	/*
 	 * Sequence to write PWMDIV:
@@ -192,46 +182,23 @@ static int nt35560_set_brightness(struct backlight_device *bl)
 	 *	0x22		PWMDIV
 	 *	0x7F		0xAA   CMD2 page 1 lock
 	 */
-	par = 0xaa;
-	ret = mipi_dsi_dcs_write(dsi, 0xf3, &par, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to unlock CMD 2 (%d)\n", ret);
-		return ret;
-	}
-	par = 0x01;
-	ret = mipi_dsi_dcs_write(dsi, 0x00, &par, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to enter page 1 (%d)\n", ret);
-		return ret;
-	}
-	par = 0x01;
-	ret = mipi_dsi_dcs_write(dsi, 0x7d, &par, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to disable MTP reload (%d)\n", ret);
-		return ret;
-	}
-	ret = mipi_dsi_dcs_write(dsi, 0x22, &pwm_div, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to set PWM divisor (%d)\n", ret);
-		return ret;
-	}
-	par = 0xaa;
-	ret = mipi_dsi_dcs_write(dsi, 0x7f, &par, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to lock CMD 2 (%d)\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_var_seq_multi(&dsi_ctx,
+					 MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
+					 pwm_ratio);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0xaa);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x01);
+
+	mipi_dsi_dcs_write_var_seq_multi(&dsi_ctx, 0x22, pwm_div);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0xaa);
 
 	/* Enable backlight */
-	par = 0x24;
-	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
-				 &par, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to enable display backlight (%d)\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x24);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static const struct backlight_ops nt35560_bl_ops = {
@@ -244,32 +211,23 @@ static const struct backlight_properties nt35560_bl_props = {
 	.max_brightness = 1023,
 };
 
-static int nt35560_read_id(struct nt35560 *nt)
+static void nt35560_read_id(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
+	struct device dev = dsi_ctx->dsi->dev;
 	u8 vendor, version, panel;
 	u16 val;
-	int ret;
 
-	ret = mipi_dsi_dcs_read(dsi, NT35560_DCS_READ_ID1, &vendor, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "could not vendor ID byte\n");
-		return ret;
-	}
-	ret = mipi_dsi_dcs_read(dsi, NT35560_DCS_READ_ID2, &version, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "could not read device version byte\n");
-		return ret;
-	}
-	ret = mipi_dsi_dcs_read(dsi, NT35560_DCS_READ_ID3, &panel, 1);
-	if (ret < 0) {
-		dev_err(nt->dev, "could not read panel ID byte\n");
-		return ret;
-	}
+	mipi_dsi_dcs_read_multi(dsi_ctx, NT35560_DCS_READ_ID1, &vendor, 1);
+	mipi_dsi_dcs_read_multi(dsi_ctx, NT35560_DCS_READ_ID2, &version, 1);
+	mipi_dsi_dcs_read_multi(dsi_ctx, NT35560_DCS_READ_ID3, &panel, 1);
+
+	if (dsi_ctx->accum_err < 0)
+		return;
 
 	if (vendor == 0x00) {
-		dev_err(nt->dev, "device vendor ID is zero\n");
-		return -ENODEV;
+		dev_err(&dev, "device vendor ID is zero\n");
+		dsi_ctx->accum_err = -ENODEV;
+		return;
 	}
 
 	val = (vendor << 8) | panel;
@@ -278,16 +236,16 @@ static int nt35560_read_id(struct nt35560 *nt)
 	case DISPLAY_SONY_ACX424AKP_ID2:
 	case DISPLAY_SONY_ACX424AKP_ID3:
 	case DISPLAY_SONY_ACX424AKP_ID4:
-		dev_info(nt->dev, "MTP vendor: %02x, version: %02x, panel: %02x\n",
+		dev_info(&dev,
+			 "MTP vendor: %02x, version: %02x, panel: %02x\n",
 			 vendor, version, panel);
 		break;
 	default:
-		dev_info(nt->dev, "unknown vendor: %02x, version: %02x, panel: %02x\n",
+		dev_info(&dev,
+			 "unknown vendor: %02x, version: %02x, panel: %02x\n",
 			 vendor, version, panel);
 		break;
 	}
-
-	return 0;
 }
 
 static int nt35560_power_on(struct nt35560 *nt)
@@ -322,92 +280,56 @@ static void nt35560_power_off(struct nt35560 *nt)
 static int nt35560_prepare(struct drm_panel *panel)
 {
 	struct nt35560 *nt = panel_to_nt35560(panel);
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
-	const u8 mddi = 3;
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = to_mipi_dsi_device(nt->dev)
+	};
 	int ret;
 
 	ret = nt35560_power_on(nt);
 	if (ret)
 		return ret;
 
-	ret = nt35560_read_id(nt);
-	if (ret) {
-		dev_err(nt->dev, "failed to read panel ID (%d)\n", ret);
-		goto err_power_off;
-	}
+	nt35560_read_id(&dsi_ctx);
 
-	/* Enabe tearing mode: send TE (tearing effect) at VBLANK */
-	ret = mipi_dsi_dcs_set_tear_on(dsi,
+	/* Enable tearing mode: send TE (tearing effect) at VBLANK */
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx,
 				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret) {
-		dev_err(nt->dev, "failed to enable vblank TE (%d)\n", ret);
-		goto err_power_off;
-	}
 
 	/*
 	 * Set MDDI
 	 *
 	 * This presumably deactivates the Qualcomm MDDI interface and
 	 * selects DSI, similar code is found in other drivers such as the
-	 * Sharp LS043T1LE01 which makes us suspect that this panel may be
-	 * using a Novatek NT35565 or similar display driver chip that shares
-	 * this command. Due to the lack of documentation we cannot know for
-	 * sure.
+	 * Sharp LS043T1LE01.
 	 */
-	ret = mipi_dsi_dcs_write(dsi, NT35560_DCS_SET_MDDI,
-				 &mddi, sizeof(mddi));
-	if (ret < 0) {
-		dev_err(nt->dev, "failed to set MDDI (%d)\n", ret);
-		goto err_power_off;
-	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, NT35560_DCS_SET_MDDI, 3);
 
-	/* Exit sleep mode */
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret) {
-		dev_err(nt->dev, "failed to exit sleep mode (%d)\n", ret);
-		goto err_power_off;
-	}
-	msleep(140);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 140);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret) {
-		dev_err(nt->dev, "failed to turn display on (%d)\n", ret);
-		goto err_power_off;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 	if (nt->video_mode) {
-		/* In video mode turn peripheral on */
-		ret = mipi_dsi_turn_on_peripheral(dsi);
-		if (ret) {
-			dev_err(nt->dev, "failed to turn on peripheral\n");
-			goto err_power_off;
-		}
+		mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
 	}
 
-	return 0;
-
-err_power_off:
-	nt35560_power_off(nt);
-	return ret;
+	if (dsi_ctx.accum_err < 0)
+		nt35560_power_off(nt);
+	return dsi_ctx.accum_err;
 }
 
 static int nt35560_unprepare(struct drm_panel *panel)
 {
 	struct nt35560 *nt = panel_to_nt35560(panel);
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = to_mipi_dsi_device(nt->dev)
+	};
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret) {
-		dev_err(nt->dev, "failed to turn display off (%d)\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+
+	if (dsi_ctx.accum_err < 0)
+		return dsi_ctx.accum_err;
 
-	/* Enter sleep mode */
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret) {
-		dev_err(nt->dev, "failed to enter sleep mode (%d)\n", ret);
-		return ret;
-	}
 	msleep(85);
 
 	nt35560_power_off(nt);
-- 
2.50.1

