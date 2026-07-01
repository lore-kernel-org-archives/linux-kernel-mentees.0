Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F5947ECD6
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  1 Jul 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910594; cv=none; b=j6d9kSY7IglL9Z7PEagT7MfJjJVhiGaTglYf3rfFdu3ptsLJaZSTW+OAWhSTBzklEuagxWDY+qsPhAxlAjxb7BLWHIy8yPPjONDA7zIqMSTirKVCvsreD0GoT1IDrwx8UHfbXmlfstbgpLvtv3e3RvhSb4J2TY1QCQHSkrivmkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910594; c=relaxed/simple;
	bh=beTDLMCpV2JzC/zCxPOddGtvB1kDm9lyIXb5x7kpyaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VlZfsgTFUpjDSpX9wCYIMnEAkEOdMf1XGs99DTtASeMs8QB7ke+q7u0QhtSg8W2G61cB1fYePQrFrZKvgLjUvjiQqDKh8kvv/7e7nunpYNLvXG7Z5BaMivEaBlUEjV+VnUrb9CWaN2BTOlbu5BlEXJlFFMVBxBu36V1ETwX2vqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNcFPYfO; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNcFPYfO"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so1150703eec.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 01 Jul 2026 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910592; x=1783515392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mYJA6PpUkT+r3Z/CP3V9ISI0QPawCrDu4twxjtK9E90=;
        b=RNcFPYfOfh+8cr4L06djdo1OBX6BpJhhY+OTfY3eAs5RuwWvi+KNBRWSG2tIs2Ftiu
         y/U0ChHzftL1EJZI7JbrHVaoUYckGlK4fr8XeDg6IOGBZJrfV0mmwIWrmW8PWC5CBoK6
         YYsIbLCDJVFwG3K5bkwcXgF5VTtkXf53ttb45mMUJL0BW8WlXs6yM5XNLyN3opzs8NfF
         2NAHJPYnGqx4P1mOBihybFdlXcEj8S9VJdINVC0IGx90lDtzDmhw4hGMQkwxfK09bvkM
         tiZOqCAMSkGUMeRqxDETvLosyRpGqi+Mit6sRqTdMtMszCyFkEyVY1F7voKwf04sJ7Og
         qB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910592; x=1783515392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYJA6PpUkT+r3Z/CP3V9ISI0QPawCrDu4twxjtK9E90=;
        b=Wee8x2jvtuQq7bDfdq8L6Jf670BdgwN877xX5qrbTPJh6ZB5LOwGi/+4/zXuFH2xf/
         0/SdPjoCvuIgu9yinNs6pWU1ZeX5sk0SFHDTbOQt8gJyPZsNSjbeZC8abI8RAtHVytyh
         4tcnBMb8Z5opXjH8FPsMciwiffabl2hEUApRZkpQqvqz2dOrYxgrszX/QES3UNAVuOI8
         hvH4fcGMFkIcINetzx+HaWjXsH0OUwisYxceTffZ6tM5fKaV6ZKtbjC7etHoxqBEGhOp
         QzeAPr2hbvXkJalRp6O0u8Psqb5q62I/3zi7foxUsPhie/kJHuRIhyz62mQcY+eJ7MfD
         JY0g==
X-Forwarded-Encrypted: i=1; AHgh+RrNhBvp/1mRTpQDuE9VtRz7639AAVpFvu3x84cUa1kJLXFVPURGXt6akuLp0ai5A5wTsCnDHLDKIEvsTqaUmJBFapmg/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqlvdrNzXYU/jjXR64ntHeG7P2c7XzjxWnddNUKK/+7XD3WFZd
	87ouyr4CZZhnBftor/eWkAZo7IxkBpV2E0Flh5YV3Fn8HsMVE8De6RY=
X-Gm-Gg: AfdE7cnGMhiJW9PpL8x5aCCZ3RaHjtrCxBvCeY355ulGSBXIpXUsGPLCOz4UFDSkhLr
	me+StrZmcfpViEQHVzUU0Q7TP9/EF3jT9x/OzXsXIcVUjF5V3i3H2MXqK+Tv4+fvbA1ohVv+s99
	iJ/fVlIF5cV/pLP2ptkRgMfCQNH8JARJMNtgteZq/w2K2CXRb8GIyO79ULZuLkx0/AwAJeT383F
	+wzNkJd9TVTuc1lLY7HK56FyiaY8qzt74hHxelt3ELsJ67kIkYZNZnbAGVJCM3FGY+0NfCKj37r
	8Sjo7AmcCFhuWIVol4JEblkWk+izvQSs/O6nwMClGtlkvuRJryIEMkvn/l98VeLmQO7zDL66Qz2
	sqK+ZiY1XxAsjNs5Skr0vkfeHyHlOt9AW46KxiHajkTcKeq2hafHbygHpDAzW2+q8+02A2hQzYc
	liStCGKs08XfByv9wWbXGW+ZZAVLUJ84puf+Q94lcHEJLCEVU46LeUu9QukN7TOJLr
X-Received: by 2002:a05:7300:2307:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-30eff0524cfmr1743055eec.4.1782910592041;
        Wed, 01 Jul 2026 05:56:32 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30efaadc5bfsm7411392eec.28.2026.07.01.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:56:31 -0700 (PDT)
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
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/panel: novatek-nt37801: Use mipi_dsi_*_multi() functions
Date: Wed,  1 Jul 2026 09:56:06 -0300
Message-ID: <20260701125624.199786-1-nico.antinori.7@gmail.com>
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
Note: I Compile-tested this patch since I don't own the panel to test it.

 drivers/gpu/drm/panel/panel-novatek-nt37801.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
index d6a37d7e0cc6..daa356bbc182 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
@@ -128,7 +128,8 @@ static int novatek_nt37801_off(struct novatek_nt37801 *ctx)
 static int novatek_nt37801_prepare(struct drm_panel *panel)
 {
 	struct novatek_nt37801 *ctx = to_novatek_nt37801(panel);
-	struct device *dev = &ctx->dsi->dev;
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct drm_dsc_picture_parameter_set pps;
 	int ret;

@@ -145,15 +146,10 @@ static int novatek_nt37801_prepare(struct drm_panel *panel)

 	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);

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

