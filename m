Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CB01C2334
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 21:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726175301; cv=none; b=Er110Vxl9MAMdimcdZB91Db7oczMJqlhSdS/FfOn/lD0PG4ZLWjQRsmkwNwmktI6NN6aGefI+BFxyFqSWSLOKrgUMXr/odhtyeAMeNbgoeMtNym4usMTQGImC8h9vZn1C2TGgtuycieurfHEaYIouqQjaBxaqtWoCg+uah73nM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726175301; c=relaxed/simple;
	bh=oQI72NURFp+bgiD6sXVj2qg4ZaJeJi5b3U4o5u42xEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WR8oI2DiRwdLnBcF4EvbdXOxUHnJjvvKruXaCO54OD6q93cmYf2RNECtEUox+ILXAj8a6UxXHXilFQuds8uGcMcTMQtQD9Ql5XaB9sDJuI6ND1zVDHRFnKDew9RErSEq0oPlxlylJfPb+P5yCYwtO4ZRYLDgtU/zvteOyaNbEho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fk8oD+nZ; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fk8oD+nZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30E8A6119E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 21:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPKouNxkhwYX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Sep 2024 21:08:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 05F7561198
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05F7561198
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fk8oD+nZ
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 05F7561198
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 21:08:18 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-45826431d4bso1748321cf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 14:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726175297; x=1726780097; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WI5vIgB03b+RRPC5P5FjvKVoLvcCEHnEc2wIMv+7968=;
        b=Fk8oD+nZcM44zheF/JJLQn+8tTTUGVRGJevDbRfUgV/z2DHK7AXHyhYeReOfVLg8XT
         0/8m+f+iu2qYWFP3Q1LDR7GYb/n6EqATHyAbDssxTkiy675vSt6CBnZWekfSVjFmjZfz
         x/BmqlntWJkLR9qN22bKLeALxWilT9yFuQAlpRxGWzEkWXzCtUPXO5PxR2XeChB/p2Hf
         n6ooasAXIYIdLh/GAnnHafKq5kdUyvaAeLBo2wdsz2bnRdCUFqVa0m5zXzgiRCURTvGR
         3PyIAR7W5niobGmZwHMvgPph4dZIq53nJPNkad4h6yEj+jWvK0bPIb0KUv2e70O9ALwM
         HsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726175297; x=1726780097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WI5vIgB03b+RRPC5P5FjvKVoLvcCEHnEc2wIMv+7968=;
        b=jRVYLTOdxcVhT36EkC4t95meQx5j/BSpkcgDuxnQji5FeWXYywZPMXwlVOVuS1kdJt
         C1dlw2dFWruL5XTlhzUOWrTV2WqnCouxeBjvHDCQ7k7s/fh4cFP7hewBilt39Z6fEgSi
         eXfFU6cuGYzHUyVy0L5jX3nmc6RS/eqCGrEbuNspBPAxF/fJsUEEy0FO15TT0Ji8/cah
         IlHJh4Z+3XiUSfAAE2qXzbZBRkLR3ji2c6YTMU2SNg12wDOuGIYJVX05M4cFgjSHBN2p
         CHqi/vAKDhREipomf5wsz8KgXrSu1/MqCCLhomlRa26ancxuV1TznghNJ/oQyyDHlFfM
         hPHw==
X-Gm-Message-State: AOJu0YwY9qlaHDmVDu8oQJtnxNx9K7Q1nFVIlBGvlhHfh6Wqr4G5Hs9h
	mPT7tNzb5LY2eJ/eJF1LRXXLyUdiI2nnAPNNvHHR7QPmP9U7MkBQ
X-Google-Smtp-Source: AGHT+IH08Q4d4W8M6rAMy3bRhqMB1YQChslJN0IsPv4VjxzP8fHcNkqfGmIn0ue36ApoRXUFSn1t0A==
X-Received: by 2002:a05:622a:1902:b0:458:5b3a:9a1f with SMTP id d75a77b69052e-4599d29f8dcmr6443621cf.43.1726175297495;
        Thu, 12 Sep 2024 14:08:17 -0700 (PDT)
Received: from localhost.localdomain (117.sub-174-193-5.myvzw.com. [174.193.5.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45822e613eesm56959721cf.12.2024.09.12.14.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 14:08:17 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Ramona Gradinariu <ramona.bolboaca13@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: iio: imu: add bmi270 bindings
Date: Thu, 12 Sep 2024 17:07:18 -0400
Message-ID: <20240912210749.3080157-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240912210749.3080157-1-lanzano.alex@gmail.com>
References: <20240912210749.3080157-1-lanzano.alex@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the bmi270 IMU

Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/iio/imu/bosch,bmi270.yaml        | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/imu/bosch,bmi270.yaml

diff --git a/Documentation/devicetree/bindings/iio/imu/bosch,bmi270.yaml b/Documentation/devicetree/bindings/iio/imu/bosch,bmi270.yaml
new file mode 100644
index 000000000000..792d1483af3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/imu/bosch,bmi270.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/imu/bosch,bmi270.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bosch BMI270 6-Axis IMU
+
+maintainers:
+  - Alex Lanzano <lanzano.alex@gmail.com>
+
+description: |
+  BMI270 is a 6-axis inertial measurement unit that can measure acceleration and
+  angular velocity. The sensor also supports configurable interrupt events such
+  as motion, step counter, and wrist motion gestures. The sensor can communicate
+  I2C or SPI.
+  https://www.bosch-sensortec.com/products/motion-sensors/imus/bmi270/
+
+properties:
+  compatible:
+    const: bosch,bmi270
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vddio-supply: true
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - INT1
+        - INT2
+
+  drive-open-drain:
+    description:
+      set if the specified interrupt pins should be configured as
+      open drain. If not set, defaults to push-pull.
+
+  mount-matrix:
+    description:
+      an optional 3x3 mounting rotation matrix.
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vddio-supply
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imu@68 {
+            compatible = "bosch,bmi270";
+            reg = <0x68>;
+            vdd-supply = <&vdd>;
+            vddio-supply = <&vddio>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <16 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "INT1";
+        };
+    };
-- 
2.46.0

