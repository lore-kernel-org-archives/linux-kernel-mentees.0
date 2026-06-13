Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B236D395AF1
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 13 Jun 2026 19:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781378644; cv=none; b=KRTDlJZ4KbG3MfNtRiOZJEWZJflWTyTqOZoRuo0PbY668xFx4urz22oJ4epN+/mMFV2OzyJXJ8A0AK9xpXUNSXEBAz8QG/y7btofqaz/ekjOnmQXWwsQEdV6JHD3J1ZDYbehmAV+JnrmcRGL6nxfKyalvdLY2u5rH7LorvR9SCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781378644; c=relaxed/simple;
	bh=7rwSq0SrGdEQBmnV4uKLdu242Sdx64fS4O/VIHJ/K30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TJZFhmJp1I/QM82jTdJoTSE0niCUjIOogmKoiC5vfyXM0fPnGbV9q148IK0IIpQdDs/zeiV+Vpp5Tm2x8aLfge8KgsWcNeFZQ5lzQVuARwJrnLGwJtkwJ6orNnvJW9nRib/koYN2yvFrfNhoEq4EF8i/oCgUY3oBrzJc/hByEQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTzPuQx6; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTzPuQx6"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-842288702fbso978151b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 13 Jun 2026 12:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781378641; x=1781983441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w8022n++FT6lM5F9jV25aEA6KvKK+0yJkAo/E3Gfkzw=;
        b=mTzPuQx6rWEaXxgLGwfH9S0efGCtrAhy/pbFJRHZYruikRXRl55kDzC21k6VwR5j7t
         M8A+v+DHpLq9bpcXxxb2xBID0pcRP+6Kf2lsejcXoT72YxlidcjO0XQm2OogtDDD/xL5
         4TdEtKpdPSKGzbj1NISBpQXf+0w5TdpyuOer5VsGHqnSo/0uS3/6a+8/KabFiPpYT45Y
         Y3SZ4uoA5s/xMe2R2Ezx/qfgt8YwZ71zSmV/wSytiEA3rr+rbpduTTx+UHPt9qfV4PAb
         e64EHahSNzbOVWB0j8pYqyCjIWH1Xq+c4fAL5KqGRNXauO50DwZMaauXejZdMZNOrAQm
         kKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781378641; x=1781983441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8022n++FT6lM5F9jV25aEA6KvKK+0yJkAo/E3Gfkzw=;
        b=bnrQMiWxHDGDKuH+MvOzPOstu8O2uQmNheeKPoTFfrk/lDVoVB0OTVajHF5G4t+Zjl
         0MAbGq1qIBQjp5FpQWRM183R89V2V+tmVp0K04ygbkxCl+kq18oQoBg9cNwntG1hZZkU
         ydgFOtLjDDzl4VOO8vGldhY+wmrvU2LJW8WxakDRyneHojrcupQma9yxYj3z9m6mVul4
         MJRs681uwYtugifzVCsHtlm/cL0GGNyYWNKHPIVvO7cRGtl483WDm3yQJc2X4AlK90f+
         f2cBGSZS9YQ+J/clycprWoMRUGqtCj3JifCfdQgYdmXlpH+4/4mH4LXWri6SSHlCXLhI
         GTcA==
X-Forwarded-Encrypted: i=1; AFNElJ/uQvaBBqNFoq/RBXqOS1Dgw4T04X61ZOk1YqpBtkiIz2bD635hj6OVcJuH5yoZ2O8Szs1Eo6yknBhNpyAILDmL8Cpaaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1VNBz0BSHL1nVaLKVDc6J3CH6Rnevq696nhruLPmu1b8+RcqT
	CFLq73sD0t97C49SjHu2fH/4RzEzTzGtLJUeY8rFegrEQrQ+1RxS0K6o
X-Gm-Gg: Acq92OFzZi556GfHdQkqT3Agso8D4O5rlLBlUL+DYLQd6ZEJVNRB8sZkK9Qom2wU1qE
	qTVFxBtAf7qasBDolR7koc5kdHw/BJPTkSO1vL9kPts9Rcy2UyjlPmRfR4IvQ3gdHRUm3tNPljB
	OFAIsLAnwyceiArXferYPFQ0bD1YMtaUnkw/6Yi6sivHKAmo0RUD0OMZK/WF6cAtA1GGQaQjYMe
	2UbmVEWW1X9jVEeCog9cUUW0ex2CR2bqeyI99gFlZbOeC5rkQuACbHMHF7JbGACzlK1+vMXjx1/
	w3gbIC66yRY3VwsswCLzG2ng+Y2w02dKI/uakX45xDG+xMbJNGMtMHyt6YnxJ038RA2bf8xCWoE
	UkzWSYjSj9ycJiCZh80bkh5p5/C6cUFPKcwAczFA+m7/hrUHTBA9vyvGLU0EwB79nJKC9wRzyLB
	3vbuytIB2VyFw3ZTOIiKb/IHeXH8/rh9BbOZj7U1pUKb/34VfdQg2yY6HiX4cq9iafYlf74mevA
	BhDbF57
X-Received: by 2002:a05:6a00:2451:b0:842:7f81:8079 with SMTP id d2e1a72fcca58-8434ceb199dmr8246337b3a.37.1781378640746;
        Sat, 13 Jun 2026 12:24:00 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acd96d8sm6725155b3a.19.2026.06.13.12.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 12:24:00 -0700 (PDT)
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
Subject: [PATCH v2] spi: dt-bindings: octeon: Convert to DT schema
Date: Sun, 14 Jun 2026 00:52:33 +0530
Message-ID: <20260613192233.2229933-1-ninadnaik07@gmail.com>
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
index 000000000000..e35e661d0a58
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
+  - David Daney <david.daney@cavium.com>
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

