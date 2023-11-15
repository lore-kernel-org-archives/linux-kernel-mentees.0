Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709818AEF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Nov 2023 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cafCWZL1"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03390405A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Nov 2023 13:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03390405A9
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cafCWZL1
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_34U-F0ffHa
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 15 Nov 2023 13:00:18 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C5DD8400DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Nov 2023 13:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5DD8400DD
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so5301034a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Nov 2023 05:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700053218; x=1700658018; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSgLEiacSTK1nlXU5ESAjkt0zHh/T+kLWeSwZ58MCmk=;
        b=cafCWZL1cY6f/jTWZrurrw7Aj4SFcaOHnboZABlmryglFigYgFkjytdbGDepAwqHp1
         WDT8YPOsHPqQ3nLWplvSFR78QWj+E53b3E6lWwLRpYpEIv1WoGoM1CgtU9LApYm+OD7m
         vzu+8kB3g3w9/zhlLrpD7KnEij6Dhck7DAL4cjgamvQQCeX50avVLFgmeD4dsKo5g0wh
         BcmdADyRZL2DXCwXKcQTd9neZGzh0pXfcRfv3wVO3tRfrImL3jtiUAi0QsDtcPYPT5IL
         duABR6CtpPVZV+uJhhueUFZ5u1WLkfCZQpOPrnhROiYoaM6cM691juWeLaSOMe5W/uk7
         cliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700053218; x=1700658018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSgLEiacSTK1nlXU5ESAjkt0zHh/T+kLWeSwZ58MCmk=;
        b=del2NGiIl83UJjPxmNt8Mg31IhhOzesOWFQlqe1CHX1+BRywN1QH6FsQpW+W6IyGNk
         HiatvN4JQEb4VpOrbkk5qJ0Kc/pd2R0w4IiuYIcnbgfDqdDP+5MSTnBmou/kspQ1KNNu
         BTb6mSaJv7TGj6EAbTBwt3Xxm9Z9ZWjXBNyD5LdMJSwi0y95/Ri3BacFoysidiKtzVjl
         Kj9BoyPmLAzvnMp2QxoXICY15N3mkRn11iRTInbJT27YdYiqyEj/oNlay6KlInL0tkS4
         KuaQw+Eb5a2P0GcYBWsCRTJ9LIqGSS+mswaCIgDkcPylLkQdL15XK3Go6MZZcq1BSBG6
         sHJg==
X-Gm-Message-State: AOJu0YxTneX/Yef8LJo6iv6dlcAz9h94LwoM38DXKoVdWv8ibNSpET0q
	6LwzmKkAQIaI+NIJ+q8gLh4=
X-Google-Smtp-Source: AGHT+IEB3HkUt0kuClIyGcyxmuuwyVWGHuf6jlIwovd8wEjdCAC4O6BE3n+d1PDNS9dMndhgntvhsg==
X-Received: by 2002:a05:6a20:158c:b0:15d:e68d:a850 with SMTP id h12-20020a056a20158c00b0015de68da850mr14124970pzj.29.1700053217925;
        Wed, 15 Nov 2023 05:00:17 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id fh42-20020a056a00392a00b006c4d128b71esm2812867pfb.98.2023.11.15.05.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:00:17 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: trivial-devices: add aosong,ags02ma
Date: Wed, 15 Nov 2023 18:28:07 +0530
Message-ID: <20231115125810.1394854-2-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115125810.1394854-1-anshulusr@gmail.com>
References: <20231115125810.1394854-1-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for Aosong AGS02MA TVOC sensor.

The sensor communicates over i2c with the default address 0x1a.
TVOC values can be read in the units of ppb and ug/m^3 at register 0x00.

Datasheet:
  https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
Product-Page:
  http://www.aosong.com/m/en/products-33.html

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---

Changes for v2:
- Removed device from trivial-devices
- Added standalone binding with vdd-supply property
---
 .../bindings/iio/chemical/aosong,ags02ma.yaml | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml

diff --git a/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml b/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
new file mode 100644
index 000000000000..4a0278c6318c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/chemical/aosong,ags02ma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aosong AGS02MA VOC Sensor
+
+description: |
+  AGS02MA is an TVOC (Total Volatile Organic Compounds) i2c sensor with default
+  address of 0x1a.
+
+  Datasheet:
+    https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
+
+maintainers:
+  - Anshul Dalal <anshulusr@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - aosong,ags02ma
+      - asair,ags02ma
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        light-sensor@1a {
+            compatible = "aosong,ags02ma";
+            reg = <0x1a>;
+            vdd-supply = <&vdd_regulator>;
+        };
+    };
-- 
2.42.0

