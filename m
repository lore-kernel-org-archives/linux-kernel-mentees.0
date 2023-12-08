Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A19F4C98
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 07:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuW06GPm"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C761583DAD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 07:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C761583DAD
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TuW06GPm
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pesGBgz6pIG
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  8 Dec 2023 07:52:43 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9F6F783DA0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 07:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F6F783DA0
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cfb30ce241so16303385ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 07 Dec 2023 23:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702021963; x=1702626763; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jnJ6XwvpjbxwbP8d9dhoDJBnR66AamT1l+ZC7uW8glY=;
        b=TuW06GPmieUA8gq7Sj1IEJRBG2xKcC25AxfYESONH2DtmQWGKdM3Y92prN2JP/cuYB
         QcnMlvf27L3kulUY/SlQx+ff1Y6VjhigSG0MZ9OfQurhfrki6H6dIe0hkaGVjwemyFrX
         DOYGVT6IW7tMNABVhcz1Ho6P1tirFFCsiu4V8Lp+qLKYonBRCiIPhqrvQDTTMLMN96Cr
         7qa1m4iKwlPojAUnoYQpNeV6cx50C183M1cyGjj/mVu2CmYVDjJmqwRQJLodaWk2g1qZ
         GI+Jq/B2tUMN9io2+YpJ7Gu+If7PdpRfpf9MaPoR943xcfl6FZJmUpQAW7TMyFxqekug
         CVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702021963; x=1702626763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnJ6XwvpjbxwbP8d9dhoDJBnR66AamT1l+ZC7uW8glY=;
        b=eGDApLZw120NAIq9vQYZiPjBMlt/DDkYtEz4Jz2CfaOpM6y6QBmoMrCFb1oHO/bHoD
         faODj6fRU1VHm2As1ZrSyts/FW3zAC6pK0QxFxrYF2Z9s9FALYbqcM1IWLJWwYfBXmtM
         3R6LcUX6SfVTr3NBUomLPOB8veAfaOfHAjP5u7aGcIn0utx5zQfO/WKTZjRNa1c1pNF9
         mQolZxiQhsbXy02h3Wi1UdKn/Onr5vmUoJMOzvuF5jRrkZBzKrXyHHAhegs6FgsNljCm
         wfJQ/Yved/I/Re2GbBKAl/4EDR8+WrFgftLDpb6g1MJDm0QLPtrqGopTGeTetEO2X2gZ
         nwXQ==
X-Gm-Message-State: AOJu0YwFiiMjdS2vzzDih+GI4YqaHp3sUs/vflhQgZy2ydO7d67JgTCW
	HqTGHwKfP4ZWilgyQ2CuyME=
X-Google-Smtp-Source: AGHT+IF54PYlnGCJpAmNVLe/3ul/Libt8yVj5HcHU8Kmm1Fq4rt1bVUHsYiPTxpmgxZ20YeobsKPJg==
X-Received: by 2002:a17:902:f68d:b0:1d0:977e:29b0 with SMTP id l13-20020a170902f68d00b001d0977e29b0mr4184857plg.49.1702021962887;
        Thu, 07 Dec 2023 23:52:42 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:6277:8af4:45bc:8bc9:c94a:54d2])
        by smtp.gmail.com with ESMTPSA id j3-20020a170902c08300b001bf52834696sm1028228pld.207.2023.12.07.23.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:52:42 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v1] dt-bindings: input: convert gpio-mouse to json-schema
Date: Fri,  8 Dec 2023 13:20:35 +0530
Message-ID: <20231208075037.114598-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert device tree binding documentation for GPIO attached mouse to
json-schema.

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/input/gpio-mouse.txt  | 32 ---------
 .../devicetree/bindings/input/gpio-mouse.yaml | 68 +++++++++++++++++++
 2 files changed, 68 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/gpio-mouse.txt
 create mode 100644 Documentation/devicetree/bindings/input/gpio-mouse.yaml

diff --git a/Documentation/devicetree/bindings/input/gpio-mouse.txt b/Documentation/devicetree/bindings/input/gpio-mouse.txt
deleted file mode 100644
index 519510a11af9..000000000000
--- a/Documentation/devicetree/bindings/input/gpio-mouse.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Device-Tree bindings for GPIO attached mice
-
-This simply uses standard GPIO handles to define a simple mouse connected
-to 5-7 GPIO lines.
-
-Required properties:
-	- compatible: must be "gpio-mouse"
-	- scan-interval-ms: The scanning interval in milliseconds
-	- up-gpios: GPIO line phandle to the line indicating "up"
-	- down-gpios: GPIO line phandle to the line indicating "down"
-	- left-gpios: GPIO line phandle to the line indicating "left"
-	- right-gpios: GPIO line phandle to the line indicating "right"
-
-Optional properties:
-	- button-left-gpios: GPIO line handle to the left mouse button
-	- button-middle-gpios: GPIO line handle to the middle mouse button
-	- button-right-gpios: GPIO line handle to the right mouse button
-Example:
-
-#include <dt-bindings/gpio/gpio.h>
-
-gpio-mouse {
-	compatible = "gpio-mouse";
-	scan-interval-ms = <50>;
-	up-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
-	down-gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
-	left-gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
-	right-gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
-	button-left-gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
-	button-middle-gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
-	button-right-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
-};
diff --git a/Documentation/devicetree/bindings/input/gpio-mouse.yaml b/Documentation/devicetree/bindings/input/gpio-mouse.yaml
new file mode 100644
index 000000000000..3928ec6aff1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/gpio-mouse.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/gpio-mouse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO attached mouse
+
+description: |
+  This simply uses standard GPIO handles to define a simple mouse connected
+  to 5-7 GPIO lines.
+
+maintainers:
+  - Anshul Dalal <anshulusr@gmail.com>
+
+properties:
+  compatible:
+    const: gpio-mouse
+
+  scan-interval-ms:
+    maxItems: 1
+
+  up-gpios:
+    maxItems: 1
+
+  down-gpios:
+    maxItems: 1
+
+  left-gpios:
+    maxItems: 1
+
+  right-gpios:
+    maxItems: 1
+
+  button-left-gpios:
+    maxItems: 1
+
+  button-middle-gpios:
+    maxItems: 1
+
+  button-right-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - scan-interval-ms
+  - up-gpios
+  - down-gpios
+  - left-gpios
+  - right-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    gpio-mouse {
+        compatible = "gpio-mouse";
+        scan-interval-ms = <50>;
+        up-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+        down-gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
+        left-gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
+        right-gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+        button-left-gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
+        button-middle-gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
+        button-right-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
+    };
-- 
2.42.1

