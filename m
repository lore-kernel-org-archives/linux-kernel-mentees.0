Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758FA3D3AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1ChLhbT"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0929B61008
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 10:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0929B61008
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O1ChLhbT
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hnEyTYjA-_XX
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 21 Nov 2023 10:21:42 +0000 (UTC)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C6A4D60FFE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 10:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6A4D60FFE
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3b6d88dbaa3so3505487b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 02:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700562100; x=1701166900; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v9i/Xx6cWAF0VcdPrFkUZoAivNKzRZ6xEFa30biSsbo=;
        b=O1ChLhbTkdFOS/RzP5v1Ehir7aE+oVRE8G5jRDkiCMpRPuqDIz9TF8CteUKkHSAI5r
         w8fnFRGlv7XMSWc5O8b0Og7Lv3Qflqz8iJhXFB6F8SlH8Wmj5yIiGPNycy2gbej7x8fO
         U6xJC55xUCM6UC3Dzyvdw5IJzhF1l/wbDj77kohAQ+8OKVftOIJssgNiIaEUNOtI0OnQ
         x2sXn33ZqTzf5lvb8argq4YBxSsmbQPOX6C30Yc1Xb3AqVW8JSvaXERHcI+F7Pn4PI6K
         04ksCvFrXm4DROFHWwvkGszzmQsxZSIt0+kbH3dmGkO4GPCUQ0P860tR+BjOUAl3GEyZ
         XHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700562100; x=1701166900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9i/Xx6cWAF0VcdPrFkUZoAivNKzRZ6xEFa30biSsbo=;
        b=Yitogt77+l/QyLBXncIpZu2uZTqS8lkrGgGZrWJ/NycgcuQo3WacbjVAXPKX2cLcEF
         bT9btiUO90lhxahdPPdlWnj4m/ysm5LbIyKNq97iciYrjt+ZwawjDFRwDpNIblKiwwV0
         wc+EnSbIJvJmebRVPi9tleuHOFgp/vfez43mc0xF50knDblnpjOJYd7vpJPTzvialdXe
         gc7aGVtbXza3MIJoi6ODqhlExGuDs6fcnVIoLyAVVni5YwQCuw4nVIMHM1/KeXWldv+b
         n0uzfE/Pdan2nkrDOz8hD35QrEy8sy3VZjW4IV+rd6rpE4oDaDS2NeZQqS5JQsizHR5F
         /0WA==
X-Gm-Message-State: AOJu0Yz+skE8FkXRCezI6h2szKlnR3R40hwnFsn+5NAsmwMXa19MxEab
	MA3Y9Wdb170+zUAG5iW554A=
X-Google-Smtp-Source: AGHT+IGVaUz452Nk5uw6WVVZGoUWyhMLV0E6SX8yvPNM7DWZ8Q+OGDfQYIel9HvM7y1KFEajgrhZag==
X-Received: by 2002:a05:6808:23cd:b0:3ad:aee1:1b3e with SMTP id bq13-20020a05680823cd00b003adaee11b3emr14494020oib.8.1700562100653;
        Tue, 21 Nov 2023 02:21:40 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id c10-20020a631c4a000000b005b82611378bsm7451502pgm.52.2023.11.21.02.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 02:21:40 -0800 (PST)
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
Subject: [PATCH v9 1/2] dt-bindings: input: bindings for Adafruit Seesaw Gamepad
Date: Tue, 21 Nov 2023 15:47:48 +0530
Message-ID: <20231121101751.2189965-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.1
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

Changes for v9:
- Added interrupt in example

v8: https://lore.kernel.org/lkml/20231108005337.45069-1-anshulusr@gmail.com/

Changes for v8:
- no updates

v7: https://lore.kernel.org/lkml/20231106164134.114668-1-anshulusr@gmail.com/

Changes for v7:
- no updates

v6: https://lore.kernel.org/lkml/20231027051819.81333-1-anshulusr@gmail.com/

Changes for v6:
- no updates

v5: https://lore.kernel.org/lkml/20231017034356.1436677-1-anshulusr@gmail.com/

Changes for v5:
- Added link to the datasheet

v4: https://lore.kernel.org/lkml/20231010184827.1213507-1-anshulusr@gmail.com/

Changes for v4:
- Fixed the URI for the id field
- Added `interrupts` property

v3: https://lore.kernel.org/linux-input/20231008185709.2448423-1-anshulusr@gmail.com/

Changes for v3:
- Updated id field to reflect updated file name from previous version
- Added `reg` property

v2: https://lore.kernel.org/linux-input/20231008172435.2391009-1-anshulusr@gmail.com/

Changes for v2:
- Renamed file to `adafruit,seesaw-gamepad.yaml`
- Removed quotes for `$id` and `$schema`
- Removed "Bindings for" from the description
- Changed node name to the generic name "joystick"
- Changed compatible to 'adafruit,seesaw-gamepad' instead of
  'adafruit,seesaw_gamepad'

v1: https://lore.kernel.org/linux-input/20231007144052.1535417-1-anshulusr@gmail.com/
---
 .../input/adafruit,seesaw-gamepad.yaml        | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
new file mode 100644
index 000000000000..0f17e110f368
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
@@ -0,0 +1,61 @@
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
2.42.1

