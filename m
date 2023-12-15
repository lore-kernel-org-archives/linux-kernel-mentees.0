Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9895924B4E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Dec 2023 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwWyKGkT"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12C5D417B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Dec 2023 16:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12C5D417B1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kwWyKGkT
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wYYhyNYBLWvL
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 15 Dec 2023 16:25:32 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9E8AA40246
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Dec 2023 16:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E8AA40246
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d38bedd799so5363025ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Dec 2023 08:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702657532; x=1703262332; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggW+Hin3YweLGTCQFbER/wgiOuVUGGluSvES+5w5My4=;
        b=kwWyKGkT3zWMhqwGS03xiOeTDXZ7OqoLx6WkMh8o0GUc0qDbVg77SvozAqbX3q+rFj
         ijAvBsBBOOjoDtWQIcL4QSDM9EOGBDcxxpPbvnUgMOcwU4WQuBUcMmtGIivHYvqx3cdn
         MAR0MMCLAFjbS3ghwU1CLgixvdSG4A3c0N70NDo+/mzVF0Szjr7HkotVafYcPhGr7lUx
         T1Mr9bNm8L9ZoN23oQ8/htCTt0qvJvtM4nh9blupzHPtsKPuM6AzZ238HBxdQStMzoNM
         oqs1gy8SUJRaN6hVRxAZxjlE2GBaDKAKxT0pax3AW9UGdBlGK21+GQH7UeWn0bLcnIFL
         lvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702657532; x=1703262332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggW+Hin3YweLGTCQFbER/wgiOuVUGGluSvES+5w5My4=;
        b=VAdZ2OyLMLGcomx3Ja9VJmfZXg260q43YhQWAXfHGsjfUsQnkDtTGEYcGYoVWS6y2g
         MgtTBV8Osy/F4PbFPS7ZVYz+FLLRky+MxeLcbQklZmZXt/RfpfQjFn+TE7s3EWVSp9r2
         9iioK9RtjsHlEDOHnMLnn36giLjJ+p43N2cVAhjhrvMFIYSU5+NR6Ewh9vJHKz3B8UAE
         w5zxBi/GSp4F8SEXbgns6ZuerGjn60vpYswvtfA3JogI1ijUhV9zEucRmsj+C1CfYbZD
         WtgI9hkddbyZ9T3zTt04CMLhhqtm/m+bePIxRB/epNGu6NGsTO68AMwCH277582VvVIK
         TXeg==
X-Gm-Message-State: AOJu0YzFuOm7K9tc9FBBdC7ch+O/3tRSQdhFIWUm9ENJzbjceXuI+aY2
	VlhMgw0Ur8y6JmL73cooAyE=
X-Google-Smtp-Source: AGHT+IEZkZrISCa/tBzbEB2K6p4h7wFtOEwKMpl2olxVPhly92wynedxoiejUlKaUpDsKvTYc0YZkw==
X-Received: by 2002:a17:903:234c:b0:1d0:c418:1758 with SMTP id c12-20020a170903234c00b001d0c4181758mr14588199plh.66.1702657531891;
        Fri, 15 Dec 2023 08:25:31 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:581e:798e:871c:98db:5638:a4])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902989000b001bb750189desm14468665plp.255.2023.12.15.08.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 08:25:31 -0800 (PST)
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
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/3] dt-bindings: iio: chemical: add aosong,ags02ma
Date: Fri, 15 Dec 2023 21:53:10 +0530
Message-ID: <20231215162312.143568-2-anshulusr@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215162312.143568-1-anshulusr@gmail.com>
References: <20231215162312.143568-1-anshulusr@gmail.com>
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

Datasheet: https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---

Changes for v5:
- Made vdd-supply a required property

Changes for v4:
- Changed node name from 'light-sensor' to 'voc-sensor'

Changes for v3:
- Fixed commit message
- Removed "asair,ags02ma" compatible

Changes for v2:
- Removed device from trivial-devices
- Added standalone binding with vdd-supply property

Previous versions:
v4: https://lore.kernel.org/lkml/20231125100139.193584-2-anshulusr@gmail.com/
v3: https://lore.kernel.org/lkml/20231121095800.2180870-2-anshulusr@gmail.com/
v2: https://lore.kernel.org/lkml/20231115125810.1394854-2-anshulusr@gmail.com/
v1: https://lore.kernel.org/lkml/20231107173100.62715-2-anshulusr@gmail.com/
---
 .../bindings/iio/chemical/aosong,ags02ma.yaml | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml

diff --git a/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml b/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
new file mode 100644
index 000000000000..35e7b094e878
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
@@ -0,0 +1,47 @@
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
+  - vdd-supply
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
2.43.0

