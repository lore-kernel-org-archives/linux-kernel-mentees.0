Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3EDCD8CAC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 18:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43627817ED;
	Tue, 10 Oct 2023 18:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43627817ED
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iK3t1jW7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Idc5NQQkdNUq; Tue, 10 Oct 2023 18:50:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1D47E817A9;
	Tue, 10 Oct 2023 18:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D47E817A9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7286C0039;
	Tue, 10 Oct 2023 18:49:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37AD9C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D5DF40489
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D5DF40489
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iK3t1jW7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JRv-SJ5_O81B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:49:58 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DB1040012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DB1040012
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c434c33ec0so37577435ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 11:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696963797; x=1697568597;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3r/GV/XLucgebya1CEWK14+Mj9aJsAwuJyhcB53lBRU=;
 b=iK3t1jW7XCrYX05jKxTKuTeVMZ43/sZd/VkijP+eOBKdgd329yn5z7OHK8Ne3nYsDD
 NmTjmioYH0ZOguSrSusxnQvbYcW3fsqCZ18XIpAhcaWVmO2hV8nwxbdapcqdJbtv+3NG
 ncabKJa1ahHM7j74lv/l2/WJ22R5HDBdpuG51pKaGEuphu2o2LsLxBXbrps/H53wr+md
 OliaEZmQfnFAbBbvBfl11phk6BBW+a2JW2mcNv+O9+/5/srPvt0mOaV5eOPjd8ayXWBs
 SvnkRcwrQxYE6Cth265VXGiIeeyPzZjk5+L0K3CgVywmKBKmvMYZmbM+ltEJZqpy1c9M
 rOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696963797; x=1697568597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3r/GV/XLucgebya1CEWK14+Mj9aJsAwuJyhcB53lBRU=;
 b=g62D+fu6j6a9cqFUmn3hjDpCgRryQ1Upg1yPPpkNfKR+3YMRPyerl+2GyfJkhyVpOi
 ehM3MjEq5a91zMKQiTBafdA7XXSrYrx4RL9OSA3OlSaYPf/NxxY+1Zc4J5VPZZ2S0IKW
 9QaNGzDkMl2yoW3ROJg+b1SXPAnYuTAMzKP9ZhZYHk5nBSZclb5FhTwu5u691fzrs4/Y
 5u1XzhlyWyXXy0pGuYEvXnIv3JgHbq5Xycz4/xKMb8mB4JRScZ57SS3uFOEytvKDpibE
 gJIgnN3E1qrLX6cqIlxL0PvTKSErm2gaDsGroxBvmhWj6kyj3R1Jyw1BomJY4f/iEXou
 FckA==
X-Gm-Message-State: AOJu0YzZVhdfO3nzPyAMdGw9ZZraGUx7f3dY/NQQBJ8wNez4MnYjOk6m
 grE9CKvcQLHdZi8ZCxjs4ZU=
X-Google-Smtp-Source: AGHT+IHeml2e2h+flm0b4gyQ9W87X8pjvLvYttiBiveqrYZq/41IZBUYmoWCmUJ30hLtemH9Eam+2w==
X-Received: by 2002:a17:902:8e87:b0:1b8:2ba0:c9c0 with SMTP id
 bg7-20020a1709028e8700b001b82ba0c9c0mr15123695plb.59.1696963797436; 
 Tue, 10 Oct 2023 11:49:57 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:629e:4cec:991b:26e5:7c89:9a07])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170902c25500b001bc87e6e26bsm12147570plg.222.2023.10.10.11.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 11:49:57 -0700 (PDT)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Date: Wed, 11 Oct 2023 00:18:23 +0530
Message-ID: <20231010184827.1213507-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: Conor Dooley <conor+dt@kernel.org>, Anshul Dalal <anshulusr@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
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

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---

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

 .../input/adafruit,seesaw-gamepad.yaml        | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

diff --git a/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
new file mode 100644
index 000000000000..e8e676006d2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
@@ -0,0 +1,59 @@
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
