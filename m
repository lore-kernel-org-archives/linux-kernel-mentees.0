Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122C9645
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 00:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTxgf4Jh"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75F6881774
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 00:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75F6881774
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QTxgf4Jh
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pP76aFpWrlTA
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  8 Nov 2023 00:55:17 +0000 (UTC)
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2610C8176D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 00:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2610C8176D
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1e9bb3a0bfeso3830547fac.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Nov 2023 16:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699404916; x=1700009716; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nBwW2x1NB7Zv9x5MLA+XOPhgMD9GcocogtWLN68fSio=;
        b=QTxgf4JhL7UM2BiejkNkZL0cwqg3NxYNwlkC9qUlVdZnivc7mBqCOihSfzwcueDI6n
         GYSII9rlj1DoccmxgiUIelb8he7PGwHYejQUlw2hKsPArWVj5PwdkRvWumntJZw7FtCa
         yzMORuModS2d74Yphtdb6otAAA5GlEgXsdjD5SknkbuM0nbR8beHLdFBKjF4nsIpcwce
         EBjb4TshVLX90/F2zJ3ql0BmpxaO6oipnCDLIEMDJa9I2fcPRnXRPgyd7kZYU5yxL/ch
         byvSgnfEdNtkrgHSSG1t1dSleJDOKI1RLvnyo517emgYPzK8wA3sOd3QM1XXoRToOLpV
         T5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699404916; x=1700009716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBwW2x1NB7Zv9x5MLA+XOPhgMD9GcocogtWLN68fSio=;
        b=k5MClN2WLi5LbmpyhgmFmPRrkE88jgunLeF7/d404GeGei5gosV69Fgd+vaMmBDX3W
         TxO8FPXWflnrzSdei/EC7wIezUgpagUn0Y17qVNvf7qdZOaXLJh5bfw1SV5KSaJwREiE
         U9BkNQTaeiKG2pDJbvSkBZbPh1Lr6FSpgk+flFsXEzYNbmuEwVaxkaGmyVkkp2qUzMRc
         Ki9jQXM5x+e0v+nPcdrwjB0j6F5z1YfWydHzcqu7/ahXmxT1zpbzdjf2DjdyBcAVi3HO
         OTzl4b+gIxRXoau/FGa92TVNM4aVdb+YG+lWcJv+Y7xPzzL5QQ923Je3e1fNiGsEylgm
         dldA==
X-Gm-Message-State: AOJu0Ywmsmd5KbbbCsOYfcczTznSeIYRawmiiibzxqB5Y3XshAephPby
	8/rifnaKzoYxqra0pTxllk2q27DMg6fmHBb1
X-Google-Smtp-Source: AGHT+IEEZT9EznDaRpIPe/oGe4godmJbxmua7mNLjGmR//N7q4uG+t9wAoPFiZH0Md3h2/YhHGGvhg==
X-Received: by 2002:a05:6870:2188:b0:1e9:9179:4c6f with SMTP id l8-20020a056870218800b001e991794c6fmr366225oae.49.1699404915998;
        Tue, 07 Nov 2023 16:55:15 -0800 (PST)
Received: from archlinux.srmu.edu.in ([103.4.222.252])
        by smtp.gmail.com with ESMTPSA id g5-20020a631105000000b005bd11296584sm1939468pgl.53.2023.11.07.16.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 16:55:15 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
	"Conor Dooley" <conor.dooley@microchip.com>,
	"Rob Herring" <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	"Jeff LaBundy" <jeff@labundy.com>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v8 1/2] dt-bindings: input: bindings for Adafruit Seesaw Gamepad
Date: Wed,  8 Nov 2023 06:23:35 +0530
Message-ID: <20231108005337.45069-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds bindings for the Adafruit Seesaw Gamepad.

The gamepad functions as an i2c device with the default address of 0x50
and has an IRQ pin that can be enabled in the driver to allow for a rising
edge trigger on each button press or joystick movement.

Product page:
  https://www.adafruit.com/product/5743
Arduino driver:
  https://github.com/adafruit/Adafruit_Seesaw

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---

Changes for v8:
- no updates

Changes for v7:
- no updates

Changes for v6:
- no updates

Changes for v5:
- Added link to the datasheet

Changes for v4:
- Fixed the URI for the id field
- Added `interrupts` property

Changes for v3:
- Updated id field to reflect updated file name from previous version
- Added `reg` property

Changes for v2:
- Renamed file to `adafruit,seesaw-gamepad.yaml`
- Removed quotes for `$id` and `$schema`
- Removed "Bindings for" from the description
- Changed node name to the generic name "joystick"
- Changed compatible to 'adafruit,seesaw-gamepad' instead of
  'adafruit,seesaw_gamepad'
---
 .../input/adafruit,seesaw-gamepad.yaml        | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
new file mode 100644
index 000000000000..3f0d1c5a3b9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/adafruit,seesaw-gamepad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Adafruit Mini I2C Gamepad with seesaw
+
+maintainers:
+  - Anshul Dalal <anshulusr@gmail.com>
+
+description: |
+  Adafruit Mini I2C Gamepad
+
+    +-----------------------------+
+    |   ___                       |
+    |  /   \               (X)    |
+    | |  S  |  __   __  (Y)   (A) |
+    |  \___/  |ST| |SE|    (B)    |
+    |                             |
+    +-----------------------------+
+
+  S -> 10-bit percision bidirectional analog joystick
+  ST -> Start
+  SE -> Select
+  X, A, B, Y -> Digital action buttons
+
+  Datasheet: https://cdn-learn.adafruit.com/downloads/pdf/gamepad-qt.pdf
+  Product page: https://www.adafruit.com/product/5743
+  Arduino Driver: https://github.com/adafruit/Adafruit_Seesaw
+
+properties:
+  compatible:
+    const: adafruit,seesaw-gamepad
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      The gamepad's IRQ pin triggers a rising edge if interrupts are enabled.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        joystick@50 {
+            compatible = "adafruit,seesaw-gamepad";
+            reg = <0x50>;
+        };
+    };
-- 
2.42.0

