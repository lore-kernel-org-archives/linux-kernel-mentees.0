Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4327A3C696
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKMKX0hO"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1D6A404F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 09:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1D6A404F6
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FKMKX0hO
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7wBtc4dQmcH
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 21 Nov 2023 09:59:52 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9195A400E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 09:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9195A400E2
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cf59c07faeso13731155ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 01:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700560792; x=1701165592; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrfj6UPeZoHczBeA8a/k7Z115LACW+cZYO5wipNfSf8=;
        b=FKMKX0hOSSRywsME7WIoEFkEGTRYRED9wnrbIKqiHCdleyoGnl2EBSNMeHPiMwIWNp
         yUiWoFXF/ox0Y9I1Eh8xu7nsAMleZ2sDwxdyjnbwpogR/UHLSLWGuJ7dn04quWKF//B2
         T8Rqk4KJ5JjDEdvQtUmUi0h9KjalT+w2r8X2k/1DlibqRLVpVXFPTtr7cDYX8uNqVWyr
         fY42xeN9hQ20NSdTfKZMdqaqudXhA8yo5solxtqeUBD7BA5Iu7clEeQOsg5uwsfxRZrI
         uQLhbG8J81xL/uIxOV7mwIRBH9DqCFUHnJeRFlQRGpFHrFqJeV/lDD5yF/3K1RElhyQl
         PGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700560792; x=1701165592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrfj6UPeZoHczBeA8a/k7Z115LACW+cZYO5wipNfSf8=;
        b=hOWYa4UaikV2KagrTh0sr6jO1jMSau1MU+hHa3fb2lZf5w+PE2m/WzVDYB2JGEBsKa
         OHAFqvtFNtYEOjhN6oD+NoJv8W2tu9JnFlx0yq6pWLVUY4V/a1SoXs/uckekGmhWYVR1
         SjTn+sYKj3vgvNCnaj3viFNmkxkJphYd8myMO0bvomsH7j+ThzUo2g+qRWImDUaqsptm
         Uyf3pXm3LphtgCRK5t4c+1WShMQdaAlnoLyR2+HEZuvKJUCf4zclaIGbkhOSdF67LVax
         PKn+ABHlnh2qwWlxuxMTtchl38C9qwqsELgrc2DqClpXBAD+h+ARhckf95nNaafvgW6T
         1RPA==
X-Gm-Message-State: AOJu0Yw8j+KsTgGyGDhOEDhCnDqANUC83/qLwCGNOTIYdqCIasFaOEr2
	gkpfzZj6cdR/+FQXUGRI06uEr3GZMAEJsQ==
X-Google-Smtp-Source: AGHT+IEIXF6IuanJX0SypgcM5AVpesNrRUzidirxQpdqMDXPyYBNQbC9KJM8rDNJ7vJgaeOWUm3EFA==
X-Received: by 2002:a17:902:ce81:b0:1cc:6d2c:fb59 with SMTP id f1-20020a170902ce8100b001cc6d2cfb59mr9790531plg.28.1700560791815;
        Tue, 21 Nov 2023 01:59:51 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id c14-20020a170903234e00b001cf68e1c5a1sm2047415plh.4.2023.11.21.01.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 01:59:51 -0800 (PST)
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
Subject: [PATCH v3 2/3] dt-bindings: iio: chemical: add aosong,ags02ma
Date: Tue, 21 Nov 2023 15:27:58 +0530
Message-ID: <20231121095800.2180870-2-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121095800.2180870-1-anshulusr@gmail.com>
References: <20231121095800.2180870-1-anshulusr@gmail.com>
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

Changes for v3:
- Fixed commit message
- Removed "asair,ags02ma" compatible

v2: https://lore.kernel.org/lkml/20231115125810.1394854-2-anshulusr@gmail.com/

Changes for v2:
- Removed device from trivial-devices
- Added standalone binding with vdd-supply property

v1: https://lore.kernel.org/lkml/20231107173100.62715-2-anshulusr@gmail.com/
---
 .../bindings/iio/chemical/aosong,ags02ma.yaml | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml

diff --git a/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml b/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
new file mode 100644
index 000000000000..38ba3614ae8a
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
2.42.1

