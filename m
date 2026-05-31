Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1320392819
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246832; cv=none; b=owSN3UDEIW0RLG6vjuwdLwrSV71gpK53dS6IkXtEAgrOaLXP6KcVn3CjzzZQSQOj0p7kv3fJrbjJ6mzg+psmVm/r8WXSw05DKi4bC2cFG7GKhzDsXr47wu6L2w45YdOZmB5gFD5mT8ibLMIh+w3gA2hHbFerwZgUP2AeE7T8DjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246832; c=relaxed/simple;
	bh=EOBpOIKoSoMieWyB4Iyyf+2+E8XFT3MTeLulNuhmax8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lkwzt0Ppg6/opha8rtxfONWeWVqWsd6hIabsZrcPUelL/pORfu2f99JFMmGelQmdUOmFRFUeWdJYQQRv5Y3IUGxPhP5yxcqlllOKPqVsalMKcLvqT05vFcanvOYCecwfESxb4HjrpgKZUWd2vfqoV3Yd2/7wv4ClR4EkuTI7Cso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/auHpaW; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/auHpaW"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36baec934b6so1318430a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 31 May 2026 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246831; x=1780851631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNZr3l3L/Od3rTaCElFlPcrYufd7SCc++/hp9yDvX+M=;
        b=O/auHpaWekxulR0K0NT7SKMwBqdBZJJe5qmhjErCI0EFcm6gu4f3HDY8a7np3BTVF+
         iq3ZIVaQ3fYTM/jCFPP+rD7nWRcirMjfOwcSjH0GqFXrJpElSiVoiARR0cyVw3NgRyid
         nb3jO9HD8GuEl1MtUl1LXms7lBQG6QUo6xfcFh1T3+LES6LQjktA1v1q8eKr9wP025/N
         bJYvMycJfMS3xbzVOvnY8MlWej/2Ftall6JYSW3veqqqpj6i2uYqB2xFTWtjukshmZ1e
         x6jbZJ6FXddMJ7AlzodimRBsg4a39AaNQFajj+HVMwkXYDjRQOzrhgCpQI5hN23s2VWq
         N3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246831; x=1780851631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNZr3l3L/Od3rTaCElFlPcrYufd7SCc++/hp9yDvX+M=;
        b=ILZrIQv+A26vC4hQVocAlBYQz9xb9h6WyaO4nmxUPv9F7g7AFDAaPIQ3bBYsHPUHIm
         rVWSJkoJ+yqXrYtEY46lkhSn26XZoiXmbYE0uqgY3dHOiCHNXpB8nzpPBLpkHeovqdwB
         CT3TqzIYkh3v5DvEkOxVB7CAEP+46YaEhonrv1y9mVPF2m8E0MD1bqsGHkT32QAph7Yg
         1+Pu/frWXT3mM1YOsxOj28aAovssaTCj+ZSX4iRAUP5jKYPuqceMrv41/cmP+rFd9tZ2
         d+Z5EjF/7umr1QN8tQMbXHny/2xstbuEn1u2MUao1fYz3y/diniicZzVrUX9PGdnBPvj
         cOgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lRNYz+O05Y3P0OrgrF/a+tZ5FT/ALfQ7gTg3AMooCT/eb0ZXG4Q3/0TUJ31V/6TkgpdTRK++B9fYrHNuHeg35HkKV/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIgtT4dcdYo/QoP1mBw/pncVNQqw2dzpg48cnmiRk6ljPzzj/D
	Ni/7JshR61qNPViMFnnsZP3SEfJrlK4BsapBx7IU4qVq5CYdWtqJOFWF
X-Gm-Gg: Acq92OHLr9B4871ubETeXkLvSHimcCQysoDWMzD1TABAu/WUSuJftDDGuDaAefgGlAO
	RZYfluaSXy/6dy/OZ6hw84cSPDmjXyZ9WOuW+J9KY6EBz2+K+jB+uYjlKSErmUaaNQdNaMNJzJ4
	l4YrfNPFMaZvJc+9+TedvJsk7tI2VDSJHVHrUziwmCP0csfqoi87KxtAdDwloXYLqZIcxsi66A2
	yyB7C+TqJuNbCBHA7kn9BK4YEVFLbBm3YPziknVngG82jZvY9ss/UrNI9IYphT/ZluRMc83a8xN
	U1QDe+hZgH0EaQpNtCoYNY+8miNq79tgGYZsGb3u1qjQbLnIuLWZTYGyABVjKKzElVjHWvm+2XY
	usOodMBqPqL6boyr0O4vNGaDcYLycXIooaUU7LhHhdEI9oBzT6gGft3Od7qY+6eMTwjvf7LeCfd
	WORMae/HVmKgcVU545X+waD//Ct1k3xbkKL8cWUY9Q65bcGVqY0v3JggkVUruiGfnLREWQmHZP2
	caxtw3+n3TEj8DYSaA=
X-Received: by 2002:a17:902:cf0d:b0:2c0:c8a8:dbb8 with SMTP id d9443c01a7336-2c0c8a8dff7mr27171725ad.29.1780246826053;
        Sun, 31 May 2026 10:00:26 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm99331075ad.20.2026.05.31.10.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:00:25 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] regulator: dt-bindings: mt6311: Convert to DT schema
Date: Sun, 31 May 2026 22:27:12 +0530
Message-ID: <20260531165712.729635-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert mediatek,mt6311 to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 .../regulator/mediatek,mt6311-regulator.yaml  | 72 +++++++++++++++++++
 .../bindings/regulator/mt6311-regulator.txt   | 35 ---------
 2 files changed, 72 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6311-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
new file mode 100644
index 000000000000..a51db46b0f41
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6311-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6311 Regulator
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  The MediaTek MT6311 is an I2C power management IC that provides one step-down
+  converter and one low-dropout regulator. The regulators are named VDVFS and
+  VBIASN, respectively.
+
+properties:
+  compatible:
+    const: mediatek,mt6311-regulator
+
+  reg:
+    description: I2C slave address.
+    maxItems: 1
+
+  regulators:
+    type: object
+    description: List of regulators provided by this controller.
+
+    patternProperties:
+      "^(VDVFS|VBIASN)$":
+        type: object
+        $ref: regulator.yaml#
+        description: |
+          Regulator nodes.
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      mt6311: pmic@6b {
+        compatible = "mediatek,mt6311-regulator";
+        reg = <0x6b>;
+
+        regulators {
+          mt6311_vcpu_reg: VDVFS {
+            regulator-name = "VDVFS";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1400000>;
+            regulator-ramp-delay = <10000>;
+          };
+
+          mt6311_ldo_reg: VBIASN {
+            regulator-name = "VBIASN";
+            regulator-min-microvolt = <200000>;
+            regulator-max-microvolt = <800000>;
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
deleted file mode 100644
index 84d544d8c1b1..000000000000
--- a/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Mediatek MT6311 Regulator
-
-Required properties:
-- compatible: "mediatek,mt6311-regulator"
-- reg: I2C slave address, usually 0x6b.
-- regulators: List of regulators provided by this controller. It is named
-  to VDVFS and VBIASN.
-  The definition for each of these nodes is defined using the standard binding
-  for regulators at Documentation/devicetree/bindings/regulator/regulator.txt.
-
-The valid names for regulators are:
-BUCK:
-  VDVFS
-LDO:
-  VBIASN
-
-Example:
-	mt6311: pmic@6b {
-		compatible = "mediatek,mt6311-regulator";
-		reg = <0x6b>;
-
-		regulators {
-			mt6311_vcpu_reg: VDVFS {
-				regulator-name = "VDVFS";
-				regulator-min-microvolt = < 600000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-ramp-delay = <10000>;
-			};
-			mt6311_ldo_reg: VBIASN {
-				regulator-name = "VBIASN";
-				regulator-min-microvolt = <200000>;
-				regulator-max-microvolt = <800000>;
-			};
-		};
-	};
-- 
2.54.0

