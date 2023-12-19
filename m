Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA6512B92
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Dec 2023 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqhoefpU"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86A5940917
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Dec 2023 09:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86A5940917
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hqhoefpU
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PAI_xbqrnBbc
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 19 Dec 2023 09:05:23 +0000 (UTC)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 49E8240579
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Dec 2023 09:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49E8240579
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-28b82dc11e6so942265a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Dec 2023 01:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702976722; x=1703581522; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WNy5WamLV4+pReBU2afVcdS0VJmrLwZ/s8baVj2zs4o=;
        b=hqhoefpUqGmfbmW4WiC4grgH80CNiKOPs5Mm8UFHb71xYvTQCtNJ18dj3vetEfIX/x
         bTDUe0NdKZoiO/m/esDpQ44p7nyIijtF1ClvOievDi6hpBDUXXNPYhPbAHOg8tMY+fFE
         c7KRCMadqeFPf525JN97uW4SZRW6ZkaSPpmh22m0BNX3NbTvElsfhUzohymoDhCe1/eJ
         vdCKgRwreDHsvUUscb0kcZSFLPi/k8BvCeXu8Gwy7RiFR7BCdCp1AHqx6uX4plyXvP7a
         3gUM8ciUG9cv4mUnmR/jzqpNkEWYc4nmv0saxhf8RdEEnoQuHB5m6PgBrIM+P59VmImO
         dZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702976722; x=1703581522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WNy5WamLV4+pReBU2afVcdS0VJmrLwZ/s8baVj2zs4o=;
        b=umiXC1vzcUaLEGb1nh29oMVOtvbqcC1TKZi1CV9hTg1unVmijVqfvUor2/3K/A+Jwu
         AIxUjiHTTpa4Zp0nTeYvHzsuwoYQm9c63WfBU/x6PxuLqu/4Dk2rrlCrBzqfaCNuqrAy
         kDd6MCCuym/OPodvBU14hRC5g8VZ/B1267Uf4vpZ/1RDNg3XtDNBK0obXqSfwifYOCrd
         4tD0je2UMK+7MwbRO0YDgUj4RyCf7Oz1NnMO4EoA8AKdzhfqNcI+jD0ccdOHCH8gDqWA
         oj72ccbeEbB/dalHf9PCtMRtwTot1kMw/vZpDhjhQJtBGfTMIVMQgymQ1k6iky8qY4gu
         FTjw==
X-Gm-Message-State: AOJu0YxuS7A3LPu4208nnrb+rHBhObRPyvOPHqo2uqmAAqIsjWoVQq6h
	bfFaToz1hl5LmFdIY/VMlIs=
X-Google-Smtp-Source: AGHT+IEMK6Hy9dqCjKeNExgiUXdY/93jSMI8a4xxZS/JTwjBR1rPlOkm8F3+WVrMx4LfRCM0M9eYLw==
X-Received: by 2002:a17:90a:702:b0:286:db1e:f8fc with SMTP id l2-20020a17090a070200b00286db1ef8fcmr7960776pjl.92.1702976722577;
        Tue, 19 Dec 2023 01:05:22 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:581e:798e:871c:98db:5638:a4])
        by smtp.gmail.com with ESMTPSA id f4-20020a17090aec8400b0028bbd9872d5sm806776pjy.12.2023.12.19.01.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 01:05:22 -0800 (PST)
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
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v4 1/2] dt-bindings: iio: dac: add MCP4821
Date: Tue, 19 Dec 2023 14:32:50 +0530
Message-ID: <20231219090252.818754-1-anshulusr@gmail.com>
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
Signed-off-by: Anshul Dalal <anshulusr@gmail.com>

---

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

