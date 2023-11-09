Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4C410A23
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7pg5Z6n"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB26E6124A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 09:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB26E6124A
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L7pg5Z6n
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8nJHo-C9gno
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  9 Nov 2023 09:06:49 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D8A3760F2A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 09:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A3760F2A
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc2575dfc7so5216905ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 09 Nov 2023 01:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699520809; x=1700125609; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5YF1mhym/Q5SMEev62zt7snyiNJO7d0PvYNhuYeeqE=;
        b=L7pg5Z6nE2Qr+dGJd8NnDsaI/UQ5CSWtZ1shfQIU53Qb4LWx8Az5NWm8MfxBlVoRxO
         iEBMZT6A7kIhgA1+qXuFWvpA94zUH93g4D1SaRDB/EXoWBo+c4luuB+NjHE+NigI62Yd
         8KE2OodfFFbjVrCn9vISciBfJforWEw8zAAX64aeUPWK2TNvj8ckFNFmsjtuIjusvum1
         7Ablpx1noEn5JZ8U6FjgJA06TzrWl/xlIn0UKVdQQHXv1fNRHG+4kD/yRyeNJCcm9IRX
         xGfkwUik4dUN1qD9if9emfGzFZDR+ER8uu/H4V8VKMeb4xpP5f9kW6Wu61l49+uJzdwN
         9+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520809; x=1700125609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5YF1mhym/Q5SMEev62zt7snyiNJO7d0PvYNhuYeeqE=;
        b=OcM1KAD8SsHeXvGwpuHF1INq3z0I4/u1ty84O0sUpb1JlExtAJCK3gSohD0Pa1B9kD
         GwrNZmKqzbj5iwcy8gAQsZPK8HbXqGMs3GWyvspUur8pffpPUQGdp6hKRl3eNufBQxvV
         jPdj/jnyV+KpKfnt4v4o17SbTNdrx2VWOChDZR2erzFSfi/NSmClhjQFxdqdeF9TLYc5
         LGH8og9EAXl6bqFEBilUrGtsPVCMwYMgms/hpLbq6ElbSf72ujXCHla5UEiK2iny8K4h
         XbfyWZTtnvwJqIgivXZLVMg9NJLRR9NZXqvcTrT2S5gkd/g7e6xJvSJWVVnGoPTdZVsK
         u+Bw==
X-Gm-Message-State: AOJu0YzjcvZUtUeVUaY9w4TlO6KRV3lM+DCHm34K7LjwUp/9Tn3fvHE8
	YZhCeJILp8DTss0aJtd8Viw=
X-Google-Smtp-Source: AGHT+IHpxuw4Y0T35Aw4w3pOI3If9f2PAE66GTL8rfrzRIIwH9aos1ks47m6+jp20RSPJRwFSOKbmw==
X-Received: by 2002:a17:903:2447:b0:1cc:2f9d:6e9b with SMTP id l7-20020a170903244700b001cc2f9d6e9bmr5530340pls.20.1699520809131;
        Thu, 09 Nov 2023 01:06:49 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id jj17-20020a170903049100b001b06c106844sm3036318plb.151.2023.11.09.01.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:06:48 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: iio: light: add ltr390
Date: Thu,  9 Nov 2023 14:34:53 +0530
Message-ID: <20231109090456.814230-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
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
 .../bindings/iio/light/liteon,ltr390.yaml     | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
new file mode 100644
index 000000000000..90c20076b6c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
@@ -0,0 +1,51 @@
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
+  Datasheet: https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-390UV_Final_%20DS_V1%201.pdf
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        light-sensor@53 {
+            compatible = "liteon,ltr390";
+            reg = <0x53>;
+        };
+    };
-- 
2.42.0

