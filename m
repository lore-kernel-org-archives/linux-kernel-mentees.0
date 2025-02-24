Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16DA84A35
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 21:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740431084; cv=none; b=tZx6/Kv6SrdMd8dU+q+ubD2ol06Gt8VLRiHmJRDdxGqH9p1E9ehfoS6VPpUPaKOy1ZYawekkquihQTZW1kYUbj2LkdksVFQiXK/cDoa5jP/9QM2AvgXz1eAX0x11fodCzBYy0fV1aIriqDBDBP4lOqlS4Pp+3PuxO0A8fGMY3tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740431084; c=relaxed/simple;
	bh=ZAgSBIx9SxOl5v8dCTR/pRxYY31jl7YM+ojkb+mkJmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AxTUMQJVK1ycwm5G5iXrxsgE6V897d8bq8i9aeRoNwo7LHvDHAMU8YwExcZXFyeAYgWfwqFVH2+tSMIBWAdk1Y/9rP33Qdy5fEeJzASMxe8ynnMSEQQcfVhiBRqvZCuKh5u3oOBc8DgNN0omYTNj7vzgahTHRERGHbECa1+ptXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npIQANH5; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npIQANH5"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93AEA80C50
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 21:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gx9R7bhG5QrP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2025 21:04:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=leo.fthirata@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A32BE80C51
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A32BE80C51
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=npIQANH5
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A32BE80C51
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 21:04:41 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-221050f3f00so110749015ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 13:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740431081; x=1741035881; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PrNIQyJ5Jhdx9yshPdJ0kSZ+7xfgRV78xd4HlJimuN8=;
        b=npIQANH5ZWXVrP8WF2Aj3hCKJCdM4OSfDl24xDMuOUHhMpLRVgdoUkWhyn9EfSEQOm
         liQk/1yJJSrTWxTYEnb0BcQjlEzslFW5wSn9qdxWnprsoXWEQ7ZMWkBrPqsen+nIMq/X
         Q3hBEZqzjrh0VJYPSth435EwtR3BUVKOCZDPPqVka/PagU83OaPm/z5p68mgNg5Ss7/9
         ozDT3vtzeCKXtlWheTdF+OLTLi244/TyXHY3ZTYBJbHpSi9F+6DWS6ogfr2Gmhtc9W0A
         0ne7/6/V35kAXWNOfx6EitjOKl+WpxGBIkgKe4UXo8LzyJ/DQ9P3rpqLu1RpGYTee1BD
         Z/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740431081; x=1741035881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrNIQyJ5Jhdx9yshPdJ0kSZ+7xfgRV78xd4HlJimuN8=;
        b=mxcjogLUPGSqEB9mH98bfw4AVwTydmN2E6z1FqwcnbtfTM29AnvnhfCmIE36eVbYkz
         g9kxFtDKmHfTCIQT/BGUgHu8/eCDGGJk+BucbGLWkpCmdA8curqVhjRC1oerekEohJR/
         DpL+oIzqv0ZH7KM56nui/YqvFlofX6SJKp66Yi3UXQDSaBiQIRipfB928aLRLc3dh3RQ
         MuVCCWjrr1lakdqyKMDNJCckcGLbq8jTwIO69q0g2j5k/WeoXBxrSZLjzodXrZ2AIu3V
         jv1gWGAZ66guWao5sD+EC1TOCp1mjjHqEoKImRNZFopclgosBqdgsxD1GT0XnYVIU9fP
         R3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcQSC0nByI6dL641EEep739JLiy08ehFYJ6N3FO+SbCmWn+Vt5eL9diXCP1QzsL+8a7VNsUx5Qbl4LYDZkLDiT+E/ZQA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzOBp6nikxW73hmIpBx1xFZ1HGbTsKh9zGCtI10G12fhqbiDG6T
	kQ35Omdvp/JMAL+pDA/eYIY1/nUSDVKrJ8C+f1kFVs3GIkNAKylx
X-Gm-Gg: ASbGncvQYYiORhg3wtFbB/fHv9AqwIvJrtgFusuviG/+A+Q4S5mrY/jYndt5QDj8Y3D
	IfVgpELrCUEq7hraZaWB/G9CIbgBRlh9pdZBjFoxci3bCpbVD+aFrKGL0TdQAhjRaQDPfjeA45Q
	AUgZczV5XLzxwc4JPi+wFrazx5y+4zVuRHUPxMHQ0g0yCIP+XW7bttAb8Ck7JHccuBsvOLF3uVV
	DDPFUMOadeDYoKZ+R8wh5Fr5IxOUqPGJopw/t0rx0FogmRDiHIm894m2g7NWIjEae1UIeLxfUmI
	2uuBKC/iSbSMqBlpGQt8GQ==
X-Google-Smtp-Source: AGHT+IHWTMwXTzcxOW9uoPlv1v7haW6uVtdozlUcfDrTOvTWlUsZytq0IAqBRViyK/ppP6mVQo6K3w==
X-Received: by 2002:a05:6a20:6a0d:b0:1ee:e808:732c with SMTP id adf61e73a8af0-1f0fc1394c6mr886008637.14.1740431080512;
        Mon, 24 Feb 2025 13:04:40 -0800 (PST)
Received: from dev.. ([2804:14d:887:95a9:4a24:9b21:53f4:4d40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aeda8574dbasm82562a12.42.2025.02.24.13.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 13:04:40 -0800 (PST)
From: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
X-Google-Original-From: Leonardo Felipe Takao Hirata <leofthirata@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vz@mleia.com
Cc: Leonardo Felipe Takao Hirata <leofthirata@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert nxp,lpc3220-mic.txt to yaml format
Date: Mon, 24 Feb 2025 18:04:30 -0300
Message-ID: <20250224210432.94851-1-leofthirata@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert NXP LPC3220-MIC to DT schema.

Signed-off-by: Leonardo Felipe Takao Hirata <leofthirata@gmail.com>
---
 .../interrupt-controller/nxp,lpc3220-mic.txt  | 58 -------------
 .../interrupt-controller/nxp,lpc3220-mic.yaml | 86 +++++++++++++++++++
 2 files changed, 86 insertions(+), 58 deletions(-)
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
index 000000000000..c57478b8982f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml
@@ -0,0 +1,86 @@
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
+    description:
+      Should contain IC registers location and length.
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      The number of cells to define an interrupt, should be 2.
+      The first cell is the IRQ number, the second cell is used to specify
+      one of the supported IRQ types.
+          IRQ_TYPE_EDGE_RISING = low-to-high edge triggered,
+          IRQ_TYPE_EDGE_FALLING = high-to-low edge triggered,
+          IRQ_TYPE_LEVEL_HIGH = active high level-sensitive,
+          IRQ_TYPE_LEVEL_LOW = active low level-sensitive.
+      Reset value is IRQ_TYPE_LEVEL_LOW.
+
+  interrupts:
+    description:
+      Empty for MIC interrupt controller, cascaded MIC hardware interrupts for
+      SIC1 and SIC2
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
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
+
+    sic2: interrupt-controller@40010000 {
+      compatible = "nxp,lpc3220-sic";
+      reg = <0x40010000 0x4000>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      interrupt-parent = <&mic>;
+      interrupts = <1 IRQ_TYPE_LEVEL_LOW>,
+                  <31 IRQ_TYPE_LEVEL_LOW>;
+    };
+
+    adc@40048000 {
+      compatible = "nxp,lpc3220-adc";
+      reg = <0x40048000 0x1000>;
+      interrupt-parent = <&sic1>;
+      interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.43.0

