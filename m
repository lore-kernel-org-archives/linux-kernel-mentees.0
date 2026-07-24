Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB4A34D915
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Jul 2026 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910326; cv=none; b=ERBDqLwvsO8jzPE/iwusXmbF+pF+CBR7J8HjCCrcxWnpdv6/Il6XYwtloh1OQF5gPWdZ0ieiJHe3Wly3rQGPHSUClGDbFVmm9QKDVIwLaeMhJDhSjR571t0Qlzfh2Xf24HUrH1LcMIm5UxBmplKABPf/6odcqu0BnIsbiA+t698=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910326; c=relaxed/simple;
	bh=QRhVBSuXVEoQIY3bGLpzbuEnhuAMXEhnpVZXREUzxAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=chkx9CWQhECYPkgQLo/ReLLJvo0NThKthrhCADomCnDC09Ttbrrl2Zmv8OTDzOSwNfg8r993JKrW8EbJFps4Qbl3dJJOcPoexf7Xzjr7qwS/n8823jugbEYAIHIwBECfahI0T+pd/eJC6mcPImChJ29X+maLmoAigbvPB+Y2GCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7O1nhZQ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7O1nhZQ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso445556a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Jul 2026 09:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910325; x=1785515125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIveEnsC2i4BV8ze8aVcBp+MK1iWZOOv1jA6qIdT6uQ=;
        b=W7O1nhZQlPHQ46SmV3nOnL0KKdr8aknQ7TEfzqjqMvrakheeykhCNP71SmGm2oaE/u
         aCu8dj1OL9o+g71hFdBdVRvUfR1Qld25AdeMjXmAfN0eks5ykPeg0wvzsddkqh6NEMyj
         TKN5cuKYbuid6yrxOiJz7yWyIW1QkXxYXt1dRGaORzQcz3Pjxo0/jZiLJ84HNR/UT8fo
         3kXWLVefz0wNHF1SSi/b1GbIqNN5x1R1pBqeDWjzfR4z1bIXONZiRsphTDCME9I40Fqn
         zHd80wKLn0UsXL1na8Ib+kmI5pvCHERId/wB5w6rHRxp2suNwXDlE4UkK6nuhU0sJP2c
         t2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910325; x=1785515125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIveEnsC2i4BV8ze8aVcBp+MK1iWZOOv1jA6qIdT6uQ=;
        b=YVBbgMKeEftWyDNdX9Ekju6TivV98T/wY8bKxHYPZJWRd+ybQPhfDzy5fmyR6uAcgw
         5GtiN8TzcV8uY2SsaLSkoLxshUl2h311O5/2ha40Ye80TiZWro99atrliEzA1YjjOv+8
         ckSKNF6XzabIlBdnOBgS1rTim+zNwei+6IoDi8lMo0vRYDBn48qS6SWJVD1JA2czKwlx
         dXuSkaNdaGFz0KsdzveiDF8rypzQAczYyEw+gnOBS6q3bdAGbw+7T6pgekPV0v13tg2W
         35dQRBChEFw+MuXEgnNDWA+XssGMjIg1ycU3sQN+x+QnXMBRGopnD+MOH+ervX6vR77j
         f6jQ==
X-Forwarded-Encrypted: i=1; AHgh+RozZeBHdlmfo9GcZvCCGRe10JUmjpzkZ13ZPExo20uHwU8rn/TR8LD7eUT59cDfp1OLbx7I6PpgRolez6T5a48PSs9rAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn/eSwzXXRMDU4NYq2oAmjaZZDjgG/PIt17W8Voc8Rk1CYBDpl
	mLERgRJg7BodqTQF5nWGCnfS3kNAd0wXEDNFiot/TCp6qjQPZYNj79Il
X-Gm-Gg: AR+sD12+hLv6dEtmqO5tbRscg6trTpOVOgREnsjcezUsuIA+FxYfEhmP7rbvXRvlbk7
	L95E8hdM7OnGQzevSmyEtxiLGacEfmVddpogECUpg2GiRUYThKQIu1ipzPP4rwc+MUSGXPmYc9h
	w54hK+OdB1PqFxy+xRzWM34LZ8lcu1BvcIEGroPJRhMTgnJDMKyxMvkicHkAhHlHejZxC+hjeSP
	jTBgpgg+IPL6Cl2zzYVYxJb6wNP8YRBFiMubpVEn3yct0zztnD21N1RWe45qI12CvCifeX0OGzJ
	RWhEFhez0plgq/qP7Vm31Z14FnOIq6V54pZMD350Amas552eC+HSpvS8+RjXK+6U0o4LNqxp9wI
	iLC3A09PwLxedQ9ANibOhjrCaFZ1jnB1g0TwFl+MHyY0SotswVXIHgKlBwDJGVS9UkdNLwSV6ds
	43HfxS7dGtzj//03vuDvYbeUMw104OdTXmBQlO42N/HRexf3feBHBEw/NRUKTKwrYZHWdn59kPd
	I1pnIGVf52pkbOWtg==
X-Received: by 2002:a05:6300:141:b0:3c3:a1a4:862c with SMTP id adf61e73a8af0-3c44b2680b9mr8889730637.68.1784910324540;
        Fri, 24 Jul 2026 09:25:24 -0700 (PDT)
Received: from fedora ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm1323838eec.4.2026.07.24.09.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:25:23 -0700 (PDT)
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
	Ninad Naik <ninadnaik07@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Date: Fri, 24 Jul 2026 21:53:32 +0530
Message-ID: <20260724162332.32291-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert lacie,ns2-leds to DT schema.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202607231542.6ovJrInT-lkp@intel.com/
Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v3:
- Add optional property num-modes to the schema.

 .../bindings/leds/lacie,ns2-leds.yaml         | 85 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-ns2.txt     | 35 --------
 2 files changed, 85 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-ns2.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
new file mode 100644
index 000000000000..2138c75c0413
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
@@ -0,0 +1,85 @@
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
+    num-modes:
+      $ref: /schemas/types.yaml#/definitions/uint32
+      description:
+        Number of entries in modes-map.
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

