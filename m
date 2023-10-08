Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A7BE95A82
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Oct 2023 17:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF96D81EBC;
	Sun,  8 Oct 2023 17:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF96D81EBC
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JY/aYSmn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QAKZUbFgb0oD; Sun,  8 Oct 2023 17:26:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9EE9081EAE;
	Sun,  8 Oct 2023 17:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EE9081EAE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74214C0071;
	Sun,  8 Oct 2023 17:26:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 747E5C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 17:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4178B81EBC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 17:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4178B81EBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwCgBrsiY3pg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 17:26:29 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B1E981EAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 17:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B1E981EAE
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c60a514f3aso31527775ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Oct 2023 10:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696785988; x=1697390788;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Dl+sRwhA+6/vcdeQRfaxz6sNb8CQXRuiO63sXIRhzc=;
 b=JY/aYSmnbb2RiJqDDMiaSvbn8gYY4zjOkyoQEghOp3RJLAPtRXD6W9xjgufJLYBGnB
 nM2j4Ui/NXH2MKfKrNaJGFm84M2ROuz1gXRcgpHSwYHRW1IV2g0ppVo4xWPbS0fxzZXK
 Bfrl0hgKFC7iX8c/SsPUxM4QC7T6xGO2hjUEdlJ2F0f1HRSsW5IUIDicL8FsJgpaiRiY
 R/Ow4yB+l4lsiO7QCret+WfQMK763R0gg+vdppOqjYWWwoNSGvulKBQZux5/w+ynlp/4
 JYUvg0QF64Edplr+9BVGTe+dz7AhivHeeSzabXWNUTe5UR0yy2GGfpNr/domlD+MmsD3
 omZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696785988; x=1697390788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Dl+sRwhA+6/vcdeQRfaxz6sNb8CQXRuiO63sXIRhzc=;
 b=CbXYLi8kBMOppqNZKdPtDYYny+mYrQd+WA1qINieRksmi6kESTd8Ost/VbxMPx+EIF
 YV0ppT4LYiepnyEXhYBKik1UJHC+SyxwUIbGOQ168PSme2csOEwXCz+Q8jYIAJqJKgD6
 LC733VO9dIUHv5L2rWiN4/GJdpt6QK584JTnigIFCTH36UhpUmIsQttZR3NAEQi5Qja0
 5iYkXAkigr57/WiE2EwYEo5jQIu8OcvePqWvZBqb/jLt75MQlPe+RbAiZ4LFpJdmZMcY
 1WE4Sc9ACusUJk/eB7zFO9Ylq8XueXD7LBCWj5INks3YmIr2n9ty7eXXo8vAEpsAmlsL
 oh1w==
X-Gm-Message-State: AOJu0YyIqiKBUKV+wPC3tJirmSe8fG7CdczQMvxY4KXPvYwZYDMeF7P/
 Mk4pY4PvRfmDiVEqt10bhWc=
X-Google-Smtp-Source: AGHT+IFGmhCvkLPn4CQuz8nTXZjfyVSSTZ2rtNNnlboc8XS+9Tt+9LHj9/nPjyAFvPdyKaN8ccHZFg==
X-Received: by 2002:a17:903:230b:b0:1c6:a0b:7b9a with SMTP id
 d11-20020a170903230b00b001c60a0b7b9amr17382272plh.3.1696785988274; 
 Sun, 08 Oct 2023 10:26:28 -0700 (PDT)
Received: from archlinux.srmu.edu.in ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 jb17-20020a170903259100b001c8836a3795sm7714918plb.271.2023.10.08.10.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 10:26:27 -0700 (PDT)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Date: Sun,  8 Oct 2023 22:54:33 +0530
Message-ID: <20231008172435.2391009-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: Conor Dooley <conor+dt@kernel.org>, Anshul Dalal <anshulusr@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

A simple driver for a mini gamepad that communicates over i2c, the gamepad
has bidirectional thumb stick input and six buttons.

The gamepad chip utilizes the open framework from Adafruit called 'Seesaw'
to transmit the ADC data for the joystick and digital pin state for the
buttons. I have only implemented the functionality required to receive the
thumb stick and button state.

Product page:
  https://www.adafruit.com/product/5743
Arduino driver:
  https://github.com/adafruit/Adafruit_Seesaw

For testing on a RPi Zero 2W, I utilized the following devicetree overlay:

/dts-v1/;
/plugin/;
/ {
	compatible = "brcm,bcm2835";
	fragment@0 {
		target = <&i2c1>;
		__overlay__ {
			#address-cells = <1>;
			#size-cells = <0>;
			joystick@50 {
				compatible = "adafruit,seesaw-gamepad";
				reg = <0x50>;
			};
		};
	};
};

I used the above overlay as reference for writing this binding. Though the
gamepad also has an interrupt pin that needs to be enabled explicitly (not
currently implemented in driver). The pin triggers a rising edge when a
button is pressed or joystick is moved which can be detected on a GPIO
of the Microcontroller.

I wasn't sure how to represent that functionality in the binding so I have
left it out for now.

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---

Changes for v2:
- Renamed file to `adafruit,seesaw-gamepad.yaml`
- Removed quotes for `$id` and `$schema`
- Removed "Bindings for" from the description
- Changed node name to the generic name "joystick"
- Changed compatible to 'adafruit,seesaw-gamepad' instead of 'adafruit,seesaw_gamepad'

 .../input/adafruit,seesaw-gamepad.yaml        | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
new file mode 100644
index 000000000000..af34f789da1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/adafruit_seesaw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Adafruit Mini I2C Gamepad with seesaw
+
+maintainers:
+  - Anshul Dalal <anshulusr@gmail.com>
+
+description: |
+  Adafruit Mini I2C Gamepad
+
+    +-----------------------------+
+    |   ___                       |
+    |  /   \               (X)    |
+    | |  S  |  __   __  (Y)   (A) |
+    |  \___/  |ST| |SE|    (B)    |
+    |                             |
+    +-----------------------------+
+
+  S -> 10-bit percision bidirectional analog joystick
+  ST -> Start
+  SE -> Select
+  X, A, B, Y -> Digital action buttons
+
+  Product page: https://www.adafruit.com/product/5743
+  Arduino Driver: https://github.com/adafruit/Adafruit_Seesaw
+
+properties:
+  compatible:
+    const: adafruit,seesaw-gamepad
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        joystick@50 {
+            compatible = "adafruit,seesaw-gamepad";
+            reg = <0x50>;
+        };
+    };
-- 
2.42.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
