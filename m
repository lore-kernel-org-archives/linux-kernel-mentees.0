Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAA3253956
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 17:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761499591; cv=none; b=qcTbjbbPDGoWjNb50lToe092YV74LujnNf90xfv0MshVLe2vbKennOOvip6ehhWT8618TaTsbn9lHY/Y8zxBMwnqTRkdPYGtjl6HRX9eXSh4ITNzEyWFOCoTk8hyjqnTrXUJ460LhsUYoc8hCBf4XhiR54+F4qELggkXVw3vehg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761499591; c=relaxed/simple;
	bh=PUQmCPoHMTdvsW8ctn14E6LZQyRG6SCbf1UxlHwI0Nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lvWnOkW+b6JuD4/McjuPr9CvdXzbB8uMCncTGhh2RpVEeBreJ42SiZrxZN7CcKPDvbHbCn31Qxe7chfkiB8X74OUyyE+6/IM5IgEg2ybIbtY9ZmEh0Xg7Y8DkajuJDyF4rw8fr9j6qP1ljWXnEL3e97nB92+22b1TCteA3Zm56U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSmIeSFS; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSmIeSFS"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2A6E408F4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 17:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kcpyKZAJdMA for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Oct 2025 17:26:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3B424009C
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3B424009C
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lSmIeSFS
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B3B424009C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 17:26:28 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-33fc9550f68so668753a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 10:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761499588; x=1762104388; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBFcLw5BpNBFfDz3lZj9Yn2OsQ5b+bNAVNgkkfKHEVQ=;
        b=lSmIeSFSbyezGHU956V2YfJcmKS8J0SFLl+IJQK/p0TUWsl3x7eaBz5W3Bp3K2FTO3
         1P+qF5Gjuq7pgEsfmpIyu4Wxu4qD3MpADFrSiIhqClqStEii9f3DEmu4xUwW70UKriKc
         JnCDto2xH+jpe+bQeGsOjJHO7CflH3KCbwgqyWKpYh2ZIRSlElLov6DlkbUotEsu7y8p
         xGOafeEBiybQUFBRmd/D99xO+w1vKQWjt96KQjWwwIBRTlJUbHig+CQu6RmImgn4C1m/
         OWtsK/hhlWLwrjzcoBmhYAHimsmVJzTYcB1QycgkIOsLhXNOcDD5nG4AJUFurwyhseb4
         ZbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761499588; x=1762104388;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBFcLw5BpNBFfDz3lZj9Yn2OsQ5b+bNAVNgkkfKHEVQ=;
        b=k4UQDY30BtLjhC7FipucUXz5i15WtOxhCxpysvZyzR8ZxWciJkvP3Ybpd8b2hpDhAo
         2AakfVSzOKzqWZIEfQuksi2oJr7vBfd8y31l4BZK79WJRuBP2h+bo5kjYkcOLDrN0zKU
         hr9IlGB59o3n4l/vL6F8BaDJ6k9BqvQs3PT53PCpylaxK/RV3sBWXaWdfSHkMpmJhBv4
         AXab+FIZw1Lfq98r4pQSIRrQKxnH1WaNK1+POFzgnrqCZw3w0SzvRH1eylwcEbj7aNHf
         JoEB9aHBhkK5voZAdPDXKewot+ls+5f022a905ybhKPQUM4kYJ9Xuc0vW9Ja7B30WymD
         o3Ew==
X-Forwarded-Encrypted: i=1; AJvYcCW8S2qaNehqlollovlDL8486ok//O6jKcoJwGYlKCVkcD3Sux24D1becV09084Sfylfe/wTMEonbxI8kdLwndPxU3tIww==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxth/xJ8sEQiyhGs0TsuZOTxRfaP3fDjhvPnJuy5Yx02x/gmAMc
	rPtttbPWvSKzSjFV0ZfafUU5vMPCtwYk5uUiLBB9yUqF+DATWV7BSomx
X-Gm-Gg: ASbGncvJgUUVUXksHEhL8Vjuq5N2h88q2kCTVaquWGCex20+WI3zODhFn04QV7odjW1
	x7vQuVW9DFDiWtJq2XTMMrPLNz/wrrVqV6ojo3lk2IZF99SchWkb+C7FiSv2bgzxBIRQ+nhVcKU
	CiD2wN8L+UOHRQmfRqdmlOFYasHuWKvpj9xuWXUb9KAuhn5+jDrQP+z/PoeD6cWKF+henl4nDCs
	8DxyN+FkDFOzrOvbpiSv9LkdQ0JRHhqVcJ9QWXjkx3C4k1FNyJEPhYrbCt837wOBTtswThcOUPe
	5WfAjtP/GRuq/J/m9UC9LBQSlvKoBrWSVDi1Fi8+Sd6VdpY3k/C2emonPD9/2EmYUh/SWHxbMha
	ywGLanY4U3MWyPGsBs3Ma+5unppMX/WubHUudeJsN/6N4KHhjSH6XkTYGL6gt7/5BkiT+KXvReT
	sdW03+ueARuIqrOVIVGWu/ly9RFC8M6/3XAh9pnB9Mj0YEA9XT2v05
X-Google-Smtp-Source: AGHT+IExMSyElm0YxdAezEoVlByvabJImhmVB6WrfVipcFwJosQYBkwt4hrxz8uBWbeds5UW5QFeaA==
X-Received: by 2002:a05:6a20:258a:b0:334:8d22:f95d with SMTP id adf61e73a8af0-3392f835684mr14940008637.2.1761499587735;
        Sun, 26 Oct 2025 10:26:27 -0700 (PDT)
Received: from [127.0.1.1] ([2406:7400:10c:a59a:f324:3a40:f5b9:3811])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414015724sm5433692b3a.14.2025.10.26.10.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 10:26:27 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
Date: Sun, 26 Oct 2025 22:56:16 +0530
Subject: [PATCH v2] dt_bindings: sound: ti,pcm186x: convert to dtschema
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251026-dtbs-v2-1-cd3b713a288e@gmail.com>
X-B4-Tracking: v=1; b=H4sIALdZ/mgC/13MQQqDMBCF4avIrJviJCqkq96juIhj1IFqSkZCi
 +TuTV12+T8e3wHiI3uBW3VA9ImFw1ZCXyqgxW2zVzyWBl3rFmuNatwHUcYZnDprqekQyvUV/cT
 vk3n0pReWPcTPqSb8rX9AQoWqsYbQOd2age7z6vh5pbBCn3P+AvDPeSaYAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 david.hunter.linux@gmail.com, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Ranganath V N <vnranganath.20@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761499583; l=3652;
 i=vnranganath.20@gmail.com; s=20250816; h=from:subject:message-id;
 bh=PUQmCPoHMTdvsW8ctn14E6LZQyRG6SCbf1UxlHwI0Nk=;
 b=kjNKEEdaT5Oxrzi0nbqHtUt2Gaytpog/0p+HvEumeOqM+G4795JeBDHfr1TnC1bRxuwtHWRRd
 GE0gKtCdUjDD18/H2P3fSzgT5unbP7owrLdnTh3nazo3O3fS1FLhm4K
X-Developer-Key: i=vnranganath.20@gmail.com; a=ed25519;
 pk=7mxHFYWOcIJ5Ls8etzgLkcB0M8/hxmOh8pH6Mce5Z1A=

convert the Texas Instruments PCM186x Universal audio ADC bindings to DT schema.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
Convert the Texas Instruments PCM186x audio ADC bindings to DT schema.
---
Changes in v2:
- Fixes as per the reviews suggested for the v1.
- Link to v1: https://lore.kernel.org/r/20251021-dtbs-v1-1-493c1aa253bc@gmail.com
---
 .../devicetree/bindings/sound/pcm186x.txt          | 42 ---------------
 .../devicetree/bindings/sound/ti,pcm186x.yaml      | 61 ++++++++++++++++++++++
 2 files changed, 61 insertions(+), 42 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/pcm186x.txt b/Documentation/devicetree/bindings/sound/pcm186x.txt
deleted file mode 100644
index 1087f4855980..000000000000
--- a/Documentation/devicetree/bindings/sound/pcm186x.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Texas Instruments PCM186x Universal Audio ADC
-
-These devices support both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
- - compatible : "ti,pcm1862",
-                "ti,pcm1863",
-                "ti,pcm1864",
-                "ti,pcm1865"
-
- - reg : The I2C address of the device for I2C, the chip select
-         number for SPI.
-
- - avdd-supply: Analog core power supply (3.3v)
- - dvdd-supply: Digital core power supply
- - iovdd-supply: Digital IO power supply
-        See regulator/regulator.txt for more information
-
-CODEC input pins:
- * VINL1
- * VINR1
- * VINL2
- * VINR2
- * VINL3
- * VINR3
- * VINL4
- * VINR4
-
-The pins can be used in referring sound node's audio-routing property.
-
-Example:
-
-	pcm186x: audio-codec@4a {
-		compatible = "ti,pcm1865";
-		reg = <0x4a>;
-
-		avdd-supply = <&reg_3v3_analog>;
-		dvdd-supply = <&reg_3v3>;
-		iovdd-supply = <&reg_1v8>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml b/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml
new file mode 100644
index 000000000000..306905eebd68
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml
@@ -0,0 +1,61 @@
+﻿# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,pcm186x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments PCM186x Universal Audio ADC
+
+maintainers:
+  - Ranganath V N <vnranganath.20@gmail.com>
+
+description:
+  The Texas Instruments PCM186x family are multi-channel audio ADCs
+  that support both I2C and SPI control interfaces, selected by
+  pin strapping. These devices include on-chip programmable gain
+  amplifiers and support differential or single-ended analog inputs.
+
+properties:
+  compatible:
+    enum:
+      - ti,pcm1862
+      - ti,pcm1863
+      - ti,pcm1864
+      - ti,pcm1865
+
+  reg:
+    maxItems: 1
+
+  avdd-supply: true
+
+  dvdd-supply: true
+
+  iovdd-supply: true
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - dvdd-supply
+  - iovdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@4a {
+            compatible = "ti,pcm1865";
+            reg = <0x4a>;
+
+            avdd-supply = <&reg_3v3_analog>;
+            dvdd-supply = <&reg_3v3>;
+            iovdd-supply = <&reg_1v8>;
+        };
+    };

---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251021-dtbs-3a31f699c461

Best regards,
-- 
Ranganath V N <vnranganath.20@gmail.com>

