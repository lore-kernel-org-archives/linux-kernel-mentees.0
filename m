Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BA9596502
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 22:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202961; cv=none; b=a+TzUBu5dSSptwt34Oft/tjplobZk3cTpJAFthAkhVs6fB5o5GzsWnR2IbIqqCgmX9mLX2ZS9uwW/dGRkVEGArp07cItKQ4qTMs3YgZi9DwbUAhgHEJ/WYt6DyqC47GqrX1hnTSejIZSgru7Ez8BJNy+n2Fm6tCNVWDqNBi9/HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202961; c=relaxed/simple;
	bh=Ot25WLyqVRhsBXv9+FeXxetochqDJHUpqUPvyel2wpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vAGqN+SQ4B32XTkYCygKr5BfjO5s+L7fIyhBhkuxLxALXuvIil3WXG+YnDDUNaOrneWvpgzGplyI3ByFxFXhC7H4lqE/DbQpeOY6Y8ZRqL+GLzLQ71RyTcYUH7I2AdhdVq9179SHNpe2yhM480n9WIwucUUjVlBobkVBfrkBBkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkw6csQE; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkw6csQE"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e1942dfso1239907e0c.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 15:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202957; x=1790807757; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E15zTz6LSPQ0+KOjqcr732bl7v4sHhRkFWWTNxNbp1E=;
        b=mkw6csQEQ7AqKtLJR2aAcF0ZmtaGrUDNwo8GpAJ/bPtDtyt4y4rsZBjMF5oAJcTnEd
         g9bwUCG42GWauGWYyigy682Ih4yeFwW4TFkH/n8UNENgy8eIec1ywYsR6zvIMEwr7O5I
         rvEdrNpDJaJJ13XqB10l3iSUkt++/LLRDRAxjdIUtjEwgtMS0Akvm6T0FJ/t3bpnWjPT
         u4b8GTRBWdwa0EFFXKI8iuXKH3yTnexzMTKJMOPMjgKheY4ZBkwg76Dc4LiofT8os0gO
         gHfB/rD7KVHFWCqQ9pj5PVRiCW6qAsS6oXmtT7mzUvA5pBAcWLlCpV0k/0uYTy6gRfR9
         9Lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202957; x=1790807757;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E15zTz6LSPQ0+KOjqcr732bl7v4sHhRkFWWTNxNbp1E=;
        b=UNeBJ4Ju4aNeW8zEWh0Twomtsx0QJ5C7cmZWDAMrdFykMbJ+6duNTmhbTF57SCyVvi
         YFOccn0rg4opes/2/Py9yuzFycbIYHDnT/PG5G1BBK+iSslpXWSzEKrCbFc8o7iZU4FL
         PXqw/ToWdsPBpG6LmAwaRUD5+QkJf0uRJurW7yOOVZi+JvJzBF25nMmIVUrIcbkNPStn
         yFZCLpNwHnz2ocEKFEm5DUyFgnoQps4VXW7TdykY+Kdv4KhWnDkwDzGRTCefUfMBdmjb
         GXcquBSSHNZqP7s6mnpq4Kv92Eq6cqWkjUeNTpz9wC0+Nd2AoxfA2yJ5iEDiP+J8wezW
         w//w==
X-Forwarded-Encrypted: i=1; AKwUvBwoZ1Zpp8CQuKiCbJEtTDNBUobJxANHvUhOZAbd1t78v5uUvArdeu/RLpiyJ8pFtXFcrHztCYoUBC57osdqoeYYJU01+Q==@lists.linux.dev
X-Gm-Message-State: AFuF++kgLHlUeUHLrPRCUrMc/h+89KYEd5Pzd87Qqbxs38lA7Ut1NJmw
	NoL8zKUBYz4LUoFkZoL67m9HMuEfHVzq7raCZsKzsJvbl4RYftecr9s=
X-Gm-Gg: AYBFou3nRviwVXvQfz0XN7lJ7HTAydXPhq1xMjZju7Idg/6EG1NJ1kLa4hSe5TnQNCy
	wu2ZKn1NHgZHY3chdb6IrzUHVkryzWmmGXOPKztfm4X8efj7ofmjcb2JOIIfHy1ezIgTiXPOcDs
	8ioK7YqobezcekuIoseYmE5H58zL5IfOr5tU5E/SrU0lCte14C9g8eIH9dRAJTTPauLEtlGiz+k
	wrAlMB7GW4yuPxkpV4/ZrZbHjww7cAXhXSE1Qg2xf8GzbehO47TgXf3EMdqk4w4A5IP6yv8a77G
	urco3OSYMYputLylgFqZ8G8gciLCUdVNfomVIPx6sI7BNtDDuHx0HHZZX82g24NBu/PndKkP5tL
	IjMZIGkVp+HHh+dwKeKHuUDOwDUoh7+kiraqu7RPA9CKHj58KFqmubwM/dC/LRssNcB04YxgbgA
	fwpJrmJ/M9EqsRGAi9FQrG/e19qVxFU582qar5dV1Vshj+L8sQsIhcRLWBFv5GMhV1I0T4IABpu
	6dMo9wYjkF+EqeMPy3vIJ9nBnjUUunM4emeNFbquuxuf4hTUQ==
X-Received: by 2002:a05:6122:198d:b0:5c9:82a1:a6a3 with SMTP id 71dfb90a1353d-5cb08753a03mr590726e0c.6.1790202956828;
        Wed, 23 Sep 2026 15:35:56 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm5162983e0c.9.2026.09.23.15.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:35:55 -0700 (PDT)
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
Subject: [PATCH v5 1/3] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Wed, 23 Sep 2026 19:35:13 -0300
Message-ID: <b961c25f0b67968b6ef891f2dd3527508a374261.1790200427.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790200427.git.nico.antinori.7@gmail.com>
References: <cover.1790200427.git.nico.antinori.7@gmail.com>
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

