Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BBB3822B4
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Aug 2026 20:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173089; cv=none; b=l/Ar88K/Y1CjritmnCV/jxnzLwNWZiTLA9CbmTS/wW1ZlSCGk0on/MtVE+dFu+Yi41btRF3JH9t65ZC6a3LDDsn3vBit+yuHD9jBEZBNYsqzfi477cKnrbvo0rHXySa/gyScywoKmslYD4j5Fv71p5jabK3MSKNbvC0ZtLYVQU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173089; c=relaxed/simple;
	bh=VWRz7lckxRcd4cXpSu6pW5+eqN+XGzez1DeahohpRfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GBomhXXuZR/YulCwj1M6XBstZzIl4z4zTbb/rvSyilzJNc4MjdgmN+Ji32r8rwxpGFhvxZ12TBjF+LFWNtdnqC9IkirdrdngnskE0PHPiFg5oOa9+UkBcOvxb8YtYCXVOSaBAwe+LxSi7KeKHILQ9p2dGMhqWiqorfFMvrtafxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQWiSa0o; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQWiSa0o"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97bf8f395f5so774132241.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Aug 2026 13:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787173087; x=1787777887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEb/XcRzZMGFqqe/Z3DOazNhxu8ChafO/d8R+t1b82A=;
        b=GQWiSa0oKJtvMLMfX9f7y/PRywJDeQfgmYT8AcI07vXH11AW7fjKwgVGBVPtIjGMZT
         SAxdUbHZ9NldBPWfcu/VgvRu66umBmiK9hiyE+crfP6Sc5At86RNKYYmea08aIdeVuS0
         +rNdnLMaVuhERDfdnkghDNzWghZ1re9sVbAS98WJ6eZC/O6nDVMmEokqQdACPCvl7MJC
         6eOYo+FgbDFMdfBwmtRxotUyeL8VXsJpknHnRB0oQs31pMjQjjVSbWe+Sr8gJJeMyXxy
         +ia5pB29F6CmrK2ksE906OpmtJnk/jyotyJ8qep8CameU78xVgVKmmuE/tyNLoDpQ/m/
         dKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787173087; x=1787777887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YEb/XcRzZMGFqqe/Z3DOazNhxu8ChafO/d8R+t1b82A=;
        b=sCDE/DKOCfN9IkJUn2Il+77vrKbMZcAfbpTogjUWCve7WmefKAygH3BbrYZ9QQqnm3
         4HsnpDZB5j+bfGzri6QfbXmEaHlZ58isx14GIIqhSYVTWMzPdsbRcY6OXQ82wkr55vSE
         TDg6CKvygEuYniOlPSwz0uI8OSuZUTkD8hdJccslpxCCV8QbSopamvIiMX45MIsqQwdj
         MO0VP40b+NhjUkAohZmh3yje1vTzt524ikCHYTMJEHKdkQJoDjfKP/ERpBS5P1xeIpJO
         9eVk5NZViKM+Xq6hYK3aIq7Bk0atT+1d6i2lDUw8KBd7ZwqNEuV3+rDqxuQf+tABR6kz
         lWFg==
X-Forwarded-Encrypted: i=1; AHgh+RoFPVmbkeKZCGET6zopOWR6HJQh6vj0C8RS/wXVENnRI2IcmYpLYyfWTaTqYARu19cfXQoxFmho7plOya6TrSzX8lrABg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUmhtXt3BWwWmRx1rHs2QofnPC4PItw7mZkljqAUDZ80OZODKE
	AxDjAPsgoJLWxOiTZYC9rQUJj5mz7LRNcBT6L2rafuEIY5mwcc2TlHx1
X-Gm-Gg: AR+sD11fYOmGgrk6wXNCmJ0X+9seCXLxmrerHmmcd3pHK6DR1VAO2uX8u9kslJG4mUV
	npOep79JdtfuJdyf+i9XJVZ8CkzuY4M0r7uphaXviX6mfNOOK9+s6oVWWTlfCg1+UY8U3Wg8vXq
	RD1ar1PHoiAgfcbQpPCmAZymT/L5BtWL2Muy0MMpy7/ZukpdlE9G3oO9FX8aekeh6Vhq5n0VZk6
	wF/pYvYXdnqL7g34mmm5Eluy4LzJsRxQ6Qeo3rvYXYvbJULVbg5I+AhQ+0x9fI/txGHs6F4filQ
	AE4zmvqaX0724/pn+uKVyFqH/0/JAc7edDqsQOaKMDS3fpKOkZiLlIqY9FrWiuMPokpF9v0Kk1T
	/G+zNso/bHMiQ337EMFIEgn4TZ0O40eqItOUbCyPNdESibjVN/UimB3sarVwiHMHEHNNuBWTOF8
	FSx4omQ7wTvljRu9uQ+UvnGN5gjW5/dh5Smp6cPjGCRUuTjYM173+gU6sUNruqG/pqFzH/eEER4
	Xdf6CapJin4gsAgFoR6CmmqpS34YPI9ug9T1liLC08=
X-Received: by 2002:a05:6102:a52:b0:778:f972:32eb with SMTP id ada2fe7eead31-778f9723986mr859098137.12.1787173087170;
        Wed, 19 Aug 2026 13:58:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:3443:53b2:2e07:b3bf])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777ddc844besm3616259137.11.2026.08.19.13.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:58:06 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matt@ranostay.sg
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: iio: proximity: move LIDAR-Lite v2 out of trivial-devices
Date: Wed, 19 Aug 2026 17:55:17 -0300
Message-ID: <20260819205751.166030-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260819205751.166030-1-rodrigo.gobbi.7@gmail.com>
References: <20260819205751.166030-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PulsedLight LIDAR-Lite v2 is currently described as a trivial device,
but it is not one: besides the I2C interface it exposes a power-enable
pin and a mode-control pin.

The mode-control pin can trigger acquisitions and report the measured
distance through a PWM signal, entirely bypassing I2C. That usage is
bidirectional and non-cyclic, so it doesn't map onto any existing
binding for describing pin behaviour, and is intentionally left
undocumented here. The same pin can, however, also be used as a plain
status output while I2C remains the active interface, which is
described through the new interrupts property.

Move the device to a dedicated binding file and document the
power-enable, power-supply and interrupt properties that
trivial-devices.yaml has no way to express.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Matt Ranostay <matt@ranostay.sg>
---
 .../proximity/pulsedlight,lidar-lite-v2.yaml  | 65 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
new file mode 100644
index 000000000000..491960bb3a0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/pulsedlight,lidar-lite-v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pulsedlight LIDAR-Lite v2 range-finding sensor
+
+maintainers:
+  - Matt Ranostay <matt@ranostay.sg>
+  - Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
+
+description: |
+  This binding covers the I2C interface of the Pulsedlight LIDAR-Lite v2
+  laser rangefinder.
+
+  Besides I2C, the mode control pin can also trigger acquisitions and
+  report the measured distance through a PWM signal, without using I2C
+  at all. That usage is bidirectional and non-cyclic, and is not
+  described by this binding. The same pin can also be used, while I2C
+  remains the active interface, as a plain status output signalling
+  when an acquisition has completed.
+
+  Datasheet:
+    https://github.com/PulsedLight3D/LIDAR-Lite-Documentation/blob/master/Docs/LIDAR-Lite-v2-Docs.pdf
+
+properties:
+  compatible:
+    const: pulsedlight,lidar-lite-v2
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
+  interrupts:
+    description:
+      Mode control pin used as a status output, driven while the device is
+      busy performing an acquisition. Can be used to signal completion
+      instead of polling over I2C.
+    maxItems: 1
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
+            compatible = "pulsedlight,lidar-lite-v2";
+            reg = <0x62>;
+            vdd-supply = <&vdd_5v0>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..6a7ee45842e3 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -400,8 +400,6 @@ properties:
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

