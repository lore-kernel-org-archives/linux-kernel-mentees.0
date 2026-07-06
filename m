Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346D9436BCA
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  6 Jul 2026 22:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783377878; cv=none; b=K+iUmA/OzHH4ZvT2/kIYvRHwjZIj1k3cOQe4Tox/jMhbHtXDQOl5APQpJtRgA3S7QiiSXJCG1UjLQCv3suGfnSAtujRenyvkqKlBx8nn67z9Pra3Wou8LvH8Le/nu9CND1EH3s34DbOxMQ7VQEtOFXg7GTCbn/H5Zktnpd0oFd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783377878; c=relaxed/simple;
	bh=amYadcI2et2zQcAhRbrr27pv/OyWM6pJrfjOJhYSeb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B+3kHiolqthwoK7Jqv5zqtOTiRHFA1XxgR6+zQaCg0xn3g5SNbmrqlFVK8MgMHkpb+Yd/T8n1OdmK6OFZG8SKYHoWC47moD0NAgofKiRzroHW+xj2eLXzK+cZKSdCRhDWZLLvKDyjuY+jZa7apcKBYg0ueDWF4r8JZIE5XT1klU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLnkcdNX; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLnkcdNX"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6a183eb9689so2301209eaf.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Jul 2026 15:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783377876; x=1783982676; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G77zae6W1Y+lDMJG5BxknAhTRS5mZtGYTolxw07uXkA=;
        b=PLnkcdNX6uvGpqXOl/fU9Z/VKbEAO7imtaUCGHG+Yilzp/0tc0GiIVlfu2urPFiKpo
         jt73GJ74Blb95ADWgFKih4UFJhIOAJCMkVJsOwkHP8g3QxkjvS/M0Pz9KZnPpeJ0MS6P
         C+njNtB/H/o84vQtYj0e3I1fifOkvVuhl+EBPkq7SaYhv1xeU7I9lid7QZl17HW3qCEu
         9OdAskK/gA7DE5EnPmovzAmx2QuLh8f7l7kM91FfrQxejoEAFHd+uud5yDGyOLDOvB2+
         HaWd0S3HFWvosnCuQKS8Hl2lQKSysmqrdUnkTmSFU/4E6aGN1D6wAVUqMKyG7yL3HXwa
         pW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783377876; x=1783982676;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G77zae6W1Y+lDMJG5BxknAhTRS5mZtGYTolxw07uXkA=;
        b=JN3w7eYrkqbpujpK+sWgZP4Uw5CJ8ZDeWhI3n/X90gAeKav5N+KJrgAvoDU81mip7q
         wxjBnTQW1coVxeepCAwNBGdJvg4+hpegilsndfsUYlZ1I47FIq7aunlQVukQOmUQO3DL
         h2LMKgNXkMJb1vAXJ+Mzyahhp5Rzf/sADECBxIRRp1XjdKEUJx1X/0RAY2KtMx6Sqv5D
         z2LnWp+ZRJzG79k4v9dGtpmXr5HxWuOMhWOcwl97ArcAG6OrWwk+XHgVWTAejq5o01Ba
         7TGNXlE3RrxyDEUwUjNhJgUusg+IZ2FpFK+PdlFE611VEeexZwsXHipBaAdzbrb3MQhY
         wXxw==
X-Forwarded-Encrypted: i=1; AFNElJ8kQodlWwEQ2muU7E5mkCqYzZ3aYSuetK5ipgAeidvTX//yc7Yfa9RVvq7vOgztgYb57IxhETkvMGt4mh5arir7EtKbWg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd1oKwa+QAwBlXyAoGLzZq/UH/wlZ+/qNJloG2UGPu3TpyetZu
	Au4Y0j6BhDqBp4gwRM3An9My4w0bfqYkyuqZTJqCwb14hTAkHTSv7dY=
X-Gm-Gg: AfdE7clclH0MnKSTkDbpbcj4x9iVUqrTZKm7WNsg0WTdq9q9TBG+6SDPpXZnj2/oSW6
	kA9XWi1QW6gXc/zPYiBiJthUofRSpNeMhkrnp/WZ/l6lyoUSLxgIPqflSEdLgTU9GewNheBiyug
	IwHW3r8idr5rVuKylZT23/vFm7a3CrpeZY3rDExGVpU+fV6i2W9L9pPLVwC5rXP374UAjlrxFpT
	c1N1qU67TyCR+uz6P8D7M2pWxlWcoor6iBrJ9FjhzBMrLm59DEqdqOMUT1GwWSAb322gfQkTvBi
	Pnw1f7BZ7S/vge2STkJRwXejRWU4RiPDli+XpNG26ur1Fm4RXWwLm4j//aHKxXFt7kWX4ZWnBFz
	cw62LW8ahppH08BkDvChHCNSLkUbClfmGud8rGOdb7cL0yUBmYgcslGDDYO8KfbLpIHdU6GTweA
	YcNdifYIDpN+tC7AbadDRFC1HoSLAAdM2NF2xD/v0q7Qadf4OZ7LZEWHuVnIoYyLmS
X-Received: by 2002:a05:6820:2d03:b0:6a3:1063:1a8f with SMTP id 006d021491bc7-6a355392306mr1575891eaf.19.1783377875878;
        Mon, 06 Jul 2026 15:44:35 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a31fd2cf7asm7510942eaf.4.2026.07.06.15.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:44:35 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	David Airlie <airlied@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panel: novatek-nt37801: Use mipi_dsi_*_multi() functions
Date: Mon,  6 Jul 2026 19:43:35 -0300
Message-ID: <20260706224414.1015766-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace mipi_dsi_* functions with their non-deprecated mipi_dsi_*_multi
counterparts. This change reduces error-checking boilerplate and improves
readability.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Changelog:
v2:
Implement feedback from the previous thread to simplify code in the
novatek_nt37801_prepare() function. This converts novatek_nt37801_on() to
return void and passes the mipi_dsi_multi_context struct directly as an
argument.

v1:
https://lore.kernel.org/dri-devel/20260701125624.199786-1-nico.antinori.7@gmail.com/T/#u

 drivers/gpu/drm/panel/panel-novatek-nt37801.c | 110 ++++++++----------
 1 file changed, 48 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
index d6a37d7e0cc6..139cbf9833c7 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
@@ -52,61 +52,56 @@ static void novatek_nt37801_reset(struct novatek_nt37801 *ctx)
 	mipi_dsi_dcs_write_seq_multi((dsi_ctx), NT37801_DCS_SWITCH_PAGE, \
 				     0x55, 0xaa, 0x52, 0x08, (page))

-static int novatek_nt37801_on(struct novatek_nt37801 *ctx)
+static void novatek_nt37801_on(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
-
-	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
-
-	novatek_nt37801_switch_page(&dsi_ctx, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc5, 0x0b, 0x0b, 0x0b);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf5, 0x10);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1b);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x55);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x18);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x19);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x00);
-	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x059f);
-	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x0c7f);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x03, 0x03);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91,
+	dsi_ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	novatek_nt37801_switch_page(dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x6f, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc5, 0x0b, 0x0b, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x6f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf5, 0x10);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x6f, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf4, 0x55);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x6f, 0x18);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf8, 0x19);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x6f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfc, 0x00);
+	mipi_dsi_dcs_set_column_address_multi(dsi_ctx, 0x0000, 0x059f);
+	mipi_dsi_dcs_set_page_address_multi(dsi_ctx, 0x0000, 0x0c7f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x90, 0x03, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x91,
 				     0x89, 0x28, 0x00, 0x28, 0xc2, 0x00, 0x02,
 				     0x68, 0x04, 0x6c, 0x00, 0x0a, 0x02, 0x77,
 				     0x01, 0xe9, 0x10, 0xf0);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x81);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x23);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x81);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x6f, 0x23);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb,
 				     0x00, 0x01, 0x00, 0x11, 0x33, 0x33, 0x33,
 				     0x55, 0x57, 0xd0, 0x00, 0x00, 0x44, 0x56,
 				     0x77, 0x78, 0x9a, 0xbc, 0xdd, 0xf0);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x06);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0xdc);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x00);
-	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x00, 0x18, 0x00, 0x10);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x6f, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf3, 0xdc);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x00);
+	mipi_dsi_dcs_set_tear_on_multi(dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3b, 0x00, 0x18, 0x00, 0x10);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
 				     0x20);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x51,
 				     0x07, 0xff, 0x07, 0xff, 0x0f, 0xff);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x9c, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_MEMORY_START);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x00);
-
-	novatek_nt37801_switch_page(&dsi_ctx, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x55, 0x01, 0xff, 0x03);
-	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
-	mipi_dsi_msleep(&dsi_ctx, 120);
-	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
-	mipi_dsi_msleep(&dsi_ctx, 20);
-
-	return dsi_ctx.accum_err;
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5a, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2f, 0x00);
+
+	novatek_nt37801_switch_page(dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2, 0x55, 0x01, 0xff, 0x03);
+	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 20);
 }

 static int novatek_nt37801_off(struct novatek_nt37801 *ctx)
@@ -128,7 +123,8 @@ static int novatek_nt37801_off(struct novatek_nt37801 *ctx)
 static int novatek_nt37801_prepare(struct drm_panel *panel)
 {
 	struct novatek_nt37801 *ctx = to_novatek_nt37801(panel);
-	struct device *dev = &ctx->dsi->dev;
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct drm_dsc_picture_parameter_set pps;
 	int ret;

@@ -138,22 +134,12 @@ static int novatek_nt37801_prepare(struct drm_panel *panel)
 		return ret;

 	novatek_nt37801_reset(ctx);
-
-	ret = novatek_nt37801_on(ctx);
-	if (ret < 0)
-		goto err;
-
+	novatek_nt37801_on(&dsi_ctx);
 	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
-
-	ret = mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
-		goto err;
-	}
-
-	ret = mipi_dsi_compression_mode(ctx->dsi, true);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable compression mode: %d\n", ret);
+	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
+	mipi_dsi_compression_mode_multi(&dsi_ctx, true);
+	if (dsi_ctx.accum_err) {
+		ret = dsi_ctx.accum_err;
 		goto err;
 	}

--
2.47.3

