Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549CF3D71
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KePo2YHs"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F9A3403EC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 10:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F9A3403EC
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KePo2YHs
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PK7MiOyej49o
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 26 Nov 2023 10:32:25 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 818C640384
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 10:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 818C640384
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ccc9e6a38aso672193b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 02:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700994745; x=1701599545; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYYLfoXXiYjdK9YQOq39bQN3tBvwmAisCa8zX9rA7UU=;
        b=KePo2YHskH8s7ROERrLEwKaPEwJfnErxaYIBR5Og3OuFqprpoeDLUQQhwAAnZEKqVD
         kd/rueQlT9N2t2ERp4NoGyAmNsM6s2uxyXMAWAQI16NJ/n5VL1CN3HBC6t/z0wVLiYND
         UT0fif4BAQVLmrlzzVwXvGylVjA3FIPycDsKGUrcNW2cTcbhF/QSvs4BdhalcgGEgYdN
         wojFxCKz1EUojddWyMz3x+YU139zqIVCt3gLK+Aof/BBLqjR/pMYBEHok9Y4HhSsB/k5
         I14s48gJQt0dum7XSgx9/6RFOaoVCOw7VVEalu9i8y+kDsLjw6mcdNSTbAz09IvTPAV3
         Zmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700994745; x=1701599545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYYLfoXXiYjdK9YQOq39bQN3tBvwmAisCa8zX9rA7UU=;
        b=Cy4V01/vCElg+WJn2epfqJndiDMIXHZz5U+1y7CcMlmJLbv+khuZqhnBY2CyXGnJ2L
         tbEFCSHLYLPDpJIs9clgZIF3b/2ajKgh9YBVLKEU2omHZVvvhVFPUSydn9jsFaNMNfT9
         qfq7CU0RmUqrDwCZTKNaXszJoKvsPYHTtkuksyAVQYkVvcirf3G8DCAy+u/2Whf1GCAZ
         +HZYCmcJBf9BZDo3bz1yCeu5uuq2ZulbTL+3T/lyeMdMqNIV3P8ddUuBKGMBmJ/FR86j
         lr5uZ7mjPi/I5wFSe25XF7MkPtsYPWPXc9Y0qfJWkgv9gY5tULMaGn1jAsBoZvuSfb9X
         SYqg==
X-Gm-Message-State: AOJu0Yyb4xNRAZzhuf9P0CuNqz53Eto5YBB+h9ou/NjVG3/6jfESEU3B
	bvFAhJWvWdkjD7orW+dg8go=
X-Google-Smtp-Source: AGHT+IE67x1qv6fGGSUzhs++tms/1fww89kbm04xEbpSjMTejEHRsUZPzg8lZ6XcRVFEs4+Ywnjwjw==
X-Received: by 2002:a05:6a20:3ca5:b0:18b:3158:4231 with SMTP id b37-20020a056a203ca500b0018b31584231mr12621747pzj.16.1700994744663;
        Sun, 26 Nov 2023 02:32:24 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id s10-20020a17090aba0a00b002858612349asm3931188pjr.38.2023.11.26.02.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 02:32:24 -0800 (PST)
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
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v1] dt-bindings: input: convert gpio-mouse to json-schema
Date: Sun, 26 Nov 2023 16:00:28 +0530
Message-ID: <20231126103029.851742-1-anshulusr@gmail.com>
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

