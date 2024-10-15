Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7142A1D63EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Oct 2024 23:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729033609; cv=none; b=BSEe1JjmVCXfcmVYpIAzBM9o4eO6W65U7WQUtoVoCrG49y7iz/VXNYDQ6J7h90vd7f8IOcjZlNYFlxkuuhRGUP9OMlBJDbfhUdnA9+dN9LXUR8wStTff+eVXmFtrHLPPHvknzcped/JgIHSLq1VHjCQHqZNhCzgtRvxj5jCF134=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729033609; c=relaxed/simple;
	bh=k1Wh/DVJkFET1lbYA0HKKydmloYp/JWSBsDNgirb8kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOygwqoZQiIROtUKyO66lBWeca2gtKjVaupY1Sc4LjfDpFQIF1iDGutw3MQFnqYBmgQB7ZAz56eHryDG4ZoLZMqcW4KcwMiMZn1ykX7wCDA+7PpozxdraJWfuKr3+ILh+dMmYEBDsRPGBjrBdE4526rOio4chsKMVFUnhwz3uQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqR3O19/; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqR3O19/"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BD0D608B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Oct 2024 23:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cGR96n_shxC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Oct 2024 23:06:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 38954608A9
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38954608A9
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IqR3O19/
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 38954608A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Oct 2024 23:06:45 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-460371bfda4so47669011cf.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Oct 2024 16:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729033604; x=1729638404; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTpekSolQ0QOAMmLRMno5XrkJiMfliV9lomxb+U4KBw=;
        b=IqR3O19/9GMVuR4z3J9PRu49WQnxvo2gJf/tWRHSwrEtuoXu+jKl9ggQM2zVXVZgfC
         oykCtP2NXCuAqJDGZeG4vgibBkJrdJ8N8Ct95iUMMAsWW92ENALXBVsw/hDtaiu10FP2
         XCqqT6vFX7nD2tdXRQSQbeCv/ozSYSbwDxWcxbP4gWEPxdBXUx2aPZDSO4wYm5FyJTBC
         ejR70ZbEVEpxRsu4FLPPkyHj/UxVDbjWGS/0XNe82TJmSMQgrnJCSO6TyfZnl21IMGBv
         z2DtW0gNfXW8Qt0nj90fVkQIjx3R0Hw2OSqd5xrTnmLI/9ZuheaCPPkOoTuuUD0N/JrM
         srxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729033604; x=1729638404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTpekSolQ0QOAMmLRMno5XrkJiMfliV9lomxb+U4KBw=;
        b=rU5tN48w/tpND5jiVlj1BulINPQsrXtmRLTg1wa/R1fRZ2xrDzA0EE64GmcWg7u0tJ
         4GtnaTCU8+XJCzBRedQ92/lMSgkErMf8o8zll9DYg6q/TKJ4IGYlOuPCFM+Cez1QEx/p
         Qliy/sV2FBVTEF3a51RYwJtR34yrkKoDcQ5kf1yISGbrlXwCQWICxYnVjhwtU+5RLQh+
         I7F9hYSyTQdceBMsmJThJxPXzDrHSxehHmJlTPKvrj+GDBnJ2iBqtkJat51/nkHk9/ul
         Rc90HjEoEkpO3cc0AM4ZbBdXw29GAGEUEr7ABc933l7zw0Yj99om97nHXkqmD2QWs6Z4
         8DtQ==
X-Gm-Message-State: AOJu0YziMPPL8Ovkg7QS92qBEsHan+l3fgWNvOJaO+L6PQltBlDHlaWf
	wX3Chvr5F7oUj3mM3PJ0ZwQ9+xk36KVP0iJXqV4qGWEIaW4vITFc
X-Google-Smtp-Source: AGHT+IHPzYqu5XwFBi/nu3ChGqeZPQygQizItBlhpnbbYQNvBTfKgOhOL+OuWmTFzGpiU6LMHw68uw==
X-Received: by 2002:ac8:7d06:0:b0:45e:ff4c:6387 with SMTP id d75a77b69052e-4604bb94e9dmr204722401cf.12.1729033603675;
        Tue, 15 Oct 2024 16:06:43 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4607b0e407esm11224641cf.27.2024.10.15.16.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 16:06:42 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: u.kleine-koenig@baylibre.com,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	David Lechner <david@lechnology.com>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH v11 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Tue, 15 Oct 2024 19:05:43 -0400
Message-ID: <20241015230617.3020230-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015230617.3020230-1-lanzano.alex@gmail.com>
References: <20241015230617.3020230-1-lanzano.alex@gmail.com>
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
2.47.0

