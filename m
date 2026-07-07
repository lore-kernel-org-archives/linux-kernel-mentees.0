Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377643314DE
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Jul 2026 18:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450045; cv=none; b=t1j5b4/CXZOSdB5YM4jgbyN5Ml8uqOF9L7irdQdoOiyMQfNuX0iz0GrLsAgC6i+VULI+r0AEUF8zNogx7XsGwJWZ05EWKXfn2FKVJc0WILq6mrCBHpu2VARlmbRjtsd6/2LKwcir5CwHIjVfHnocg/ybmUZsgApK5z2wy35qTF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450045; c=relaxed/simple;
	bh=BA/fghVmq2tfFUvLItu4KduZ/+X/2tYFWOuW/Mblvic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PxtaBBsYz1MjPSBRpV/IL+x8KN+bPwfKoDiXDKz7uGXewhz2PCwF3MchidxRa2a1d9qFQhlTw3+UtfkW5YaBjQ6PBpH3LdTZQQJvwdZ8GHgVNSfKWl3KeBN4LWfZqLHpMSDihCXQx7rQMAziR60hYeCRZtKXnIt5ewNGuKN25zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kznu6D9+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kznu6D9+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cad4170e8eso54754335ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Jul 2026 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783450043; x=1784054843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O6UH9Aze3YH0zmdyRaXrvdeWnQAlPkh9QAc9PSlvO20=;
        b=Kznu6D9+G7IfpcntPvILgKBTGhX/f/lLebWejoILePZvfipbuuN8Eft/39ugUZa5SO
         8hP8VKvizNrvPgHP8sXc4zJuO+Q0eAUwdmva3h2Hl/SVPtRxgP9xuptJxHJFo48G99JX
         BY0oMXKwXpDV3lySfZAwBTYFsxhyxWMgQuCtUV3Yu0W9a17K2BJsy2p3edPRyNrWrHhs
         dwVK5iWln2KifwKg+yEoRPHAoQuqTAsdAiWxrtYmiRnjbXbtLE3fcgQLeAlxH4AZEWJE
         4jcDdgGPtYikFFapJQJFD7QXACC367wCYZPSDNdyC+busnxJ0PbiqIPvZtR06xEOZ6D+
         wWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783450043; x=1784054843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6UH9Aze3YH0zmdyRaXrvdeWnQAlPkh9QAc9PSlvO20=;
        b=GhmyStqrxiB1sP14iSWo135bMls0ExiOfAaU3ylGyKkcuCwEIa7w0+A3wi3u1cB3DT
         9DVqdPUSDvMZWAOcGS1FAmjZy2FI4B+JZi5qOcr5y2K3r/TchrWkwS5OQjKC2Kg6Tioy
         RMPSuW4/HTKObohmc1sda7FPhKE74tosKPCjigKbf10BjZxnkv+9ABd4tkSfKMYRkAqN
         /3nIj8K9+pE1oOQ3XVT80u5N5MJ0YR7pttgJBMR+yCWJRajzolOJugg4jbBk1R3NIEmX
         4LnZCzWjwSIlj4gJW8OjvQfGbnbDh1fbfptnGPfz0x3O9hqJLXLM25O0yPMmIka02QTz
         zTaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqwNtSA5fsWKR2/K9n6LhbdNPVuYA2ItAgxB1B7f9cXYR1D6tOamHo5Q0TnHRv3v1QRX/1R2/Qq+6TKk8bAGvIHu+j+w==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx/86meRvaEqMV7Lf8TuM/qk8tZF0P1l8b7ED2hNGaJDK7c9gb
	4n8L24oaCeRkYnY7Ba4f1EIcvtkOy+ZIsW3zn7Z5Pw9IYNvkdFuXJScQ
X-Gm-Gg: AfdE7clRAD6ekHmBp2uo4zyqNGEYKx7hbeWnKArvJvsfIjCoEGtrRTNa5DMSBUl9bey
	TT42SqYwKhA/XD+f0UXEukbu2utrmM1cnGbeMQzas8rQ+B/7sge5neob5xpIXlUIYrlvpMicQ6V
	1ROUc1qS2LTw2d5iyx+t8PGHBgdCkuv5G+zTzU6AjKEh3EESMk/hccpJq3psmxg6UHVBWb0RN4T
	F76e1/3R7emghyyuNdz7GXOchvMzbEoeMRpFme8ozNVV9JZv1Ws9Zm5e6nV/ezDpMAF9qgl5aPs
	BjmBH6sbaHxHKHscKBnZ9FS0Lz1BT3QaM0B8+AGS6uAfDFpXkNZrwBqevmJO2xqX3AkY/FIVNdm
	q9w4ZHMz3brjJYsn6AxC78AOhr4Tdn3Fl66FyxJ4UE8zVhiplWVdSSUWdZ0F/BWLptb31hSpZjP
	29F7CUZjjxSCfsRDgQDevCya7i2aHRnP5zIFNfwEC0GQTTggdi6UhDBmZdb1+ZhePBnmkn
X-Received: by 2002:a05:6a21:71c5:b0:3c0:b3f7:e5c9 with SMTP id adf61e73a8af0-3c0b3f821a9mr167859637.36.1783450043279;
        Tue, 07 Jul 2026 11:47:23 -0700 (PDT)
Received: from fedora ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c4ddsm12364507c88.1.2026.07.07.11.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:47:22 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	noltari@gmail.com
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v3] dt-bindings: leds: bcm6358: Convert to DT schema
Date: Wed,  8 Jul 2026 00:14:28 +0530
Message-ID: <20260707184437.500278-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the brcm,bcm6358 to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v3:
- Revert to unevaluatedProperties: false and drop explicitly listed
standard LED properties.
- Simplify regex by removing redundant 0| condition.

Changes in v2:
- Modify the maintainers list.
- Add maxItems: 1 and removed minimum and maximum in reg property.
- Explicitly list the properties: label, default-state, linux,default-trigger
and active-low
- Change unevaluatedProperties: false to additionalProperties: false

 .../bindings/leds/brcm,bcm6358-leds.yaml      |  96 ++++++++++++
 .../devicetree/bindings/leds/leds-bcm6358.txt | 143 ------------------
 2 files changed, 96 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358.txt

diff --git a/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
new file mode 100644
index 000000000000..95fa311fddb5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/brcm,bcm6358-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LEDs connected to Broadcom BCM6358 controller
+
+description: |
+  This controller is present on BCM6358 and BCM6368.
+  In these SoCs there are Serial LEDs (LEDs connected to a 74x164 controller),
+  which can either be controlled by software (exporting the 74x164 as spi-gpio.
+  See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
+  by hardware using this driver.
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+
+properties:
+  compatible:
+    const: brcm,bcm6358-leds
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  brcm,clk-div:
+    description: SCK signal divider.
+    default: 1
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8]
+
+  brcm,clk-dat-low:
+    description: Makes clock and data signals active low.
+    type: boolean
+
+patternProperties:
+  "^led@1?[0-9a-f]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+    description: Each LED is represented as a sub-node of
+      this device.
+
+    properties:
+      reg:
+        description: LED pin number (0 to 31).
+        maxItems: 1
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    led-controller@fffe00d0 {
+        compatible = "brcm,bcm6358-leds";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xfffe00d0 0x8>;
+
+        led@0 {
+            reg = <0>;
+            active-low;
+            label = "white:alarm";
+        };
+        led@2 {
+            reg = <2>;
+            active-low;
+            label = "white:tv";
+        };
+        led@3 {
+            reg = <3>;
+            active-low;
+            label = "white:tel";
+        };
+        led@4 {
+            reg = <4>;
+            active-low;
+            label = "white:adsl";
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt b/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
deleted file mode 100644
index 211ffc3c4a20..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
+++ /dev/null
@@ -1,143 +0,0 @@
-LEDs connected to Broadcom BCM6358 controller
-
-This controller is present on BCM6358 and BCM6368.
-In these SoCs there are Serial LEDs (LEDs connected to a 74x164 controller),
-which can either be controlled by software (exporting the 74x164 as spi-gpio.
-See Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
-by hardware using this driver.
-
-Required properties:
-  - compatible : should be "brcm,bcm6358-leds".
-  - #address-cells : must be 1.
-  - #size-cells : must be 0.
-  - reg : BCM6358 LED controller address and size.
-
-Optional properties:
-  - brcm,clk-div : SCK signal divider. Possible values are 1, 2, 4 and 8.
-    Default : 1
-  - brcm,clk-dat-low : Boolean, makes clock and data signals active low.
-    Default : false
-
-Each LED is represented as a sub-node of the brcm,bcm6358-leds device.
-
-LED sub-node required properties:
-  - reg : LED pin number (only LEDs 0 to 31 are valid).
-
-LED sub-node optional properties:
-  - label : see Documentation/devicetree/bindings/leds/common.txt
-  - default-state : see
-    Documentation/devicetree/bindings/leds/common.txt
-  - linux,default-trigger : see
-    Documentation/devicetree/bindings/leds/common.txt
-
-Examples:
-Scenario 1 : BCM6358
-	leds0: led-controller@fffe00d0 {
-		compatible = "brcm,bcm6358-leds";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0xfffe00d0 0x8>;
-
-		alarm_white {
-			reg = <0>;
-			active-low;
-			label = "white:alarm";
-		};
-		tv_white {
-			reg = <2>;
-			active-low;
-			label = "white:tv";
-		};
-		tel_white {
-			reg = <3>;
-			active-low;
-			label = "white:tel";
-		};
-		adsl_white {
-			reg = <4>;
-			active-low;
-			label = "white:adsl";
-		};
-	};
-
-Scenario 2 : BCM6368
-	leds0: led-controller@100000d0 {
-		compatible = "brcm,bcm6358-leds";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x100000d0 0x8>;
-		brcm,pol-low;
-		brcm,clk-div = <4>;
-
-		power_red {
-			reg = <0>;
-			active-low;
-			label = "red:power";
-		};
-		power_green {
-			reg = <1>;
-			active-low;
-			label = "green:power";
-			default-state = "on";
-		};
-		power_blue {
-			reg = <2>;
-			label = "blue:power";
-		};
-		broadband_red {
-			reg = <3>;
-			active-low;
-			label = "red:broadband";
-		};
-		broadband_green {
-			reg = <4>;
-			label = "green:broadband";
-		};
-		broadband_blue {
-			reg = <5>;
-			active-low;
-			label = "blue:broadband";
-		};
-		wireless_red {
-			reg = <6>;
-			active-low;
-			label = "red:wireless";
-		};
-		wireless_green {
-			reg = <7>;
-			active-low;
-			label = "green:wireless";
-		};
-		wireless_blue {
-			reg = <8>;
-			label = "blue:wireless";
-		};
-		phone_red {
-			reg = <9>;
-			active-low;
-			label = "red:phone";
-		};
-		phone_green {
-			reg = <10>;
-			active-low;
-			label = "green:phone";
-		};
-		phone_blue {
-			reg = <11>;
-			label = "blue:phone";
-		};
-		upgrading_red {
-			reg = <12>;
-			active-low;
-			label = "red:upgrading";
-		};
-		upgrading_green {
-			reg = <13>;
-			active-low;
-			label = "green:upgrading";
-		};
-		upgrading_blue {
-			reg = <14>;
-			label = "blue:upgrading";
-		};
-	};
-- 
2.54.0

