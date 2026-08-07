Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FB8381B05
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  7 Aug 2026 14:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112553; cv=none; b=fO7mTSGZvaoiQRhzxX4j/1NKVQuyhJLnOES77+A1goU3w9SUpRsuwSsx1UyGi6rj5g9k1lmnI3bsIn9M53fn9BzJES/DoHRRNUwJ1yUT+sqmJy+47fKWmJmDHx1gDcBKYFdhuBCi9FBbn4rsLxZWCGr1apK2VFQhGuLj5zpdln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112553; c=relaxed/simple;
	bh=J28xWWhBWqCfIpHOKlpEQuPok325qQi5nVSHUlh1SK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pehDcYvTxOkGRwXsbogI6+hEaHF9jPHA7IiGqXxH6UvZUH17QxPYH4ZoWTR+v/F4p2CPNb7fKpmOk2euDX+F6VWYMshktISRdUuhCHEjIy7wyFZAwczadEvLMQfCBXQTZh5Hkcl5MKu6xqtcE6AuUr4IxPgBdoDj1zu+X4KGRwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qL8tfyb6; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qL8tfyb6"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso2979573a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 07 Aug 2026 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786112552; x=1786717352; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FXqORpQuFukFf4CtgnQuCcVwYnWDFuCVbv8LufyxBXY=;
        b=qL8tfyb6vcIYPjPm2tgV64RjJlxeLahwt3eOnMPp6JT6Hpzz4lCX4LkaqdniBiFs58
         92sA6hXuiZXFvza8rEmAz2yUq3svC5fS5xfV3XO0FwOzXVln0Fjz6OG/XiRtY/5AX+nI
         SXETMa/7ppkV5ZvpSwp8vJq4hN2d8zWH8meFBxuERLpECDYFBhoorRLMeXa8Ua9CjqiU
         6rF34LocuRXrtq1swCA8jmRkgn+hQCS1Swfd+o/Q9sgY6Jfk6/A5l+urQLuIpyUUAM/2
         zWNQSjwBr53ToVaGoG0ZIRPMmXAvmu7wiCjqsLj6zqd7M2HGe/bG8nc5tFE8HrltK4g2
         goGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786112552; x=1786717352;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXqORpQuFukFf4CtgnQuCcVwYnWDFuCVbv8LufyxBXY=;
        b=lwD1DqD9P3b+f2c14W2Xm9qtqngCS1FKru9gIBolWbG/NPNO9DLiqcShwSKzXkVMJz
         QVCj/nsqqtHsK2ov3b+qE+IORLqXyZG7a6z1kmCQPhABGfu1jF0al942jVkoXwWRw5u3
         x1e4ZOAFsiLelDN2dJLcrEATsNJLORMxMgcP1fSa6W0egRuJl4YgdQs30A+Ajwb7ckXz
         2HiesKOqZaz8G2uwj/doIOYN10LVz0+CJYKrf/D4goNwJkXSPx6CY9nKr3efqhKX6z9q
         j9TYzG8NkWruuO/mtC6uRLKWlYdwX5BM/4LhaBK3bCs7oVXKsaf35qg7m8c6Bq7Q4RR3
         ydFw==
X-Forwarded-Encrypted: i=1; AHgh+RqGzL8YIzmFIxyGRQGGZoSGt/PTQCeHS4eSGNjzH1adFw5vLpEp8Wq3pgffmFqV29urqGMg5qw0RJpzObn3PZIMoVJo0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKu7aCsLpWPXRdeUwlHTWHC9Rt7mwL807ISy2mppCFtKJHucKI
	ZyS0NchjCTbX/Y1QTiJisdYseuXx6w/S33fKpynAG6wTPX0wrSsrj0KLZa5BTTA=
X-Gm-Gg: AR+sD11wDMqMwkMBRMgKBOAAdb6+quEyUDVtuUwldlLrwf3/5QVOxOg1G77fUL6t0n2
	HNoM/2CqEXu7L2ccFOItw0nnMVO1I731httuEH4yZ857aY/FBx7ulBN0yF8TUQshmRio0Yq4DmF
	5Gpo2dw9qOELd30HPEQk9AIp3T0dsuHepUkIqP1q+pxSaRG+5jQoB3FItWJ0zQRvhfgndYK5URB
	lJrM2kH2rcuq+DLjWUZy7435Awno3l2/q2D3o8XING8pU0MiYjVe3sGYKwluHKxfhWS4ld+dWcA
	/DIvg1Luhe1B3ZcakyB59yHk+aB+cAZYd/oYmj6gNxyapDTQtuZ6bVKJYMZt3UDBmd4nN9yo6bu
	4OJSnXZpqzmO18tv7ovdfUCJtlS+nyB808Iza8DxOmOUT74aAd0FmLNZo21k0ppBEG8neFMONFX
	1Xy5fzpMPaSL0M5jvy0tV3Qu3rnPmFM2HposycTh5EuGNfAOD8slY3qbXJTYv0RNqZlwoxy0uWq
	hzyhem0Jfy42l4aw3SYGukmpgva6vWAVTiHCzE4
X-Received: by 2002:a05:6a20:1602:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3cbce98a610mr966402637.33.1786112551619;
        Fri, 07 Aug 2026 07:22:31 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a7395sm8521868eec.9.2026.08.07.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:22:31 -0700 (PDT)
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
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 1/3] dt-bindings: display: add Chipwealth CH1115 OLED controller
Date: Fri,  7 Aug 2026 11:19:50 -0300
Message-ID: <cf9b02d618db4eca88e2d32b4bf779011fcd550d.1786110720.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786110720.git.nico.antinori.7@gmail.com>
References: <cover.1786110720.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 .../bindings/display/chipwealth,ch1115.yaml   | 73 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
new file mode 100644
index 000000000000..29d55da85d21
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
@@ -0,0 +1,73 @@
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
+  invert:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
+  width-mm: true
+  height-mm: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+  - first-page
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      status = "okay";
+
+      display@3c {
+        compatible = "chipwealth,ch1115";
+        reg = <0x3c>;
+        width-mm = <12>;
+        height-mm = <8>;
+        contrast = <127>;
+        first-page = <1>;
+        panel-timing {
+          clock-frequency = <0>;
+          hactive = <88>;
+          vactive = <48>;
+          hfront-porch = <0>;
+          hback-porch = <0>;
+          hsync-len = <0>;
+          vsync-len = <0>;
+          vfront-porch = <0>;
+          vback-porch = <0>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d2ba67c4c8e0..1d158ac83ce9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -325,6 +325,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chipwealth,.*":
+    description: Chip Wealth Technology, Ltd.
   "^chongzhou,.*":
     description: Shenzhen Chongzhou Electronic Technology Co., Ltd
   "^chrontel,.*":
--
2.47.3

