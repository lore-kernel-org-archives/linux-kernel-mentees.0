Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C0263B8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Dec 2023 03:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcwGfH40"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A0D41E46
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Dec 2023 03:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2A0D41E46
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dcwGfH40
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ti37U621jzkF
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 15 Dec 2023 03:13:47 +0000 (UTC)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B2FC941E34
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Dec 2023 03:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2FC941E34
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3b844357f7cso216976b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Dec 2023 19:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702610026; x=1703214826; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MrjPda46CNMHaH9SYqOgX3QPLKjlJ0qSlmrxZq+XIwQ=;
        b=dcwGfH40sMq9qNoyk3eVbu4V1sAzX/z2WVqDZYnfTrI5nKqd8JEGBt2V/Os3rmLy5s
         pt1YRPO0v5EUaBe7vQaJ37fyWEX5XTTCixQ3OraThuB6Ghtv+SqVjyxTaVN+bOz6EypH
         NWbu6fUVxHY2QDoGeLBlle4QnGbghWVyhSgFu2a+9uZxBmDXx2aFXy/c4ljfDExSdTWh
         1L+wPw/Us5wmgqoXOlk2l1NLoGjMVrmfAd+nL0bIzBW1wN0cUBMTLKTHBqJuT8mff1vN
         4WKLTZLpL/UK5L+AN7TB4WefYIfNmMx9WBfC3JD7Yrpnca0kkyn6fREuUbBdg5/eqvL3
         yPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702610026; x=1703214826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrjPda46CNMHaH9SYqOgX3QPLKjlJ0qSlmrxZq+XIwQ=;
        b=wzIZcYY65XKx6+vnjL44Eq1Jaim5gd5B8nd7gBaD6Xnvyi0RLuZIplmYbXUD8dRM08
         veOfuIrSCf+B3nG2cgRckr4yDgxQavcfmWuKjbeEOb4cMVa814ql8BgJRc6Rla9MNq8O
         3LewSKuzy8WfAYhj01MB5bBJOkCRP9aJSsA2CK3jNBn7GdbzePv9zCVRzL5xMBYlhF5d
         v5DYYG2ps445hRXjshEDHp1lPh7FK0nRoM/nl0+Y2bhfd5bP8X2OrfVUIW4iheC6gvCm
         CMfg4urOkT3wsZ3h/3HJz0khYkdsb/YXQLr+cShSOhqgdvdwiYN906VygB77YILBUvcX
         nxkw==
X-Gm-Message-State: AOJu0Yx1UPJf3QmP2Cw2cX3YAB9kf73Ykodt5uad8HYPdHBIxskU6cet
	eeESU2qB0P6mDzzATeZ5CRU=
X-Google-Smtp-Source: AGHT+IEC44kMzx5eGkuNrn9pITFLdJOj4jemuFr/IAUnL/5vawRr/TJNf1sTPngymub1XOrGbyVtYQ==
X-Received: by 2002:a05:6808:448b:b0:3ba:f4a:4320 with SMTP id eq11-20020a056808448b00b003ba0f4a4320mr13005960oib.46.1702610026545;
        Thu, 14 Dec 2023 19:13:46 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:5818:4019:59fb:9ed3:7477:2dc9])
        by smtp.gmail.com with ESMTPSA id v23-20020a170902e8d700b001d05fb4cf2csm13181855plg.15.2023.12.14.19.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 19:13:45 -0800 (PST)
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
Subject: [PATCH RESEND v11 1/2] dt-bindings: input: bindings for Adafruit Seesaw Gamepad
Date: Fri, 15 Dec 2023 08:41:22 +0530
Message-ID: <20231215031125.284939-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Changes for v11:
- no updates

Changes for v10:
- Added interrupt-controller/irq.h header

Changes for v9:
- Added interrupt in example

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

Previous versions:
v11: https://lore.kernel.org/lkml/20231127161158.1651716-1-anshulusr@gmail.com/
v10: https://lore.kernel.org/lkml/20231121123409.2231115-1-anshulusr@gmail.com/
v9: https://lore.kernel.org/lkml/20231121101751.2189965-1-anshulusr@gmail.com/
v8: https://lore.kernel.org/lkml/20231108005337.45069-1-anshulusr@gmail.com/
v7: https://lore.kernel.org/lkml/20231106164134.114668-1-anshulusr@gmail.com/
v6: https://lore.kernel.org/lkml/20231027051819.81333-1-anshulusr@gmail.com/
v5: https://lore.kernel.org/lkml/20231017034356.1436677-1-anshulusr@gmail.com/
v4: https://lore.kernel.org/lkml/20231010184827.1213507-1-anshulusr@gmail.com/
v3: https://lore.kernel.org/linux-input/20231008185709.2448423-1-anshulusr@gmail.com/
v2: https://lore.kernel.org/linux-input/20231008172435.2391009-1-anshulusr@gmail.com/
v1: https://lore.kernel.org/linux-input/20231007144052.1535417-1-anshulusr@gmail.com/
---
 .../input/adafruit,seesaw-gamepad.yaml        | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
new file mode 100644
index 000000000000..5e86f6de6978
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
@@ -0,0 +1,63 @@
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
+  S -> 10-bit precision bidirectional analog joystick
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        joystick@50 {
+            compatible = "adafruit,seesaw-gamepad";
+            interrupts = <18 IRQ_TYPE_EDGE_RISING>;
+            reg = <0x50>;
+        };
+    };
-- 
2.43.0

