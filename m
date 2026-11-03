Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738839;
	b=YLxIHL8g9EISrZxLcP/y8LXw9ynGpMFz8pHYio3m95xgCLJs1ydNdHErlvMfdkPy2rZ9
	 ZnRTugcOwfekfHKkwBcfoFfS0W/ZUkCSySROhgmzSd4WUl5DZvjx/FtwiDwCtv7rnSfav
	 K+hRI9RNlsEU+Gqv8BIy70rUX4BqfwQOk2E9NZE81QP8zUUejUYWbB8kGvUYKWvJBI9dW
	 Bc6Cv4DkMe5gBeFnCL70qY0NMdSUCK+iN7JpdP/woMN9z2qBnAAQOS3yaUTpugklq5CWO
	 7vWRh2bLGYXx0xfxAyKnpjACOqj66gVGibxUVfSdKMUJX+e+cq5+jqi1dS2+LRxm6OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fiW5hM0LTMUxH6fsk06/qcEbiBGXuvdygHyz52E4fRI=;
	b=zihoN+gARg51yDqce7xVMHjpBVuiBRrU4rJGNH7IWcZ9+BFI/LWNQMwkkQ22O3BAd/vh
	 k5EufOb1GuIMyyO678Z9rOPvkHT4UH8HVpJYdCB0WVBPpzLa1ZeQIBuRv6BUW47tq/aJl
	 KQaoeTEtpSkJEezIr9E8+CxKnCXyGnRaxn3LWhudU79Kh8DyqqQsFZZTIACJWphB3Qwb9
	 Q1cHsJPozFFsms40UPjGpItCamZw16bQZ14KANl3e+uon0SyUeqlIKEUO+AhL31+pvjCx
	 VerJmWUr+UCVTMYaiy1szQoh7WImNfhL11yeP+F0KxbaS/aK5OAE4LKWL1hd6qG12tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gD2790cE;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1E1606A326
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  3 Nov 2026 20:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1E1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gD2790cE
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eadf48fb2dso1655755e0c.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 03 Nov 2026 12:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738838; x=1794343638; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fiW5hM0LTMUxH6fsk06/qcEbiBGXuvdygHyz52E4fRI=;
        b=gD2790cEcKQ7q2OF30OoEh3IZsCM3Bxie90c4L6SVTOoV4jhORL3Bha9VNK34sKVXX
         RwJag2ZvIIJX2kjtOvyNVYDlcUtddBmSDiLntcCJvJX7pwU06qe24ZD5wQ5mDKd62jcO
         XiT5JwCvoe0HPfRzB7MfwuyLRwIDKN2ZG2+UQFgcpSCZTahVWjxnqNh01tJpZ4cWAh/+
         MBOVNB/nALPRDzGLXujmiAbY0QMX+qKZbPwYRbsORnHPVxe/ncMmtMoRW3pwTsDlfsIQ
         C6Yrn87B+/7sV/iCXq0kBxVIVMfdm7N9Ume2B6b1iR3LDQ403SCFxAKGlGIoH6hNzH+s
         6wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738838; x=1794343638;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiW5hM0LTMUxH6fsk06/qcEbiBGXuvdygHyz52E4fRI=;
        b=HEbOuwi4loANJ6WIyCEcDFRfn27DQc55cK7qqU+nOjWb8RGbPP9NueD/s8voRlXUIk
         MP3DSH0pMgSelEASQclSI/r/81Ex9+DGyHm7GPZbrdefuDru8N2x1BfAdwfJ0XwYBzPC
         a+i0OUvPmV6Z4AIu73fUS/ZTQx0pikENOpRv2YfHIwZgdi2MrnDv5JKUEHynJRtlYbGm
         AZMSBCi+5dqclrqN/peTvEcRdL/QslaMmP6uOwprMKlspxfqVD6IQo/kNEbiTnUnEESC
         316VWsNRRY3ZVNym3Pgy/Bdt7mV9zMHOzo7pzFCR/jUZ7CLNPkMPslZScqecdUgIRv1T
         +QWg==
X-Forwarded-Encrypted: i=1; AKwUvBynToSSxgSb9/R4WV7dbX8sXYm/kGN7BaBMkAh9k9RWJkc0qi/g6klmJCwF2nQBxYMR/jWV/raHPnKCoJC34zGBhk7Y5A==@lists.linux.dev
X-Gm-Message-State: APuU4Z+LRWLRz3CmD22KrW5DKcYtjU5WBZ2ObSHgyiJdc2RMl8iZu7Zq
	m35/Z4b4GBYgPhQjVOGxOOPq8/m/Iud+Q2u/7tAEE8vHH0qq/lVusgw=
X-Gm-Gg: AYBFou1rk/P9dTaaK9DgwI7HpJVILFeUy+Ozgi5b/w3OdHar+DsMtDz+5DXudMBRn8d
	Nbp+GqR52mejbRwr4NZh2wDvXTnUGBT0s8E1dZCpGXXPo++QKyp5Pb9jwkqGtIxv0JoyhDGfpHh
	yWozpCRLBhBOeuQrjM14Wz5sdlYK7oPZpyhQNicBjOitG2r9EPCBE0kWUm4tnhVln0Eljjg6ap5
	JHS0oNH6YY3tHt6DgwCjpZMXknVfJjPVr7ORtJYR0UvJigaUNn3OIRVn4tZ79N13NKA114d1XOq
	y0s5/6XXoJYJETaRde94WcrVRaqGYUr0pOTFdKVLGXGPhu/et+uo5u8CGIPyVdxiau8Nbr4+w1Y
	sWyv6CJ9xZV0YUvSgIi+lsxTFsUvcXhnaBKKmcoxJr96NMpVl48fhpbpx89qxf5DCUZsHVCt/+e
	xhV/s1fIUAgw0F5LwM+5pQLTmsD8Oxwb2fX42j9O2Ie9licosav3Ws4QEgd8H8UHIXuYDFPdXK8
	6jTXZZ+pEvY6dSoqgEJdb66/iE74xodIpCuH2XabqagtRpsC95tvzkRytdwRF6EAgYEc+vp4mN/
	qZ29bXJDDl6y9kYGBwrZAr5YHI2eD6OimVNL0hRJJ8b01tsJABS4l58smONGZN5Vs+6YndTDy+s
	PuRIb
X-Received: by 2002:a05:6122:210a:b0:5ea:f399:7820 with SMTP id 71dfb90a1353d-5ec6883a5a5mr5727843e0c.10.1793738833755;
        Tue, 03 Nov 2026 12:47:13 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b81b3sm119618e0c.2.2026.11.03.12.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:47:13 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Tue,  3 Nov 2026 17:46:51 -0300
Message-ID: <eafb1a147cc8e3c8c8a1f863fb47d8f6c52655d8.1793735996.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793735996.git.nico.antinori.7@gmail.com>
References: <cover.1793735996.git.nico.antinori.7@gmail.com>
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Carried "Reviewed-by: Krzysztof Kozlowski <...>" from v3 since the only
change was the removal of adding Chipwealth to vendor-prefixes.yml. This
was added in commit 058ee00216a1 ("dt-bindings: vendor-prefixes: Add
Chip Wealth Technology").

 .../bindings/display/chipwealth,ch1115.yaml   | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
new file mode 100644
index 000000000000..6b037c40242e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/chipwealth,ch1115.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chipwealth CH1115 Display Controller
+
+maintainers:
+  - Nicolás Antinori <nico.antinori.7@gmail.com>
+
+description:
+  Chipwealth CH1115 is a controller for monochrome dot matrix OLED
+  panels.
+
+  https://datasheet4u.com/download/1576606/CH1115.html
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: chipwealth,ch1115
+
+  reg:
+    maxItems: 1
+
+  chipwealth,inverted:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
+  chipwealth,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    default: 0
+    description:
+      Display start line offset. Specifies the vertical alignment and row shift
+      along the Y-coordinate.
+
+  width-mm: true
+  height-mm: true
+  flip-horizontal: true
+  flip-vertical: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@3c {
+            compatible = "chipwealth,ch1115";
+            reg = <0x3c>;
+            width-mm = <12>;
+            height-mm = <8>;
+            chipwealth,offset = <8>;
+            panel-timing {
+                clock-frequency = <0>;
+                hactive = <88>;
+                vactive = <48>;
+                hfront-porch = <0>;
+                hback-porch = <0>;
+                hsync-len = <0>;
+                vsync-len = <0>;
+                vfront-porch = <0>;
+                vback-porch = <0>;
+            };
+        };
+    };
--
2.47.3

