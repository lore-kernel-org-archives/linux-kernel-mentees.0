Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200A428A1EA
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Jul 2025 07:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875050; cv=none; b=krHXADI/9nxF6hpOrFwRuCpeqipEpmDBgpzV6+1HpSfrvxPvm6JmhccXNSV4N8VypeiGhNPJw5zBuUrvfbBjfi+bK8mw4JUOLJN4gPypP2WXF2fLo4sLMLqrDXf/w4JMUy2hRIu3yiwC5kec6zHH1XBCHLRfrBU8hpc9wri1WK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875050; c=relaxed/simple;
	bh=P8HQ9uJ3XyqukKDyIYQMPHz+6q2ZpiD7QwsLElWeJkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EGWV7yYC7zK5kS3yJJeFgXLmetV7IHZ5OQhazN7CAyzN8OgON0jv4k4q+tHUcnws9ziU+NFjTa5PmAFhdtuv6OViUz8S+3zm8jc0B74NZgxWgQefW5mVMp6wft2JTWuNAoT1beV8gASrUIKHMgVczjO1WUS3AyuKaxQM/R1ivyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=moGMVBz+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="moGMVBz+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23c8f179e1bso21173675ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Jul 2025 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751875047; x=1752479847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gizo1Y9JZrUMSmoAMbm1FYjU79aRDOXQASrbUODDlcY=;
        b=moGMVBz+q913nDeI/xMqJ3+PPzRxy2LQwniAanTtpnHkW+Zft2OCSaxNavQdc+6r9B
         cqqvzYGwzwbQV+nDCSZRMg1WXdjR0QLK+vuOVzwcjOwMdkHgidrQTs3fmWoJTC7dtylZ
         9cY1v1D3BWFZTn7HPHJMR9DBptiJKsNh/yFmWWiDsx00upRhXg1hu37WskVH/WenFwEV
         NjsJRMM+2RiOUF+U70F7K2V6fr3ku7rSLLWwXm+oNxXA+TtrLs1pucUo3eaHQbBDYWkv
         3CnNOb10VKOcBC+xWpgEJcv7RiuGkd3HjlZsCSRtP8mayPK8VXjTX9hpyl5d0LBROFZs
         X3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875047; x=1752479847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gizo1Y9JZrUMSmoAMbm1FYjU79aRDOXQASrbUODDlcY=;
        b=tG7Xcj5kg8LyDl1YFEpk/QXI9EWzAxu9jPIF/gTIjYS/cpTeOBd28E8B3y5YLanK71
         Yec/yNI2LEGernIjDNuCLfxGRDDjx1+7p3qpXYSu2D1XKTT8BSwethYXtXggOq1nzQF0
         j5e7/vywqKgVyoMkDTHXOjB83jJP/FNP5cmutXYV/UwRnr0hnnkZ4eTGxy6P6iqMyYwX
         blR7+/SO3N3ttNojn9eXA0dFqJK2vyM+n7WkTJLGxuzeEZrwYaNbaFuv7e5T93Z6fBMs
         RuX7EsCB9OZPrZGwWppdIdDVA5U4IvakYFNHopDrIz9swp9j1XGF/OQJGaQ9gnsbjpcY
         VrNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7cPfUbqfMbEE7lmsz9Ybywc181j+XeaaruJjfQIZtfoVOIHKID7vASKhBSlA5JDWmKrlrfrFJPHPOO+wkbXUUfCA/+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+0W8qG8gxvD1X/XuMQPW1GyKJeRLHhHDq1yuEd6W9p5H/FSOD
	/ME00My711a4i/ee1WLlLw8fWxaange/UfJecfaPALWBMjFT8cN0fl6tjKwd06JT2dI=
X-Gm-Gg: ASbGncsmBihMghW9Bi+MllbsDJD3Zg4RgvAMEIWCwUUEyI1LVAa4qhIbEWPEXndWkUs
	8/SwRxAFvZnDuUEQ5W3saTtFQurWIveni+i1s52K5c6QU5gSVMlkCXejGfxUQ48oMniOf5Qf84s
	9n1dTDiS6nfKsoQhh/gNOQZ/3RzwwLgGDQ/W8zwU7clWY7aoHEuW0wOQiBkjB7fB6amW4FozhkP
	sQX5DdA6fsJCgIXKBTUFHTN3lE6uvTryxR41L2KBr8wTkTMf62NavaUVPWCDZJA8OQMAq0UNCqd
	d6TffuNkaQ80c8l9/4r9Mn5CdvlFJIIHd5KAfEikj0oqHCrItsZzLy+Mq7oIzy7CFV3TEADjljV
	FnzEVGysh9VR5nlxJLw==
X-Google-Smtp-Source: AGHT+IH3zTssQXlW4e9+S6k2Gnh2tBpqiBPmGMJFWBwXftXzY2NmSu5YHWb2cBRXSypKAiCuAwySvg==
X-Received: by 2002:a17:902:f792:b0:223:619e:71da with SMTP id d9443c01a7336-23c875da391mr150368325ad.49.1751875047455;
        Mon, 07 Jul 2025 00:57:27 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:57:26 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
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
Subject: [PATCH 1/3] drm: panel: Replace usage of deprecated MIPI macro
Date: Mon,  7 Jul 2025 01:56:56 -0600
Message-ID: <20250707075659.75810-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707075659.75810-1-me@brighamcampbell.com>
References: <20250707075659.75810-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all usages of the deprecated mipi_dsi_generic_write_seq() with
mipi_dsi_generic_write_seq_multi().

This patch's usage of the mipi_dsi_multi_context struct is not
idiomatic. Rightfully, the struct wasn't designed to cater to the needs
of panels with multiple MIPI DSI interfaces. This panel is an oddity
which requires swapping the dsi pointer between calls to
mipi_dsi_generic_write_seq_multi() in order to preserve the exact
behavior implemented using the non-multi variant of the macro.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5b5082efb282..777a8ab3a397 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -161,29 +161,35 @@ static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
 
 static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
 {
+	struct mipi_dsi_multi_context dsi_ctx;
+
 	/* Clear the manufacturer command access protection */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
 	/*
-	 * Change the VGH/VGL divide rations to move the noise generated by the
+	 * Change the VGH/VGL divide ratios to move the noise generated by the
 	 * TCONN. This should hopefully avoid interaction with the backlight
 	 * controller.
 	 */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int jdi_panel_prepare(struct drm_panel *panel)
-- 
2.49.0

