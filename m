Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B5DBA5F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 18:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqIu//yc"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D817C43819
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 18:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D817C43819
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JqIu//yc
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gzGc8xyLOiaJ
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 21 Dec 2023 18:33:51 +0000 (UTC)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 871A840480
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 18:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 871A840480
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so847343a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 10:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703183631; x=1703788431; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YkM0jC9/yHAO382d+ILawqQDBhBWk0KZJUHJnBoAQj8=;
        b=JqIu//ycLo79AEXzts9xLtEkfNEBFHXe8LGxXW0MoF1WyJ3DMi7ixsAllpgtS0yAX2
         RC0PByjNupBhwqj8wj4qLlvl8dz5/CqwTjAF4aIwkUKFljqSAecbL4yZ4AiIfS42jT8E
         DSBdrANaCRL2tFf2WudZp9zX9vX/fLpRXjawk8cHU9GS0PgMU3Rd/GLbbgi/wVDfewSI
         fJLfR6wDzV7jdIBNFe7n6fJ9be6lLRXSOPruj0GE74JnfnV7OKnKKBfXwXY/trSlj1ja
         6Y7EvnhSnBEgtyyRd7+1QkwjXD7R4NesOj/PJjEiGiswZJCYJvcPsYPNvASWWBubHITH
         xAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703183631; x=1703788431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkM0jC9/yHAO382d+ILawqQDBhBWk0KZJUHJnBoAQj8=;
        b=LTp12z7duJeZb9Qb+/aax7ePR45dR7JZl2bBiu2Gi5MQjtMIYhG4cyzEsXWzhzq7zO
         OYvWcJGiqzC+ZVBcuo/EDSDC2rfwp+FSoLBj3318afCV8sGc6ais6buVCwncQi1ZQf+v
         RE3pQIBvFdg/w377Os41MMuLK5fZNUdxiKibhKLJzLQ/zcSdOOwvvWBBVFMoJOnqtKPY
         453OrSACtmv6exTPiZosOD7Rvt6zwIuzyUFf6FR20pHpkX1ddxUGr11Ubo2frZqFKc8c
         a+XvS19AL+KOvKTldz77ky1e3qsuuQ/8gWa9JvCo2z4uW2A0w/SyzVJllI2Gi90xeQEr
         pJTQ==
X-Gm-Message-State: AOJu0YzunmLX3/EOKAqEZSrECj/lzhwyDj+tKoRotBEx3jvYGNNAlz5/
	HViXoOrHfxbLnCE64bxlpBA=
X-Google-Smtp-Source: AGHT+IHebS7pSf/c5UzumBrqxQMXdQsW1Z2LHz1hJZPTMqTvpsA5neH2P+pyHDHWYXbXY1GDik9frg==
X-Received: by 2002:a05:6a20:a10a:b0:191:6028:c6cc with SMTP id q10-20020a056a20a10a00b001916028c6ccmr133280pzk.96.1703183630744;
        Thu, 21 Dec 2023 10:33:50 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:5f28:c37d:9ad0:e7ae:52c2:c31a])
        by smtp.gmail.com with ESMTPSA id u26-20020a63235a000000b005c2420fb198sm1926978pgm.37.2023.12.21.10.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:33:49 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v1] dt-bindings: input: convert drv266x to json-schema
Date: Fri, 22 Dec 2023 00:01:08 +0530
Message-ID: <20231221183109.684325-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert devicetree binding documentation for ti drv2665 and drv2667
haptics driver to json-schema. The previously two separate bindings have
been merged into a single drv266x.yaml.

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---
 .../devicetree/bindings/input/ti,drv2665.txt  | 17 -------
 .../devicetree/bindings/input/ti,drv2667.txt  | 17 -------
 .../devicetree/bindings/input/ti,drv266x.yaml | 50 +++++++++++++++++++
 3 files changed, 50 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/ti,drv2665.txt
 delete mode 100644 Documentation/devicetree/bindings/input/ti,drv2667.txt
 create mode 100644 Documentation/devicetree/bindings/input/ti,drv266x.yaml

diff --git a/Documentation/devicetree/bindings/input/ti,drv2665.txt b/Documentation/devicetree/bindings/input/ti,drv2665.txt
deleted file mode 100644
index 1ba97ac04305..000000000000
--- a/Documentation/devicetree/bindings/input/ti,drv2665.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Texas Instruments - drv2665 Haptics driver
-
-Required properties:
-	- compatible - "ti,drv2665" - DRV2665
-	- reg -  I2C slave address
-	- vbat-supply - Required supply regulator
-
-Example:
-
-haptics: haptics@59 {
-	compatible = "ti,drv2665";
-	reg = <0x59>;
-	vbat-supply = <&vbat>;
-};
-
-For more product information please see the link below:
-http://www.ti.com/product/drv2665
diff --git a/Documentation/devicetree/bindings/input/ti,drv2667.txt b/Documentation/devicetree/bindings/input/ti,drv2667.txt
deleted file mode 100644
index 996382cf994a..000000000000
--- a/Documentation/devicetree/bindings/input/ti,drv2667.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Texas Instruments - drv2667 Haptics driver
-
-Required properties:
-	- compatible - "ti,drv2667" - DRV2667
-	- reg -  I2C slave address
-	- vbat-supply - Required supply regulator
-
-Example:
-
-haptics: haptics@59 {
-	compatible = "ti,drv2667";
-	reg = <0x59>;
-	vbat-supply = <&vbat>;
-};
-
-For more product information please see the link below:
-http://www.ti.com/product/drv2667
diff --git a/Documentation/devicetree/bindings/input/ti,drv266x.yaml b/Documentation/devicetree/bindings/input/ti,drv266x.yaml
new file mode 100644
index 000000000000..da1818824373
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ti,drv266x.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/ti,drv266x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments - drv266x Haptics driver
+
+description: |
+  Product Page:
+    http://www.ti.com/product/drv2665
+    http://www.ti.com/product/drv2667
+
+maintainers:
+  - Anshul Dalal <anshulusr@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,drv2665
+      - ti,drv2667
+
+  reg:
+    maxItems: 1
+
+  vbat-supply:
+    description: Required supply regulator
+
+required:
+  - compatible
+  - reg
+  - vbat-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        haptics@59 {
+            compatible = "ti,drv2667";
+            reg = <0x59>;
+            vbat-supply = <&vbat>;
+        };
+    };
-- 
2.43.0

