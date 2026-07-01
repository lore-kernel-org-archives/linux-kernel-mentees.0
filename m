Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76EE4BCAD5
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  1 Jul 2026 17:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782928468; cv=none; b=mfTUU1r2UCAunK54I5Ff/Pgy6KwWHNJ13hxMznBsiX51jIrvPdpGKCVvIZsiVJRFPs4WVZcj55j/+b0SZH0ji9tI0ydTMgxelCss6sqbaC97DZIl4AkegU+bapEgPBRKlD8mHdLobnDmyefS/LW5IP7XIU8mVfez4ngoGi0ZFy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782928468; c=relaxed/simple;
	bh=6E8k5VxwI2VkFCTXdhxoRdw/vQRq40ak4JPvNoCQIsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fII480+EJRTWnecCVIkqY42paoS0dGzPyQKy+ao6MWcBOBJM0SeqvGRL02O6k0qN5/cGRfO54otMqYoGifi95lyblvsmp7VqPwjf9Pppww3+9K9jD3Go0d/zs9XahY+zf/fn/p5O2hu8cHRIn7QLutzuBXIHitHi3/jjoM/nGQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsOP/S4M; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsOP/S4M"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso333701a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 01 Jul 2026 10:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782928466; x=1783533266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ktY7hjlneyiYSm17AS79Wobub2byOifu7tLzvn5nKtQ=;
        b=EsOP/S4M4UgSgc9LQE5fwaYtrE40iPCZcY5LW1lx3/cyb3c6Cbu4cAfiAFUu7zGs1T
         k42usjNQRbjxco18xnIh92/x1O1fK+bce8WaH9aionhI30zddsV/FoALYaAh+4mI7sZf
         LOvcSPl+jCfEgyeE4kz8MSu+1LrKKEALFM3RaFbQfE1+cUDz8Mp83+ZmAEt2S+sz+EMP
         t0pLPZ3ZKon/bPVg8esS4WwmZtKLV6P1uexnnGCITRxtaVhD9kpLaOb9VeMYaJoKzDsp
         10Fi53Ig+3eP3aeJbjkgiYjzX0+Bc2J4OfxCCyOFj0LmAcP4TWJH148wOZuhtfuqb2nz
         WPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782928466; x=1783533266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktY7hjlneyiYSm17AS79Wobub2byOifu7tLzvn5nKtQ=;
        b=fneRGOGIUEV7zbGK/Q8Wky1hqcGxXl29qxYCHWZ/oKcsYmWs2XWpVfQishoGypyIbg
         2aHASzc82/gN3g7T+YUvX/ne32Il55thQZOvKcUEFsCRlJj+jzPhschUJH7t6QSU6dei
         PqNnSV2wfhcDBAo5HEtv+l7VoDvz3WzpD0YeddlGy4n01KpGK+w92pnEUXbjex18yzeI
         HAoGuyTX7btpWyGvEq8xas6hxGyrh6DG/iA3J2sW9JezHRLCoTda1N984ILcDlJAlq8y
         VSXK90XEGnKlPTTp4VFzlbrcgVn6qjiNEomkJja0h3zXn8odHR7ll3VW1zs7MAAtUjRf
         rJiA==
X-Forwarded-Encrypted: i=1; AFNElJ9iODGqeV3arTLHgz7C7vVe2d8ctbw5QqRkXeRSf38k6mvXEdiLfxEE+A/8tHw1cuSCVHapNItK4uVG8kmyb3JSNWxrfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyL/kA3rUwuZwkCvOEI2JoxAddC5UyxnrRx608QbddkPP9nVWXQ
	DFskt24rEWtnoa95OfPnVYKOb5L39TFGnt0siza7OzNEcA8lHGlXVD7H
X-Gm-Gg: AfdE7clf7ggGH/NSWw8X1ApEyD47h8mYPTiYeB7AufnRHEfCMaZbCX2S7NhUDrdtI+D
	LRwQk96GLwwVOwDIZTAXzwbVekhSO5L6OoM7vxApej/tDqQ1v8+XUMZxGV7dEHmOOyGXoFH85IC
	jjJ2VxQmtRCc6nlJ9DyTW4VtdH9tpmtd5B93FkG6anS5IESlXnSbev+HX5bNbKl0mTzfYVrGlCt
	ibsA+0mVXk1kl/K5mJ5JSZ0U8TGiaKqBL/aoL7ftDmZ4loZidkIga2YtoePNuvlOr+u8s5Nr4W+
	YCUJd+gpU6FYN05SDrZqVWMJzW8HEoiuslq/Xaz+1RUxS0vD2CcQHQHN6eshCjPSW55s7kI9WTM
	YTb48o5lqR+/wUyzBjrG8Vo75g61LgUkq1CbFAzbJ/4Uh0OkeChG+eaPJj58xlzkmu8BZiuu6qi
	SLPSjRD1MvXgpGYthd3FMjAK4+1aA0YZnptjzvqnWEGSwkxQ4cIQeN2CEPuI7ptI0m9MJK
X-Received: by 2002:a05:6a20:431c:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3bfed1bfa15mr2855302637.10.1782928465900;
        Wed, 01 Jul 2026 10:54:25 -0700 (PDT)
Received: from fedora ([103.181.54.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm82300eec.15.2026.07.01.10.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:54:23 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Date: Wed,  1 Jul 2026 23:23:30 +0530
Message-ID: <20260701175330.1645927-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert lacie,ns2-leds to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 .../bindings/leds/lacie,ns2-leds.yaml         | 87 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-ns2.txt     | 35 --------
 2 files changed, 87 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-ns2.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
new file mode 100644
index 000000000000..679a618906d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dual-GPIO LEDs found on Network Space v2 (and parents)
+
+maintainers:
+  - Lee Jones <lee@kernel.org>
+  - Pavel Machek <pavel@kernel.org>
+
+description: |
+  The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
+  modes are available: off, on and SATA activity blinking. The LED modes are
+  controlled through two GPIOs (command and slow): each combination of values
+  for the command/slow GPIOs corresponds to a LED mode.
+
+properties:
+  compatible:
+    const: lacie,ns2-leds
+
+patternProperties:
+  "^led(-[0-9a-z]+)?$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    description:
+      Each child node represents a single LED
+
+    properties:
+      cmd-gpio:
+        maxItems: 1
+        description:
+          GPIO connected to the command LED output
+
+      slow-gpio:
+        maxItems: 1
+        description:
+          GPIO connected to the slow LED output
+
+      modes-map:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description:
+          A mapping between LED modes (off, on or SATA activity blinking) and
+          the corresponding cmd-gpio/slow-gpio values. All the GPIO values
+          combinations should be given in order to avoid having an unknown
+          mode at driver probe time.
+
+        items:
+          items:
+            - description: LED mode
+              enum: [0, 1, 2]
+            - description: Command GPIO level
+              enum: [0, 1]
+            - description: Slow GPIO level
+              enum: [0, 1]
+
+    required:
+      - cmd-gpio
+      - slow-gpio
+      - modes-map
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/leds-ns2.h>
+
+    led-controller {
+        compatible = "lacie,ns2-leds";
+
+        led-0 {
+            label = "ns2:blue:sata";
+            slow-gpio = <&gpio0 29 0>;
+            cmd-gpio = <&gpio0 30 0>;
+            modes-map = <NS_V2_LED_OFF  0 1
+                         NS_V2_LED_ON   1 0
+                         NS_V2_LED_ON   0 0
+                         NS_V2_LED_SATA 1 1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/leds/leds-ns2.txt b/Documentation/devicetree/bindings/leds/leds-ns2.txt
deleted file mode 100644
index 9f81258a5b6e..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-ns2.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Binding for dual-GPIO LED found on Network Space v2 (and parents).
-
-Required properties:
-- compatible: "lacie,ns2-leds".
-
-Each LED is represented as a sub-node of the ns2-leds device.
-
-Required sub-node properties:
-- cmd-gpio: Command LED GPIO. See OF device-tree GPIO specification.
-- slow-gpio: Slow LED GPIO. See OF device-tree GPIO specification.
-- modes-map: A mapping between LED modes (off, on or SATA activity blinking) and
-  the corresponding cmd-gpio/slow-gpio values. All the GPIO values combinations
-  should be given in order to avoid having an unknown mode at driver probe time.
-
-Optional sub-node properties:
-- label: Name for this LED. If omitted, the label is taken from the node name.
-- linux,default-trigger: Trigger assigned to the LED.
-
-Example:
-
-#include <dt-bindings/leds/leds-ns2.h>
-
-ns2-leds {
-	compatible = "lacie,ns2-leds";
-
-	blue-sata {
-		label = "ns2:blue:sata";
-		slow-gpio = <&gpio0 29 0>;
-		cmd-gpio = <&gpio0 30 0>;
-		modes-map = <NS_V2_LED_OFF  0 1
-			     NS_V2_LED_ON   1 0
-			     NS_V2_LED_ON   0 0
-			     NS_V2_LED_SATA 1 1>;
-	};
-};
-- 
2.54.0

