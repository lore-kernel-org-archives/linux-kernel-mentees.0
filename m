Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7971E95A67
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Oct 2023 18:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 068AF41860;
	Sun,  8 Oct 2023 18:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 068AF41860
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fni3jOXw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5HeviLWHQJ3V; Sun,  8 Oct 2023 18:58:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E0DA64182C;
	Sun,  8 Oct 2023 18:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0DA64182C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADF4FC0039;
	Sun,  8 Oct 2023 18:58:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02268C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 18:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAE3D60E6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 18:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAE3D60E6F
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fni3jOXw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id acWbkWF38RnL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 18:58:12 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE0CE60648
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Oct 2023 18:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE0CE60648
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-35140cc9187so16602735ab.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Oct 2023 11:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696791491; x=1697396291;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8MjhZIChqwGFfsu7+wv7ehcHu+Do5Sq2jxL2J+21PMg=;
 b=Fni3jOXwI4fnZ0cXUzT6AP1JtKp/bOoqv3dCDt+O7cSS/xS+zDUpdpPwzX+hGZw2sc
 26v6GEtzsglF0Fb6BUS8M3DR2wRf/6s0vB9h0PDur5qAJ9UEJDHXUUk1xSA5iQnIEVy9
 izZz4948c4NMlQ46NpIENNjV/dMY3YBcfSfAGTXec4dcdXmZqr2caNDQKX2dVw1GlCd9
 Fun6kgFhGbvw++wIQUrXpYHgLnq3z+s+OAva40e5TM/Aj8s4jt7d1bqEJbxZKXYRbHKl
 GUNFMcYbpuSYjJNCzyoujloWmDJwTq3zLGa4vyc9iu0iwWi5lCcTDN+/cqbm98YoVnwX
 aXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696791491; x=1697396291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8MjhZIChqwGFfsu7+wv7ehcHu+Do5Sq2jxL2J+21PMg=;
 b=C2vfE/UIRbtEKSGvG2aUXE+PGtmpgKuVjWNf4zJDBwGskWYKVs+R4xWc8lgs1ZZ6iu
 4nXVa1iu6EdbqKwBSrNzmfbKn1zIhowHRXRssPv0wujYkOIErnPuSfddi84nTMFi/E5A
 +0rC1ppVfOf2T48xvfY0AJ0P+o0Pcg+S77PYSYbxEO+WTdhDlESNdbFt4Pa4WF3IiPH4
 +y3rZ8FmBM1wX6WiRuOgrPmbh0EK0YoQYW96FcLrLxcfJR4CweKkW8b5/9UlbjRe2X++
 gpDZO5xUB2Rj8YUOW3yKLdDpyQR2CpgO4CFlta/0c69c5vwHXY7KZi4178AzW/p9mYcQ
 JKtw==
X-Gm-Message-State: AOJu0YznOqUGgm9UqBF1aIiNSXpSzn3y+c7xZlhP18OGA5mPseZmz3gf
 5vIgvB/KzAW410H8eSOhQ68=
X-Google-Smtp-Source: AGHT+IHyneyQwv4vXVxcAEKr/7ktYor5bWTJzAo0PskO4igXwQi+a9dJwhSB1rvCmOha2X96/wedjw==
X-Received: by 2002:a05:6e02:12c5:b0:351:2104:64f6 with SMTP id
 i5-20020a056e0212c500b00351210464f6mr17909173ilm.1.1696791490741; 
 Sun, 08 Oct 2023 11:58:10 -0700 (PDT)
Received: from archlinux.srmu.edu.in ([14.139.187.71])
 by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b001bdd68b3f4bsm7906882plb.295.2023.10.08.11.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 11:58:10 -0700 (PDT)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Date: Mon,  9 Oct 2023 00:27:06 +0530
Message-ID: <20231008185709.2448423-1-anshulusr@gmail.com>
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

Changes for v3:
- Updated id field to reflect updated file name from previous version
- Added `reg` property

Changes for v2:
- Renamed file to `adafruit,seesaw-gamepad.yaml`
- Removed quotes for `$id` and `$schema`
- Removed "Bindings for" from the description
- Changed node name to the generic name "joystick"
- Changed compatible to 'adafruit,seesaw-gamepad' instead of 'adafruit,seesaw_gamepad'

 .../input/adafruit,seesaw-gamepad.yaml        | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
new file mode 100644
index 000000000000..610c99594439
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/adafruit-seesaw.yaml#
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
+  reg:
+    maxItems: 1
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
