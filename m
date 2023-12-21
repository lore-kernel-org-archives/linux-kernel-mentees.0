Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04676634FC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 18:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlYMVkiN"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EC91424CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 18:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EC91424CC
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nlYMVkiN
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bCkMAzm6DNgt
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 21 Dec 2023 18:17:01 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8E5F0424B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 18:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E5F0424B3
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d3e84fded7so7741935ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Dec 2023 10:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703182621; x=1703787421; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YkM0jC9/yHAO382d+ILawqQDBhBWk0KZJUHJnBoAQj8=;
        b=nlYMVkiNWplwL67RtHdvY/BpG73L/iR/VlJGNl1Y8MThlPp9aDCVBlxnxrHnesLutP
         Vp4ygEgv1omsnRIG9FkvuhI7XKPu9XWEuYzo7BYZUGxgUhKbX6YlEvF0w3Y4SnLTMAiD
         LuWnDWg6Xzq9Bad0K5fLaXslBoP5KVTevn/cZLdUTm5y7HQa235GxVLyFXD24TxmCUzg
         DdykmtYwtmwKK6XY+wQ1XJake+lld3lSEiOAQCBqFL+KwHAP+byrQw28zSynR1lKCW2/
         KHG83D4BW6PJIOoHkCBAJYyMUZNq/GWh6Cfo68yMucIK6Dw80i7kECiw1T+SCeVmUBlx
         mlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703182621; x=1703787421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkM0jC9/yHAO382d+ILawqQDBhBWk0KZJUHJnBoAQj8=;
        b=Utr9OdHGAD/sVxoz3MhsgxNF2k4cVFpuE2Sg1sX2fAi949Hmewz9/LGbmSxci2DjnU
         7lfhRhJPaCepYtF00zS+pXaN81ez6n8+vCuTBk4m1MPMqZY79wB0KmxvWgTv+fHKwk0B
         T/NuSUcxbXR/PLwJ9MQbOJSwzMqhTl2pdym3tqiBFxjdvnzdFm1ZIgzTdpdDnT/wUynZ
         mrgyWcoMJlUuZ5c0Zp47hMPnWAFwJClt+T7mHv0pV9KAXAI3rnl/acUyvzeh7Z1u2eFn
         E5+YBNxmq9Ki6L8ITcR7ELcGdHclQT6cJH5xWKTIbRz96TwR1GKqROfUNXSe6AaMwqaT
         2/Lg==
X-Gm-Message-State: AOJu0Yx/tZs+R3bI3JIoM/oddvI5cfyCke1d/bG4LGu9WCqf/NiMYjuE
	835kBzAXptzS5t0pcGLR4XM=
X-Google-Smtp-Source: AGHT+IGDgd2VOVIdT8TOMu96tItwZra5gdbxf1n9VZmBNR7FQBm3hI+DsGtXZ54F1fGp1RRi9U/DPw==
X-Received: by 2002:a17:90a:f188:b0:28a:c3e2:3967 with SMTP id bv8-20020a17090af18800b0028ac3e23967mr134583pjb.30.1703182620849;
        Thu, 21 Dec 2023 10:17:00 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:5f28:c37d:9ad0:e7ae:52c2:c31a])
        by smtp.gmail.com with ESMTPSA id lt17-20020a17090b355100b0028b338470a0sm2121454pjb.3.2023.12.21.10.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:17:00 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	Dan Murphy <dmurphy@ti.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v1] dt-bindings: input: convert drv266x to json-schema
Date: Thu, 21 Dec 2023 23:44:22 +0530
Message-ID: <20231221181423.671432-1-anshulusr@gmail.com>
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

