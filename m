Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9E4358BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ly1oY7XN"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D528B405D6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 16:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D528B405D6
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ly1oY7XN
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sLw8biopa4zk
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 27 Nov 2023 16:13:56 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6F02640015
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 16:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F02640015
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6cbe5b6ec62so3348644b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 08:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701101636; x=1701706436; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m8Y+/hfdU1/FxZi+VliIj7cuRUi8YqKczVoB/rQ19O4=;
        b=ly1oY7XNCJdDlxk8+XsaYA4aURpK0cxujAJtseIkw/ChHsYyEovJgtpbBNpq4/HjJF
         Z1+vHhFPuDBago6H8jAN8HUhv3dUa+jTzetD17/Y9Lpj/M8spOE+2vNdx64/cj1KBdJ3
         dICAAOfI0HxYv6dzg29jkgw6DEqUvdhE0qKs6vPC7XrRN8AsRsuc4/gsfuM5d5OpLpBO
         fH6xV7E8yJlAn4Gr7BXjPZRuvSElhLBVa8DzPqa2NQVLSqQhLfjAriYTCdKEj88/mq0Q
         WiovyJ9p5g1OqqUjIB79dibaB1doXiA8S4OLDEhGJBKSmwcb6BMbdXej5WIfmiJvvPQI
         aeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701101636; x=1701706436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8Y+/hfdU1/FxZi+VliIj7cuRUi8YqKczVoB/rQ19O4=;
        b=vGym/2+z1gu1ISXsADoFFXUy+QiU1Qqz4TYXQVImaJa6UdPXzEa9kTrjh11t4/ycMm
         P7fsCmA8LprjzaKPfBRV+/vIvxFJ4//Ia7MpHr8qf1FU1wLbdWKrZQOGkM38shi4sIO8
         oBqtVi+vhOZMUGFUTsgL/HobJFI8SgXcRB5CxInFP7xn/ppPDemgw7XLBUEq8ntPAt/O
         UZA0de7abQaSFC0ItGLRXAlUErUk2IJsZjJkubhtcYOqBOw06hlfnAEgnyN3S2yfg4dP
         jAuwVgzF25ObGD+b/3GKszoRx0EIUAZNixN4xv8p4N5RzV89iarOjJ2MCuiveFcj7Y5o
         MP8g==
X-Gm-Message-State: AOJu0YwJ9ibOGYChjroArSg/d6yPLonpyQ67GWeB5ta4BK6dzOA5zpaz
	hkupNldvDdrONp9HrTyyaSk=
X-Google-Smtp-Source: AGHT+IHvuGZIsXw6I2fqnukGj9fiXf1SOYmJVzN0HXKYP/vLOR2dWrVgP03mT4QP79jk/BA//dgPaw==
X-Received: by 2002:a05:6a20:d704:b0:189:c0e1:4979 with SMTP id iz4-20020a056a20d70400b00189c0e14979mr15074487pzb.29.1701101635605;
        Mon, 27 Nov 2023 08:13:55 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id v1-20020a632f01000000b005898df17ea4sm7740194pgv.27.2023.11.27.08.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 08:13:55 -0800 (PST)
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
Subject: [PATCH v11 1/2] dt-bindings: input: bindings for Adafruit Seesaw Gamepad
Date: Mon, 27 Nov 2023 21:41:53 +0530
Message-ID: <20231127161158.1651716-1-anshulusr@gmail.com>
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
2.42.1

