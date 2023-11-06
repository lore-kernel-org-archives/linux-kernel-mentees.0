Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2642C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Nov 2023 16:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5401C41FC9;
	Mon,  6 Nov 2023 16:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5401C41FC9
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AjZARH+0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqSr46IJzhAy; Mon,  6 Nov 2023 16:43:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1325441FC4;
	Mon,  6 Nov 2023 16:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1325441FC4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4B8EC0039;
	Mon,  6 Nov 2023 16:43:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F2D0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 16:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AB2C82256
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 16:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AB2C82256
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AjZARH+0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mGYHzkmqXXQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 16:43:27 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63AD382090
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 16:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63AD382090
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6bf03b98b9bso4334086b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Nov 2023 08:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699289007; x=1699893807;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xYiXnGi32nL1dAgLwz8qgQxJ2TizbYw6290xQdYSCOQ=;
 b=AjZARH+0inawKvHNfkt9aoeugeTt3z7xQ8i+R95t+fPNNrbE6woF0Q2u0JXWeN+nvp
 fYu+cox/AK9XNBKP0fABZ9CjmfCcBEePCMpJMiLfHi/R5y7LTGCIkurJrN9KSNK5M+6k
 fI0QzgoQeoa3AxBupjzv++q7IlyOSLFHGGJJJeYUIySZLPWqBOhEpUu90/19ZG7Qscoa
 oD6F5Bvqje0T3YwhXnZvgNb4HPPa2ldU6umYwNOZCnmeyYSZKnm6Yq10LSLXIVW8Qxz/
 OU1Q88jGArbmOVEoQORIbMu8z9+KC9+CkY0bwHikeX6StmYQvny0Ql+ni735yYgBnG6U
 RKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699289007; x=1699893807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xYiXnGi32nL1dAgLwz8qgQxJ2TizbYw6290xQdYSCOQ=;
 b=FSOsoQ5q2OOpBVFCnWvcZIH5GJ8SE1oJKBoTNbdXhZFauVPfs5tX6hceTRa4p5XoSn
 wJd6CAJFtf9lKFfCvfw6/KV9css09k2PDWr4r8iddvtjJTIlHSfgbXNDM2C0fogV5khU
 StMTJglfdxeXITxCMmzGLHcklUKAi6iXxl99m5utwdHQsIaBjE5yfs+4XwOR61uGg1pD
 AGKhsTzAq8NTaW42lUTSOJx0kD43MFftq7lYu9UWsUv0p45rr8xV4nTaz5ubZXgw9aT1
 1MBAgg05gLggeKNZj6LfrOwuWjc6LZbcvQxq2Y2Myneu2p4XtHFoRL6FYfXcdRTaxfGn
 05Gw==
X-Gm-Message-State: AOJu0YwyveN8V9Z689JeAocIO4ZwlamTwgaTNvtkgm8IFor9JTNEKRuq
 bF1D1WsmYpuutNWACpf9DMk=
X-Google-Smtp-Source: AGHT+IETqIoBt7sVYlAlg0e0WxxwL5q30EOTulNV3m2su1KngxTkc1RtM4Ez78vLMhLRS7AXPvKQyA==
X-Received: by 2002:a05:6a21:a581:b0:15e:b253:269f with SMTP id
 gd1-20020a056a21a58100b0015eb253269fmr16315420pzc.28.1699289006581; 
 Mon, 06 Nov 2023 08:43:26 -0800 (PST)
Received: from archlinux.srmu.edu.in ([103.4.222.252])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a056a000a8600b006933e71956dsm5828227pfl.9.2023.11.06.08.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 08:43:26 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Date: Mon,  6 Nov 2023 22:11:31 +0530
Message-ID: <20231106164134.114668-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: Conor Dooley <conor+dt@kernel.org>, Anshul Dalal <anshulusr@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jeff LaBundy <jeff@labundy.com>,
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

Adds bindings for the Adafruit Seesaw Gamepad.

The gamepad functions as an i2c device with the default address of 0x50
and has an IRQ pin that can be enabled in the driver to allow for a rising
edge trigger on each button press or joystick movement.

Product page:
  https://www.adafruit.com/product/5743
Arduino driver:
  https://github.com/adafruit/Adafruit_Seesaw

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---

Changes for v7:
- no updates

Changes for v6:
- no updates

Changes for v5:
- Added link to the datasheet

Changes for v4:
- Fixed the URI for the id field
- Added `interrupts` property

Changes for v3:
- Updated id field to reflect updated file name from previous version
- Added `reg` property

Changes for v2:
- Renamed file to `adafruit,seesaw-gamepad.yaml`
- Removed quotes for `$id` and `$schema`
- Removed "Bindings for" from the description
- Changed node name to the generic name "joystick"
- Changed compatible to 'adafruit,seesaw-gamepad' instead of
  'adafruit,seesaw_gamepad'
---
 .../input/adafruit,seesaw-gamepad.yaml        | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
new file mode 100644
index 000000000000..3f0d1c5a3b9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/adafruit,seesaw-gamepad.yaml#
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
+  Datasheet: https://cdn-learn.adafruit.com/downloads/pdf/gamepad-qt.pdf
+  Product page: https://www.adafruit.com/product/5743
+  Arduino Driver: https://github.com/adafruit/Adafruit_Seesaw
+
+properties:
+  compatible:
+    const: adafruit,seesaw-gamepad
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      The gamepad's IRQ pin triggers a rising edge if interrupts are enabled.
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
