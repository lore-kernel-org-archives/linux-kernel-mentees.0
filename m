Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983953793BF
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Aug 2026 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389708; cv=none; b=nJsxzcp4mR2uf029IvYzNbD8LtGvtH4VvDgbO3Sjjnu4J3TQ5A0PrBz+W+N/0jbB/UdDRAXWmMxVYkWYkVEjOHgMbXiStQyYY/U1LC/6mXcI3aDTcucKe36Y/Ujq72qIcGE5/LEV0N6Gu2lVnONmmFEzg+QooHGie9YC2f2BQd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389708; c=relaxed/simple;
	bh=uD1oO4cs8uZhXoXFc8b/g7W+blWteUgwWte21V3SUJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lds6obApyCQz/1wsXcHCJsfzLKfE5Tp9Hfnf8oBqjl45qhPkgCBG8FVAvi2MtvA4aCiH7OtP6m6GNRpBIqdwq+oKx67Lv8J1DVrAbvMaI0Zaa/YiKl0P0wBiE2DdSkF6SWiXclbaKsgc/Bw+sNpbuUT+4eVp89Brx65Q2ugUv6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqS1hYaB; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqS1hYaB"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6682259cae6so2294760d50.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Aug 2026 12:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786389705; x=1786994505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuRXCZdD9fwaj8LGoLIYzfFtr1/F5wEoiyIlug7kGCM=;
        b=jqS1hYaBIP/BqgApfCiqzirN2I/w4DmQ5DkJbNJ3YeuJd7bBEBc2XbzZZD3MMECugp
         NNN+JYxvqYx0++EDPkuBjFQwN/LAZcyJdKKXrezbxO2hS411VC3o3n9UlosHkBqX9klc
         oF2kJBpDQF+YCefKat93FI9tUEBq3WtdhMFStH36SIfagstqF4g0oj9ook7+ZBBwx6G6
         yC5UUjrAR7qO4oVJdNWemf8xGtKcxLJh9JcjbOfSOTFIo2Lb5rtlBkvAmGV6uIsoj1g/
         t42kKGGW9Z3Gus9C2c3cBQDi9kjILnR/ijoxhCCpmhgk/KmUgU6U1/BJBXuV1+b6WCLN
         n3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389705; x=1786994505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuRXCZdD9fwaj8LGoLIYzfFtr1/F5wEoiyIlug7kGCM=;
        b=rb1k7bmTL7jt5PqaUtgMG7gy7R4td9g81vOsI5as9Y6noqkC2YFhkep9ILNA9Urg5N
         7+MBp7NaDKMLHXHq+Q/XOIpRWJ/kZqDTTTFLNKJJZanPZd3K47gqwCdgQPgBKtn7IcJ9
         ynADWmebk6/k+Jsx5gdNQ3Bo6V4+9RjeRJcQ5NsYz9cIRGUXNsQplIIFrRfIiBAyokNq
         u+P/1WTUX0PS8UVAEa6YNd6e2MtxK12hWFT1AqgNiGjmkmTskYk5qEPpVbWXCfnQiHgA
         dzlp2JdOj/GJUWExqq6GFEXRy5gv0L8tqEYhysAv2yJ5e1Arb/xf3KRZLy69MNIuVef/
         EepQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/jhbg7g1FQcHIxzNaw5d/4CbZOaqcHVWO2hL81g24BG4vdVylPkU+FQJYMyG9q09O/sBVCWLMIce7FGHtrDRTMFJkRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywna+kxOqj++N88u7ET8W9N6Ra0S8lFxCtIKV6iHjJUIQUrr8za
	zAZDFMislogx8fqX3NfTAuX5TeZFF57CMFLjH1JCmVm5M7X/kIDo3AsA
X-Gm-Gg: AR+sD11wWqhmY4WgbZ1qpEwPMWd59jQjvLCC4vwlK6OL6elx/feGTFQOCiQahU2LCTS
	7yPGd9jHeOUe8dlLyc7gdpmbYBWcn6/zxNV117hQt4aHVuBQCXDhTZX0GGx9QrOd7/juQlr0wLn
	AzD5s0Wuy8igY7iouztWNyWSoyPn+fzdF5ulmbyNtD5sBiMOEgrE8UqJsyYsa2NSLwpD3Ig4CXh
	u8EOWL5wKvttuARx2ytIsOe5HuR6DbgziA3suAzH38mWmP5UUorIFQL+CQeUsZfK2HzxFhVcdhB
	AkCRNh7lDUcgdqusuLu++aJvW/geLt1xwjtdgByi3uCH2B+RWg9lvgc17yj7JeFdOESYSY35+0A
	Zb1jqmT8m5uZ6MwpxkJETWmZmgwBowPC5+fA6ctijseKLwkmygkHffR7jfiTi5l3tsWZn9IKI93
	QExTmD3B4zDqUscWK3GnTjvLNvYsaPTcn5SulaKgoNcDgusym1glv58PrGJlI1dGsp3FkNnFHfW
	ndyYw2N29x9Zs4qGcoj9xeYVFr/UkwBYxvQMMbBcW4527OWfosBTUA=
X-Received: by 2002:a05:690e:4850:b0:667:b57b:8689 with SMTP id 956f58d0204a3-66b122c09cbmr2012592d50.15.1786389705290;
        Mon, 10 Aug 2026 12:21:45 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:5c54:b9f5:beef:8bf4])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acafa90basm6928863d50.16.2026.08.10.12.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:21:44 -0700 (PDT)
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
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: iio: proximity: move LIDAR-Lite v2 out of trivial-devices
Date: Mon, 10 Aug 2026 16:18:40 -0300
Message-ID: <20260810192131.153495-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260810192131.153495-1-rodrigo.gobbi.7@gmail.com>
References: <20260810192131.153495-1-rodrigo.gobbi.7@gmail.com>
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
---
 .../proximity/pulsedlight,lidar-lite-v2.yaml  | 64 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
new file mode 100644
index 000000000000..e19c8d166b81
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
@@ -0,0 +1,64 @@
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

