Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9694B3A7591
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Jul 2026 22:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549272; cv=none; b=nVlGKbtZ3eT4S+KAWXNm+btXkZqCg65tmmrR1NQ/Y1gmY/T9MjopgHi3v3Rtgcfb1bDBgsUs4PEpga7qjcY5vlOODe/6tDOyJyIOCDofvRtT3sIdY5D6xHh8/ARBcjP6sOmHUgqASaT/TBJIjWd9kxUvIL4rRkJKgQKHlMd9lLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549272; c=relaxed/simple;
	bh=x7u0Iy40nzTbiGL2bJanR5cBed44YuFYrr/gdqywq6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tMmcbM5cfSEn4HG0CbIHisv7Qd0ZrTCg01sc4cBcRhB3pahLv7IV3hlLPi+lYicxmDTiHLAZ7reN8BBUL4gNdgBkot99iX7jDajrSJzWrYsZg5QscanX5daboX+jVD53gPnvPGHoTe9hzi+176bAX5LtGUJJn+pE3CDt/f5OSG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgUQkFMO; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgUQkFMO"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-80d33d13a23so15746447b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 08 Jul 2026 15:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783549270; x=1784154070; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ryEBOu0tdMaJYn0ZWk82G78CEwzIufJFF6xesijT5I=;
        b=hgUQkFMOJt0XTKdap0mcwBXHK6+IP50rYnEY6J5BeaxYUa6vB5Lxg2IqDbZasPp49h
         eg7LV9u6P7T8wdLgHV7aAWYFaDF2NuFuNSM8FTnfU6B8YJaBT5FGJ24G2P9uvszu3Vow
         YdXysgt3Sxrm0yCLOXj7Tew4RZPtTAzWOCBQU/QAhYPuPl+g5BO4CShv/S5Ogqnpc8Io
         ffflFYIhTB7IjzZ50DQYgTe5B2kzzSvNFRjKHWw6Vx34odtKOli6aHnAnC5ACJvhYjX2
         KVtwDhUOO7BAI2C59zeO7tLd5OrAltZTb0t+vzmKGamwaBWx78w5GGQKDh//c4vWpoKR
         rOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783549270; x=1784154070;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ryEBOu0tdMaJYn0ZWk82G78CEwzIufJFF6xesijT5I=;
        b=lTllvOsHyV3/Awu9rUcIoX3iuTejZFGO2JQUksJP1Bu2DRxsmsPMDLkvUahka1x05O
         6v1NO1bfK3S7BSQZXxGNDvwdGDcIgVwQYDMh54HGMzZE7Bb1wuu/4CrPy4YyGwOohCVO
         TdTkIVPOx+nvojKKFDo+Gdf3ulsbtH5ig8Rj3mInKSBu7GsRzSKhIybEuGxwf6z5ZGJQ
         xuluY0w51nMuGo/z4k2EPyS6bMvOl6FPVPp820dZ6NzJQlIi16cWdHUB1ggjYDHQdiCf
         vvequvl25r3jX1dlkMgJ5Fqbv9pvKJDeL2M4nGyHL26b2xF1PPW7LBXpRLvWthafBqpx
         YWwg==
X-Forwarded-Encrypted: i=1; AHgh+RrkubGwlk6w3/szYbUTcAJ4nPNe2zsoJ0m/TYAXxeHVfpAH84QuOu7Sy8rI3Urbl5NxpwWTl4JYWnpD3953iZSdptDyvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVEdhwYy2jxGpA4oS2W1YCYNNBYwnITSsnVSjJzPt5K4FLnRhG
	ahGK4gNbwgBwF7cmISWV2309Z0mvGJYbrEFt0L+hYP0OPZsAmVjOd/0=
X-Gm-Gg: AfdE7cknTY715VdgiW5eU3xJ8JyOp2SXCEFjRY7QdnclwDu58ES7gHicxG6kDrKYzAR
	NxTVpctc9yM34hHauQ+sfAVUQhu11Pb65vopVPBG1Ou8cYWdQPvH3oe38JbgPAptu/RIiXCWSbo
	5WPCm2C1PBYJYS4KiPnSOy2/NHaaqI539tu1UKINnIl+VYTbTu8KWyRV8m4QsQCBqyLq3N6Qj/o
	ewBWRIWoiVl2mZGxPnb8u5//rWmtG1lgo7hvJI1aJgXaJi/cBQFukYd1nkSuhuO7sbafzdTWI5e
	w6hzLuu38LfTDJl0ixlJ5RVI7Tc34La1CpauSOYJKi/Shes3Zwt6Ix0B4nZJW3ddqNAi6xRG9aP
	dBgLGCGZt5VN7wBLByklw3IjA8H2UsHG/fFUsiykQv7G0RwyVuXFUzdYnaVK+Y/ez7thrLAOkcX
	0H3Xjh7D/jfbp9640we7WgW51/EKIywtktzK83kzac2J/jbG78G1h5TVeZ1Mcii20GVQ==
X-Received: by 2002:a05:690c:4b90:b0:80d:a249:486c with SMTP id 00721157ae682-81dbbe3b5b4mr36173027b3.3.1783549270397;
        Wed, 08 Jul 2026 15:21:10 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bf653desm3151417b3.17.2026.07.08.15.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 15:21:09 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	David Airlie <airlied@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Inline drm_simple_encoder_init()
Date: Wed,  8 Jul 2026 19:20:21 -0300
Message-ID: <20260708222035.7324-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Simple KMS helpers are deprecated because they introduce an unnecessary
intermediate layer between atomic modesetting and the DRM driver.

Inline the functionality of drm_simple_encoder_init() to remove
dependencies on these deprecated helpers.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 170adaf7e76a..d5b0692fe860 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -2,7 +2,7 @@

 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
@@ -316,6 +316,10 @@ static struct drm_plane *amdgpu_vkms_plane_init(struct drm_device *dev,
 	return plane;
 }

+static const struct drm_encoder_funcs drm_encoder_funcs_cleanup = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int amdgpu_vkms_output_init(struct drm_device *dev, struct
 				   amdgpu_vkms_output *output, int index)
 {
@@ -342,7 +346,9 @@ static int amdgpu_vkms_output_init(struct drm_device *dev, struct

 	drm_connector_helper_add(connector, &amdgpu_vkms_conn_helper_funcs);

-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+	ret = drm_encoder_init(dev, encoder,
+			       &drm_encoder_funcs_cleanup,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
 		goto err_encoder;
--
2.47.3

