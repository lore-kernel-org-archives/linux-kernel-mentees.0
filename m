Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89603311C05
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 08:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762246381; cv=none; b=htHFYHckP+M8TImlazAaasjRLlChD2nNR38nZSugxvyWZWD64caI3WpX9sqbYqP+h5ZtJKprFR1GDxvRo5973NQA1bNDpQPR42CUo2/lt4wIihHlRSHVaqjbyU17AeSCRYDfLuplHohHHhdVSx/lseGpUr8dENXsZoYPbtXpigw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762246381; c=relaxed/simple;
	bh=2rMHlQ1WtmYv1cT3KfGLFdZenWascCkIbV7yKzG2Frw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oHkTmxlXQPWu7Un1zh+KICxF4inKR+a5IMYxhalB/CEODGNbILesfkwrKtaeAC34U050rd7DOiPvVM6TKXjCxNwrvTp8Zvx+D7N4aAZpKDgrvzMovvJ6VI/lEFsTqufnLOg3ndNyz2qIOevqzdxLmH++ijPT3HLg/cgktjyslSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWkRsPnE; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWkRsPnE"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2878B40C2E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 08:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7XKsfYyUeY1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Nov 2025 08:52:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4222B40B61
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4222B40B61
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cWkRsPnE
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4222B40B61
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 08:52:58 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-294e5852bf6so8184815ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 04 Nov 2025 00:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762246377; x=1762851177; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JHJIK8+oaXWJkBBbD+h4XXw0wc94Hg7Tu0T3cHygSwk=;
        b=cWkRsPnE0pRIdnKXHsv+TgG9kpPoCivPnlFonWCzdVvXf3j76W1dHug4hsTkjsf4l5
         EWMG2fASzb/vDM9aZhfGktNKTCIlqBcaUc8+/Tu3fqYWTrs2n4FsIXvZz9WjLqBAmKj0
         LBRrJyzbh2d9eYmWXXPLKJ7vWxzgp2znF/a99N/57Vv22DkNGGgf5DIGVH+XGfm0Z6Ry
         IQlg+Qy+ep9fcy7lQz2cUF1wtUb2GivJt8p1yg0Pdbb0yUB7NhIE7zD8hbq3N+qoyJjN
         X2+Q2ctVgFBnnyDcis8AMNW0sIuHc6auJQw07Dd/q848xesdAJ85eXYsGYCa3L9GEN6d
         tikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762246377; x=1762851177;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHJIK8+oaXWJkBBbD+h4XXw0wc94Hg7Tu0T3cHygSwk=;
        b=YA1uM60h5kKsQ31dE//Nc4WpQyCgCLszgJRKyn7ajZXZ1sxkyYjBnMMR/0GCejEWBF
         xIhBB3ytQPd2pP2OeyaJQXw8uj13OTd8oWTFG46rbKDEbn7YyhoxYVDnYMtHYBb6z7ro
         /76u/5ONk+zzwF1zjmDUD6RxInEx+As2PY8EcvCcefgrzkeo9DHgiPk0ZXIEfx2Qg9dc
         w92jT2YrcmOex2mGy33OTR/sxTE7ZFxZPHP9U2oF9DLmBkuSVdAf9VrPF29f9laE6Ncs
         8dMhci6VAkrSJLk2sg07Rf8JGD9KhHAKYr08LUgp5HK88HmCd4BVGACyWK5sUaq362rG
         Jvxg==
X-Forwarded-Encrypted: i=1; AJvYcCVlZfWQ+/ysQlqXTviwS58HSBgMZphdxb1ZdsKEi3uaF5YKjDJipW/7kiLSVWAD6jfXhw0qOaEMAKeUGg+F5iWjwGjx9g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyTCvplV7vnEYX1KyaS61ruKKhHNPuYAJrJNb7BvpAfIuvs3FFk
	H56ulv7dZYyyFLsf9S2ur3Irrm8XjhZQtEFdCCmfUmvhfHtET7n+JfAZ
X-Gm-Gg: ASbGncsdJDuh1SCXZWckxEphMWi/HOdIv/HW7qrxwawZcrqrENQbPlKJw1cL6S/814f
	JN2llb4yt8y3rzBcj9zd95/Sbkcp7upNmpT6W3rlGUTRgbpAhdBkFuKJraeMBCC8T+V4mOETU5+
	NGun3DwwPMkO+ivtLvJdeaov5sbexMgMIF4ua0ZGJKimhVS63BlCYRvS2Tmuhofmwm2k/1z62Bs
	0Ldp073qZztg7OuAVUSLmIlVkcDeWNVnRRG7y+s+iSuEeiC8linKAQfEJ6jNk2hnJhtr+8ckGDr
	pyTXSbH/17qLb4dpFzafK1I9J31O9W84+obR/EziYx0XaIM/yulKHmKJ3wqrG+vsr1r5KOy2jf6
	Pc9+Eoch9k7xtbdsoBXLhAyc2fhsbu/CgoP+EcElQWKBvKtWgEmJWsaAVoF98aT5nEeshQi0aAC
	nGktAKVZsmujHkVX340iii44umB7+m6UL+XY3aXpTg7A==
X-Google-Smtp-Source: AGHT+IH2t1B9DQS3NrSrgg/yHCdfBQnUffNx5XgA6o/NzrzTv4ZYh+rhCpt79HNN4moszBGMYKYYZw==
X-Received: by 2002:a17:902:e889:b0:296:53b:fcd3 with SMTP id d9443c01a7336-296053bfe03mr10444545ad.9.1762246377353;
        Tue, 04 Nov 2025 00:52:57 -0800 (PST)
Received: from [127.0.1.1] ([2406:7400:10c:9fcf:2909:749f:36f6:6b85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a609c8sm18155155ad.92.2025.11.04.00.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:52:56 -0800 (PST)
From: Ranganath V N <vnranganath.20@gmail.com>
Date: Tue, 04 Nov 2025 14:22:50 +0530
Subject: [PATCH v6] ASoC: dt-bindings: ti,pcm1862: convert to dtschema
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-dtbs-v6-1-61d5afa31fde@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOG+CWkC/13PQQrCMBCF4atI1kYyM2k0rryHuEinSQ2olUaKI
 r27aakQunxDvh/yFcn30Sdx3HxF74eYYvfIw2w3gq/u0XoZm7wFKqxAIcjmVSdJjiAYa1kbEPn
 ps/chvufM+ZL3NaZX13/m6gDTdRUYQILUlhicw4pqPrV3F2877u5iCgxYIrMgzIgbqvdADg8Hv
 0ZUIrsgyoiYwSAiMOIa6QKRWpCeUAiBJgRg16gq0f9PVUbeQ8OqxuC0KtE4jj/1s5N2bAEAAA=
 =
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 david.hunter.linux@gmail.com, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Ranganath V N <vnranganath.20@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762246373; l=5252;
 i=vnranganath.20@gmail.com; s=20250816; h=from:subject:message-id;
 bh=2rMHlQ1WtmYv1cT3KfGLFdZenWascCkIbV7yKzG2Frw=;
 b=ipXerRqWnjaK7oEEls/rfgAdyD/nxcQbl/o+dgdIHQ302NAPpKWX4WMvkbilPBABzJLtNB5ks
 z7I4qWhxcLXD85A99mublEOWTs0u8iP+HlNhskKdkE+7ix1Bo/doj7D
X-Developer-Key: i=vnranganath.20@gmail.com; a=ed25519;
 pk=7mxHFYWOcIJ5Ls8etzgLkcB0M8/hxmOh8pH6Mce5Z1A=

convert the Texas Instruments PCM186x Universal audio ADC bindings
to DT schema.
Added the #sound-dai-cells as per the framework.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
Convert the Texas Instruments PCM186x audio ADC bindings to DT schema.
---
Changes in v6:
- Corrected the Subject Asoc->ASoC, dt_bindings -> dt-bindings and ti,pcm186x -> ti,pcm1862
- Updated the commit message.
- added the missed Description from the old binding.
- Link to v5: https://lore.kernel.org/r/20251031-dtbs-v5-1-ee1dc0b2fa40@gmail.com

Changes in v5:
- Resolved previous patch warnings/errors
- dtschema/dtc warnings/errors:
- /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/ti,pcm1862.yaml: 
- $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
- 	 $id: http://devicetree.org/schemas/sound/ti,pcm186x.yaml
- 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/ti,pcm1862.yaml
- Link to v4: https://lore.kernel.org/r/20251030-dtbs-v4-1-3fff32221119@gmail.com

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
 .../devicetree/bindings/sound/pcm186x.txt          | 42 ------------
 .../devicetree/bindings/sound/ti,pcm1862.yaml      | 76 ++++++++++++++++++++++
 2 files changed, 76 insertions(+), 42 deletions(-)

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
index 000000000000..0f0e254a2420
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1862.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,pcm1862.yaml#
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
+  CODEC input pins:
+    * VINL1
+    * VINR1
+    * VINL2
+    * VINR2
+    * VINL3
+    * VINR3
+    * VINL4
+    * VINR4
+
+  The pins can be used in referring sound node's audio-routing property.
+
+allOf:
+  - $ref: dai-common.yaml#
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
+unevaluatedProperties: false
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

