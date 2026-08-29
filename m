Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7339837CD40
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 29 Aug 2026 06:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787985494; cv=none; b=G00Z4/ZlppIGDmZPX1iFF4g+nfeiOwilPFkB+9NjeCPQqfZnZBlAi/OGF9QlpYo9+MVNLnQOJCDjgAmFPJywX1JuKJSRu012bnSMcWowDvItaw4j6PWTc2/xL7jAYCcm0Yky73yRiWG/rOmQ1WgFpgO7/yBEkmppSZe4x9luKK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787985494; c=relaxed/simple;
	bh=V7NprEA1ziEcZPTYiWf9422D/TQaqQQsBWcrswswXHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PjAPL7z20SIAjI072ErJEVcoNaifSPLyVBWT4hwhPG8CtM2p8Yu89WK7zkBx9THNY8PQVbo1wbAFUTF6X3LQNZeIWGBDFokjOEnR4+iSNbzDEVWuvDupJCs3jNEzrwMh2ZKlxoKlYoIdsggr5bZy5ZHoQBWfixtMB6k+WdYt4yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwwfvmyC; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwwfvmyC"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso1655076a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 28 Aug 2026 23:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787985493; x=1788590293; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tmcfXCWyqYWXrP5NL+KMYMRkQ9XRom7Vi8Cv0Onf708=;
        b=VwwfvmyCp1I23jICkbWt2KOqqJDswaSwvsFDnF3+IhBGTSxf+UU/ArztO9L1ETK4n8
         KfbAoCEISj0aTjvuZTrOG3me1PDj5nqlK+YaBE2wzKfcGpkepXLGHDvsXBFUMZzWBwa5
         DCHB72YS/Jb7HnhaDCFwI2OyRPkA/oEWpwKjOfkiIO5hzcnkFiA+RVumNSZuQaac89zp
         vO7cY3Jz+F3dju20s7blbMz9htGybHBcbYcTPMkmKAkHoiGU+KHMdz6kr2ZU3T0e0gy1
         5puPQbHG1jm2JK9fAOXsOVLCJjB5aZpHsvNuqRmlTc5Q25e6x7lfKo2UN9JAq8nHzZm5
         4UTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787985493; x=1788590293;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmcfXCWyqYWXrP5NL+KMYMRkQ9XRom7Vi8Cv0Onf708=;
        b=VWt8xIt+95Kn7OYghcRdnkklUjuaYjFYSMRWAqzW4FFD5ctr/OfotPFboy6CAyITY7
         qvKXgLrd7bXx297HUiGJU+2fIRXNH4mN9AYuSD0Q2ztSsnx9aXZ35/2obnvdeVUrcwXi
         GNNiK4SPOWG8v1XudcANwyUVTvALbgi+km0DoeNSQFDgFfvNw/PNdpOYgIjcPXFpEh9V
         ehDIJKyXsKenO41oft/n1XrELk5LNic0g5SaYdw+OQwrBWc9twmjMMVx2iLUUzpYsUcg
         WkQRSmQXnT44UxM1E3adJKjTjTJsoV8wOoMJxHZYwN6UOZaYG1LOL6s1wWt7CboEKh4h
         b16w==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Oblq622HH71nnTlxu4jocrfR0V/10fUtUynkrdSNJztLRytxSm5qVTZAgdqNj749taAPcH18+LXTm6pGgiKyT8SO7Q==@lists.linux.dev
X-Gm-Message-State: AFuF++kEDWtCl1pDXWJbj+RUsBz07oA2ocXQffvue3SV3uPCKuXbYi4C
	theYc4aAvwiktvsUJRMics+SOR7RJAkbJnud//8G4NRF7WfuIqzvxOg=
X-Gm-Gg: AR+sD13Ke+YrBqdKUtjAqh0JwLDL5BU2HO3McfWxD/0WzynWE6pknTV78D1+rXOd9TF
	DrhXlzhfHTpkxcEUqB7tZ2/e9Q6s7/w2bDs3hwPvJE9307JkcvmPMl3tqiwA1CbLM2CKAoB61od
	pFxki8zLMlmncD8QrO8j/x294TenHWsrW+j3x5NbVxsv3zXocpCgnE+K9DG0lbeFZLoCCJLo14u
	hBDdEs+YBPawTK/Jgd9xMpOBssGAIUxVAqLgDJQN6Q2Mx7tlA9QyN6LeO2m8MLC2OFnbEWSJ0CO
	BPjdUu/EXm7CqlnhSlpLtucIg8qpANHvn+go1Var21ZRfLFJHmyhGrIvCvXtCnuZR3QygMquCct
	1LfQj1reEXNIgdTdjLUXT0pAqkM9hFNoNI9SpDqpVyPncL5YadZM8Yl2guI8qg1CKLJ+8ST9Ek4
	vla+P6Kn/s5LyaBPl8DCB1EkOfgF0nAotygAocLI9b3lC2R7zl+XbtpQ2vIzeDE+eMvPuSmRvYX
	bjBAcng957a2Xc+MghXhWbJ5Tbe9a+iOJt+i5s=
X-Received: by 2002:a05:6a21:594:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3d2681a3f3cmr23957289637.13.1787985492691;
        Fri, 28 Aug 2026 23:38:12 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1abbdsm10957539c88.2.2026.08.28.23.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:38:12 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Sat, 29 Aug 2026 03:32:13 -0300
Message-ID: <5e1a01043e1935d59d48630dc6211652e64b108a.1787973729.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787973729.git.nico.antinori.7@gmail.com>
References: <cover.1787973729.git.nico.antinori.7@gmail.com>
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
NOTE: patch series based in kernel v7.2

 .../bindings/display/chipwealth,ch1115.yaml   | 81 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 83 insertions(+)
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

