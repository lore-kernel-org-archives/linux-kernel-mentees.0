Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F21332907
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Oct 2025 06:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761807291; cv=none; b=KwH8z7SfLOLR4pmuA2zB4QWI4JVCDzkCP/jwnqiZZWWvI8iZ9V1rdwoFyYh0pybJWNxRfUf8dFOrUPKZEHv8PJm0eYvMaeK92hgrCtbzdiRW5NcaADj2nDC5U8xdnWmAkFMFEYNFW2qi/6jscyzjajXnKCiHzMfooEx+NFBv1uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761807291; c=relaxed/simple;
	bh=pmx0nurs79ki1NBxGeHHN/YIRDeLb81Jwt8NJP8HfBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V6Cb9eUIUobC/i9dMOwoozlJZoUB2eV7nvaJsPJmjcM+Ue1JXHNR2ZgtQFfFKWojfNc2ByV1kqL0pVVc+GV5GJMWZnxCwkhAI1CPrRF/5KQCbP0Kox7y+voUsso/tw5NQtLjhtnhnzY8gxTmzrpiWsKPn73FyIksHb/9SePEbnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/oHgLU/; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/oHgLU/"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B3981FFC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Oct 2025 06:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JySxDudmJ2Td for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Oct 2025 06:54:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBCD281EC3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBCD281EC3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g/oHgLU/
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BBCD281EC3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Oct 2025 06:54:47 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32ebcef552eso123582a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 23:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761807287; x=1762412087; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hGlotEttnjbIACeN7dXLLDJ30vr8ASlUwkVHw6j0GwQ=;
        b=g/oHgLU/DzZARGaEWa4yAVR1uTdZVNm6ebai2e1amm8KvE7a+igmTz18ScJyjaJW7n
         HiwW38z9nty+SKksxtFCuTa5i2UMgNcU13zFMSOX7YWo3ZmFRp4mWIFhR+a7bYsEqPSf
         ISl6igGjuzEjyRwLru5mx/eSPglYeGWV9h0xQTuAXOd+NqjEJe5GTDEmrEtNJAzvinmo
         JUstGfxweIrp1v0wyOvx//lvtkCVlfQdhw5QlNpzhX/KJ5mtPm9EIgqaWT22TrAUn5jo
         v2zgGNtnP1iiwLAq5g0Gl7MTQ57+SrpJsdz+85ZhF0gJluz4WlV4m0RsLru22dd4Au6N
         aG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761807287; x=1762412087;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGlotEttnjbIACeN7dXLLDJ30vr8ASlUwkVHw6j0GwQ=;
        b=eIv7ece6kyaZuLg2nhDKy5slaL9WH9gYzdEUe2SyTEU5td/05j2eqY10o0H/CkhFJz
         ClVX3H/eAtammXbsZPko+L8MMtaq8XDMHXZihL4EQwYNPryVu+vPmH2PqeglhtOF822u
         RD+vffXkqau7loCCecjFhov3Z/blqSEz+SkSM4yj44l1WUA3tjRyPq31hWbCJgmAq15b
         DqppgdHmgdEUytcYAyU3ZuyrcXfNcyMUcYDYRvRBKWNQ6xxSYFmNDHJv27cwptmbg1T/
         2icJPWlHqI/U5yvXzI1MHZ/RffbXc8apNfW2Si/w2FOGFrgKlBkRJpzjF1ob8gmqgdXZ
         Bt3w==
X-Forwarded-Encrypted: i=1; AJvYcCXsjcJz1xX40o2qGXu8DDNzya+8RzI9bRVOkiUB60oL2yyYCSqtxCIt/LulQNZzDHItlhhNhBzR9qQ+u68XuHwkZiHUcA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzdfUFCa764eQSoMeycbZPvPnDsafbZeztJN6MS8sn0W9+i2EQp
	lL+K/vJwS84Th2dTZidZXlJ24ZO+MyPtAKGZbebdWDdGcm0IB0D8yktu
X-Gm-Gg: ASbGncsA9K9HhNEoDc0s15ju0Vl8/TTDIQ5L5gX7Oqm54NjITV9cxbujfdlZH755/Bb
	uZ+FEmYf/A9+Jq5XAer9gDC9vlK6bdQhQDoh0KklrrHFKnnV7435KO6Cn5TAPlVm36MYHbriryN
	vpLrlrQlbXhlIOpf6nXm8Ws7OrrHjRBf2u7UpV6ReWsJHCcOapejntCP+2zJ17tg3tG/tigcNk1
	YNModJBUEyfCL6Z+ZpHz+is+xymqaEcju9jhiqeGunNCCiL/T8UcOvcajMoq6H8YIFfw4KKiUWd
	vLtsUj9xtmwgemerpSOgjIJ7nlvmi7OgAWMZ6DttF7kwYCJVjynSegy0vzwIsOb2JiCUwfpyBMU
	+6JPJnOobf94nlbTBDLj516RVIpLgZ+2dX5x0ISJRCGxrwMxHvTmSFzlDQRHbKofdy+SZZL/oTy
	AtwXoWhYL1Jp4tOQng3LTXCQRYmsn5gg62KZbhcoDqqS/ZZA3LfGBG9QppwgvSjVg=
X-Google-Smtp-Source: AGHT+IG9OA3qsogtmkvIU4R1MP2hkyCeHbgqs/ev0H2tjRcnChJLoNlY+IE3QTZqZp/Mb2SCb/FtDQ==
X-Received: by 2002:a17:90b:384d:b0:33d:ad3d:1a6f with SMTP id 98e67ed59e1d1-3403a3058a4mr3408683a91.8.1761807286514;
        Wed, 29 Oct 2025 23:54:46 -0700 (PDT)
Received: from [127.0.1.1] ([2406:7400:10c:5702:ef45:c60f:9d38:fa84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340509894c9sm1379138a91.7.2025.10.29.23.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 23:54:46 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
Date: Thu, 30 Oct 2025 12:24:30 +0530
Subject: [PATCH v4] Asoc: dt_bindings: ti,pcm186x: convert to dtschema
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-dtbs-v4-1-3fff32221119@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKYLA2kC/13MQQqDMBCF4atI1k1xZjTVrnqP0kUcowaqlkRCi
 3j3RnEhLt8w3z8Lb5w1XtyTWTgTrLfjEEd2SQR3emiNtHXcAlPMIUWQ9VR5SZqgUWXJmQIRXz/
 ONPa7ZZ6vuDvrp9H9tmqA9XoKBJAgs5IYtMacKn60vbbvK4+9WAMBj0jtCCPimqobkMaiMGdER
 1TuiCIiZlCICIx4RMuy/AH2DN07AgEAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 david.hunter.linux@gmail.com, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Ranganath V N <vnranganath.20@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761807282; l=4119;
 i=vnranganath.20@gmail.com; s=20250816; h=from:subject:message-id;
 bh=pmx0nurs79ki1NBxGeHHN/YIRDeLb81Jwt8NJP8HfBc=;
 b=5inaXHj5dX/tUKwdXhQ3ZDbt889TpyNXOeWQEWHjGVrGHqCJjqvkW6aWeO8aYy8ykJVpoEdiG
 idXfkURS9RvDPhSgAZ+0UUoHPvc0BHT9sFV7AUgjnZkGosHQkzXFhu9
X-Developer-Key: i=vnranganath.20@gmail.com; a=ed25519;
 pk=7mxHFYWOcIJ5Ls8etzgLkcB0M8/hxmOh8pH6Mce5Z1A=

convert the Texas Instruments PCM186x Universal audio ADC bindings
to DT schema.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
Convert the Texas Instruments PCM186x audio ADC bindings to DT schema.
---
Changes in v4:
- Corrected subject dt_bindings:sound to Asoc: dt_bindings:
- Corrected the filename to match one of the compitables in the file 
- ti,pcm186x.yaml to ti,pcm1862.yaml
- Link to v3: https://lore.kernel.org/r/20251029-dtbs-v3-1-3cc162221c22@gmail.com

Changes in v3:
- Unicode FEFF character was present in the begining of the file,
- Removed unicode character.
- Link to v2: https://lore.kernel.org/r/20251026-dtbs-v2-1-cd3b713a288e@gmail.com

Changes in v2:
- Fixes as per the reviews suggested for the v1.
- Link to v1: https://lore.kernel.org/r/20251021-dtbs-v1-1-493c1aa253bc@gmail.com
---
 .../devicetree/bindings/sound/pcm186x.txt          | 42 ---------------
 .../devicetree/bindings/sound/ti,pcm1862.yaml      | 61 ++++++++++++++++++++++
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
diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1862.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1862.yaml
new file mode 100644
index 000000000000..72a3e1dde0fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1862.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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

