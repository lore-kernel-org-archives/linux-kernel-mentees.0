Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64488D300
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 Nov 2023 07:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5Xv9KxA"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D627442C65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 Nov 2023 07:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D627442C65
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h5Xv9KxA
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t5b0aimpgF4i
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 17 Nov 2023 07:33:28 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C5D1A428C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 Nov 2023 07:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5D1A428C7
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b5714439b3so969517b6e.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 16 Nov 2023 23:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700206408; x=1700811208; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VX/lRKzVRq1yghMKNb5rPnujs/Enhs7H6aGeq5rBrw=;
        b=h5Xv9KxAZS8u/F/vzGvRJtVX7FPsP6ujlcj+G0jnPRWeAAMGVNyS6zEJxDuflQb6mO
         6ROVp9AKxIKA+vXqp0qdkp87zWFLZ1E61b6k8ZAucM9SL02amMY1FwPhV77P/klL+JFc
         7/OzdscvOhCgR0m3E93VH0zr2HdC8Yan3fHJftQLe7yQR7cfet+6IHUCokbTklKlaX03
         9rYLNGPaPsRc3UwbX8v4dXSrQFHiTWuYUNY2jAvuiATz6hThbf8MxFS9d26H5EgjEHaH
         NMvoveO6yLpxwJVNYlm6loLfVS4TmqGxg++c/PjTbj5FQcmv2dO8p/hc8ygZXjmr8nsh
         grEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700206408; x=1700811208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VX/lRKzVRq1yghMKNb5rPnujs/Enhs7H6aGeq5rBrw=;
        b=X6Ko2HpnTen+UCd5ZKlZ+rBI666te3NjqgrgHCjBbSTfWHOoLOA4DZmQjGEihlXr5M
         wapRycS/BQ0t4Y1DpFpNhTIXeQz2XLuzw4eoXhbp7uGL331Hky9bBoLJZm8k4a9O3mFl
         TH+LMGT+dX+co7SzQs79CAFa8J/eEUYIOXDLglWceAxkOI/Puqf8eXFVDhpnoIdlQ3mZ
         V/QCTVA5vlwCAkM07uThIZzs9KEkXUtm0LYMtBNL+ztSxb1825P8qfLZ5biP9N10yR6a
         HP39K1xuf4zVbInBK337wHb5cGozWMYN0zUvTHK1gCPimzKdkFI7qYspFzfd1y4ADic7
         /mWQ==
X-Gm-Message-State: AOJu0YwnfptkvauV80MvKu2fkvxZuf6GJpS/dSCEjYdIvUKqNQBY1dzl
	OGpomEEPl6SlA3C4ALW7lWg=
X-Google-Smtp-Source: AGHT+IH1d9ttlA9rh/z7aa25q9HmmvjaynwuvE/jeCgFbKyiCAepq5WWLYdeMfQuFC22El1MeOlBdA==
X-Received: by 2002:a05:6808:8c:b0:3b2:f393:dab1 with SMTP id s12-20020a056808008c00b003b2f393dab1mr18439295oic.21.1700206407693;
        Thu, 16 Nov 2023 23:33:27 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id s11-20020a65644b000000b005bcebc93d7asm705106pgv.47.2023.11.16.23.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 23:33:27 -0800 (PST)
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
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 1/2] dt-bindings: iio: dac: add MCP4821
Date: Fri, 17 Nov 2023 13:00:37 +0530
Message-ID: <20231117073040.685860-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for MCP48xx series of DACs.

Datasheet:
  [MCP48x1] https://ww1.microchip.com/downloads/en/DeviceDoc/22244B.pdf
  [MCP48x2] https://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---
 .../bindings/iio/dac/microchip,mcp4821.yaml   | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml

diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
new file mode 100644
index 000000000000..904de15300bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
@@ -0,0 +1,63 @@
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
+  Device supports simplex communication over SPI in Mode 0,1 and Mode 1,1.
+
+  +---------+--------------+-------------+
+  | Device  |  Resolution  |   Channels  |
+  |---------|--------------|-------------|
+  | MCP4801 |     8-bit    |      1      |
+  | MCP4811 |    10-bit    |      1      |
+  | MCP4821 |    12-bit    |      1      |
+  | MCP4802 |     8-bit    |      2      |
+  | MCP4812 |    10-bit    |      2      |
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
+properties:
+  compatible:
+    enum:
+      - microchip,mcp4801
+      - microchip,mcp4811
+      - microchip,mcp4821
+      - microchip,mcp4802
+      - microchip,mcp4812
+      - microchip,mcp4822
+
+  reg:
+    maxItems: 1
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
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dac@0 {
+            compatible = "microchip,mcp4821";
+            reg = <0>;
+            vdd-supply = <&vdd_regulator>;
+        };
+    };
-- 
2.42.1

