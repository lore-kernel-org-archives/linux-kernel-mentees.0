Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B192D46F4A6
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 21 Jul 2026 19:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784662172; cv=none; b=HgbeLtFkYDa/k+hTmkD1MobxOmrglsFqqjhe2y6YX3tNfdFyk3Njh2LJRMXdfJ/q9gUxPH3L+TKfErA9K0wSCYoCalAzhROxpmW3S/19rpsSi2ixfe/7Hk/fBbySBo7t910Puu6B6daeLFmS46qmMdbEcTFZshcX2tSpA4vPS1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784662172; c=relaxed/simple;
	bh=5uHrJY3HeWlIs8TynVILl3KyFkLfOhYuUo74OAadzzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MsO6a9iQ9kiAW9f52sOeueDH0S3nTuVZb4BHbuJGjnPgK+RrvcgTWDcVWpQjyEr17PrR9dafyODCkQDc61EGszEPZhMGvHMfiZLasKR3AhyOJr0vyq5ILK9IA4vz13oEgTuko0Rc4ZuK6ibWDVenBvCFM2JUKaSUXRKtmmANha0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTXg6Fx7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTXg6Fx7"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cedda2ce6fso72817545ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 21 Jul 2026 12:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784662170; x=1785266970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=748lzqKN3J88b3BEuBiWg6WchFFUdy2hlfv06NfZifk=;
        b=hTXg6Fx7nWQcYO0UTEj8xRhuP5fhqxsu2zbrPHiORYjpP/xM+blzgZAt6sA2m2KL1d
         EC0BF3+EYxfT8FVETei5AnbiGSzuRaUlvzgPm1CAErXE6dvBUDYzb3Xm51Y0XkEhfa2K
         1kAVRSnvYX0aC7W1LqkMfiRV6YhF8rq/lBmBz8BlkicUC9EtUzTjk4pRjfSv25a6+aVk
         4Ol/eZIiNiYnmbKlX6KWteVQNbmwP9iFN5LSpO75BSXFKvfKjzP/SSdSlIcK4GGt7QZ0
         lbEhejU0hE1AGPX4yb35x+SpLT00uB466ddPWkuvQC8CkDD8tlBfLb8QtJHjy7X7zoRz
         aVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784662170; x=1785266970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=748lzqKN3J88b3BEuBiWg6WchFFUdy2hlfv06NfZifk=;
        b=TgU9mK7ilYIGhHxqRUEdX9DMkuyHJLza1TE64LJPvaV1xtfcuQIZoJ/jrXnLDAHZ+z
         HeK2c3W0QdKgC5/SgAcbx79Xn6X7byzzABVcU3/DC0peiUzfcyZ4S5XbbhAsz25w9+Ey
         uVftF7fmUfsmP35VBKAMVsF0iSkoYXxWvMnlUH6jMa2BTAyRNEEcJhAKJT66G6BAcNPh
         gqL0de5hC6qTQR2PVCfJgGw2OyYD29lADAIbc6hfL12IpY/uF4QrqhkRhSCB+MtpfzI/
         gDxTlU2qWMKeSxbsK1hpvAHJ80fuyUbASf3jkJuOBOwxZR0G84VJjgbOjeL6Pns2NjyN
         bJ8A==
X-Forwarded-Encrypted: i=1; AHgh+Ros7wIFwuguuclrqZwvMMs4yZbM65LUhpEvQMpdYxSZ4taavC+kKzwFttXDgjR08l09g/J+C9tnh8abnWRfx8+dUHgLaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwidqzJSWNMo8c+6gwKB7ZKqcXABDPhc/Msn4E8LS9j80sgrPGD
	3pkEylbzL8/QoHlDz6i/khn0Yi1tobbHR2NWRSSjmU6GCfo4vOZwLm7m
X-Gm-Gg: AR+sD13965WgfVYiaW+cAXrlY9t4Xep5i8K86AEp0+T5DHO0FDmfOCLrHbg3osO/jUN
	RAcGBUqf24VVaqYa8ga4fRdb8ppvNkrrtohfKdF+Iv3uLQDsFD1+rU0fHf1p4Nmhnfups6ChjrY
	hfFmRxwouPQ0SL2yUDjNMWO0SJFyH9kQIKHJaX9/IQi/BjFgZnPId79VJVYulm/UN8ihaBsUjfW
	MgeYwOXmGJ7gTyO0Rl2LANnqW7z7SreKJAGfkSkXtS3SlD23R3hzTd3GB2P2P3YrQpMf5bvTIQs
	ASNrViwE1Ed3uUdB0GTb+DnrKvExNLYL0L8Q9CfkdR/5I14G+bOW4g5Ulstk98BhNkTrvZbyue5
	0XqtRnjEwdZxeHk9zSrdbY7/sR31cG5tdzOswvuhui6OcbcD+zn1/l0LkvniACg80GUo99XTvcX
	x21gS8jYsS9QVuLgq1mNi6UW1mBHVTNjmbEb3qDUStF41It7lJeODsAy/BSBijTQHZpuvLRXN8G
	HNAKpqdMpGhCupdLBko03w6oPmW1X3niUg9vhrhBGyENyeInrd8
X-Received: by 2002:a17:902:d4cc:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2cf348193f5mr215886905ad.7.1784662169923;
        Tue, 21 Jul 2026 12:29:29 -0700 (PDT)
Received: from localhost.localdomain ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm3063164eec.21.2026.07.21.12.29.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jul 2026 12:29:29 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	simon.guinot@sequanux.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v2] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Date: Wed, 22 Jul 2026 00:57:54 +0530
Message-ID: <20260721192754.46344-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.55.0
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
Changes in v2: 
- Change maintainers from the subsystem maintainers to Simon Guinot. 
- Drop "|" from the description field and update the description. 
- Remove patternProperties field and instead use additionalProperties.

 .../bindings/leds/lacie,ns2-leds.yaml         | 80 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-ns2.txt     | 35 --------
 2 files changed, 80 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-ns2.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
new file mode 100644
index 000000000000..1976669d2218
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dual-GPIO LEDs found on Network Space v2 (and parents)
+
+maintainers:
+  - Simon Guinot <simon.guinot@sequanux.org>
+
+description:
+  The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
+  modes are available, off, on and SATA activity blinking. The LED modes are
+  controlled through two GPIOs (command and slow), each combination of values
+  for the command/slow GPIOs corresponds to a LED mode.
+
+properties:
+  compatible:
+    const: lacie,ns2-leds
+
+additionalProperties:
+  type: object
+  $ref: common.yaml#
+  unevaluatedProperties: false
+
+  description: Each child node represents a single LED
+
+  properties:
+    cmd-gpio:
+      maxItems: 1
+      description: GPIO connected to the command LED output
+
+    slow-gpio:
+      maxItems: 1
+      description: GPIO connected to the slow LED output
+
+    modes-map:
+      $ref: /schemas/types.yaml#/definitions/uint32-matrix
+      description:
+        A mapping between LED modes (off, on or SATA activity blinking) and
+        the corresponding cmd-gpio/slow-gpio values. All the GPIO values
+        combinations should be given in order to avoid having an unknown
+        mode at driver probe time.
+
+      items:
+        items:
+          - description: LED mode
+            enum: [0, 1, 2]
+          - description: Command GPIO level
+            enum: [0, 1]
+          - description: Slow GPIO level
+            enum: [0, 1]
+
+  required:
+    - cmd-gpio
+    - slow-gpio
+    - modes-map
+
+required:
+  - compatible
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
2.55.0

