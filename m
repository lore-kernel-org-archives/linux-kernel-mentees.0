Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F1E2367DC
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767889; cv=none; b=p4sjOMMm0U91FUuzrFKaiIRqvr0/JHU2Hq0XBpm+a/RtMvRtkePxxLcZ3e8KotK9KcmWQILj1JcE/e2KW8LuMxZZ2O/yoaMA7N9EgJDLCCfKq9jW0nruk8PWty3PxogY+NtpATknvIEtsD2ATi/t6vm9BkSTCGW1IWFzRCdm244=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767889; c=relaxed/simple;
	bh=pZTzoaMuM/R2zsyjLEaONzg+ycGqE0htri7pc30ueog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXrx1dIIU2Bo6aPCiT94RsCYpTFlVTfBodZPdPsLBN8XIEFHLUV5niB2TARm6n5+zqtEwUSrvuZtkDDWDKOl3ac1UD3F9RV0qRLHwjeY/JD4PrvJm0v3sPhKMG/4z6TnVPhHuYGKKIQnFQWNEIJajWqMarRA9EMRqelnZJEU+ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=SkjyieoF; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="SkjyieoF"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74924255af4so4429793b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 22:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753767887; x=1754372687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cz0hAfmTTvl+76x/6A3khLDSp6/1Q/+pHFEJNnO3Rw=;
        b=SkjyieoFXMF1FKnK2hbbRH2HC0nUhWcKqjBVHoyAMokh0JCy0PAZprv1zrKBLL4Wwa
         9xGCElK9uiTWXp9TYdBmidsmviPn/5Wk4OVnACh7ZKPzeO0ck9tmdrsDva1TiJoLSqaO
         gkXi140q59z3lRFwE+i4RhRuSd9B/7uyTISZs3EAEf6HxY6l+nLX0CEa+t8g0EVu2Wep
         fb7+DOgqBNz5THEUJmfMeHB82YtHs3z2U1VNnF1x9XdfRHI47OFvyIxor1diCCVrSjME
         /iOwg9RUeFE7itNafdbkNKUeNe8bq2GIpYifNlxG6mVghGfpKUyIkqZhwpRswr9dSlAw
         8Olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767887; x=1754372687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cz0hAfmTTvl+76x/6A3khLDSp6/1Q/+pHFEJNnO3Rw=;
        b=BolbTaAc9rjz6rO2vZCV8HWCgDtkJGJHJQgnTY1ohRQpxhBZ0Fk+Wk9VSl4iRJgemF
         AgZwoPPKSz/wwYzmJacY/3iFNE7SbuNb5rXxk2G84AZJwFw3Oa5qlu5MRAl5uFR2zgeD
         wwsHudDKNn/bVrr5nLxx2kE8SD0XpP1gpDYSdq+s79EK6gk1q6YVrHgMplEtfR+8sGw6
         w3xZgagE0Fohny5vSQiq+M2geZ4I4a4qxC6CfBX4Lj/ipah5KdZX7gpmqO3vAD13KFOp
         2DBc8Z8FLxEh05JKuQfPGxzPrbcHebT3pJ0S6AcbeO4twIbvOd/GPIwjvfRtQm94f0TU
         CRrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzeZb+PNmdnTkr2IG6ckEgMDJMr2DOQ4eI/5JOdgHhsnuBX2q+DXQ33wXQ6eD3abuyzc6MADhK00MOQY54DYeHBv+FIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxra03GqMLafjzeCk9ozmDGkuoVUmAHuubCUZV/Ak1/7Dw/89B8
	OEkeHRFKZTdc1wq1eKjF6LOk0tnuEY9em3WYy7GNnOuw5iK75920WIlahypMgvrlRh1QbFaSPhF
	kHyjYt5eGpg==
X-Gm-Gg: ASbGncsUp8dffkYkEZJEOUbK33eUL5y0UPWDfKiv4msDUwmNCvs3dM5wXKIjnBXnoUX
	SY0MSzRvXo3ByR7+rE7X2EI4bMyIvFDtzgGDTX8wXBuuBrZhy5IdiS2HQi9KxCnwV44x1bhPv3Q
	0SQGWbd8J0PVt15M/2WRgNWJwSKSYVR3+995S22cUlh15chlK0Qmk3JCUj9iTlssEVEZ15MBmKP
	mUqKjyQtFglx4hCaqLbAlG7j2Wratr8ogHu/UWclHeF5kFvKkY8N9k8gu7KTqVwgssuMM3yzuVt
	Uv72unDA0hfJV4T049T5yVz1VqpepD5tuID8qeVSpvImIIe32UF5fg/yh3q4UxafAN7sI1qaam6
	kpJPnvTSoSQy5oBW9Fhpb1NjK8/Zm7gTJOdsznzUs0Ra7YkHrOlrL6QcDa/Ey
X-Google-Smtp-Source: AGHT+IGah/K2Kf1bDWtenETiFySO8an4FDCFWmr6N2dAeClkfyN4gd4Uk2XWExkSGq4VfY6iG4VPBA==
X-Received: by 2002:a05:6a00:2e23:b0:742:b3a6:db16 with SMTP id d2e1a72fcca58-763377f25f6mr21242667b3a.20.1753767887419;
        Mon, 28 Jul 2025 22:44:47 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640872a500sm6972462b3a.22.2025.07.28.22.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:44:46 -0700 (PDT)
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
Subject: [PATCH v2 1/3] drm/panel: novatek-nt35560: Fix invalid return value
Date: Mon, 28 Jul 2025 23:44:33 -0600
Message-ID: <20250729054435.1209156-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729054435.1209156-1-me@brighamcampbell.com>
References: <20250729054435.1209156-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix bug in nt35560_set_brightness() which causes the function to
erroneously report an error. mipi_dsi_dcs_write() returns either a
negative value when an error occurred or a positive number of bytes
written when no error occurred. The buggy code reports an error under
either condition.

Fixes: 7835ed6a9e86 ("drm/panel-sony-acx424akp: Modernize backlight handling")
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 98f0782c8411..17898a29efe8 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -161,7 +161,7 @@ static int nt35560_set_brightness(struct backlight_device *bl)
 		par = 0x00;
 		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
 					 &par, 1);
-		if (ret) {
+		if (ret < 0) {
 			dev_err(nt->dev, "failed to disable display backlight (%d)\n", ret);
 			return ret;
 		}
-- 
2.50.1

