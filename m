Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B01CDB474
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Oct 2023 03:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1224940342;
	Tue, 17 Oct 2023 03:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1224940342
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CvvYVPEN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZmcM19DLEve; Tue, 17 Oct 2023 03:45:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 282274031D;
	Tue, 17 Oct 2023 03:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 282274031D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05C79C0071;
	Tue, 17 Oct 2023 03:45:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E938C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 03:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3102960B92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 03:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3102960B92
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CvvYVPEN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M1uaLoFDIw1S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 03:45:21 +0000 (UTC)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C767860B83
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 03:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C767860B83
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-419cc494824so36518931cf.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 20:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697514319; x=1698119119;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fpenc3TC1wxTiSmB6vD1Cx4tRH9i7lUBaz0u5rLStfY=;
 b=CvvYVPENbarMA0Yi7qs7kRJ4JgDHHX9xa9h7ETiA0R2QHnGFp6EOVF1Pvy1MNwiNYq
 IUiEgjPOccn1uuGgCW2/jM3CfdqNHWK8sGGFeOySW2ZYSi5vImbcDJCH5b3n5jL1aJsM
 26RqKprsLpbFd6FfpAwZ/Navjx/x3NZ9Fx4aW1L7aFCRXdk6wWBRS6e9ek1dgUHqa3lu
 lix4/8zl/nCK14roRTi+Lu882dHizDc21Cl4ZSU3AhyNxmzPOeTsC40TpAeIkf71nWwr
 5GswtJIKEKKlh+FYZtpi+W74qpKz/Wt0yQRU466Iu3SfT0J0bchaEYpM6B9M7nQ1Wump
 RoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697514319; x=1698119119;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fpenc3TC1wxTiSmB6vD1Cx4tRH9i7lUBaz0u5rLStfY=;
 b=Hqq7DRmvkfDtR8QcEfKOHfGF0OWjaRNIUDROUc5p8qVkl2MWlWdd1ACVzh8+ShK2Mm
 hehfNZJqdCAUqrjWI9M5fJ2mXaex5iQTErMP3lvG6xLuR6ezAHHcHsPQslwAEFZPx5Ue
 i6SngT5UgwRd7feFMyd875rGJy4mihXjr8oJMTVZl+Xa9Qxu6/Up/rvAhuGjzxt8+eiQ
 LdArhqXoqmWyejHXHTDgtqIDvOwThuwc8FbZtJgpIVy1QVTY11evIjMy6o9MCFOFiIax
 zNTsq1rzBZFftYy3nWbEHsiXaoripclnMEcLszs6CFa9dyxuUaAtgIL16PFnNoial7F+
 DSkA==
X-Gm-Message-State: AOJu0YzqFGj27uYvy3dQ7T5+3LVcfI9xlIaL8IcBzghW4Sm0ELFPZFtB
 3Klt99MOKEueRMxsFiTrCd8=
X-Google-Smtp-Source: AGHT+IGRVQZCVNJEkZXf9JzXVxV+zgsZwjKw5X1hyxT7Mx63UwrODkWivGNx/S67JTJ8V0W+53S9ow==
X-Received: by 2002:a05:622a:1b8d:b0:417:914a:104d with SMTP id
 bp13-20020a05622a1b8d00b00417914a104dmr1544809qtb.49.1697514319434; 
 Mon, 16 Oct 2023 20:45:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:628c:a92e:5b03:91a2:57c8:16f3])
 by smtp.gmail.com with ESMTPSA id
 y13-20020aa793cd000000b0069305627491sm313777pff.159.2023.10.16.20.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 20:45:19 -0700 (PDT)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Date: Tue, 17 Oct 2023 09:13:44 +0530
Message-ID: <20231017034356.1436677-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: Conor Dooley <conor+dt@kernel.org>, Anshul Dalal <anshulusr@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
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
