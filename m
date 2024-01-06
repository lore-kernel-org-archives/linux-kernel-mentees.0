Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADEF15A0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  6 Jan 2024 01:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlCfU6vD"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EC4E60BA8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  6 Jan 2024 01:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EC4E60BA8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OlCfU6vD
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLm3_v7jDZgr
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat,  6 Jan 2024 01:54:26 +0000 (UTC)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 47B4D60B04
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  6 Jan 2024 01:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47B4D60B04
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3606ee78686so1155975ab.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 05 Jan 2024 17:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704506065; x=1705110865; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XKIOfGXdhQzUhUd2ojox1sWrZO2giTBdlXUK8XhYp08=;
        b=OlCfU6vDDlXtqTT4iZiGEvkY6176d+x3spt496QEI9GQvdEUm6+X9TqF4Fy88R2j2s
         n3CqqYZ+s1weUUIOMHfVyVqfiQWIGVYRTu40+XB+KW27MTFAIPf1+ndQylY8SNEtRqPi
         j3Cc+Vuxa+KkTH+ZBvXJXmarlLjn0nMv+RxfDSvnhPrjTUkuShawxT9Pp/EehM/zog7D
         5hsDEwDA30Ed61xcWAZ5Obnf3W5ciLL1ywSPv/BY+YHlBrgF5M6+F0g4VKUfnXzsfPBu
         KOOYWYGs30OLIzU/m96w8juPNGIZ9OyIHmL+6hOHsP6nuJ9sBydjkYZ6qPSLY4LEUh4i
         6CyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704506065; x=1705110865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKIOfGXdhQzUhUd2ojox1sWrZO2giTBdlXUK8XhYp08=;
        b=FyrZDR9t7oWv4MxO5/j1r0jzWeQBxQ1fMwkZOgOPyM+QcX4EmrCKv/IjWpsaK9mM/e
         es+/kSJSttWrc2MsuR04te1WtwpVcKqoeWn/YgE/6byoQGURzU3SGtCCF0Ybw2lreOk5
         /OA4BCVsAP/SHNRPv8QAQREcoZdKoPkvlsjR73P2RDxcc+DpkEXVEU0U9RyjIEoaSILJ
         eFtTO2arJ1NJh3QGcwM/zgYycgl9OmE6nVTyMVRZiyTL9Jikf10x53ZgeX8P+vYDY0JT
         FMw7pTa1bMdiUV1UOxPdt0t9VjFbDimQTNxrvT9C0qzjnSAzlYKpPZ7RqEBmS1hFrv9a
         JbSA==
X-Gm-Message-State: AOJu0YwXYx4f74jBQ7hhX8iPrbQ0BUXpLxUnNsbTdxBMdA+Bm5PEkW9K
	CAd2aMrlqhSNCy3pch6gnuM=
X-Google-Smtp-Source: AGHT+IEQP+gfQWl+OFJEfVt/uhJLdkpkydjSRW5ZSvd7W2R8p1rsKAS5TWfsUOlAruIlATNMcubSCQ==
X-Received: by 2002:a05:6e02:3046:b0:35f:e71f:4c60 with SMTP id be6-20020a056e02304600b0035fe71f4c60mr579038ilb.13.1704506065229;
        Fri, 05 Jan 2024 17:54:25 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:6276:e9ca:df79:30b7:cb06:ba1f])
        by smtp.gmail.com with ESMTPSA id m2-20020a170902db0200b001cca8a01e68sm2000166plx.278.2024.01.05.17.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 17:54:24 -0800 (PST)
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
Subject: [PATCH v12 1/2] dt-bindings: input: bindings for Adafruit Seesaw Gamepad
Date: Sat,  6 Jan 2024 07:20:59 +0530
Message-ID: <20240106015111.882325-1-anshulusr@gmail.com>
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

Changes for v11,12:
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
v11: https://lore.kernel.org/lkml/20231215031125.284939-1-anshulusr@gmail.com/
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

