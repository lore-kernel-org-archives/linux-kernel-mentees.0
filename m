Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFEA499F0F
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Sep 2026 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784163; cv=none; b=Nx9RDQg6VHl8xXGwc4r5cIIj2Uhk4+cPeHA/NzoUgUChpSq0D6UPBFxdptKM3NNTZxhEk7i57EiOfei+ek0RB8yQDdkCb+SQeUmpGKC3sC4un8oQbGQj78wNBkp4baeBu0Xh42FlSSNoUlfLD5j9x1TE+6FI7Z7PNinqKxr21C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784163; c=relaxed/simple;
	bh=Ot25WLyqVRhsBXv9+FeXxetochqDJHUpqUPvyel2wpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=To01GjXEv7U8Q/Vt+gmVnVFS3e9AgxZaSfB8bsNfxoT9KVWbTYkQLp6kPOEOzPMt+xNOGBfGKCMUJNVF7grPQqRItubXmaEpHt9eLrRF1Muo+NItmhVWMg+GesKSIE3oj00K/WpCvvKYMycKswIKLImG+Ry2k4bJ+F0OMJHYAqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gx2OO4Ff; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gx2OO4Ff"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8726acc5eadso22306397b3.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Sep 2026 05:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788784158; x=1789388958; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E15zTz6LSPQ0+KOjqcr732bl7v4sHhRkFWWTNxNbp1E=;
        b=Gx2OO4FfgmjzMWH76bGjE7DfVmoz2QtnpGIacUMCZKR+eFzaWvJrePA9Z4jJWVKM4y
         Ip7MKJGygUP+MvH/7L0xYoy8L0QtHhKDASoB4g6+EM7nEMIkMIiQwmdWznxJ2jZdxg14
         JbZE15WN5kS9OccPfoIkFp1qrUFzOuORyZp22UC8S2LUGVMRLJZDiUHAHjT6nwf86Zzb
         UdmyQyhvSNPAIV6eMUq1oLMCF6LfHyNlad2bm/JsMWcM28nZkKyN2u0Po+SSwj9B9NtJ
         rDx9m9zIZoSi2jzeiPoho1a+wRdrPn/D4VOvkR2NrLYINAXRVtkLmHPcXPj/6m4FtExo
         5q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784158; x=1789388958;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E15zTz6LSPQ0+KOjqcr732bl7v4sHhRkFWWTNxNbp1E=;
        b=hBufhHu5yy4zqrn8b3NEWlIREPTU2xEKT1QPTikaLMsVXmBc0LB/2ezYgFO53eJal6
         9F6TZqSGi9y1lLET0E8k6vxiKdPOPyKaUaYeMktZ2cnGCrtJI2x//DKb0ecfZCaWV0R4
         ZFJ1MfTLnlET6JxoY0eRzyFk8lyOfvR61dMg810FzmNPKKrKgcWiyYYKbAnYCae87ErJ
         dep0MhXyb5FxZIuY6muBhzkU2eoNuMgiU2uXebmXJ301CxiFwBSPCcryX2AQGgP9AKrH
         WHP/VEYzJgw373bPBdF8a+6h/diq5hNxwinDpzMQ1M9l7lv8d0hpk44eB0/j6t389nSM
         5N1g==
X-Forwarded-Encrypted: i=1; AKwUvBwcLYQOjlVbD0lh8IX9C2ndRs3fCxvCD+Kh2qEGDFEUuK3cPufXIP+kCNE+kXxaXPcNrD4DdiFu0QOievrOPlcJk2ZUzg==@lists.linux.dev
X-Gm-Message-State: AFuF++mMP1gI8rouD4Vrzoy+YJXriaEhuHAZX20GxyttMuhvfP68m3sP
	b4ln9zLBDF4RO3voIfAjfFwh9EMbScCVA55b/biSsVjlmTUt4FhAWUI=
X-Gm-Gg: AYBFou1wOigJWzYwrzznQqlDBkmfodMHpkRhAAFx0+3hknWSF2PhTCuT/RuwGj3nrKx
	9AHbG1JDI70/HGgLpBIqCspUcrGOMA4TYIlwchIc0rCAvBAx/uMESV/K9vLfY2KFJefnUEVuEE7
	j17oUfPNey37xpveUfrlw7AAH5PG7lrNQaWwadu7nTZt9NCtop0QXqDM4A39CcLI3SDf62jYvJe
	PInf4b45Hu7Cdt+cgaKXO1qdezSgh0o+OONYCuRz7I2xWCemiP2EQSGXR3bce0M3ueKUvYewMO3
	VNCQ4XcUQXggzw0K6Qog4/aV3qn4vqneXXSA060+uf5BHILcWyvsEhGIrKe9amlfimUq9Z8Dg0G
	pZlf95STlcWEb1ZoeYLvH+C85mrleV9/QuatjiSkBXhRXjNMqdQH6IMrAS2G50vJ5QKFrd3X1cC
	DwSLSBVkJLUWJ1t63I6OtIDXFvenl2Z6RLRD+u68dlNKYRBGcCr8PLWYTp1TaYK9ZkZKa2Tsfe2
	YGl62YS+Abtj7xqPMuyLqnv69YrH9lEDvRz3Nc=
X-Received: by 2002:a05:690c:e18c:10b0:858:6dab:206f with SMTP id 00721157ae682-87124c827c4mr65766617b3.5.1788784157765;
        Mon, 07 Sep 2026 05:29:17 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm70511967b3.45.2026.09.07.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:29:16 -0700 (PDT)
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
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Mon,  7 Sep 2026 09:23:29 -0300
Message-ID: <b961c25f0b67968b6ef891f2dd3527508a374261.1788711082.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788711082.git.nico.antinori.7@gmail.com>
References: <cover.1788711082.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Notes:
- Patch series based on 7.3-rc1
- Carried "Reviewed-by: Krzysztof Kozlowski <...>" from v3 since this
  patch did not change.

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
index 73acf72c01f6..16a4a7a158ab 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -331,6 +331,8 @@ patternProperties:
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

