Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC9F47A53
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Dec 2023 15:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dgi6A/5w"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDD44613C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Dec 2023 15:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDD44613C7
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Dgi6A/5w
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PUJZSusrJ-hu
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 20 Dec 2023 15:22:18 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B8DCE60FEC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Dec 2023 15:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8DCE60FEC
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6d099d316a8so5373972b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Dec 2023 07:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703085738; x=1703690538; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wVUS0vagq67iQauaBSQc4zZaCEUauTKoSrv/n4BLa74=;
        b=Dgi6A/5wBWunMYkI6q4/l776bSVEBGhhF8s3PPqKV1+aNwlyDlWN0Y3S0OdciFAhbI
         9tTvPccSJywk+znWo6Sar98RBGoh/6eL2XwmgVyr/eRjpJ8OYuyxmfJeQeNbwNzcr1if
         9sk9czpd6AZO3+MstVnxHPfo9uQGZI1DinvDaIXChWongxbw9K3CdE2uAA5NoK4oVI+1
         3NIwqS3clku+MyZw1WsJpgqVnIViN0dusG6eJT0ywpXRQyQmREuXXYvwuE4M1pW/XgXE
         Gpo39ipdI6gWCYuQZ5GgubenzrFIgKoek0blTYOAPjkgazIpZ1g4MxoPbFTGsH2SZdRy
         yohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703085738; x=1703690538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVUS0vagq67iQauaBSQc4zZaCEUauTKoSrv/n4BLa74=;
        b=CAUeySKrddZ6MHJotyzmt1zlvBfwnjCrM18v1MZ1RKbdWvxlwDYqWnWsk8IAfLNoyA
         4PJ8cmypgkUpugcAgAZEI1EsrPO1OdCQVfgpT9h8QBu6tnZFJDT4plpUm8PshGP80kG7
         hwaE8By18CWM4xZYwtH454Ndz69kP1SNQHoDnZcvZY7vmLqysnlgHAXOt5VXit0Y8wxG
         wz4oriqA3L5Z9rqLNG8K+UETj3nqRKqAvBCLGgQtlNl+QvFhJePj5wkO3Ex++ZKgXmir
         4eufCwgbzghTiTNsCNQhOB+7HQuFZ/W67EEn/BVAytNtHtn2iUv/NAwnmquNfZbKny1r
         r1kA==
X-Gm-Message-State: AOJu0YzJgY22kZTvxP7EVUDQw98niZN9V4/aPMvKjJT6J0ns8w8PvQKt
	c/EBUSlqWWtfwWeoczKGdy4=
X-Google-Smtp-Source: AGHT+IEZ3fFD8mSwd3o8JMOp9QLhh4IEGyS+W60HQrx5oSozEl3WAPIcgdPwpSM9xrtjl8dA5+Wt3A==
X-Received: by 2002:aa7:9092:0:b0:6d9:3de8:cea with SMTP id i18-20020aa79092000000b006d93de80ceamr2389928pfa.22.1703085737835;
        Wed, 20 Dec 2023 07:22:17 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:581e:798e:871c:98db:5638:a4])
        by smtp.gmail.com with ESMTPSA id 13-20020a63164d000000b005cd835182c5sm7304724pgw.79.2023.12.20.07.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:22:17 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: iio: dac: add MCP4821
Date: Wed, 20 Dec 2023 20:49:52 +0530
Message-ID: <20231220151954.154595-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for MCP48xx series of DACs.

Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/22244B.pdf #MCP48x1
Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf #MCP48x2
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Anshul Dalal <anshulusr@gmail.com>

---

Changes for v5:
- Added 'Reviewed-by: Rob Herring <robh@kernel.org>'

Changes for v4:
- Removed 'Reviewed-by: Conor Dooley' due to changes
- Renamed shdn-gpios to powerdown-gpios to conform to
  gpio-consumer-common.yaml

Changes for v3:
- Added gpios for ldac and shutdown pins
- Added spi-cpha and spi-cpol for the SPI mode 0 and 3

Changes for v2:
- Changed order in device table to numerical
- Made vdd_supply required
- Added 'Reviewed-by: Conor Dooley'

Previous versions:
v4: https://lore.kernel.org/lkml/20231219090252.818754-1-anshulusr@gmail.com/
v3: https://lore.kernel.org/lkml/20231218164735.787199-1-anshulusr@gmail.com/
v2: https://lore.kernel.org/lkml/20231217180836.584828-1-anshulusr@gmail.com/
v1: https://lore.kernel.org/lkml/20231117073040.685860-1-anshulusr@gmail.com/
---
 .../bindings/iio/dac/microchip,mcp4821.yaml   | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml

diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
new file mode 100644
index 000000000000..0dc577c33918
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/dac/microchip,mcp4821.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MCP4821 and similar DACs
+
+description: |
+  Supports MCP48x1 (single channel) and MCP48x2 (dual channel) series of DACs.
+  Device supports simplex communication over SPI in Mode 0 and Mode 3.
+
+  +---------+--------------+-------------+
+  | Device  |  Resolution  |   Channels  |
+  |---------|--------------|-------------|
+  | MCP4801 |     8-bit    |      1      |
+  | MCP4802 |     8-bit    |      2      |
+  | MCP4811 |    10-bit    |      1      |
+  | MCP4812 |    10-bit    |      2      |
+  | MCP4821 |    12-bit    |      1      |
+  | MCP4822 |    12-bit    |      2      |
+  +---------+--------------+-------------+
+
+  Datasheet:
+    MCP48x1: https://ww1.microchip.com/downloads/en/DeviceDoc/22244B.pdf
+    MCP48x2: https://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf
+
+maintainers:
+  - Anshul Dalal <anshulusr@gmail.com>
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - microchip,mcp4801
+      - microchip,mcp4802
+      - microchip,mcp4811
+      - microchip,mcp4812
+      - microchip,mcp4821
+      - microchip,mcp4822
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  ldac-gpios:
+    description: |
+      Active Low LDAC (Latch DAC Input) pin used to update the DAC output.
+    maxItems: 1
+
+  powerdown-gpios:
+    description: |
+      Active Low SHDN pin used to enter the shutdown mode.
+    maxItems: 1
+
+  spi-cpha: true
+  spi-cpol: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dac@0 {
+            compatible = "microchip,mcp4821";
+            reg = <0>;
+            vdd-supply = <&vdd_regulator>;
+            ldac-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+            powerdown-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+            spi-cpha;
+            spi-cpol;
+        };
+    };
-- 
2.43.0

