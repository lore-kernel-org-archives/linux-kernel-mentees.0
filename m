Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9533D1173F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Oct 2024 01:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728264682; cv=none; b=ZPBVvCdN+7yihWSP2S0QmbYResnrx6DeafpZqt3wxfc1rSla0TaqStZjvx90xCyLF0F8JnH2fTFUSuR1khaDOhY3kvNNRsJy0Zr7m39En4d+HPaUD1kUZNB4fotzTx2F9DCf+hI/GlPE+aW1yW1/mm9w2xSZAP8LZhn390tiF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728264682; c=relaxed/simple;
	bh=7v8EkhMDv+Jx4uOPQGK7HMrlgEz0giZggGqCi8QC6H0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLnQYFp5OcfrqogDub5lz6NtMjHo7GkZcFvsCRphXkG6lFl7FZDx0JykkawqKr4w55yxaELKQXQPyOGB7BsfJKRdICs5oiKHxGLXvU00TtnoJTrGwRxeKIDG8FhtIGUIqBIPbdGGtN++uup2SNvWc3X9bA8dPI3qHYSQRBAxtMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F75WRA8t; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F75WRA8t"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B0E74018A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Oct 2024 01:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnVnnBxJu0KX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Oct 2024 01:31:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF5C5400DD
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF5C5400DD
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F75WRA8t
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BF5C5400DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Oct 2024 01:31:19 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7ae3d9a93c0so415933085a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 06 Oct 2024 18:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728264678; x=1728869478; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3ksh4XUKkffbY/duSvAxp7lxaY240eNih1Cc+96aTE=;
        b=F75WRA8tvsfKrahFXtajUNVponfA4KK+PY2opDe2AMrN++2YAS4zgLzVYT57x43Itz
         wqjNnDCUPmA1EPPmngrza6pkpy3UXMtF78Oyvx3fJfv+2ULiStQmaLsddCvRqGc6VW1O
         nO7f4qYMM8mfz6UyGT4GNyfyFXonjXISR5ILc1Tr6gGwQ9hOcR18n6x2TnOvs6tFlAL9
         CAsthPUMIWU7/0igEjR0M1ScrOKwRxh+xmDqD0ZBh7HXq3E3iWHNytYjr3OlT9N9nSOO
         9dRv/7RfWeZgrA+eBudAl9wAkPkPxU/ciG0XLxYotyP2d3xgx8PHCeKr07EvFZe6kcas
         9xDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728264678; x=1728869478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3ksh4XUKkffbY/duSvAxp7lxaY240eNih1Cc+96aTE=;
        b=JeMuUs90r54Av2c4rfwhaEhFz8jdeggEjdqPAQLrEHoPUKlAa7PNjB8zpj9WXIE/wi
         SYeBr1F84mYMsDvkmYJrLoiuWv+2b9cr+PeaMG7bLRax9Li+KaoEbEiTV21cN+C2hDWU
         Ch+DiquaSPNWdfj4XwymWhliXu6s8Vmc8gel4xWDD9TXhD+wGXkHak1KDoUVO+9KUGVO
         usukgLLbgK6q4XrfHXq14cHpPkMeyMBKpbI7YpwlF34CGInUgyXwHldsWxMZ22d2fFYu
         cc403mKKFXtVCKDcayg4PjQJhPMVUGJ5amgSdOd9yfie+EVMkf/J4ETFlPyyYanJ3x68
         0MCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnl/BZMbMSN7R+3C8+3aSEjpBv1MZTjVQjxEzzkSZDCo5J7jR+vjwKlVA+uFqNVw21YJZ4oaVamHct6g0HaUOgX4ow6Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyZiq817O+34duBIS8JjF9urxUywEldXvpCCUWSnALlL8EQpy6o
	RikteG/hDLWjH1sXwQeZdMtchnjF7iS8itDvk+CpSPj1Gi8McZuN
X-Google-Smtp-Source: AGHT+IHfkg0cGT4jshIHtr7s47CTUFILrvkTDKQ6NMGzBzbAdTlKcS6WdQJISVBiQ/o7R1qiaHbtgQ==
X-Received: by 2002:a05:620a:2413:b0:7a9:b605:f823 with SMTP id af79cd13be357-7ae6f4547b9mr1781299685a.37.1728264678271;
        Sun, 06 Oct 2024 18:31:18 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae757627fdsm207326985a.100.2024.10.06.18.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 18:31:17 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: u.kleine-koenig@baylibre.com,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH v9 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Sun,  6 Oct 2024 21:30:05 -0400
Message-ID: <20241007013036.3104877-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007013036.3104877-1-lanzano.alex@gmail.com>
References: <20241007013036.3104877-1-lanzano.alex@gmail.com>
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

