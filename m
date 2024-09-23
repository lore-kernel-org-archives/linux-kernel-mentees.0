Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD2E19F115
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727108575; cv=none; b=tJncY2Rx8mZeli+GniDDqOlnOHUfyP8ZUtDkwiyvjxToy1j+c0y3B/a+99SPCNgV4q6gZNfh6I8Wud64cnt6cv9k3NSVuMFAF1YG1kvpULFb37pC7k5MWJPKwFhxOS9bZdo9IesnfJikTeh863sHKNqhfpKUg560/HqsAGHWJCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727108575; c=relaxed/simple;
	bh=ATWjVFRLnSAGMkjhwfJQWOO/tfzmabf7vU0TjFmd0gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VyWQiJWOs5O3QNntfHZdaS4LuQy+PpgzhSkMJEoEsZ6HvYO81eFWnhKZ4n7cGmyb6jxrDPsMhc2RsbqDhy5EETW27Hyk++5ijwJICJWKm9HDVvrSAs6M8nGG4zJeMhPcpqolcVK27y63el4kmbBAmWLdqs1m4Hao8lq7G4VUV+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQ+g0tn+; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQ+g0tn+"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6A72608DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 16:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuSqZ1NimFF8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Sep 2024 16:22:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEEDD60703
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEEDD60703
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hQ+g0tn+
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DEEDD60703
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 16:22:52 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4581e7f31eeso38278691cf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727108571; x=1727713371; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WK7eqKzfxTCXYjY4yBuvM5uGMWIrx3TALuq0TWoNpjA=;
        b=hQ+g0tn+wT/NrZRZXeOtM2/Gk7gd/MySg79T1sjrNQ2dxSKVTYmJYpq26STyotNVVb
         uz7K5qK0qTxndox1zy2HriXfxvTa4z//B2kd1hq8dlowbGsVQUXan3C+rf+7lVb7rCui
         KItlq9bcIkxlN+L+yDqWracUD4wJFyXPHAQMSbvMcbiSwzaBU7/C0Q2YRmPax+Q7D1/w
         9Dc0TtxIlmrWm9NmIV54mf+pundCVu9ugRd8FReN2Enx+tMxLiAcyysnjwbfJDFRr88c
         wb/EwvTEA/nRdQIj/kzbaL4+OFO7OnkUSNc3M/RZMaA8+p+JVShbdG2VbCabBUBRB1J8
         2QQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727108571; x=1727713371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WK7eqKzfxTCXYjY4yBuvM5uGMWIrx3TALuq0TWoNpjA=;
        b=JAGZlFiQpDq01lZ+tEEBJQIqA5AtdnfDIqZiPk7uJJx3U/BqGGvt4JGZw25Y6NgkeD
         0JkLQnVqm+K2Jh82m4OlQjvBVOZOPwnUSZ22gWeiNy9b4PGMMgrXotUkM8/WGYUrDhAs
         EkUZGE1nuVOGyPIj8JXqjnr7O0WxXL8qwqAUFO6usNuRtfAJFqIzWIWjP8YMYU2VJJTm
         GaTykgdyrW5YZQaRAptlWesJD3EWwJ75gzoxRJZqIV/N4hyljHDKAFjqKl2E+44qjT5Z
         RHNQdcEwBBGoWaFsTyDMVnhZB1u6usqgX4Jpjlrt7HuH/i3nVE2LD1/gtLxX9sBBGeU/
         f3xg==
X-Forwarded-Encrypted: i=1; AJvYcCVwm/EtivlcCSnlKgMLh4tGjo3lJ6WEG2LjlxcrRvQTjzd8cAmSDpt1wjvyWWnjE4ftayt3ooffaJKJ8MPM4iH+MId4Mw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyK0d4LMO+ZlLOm21LekrzHSzVo0TPtaQYaMtYZPuV+UcjZrE/H
	fYgbMFNFiFeFggnbDZQE16Uzhns0/DUf0CUWtJ2hzyNqzhtTm0Z0
X-Google-Smtp-Source: AGHT+IHtGW8BGgq7f+idZ01ePUM9n4dRpEXgM/5sCn84zGPQtG+DUDSYbLOgEjG4fiqKSLk7e8vKlw==
X-Received: by 2002:a05:622a:3c6:b0:45b:1d3:d9a8 with SMTP id d75a77b69052e-45b20508707mr193558461cf.27.1727108571506;
        Mon, 23 Sep 2024 09:22:51 -0700 (PDT)
Received: from VM-Arch.gst.l3harris.com ([208.127.73.102])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b17867fb0sm48587901cf.1.2024.09.23.09.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 09:22:49 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: dmitry.baryshkov@linaro.org,
	Alex Lanzano <lanzano.alex@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	christophe.jaillet@wanadoo.fr,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH v7 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Mon, 23 Sep 2024 12:21:34 -0400
Message-ID: <20240923162205.55658-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923162205.55658-1-lanzano.alex@gmail.com>
References: <20240923162205.55658-1-lanzano.alex@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the monochrome Sharp Memory LCD

Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/sharp,ls010b7dh04.yaml   | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml

diff --git a/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml b/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
new file mode 100644
index 000000000000..8097f091c2a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sharp,ls010b7dh04.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Memory LCD panels
+
+maintainers:
+  - Alex Lanzano <lanzano.alex@gmail.com>
+
+description:
+  Sharp Memory LCDs are a series of monochrome displays that operate over
+  a SPI bus. The displays require a signal (VCOM) to be generated to prevent
+  DC bias build up resulting in pixels being unable to change. Three modes
+  can be used to provide the VCOM signal ("software", "external", "pwm").
+
+properties:
+  compatible:
+    enum:
+      - sharp,ls010b7dh04
+      - sharp,ls011b7dh03
+      - sharp,ls012b7dd01
+      - sharp,ls013b7dh03
+      - sharp,ls013b7dh05
+      - sharp,ls018b7dh02
+      - sharp,ls027b7dh01
+      - sharp,ls027b7dh01a
+      - sharp,ls032b7dd02
+      - sharp,ls044q7dh01
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 2000000
+
+  sharp,vcom-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      software - This mode relies on a software operation to send a
+      "maintain display" message to the display, toggling the vcom
+      bit on and off with each message
+
+      external - This mode relies on an external clock to generate
+      the signal on the EXTCOMM pin
+
+      pwm - This mode relies on a pwm device to generate the signal
+      on the EXTCOMM pin
+
+    enum: [software, external, pwm]
+
+  enable-gpios: true
+
+  pwms:
+    maxItems: 1
+    description: External VCOM signal
+
+required:
+  - compatible
+  - reg
+  - sharp,vcom-mode
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+  - if:
+      properties:
+        sharp,vcom-mode:
+          const: pwm
+    then:
+      required:
+        - pwms
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "sharp,ls013b7dh03";
+            reg = <0>;
+            spi-cs-high;
+            spi-max-frequency = <1000000>;
+            sharp,vcom-mode = "software";
+        };
+    };
+...
-- 
2.46.0

