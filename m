Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72234C043F
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 21 Aug 2026 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323122; cv=none; b=gsmHwALpOtQvg9twYcdrjzZOPNH0jCMtAOvEemf5jEW07bMLyYnVPZnejf07AnGcgWG8QLuUcxI63meSm/M2Lpw4zkdbTRfHXb7zO8LExc/ZPlvjp6nLdXvDognX60xf1cftXCyzVv7onijyLvnSFcDXgRyA6SaPtyvfznYT+aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323122; c=relaxed/simple;
	bh=yDkWoEFDM+6E+tOGZ/Pf2E1ikfxC7ajm6i/wChJMl5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQuwXO2RXEKqxn/tpBhrIKwC0RZfkZbM8ebLIrM33YR2WsxuU5ccDyHW7qkbzlRYZrhD6YSD+851lA9wemwUXsqcfaoTZuzbx6iDr29JqziVFMSbNQu3o3Immu5AH02i9ZQNzPEDzTopJLGiuEbDtSP10RWgwbuKjjaZcXK6RWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpaEVzzh; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpaEVzzh"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8200ca16f26so15795857b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 21 Aug 2026 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787323113; x=1787927913; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FpnrrgVBkCseeH30s/+2qScfilYBiNsJRVekRnVKb/Y=;
        b=UpaEVzzhxG3LrD4nJthsXTnp/5+mpQ6Y2A3oZkzdbBGvDYbW16jhXvVv5zdnw6NKQu
         0LXkzikmCvTMOYGGPlxXo3VVsv19zjOnU4oxzsC4xOGxKrV9YJJHaF23oa8NoLL19TWq
         hhFEHsl3BMEYaSp1NvGfZ9qPi/pCUlyTuqQxqkQvJ8ScgZhQyu7jlr2yeXD8OZfWuU54
         cZE8XOjGn2CIUEVbotKr6TTzdvLiCnemqzbyZ5s/+GROSHDmDSfJHr4aRLcT4H/N1rlB
         MblQvkkpetROGrYTwW5YdAoAOC9eo8kwv0K8+kFuGhtHoX9l9+AE0g1FWAuJOYWdAdyK
         01qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323113; x=1787927913;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpnrrgVBkCseeH30s/+2qScfilYBiNsJRVekRnVKb/Y=;
        b=pHApoth+lnAnF6V28SZh7Nw25BZCtpwexXLVO32pDiHzmBnQ1EzzK7lJOYbWe1wixY
         aDCsJP9hY7Lj8mpT/5LQgJZM6nXcVLbO/bIijyVpMnxgt1UjFYW3ikP8uS+qNqaih0C5
         +HoJ2PAUPxzoVYwvnDEq08WAU7O9GZ0M2EU0iKdljRQF8H2QcQ7nfLGr3i0IfdyqxX4w
         Cq63zBCqfbtbZDS/iLV9AS8/Jy8lcTOfFQgvdyLO/OG8MA3geioWK0qhQWklqNrN6FCt
         M1ONadqpJz1xbE5kxdTjVSFb5zwQFAM9bMFxoyazlc2A7qXZp9kVr5eIdRfOuwVUSZgZ
         U1SA==
X-Forwarded-Encrypted: i=1; AHgh+RpjZfgJ3KJmHZCxodm3GnxNwQQ1VxsRZnUKQuOTiNiQ32GTPoPTW5LQCVkeFWpzxBRIIGBstUZTNfz0IaM9IX4iNA4u+w==@lists.linux.dev
X-Gm-Message-State: AFuF++kOQAjKYKggna7RDek1JF9u8k7j9eVknD9CEAQgHbrMC5KHPGj6
	7/Xk8vUYJkJ7u+C+1jStXLuNlEvf44Gc132RgUcqG73ZqEQa5BLCfdU=
X-Gm-Gg: AR+sD10lLnIBlVr8f600k2IyHz4emg8m4QKJ7R3pv3aXI/feWO98AsJO6YIi9veqevG
	lMzndYLYWjMoJR6hUph1oYnuyF9hnjAPRAOZZ0KzcIVTJfHwBmfZexz1IdOq31N3X2e6qEYB+1N
	wzExIGiJQ05D0TGgtfnRIlnCVB3/cYv9oEw6nbyxsKQIg92zwQeJLjS4UY5ZonxffskWbMg2OX2
	OeOxA9iCoa95tzdl2k9FyTkFjadS+DBKosrfUdys4aWcBIBNDCAZV6CcrpW4WXck+hrCQfm5kl6
	o7GbR/LrZUOTtv5UU8Rgfh3HJ6PusYOywFKWT9rG9JuFis4nT4uanSGs6YMjfaxyh3/DiBCtWpg
	YV4CaIpd1BSY9c5t/vwjM3yPJhXBijundd0o2pNOOIBBrqy8p9mai+RySjqqCEKUcShOTCwB/Ng
	6vcEFS+mHBgh4k5i00uWK2b9SVtiD34WHLQK1Ato1WfKnH/708wSAFafP3XFI7gGS3CqspUGyQR
	wOZdNOqkSYfMji2d8sulzxEIBrttcDUHNQ4nXfV
X-Received: by 2002:a05:690c:e20c:10b0:81f:d515:8c06 with SMTP id 00721157ae682-849f61ddfc9mr21942087b3.29.1787323112427;
        Fri, 21 Aug 2026 07:38:32 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845188b28f2sm41868277b3.38.2026.08.21.07.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:38:32 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Fri, 21 Aug 2026 11:34:16 -0300
Message-ID: <379eb0dbb4a911d80a3af680f647cf13ae0ece32.1787321297.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787321297.git.nico.antinori.7@gmail.com>
References: <cover.1787321297.git.nico.antinori.7@gmail.com>
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

 .../bindings/display/chipwealth,ch1115.yaml   | 89 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
new file mode 100644
index 000000000000..9d9c43722131
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
@@ -0,0 +1,89 @@
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
+  chipwealth,invert:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
+  chipwealth,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    description:
+      Display start line offset. Specifies the vertical alignment and row shift along the
+      Y-coordinate.
+
+  chipwealth,contrast:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    description:
+      Panel contrast.
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
+      #address-cells = <1>;
+      #size-cells = <0>;
+      status = "okay";
+
+      display@3c {
+        compatible = "chipwealth,ch1115";
+        reg = <0x3c>;
+        width-mm = <12>;
+        height-mm = <8>;
+        chipwealth,contrast = <127>;
+        chipwealth,offset = <8>;
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

