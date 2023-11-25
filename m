Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917FBCA4E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 10:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W37wwGJr"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2245B82182
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 10:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2245B82182
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W37wwGJr
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q1kaPqnG45Qe
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 25 Nov 2023 10:03:39 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CD38E8217F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 10:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD38E8217F
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2859551886cso816304a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 02:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700906619; x=1701511419; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iz62r/C3lhJIiAyG0rSIQht5mTyspTFd+aVvpYLeNXc=;
        b=W37wwGJrYH0ZvryjTwV10tzeHWy6f7oEx+FCagTtXY9TvUUEo2a18htacFhymIHZqU
         KPxkWPh9BRRK/D8lOVEKWFAR8NaIzuFVrQ4IwbHFS7dkQMYtRefY03jhsbZLcoGRcVaR
         fF+oizxwjuFwoGfH8OjTMu6WnhCyEpTXtXfrX9O9WNUI4xQujJuwjJKHcOtk3dxjfmsh
         ofF/14i1b4kH3O9HE1kiiVJyj7HFuMFPHIBY8kAEVBvUUptkI+tVovneXIr6AMrEBAaZ
         xxk/XyiIR1HYak73a+1HHoI3FF0Z9UgC9/Jc2wgC7F4LbdlkRMX04jUmkyrYHSe+Vr/m
         0w9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700906619; x=1701511419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iz62r/C3lhJIiAyG0rSIQht5mTyspTFd+aVvpYLeNXc=;
        b=tx7480/3d4oz0Asc9afWJqRn5Z8N9EU+MHgkQKFgSY3PRSWdIdtYzEBtE3tSc1pfV2
         xVYirCwTyA4PEy2lMTZfew0djAJQfrqEdeNJoeLTOF9xV/8aD1jKRGppNHpFJ4oq91d7
         k3cjrwa8czq3JITyI+90Xv2ry47D/MdmUyFG0tI2gYXC8bxdHa97tJYHReqywA1J7pio
         n5ZgjcgYRq+GzS7hGy3WYkHmwqKv7aRasexVkN9hXBILhWGCBhCp86wRF1ruvPxzoJMR
         fp0+LGwlqShY88lUIjBgN6scwsFJghw0HyYwdR13dadD9W70KUDiPqnvtH/pKEY4xJD8
         QwFg==
X-Gm-Message-State: AOJu0Yxksx552xIAM9J8zMOfvlyHxdDijteXMHJ8z8XNcl3iADmKsNWr
	Z44p6vrOyI+NLWNXvJecjAU=
X-Google-Smtp-Source: AGHT+IHVDWJ2l5HKfO1SlHDnf7mSIMRmvTPrTYzdySKCDbInF9TRNcAvUc5/x0B5tf7JUfHaPUl4ew==
X-Received: by 2002:a17:90b:1c8b:b0:27c:f309:f381 with SMTP id oo11-20020a17090b1c8b00b0027cf309f381mr5819834pjb.6.1700906618700;
        Sat, 25 Nov 2023 02:03:38 -0800 (PST)
Received: from archlinux.srmist.edu.in ([103.4.222.252])
        by smtp.gmail.com with ESMTPSA id h24-20020a17090adb9800b0028593e9eaadsm2049035pjv.31.2023.11.25.02.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 02:03:38 -0800 (PST)
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
Subject: [PATCH v4 2/3] dt-bindings: iio: chemical: add aosong,ags02ma
Date: Sat, 25 Nov 2023 15:31:37 +0530
Message-ID: <20231125100139.193584-2-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231125100139.193584-1-anshulusr@gmail.com>
References: <20231125100139.193584-1-anshulusr@gmail.com>
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

Changes for v4:
- Changed node name from 'light-sensor' to 'voc-sensor'

v3: https://lore.kernel.org/lkml/20231121095800.2180870-2-anshulusr@gmail.com/

Changes for v3:
- Fixed commit message
- Removed "asair,ags02ma" compatible

v2: https://lore.kernel.org/lkml/20231115125810.1394854-2-anshulusr@gmail.com/

Changes for v2:
- Removed device from trivial-devices
- Added standalone binding with vdd-supply property

v1: https://lore.kernel.org/lkml/20231107173100.62715-2-anshulusr@gmail.com/
---
 .../bindings/iio/chemical/aosong,ags02ma.yaml | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml

diff --git a/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml b/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
new file mode 100644
index 000000000000..c176a6e102ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
@@ -0,0 +1,46 @@
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        voc-sensor@1a {
+            compatible = "aosong,ags02ma";
+            reg = <0x1a>;
+            vdd-supply = <&vdd_regulator>;
+        };
+    };
-- 
2.42.1

