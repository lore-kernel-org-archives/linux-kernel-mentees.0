Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB783ACA75
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  7 Jun 2026 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780842381; cv=none; b=VMtzvAOWj0QhBJXwkHRqlmLUDD5uldbb7d1bkWBqDquB+sitBlWHba+xs9NfEXRZLAsOd6TPD+qZfwH2IMbpO+tZ0xQ4FE8YuKporT533eg8peSu1F5+mNxBjGyXPHmcaZ7qEp+/p5NhF2uitcKMSDCnxFmWHE9a4cphNYb7vbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780842381; c=relaxed/simple;
	bh=aWO7lo1VCrxp4e0OOIe05AV388/XhAQ16o4vhBjJze4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rx+2tmldioovFki85RyFQZBWfU9qfXusVKyZf7ObzNeQBRVTZVbqTtTxh1TV63nBWod5Kexyt30cWS980XH85GBRew7RWu7mmKXjIucbFGCBEHKpCW75utkax3nFtfmzthiV659R2sda9sn+Kq3ouAgfjithnr8UZaCTkF8DQEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIpoWACt; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIpoWACt"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-842358aaf36so1235904b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 07 Jun 2026 07:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780842379; x=1781447179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TOt3pIWozTfZwLeJQGzymVybkj+66+ALwgUGSnDgoQ4=;
        b=oIpoWACttLyP0U7LNm0JJwic+NdeGXtxpbP5nazyNtYVGoI9Qk9oSMnAc1L/4qyZmi
         ouw7dsvcBmRU7yj/diAXYLEEmVCTCteP6Jcx1FWKDDsAopAiHB3zHjk3o6C1HOxwxxD0
         mQ6RbDZWK03sOq72YjC05LAs8TEmxIWGU9uekLS+r9TBLlLG7hTWjMfulvjdP+9uNcWr
         LMiJFdqgtvrZzDj4LdVL29M3X4xseIKI5pGcI1VYb6syR/bklBPhrJIBj035OwZ78u3f
         1tpP0tujwxy1gNYaamaV2LffrGPlvP+3t7IdmZvEv5m+7OL4sVYFCLuewOuKNcFN9jHy
         POPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780842379; x=1781447179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOt3pIWozTfZwLeJQGzymVybkj+66+ALwgUGSnDgoQ4=;
        b=r7HZ/N1OOS8tEoxg1ZokEsdRkoad+XaRXmZflZQR7ClpV38dLiJxXsKmrWQO8AFo5q
         0N5oFUr4orvSKgpcatFWmFljn+aldUs7g31LPE/BBaE4V2oxV2AnIWY11PoynGhWB3fm
         K/TMYlMs9msC98TYu9noHprK6zboxnlSbRbwrCkC1COHkBzIcfQ7VcHIdSTCCJWmcKdj
         +wMk+YSkbhioEXbRCj3Vtf/2j61VvbqRvCLbElnjRqHE5oEHbA0WjPuUU42YMs79QvWw
         ++ThcDovivTVhiPXmlm62hrz9NHz4kwbuyGK4yDVR6qMIQvk/aCCIz8XQGdq6gneD9YV
         sCZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cQrP/0vZkiBjXjgH6b33q1iqZJp9bKhbEMMnmplS5UQ54IbUAEjowwzpvDu7gNJTHB1RZFJlI3dwcSvLGTQLDEzM8Kw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPXP/U/Iqg3pN3nvZkZOvtu3aDkxRvJpU0y7chCYH1/AvFQHdM
	zg9pD3U6TxLLsOAAW3abIVDHjqsuw8xiAHn12zy17EcM1srv9mdlAIrh
X-Gm-Gg: Acq92OGjFrpTZl8S0ZmbZUWR//SZh6oy3g40NyCLqbGqNXUfasJUzNh7MzjihMEem6n
	kiQ+qKxVe/sr2WHZi4nAZqQVgIF+CcNhnCIt0+JeGgQ9no5ebr7zke77em1ko58Zl/mBulilq3i
	fYISbsYLnctlbDhSNwuOqhL8IK06a59muTF79kne9TgJ3F2dxDNkHxpfGk8wG4YRwbfMMlyNtjX
	/C9t1OTYuJCRo8a13e01uLIwFIJiQJrp1ZH4qMgcqqwV2w4VTUUxGTxfgIi/Dask4r9psp5BDKw
	kDt69ImS52F3AiDETVXbaeUHVq/dLbXdF6ZHlCH0Lo3D4dZ1NaA2WZlg327Yd14OzM41QEjbyj1
	SlCr0jr+tBaCNRpoClwS93h4xPQKMTbnRtClMV9A4cJezodaO8Agt7NUbIQ/O4H8cNjKx1DXxu6
	24HXKtZQF4O5pUVCszVb9LUPaIi6kvgsfm1PAQZPFZhpcXkYCL2BiqgkAO1fdtSKTd4Hp2Rv2UC
	QCiNYaIcbyin5JtKwY=
X-Received: by 2002:a05:6a00:1304:b0:82f:2b0:2809 with SMTP id d2e1a72fcca58-842b0e11ae4mr12010052b3a.1.1780842379421;
        Sun, 07 Jun 2026 07:26:19 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828cb2bdsm15421214b3a.41.2026.06.07.07.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 07:26:19 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] spi: dt-bindings: octeon: Convert to DT schema
Date: Sun,  7 Jun 2026 19:53:56 +0530
Message-ID: <20260607142356.2844008-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert octeon-3010 to DT schema

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 .../bindings/spi/cavium,octeon-3010-spi.yaml  | 67 +++++++++++++++++++
 .../devicetree/bindings/spi/spi-octeon.txt    | 33 ---------
 2 files changed, 67 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-octeon.txt

diff --git a/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml b/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
new file mode 100644
index 000000000000..3dbbb4f3c104
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/cavium,octeon-3010-spi.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/cavium,octeon-3010-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cavium, Inc. OCTEON SoC SPI master controller
+
+description:
+  The Cavium OCTEON SPI controller is an SPI master controller found in
+  OCTEON SoCs.
+
+maintainers:
+  - Mark Brown <broonie@kernel.org>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: cavium,octeon-3010-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    / {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        intc: interrupt-controller {
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+
+        spi@1070000001000 {
+            compatible = "cavium,octeon-3010-spi";
+            reg = <0x10700 0x00001000 0x0 0x100>;
+            interrupt-parent = <&intc>;
+            interrupts = <0 58>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eeprom@0 {
+                compatible = "st,m95256", "atmel,at25";
+                reg = <0>;
+                spi-max-frequency = <5000000>;
+                spi-cpha;
+                spi-cpol;
+                pagesize = <64>;
+                size = <32768>;
+                address-width = <16>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/spi/spi-octeon.txt b/Documentation/devicetree/bindings/spi/spi-octeon.txt
deleted file mode 100644
index 431add192342..000000000000
--- a/Documentation/devicetree/bindings/spi/spi-octeon.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Cavium, Inc. OCTEON SOC SPI master controller.
-
-Required properties:
-- compatible : "cavium,octeon-3010-spi"
-- reg : The register base for the controller.
-- interrupts : One interrupt, used by the controller.
-- #address-cells : <1>, as required by generic SPI binding.
-- #size-cells : <0>, also as required by generic SPI binding.
-
-Child nodes as per the generic SPI binding.
-
-Example:
-
-	spi@1070000001000 {
-		compatible = "cavium,octeon-3010-spi";
-		reg = <0x10700 0x00001000 0x0 0x100>;
-		interrupts = <0 58>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		eeprom@0 {
-			compatible = "st,m95256", "atmel,at25";
-			reg = <0>;
-			spi-max-frequency = <5000000>;
-			spi-cpha;
-			spi-cpol;
-
-			pagesize = <64>;
-			size = <32768>;
-			address-width = <16>;
-		};
-	};
-
-- 
2.54.0

