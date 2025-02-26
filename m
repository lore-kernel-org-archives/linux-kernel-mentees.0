Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC05155C83
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Feb 2025 01:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740532208; cv=none; b=sWrKHQRIgVBvNOMA/q0iFivRnb+8sMigq3fowFQVBh4f/xfWda2nFroqEa940Oy4tDvxj05N/i/aBz0oKV0yTkKHS2fr/qV87Fz/PuxKkWiLV4jY99EYIMOpV19WpPWGKEV++VFmNlyYDVnB9gvEVArkov5bBr+dH54Pmdx1yOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740532208; c=relaxed/simple;
	bh=J1ZAkl3ozYgniAVeeGm/DR4x+8Ypqttwvfp9sj5URr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H/QRMErsKOYmz/2MZDseC/ujHsRYZfVTT1B9VbOw1qL/pvyn6rDace7n0v1IsBR0bD2Jqt/RBjL2jBp3DjQnENs28RUMpnJs/KCVtAV+SdVD98zCmzIC2Sno9acZOoq/fhSGm1OMAR8HNMo2bdmMhpD+My5eBxDEsrF0IEQomSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7CJljDB; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7CJljDB"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 494AF40AF7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Feb 2025 01:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWg70alVP6qH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Feb 2025 01:10:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=leo.fthirata@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36784405A5
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36784405A5
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P7CJljDB
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 36784405A5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Feb 2025 01:10:04 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-220ecbdb4c2so59319815ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Feb 2025 17:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740532203; x=1741137003; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WiEgyM16960NSDV6t1+D1FR+8qHkFg4gFUmoJjgyErM=;
        b=P7CJljDB4hJlDLGOg1Et3EdP5nlLrBEKXiPt0EgqSsuoT0Gf35K9mY8eo/umf7dJF8
         EmjNKrpUMagdH57PwxcT5tHnzRHmpMQJKcRXP5txgpl8rrroEKsWGBjJA+8HTEueg4lS
         HcBbwVuxcivDD98HLObq0k0jni0f7E9W4zudkmBnQEMM/uUmU8vzZC8ovTEyFjt0mCkW
         SWhwBrXXPeOGOKWVD0bzE48Q1S4reG9924t+j5GRx16aHYw1JS+8vHxhum24hggcJ/xm
         n/mzE9NSBEAMeKZFZaG1cVJpYJSRgGrg9nfda7+b7L6BTI77KEkHIw426cGTyc5kF/tY
         0zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740532203; x=1741137003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiEgyM16960NSDV6t1+D1FR+8qHkFg4gFUmoJjgyErM=;
        b=OQiJi/y8zHml4PtD8zzeA3z6nOOaFOg9b0CRsxB2q2HHs/HbY3i+rstURwd/sRADMf
         4PZ1KYXgUn2BcXuCWCPMn51OPuQE/VnYu3u+f6pYDII/HOphiYmgVeoqPlNONn1XAf/c
         t4DcUOZSqJCNr3t8a828BDmw/vCEwjJor408I+fOVVFGo5D/Yv6NYP+6FMBcxpS8u99a
         BpdrXPUbnHFrLesTOotjum15i+UvIKT8W8ZtSYCgjLddwyv5LQUHB4G3iDP1Nk4aPXlL
         dOXN92o0CUeLDG9A4iEWxq5JpACKwt+Bk+Rh6jdik+i/Ev+CP2NOem7s6t41ezPqmjnd
         X77g==
X-Forwarded-Encrypted: i=1; AJvYcCUAaIt0tf7Kz5UHa2L5yCQUX9HH+bQlB0WAJGzUWL3F7ICne1EHmrf13cSGDTebe5iFRm1xp/SLF5EWFjF9plYTYQk3hw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx+cLE6TN9wbkZXItylevinHL8gIwhkjzQ+SltePya/l9sqThDt
	+OInH4ojuGK8qkc+btrzmLA22G22mQU9I7AoEXnaTmj+e6e4r9CJ
X-Gm-Gg: ASbGnctP3xMKyBdKiecr8zAFM1MN3PgrfSo8ARwURai50yVJJTKhSslaCJBhDxrYDVp
	J+tRQ3n4jk9uzIK4kNPUilc/P+vy8vFhQUZVDWLg8dkHFiMXfQrTGB8XoTn9v4Ul21hBKnsUQLU
	91K6gsEt0eNEPJqOX207mbb+7fBdk6t/ao19Hziyc99HInXI/HCWYdZfaG45aWPgAjVuCH7mx3O
	z2D6V34BHcL6s29w92hIIKYcpLpJ6C0xGtmRRePysbU5s1nS1BN1ca6aGT9C9ZrquUfKnhQZhd5
	RkdDxCEhcg0ZRFnqJQC7nYM=
X-Google-Smtp-Source: AGHT+IEAIlHRnph+kEm0eZjJMotG6sxrxwDis5EVo+KPSHhWr29FBTWOWu09c8pE742ej1Laf9rDaQ==
X-Received: by 2002:a05:6a00:4f88:b0:72a:8bb6:2963 with SMTP id d2e1a72fcca58-73426cf11e7mr27498782b3a.13.1740532203140;
        Tue, 25 Feb 2025 17:10:03 -0800 (PST)
Received: from dev.. ([2804:14d:887:95a9:e1a5:e9d5:ba9a:df82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a839dffsm2271324b3a.172.2025.02.25.17.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 17:10:02 -0800 (PST)
From: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vz@mleia.com
Cc: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] dt-bindings: interrupt-controller: Convert nxp,lpc3220-mic.txt to yaml format
Date: Tue, 25 Feb 2025 22:09:40 -0300
Message-ID: <20250226010956.50566-1-leo.fthirata@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert NXP LPC3220-MIC to DT schema.

Signed-off-by: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
---
Changes in v2:
 - Fix SoB
 - Remove reg description
 - List #interrupt-cell items
 - Add interrupt restriction per variant
 - Remove extra examples
---
 .../interrupt-controller/nxp,lpc3220-mic.txt  | 58 --------------
 .../interrupt-controller/nxp,lpc3220-mic.yaml | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt
deleted file mode 100644
index 0bfb3ba55f4c..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-* NXP LPC32xx MIC, SIC1 and SIC2 Interrupt Controllers
-
-Required properties:
-- compatible: "nxp,lpc3220-mic" or "nxp,lpc3220-sic".
-- reg: should contain IC registers location and length.
-- interrupt-controller: identifies the node as an interrupt controller.
-- #interrupt-cells: the number of cells to define an interrupt, should be 2.
-  The first cell is the IRQ number, the second cell is used to specify
-  one of the supported IRQ types:
-      IRQ_TYPE_EDGE_RISING = low-to-high edge triggered,
-      IRQ_TYPE_EDGE_FALLING = high-to-low edge triggered,
-      IRQ_TYPE_LEVEL_HIGH = active high level-sensitive,
-      IRQ_TYPE_LEVEL_LOW = active low level-sensitive.
-  Reset value is IRQ_TYPE_LEVEL_LOW.
-
-Optional properties:
-- interrupts: empty for MIC interrupt controller, cascaded MIC
-  hardware interrupts for SIC1 and SIC2
-
-Examples:
-
-	/* LPC32xx MIC, SIC1 and SIC2 interrupt controllers */
-	mic: interrupt-controller@40008000 {
-		compatible = "nxp,lpc3220-mic";
-		reg = <0x40008000 0x4000>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
-
-	sic1: interrupt-controller@4000c000 {
-		compatible = "nxp,lpc3220-sic";
-		reg = <0x4000c000 0x4000>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-
-		interrupt-parent = <&mic>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>,
-			     <30 IRQ_TYPE_LEVEL_LOW>;
-	};
-
-	sic2: interrupt-controller@40010000 {
-		compatible = "nxp,lpc3220-sic";
-		reg = <0x40010000 0x4000>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-
-		interrupt-parent = <&mic>;
-		interrupts = <1 IRQ_TYPE_LEVEL_LOW>,
-			     <31 IRQ_TYPE_LEVEL_LOW>;
-	};
-
-	/* ADC */
-	adc@40048000 {
-		compatible = "nxp,lpc3220-adc";
-		reg = <0x40048000 0x1000>;
-		interrupt-parent = <&sic1>;
-		interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml
new file mode 100644
index 000000000000..489bd329bc4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/nxp,lpc3220-mic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx MIC, SIC1 and SIC2 Interrupt Controllers
+
+maintainers:
+  - Vladimir Zapolskiy <vz@mleia.com>
+
+properties:
+  compatible:
+    enum:
+      - nxp,lpc3220-mic
+      - nxp,lpc3220-sic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    items:
+      - description:
+          IRQ number.
+      - description: |
+          IRQ type. Can be one of:
+
+              IRQ_TYPE_EDGE_RISING = Low-to-high edge triggered,
+              IRQ_TYPE_EDGE_FALLING = High-to-low edge triggered,
+              IRQ_TYPE_LEVEL_HIGH = Active high level-sensitive,
+              IRQ_TYPE_LEVEL_LOW = Active low level-sensitive.
+
+          Reset value is IRQ_TYPE_LEVEL_LOW.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,lpc3220-sic
+    then:
+      required:
+        - interrupts
+    else:
+      properties:
+        interrupts: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mic: interrupt-controller@40008000 {
+      compatible = "nxp,lpc3220-mic";
+      reg = <0x40008000 0x4000>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+    };
+
+    sic1: interrupt-controller@4000c000 {
+      compatible = "nxp,lpc3220-sic";
+      reg = <0x4000c000 0x4000>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      interrupt-parent = <&mic>;
+      interrupts = <0 IRQ_TYPE_LEVEL_LOW>,
+                  <30 IRQ_TYPE_LEVEL_LOW>;
+    };
-- 
2.43.0

