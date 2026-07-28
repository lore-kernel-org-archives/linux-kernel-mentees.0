Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0729D46AF19
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Jul 2026 18:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785264152; cv=none; b=DFO9rJdQNw1ZRxTAcUp3kBV25D8xqvS//RaSXQ2QzLYydzc6gDVdkPvlekkZ9cYcvJsCAsWdbY8B8ppxccrJhqKuGA1VPg2vakFgYIEoKbyV942L0jlAbU1KT5nZIVD9KcJ2nnRyyRH3WQLP4r59V66IU20Y2ut1X8ocJkMZ9y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785264152; c=relaxed/simple;
	bh=rlWX8zSo109/lXQYg1Tk/kRqGUrbbsuhaVsjDuKwf4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V8QAkBmFyMqiNXHv/cvDvsZuUbTVSXON8ceKqZm0kek0LPn8kjP8NOQ3rGDoAJOP0lAYDxiMucpOTLhtHgJwSLG48LOqN2HWDrWT62Kqkv3kozjE4VDnqV9ixLcfsuHhcpnXCujgp7z9/Xp2tmKtTkp6Jf9QzvAFZiaYId9fuM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4slZJiK; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4slZJiK"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38511175ad3so101524a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Jul 2026 11:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785264150; x=1785868950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98KjwxSHL1rPAUCBymY6MMY6MwyG7kbviDNwGZEI2xU=;
        b=Y4slZJiKfRnwsfmj7y11hLXwtSGzJLTzpmp1OIa6nhN5goqWn6MD4RjGHrdmBhg4yq
         HLSWHvibiFgPksKv5QzKgX5WRfGCkMe3CkZWMZnA7+yg9+pTK1dfr3tSAd1/S/RsMJdo
         aKRqGNCrPsabJAOVtE5Mqf2Agm+fQQk+Vi+sGQrxT5r6WHtYB5Vtx2/w2quSdm011bTY
         MVBc1xSt+YNl4aSSybpJI/P/PUniDyLNGe6vFoOlDx+D97o7J43C6rxJ2rhS3OZTshhO
         b9NdYBfzWGT5viRyboElenkhkty/MrQ0F6UOJ6xXTYikEYRdi3aZkP599BZY2hCaYB2V
         +KWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785264150; x=1785868950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98KjwxSHL1rPAUCBymY6MMY6MwyG7kbviDNwGZEI2xU=;
        b=XZCi4tVXw3nDMmVpe9CErCfx5fl+/hpTCRQ4bB1zrQ8ahCCjTziXF/w7LIVTF6VNUg
         fPkfr78WHco3XZMRXMGn/IEqiQvDLJ6E3CSpxsHzz4HyEVtVaxTrQ50Nm9wZgwVRjnHr
         hnnmvdHD/fh9Z1JroQIhSa1jVp7DJDeZbCKlyfWsW2oDj2+bv1FJX+zko0jbwwJJw7Px
         42rUVzemimnRKTu21VteSAVKfzyNkLKjYCEUh+STlSXniBII7QragZR5/P9mQGae1txM
         1cD4pSK5ynkUOnT2Rta+ZsTPQXIdlsx0j4VlTrjfSkUse7mXKxvoyoMfBpYz5E83MbaO
         83rQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEpJqtiQS0d6LDLx5xScaUhRN7vhqTers3PatvF74Ay2zoW8JrZLYP7zsctbHFPUZOktiKyhHiMldrAssBzRVnBRHhkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlnIELK2AXsMDdqMpNYQ+kcXVl8iOgcnKfYIXmq8L0mPAs1dcb
	OAsUVGNIWOgnF8m1ZeKwT3tw1+UPlpXan3B5ZmyHloUMyD6B4oRnfi8TkajPqqJCMr4=
X-Gm-Gg: AR+sD13/iFUDKKqkYwuQO92X2QkkG1pFx4yPApiyh9k6EIeFHOp/9gEBKhCiiSBxfkA
	QObNdk8qs9zKkMUnG5O38KbP4QE+Cat/EDSW5aYKXv1vLqlGPqeNdS9y0Aq0L+0F9G1qjDg39A2
	/h2/QaozDrCzFWCPEGYqfD0k9ORPOdRS80OrZhe4TB4Zt1DRiahqN2Ll1tuXEDUiedqA7nUwE06
	V9grKv++pDUZvJKwtwgs6lE84qFZ9R8eGYZbSgKbx8r/B9LMPbrl0OVlqIzVf4n9VZMw3wf/Ker
	MCKtJPRaszXtCj/zX4WSPxFO9PpxjsZ674ZHosX4welcEAOyyn16jNqwblCSMVmZhlC0NTbYIBB
	oxJgrxSFSMwbeFyzHbCTK4qZI/FbKB7qba2drLzwebEZo3g3BPWXqFmKYCE9EpwaF0j3y+fjxGN
	UtUrS/vAZJncFAsF5+MjIsse3BeXi//w9HejfNH7g04c3q+ZHDbiGLUsRYVO/pwVtIQNr/zAPP2
	bL4pICE3znoB9XcnA==
X-Received: by 2002:a17:90b:55c5:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-38f6a336613mr3943439a91.13.1785264150174;
        Tue, 28 Jul 2026 11:42:30 -0700 (PDT)
Received: from fedora ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc63f3sm1013576eec.16.2026.07.28.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 11:42:29 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Date: Wed, 29 Jul 2026 00:09:45 +0530
Message-ID: <20260728183945.12008-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert lacie,ns2-leds to DT schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v4:
- Drop incorrect Reported-by and Closes tags.
- Add complete changelog.

Changes in v3:
- Add optional property num-modes to the schema.

Changes in v2:
- Change maintainers from the subsystem maintainers to Simon Guinot. 
- Drop "|" from the description field and update the description. 
- Remove patternProperties field and instead use additionalProperties.

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

