Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F18D531
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 Nov 2023 07:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUa9dy7J"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7A3E83B80
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 Nov 2023 07:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7A3E83B80
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dUa9dy7J
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ADmceEkq0tQ
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 17 Nov 2023 07:47:38 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B947483B7F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 17 Nov 2023 07:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B947483B7F
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6c431ca7826so1577833b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 16 Nov 2023 23:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700207258; x=1700812058; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XZ+bpR+GYXI1dYrwmpsx3LyIpqyeS55MKPy6ULRoi8=;
        b=dUa9dy7Jyb/R6Ex1Mnm5iN3SUHnPkOWpmCovjedbnm/d1WTVmNrg09FdAFhPQrojXj
         WGDQeajBncO2Ez978CGZbJDfy7/bq5037OANo3e0jOQ84c7egyNao+pubOpwWDeWcVgN
         AUAOGh6jhcVlD900LjrqZZ7vogKPQ3AcVDNsIWb3n2Uq6hWgP0CMfTJyip/PjYPtB372
         TuZ+c3Aj0OiXkK385qb0JxQCCjkFHm5KDrn8Zk3PPxsXQsJJvdE3d+15p1zOvDoDJPT8
         /BeC8GBWt/irkf+W4PnewhEAeG7lm/ttN65S/vML6Eydjuo423ocY8m7nmtB+qH7jjdJ
         K34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700207258; x=1700812058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XZ+bpR+GYXI1dYrwmpsx3LyIpqyeS55MKPy6ULRoi8=;
        b=CRDT7GNs9fVQ3N4SD9SXc4CavjfGeJZUcihvwesQ59FD/m1EzSUp7kwSzE1e1AFK+P
         fkcqlWM1qxd9cm83ADap8WOkDmaIgzvHrsf5O1woZ8/sKGNQhpuJgRYVaRR4bTz7sDEU
         Luz3TFDzoOEQMzxilDgZSDLT+uK3V3+IrAiEZxQfAQ0oQMOkExxPcZkqn8fuzZSXI+T2
         XgJNgCYqc2ku/rsJx8EEyAt6rNAq2CP1Rtaj78jMqq2540CRQ+0PcGvaiLXd7UXsp4Mo
         S/JUrWtOmFS5UHJTUQMaRLSInhwyfveq3pql4qwcJo9G+bX9dXZxEEDFTJhfPy8MidIV
         LWPw==
X-Gm-Message-State: AOJu0YzkSTkR1Sy0kSszsJCIzt3+C7aQmkMIQABxcPJCLIGnCwD03vsd
	p5sQ7U0Y7Ptg0v9tzC2woUk=
X-Google-Smtp-Source: AGHT+IFwcIo97MOV0GGbVZAt8q3V0mlq6OF09rSEFW131Gzc0pADAo1EAFoUCE8+jHLI+4uS3hImkg==
X-Received: by 2002:a05:6a00:140e:b0:6ca:2b55:58b7 with SMTP id l14-20020a056a00140e00b006ca2b5558b7mr7574827pfu.20.1700207257927;
        Thu, 16 Nov 2023 23:47:37 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id p16-20020a056a000a1000b006b5922221f4sm870110pfh.8.2023.11.16.23.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 23:47:37 -0800 (PST)
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
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 1/2] dt-bindings: iio: light: add ltr390
Date: Fri, 17 Nov 2023 13:15:52 +0530
Message-ID: <20231117074554.700970-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for Lite-On LTR390 which is an Ambient/UV light sensor that
communicates over i2c with an address of 0x53.

Datasheet:
  https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-390UV_Final_%20DS_V1%201.pdf

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---

Changes for v2:
- Added missing properties in the example
---
 .../bindings/iio/light/liteon,ltr390.yaml     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
new file mode 100644
index 000000000000..5d98ef2af74d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/light/liteon,ltr390.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lite-On LTR390 ALS and UV Sensor
+
+description: |
+  The Lite-On LTR390 is an ALS (Ambient Light Sensor) and a UV sensor in a
+  single package with i2c address of 0x53.
+
+  Datasheet:
+    https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-390UV_Final_%20DS_V1%201.pdf
+
+maintainers:
+  - Anshul Dalal <anshulusr@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - liteon,ltr390
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: |
+      Level interrupt pin with open drain output.
+      The sensor pulls this pin low when the measured reading is greater than
+      some configured threshold.
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
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        light-sensor@53 {
+            compatible = "liteon,ltr390";
+            reg = <0x53>;
+            interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+            vdd-supply = <&vdd_regulator>;
+        };
+    };
-- 
2.42.1

