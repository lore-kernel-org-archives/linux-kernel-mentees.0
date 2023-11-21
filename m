Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6254A9AE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDz6tFSs"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFEE081400
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 12:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFEE081400
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jDz6tFSs
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wx-K73m3t8Lm
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 21 Nov 2023 12:35:55 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D530C81386
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 12:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D530C81386
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cf6373ce31so13562205ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 04:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700570155; x=1701174955; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BVHOuGYwxoI/ien1Js+ADNjcb3WBPI5CxYXxkzPCUlo=;
        b=jDz6tFSsDC91B9G/AEnaHbbrTRpDvdmMUOdx+CgMVf41yLW58iBrt/vDGRIUSV4ROo
         Vx+TQFv7l4coYaEezaRE9pa+L4UhqKNSIoku+jiQFRiyRmZg+m52tks2o+vTMA7AIixI
         uKBNpouU/RzljZGAnwmrpslXE2XpuCRkVZtNk48UHJEOY8/xpc4I/DWPOU49ZXsqFrcE
         V9/E04ChM8QrsHgtQkQYdctJ1bsoeouoOYJwG3ljWZcqlv8zTH9sE0Ogul2nCM6dKilM
         uXTOFhww2n0uFw26HGVHefX8npdZPYrvf63J4x2bXpuqlApXkmrnTkKJQg+4EYUDs/k4
         OK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700570155; x=1701174955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVHOuGYwxoI/ien1Js+ADNjcb3WBPI5CxYXxkzPCUlo=;
        b=OBOHGEyXQb/WVhrQX+ZnKnJeoVR6C7shqhKZTIe7ind3gropQzukUFP2fiZwhJkQRJ
         PT3YD2YjGBKcuhOZa079KdRNueM0ZUw7Zjs+rXYE3urM+9dIDc8MVP0ZBPbt6LcklA8z
         Ti58tqOr5JbNpFOGhhfWCmA9qSWjXU81kIhOUBfTkFp1FHcIUueW4f73vMx8y9WqIY+4
         At784ujRPR+N+5TDGJ+mjybLkq87XqQFhUpLMRSEuYktauMlmC7O1xCRSlmBBxoE4MbL
         3xg+hpokHxDzzioxYJQWlc1xEO5Rh9yEQc6+03aPdz9r81XR3qGHNQiRO5R3Gi+/DI6s
         1gFQ==
X-Gm-Message-State: AOJu0YwC9nDcGq9DZ4x2L2OsY4dWYHSBIopbr6Lmn/uJU7tnXq0VovwA
	ugYKijqfEpNa4LuQS1cus7k=
X-Google-Smtp-Source: AGHT+IEfyBmj0fJQWwLMQun9Vu8GL+cZJg4GfHD8QDRj93peVGM3TZ0cfFQuRioVmCCdTQ+RAOYctw==
X-Received: by 2002:a17:903:32c4:b0:1cc:36fb:22ae with SMTP id i4-20020a17090332c400b001cc36fb22aemr4178526plr.2.1700570155041;
        Tue, 21 Nov 2023 04:35:55 -0800 (PST)
Received: from archlinux.srmu.edu.in ([103.4.221.252])
        by smtp.gmail.com with ESMTPSA id e8-20020a170902744800b001c3f7fd1ef7sm7846614plt.12.2023.11.21.04.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 04:35:54 -0800 (PST)
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
Subject: [PATCH v10 1/2] dt-bindings: input: bindings for Adafruit Seesaw Gamepad
Date: Tue, 21 Nov 2023 18:04:07 +0530
Message-ID: <20231121123409.2231115-1-anshulusr@gmail.com>
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

Changes for v10:
- Added interrupt-controller/irq.h header

v9: https://lore.kernel.org/lkml/20231121101751.2189965-1-anshulusr@gmail.com/

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
2.42.1

