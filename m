Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA66849894
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Dec 2023 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeLlQp2J"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A8F840591
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Dec 2023 16:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A8F840591
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IeLlQp2J
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6V7smEedpkKT
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 18 Dec 2023 16:50:12 +0000 (UTC)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1014240018
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Dec 2023 16:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1014240018
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso2700847a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Dec 2023 08:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702918211; x=1703523011; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IkpQ7ULp2+EbxwsyiU5Y+XH1E1Lrbc8Y3UDZM+Jimvc=;
        b=IeLlQp2Jfe9lPZlXhzQeDJhzi2hzchYW8zIlAg1JGPq8tmCRHM2u0l96rwQ7xMHnQa
         gayB53i8VBoF5jl+Y5LsnsUhuwE+4rHzTkRcTBFi4ki1ab1pseg6FosPuA5DytN1adF8
         TFay7htZ74N5fygn1yVk2w5YWOSmXPveBzcuiP0B48gXK3F7p6e8KL0IpQ55Tbvk5laM
         W/mRjqH8TyZwMKhRyA4jywtnAy2h2KlXv10B5APQRfDUCPafmLP1l2A2hyrqIkEs1wXS
         RC8DjJ7GM5z4IAi7RvzDr0NiAQU+ue8/c9JQdAHOBturgZPvdruoHqo/IfY2ebaYOiPk
         G7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702918211; x=1703523011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkpQ7ULp2+EbxwsyiU5Y+XH1E1Lrbc8Y3UDZM+Jimvc=;
        b=eWC7aCsPMSM3FOY5dPmqRgYQ7LDV+lC++EqzkxxnuXYFfhZUpQJyjWfhGvHxzoJbQT
         RCyIoqwi6KXpzVCZPHxIXkaWZfZuaUa4yTzKmIv+mMbLzVO6To4JI4Zuy2mexeyH1ZIF
         p71sdNeFnyDd3vEbB4LcfsyC4aRPGpbXOeQw+SE8vP+yQtgKdl4UZM8HEXVf0PTEsbkF
         r2SzlY4XuybyVLyAclYJA+titSr01EFvjfjX2yq4TlOXWYTWVDh3cOnVtOhhVBC1zwMH
         OTNbh5eFqa6kttTABJMZA13auJ7GTwKPhHJh4yyQ91lju7gCyMqgWLgPm/e4tZNkdRYh
         B76w==
X-Gm-Message-State: AOJu0YwMzDoUWOj9iWNujKzUnB59IuxBpze5W+ZLfRYxHMNH1K5HbSGO
	eczCea93YBDCCrlStW9y9Po=
X-Google-Smtp-Source: AGHT+IHMlIlqvTS9/uo97eOJqUybjmnws/cIuwBDQoDXwuLLTTvmg2ZCoDIh0+oobhUS99SSrSam1w==
X-Received: by 2002:a05:6a21:199:b0:194:80ca:4e2f with SMTP id le25-20020a056a21019900b0019480ca4e2fmr881752pzb.56.1702918211213;
        Mon, 18 Dec 2023 08:50:11 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:581e:798e:871c:98db:5638:a4])
        by smtp.gmail.com with ESMTPSA id hy9-20020a056a006a0900b006d38dfaab9asm4324933pfb.136.2023.12.18.08.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 08:50:10 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: dac: add MCP4821
Date: Mon, 18 Dec 2023 22:17:33 +0530
Message-ID: <20231218164735.787199-1-anshulusr@gmail.com>
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anshul Dalal <anshulusr@gmail.com>

---

Changes for v3:
- Added gpios for ldac and shutdown pins
- Added spi-cpha and spi-cpol for the SPI mode 0 and 3

Changes for v2:
- Changed order in device table to numerical
- Made vdd_supply required
- Added 'Reviewed-by: Conor Dooley'

Previous versions:
v2: https://lore.kernel.org/lkml/20231217180836.584828-1-anshulusr@gmail.com/
v1: https://lore.kernel.org/lkml/20231117073040.685860-1-anshulusr@gmail.com/
---
 .../bindings/iio/dac/microchip,mcp4821.yaml   | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml

diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
new file mode 100644
index 000000000000..5b1707d974e2
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
+  shdn-gpios:
+    description: |
+      Active Low pin used to enter the shutdown mode.
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
+            shdn-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+            spi-cpha;
+            spi-cpol;
+        };
+    };
-- 
2.43.0

