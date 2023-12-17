Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C7647F57
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Dec 2023 18:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T09MyNun"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0BAC81991
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Dec 2023 18:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0BAC81991
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T09MyNun
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMRBz477s7Kh
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 17 Dec 2023 18:11:09 +0000 (UTC)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 956DD817EB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Dec 2023 18:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 956DD817EB
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3ba10647a19so1922699b6e.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Dec 2023 10:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702836668; x=1703441468; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WKKLVdjbJtf3sQ1BSlJm02odVYdtxAJaGyP069MKh0M=;
        b=T09MyNunRHaz27GXBnApntOKxqOoHjDI6UhYTlUrH3cTgQjfoS3b4ACK8+fSPs/v0O
         vOHAqr+25Mlf1V3B+kD+9PlVFM/RRdaBQilCI4spS/yLK0sqm60xb9nQnjudNo6SHkgF
         CNmXRW17dxmXis4Jusq9EJO0jZWTdQIaTZ5vSvYJ49NnSc+pLVknr225GaA2HXuv/V8/
         IFB9P4klJgUXZ5CLV06dF99XAZXii6iGxYjTiw39Jw38l7G2GPNQm3KoMj+iZL+mQtgn
         hPOhIfjmEH9SooovINWc9Z80xR978k6gqcJyQpug8fI+ntzBApS4FKSF8EOcIR0yxesc
         UOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702836668; x=1703441468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKKLVdjbJtf3sQ1BSlJm02odVYdtxAJaGyP069MKh0M=;
        b=ojx2GcaVZ5szkvxxkOEdSA17W8FWadn4I19TRfzaAOlFAx0zDh3APl4kgKcU8qgFGw
         /Q/48FzBhICfvIpJ6ZJb+WwPAT4WlKV0G3AVC70s+pyar9YKTEsPhMC8Z31/Cq3df5wR
         aL8pmV/6M42q3yJUxX5jo5+eqNwi9kHYNtvksDcWTWbPc01jTxCr54GhPdAL7a1PnGqI
         S0x4+KsT1JGHo5akBgbBZdlF+YVf9xEz50/BlJf6Y4t72DveRHmHZWNrIRqVybVkg8Qb
         MKV1RLXRO1Q8p7/u8tLoNlNjCjbFtibYgSpMqbUUOMES1ZwwD5rnkFQCtZglSAe6KRx3
         Wu4w==
X-Gm-Message-State: AOJu0YxXNsvia6cYkXVAQL6dofRTp5iO9O7SMvUHLm0lzuCWj7st0jON
	NlLsKakX8Mrv9ZPqDAjP8RI=
X-Google-Smtp-Source: AGHT+IGHeqDf3X7JsCZYd7wwSmT66FvjOXVf5TUGRmXNe28TjZl7jB0syB6a/79DCmRSIAFZ6eRx5A==
X-Received: by 2002:a05:6808:13c3:b0:3b9:fc7c:b57d with SMTP id d3-20020a05680813c300b003b9fc7cb57dmr18542453oiw.35.1702836668530;
        Sun, 17 Dec 2023 10:11:08 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:581e:798e:871c:98db:5638:a4])
        by smtp.gmail.com with ESMTPSA id d18-20020aa78692000000b006bdd7cbcf98sm16761286pfo.182.2023.12.17.10.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 10:11:08 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: iio: dac: add MCP4821
Date: Sun, 17 Dec 2023 23:38:33 +0530
Message-ID: <20231217180836.584828-1-anshulusr@gmail.com>
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

Changes for v2:
- Changed order in device table to numerical
- Made vdd_supply required
- Added 'Reviewed-by: Conor Dooley'

Previous versions:
v1: https://lore.kernel.org/lkml/20231117073040.685860-1-anshulusr@gmail.com/
---
 .../bindings/iio/dac/microchip,mcp4821.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml

diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
new file mode 100644
index 000000000000..97da9f9ef450
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
@@ -0,0 +1,64 @@
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
+required:
+  - compatible
+  - reg
+  - vdd-supply
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
2.43.0

