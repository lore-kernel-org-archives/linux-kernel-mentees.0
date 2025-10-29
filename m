Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7279F2F60DA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 05:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761715405; cv=none; b=aICoUBGqTrnZEkUib1s4wzymBeoCSm59j45HKlQgCL3nCAmGcVRSXi0F+ZkfuzhCny5zzdlPkNJ/Tct887W1deitXktWVn86nhyeqeQMLK5ClkQgZABbupt0SIr/jVTLXMTHMLbnh1F8lV87groJjQyUqo0Y9qGfpHAHUezGies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761715405; c=relaxed/simple;
	bh=MVV4fn2U9kldtqYBjWGUoCfEKkSN8LPsc75pCGRRe34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IYwUCefW4h34OUFXkuW8LziqzmpUpB/KIUdwnd+62rQCXytDCbvJqMjENCgNJuaOaCQPEkP0a7tAi1irPXGnw6Lk613hPaPaxEViN4Sh7guhFTJSPZMjRjTMToh/6qjc5tKgHuv0sg+sC56NJMXNod018UF/VHUOB8cK0uuBV6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWYjsk33; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWYjsk33"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 268AD819CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 05:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHGPoDkvJ0Pk for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Oct 2025 05:23:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3BE60819BC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BE60819BC
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eWYjsk33
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3BE60819BC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 05:23:22 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-26808b24a00so9305465ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 22:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761715402; x=1762320202; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vsPKJDbsU1HLDhh7a3z0A0GhLekMgmfq9Z2ctQNja8o=;
        b=eWYjsk33fKPnp1Sp/2CQmbZ/xogNtJirPPv1onNDcKpXsvwzTMlza5hgzeTf6yp++s
         XL/Y1wpcmwKPLlqjzOhVaGu+1nRDIicSlCfXvKN8pMtGcpC4W1luNgTJbjvAq9FyEf8H
         OgczoClzwfW4ZCw91J8GJ9qk9s1n6wQ2jSBU5wfYrSetY8KIpKr1KC4Xof9XcAsWbDf8
         Ae5u8BJu9natn8oKDiehVnRRcdNFuEVCc3i1ICbtSpPfFPXmwgYjvto0dGUrJYNfjq34
         dHo0HM2iF1HBOssI27nXE1YsaY/bT/6DzuZu8zvwvTJ+Lw8xx6CCLOFBbWmpaNT7Lecc
         SKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761715402; x=1762320202;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsPKJDbsU1HLDhh7a3z0A0GhLekMgmfq9Z2ctQNja8o=;
        b=GH0JNkwqaDM6k4YrSSdUiS0x1A2LXiASXhJytVEa7HWWpr5gP59PAOrqoG07ojPBf3
         kOC6Ox48P9dHWsmZtsUDx+NHF5eeNG/eIHvlyNE0kT8vugLaz5q17c6meya+MHYF87Rq
         C8/J+DmRjvTyxHqjWujfR4FrxcHnU+QAkgAb43od1XrK/OlIYvE0q8eEdbSAaJQlW5Vw
         nI0mNoR9N1/FdkU9dfpevUypfGHt2OukHL5MKVFbpIlcxcvmE6DxyEQxeWeuCeT1AFKq
         kCZZGQB70eled/f0FoHahljiVuzAtwzf53Y3YurywT2crbIRXe6vpR/ny0KJYpPI6wrt
         OwPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+EWCD0t51YEKkvjjzgWn8twHQj9ssHkhRRCjUANzu7HfDwetzssxiLyYCK0VNOgRVh/6VC7gQf/yOKcOIc8PkFpBXEw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz3WLX/QkTtjW/AXr6QAOdzEc2p2fRNeSdO+6BE3GO214owUvW4
	H9wMOB4VSDRmqIv+o0EPHW71zXa6sODGSaq+NqT19f1C9zskoL4eLYSa
X-Gm-Gg: ASbGncvGA1hCb0vekrD+JpFTMVDaiLKs2Bsuc0SehZH0Vlb0+4YCfRam4gqqivQa9Sr
	Fb2VsOsjrhEdpre+1KrE4aPxZxwwmqsL865GlzknrSq8jzBSaR8MxkEEjN1rC7wlN3YTFLQt1ly
	4gwtsbo9FRi2ei/XIm8ZDGtoZ+aXWeMMC4Ybim2QA+w1iM6/LUFJphb7w8ZtDTtmoGUTjNMjAQD
	DBC4OpUvZvMb/6LaEUTncmu1CaCxEPmNvAKhQYa8f8xX+UkfcGorHO+WoqA2yqhkXGNINef970G
	MHkQ2uVqP9g0nUguI6zcXdSusGJmDwx/0tcG7D8kC66y/J9MDSYDjg+NFvdgKCpzL8z5lWa3nFn
	SqARS7CYh7ZqwKI1woAvKUTmyqQzjD70+tpbDiMw9i185x/wSRutsi/p1LdM/mvaHA3uGMJHSiA
	vLEfwcRZm3vouTo3rK9OmFuKHsjXkKcxFeBJy6BPBLsXqFR2MWP/0b
X-Google-Smtp-Source: AGHT+IFPBXAWHtWxVsH6BOk7hvQzebVLwsPZzDMBXOrqfB/oOU+pnQqSXpGyG55Woj+zHUIo1/Vq5Q==
X-Received: by 2002:a17:902:ea05:b0:290:af0d:9381 with SMTP id d9443c01a7336-294deec2ed0mr11818285ad.7.1761715402314;
        Tue, 28 Oct 2025 22:23:22 -0700 (PDT)
Received: from [127.0.1.1] ([2406:7400:10c:6625:afa3:1ffa:3262:fea9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e41697sm135526985ad.98.2025.10.28.22.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 22:23:21 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
Date: Wed, 29 Oct 2025 10:53:04 +0530
Subject: [PATCH v3] dt_bindings: sound: ti,pcm186x: convert to dtschema
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-dtbs-v3-1-3cc162221c22@gmail.com>
X-B4-Tracking: v=1; b=H4sIALekAWkC/12MQQ6CMBBFr0JmbQ0zAwiuvIdxUUqBSQRMSxoN4
 e4W4oK4fD//vQW8dWI9XJMFnA3iZRoj8CkB0+uxs0qayEAp5ZgSqmauvWLN2BZVZbICIV5fzrb
 y3jP3R+Re/Dy5z14NuK1/gYAKVVaxQa0p59rcukHL82ymAbZAoKNU/CSKkmm4viBrKkt7lNZ1/
 QJfhABfzQAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 david.hunter.linux@gmail.com, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Ranganath V N <vnranganath.20@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761715398; l=3848;
 i=vnranganath.20@gmail.com; s=20250816; h=from:subject:message-id;
 bh=MVV4fn2U9kldtqYBjWGUoCfEKkSN8LPsc75pCGRRe34=;
 b=1ls32d42eEBD+XkDNskmfxIMVqWl1ESc2Gf9poGBFGwsENkGraiUn6GcqjlYtdXsIxiDLAvqj
 03+OT+JCrjyDq3Vhx3BRE9kqVVqeoBuM518WDawPW8BNtayh46nVJXv
X-Developer-Key: i=vnranganath.20@gmail.com; a=ed25519;
 pk=7mxHFYWOcIJ5Ls8etzgLkcB0M8/hxmOh8pH6Mce5Z1A=

convert the Texas Instruments PCM186x Universal audio ADC bindings
to DT schema.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
Convert the Texas Instruments PCM186x audio ADC bindings to DT schema.
---
Changes in v3:
- Unicode FEFF character was present in the begining of the file,
- Removed unicode character.
- Link to v2: https://lore.kernel.org/r/20251026-dtbs-v2-1-cd3b713a288e@gmail.com

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
index 000000000000..72a3e1dde0fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml
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

