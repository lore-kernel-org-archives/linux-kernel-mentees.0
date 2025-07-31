Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6197A23B619
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 31 Jul 2025 03:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753932232; cv=none; b=BWAcrgw8p+shLyc4x/UYkhJl3dQpslynpvkmhBxCClIiYz+w6Ko26HVAqfuOc449T3J/EkewOmN/Z/d7aMZ0eeX+HE9uOMBepiOFdbKypxZGdCRYH28L5urNqWD1vNY49JLEseDRM4VevcGv5PoC7On0Fol8Tb6UlTOx0ugnbuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753932232; c=relaxed/simple;
	bh=XxMNf+s+au9pzXX5Y2tRQ2TxicTyQrqJ3gGr+HCCcZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWfh1Ykt/pxoXvOuK9GHl6mZN2jswvnVImO86HtTcuxxcIEThwakq43OK14juVOrRpmN16N53+fhzEeQi+Zm7ff3+zapxSO2DnSelSf6H167bFeb/x0g3i2AdXGjE78nXOp6w12clJOSYl7e60C8+oZ9k/mX1Vcx8IgwdFMlyv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=P2bn680l; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="P2bn680l"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b422b31b1c0so155374a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 20:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753932231; x=1754537031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98acdjAVPrJS4Gqdzmu/lk9sXTEBspyDUAMw8EWioqY=;
        b=P2bn680l91Crp8OwdUVGdsUbphfiC3Ty8PTAUL4dNZKcl78WINcUIhwyLloA0o2VAe
         kE2GFFQPQiHGoiEHcV4//Aq3zYhWbU3yBgZIrL1DgvYSz5aGvpRNdY8C3OpCkoDt5GPH
         XrU8FzgmMoizogMMFxSt0aMCtzXGSy3OFKTHAUTRTG9AgHVX8gfCESi+NOCleafHzLZw
         9iMnWSfCGCGIa2waoxfJevbrj+QikIbZ0u96v6HkQgaei4BZsmHt/oFwoeaRAsmng3E4
         ACFx0Zaf49CmGgZO3xghRwo+td62MdNl8JYvlEapuzDKqHKMmXD3YdiSeMwz/HpUKwlV
         m0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753932231; x=1754537031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98acdjAVPrJS4Gqdzmu/lk9sXTEBspyDUAMw8EWioqY=;
        b=sX0EHQ23nTHZUO49JdQ8Ii7GN7PpfVekhBtv7LOnpnoxrLmBnN2jjWL+lNdxLwjQ6z
         IIByHyvj6zCZzCjfI5vWkMK4+QNy7Zb3NC/JL3vDAXqV5kc+cIcOpgEjFbGHRzbi5J+Z
         S6iqeDEqJuW+FmFr1HGVQ34g7WLiXHS3Xt4KlyTG9fFmSGFm39sNnfwy0IcDFzHzoduV
         4AuYLK8YGyjU5xepeW51M1xJSb1c7Hv2U/wA3eHV5NpFKjMFjZIpXc7R5zMc0q0C7J8A
         IukpurD7VUz/sMtx2+SEKQhEEaIfcWAybVX0chReSwbCCERWPuLkRg0utz9dPRQnR92p
         otbw==
X-Forwarded-Encrypted: i=1; AJvYcCXR7tbaY00paj8L+9s17RkvK1jH9kmEVwzVOpk6VvohRlj1Xv93NzrbN/Q+TKQwV95lwJ7jsGr6TZMo1yvkGeZWi46cHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGH2WS2F7iAsWS3o4mIxeJwRsK0me7OKA2lx57frWoi6K228Bh
	e/S9VuMr9nOk/SShMJLAv+7FIF3wVNl31qhveeq9H4C7SGMwA7rUfUQttIVwMYnHJIQ=
X-Gm-Gg: ASbGncuHb0OPn4cRBp1QBt0Knqif6ycqZrV5OQ8Z5T8KOowWZ7kmdBg2B162IOpLnpH
	OynizL0G2W5WiqOBiYZdC6iScepVMD+OELVXX64i4UbJULWG0SH3LpAH7tPtYYd0zYvOmq+cFcy
	9wZe73z/dlgD5qXruUJtd0c7Iz85PL7pbIA3I1Ml7KpNFpTumafTCQwW6EOejkarQHCb7IkDiR9
	aysd+NyHA7NBIEfNM1rzOtMw7E5uUsVHlINt/Gv10dl2RLYVjK/cZUuQRpDXTr2CxoIVE1wfdhn
	NDoDOSb8zBTZWkEA/+0tOeUvhKXYy6TU/JPMq2d8Ej1UGh6JEbYGqLMjjWaFbA7bFc8t7M69R3s
	p0UPi0zu3Oxv1mNy/P6IWrnJ8fAPO/DUCA/26atgJElAfPE+DEg==
X-Google-Smtp-Source: AGHT+IG7cxswJdJ/7tpMHzX/PLpF1znLcf9i4exYcEFax9LRUgDC4Zu20SehYungolPEBKBedQbYCA==
X-Received: by 2002:a17:903:1aee:b0:23f:d861:bd4b with SMTP id d9443c01a7336-24096a63f17mr93878045ad.5.1753932230738;
        Wed, 30 Jul 2025 20:23:50 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f15092sm4854795ad.66.2025.07.30.20.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 20:23:50 -0700 (PDT)
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
Subject: [PATCH v4 1/3] drm/panel: novatek-nt35560: Fix invalid return value
Date: Wed, 30 Jul 2025 21:23:41 -0600
Message-ID: <20250731032343.1258366-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731032343.1258366-1-me@brighamcampbell.com>
References: <20250731032343.1258366-1-me@brighamcampbell.com>
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

Fixes: 8152c2bfd780 ("drm/panel: Add driver for Sony ACX424AKP panel")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

