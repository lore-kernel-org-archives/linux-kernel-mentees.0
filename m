Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC444E95A63
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Oct 2023 14:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34BD1610A9;
	Sat,  7 Oct 2023 14:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34BD1610A9
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ILseyHWU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzBVNmzGdcLo; Sat,  7 Oct 2023 14:42:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0CD1861042;
	Sat,  7 Oct 2023 14:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CD1861042
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF24FC0071;
	Sat,  7 Oct 2023 14:42:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77154C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 14:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4729641DF3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 14:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4729641DF3
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ILseyHWU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSpllpiWETca
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 14:42:20 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21AC041DE1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 14:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21AC041DE1
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c62d61dc96so22127275ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Oct 2023 07:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696689739; x=1697294539;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5sisTLNnKGsZYfiDDfEHY+RjQwoo26s1ZltAy3XmFO4=;
 b=ILseyHWUtKWT0BJgFwUqe6/EHX0vJtbd86rvCREzkJerTlq+KCY7aL8Y8g3GFlbjgi
 54zCvPPk6Zc5jfqYfBzwkEjXms4lgyMootQWYlByDyQOUR4j3mUCoyCSeTabqjjuc5qp
 eAqzj27kF7mZkl+TJ0WAipPuYLmoNI+CbLj3T5IhzoUqB+cvV07D5yETafdESd9kJLZh
 nxRFGYJzuNJQbIPTdR+e8cOyaQF/pDJrgHcTaO4eMzc8FbjEdeFYvjJKl1l6RqzVjQsw
 rJvjHkDApmh4tl/n6KQeXF/pcrQvCTSM9dtjD/N9C3BSrsdqEC3tWZK5zHqfwbkqtTf2
 cuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696689739; x=1697294539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5sisTLNnKGsZYfiDDfEHY+RjQwoo26s1ZltAy3XmFO4=;
 b=bNQjDkAGHQ5fi+ZGP7r7JBgUVKiytlp86RHlBkkH7ZmAskm/gRzhrjozkGbakx4o3G
 bwtWg84DpT7yudIViEkIqXK4o5kxMW1GjP8Hc0U9GwjTfNolCKedKse1LdpxTJ7LHwq1
 6+h5BhVTpOKl5NQikUEDfJWJUzFVcB+yi5jJg2LtKRXL0wAa9gp1pVYNc0qdSgW3/QPl
 mYC3uUJFwPoyUj5UjjRrhD012M6c71dV7yjkltL86tlixhswMUq2/PMX2aLLZlPGmn77
 FN2Be3xQtJCJcHgs6PMAxVS8ViiqQQ0/K1Faz8aEdszlyIFHqowEAepOPyQ3OaXbaeu3
 7Csg==
X-Gm-Message-State: AOJu0YyG5ubTXW4vW4q7pzpF+ZN+4AFvKDk+6osnNrac4SHFe/Ae4uiv
 c2CcA29jQl/Y0JCkmAZTrAE=
X-Google-Smtp-Source: AGHT+IFbKvEVOdRGs5JNmA0gGHPef2pRiPROSvBW0B3aLV4DgVCzu+hGqL8J9kkdoE0uGHJCO1ciFA==
X-Received: by 2002:a17:902:dc86:b0:1c3:21ae:7a4a with SMTP id
 n6-20020a170902dc8600b001c321ae7a4amr10460957pld.38.1696689739354; 
 Sat, 07 Oct 2023 07:42:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:6291:4752:3191:cc16:9883:82e9])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a1709028c9800b001c73f51e61csm5962288plo.106.2023.10.07.07.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 07:42:18 -0700 (PDT)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: Add bindings for Adafruit Seesaw Gamepad
Date: Sat,  7 Oct 2023 20:10:49 +0530
Message-ID: <20231007144052.1535417-1-anshulusr@gmail.com>
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

Steps in reading the gamepad state over i2c:
  1. Reset the registers
  2. Set the pin mode of the pins specified by the `BUTTON_MASK` to input
      `BUTTON_MASK`: A bit-map for the six digital pins internally
       connected to the joystick buttons.
  3. Enable internal pullup resistors for the `BUTTON_MASK`
  4. Bulk set the pin state HIGH for `BUTTON_MASK`
  5. Poll the device for button and joystick state done by:
      `seesaw_read_data(struct i2c_client *client, struct seesaw_data *data)`

Product page:
  https://www.adafruit.com/product/5743
Arduino driver:
  https://github.com/adafruit/Adafruit_Seesaw

Tested on RPi Zero 2W

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---
 .../bindings/input/adafruit_seesaw.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/adafruit_seesaw.yaml

diff --git a/Documentation/devicetree/bindings/input/adafruit_seesaw.yaml b/Documentation/devicetree/bindings/input/adafruit_seesaw.yaml
new file mode 100644
index 000000000000..1d00d9da637a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/adafruit_seesaw.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/input/adafruit_seesaw.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Adafruit Mini I2C Gamepad with seesaw
+
+maintainers:
+  - Anshul Dalal <anshulusr@gmail.com>
+
+description: |
+  Bindings for Adafruit Mini I2C Gamepad
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
+    const: adafruit,seesaw_gamepad
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    seesaw_gamepad@50 {
+        compatible = "adafruit,seesaw_gamepad";
+        reg = <0x50>;
+    };
-- 
2.42.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
