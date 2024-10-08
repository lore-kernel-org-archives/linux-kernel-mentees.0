Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989C164A8F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Oct 2024 03:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728356704; cv=none; b=Er84MVohOUcPVZoYVZYcTdHu09FX2cN82sMogJcjq5U6JGp9xx6HYHvCbTG6+Ba7698wiUH9Lu4VBlVddJGY1eEuALLX48m4wU5IOQMBOBuARvSKG2j+ZPZgMkbdjCmhoDU6zGy+7+8M1xKpaxfKA9dUtqXfo5IVAQz+KGLzJmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728356704; c=relaxed/simple;
	bh=7v8EkhMDv+Jx4uOPQGK7HMrlgEz0giZggGqCi8QC6H0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4q+wx78xnSgptfuoNEBWRpQfp7XGprZWDYUFYkhcgyPOz7fwOr96RhtRjMFTOabQrR5i6A4V/fbL78J9nYggdO1jOHPUL3hIrrsVv5C/H/VuzDnurmAdNznMnyXGl0Bq21iCvm8j15sAzU53SS1UNVkKdqHrE3hbZbXM9us/6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqVToh6g; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqVToh6g"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CACB402C3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Oct 2024 03:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feFXeJsblY8n for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Oct 2024 03:05:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B872C40096
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B872C40096
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iqVToh6g
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B872C40096
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Oct 2024 03:05:01 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6cbbe944b05so1068386d6.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 07 Oct 2024 20:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728356700; x=1728961500; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3ksh4XUKkffbY/duSvAxp7lxaY240eNih1Cc+96aTE=;
        b=iqVToh6go0ECtKEJmWsovUF7hfdsnhIC7elpvaK87IKASDkG7B0iFq/CU+sHJAjbCc
         xt3AT5AUEJ0pzr6uxzkoGWQJQBEQzf8pgw2XKP6wgSuI/M/xERk1bzYLfTSRhXb6gJ7n
         JseS87blN7jpx9ksTSooM1UVKiSqsfiOM1UbWaaq4wr/zLg8J5DeEriNRvBQO9M3m9fj
         uh8TLhVJAbK8F4Wg2VxGlhL5Ogn6aWe3yZu5g4o2HY7zZ1gufNE5p+s/4RPNF5t/Jk1Z
         Ogd1AjwmP9HGPnRrh1Y6+6uyfhZTv7rIr4zT4xcNeD9TWoqhoEmvTrIgt5RP766DO5SO
         hh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728356700; x=1728961500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3ksh4XUKkffbY/duSvAxp7lxaY240eNih1Cc+96aTE=;
        b=hN+WEppqeePeVrpZENcajksk/07MicwrDZeriyIeTYUVCCUIbx8aPEBUUGzUODAIVF
         ec3BlZf4YC4qqXLJ+5fEEI40yFPIxaXK4px4W6R9eMfRZPNvuAgYkLcCnAOkVUYjGuLx
         vOIRX/5UAKwq3fE1kgtfE43WRLKrwVTpwojZRfv04EGirzSl99Pj8krep9bqINyyXSlC
         O3nODK51j++kB2OGq+6dJIH03Zcpkeo8bvntWxHnuPk360habOXwILULkpur5PJVmIVs
         TGJgdMezDvR48Sat7YYUOlCRKZiGrJAqbvWUNe5Ts4z+BzbgPcKZ0bGnP1NtjC1zRIFo
         /SIg==
X-Gm-Message-State: AOJu0YyITV0DBzNuQB+RibIBO78D1oawqt5ozeTFb603UDYKJOCvKnpk
	ueL1VaP0Dklec9P760QjydRLJ1HZ5VgmYLoAOyir/lI4k4OYqj4O
X-Google-Smtp-Source: AGHT+IEyM9oRaeOdZt+2OiZHhPytRrOmaj83NBfEXAPMZk7TN3qW/GnckGmOeBjLGGYr2QMEJTPabw==
X-Received: by 2002:a05:6214:5912:b0:6cb:938d:be2b with SMTP id 6a1803df08f44-6cb9a4600bamr191619706d6.35.1728356700366;
        Mon, 07 Oct 2024 20:05:00 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba46f1912sm31107156d6.61.2024.10.07.20.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 20:04:59 -0700 (PDT)
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH v10 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Mon,  7 Oct 2024 23:03:10 -0400
Message-ID: <20241008030341.329241-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241008030341.329241-1-lanzano.alex@gmail.com>
References: <20241008030341.329241-1-lanzano.alex@gmail.com>
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

