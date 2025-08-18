Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370426561D
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 05:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755494738; cv=none; b=ce/w31FxhALUABGiB0By13Um8noxBd357x9I9UCbLUB1CIB76Mtmni/qRCaT0FvhUGW47I+sUEjr+FLg/pm/iX3XBv5YRfPVeEyGFqF4Nn91M+my6QsDKCH1mwvuhUQhYdGynVSu5G62opAALUUXOCpyeV0CchuZQECyovtsnAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755494738; c=relaxed/simple;
	bh=dqxFEX/VL/2RWIvaGy2jWQ4m5TBIX+EXT4oXhAPS5rY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZzWXa4uqM2Rrrp+iJo/p+cS2276R+Kx5zXNICT/T0mEUehz5OeH5nmYSceT05KRa6EBkKWGOCrq2AEck+clSkhfHNh46353F4onw2v7mmt11TdaR91Hdmy3PrS4rjHzuRPeNbKJylyZFF0eu+YAvwMlT2jVaPucaTpiOkrq1nBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXrLMuX7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXrLMuX7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e2e629fc4so3903149b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 17 Aug 2025 22:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755494735; x=1756099535; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qWawdILeIQYq+c7F7VMxTWAdEGo7NrIDJCoccdr/4pg=;
        b=MXrLMuX7ktmQSXq5ulcxIlwPJx69Uk7MUkYQG27zXdJjp+dHiGjkvzTbFSITmT3AI3
         FatwsucQ7zPbV4u9EUAXHSamnURGzvuKH+u3eC0G+lTMBNepNui7N6nBHCqd9F2JWKz1
         dyogYxFEMzROwi+g7hFBr+IMisnR5sG2e7o57oc/86I8niIILEB4RATc1qphhL6dnE7M
         gM/9M8nUiblUaa/7aZgW64qzxmE+S2cGRxTPMH1TX7oaXyHIC/IA4PdeCumHQPIud8N/
         oMbygQaCpoADBPN0/YN8ANihOfI3XoN6xM5gw2lFdBkv2xxyix7+Lqe3FX0XJXHbjwtW
         2b1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755494735; x=1756099535;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWawdILeIQYq+c7F7VMxTWAdEGo7NrIDJCoccdr/4pg=;
        b=D25dTMMvf2S3ue9+wJZ30FpN8Pm0Lv8RBiLDG261+6BaXvjXklDit5KdxvPRp/NBPa
         7uPt1FD9vqivpiUpO2+RSxzJgFCUsBE0CmjTSrZGlJ9jqCRINq7Daohw6cYRummv+pcC
         HwlHcEXW1D3HhlY50HvVZEMQbUrkA6MLXhKyHmQf+bNYURVDkWNj1dZZ8M5zd8L1CdSP
         8v3z2D4SbGHxlPQa8y1VgcHMadGPSvxQ+owJqPgG8BrJ2EPj8xIYMrLx1Laeh8y7hUKh
         rIw5DCiSt9aL+WI7Q62yJYypqoXYEHTKvImgHOYS3i4feqUwOXYIKZg6IhqqpQNeBjEn
         nekw==
X-Forwarded-Encrypted: i=1; AJvYcCW4Do5z2ahwfjGg6C+kTNS/cLPLc8k1yyXWyzzXpjUHdGA+lP4tsvT0a+TQpIiLpF8C441UVzqYqk6SfuMcdf5DKUveJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNm5H0A1SyPoKR6FD1Bm+hBYOpIrR+dDu6IRGc3ecPSMotudm9
	cqed61jJyWiMwkqrLhAQd2FmC4rxIvXOkkzUIHz5ygQs0qqODX5m9O5x2e5he8Qp
X-Gm-Gg: ASbGnctQyqiMOUkw7kKb6zUi5jqWWTz8kkcLlxkvABF7LnOZSwiLvF8ihKrPI9oH392
	zeP36N1+0KUfOp0utfvJv05zjoUhZtNuei6yhn5KSYSH+cEEdWC7lRbvknAgcdAIOtxWAVd35vw
	HMQMRp0bE3Sm58gmPkW4oxl+xan9SkobBGdnP/XzK0PIdV2wZqYx75nV1bkXWZhjOcrVRjaMzOg
	9R3ELU1Pd5X69KaS7s6jgGoq7PFX/zmwI7Rm5S7q/qI5fg1fICdAtHIhUtQEsO0lGfVVeGaffZe
	zekNlK63gtUk6i363HmET/SnrQeESXNRUE8CV3tQAGgCjmxML8I5D/8waamNHzCAxM9dm1f5eO6
	6J9DedYBg5kC4Krd+hzgZ
X-Google-Smtp-Source: AGHT+IFEyHVBPpUQu87+9vuJC5WFe8phvlVaAzvfFzSLbyBXhy6X9hQUYMGsk0Qw1l0OKlI2IokWqQ==
X-Received: by 2002:a05:6a00:1398:b0:76b:2c12:334c with SMTP id d2e1a72fcca58-76e4484fb5emr14190101b3a.23.1755494735185;
        Sun, 17 Aug 2025 22:25:35 -0700 (PDT)
Received: from localhost ([159.117.70.219])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76e45289544sm6359629b3a.27.2025.08.17.22.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 22:25:34 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
Date: Mon, 18 Aug 2025 13:25:18 +0800
Subject: [PATCH] drm/dp: Simplify return statement in
 drm_edp_backlight_enable
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-drm-dp-helper-logically-dead-code-v1-1-080f76699c0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD25omgC/x3NQQqDMBBG4avIrDugAUG9SukiZv7oQGrCBEqLe
 PcGl9/mvZMqTFFp6U4yfLRqPhqGR0dh98cGVmkm17uxn4aJxd4shXekAuOUNw0+pR8LvHDIAl7
 n2Y0urjEgUOsUQ9Tv/Xi+rusP0Ma9M3MAAAA=
X-Change-ID: 20250818-drm-dp-helper-logically-dead-code-b99252fbfcec
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, Nai-Chen Cheng <bleach1827@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755494731; l=1333;
 i=bleach1827@gmail.com; s=20250730; h=from:subject:message-id;
 bh=dqxFEX/VL/2RWIvaGy2jWQ4m5TBIX+EXT4oXhAPS5rY=;
 b=2+mNW0078zBqQmEoPaN8PDrxmYaGLav/YPr7/2cybsMI82J15uA68Dbru45EQvNMjKdVnRWfm
 jq0pIurPudUCQ/8nWE39IT9aa1GCSUeber/mw5Eaz6aV2M6zoYOno4G
X-Developer-Key: i=bleach1827@gmail.com; a=ed25519;
 pk=jahFPRplw20Aaim8fIt8SxlFMqkHbJ+s8zYBGbtHH5g=

Remove dead code in error handling path. When drm_dp_dpcd_write_byte()
fails and ret < 0, the condition in "ret < 0 ? ret : -EIO" will always
be true, making -EIO unreachable.

Simplify by directly returning the error code from
drm_dp_dpcd_write_byte(), which provides more specific error information
for debugging.

Found by Coverity(CID 1649043).

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1ecc3df7e3167d13636e194c4aab44ee8979aa11..b022ee136db2eb3b721ef918650525202dd22035 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4079,7 +4079,7 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	ret = drm_edp_backlight_set_level(aux, bl, level);

---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250818-drm-dp-helper-logically-dead-code-b99252fbfcec

Best regards,
-- 
Nai-Chen Cheng <bleach1827@gmail.com>

