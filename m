Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E09254AFF
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 May 2026 03:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779680011; cv=none; b=BPa1gQg4buxoFpLK00S5G4LvCz6MmsOjQLe6nbmzFb9wWHwgKyIHOOmeEDsFJUREjHareHiieADFU4334WYIPz80J0OTi+Dh8fLDnw4+kWr1KgGu+/rVqeaGjAGMtoqaRMBPfYCEU1l5gErUk6L7xoVSOv4dE3UisSPFStfM+4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779680011; c=relaxed/simple;
	bh=WAyuds5HBkMBWh/IWc9YR1stn53VnWwH2uOyt5L8jIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NWBSyHSYOtfllEvZ3zlXc4tSN+ImyLfrNtafNn9Z0bVhijbTBPSgfvgS2HZ0D4h+fvMUGwwaHD3swK8eZm5luBBcLdg4RHaoUNbDm5n3oZSFhEW5giQOZMIYaCiPpqi9AjwqjxldiSVGWlCycLqQqjVrbfNSIHvjskKU3Bg/SdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hly5cE3/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hly5cE3/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba0714574fso49674025ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 24 May 2026 20:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779680009; x=1780284809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9yiHvPwp6eaDY83CzuvonglxPr7tqfRwJOe2dfHrjDs=;
        b=Hly5cE3/pVGTuJsG1kxPNRu+pXYGK4lDeRCsgzUcHEjVjVZO5EC5TgThrTR3GbTju9
         mIgHZRLpe7f5ygq22qIeL29xjgjzrzDMV4hRPw4/4eq3DtyZKByN5jvXZnjVFmkgNRhC
         nYHjG9STJmq6SfabmaDPsqbmphsYiT/yy1Sr86hENQ6jtQdrPx5cDxVVqFVAls/B0Sz/
         vQxxHLv7NHeF4DM3kRQtd9raXKK52I7j4QxO3Ssis5rCjaCNdi/LsDOw/KgaWef/uBTW
         r+Z8TrlomNx9uLTVauMhd7fuwSeXwa6ci3lZj/e6XbqFSYKspO1LMc0lIHYUseSDF1bq
         L6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779680009; x=1780284809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yiHvPwp6eaDY83CzuvonglxPr7tqfRwJOe2dfHrjDs=;
        b=HD8YeI0rG9Jtq9mu7NRVUJBLWfyGkrUQb7Elzx+IGXuXQd9yw21+bFdufYFp+2azOc
         0QjmCEigu9QtwMUJQDALMdLZr+d0cRTzC4YpBEXttwEHJ3HkbwNE2k9Ii7qz6wfI/NWl
         J+pY9ustnMyRLfojG0uhzJiDMhkXdf758Kk47leVdcVcXUutWR3hAUVD2zYUZ/W/zQp4
         rpUoXbRz7eN0HgJyOLKm2opBHtqabyorZx4Vynk3uVYI58x0046e/QbnaHcK+5qef+f0
         9pIpJggicSXvvsWmzx5h6ZX/8FE8eugLnaKouQA09SUHA+vAtKKa/7kUelNyucytBlSp
         mYLg==
X-Forwarded-Encrypted: i=1; AFNElJ+pbUEBPQQJ+DJ5KHLSDz5xvyR4rzlVGXpY66clhRg3CWZ1IszY11pObqdFETvmDWoGxvoQt5HlWxGNQn/Zqw6vh3yyeg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4ZJYvGHFvT8uu+NwBqV9u9gyi8KSb25+nEWdy0hhyU/fqddV+
	i9X8lV0cnkeFzluhbYpEN+I42XRXC50g+JHaR2mx/t2xNIOeVjAIEMxQ
X-Gm-Gg: Acq92OF9iV25c9LvzMJhZudDP48/TudzJeW4ynDK+YMxBuzATmMFK4tmPhUABA0BJXk
	QihCd5ak1crg8r0lpMQ225pl8/3oDR++AWIZCYKjF47vDLsIjcdjmVcU4eE4e8p/mkhAAtz0gPs
	/1bxnOpjt0EJdjiHJAmQbDvArfkWCCGkcLgpDq2wuK8G+irwSljQ9FqSomxkTRXkyFMmSoF+VC4
	qg30OcotUII9QkOO9JCFTC97SJayMqkyF0ELebvqAZklwznJ9M4D5Mqri0XbfLDSBWH/bEbNjjI
	uKFR+Rc3Y4vDKmjDZ6GoMxUyYtsw5kOMTFPy1+Uo7hyvQJD3HUVkTabLxOVkRG3N00qdcA5riwR
	X3jk5S9jzz2JtTauzhjei/d3MR4nJCsAV2Yt2UpP6pAh9/TaTqMhLblTHUGBQDZe2sPVkvZpTOb
	pjZnLiCa6TWZgR4XGYH/3bGM5YNp3U+0groHuxWHNRmBA5feYp5pG0E8tcI2yYeqQEFCseZPcpt
	JzNCtY=
X-Received: by 2002:a17:903:19e7:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2beb026f4c4mr137314845ad.0.1779680009159;
        Sun, 24 May 2026 20:33:29 -0700 (PDT)
Received: from fedora ([103.181.54.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58d9fe9sm77391815ad.65.2026.05.24.20.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 20:33:28 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jonas.gorski@gmail.com
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] dt-bindings: leds: bcm6358: Convert to DT schema
Date: Mon, 25 May 2026 09:02:58 +0530
Message-ID: <20260525033258.144291-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the brcm,bcm6358 to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---

Referred to this thread:
https://lore.kernel.org/all/20250930-brcm6358-to-dt-v1-1-ba833ceb1575@thegoodpenguin.co.uk/
and added the fixes suggested.

 .../bindings/leds/brcm,bcm6358-leds.yaml      |  98 ++++++++++++
 .../devicetree/bindings/leds/leds-bcm6358.txt | 143 ------------------
 2 files changed, 98 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358.txt

diff --git a/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
new file mode 100644
index 000000000000..a61417e5690b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/brcm,bcm6358-leds.yaml
@@ -0,0 +1,98 @@
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
+  - Jonas Gorski <jonas.gorski@gmail.com>
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
+        description: LED pin number.
+        minimum: 0
+        maximum: 31
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
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

