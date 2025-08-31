Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5C24315C
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 Aug 2025 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756649736; cv=none; b=KtplSAixgaUrR0mza9HQLcSoNdx/weSqAXZMPFFuzawwcFSxxrEHNs62hGVFJ6ZenWuS9bXWwgS3La1zpB85FZiry8SUnWGsbCoKLPhsKwH+LV1WhNv5lWWkj6gIGTmXw53gV44jKG0N2KRZ803MidOh3OnrDAHcBiEly8+2mug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756649736; c=relaxed/simple;
	bh=Kd/gX5fjRhUyfF8lcZ2fmkUcEqn0Q7e5V2RHg3ZIw9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y+lDXEsGH/BeUm2ORJdj1Og6xQCsJGBFveP5Ujgg61HhFxXemlUb0b0A82MoHRrdbPMkMIBtEcY55HMj6gDd0dURdB211HmRnoOnPIpem2eJUTP3TB/forkpe3s5QEmC5NcHmkHB+2S67AcvP/yx9d0puNaj4x2d4E5IZjkzePE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIMcg3PU; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIMcg3PU"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4c72e4f1b6so1796025a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 Aug 2025 07:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756649734; x=1757254534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HT2tnFXLGodr/Ol/iLDsu6bZVkZa/3lt411uDOwsk1A=;
        b=CIMcg3PUco3KjcaRn5BRn4L4bxxFCagP81elKAcB73eSsdmb7akZrT6LsdPmAsuo+Z
         ka5VoqcPNvB7OEwyPSuwPCdRriHg7b/Zou9W+tiKqVbzKjW0egmTRt3B51nWk94mY4ht
         rQ8SWn6P4ex1M1AXpNdIpCjWaFTDOaXH0nMs44bzULQ0NLT6o3nggkpmuLXx+CqY6Fc9
         3MLSezIOnXER6MroB5wIhds5QlCQSKZrzwBAl1D1weWYi1ANMnOM3w4Zg1yKUHzUite7
         qSRWa9Kr7Wr53W5twFoMm5kvd6Ezi2CNiERLs3zrANSS0L0DjiPz+TUDBAcxhAd01wvP
         Nx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756649734; x=1757254534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HT2tnFXLGodr/Ol/iLDsu6bZVkZa/3lt411uDOwsk1A=;
        b=hcAxTYLb6aN6Ce0FmoIsRqBovChvl3sevv/nl5ZSjG3Igm9NQ38quyLIXvv6PlgKak
         UH+3+8GBUUUrwZbHiPoYkt51F9rbFbs2rFucyHImy21xZTK2DM/rpGou387RYtFhMdlr
         j8z5ESq8dmqY/mr/y4ywIfeZaXnfetSQKww+eAQv3FvRf7mIejrcPnUOQl7+Y8AnSuqO
         Ci+WkGZsgiRIxXDtiTU0wHmKHaPaW7dGs/k6qfvMn3Kml27+ZsF7Mpt0Vsm1QR7ve6je
         f3JkDPsg7jgR6c7R+PC5D0ToWL/fFF3JeEjkg4+0qN7Xx7zdmL8Xe/FWAUj6qUUkp/3b
         BGIw==
X-Forwarded-Encrypted: i=1; AJvYcCUVV/Tt2stB3mQe3zV2D8cY83rZ1EWlmL41SOB4zWHIpn9s7IEb2WArpkMpWHegPSKUHgCehXqvNDCykVWpzkTXfPJ/Jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLZrtuCSg/StQ5seVXy0kCz1W/1/pDI0cpNS5ZXMwJgC9FNfeu
	z6gbpH5mbYzTxDhf1Igh0Geo00593FibTguKXdIQjoQE7/mfJG/82SJD
X-Gm-Gg: ASbGncvcgpJJhJ5udAc6aj9DrnhI4OJ/bRnVgh8kHyVpufFI+k+WkaCts3BqaWFbgSd
	UFCp7XQ0hwGwBzugz4ROtsIbks1QGSNyMovN/ATNf1w0VGBUv5Xb4k3S4MGbKLBalIH8XJz4Gs9
	Cyh0nhOGgLQyKIciLqW63gTj5LvgE7Ld0Rapp+DAWhHG+Hx4bxejS9PYNrExDCPs3bwEVIchKvr
	/XjV0rj6vuoPLHnFyJS7d8l9DddzRAAxqSHaCLcAYx/og0A6sVaJwbpxLupDT0wXviFtwoPvtjW
	gVOLT8n0NTwbOB9nL4Yqs7kPYPWO9vT3SjFMgSGL1QeiLNkJqD5WCz+nRHLEU0qWouazcZQpEGb
	dsHC5eB9aoCxkXul1DpEPU2EAX1NVhP2qM9zkPsBS6qNhNBs=
X-Google-Smtp-Source: AGHT+IFw+ZIS2MKM3bdCIDJ7UFL5l11P9sSsVyLYU1HFxQeGPNi2j5pi/ybo/wZjl06HLWYrWCy3Tg==
X-Received: by 2002:a17:902:f708:b0:24a:acb7:a1a4 with SMTP id d9443c01a7336-24aacb7a5f7mr32595525ad.9.1756649734163;
        Sun, 31 Aug 2025 07:15:34 -0700 (PDT)
Received: from mohin.lan ([152.57.1.136])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249065a3b67sm78031815ad.120.2025.08.31.07.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 07:15:33 -0700 (PDT)
From: mohin24khertz@gmail.com
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	corbet@lwn.net,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Mohin Nadaf <mohin24khertz@gmail.com>
Subject: [PATCH] docs: gpu: fix spelling error in drm-uapi.rst
Date: Sun, 31 Aug 2025 19:45:22 +0530
Message-Id: <20250831141522.7813-1-mohin24khertz@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohin Nadaf <mohin24khertz@gmail.com>

Fix typo 'unpriviledged' -> 'unprivileged' in DRM UAPI
documentation describing error codes for operations
requiring elevated privileges.

Signed-off-by: Mohin Nadaf <mohin24khertz@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 843facf01b2d..7435664a1ffe 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -535,7 +535,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
-- 
2.34.1

