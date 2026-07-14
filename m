Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65CF42BC54
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 21:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784066084; cv=none; b=EP5VSFEK3PWOiOSEO4/pFlZNVhvZ0DOjvv+r0rgBUaULvr3Ss8Dln2OIBpxBp0ESI3SqLvQNUFmiq1LaTiQjSIhByBLHR22Kq+0W/baaOcsx0oOWCwAYog60FX66UDcEiyPA2540jLe6jD7vwDz14E6JQY5VQ6OY3aTnlNVrfxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784066084; c=relaxed/simple;
	bh=2fRnUTnOxq4qo8Xgzr8H3mWLUn8au9hOu6H8KuFMv34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VR1ouyYCsBMWO8uOmUMPhmtSTjfYVEsi47rvvHfX7w1s/qNsMxrzuDf7QLAkSsEgN4mrV/C1SJPosmSWGTFqgZZMlMl8GtC/UGZQq+duu93Da1s72gTvA7I0hUe7pplB2pPEHD5iTMS79Z1VnwzS4ECJ1/5vywfr/A7xrfWjOMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNhUj48p; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNhUj48p"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-664d22d7337so2942782d50.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 14:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784066082; x=1784670882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LD1fSzo5RQ5ZA0kbdHkEYjYhopbXbN0iGXXs945C6dg=;
        b=DNhUj48pKzCmrCSFrnqm70g14pOHC1DKojTA1Jcvh4FxJh/NEnY2KYEi6pskEp2AxO
         bOAuG+ibAchJIUjOlTHQ/IxVJ/Q8p2m2DlDn+GjGOUduN5CHgEqO5kOi8Ki9qMGAGOm7
         kS73KcOkRnyAyFMcDst3HqPA+nxIRnOx22bWO3Vr+gCYus/lAPJWTw0CZuOW99cDIwlw
         uNSkf6rvU8lR5gsA+KsJ0DtUtrW70kAAa/e730UokAtBeBCz9n3Uam8N2yYZbSRMEGoj
         ofBSkdQCqigyX8GxMUDpcVQRsvL483kpidFNWJeohcUcsazibw02cTsSEOtFIYPPBbTr
         2lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784066082; x=1784670882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LD1fSzo5RQ5ZA0kbdHkEYjYhopbXbN0iGXXs945C6dg=;
        b=AjlGGGAPP3+iG6JSozkbExi1tVB5ID1wl75T2+vya5KB9Qrl/R9fGqfsT5wq3yOyWV
         eGp3sguZ1/7kiH7on93zlB81eeOLExcoBFRHfWMkzPMEDcJozwmJdLtAY9z3npV/oWPL
         IuCLcDTkL+YjM2U7vD85dGuCiy0i/JAgdUOYO2OwrHoGPBv1L+mimXFucKgMqEBg+z14
         ILH34GshnBKSIsh8hikUsrvClWiYqjO07XWz+oI1m+EndwMtWoIc/PSQwBnxiuUuKHR3
         6opV1p46N1HSmDBiiEbyzK6D8VImcFj6LnLoKE0IxAKOJ8JX7q2MR5ZFbeSEXiyFPf2Y
         TuRA==
X-Forwarded-Encrypted: i=1; AHgh+RoDse6LKdZ8U8QXV2X8Kk3xTId5ibXxoEG/OF0LfOQGg7GImZu/aw/kqDIN7Q3JMCjT8zWKILjZZpaKWsLKADr6boac0g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2hVw1D5/oFcSKXkPU+e/rIp6xvx2cHNqLixZIWznJgqhZmGda
	9y7X4tO6dKk8UZzLXqQ4Rsl0Fc7nusMLBRtNnxtqPzWPMoxqnYQfaaSW
X-Gm-Gg: AfdE7cnYSwhEXIFnL/wtKb0guoyVgHJxPzLx6AK6qmdx24HkxYdCn72eQ6+haev247R
	8fWuAw40WrmpsjQTNY1NcZC0l2xO6Ap5+m0iqTe7S557rrHkUlg1OIbqKtFKYHidDEv85HfBt+J
	VaxY2TqzFIqAZ7fw/mW+B/IA7jGbq9Unwt47CwQ+qvUjL/ERFJB3r40AxRvFQ5gL+vRcrei78AQ
	ixMEcvnjtRQMqpRCD6e5Fxx7TZlmDq7RS9xNoMn6dKKYyIJhWUXdN2kReNTm/+5HBF0mM0Bt8vX
	oiU2secT0zV3g1UYsgeMkkXe5RBx4460Z6Vky+ZH+I/yVQ00X6MoaMd+9bTtf0/wcXZbLPlzwJn
	h/rEJAridU5+nyOObmdq6IaY0MID7bQXziDEkrAeDTNo9dF/xlLMyIrXFlRpkAR/j7iie04w8+A
	jEYkTjIE49MxRiG4jmBojjE/C0rVVwWn3dmrvt0QIkEAqqEwdT/x+5lZVcmOG/9MeS6A==
X-Received: by 2002:a05:690e:1581:20b0:665:2045:fe47 with SMTP id 956f58d0204a3-667c5a65848mr10794815d50.7.1784066081644;
        Tue, 14 Jul 2026 14:54:41 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678775d505sm17359640d50.1.2026.07.14.14.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:54:41 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mranostay@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4] dt-bindings: iio: proximity: move LIDAR-Lite out of trivial-devices
Date: Tue, 14 Jul 2026 18:30:20 -0300
Message-ID: <20260714215433.41259-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PulsedLight LIDAR-Lite v2 is currently described as a trivial device,
but it is not one: besides the I2C interface it exposes a power-enable pin
and a mode-control pin (the latter also used for the PWM distance output).

Move it to a dedicated binding file. While at it, document the LIDAR-Lite
v3: it is sold by Garmin, which acquired PulsedLight, and is
pin-compatible with the v2, so add it with "pulsedlight,lidar-lite-v2"
as a fallback compatible.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Hi, all,
This was on my plate and I didn't have a chance to send this before.

The vendor change is not a typo: see the discussion at [1].
Tks and regards.

[1] https://lore.kernel.org/all/c39a2980-f5e5-44aa-9fd3-20e0658f62dc@gmail.com/

Changelog:
v4: unify patches rather than using a series to keep the tree bisectable;
    rewrite the commit msg, naming the devices explicitly;
v3: https://lore.kernel.org/all/20251102221643.9966-1-rodrigo.gobbi.7@gmail.com/
v2: https://lore.kernel.org/all/20250801224112.135918-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20250701223341.36835-1-rodrigo.gobbi.7@gmail.com/
---
 .../proximity/pulsedlight,lidar-lite-v2.yaml  | 54 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
new file mode 100644
index 000000000000..60e60b7769ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/pulsedlight,lidar-lite-v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pulsedlight LIDAR-Lite v2 range-finding sensor
+
+maintainers:
+  - Matt Ranostay <mranostay@gmail.com>
+
+description: |
+  Support for LIDAR-Lite v2 and v3 laser rangefinders. These devices
+  can use a simple I2C communication bus or can operate in a PWM mode using a
+  mode control pin to trigger acquisitions and return the measured distance.
+  They also have a power enable pin, which can be used to shut off the device.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - grmn,lidar-lite-v3
+          - const: pulsedlight,lidar-lite-v2
+      - const: pulsedlight,lidar-lite-v2
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    description: GPIO that can be driven low to shut off power to the device.
+    maxItems: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        lidar@62 {
+            compatible = "grmn,lidar-lite-v3", "pulsedlight,lidar-lite-v2";
+            reg = <0x62>;
+            vdd-supply = <&vdd_5v0>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 435c4baab436..74b640c48598 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -396,8 +396,6 @@ properties:
           - onnn,adt7462
             # 48-Lane, 12-Port PCI Express Gen 2 (5.0 GT/s) Switch
           - plx,pex8648
-            # Pulsedlight LIDAR range-finding sensor
-          - pulsedlight,lidar-lite-v2
             # Renesas HS3001 Temperature and Relative Humidity Sensors
           - renesas,hs3001
             # Renesas ISL29501 time-of-flight sensor
-- 
2.48.1

