Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CBA342152
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761059033; cv=none; b=si8lZWAFPj7oe/sw6L9e41iyCL+TTdHLdLULfOvB4fGoEbT9naxKfJ8uGDqWlxfI2OxEyRMNxDN52KjHX8pGiZoVNDrjF6Yzg0QFYSukK4N0bcjubRwJNfkXMLaafKGUzFkc8UkGie9hFtFmteCjCjzSTKfFiBkW5kDH60iaZXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761059033; c=relaxed/simple;
	bh=MTl8e6FvdDgptg0eKJyfIELgy4CuOKugQjNWa/1WMIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ECQ4ILxdjDPBpJxzhOpfWEb3+ChaX2J+hk1vsEHid9P2oD2xR4nIGMfprqpazVWwCG/32ZCZsQAJ6g9ZnnH4IskDS1L1serc93+RZ7wtFSZXmPIVtKfeKVhTUlLe9QgAlPFaB6+rE2LJJBCtXbKsRLPJCf+Ni/YXNC7IN1YqDmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNPTboNS; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNPTboNS"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D73F8081F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 15:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGU-FrAgul0o for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 15:03:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9165E80776
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9165E80776
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QNPTboNS
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9165E80776
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 15:03:50 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-32ebcef552eso1077806a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761059030; x=1761663830; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtS2KYjF9C6m7c6lSBx/YCEBGO2iHFvA7LA8AcgD1BI=;
        b=QNPTboNSafPeTZiiSja4bzNnY/iDfwsVicpCs+QvFdeWPZXxD9ccA5gSMO34vbIwxs
         d2EHVfa2XR6UTRQfs9PcSvWXhIBySIpd+TXTjLVgkLl+w9Ef50qn4ENvC3BBWzVtaSBW
         9glAZl3kCbQkTLijzR32E2Srb8+5p52MUbnmIOnX8dSruKeqWcFMn3uXRPX51P06SsFV
         r+JFmAhUZkj+6li2LE35/p6Pbv5ymb41TTPx23ZTPQTce0hmpCIl/CPt2rMiukZrOHW5
         4oEsz6sPthUJrjKc1w5J0NIcB3sHA9MBK0ZIOaw6oYcGJVQjTskPffs8ylaKAPSq+1ez
         hhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761059030; x=1761663830;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtS2KYjF9C6m7c6lSBx/YCEBGO2iHFvA7LA8AcgD1BI=;
        b=GQWb+OXVkMFlm6sAO6iSzHvROb7GkinVQFB9AXOG6zzVbT8KloXhz/Sc8dObzpMQlf
         seyWnt6aKztDOECDUVdgjwSOWL/1fUEkrPYmX/Mf9Z3fIAWI0IycH5tmRtmbLxB9OE7u
         AY5jEEQcVkXbD98ck5Do7vgqGqXl0WNHRcz2B+780H8l226i7QA6GldgX2FScfZUmQYG
         e+72CxgXiVDpNuHMum3qTi2b4QdlWb02bbRP/MHehORcwhQXbNcM/uHenToxSPdGzVPx
         j5iVP72bj568sAtAX830kWyHc0vavh2OGuIQfP75CuxQar9A/9NdlgEkkRNePohPaTLj
         gEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQm/iWo9qZL9Yg1n7nWiqbwg3A2jo7yFHowPCTu0bZTkFyBZ9frIfIBllRZhl2NKyhh2ZtiQuhTsYZAFowIW3zxML/rA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwLiJ+TYcxbBc9pDo40vVuIOWJQfIRK2ujJWm4iXiFSeMO496Qw
	KkSu1X+tAd8yLkBgeSPsh16D3Lla3r1PVoo8WDABvjDrPf/rX9HaEWfT
X-Gm-Gg: ASbGncsk55fuI5KAZ7kQsabQbDeumvGg97cJ83aCetUOnGXqSV9GhYKlbEt9uPYGHx4
	uuT1hNdZOn8t1t/mXrpSQJYSTvgVZfbpQn7eH6MhhWlr5mOWyVuuRM2xUSdv0PyDGNUfjB+RSp/
	J4eqSh7epm+oOIHuYmIsa68WxbKiAIxxFsdDR3eJ/aWRCJLSO6Mv9kF2dw4O3vdE1DyE8HcR613
	5+RoUItlDAFBlCYQUlVTFbesiP+7KPBwJpqsCJX4gNDr73n+8t8WmrJevwwEDMhsIDZsdx1S9ZC
	f9yB5Ouw95iWWjSTiJmO+ecYGONiFA48pOw130LWSEShcd/SW9sBjsnccdqZMtR+VBBsNJCafte
	6NmDvmjMrXiDJkFSbJNDg0WcYazlT9kl5ue2OEtLyGFSjwF5A3avNFEzcvnLqRP0aNvtCpwRVv7
	nUexRtHyz3ee+oWLgcYCbqbfIA/l7Z+K0+FwztWNiY3Qy38C8yOp1t1LljOmmDTus=
X-Google-Smtp-Source: AGHT+IF9dhdv+GnM0X8CatQYTHZGAxeDpCAPm+nYE1Dxzv/2JQ9PFVVQo2kRTiZyRHx9CBETNW4sbQ==
X-Received: by 2002:a17:90b:3ec1:b0:33b:8b3b:4e4d with SMTP id 98e67ed59e1d1-33dfabe6c83mr2276188a91.5.1761059029368;
        Tue, 21 Oct 2025 08:03:49 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:c8fb:fb07:e608:6e67:4b89:c950])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5ddf16bcsm11262487a91.4.2025.10.21.08.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 08:03:48 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
Date: Tue, 21 Oct 2025 20:33:40 +0530
Subject: [PATCH] dt_bindings: sound: ti,pcm186x: convert to dtschema
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251021-dtbs-v1-1-493c1aa253bc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMug92gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyND3ZSSpGJd40RjwzQzS8tkEzNDJaDSgqLUtMwKsDHRsbW1AGPujfR
 WAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 david.hunter.linux@gmail.com, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Ranganath V N <vnranganath.20@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761059023; l=3793;
 i=vnranganath.20@gmail.com; s=20250816; h=from:subject:message-id;
 bh=MTl8e6FvdDgptg0eKJyfIELgy4CuOKugQjNWa/1WMIU=;
 b=NDeufFCatSIEJ+XlUbRt6fFMRPYXUU1B2saZtZ3lyUdBa4tlln2VMNB8FrtDTvk4PN9u8vkkl
 zVRSJbLvhnMBOzpZH9I1YylZ5zQJiCGFvxoYvaIYFlMAoTsbQeJSTDt
X-Developer-Key: i=vnranganath.20@gmail.com; a=ed25519;
 pk=7mxHFYWOcIJ5Ls8etzgLkcB0M8/hxmOh8pH6Mce5Z1A=

convert the Texas Instruments PCM186x Universal audio ADC bindings to DT schema.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
Convert the Texas Instruments PCM186x audio ADC bindings to DT schema.
---
 .../devicetree/bindings/sound/pcm186x.txt          | 42 --------------
 .../devicetree/bindings/sound/ti,pcm186x.yaml      | 67 ++++++++++++++++++++++
 2 files changed, 67 insertions(+), 42 deletions(-)

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
index 000000000000..f1ade490f688
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml
@@ -0,0 +1,67 @@
+﻿# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
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
+description: |
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
+    description:
+      Must be one of the supported PCM186x models.
+
+  reg:
+    maxItems: 1
+    description: |
+      For I2C, this is the 7-bit slave address of the device.
+      For SPI, this is the chip-select number.
+
+  avdd-supply: true
+
+  dvdd-supply: true
+
+  iovdd-supply: true
+
+  '#sound-dai-cells':
+    const: 0
+    description: Number of cells used to identify a DAI endpoint (fixed to 0).
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
+        pcm186x: audio-codec@4a {
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

