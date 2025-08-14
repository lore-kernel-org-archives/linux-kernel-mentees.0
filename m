Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA734231849
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 18:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197020; cv=none; b=BGkbIrqbrw11ygAxvEA7jhC0uehvMB2R1CQNiAMHalxqeYU0zvaSmYqWFQfuSU5RMyf6PxI/s7jeueIFLC7AaM2SJoXlWY9t6Y4bBg62NWgWvjqD3e88c6PEYs37YthsmShAz9cqHP0hDYxCsmA8SfiS4m/RicySjP8tLONwkdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197020; c=relaxed/simple;
	bh=HzhGSOEbP93yW11E2dVFWSxpffOEMSlBt4hcNy8rzUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kenshOxY+a50M5z5Ndgb+7gBWmPhXiiNlA72cSrldAOrvPaL33W4BHhse0rYDtQZTuhHxM5KMhIGXATcokoltOSX11gtx3qbESDKEyC7rOrzCdahF0FojtZ7ge8OR6ocrrMm8M0Eb5BVEDKWL5y/IZiz2FChJb1NVFznVEJggQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGQuI1QR; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGQuI1QR"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BDC740380
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 18:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynxnyphN4erl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Aug 2025 18:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AABA5400AA
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AABA5400AA
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MGQuI1QR
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AABA5400AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 18:43:37 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-323267c2730so121253a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 11:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755197017; x=1755801817; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WH+OLX4PVYHaF7paZnuikm/Sd4CSwuIUJmjMyFBnjJY=;
        b=MGQuI1QRJwEPFc28tYGxxm4r4ggIz8Ac2h4h/zFRhJqg9VBLUphxrgN2MXJhZ1A0M6
         c00VVTvaIIAbj8KJ2nh4fKIBf7JPcepLDXVthF3rsqQt8KQnslp9WeW5thGhglk2fPsm
         +MmkclofaVnMxccNWlLHkguPpOopzJ2zb5muc4cDPeGLfdHPkgiupGPBgZR+7hlW/TwN
         FPYQCDT2/sb9+pkdox60R7NG/dSM7Ivchrjl7t8NJQebMvrtI8Koh/RMc4RAMSiLUOHq
         GfWWuhbW9lXN4JFLI42+gsOPscqCiKH9HyGbGFvOc6TUWTvbpgRGHTv65Ems/feQHJy3
         Ky4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755197017; x=1755801817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WH+OLX4PVYHaF7paZnuikm/Sd4CSwuIUJmjMyFBnjJY=;
        b=n6G7gYcOYtcYawmD8Sxq3oHNt88frOOoLuyTylAWp2/C2gQvn1YMIhYCzUdsGHB1nR
         2DaN/HBcNdGVnv+nm+H1qX5AElcU/ObuFSfEbHfKISkv9k3ITyYFPUiZcCuiXvgzummi
         KxmuLvleR1PIDM5+rliC/lfspExyNyr0roVVoJ/o2v3eYd2QAfaY2zbD4HRI5dXiX0ln
         uRE9ZXPe7dX6tZtipx/7PpqCKnGfytb6lUMqQWtet+D8j1mIoB7SOVWUo6zoCFysxAfs
         8k6Lt7A2RozByK8Bsskz2fuwycUTj5/y/xtG+A02LYG4wjq+ZweCXXQpsIDdqp83cs+Z
         fCzw==
X-Forwarded-Encrypted: i=1; AJvYcCUl5o9d+pIZpjdkpoMnM+vzfhSlcXyMHLNJUolx5TnI3Gx8UG4UqaBHW9vhFk3BViSoLctD9eDNdeP70ZPlnKenChckxA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwhCoxiRO77XRIsDLFiAfFeJz/bsfu5xxcUfjimRsubzIEskaa0
	+BZK+9pi0uxbeyU6DFSWGP4qjyxNX8ClZLVNYCvBc2jGD8uAqJv22anO
X-Gm-Gg: ASbGncvQZ35rse5KREmGIdTJsxvz/jue9HMD/Ls/jerN7SSPnyeuGIwLnqTW3PCAcCH
	a+nUJ3nd5aRbXYcCpHqV3ye+nu6osoMowq4u7CuOI19C2PHeG5tEFzYWU0ZPYR4zNTiKoW0dbZt
	RLvflSOU8e3SYu8GOag2pRWW5gDVs41R92xVaTcgPbFTa6IPA+ooSsf7NziegFS+oTeuQo0Gmx3
	S2iKk47J0vANNsnvwPZddm54TW69m1Z1vM8geF6ruThgXsqKWhYK2/BraULcJfEYk050b8q81Rp
	OmSPX8avzdO1FW0GAVF4uBdSaeDkbkugXO/bw0cyw0nR3AYpk5EMyKQHFovXFT/6vNX5Bx7QQgC
	fYNO/QWn8UBT6pQOFSCgxZCOqe4hZwQ==
X-Google-Smtp-Source: AGHT+IHpyIE58Xouwhj6yBGTLqqaBArMNrYcPZiFgWmogKeWrtCsF1xc0DbS3TA1SKqjyLzK1ppp+w==
X-Received: by 2002:a17:90b:33c4:b0:31f:141:448c with SMTP id 98e67ed59e1d1-32327b45d14mr2843144a91.3.1755197016744;
        Thu, 14 Aug 2025 11:43:36 -0700 (PDT)
Received: from ranganath.. ([2406:7400:98:2b0c:a05e:ba31:bd42:d797])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32330fc5142sm2594991a91.8.2025.08.14.11.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:43:36 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
To: alison.schofield@intel.com
Cc: alim.akhtar@samsung.com,
	corbet@lwn.net,
	dave@stgolabs.net,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	rafael@kernel.org,
	skhan@linuxfoundation.org,
	vishal.l.verma@intel.com,
	vnranganath.20@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] Documentation: Fix driver-api typos
Date: Fri, 15 Aug 2025 00:13:03 +0530
Message-ID: <20250814184304.20448-1-vnranganath.20@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aJ4KEKHn351vQXe_@aschofie-mobl2.lan>
References: <aJ4KEKHn351vQXe_@aschofie-mobl2.lan>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrected a few spelling mistakes

v2:
* corrected as per suggestions.
* improved the phrasing.

functionalty ==> functionality
in Documentation/driver-api/cxl/devices/device-types.rst

adjascent ==> adjacent
in Documentation/driver-api/cxl/platform/example-configurations/one-dev-per-hb.rst

succeessful ==> successful
in Documentation/driver-api/thermal/exynos_thermal_emulation.rst

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
 .../driver-api/cxl/devices/device-types.rst        |  2 +-
 .../example-configurations/one-dev-per-hb.rst      |  2 +-
 .../thermal/exynos_thermal_emulation.rst           | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/driver-api/cxl/devices/device-types.rst b/Documentation/driver-api/cxl/devices/device-types.rst
index 923f5d89bc04..7f69dfa4509b 100644
--- a/Documentation/driver-api/cxl/devices/device-types.rst
+++ b/Documentation/driver-api/cxl/devices/device-types.rst
@@ -22,7 +22,7 @@ The basic interaction protocol, similar to PCIe configuration mechanisms.
 Typically used for initialization, configuration, and I/O access for anything
 other than memory (CXL.mem) or cache (CXL.cache) operations.
 
-The Linux CXL driver exposes access to .io functionalty via the various sysfs
+The Linux CXL driver exposes access to .io functionality via the various sysfs
 interfaces and /dev/cxl/ devices (which exposes direct access to device
 mailboxes).
 
diff --git a/Documentation/driver-api/cxl/platform/example-configurations/one-dev-per-hb.rst b/Documentation/driver-api/cxl/platform/example-configurations/one-dev-per-hb.rst
index aebda0eb3e17..a4c3fb51ea7d 100644
--- a/Documentation/driver-api/cxl/platform/example-configurations/one-dev-per-hb.rst
+++ b/Documentation/driver-api/cxl/platform/example-configurations/one-dev-per-hb.rst
@@ -10,7 +10,7 @@ has a single CXL memory expander with a 4GB of memory.
 Things to note:
 
 * Cross-Bridge interleave is not being used.
-* The expanders are in two separate but adjascent memory regions.
+* The expanders are in two separate but adjacent memory regions.
 * This CEDT/SRAT describes one node per device
 * The expanders have the same performance and will be in the same memory tier.
 
diff --git a/Documentation/driver-api/thermal/exynos_thermal_emulation.rst b/Documentation/driver-api/thermal/exynos_thermal_emulation.rst
index c21d10838bc5..c679502f01c7 100644
--- a/Documentation/driver-api/thermal/exynos_thermal_emulation.rst
+++ b/Documentation/driver-api/thermal/exynos_thermal_emulation.rst
@@ -28,13 +28,13 @@ changed into it.
 delay of changing temperature. However, this node only uses same delay
 of real sensing time, 938us.)
 
-Exynos emulation mode requires synchronous of value changing and
-enabling. It means when you want to update the any value of delay or
-next temperature, then you have to enable emulation mode at the same
-time. (Or you have to keep the mode enabling.) If you don't, it fails to
-change the value to updated one and just use last succeessful value
-repeatedly. That's why this node gives users the right to change
-termerpature only. Just one interface makes it more simply to use.
+Exynos emulation mode requires that value changes and enabling are performed
+synchronously. This means that when you want to update any value, such as the
+delay or the next temperature, you must enable emulation mode at the same
+time (or keep the mode enabled). If you do not, the value will fail to update
+and the last successful value will continue to be used. For this reason,
+this node only allows users to change the temperature. Providing a single
+interface makes it simpler to use.
 
 Disabling emulation mode only requires writing value 0 to sysfs node.
 
-- 
2.43.0

