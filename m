Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C4B19259F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Feb 2025 03:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740714034; cv=none; b=ByV8g9OBtU7XxvcB1MdXLLvknKP5mQIAq8S5oQZOoyOA9pMbb8GYOJL3pcUhy51XpgDElpK1N9zHxFqdseHQ+ENO53FKL+0Y49kBAP229YY13UHr3f+jrPFh61PolsTUzXJR/veFSFD5+48zHl1kqS1BGhBeTyNyYbuAkuHma34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740714034; c=relaxed/simple;
	bh=nGH8rvuuV5YTeJBxNVwgLjv9Y8DsGwNpyNl4n8u/Lok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=esvbhXIiV5ikwMBSRJe++IFLOMlSPhzJgdfuHC0I2in9o5au2oIAvqnn8lxR/IXyy3e9aKpkHUzDMEkrqciITNyXAZSaPQXbqFQWGEORsKm2nErrmgrkRfW/iS2QmNFYASpTrZf/lqaOJBQawwCeH02j8nbNR1d+BTatvaPQl6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQUHvEsB; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQUHvEsB"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6017981F4F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Feb 2025 03:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qczP_7pOklFC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2025 03:40:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=leo.fthirata@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D41681F2A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D41681F2A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FQUHvEsB
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2D41681F2A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Feb 2025 03:40:30 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22114b800f7so33548485ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 27 Feb 2025 19:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740714030; x=1741318830; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OoJ4GCtBW9r4R7yZx4mj/bfDelbtr4R+xivfqBWQxIE=;
        b=FQUHvEsBsFmlFpHPJPk5rlJa6SzQEExz+GBbzwq3/UOrlredmYx9DYLsaXfR59ajnb
         D1PAaFz4kGi7mfcoPspePiUvMLY1Aoh2C3L668TA+wHhdYR6xvtgZobjGbuXrE1CRBDw
         axMBdY4u8nt1xxvRzdsIOJFdEXCvNRvfyuc8Ng9qLiEUxWBwteSH1kC8WUpHqIbBYUYR
         OgImnfqIHqnfLSs519ga2R5JV7sYZB9ef8wQk/H3SJBt6UXSvzAOg1QmXpnxGgi5drYz
         FTBsi3ij/dW9uxzhA4TXWXvjx3yoEtKq43urxgYaUZlrvHVU4xSkdYnGNLWb5xtyugLD
         k1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740714030; x=1741318830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoJ4GCtBW9r4R7yZx4mj/bfDelbtr4R+xivfqBWQxIE=;
        b=plbPQ2dPT34RYM1ySng5HZlAdy70zxcD06Ky5SzeWbOk9aYz2F3nAq/iQmCBorzFzu
         Clc5Xm8Jly58sg7JCqJjUz//thoER4V7eUid0Zs5LAzvDbwnYQ4K1RxXUZnYTwxleKry
         pOSXgW4hpIvgp2XTv0h0/Lu8uet9sbLvXKktrbjhfzjDOaYCV/T/DK0SgQ3t9GA8VFHe
         Wdq8nysiDFzYhr9LCwT9EpXeFEi+kQpINjrFJbWX25m1fkxbB3sz86aJp2svHCir7Ze7
         uhc+kdeE5Uz/bo6JbF3isrAoGUGRwWpByYGlzUo81iIikdebZURrWBPc0uziI9l3JG3S
         zsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8ImQg/647klXh/Vvp86dfVQtdBE4RXz119XXVmajcmr0twN13im4jVI7hQeOiJW0Od6ctbztiF7AcosOHhWUAMWfQgQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxNoM7K7AqEcwDJIdZq0d+MW2Jubx6/K4AkDJ/Oj4F6OlEbXLYY
	4eZWjs9jfsJXgNa0JdMMbao6LFU3PUcOSwGd5T53EN5xPpfyye05
X-Gm-Gg: ASbGncs/9ZW1uXnxdGLx8DOIf8O4/wjvf9SR1SFdAUk588cKPncHQFbiqL38G6VoXeA
	JxsvxbyPql7vx0PfLl+WDPpw7F9eb3H8cTHXodLpJ/5PArRlEvQTCjAU2W7J8NLXWmICvda81S/
	xrKHXosf6sfz3B4Vi7T8RW541p34iZHEqrpCpj/Lko8HeNkwhYUqriJESG7Nk6V9j7gBsZTUdb0
	OpUqGUPNr6S3QJo/OUkbJozdN7vyOxeUbgLgHMZPjKyWSFf9NfwoRp2PDa+Rg6B3NjBOJO9pdVU
	ybib2vVxToVDcdFzXxlgfA==
X-Google-Smtp-Source: AGHT+IH8IRF4VtWIAu215SqkW3dsnhcfHiZAYpXMpzyjCCocGLr1qeuz/Fh1SLUNWxkfkaZmflD9Vw==
X-Received: by 2002:a17:902:ce12:b0:21f:93f8:ce16 with SMTP id d9443c01a7336-223690e6183mr30302895ad.31.1740714030246;
        Thu, 27 Feb 2025 19:40:30 -0800 (PST)
Received: from dev.. ([2804:14d:887:95a9:accf:4797:5e54:f1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5c67sm23593755ad.135.2025.02.27.19.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 19:40:29 -0800 (PST)
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
Subject: [PATCH v3] dt-bindings: interrupt-controller: Convert nxp,lpc3220-mic.txt to yaml format
Date: Fri, 28 Feb 2025 00:39:15 -0300
Message-ID: <20250228034021.607135-1-leo.fthirata@gmail.com>
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
Changes in v3:
 - Add interrupts property description
 - Fix interrupts items descriptions
 - Remove else condition
---
 .../interrupt-controller/nxp,lpc3220-mic.txt  | 58 ----------------
 .../interrupt-controller/nxp,lpc3220-mic.yaml | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 58 deletions(-)
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
index 000000000000..59e8814a15b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml
@@ -0,0 +1,69 @@
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
+      - description: Regular interrupt request
+      - description: Fast interrupt request
+    description: IRQ and FIQ outputs of SIC1/SIC2 to the MIC.
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
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mic: interrupt-controller@40008000 {
+        compatible = "nxp,lpc3220-mic";
+        reg = <0x40008000 0x4000>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
+
+    sic1: interrupt-controller@4000c000 {
+        compatible = "nxp,lpc3220-sic";
+        reg = <0x4000c000 0x4000>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&mic>;
+        interrupts = <0 IRQ_TYPE_LEVEL_LOW>,
+                    <30 IRQ_TYPE_LEVEL_LOW>;
+    };
-- 
2.43.0

