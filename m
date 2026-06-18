Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C522EAB72
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 18 Jun 2026 18:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781805810; cv=none; b=vDcDcCOaMhjJP38/ftYCmnsxbAt1pfSGWRyduGhd8VThicjCTUdDjE47Bly5VIuQ2F1rjqVElKRtOTRBV8fYO6ol3wZu9SYgZOKIgwPvlXYKybs+iHzTQVVkwSvGZdrx9fQHvH/FkktM9w/75w6D/ZqQbX17jShqZSwNzRGBvRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781805810; c=relaxed/simple;
	bh=oGC7L5TtVt/RanN5pjTzlERB2K6nlzG3KqEBZucZ1/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mkAbRR7I7+drXqKaMaRvRKDHpCSbrrdGcUKsMhFpnbqBARmZoJvX0N9fNXs5BaHKxeyx/FoHZYRP1teRLEYgkfToL+Q9EmmURDLJUTo4EsdGnL7QZuq68l11Tr85/VVQQ/3wzUW70++niqWbOxfcCfOKUA/z5ue0y0be8ZTTISA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUyKnnwd; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUyKnnwd"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c897468a244so458899a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 18 Jun 2026 11:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781805808; x=1782410608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=grMDKhiWxgS01CbGWcoqJuDZbxUtQgSQcTHTndsyXt4=;
        b=mUyKnnwdlXCTciJJyzE4BR8Us+P8gQIObN/lpJ/+8LkuF1pLmB609hXarlKIASMHNj
         Y/+HPpMX8+vOI7OlxvsS6CvzLZ/9RePtGTkU/Ra4TqGt6XtOwX+tS+aCwnydU2M9v9pA
         RyuN0ZUzwWrieJY3sfP1KXudMbXKNc+r34YLTYyWdt0gWx9OrBEYSTb7iUYQkHB5ozy1
         w7zEegWGZtI36dhxpPfeUbUPItoenvgUGCUVa7I0owLz5fddDpsxUg/UzWkp6Sc3Hz0m
         F4X4L63GyXouDHtSFCpvxmBenZ2tDqpmcfqtcq/M16+skdbK1HdT2qzSb/EyNEF3cWGJ
         nqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781805808; x=1782410608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grMDKhiWxgS01CbGWcoqJuDZbxUtQgSQcTHTndsyXt4=;
        b=okpoUYrhoobI9JuEYaFuH6ZfG422vXnVr50jNYCdiOto9hYix0yIP7/loBFvowDBfV
         BWU1ETPoU9IsyQf3izJankHXqMfunxdDxkWWNBM6tROL3zOGLXGpF+e8sNBEOw7AU9os
         v/x3OLzutMytUN2PizU14sU4+YhJpib+ND03W40eLttPf2G/KnWCPUvhqlblkPLPZhgK
         pcTkePDgEguu/NPEzzWL4xMitgmojgmgAo6qahPM0OytkeJe7O019kY5tTgsQI35Gv53
         CLD2G4TTlc2uc7ct3cKWw8PYMzJ4Aw1VERfqBjlGDplM6hkORTN2YonSx9ZHxGIUKH/R
         Bfmg==
X-Forwarded-Encrypted: i=1; AFNElJ9pZcVSBLDCyBIkGs9BCFl1bLnb5HLpldA71L8puePyV+3mJUSk38IbVZZsQ5WJkW5SYXt5a2+n1Mbgnh1SRWbQ6T3xoA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl0Dgovo0tDPobVMnQLNivY1fl8dWc1RGAdw8E0l6mVLg+RQTU
	zCyk6rY0wLZPh7o1WVvZlru6A81OI6uPm3jDMTWdngodIukF2s9sn8kz
X-Gm-Gg: AfdE7clDoAK/LgKpv2cA42a4RhCqUf/0bgrZF5ilY2nWrxsm2cB2UeDpF8da0s8gxI8
	ioY4VQpSC87Py+VyVveEvRQFCkm4LS3uO/MAvbi9eAsjQ9VCBJjXsNqXIVu3mg/Ob5gMJN8vxFJ
	w3Xa00WeNxfPGGovu13YiwFywx0PcWH7rNh3MqVV3l70022U6DbKWazZwkVUD5XdhSBonhp5om+
	VHnJyZgBl16IZF9bAJQ+gVFwDq5Pr89104KmQwL+1mDz2HKPtZJfkM7IvaxcvFIMwSoQQY/BisL
	/Rjt9kKTaNlKiRsN+t856/ngbSRJD1StIb7qjLDP5yNQ5aObjuLM6RNDNG4ebYQw19baRr7ZOwL
	3n0Kd1ZqVHt/uCnCBntiGCPAXQdedyQGvrRxqdF3ZZzBuEY0xPy+nfBjmRvO1T5eS32b8ekyBXe
	REh+2vJvotrl7PY+USO3c78NJIQ1gyZq2RMv+4U5FjIVWYAxD104L0yiWNC6pSlng2dJkXyQ==
X-Received: by 2002:a17:902:ecc1:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2c718cc4b81mr2759425ad.1.1781805808229;
        Thu, 18 Jun 2026 11:03:28 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6be262b93sm64348865ad.68.2026.06.18.11.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:03:27 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	david.daney@cavium.com
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v3] spi: dt-bindings: octeon: Convert to DT schema
Date: Thu, 18 Jun 2026 23:31:49 +0530
Message-ID: <20260618180149.475658-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert octeon-3010 to DT schema

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v3:
- Change the maintainer from David Daney to Rob Herring

Changes in v2:
- Change the maintainer from Mark Brown to David Daney.
- Use soc node wrapper instead of root node in the example to handle
address-cells and size-cells requirements.
- Remove interrupt controller provider from the example.

 .../bindings/spi/cavium,octeon-3010-spi.yaml  | 61 +++++++++++++++++++
 .../devicetree/bindings/spi/spi-octeon.txt    | 33 ----------
 2 files changed, 61 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-octeon.txt

diff --git a/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml b/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
new file mode 100644
index 000000000000..f0b708e1ccbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/cavium,octeon-3010-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cavium, Inc. OCTEON SoC SPI master controller
+
+description:
+  The Cavium OCTEON SPI controller is an SPI master controller found in
+  OCTEON SoCs.
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: cavium,octeon-3010-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        spi@1070000001000 {
+            compatible = "cavium,octeon-3010-spi";
+            reg = <0x10700 0x00001000 0x0 0x100>;
+            interrupts = <0 58>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eeprom@0 {
+                compatible = "st,m95256", "atmel,at25";
+                reg = <0>;
+                spi-max-frequency = <5000000>;
+                spi-cpha;
+                spi-cpol;
+                pagesize = <64>;
+                size = <32768>;
+                address-width = <16>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/spi/spi-octeon.txt b/Documentation/devicetree/bindings/spi/spi-octeon.txt
deleted file mode 100644
index 431add192342..000000000000
--- a/Documentation/devicetree/bindings/spi/spi-octeon.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Cavium, Inc. OCTEON SOC SPI master controller.
-
-Required properties:
-- compatible : "cavium,octeon-3010-spi"
-- reg : The register base for the controller.
-- interrupts : One interrupt, used by the controller.
-- #address-cells : <1>, as required by generic SPI binding.
-- #size-cells : <0>, also as required by generic SPI binding.
-
-Child nodes as per the generic SPI binding.
-
-Example:
-
-	spi@1070000001000 {
-		compatible = "cavium,octeon-3010-spi";
-		reg = <0x10700 0x00001000 0x0 0x100>;
-		interrupts = <0 58>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		eeprom@0 {
-			compatible = "st,m95256", "atmel,at25";
-			reg = <0>;
-			spi-max-frequency = <5000000>;
-			spi-cpha;
-			spi-cpol;
-
-			pagesize = <64>;
-			size = <32768>;
-			address-width = <16>;
-		};
-	};
-
-- 
2.54.0

