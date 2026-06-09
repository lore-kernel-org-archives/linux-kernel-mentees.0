Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480563C10B8
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  9 Jun 2026 18:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781029397; cv=none; b=XdkRZFfPKUGNIwELGh+zXoa3diSLxN0MJqxhbxP/2ZdClFNJOiOsUFBamuwMpnIN3NoGpn1YlleyaZv5bk0as6pNIy5HPUDGczbaxudxuxvmBJlqck/cPTK5LWjsnTLr3cHMYjekPTuuPAmDbOvsSolpMcfJrBS70HrP8AkP4+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781029397; c=relaxed/simple;
	bh=jS73l8ZPEadDtpuBKIkNYTrDKaEL2P2VVxQ/333SYxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cvBZcVDpcbphOMXLM+AS2ua9b8OrhWyWpEwWiMNCDjVzTFw9zPIUY6Dr4WquWnWiNGJ+QoITjx0wx+80VMCEHQStAyrZ9fW7Ql5egKouhS7rq+MAfPFD6+OCTL3dEnolfIHgaWDcnwIXCXi3e6fGLdWzXtzRb1cXBDGqs3p9974=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNzj/n08; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNzj/n08"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36bcf3d2565so4211303a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 09 Jun 2026 11:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781029395; x=1781634195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5yOK2OmpxELpIU8FfMiRQLGMlc8197Q+PjU02X23WEs=;
        b=oNzj/n08fC3sSC0d7NHj5AfNkzyllEKbXKDwEofsJxOZ2OJwONBwL0xfDFa5lX8J3R
         RCzzWpSnx+5ih6Jd3tFibyiBnKT85DPOj09xa1Ja4hZou244GCejSmONC28iNovqs3pR
         PrdXYCfJP8sTpoe3WvEL3o4QC9yAcX/M8WzsNjrbLiBtgd6jbw5AAs/V9odh4m9kz1ZP
         SOLPLuUY1jg1WtBPcykwMPKqwGDeuzsDDRqWypIZQlVvcZow6p3EVvTXE6KoXKQQncb1
         9k6e0Un3vcOCdWSOgNQeSKfdY6ISykVIit3hWuq4INtIeAePwnTpbxcLtGuQpyzy5UkQ
         NboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781029395; x=1781634195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yOK2OmpxELpIU8FfMiRQLGMlc8197Q+PjU02X23WEs=;
        b=Y8ZM83Dn1s2hJkm19lsjV7s+lkfpuhqpbYuWq7cjvfLEuMrLKndjYoOh/jL1jfUubk
         wQ4wPQscO680RknRU6qI4fkhpiS9L/2SBTJJZjhsg6IQ3hJoxnmemv2GmJbptPOF9Uqd
         ynVkB3rjAeVpH0d7itDUzzDRZ+uWPHjrYSDeM2bf0rrwp9j9YJSIZmJeqnmRyiYP86ZF
         3SgY7QI4j7G2QBJDHpJs38/4eU5SkH8Q1vYqV9vHDVJNq7RrRhEJAlhCGiXX9H3MtCOn
         nGljyH9gWf3IkPxI+xg6pHfXJyQnbsFFYLwg63t1O7neF6uvYodFMETgKPpxNudAvIkW
         zjtg==
X-Forwarded-Encrypted: i=1; AFNElJ98aR4tvLyhwRgarxbIMXj2I/337UE8Yi58rKYA6GGg+jloVP9hhOoGdfDFnb2xCgtPIkPJZnw2+6IOqjZdfWrtpgu1BA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTzYQzNsuh30sZ4BGTGtYc8Np5ErVAAsyP+rs92qMi8WS0rUrx
	ERUI4G7/msyIXaXjnkhJ7XElRZ/yDq1hdCJr4++3ZDvOSB5QtF3KDPrH
X-Gm-Gg: Acq92OEQkxQehU0ThFrwIRdZsoDueDy+LB6QYkw5sxF1HaEolfokGf65vTzsxHlkwNY
	RSzp2IefN39cmO0b3nxLm8L/qjX9oWtVzGwJVxad0Pac9stoKXmX2VLcoxcS+zvGb49wR+PVns+
	AhMafCuwO8e8T+zznY6E3diBeUR3o/mJw0/V1wW/YNxAxNJ1ytD0tukKtb6o0lHdT9wWBKOvGPt
	FFY6ngk9jfCwv/jCWCAYz2/w8DX0bu2SAAoZnFUvhgpLGrGoL+3I1Kr2Ehjh0tQWMQg3ENmc6SJ
	2ci84Lqo5W0nw2BoF0H+BNi0nNesASnnXhn69E/R65FiO0/lPlSfhZRA2xQD9bUky0FtsrDIrc7
	zXuLuXR2hFrOQbl2J3/mPIlNBCaXD8wIQ21RVGFtlWhETBpwi8xT1HdFN3ANgGjerbMyI2BqanH
	00I3S1L0qIhm2+8njCJQz4xZc4Aef3HmUif5CBl+lRN2JegzXDBxj3HdU9TUmJ6OqqCMh2r5I6i
	Qm50V3GMtDX4wPYp3o=
X-Received: by 2002:a17:90b:1a86:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-370eeb174e9mr21556483a91.7.1781029395432;
        Tue, 09 Jun 2026 11:23:15 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm218805815ad.2.2026.06.09.11.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:23:15 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jonas.gorski@gmail.com,
	noltari@gmail.com
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v2] dt-bindings: leds: bcm6358: Convert to DT schema
Date: Tue,  9 Jun 2026 23:47:01 +0530
Message-ID: <20260609181731.1379846-1-ninadnaik07@gmail.com>
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
Changes in v2:
- Modify the maintainers list.
- Add maxItems: 1 and removed minimum and maximum in reg property.
- Explicitly list the properties: label, default-state, linux,default-trigger
  and active-low
- Change unevaluatedProperties: false to additionalProperties: false

 .../bindings/leds/brcm,bcm6358-leds.yaml      | 105 +++++++++++++
 .../devicetree/bindings/leds/leds-bcm6358.txt | 143 ------------------
 2 files changed, 105 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358.txt

diff --git a/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
new file mode 100644
index 000000000000..1b586a0c27b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
@@ -0,0 +1,105 @@
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
+  "^led@(0|1?[0-9a-f])$":
+    type: object
+    $ref: common.yaml#
+    description: Each LED is represented as a sub-node of
+      this device.
+
+    properties:
+      reg:
+        description: LED pin number (0 to 31).
+        maxItems: 1
+
+      label: true
+
+      default-state: true
+
+      linux,default-trigger: true
+
+      active-low: true
+
+    required:
+      - reg
+
+    additionalProperties: false
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

