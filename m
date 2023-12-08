Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10FB14F61
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEX71g4C"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E6BC41F6D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 10:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E6BC41F6D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SEX71g4C
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lXK-7Ra7IYnU
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  8 Dec 2023 10:24:25 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5963041E66
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 10:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5963041E66
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d06d42a58aso17415765ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 08 Dec 2023 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702031065; x=1702635865; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh6Ho7FMXEpXQf4LtvO8/eRoMKW6RHIURVqHusV8P5Y=;
        b=SEX71g4CCmWVRA5QnTBfdgJVL+KOTW/2YRe3bhT1eSIDgaVPjN6Uf0FdYVKAcbyneU
         4zJXrPS1lGkylmMRhdc8MMssXJs4etlinLh69pi6j8+ap2jf8kzuAzxuzoJ/ETiaul+z
         hBRhmA8IRg+/1lLTzDsAeT0bPPWRE4U6KYLNgwoZrg31NTYUQncVYNJt2PUK/vr2CwMv
         DytmV48hovit36/gv/8FTryVjbxsYc+vbSQVZlVCoTWsSREiTJpZATWjUdfGtCjcfB3g
         ButtV32QbapihcYKK6ThHmx32FzC3TeYaXt5+8/MeT9UUdchkZGpDmo/vOkeH75MpGe2
         2Gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702031065; x=1702635865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qh6Ho7FMXEpXQf4LtvO8/eRoMKW6RHIURVqHusV8P5Y=;
        b=ZEMzHeRNfk9/kjJG5bmwkZfOFQVFrA9LTDSNu5r1s/QfNT8RLvaQu2xNhILKc0K1nr
         j//2lbV8ldZR+zvhdOxfRQPJ2yDeDM4jIPtciZblxTw7HnbzAr66Z86iPOyVu2Zy+iIH
         03J3j2VFxz8wuBwm+1NdjF7A0GxNP9//wnoqmOY0YOKJpkHg1KywUEkv2jOCuE8nkJ57
         +K4q5p6/bjSbLeObhbsl6MVo5Sq3fgJH++Iv6nWIWy1FLaweUuEyztcmP0nl2zh60Npl
         020bWiGnqt9as/0vCf5XwFdMuRyZJRioyFayZPWs47AZwLu4VXb/2b7HDqsD2GLZYyx2
         ScFg==
X-Gm-Message-State: AOJu0Yyh2q+AXAncMtyUXbXJXA0ewMIvghzglTZVsWOclEQ70htpF/Ci
	lJjeuaxqbaKx+aEvI7g5zNk=
X-Google-Smtp-Source: AGHT+IFDRt620D36MLt/MRylsEHRaxp0S3JiiobHb5xw1MMVDzvHvtCz+7Jc58Sa7fyDaqtFeSWMaA==
X-Received: by 2002:a17:902:c950:b0:1d0:af28:4603 with SMTP id i16-20020a170902c95000b001d0af284603mr4862870pla.32.1702031064618;
        Fri, 08 Dec 2023 02:24:24 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:6277:8af4:45bc:8bc9:c94a:54d2])
        by smtp.gmail.com with ESMTPSA id g13-20020a170902d5cd00b001d1d6f6b67dsm1337033plh.147.2023.12.08.02.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:24:24 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: iio: light: add ltr390
Date: Fri,  8 Dec 2023 15:52:09 +0530
Message-ID: <20231208102211.413019-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for Lite-On LTR390 which is an Ambient/UV light sensor that
communicates over i2c with an address of 0x53.

Datasheet: https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-390UV_Final_%20DS_V1%201.pdf
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---

Changes for v3:
- no updates

Changes for v2:
- Added missing properties in the example

Previous versions:
v2: https://lore.kernel.org/lkml/20231117074554.700970-1-anshulusr@gmail.com/
v1: https://lore.kernel.org/lkml/20231109090456.814230-1-anshulusr@gmail.com/
---
 .../bindings/iio/light/liteon,ltr390.yaml     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
new file mode 100644
index 000000000000..5d98ef2af74d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/light/liteon,ltr390.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lite-On LTR390 ALS and UV Sensor
+
+description: |
+  The Lite-On LTR390 is an ALS (Ambient Light Sensor) and a UV sensor in a
+  single package with i2c address of 0x53.
+
+  Datasheet:
+    https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-390UV_Final_%20DS_V1%201.pdf
+
+maintainers:
+  - Anshul Dalal <anshulusr@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - liteon,ltr390
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: |
+      Level interrupt pin with open drain output.
+      The sensor pulls this pin low when the measured reading is greater than
+      some configured threshold.
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        light-sensor@53 {
+            compatible = "liteon,ltr390";
+            reg = <0x53>;
+            interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+            vdd-supply = <&vdd_regulator>;
+        };
+    };
-- 
2.42.1

