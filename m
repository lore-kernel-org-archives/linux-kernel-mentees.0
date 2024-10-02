Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE2E16426
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 03:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727840327; cv=none; b=Vsjv9A2H+8rCB8xIY3Lw/Nc546NIW8WmSNSNK8KqCSeXFU5yL7OkO6Ll11k67p7LVSuZ+RVejs0/NaJmWLepf4vK3FRZ49m+saAR/BxwwdYb7RoBExhWFqzWphEoIfOy5uBz5cehebIL7r9RojmDkmlvZUL+w0gLOh1YGJl07ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727840327; c=relaxed/simple;
	bh=7v8EkhMDv+Jx4uOPQGK7HMrlgEz0giZggGqCi8QC6H0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MimdAq2oVXeir+zOjLpM6pyL3cB6IQ06kM6NNtAEZxwWUCmDCPs/mCt4SdggyfT7Jo4KrQ+Sek7N9L0ncC2iNPUOp8C3AI1bGMxYKgroQH0qyxMMOm2/5OJmc7GkX1ZKuCSL8CowN9EvKp0f80Lxi/4M+LHn/bCnmjCPUjurpjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZGy/Jr9; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZGy/Jr9"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE7FF60881
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 03:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQtbKG-YzXOu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Oct 2024 03:38:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA9766086B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA9766086B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gZGy/Jr9
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BA9766086B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 03:38:44 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6c5ab2de184so43814156d6.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 01 Oct 2024 20:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727840323; x=1728445123; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3ksh4XUKkffbY/duSvAxp7lxaY240eNih1Cc+96aTE=;
        b=gZGy/Jr9Lsa9Zkl9++nQWUh728AwCRkARpFk+Z0OIbA05dkwu2nNPIg1q7vn1ms4cF
         bBkszgaSLTyyBd4zslvtWqU9ILdRD3j2XelB7ITtUaVevrJahwLhfJ6RaItEz/hbRtio
         gPiZZrG7v1g4EBF+y+zF2+cPywVL4x3njK1a5SF7S/P5svIja2YgOX+EDi4kCLvAlMjL
         M6S9vCrz148Y6NMg4jo6KIQWcBTmwjqRhDfW/dYC6HHBF/Ef4ajIuFZ+4B1dfXQJZYAS
         A65BBriwQWgw+bmQWmmsrAU8QlwfeRaRPdznaW07P83+ohet3CIv7x9loXx+f7OTFWmv
         L/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727840323; x=1728445123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3ksh4XUKkffbY/duSvAxp7lxaY240eNih1Cc+96aTE=;
        b=MNJRALm92Pby7ggFXUnbgsrYlc37kRsEERMsWShf63lLOQ9LICoTg/o48eUyklqmJJ
         Vfz1GkjxNdXjTm89/uuCthD3Z2E8gwA6fGh/eiuUMyzXqG3GqZ73WRKkFiBYeQ0bP++A
         uw4iTBRWx837Pm8b4rCOrlvgZBovHk1ICEpWXc9134+6dArLuZWWJM71TwGLJl4Ji0lZ
         HpSmZcEuM8JIrrGA4Y+Dje4z5vTksKS2vpTipNf5oAmdYrR8muknP0HA9OfEJ8YtFKAO
         pGdsR2QmuxIW/38Ucay8nE96YEqbyx6Av8jOnKRFg16/FfhCPyzHX9UWIK012sd8hEkj
         RuHg==
X-Forwarded-Encrypted: i=1; AJvYcCV8lu5RaijJJ2XEQeZySfCmEw/JBk2CAg2eOjVLYRLDQ9HmPD4JYJhu1P3LzAm5qcBclcHBU5CHLxjXU/hiCg5J+1rlpw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzbhesnMFY50aX+JHEKFCY6htVt7kA55LJl386a7hvevjGKS2ZV
	/wSrCbXAw4nqi7+okH9doTj5uC10WrMfZP+hvksRsa3P9o7e0rR0
X-Google-Smtp-Source: AGHT+IF9Jfkt6rq+pRhtFzL8UUBhqRdqj7GBTlabdTV3sqq4yIKtW2BH05YRhH+pw0+XjCs4mPcgDw==
X-Received: by 2002:a05:6214:5547:b0:6cb:2a26:af89 with SMTP id 6a1803df08f44-6cb81a64ffemr26531116d6.34.1727840323315;
        Tue, 01 Oct 2024 20:38:43 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b62d9e6sm55640446d6.69.2024.10.01.20.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 20:38:42 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: u.kleine-koenig@baylibre.com,
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH v8 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Tue,  1 Oct 2024 23:37:36 -0400
Message-ID: <20241002033807.682177-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241002033807.682177-1-lanzano.alex@gmail.com>
References: <20241002033807.682177-1-lanzano.alex@gmail.com>
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
2.46.2

