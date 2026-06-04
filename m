Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFED30CD9E
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Jun 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590550; cv=none; b=DPj5Xr/3o7RGPrvGGoHnHoFuk+XBp/g6NLHaKUzR5cuFNY6nvv2Efo1MMIjmMHthN92k7wRKE3bgSqE/Mcii18xncc1x3v3rj8T8yo7r2kOiRfq7jBiVbM+V+uF2fdtx0l4L2HRnd4uM+4Ntt5h0IFhrvKqGFneLGY+zWPb0a2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590550; c=relaxed/simple;
	bh=BjQy2w8UgFsLUjww8QvJ7ljJMmBMyTaJyKGYcBMnacc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lvyh5tZFrSBcYrEOsvkLAsPi00ARA3XufHwVwnXk6mIQGVl3RG2WBfRpsm9xQ//WnFx4W3KCPF5iANjwU/wPHBGMV63VMG7ytjm3nJhE8p9o2X8P42e1wR4MGJkuKdjresFvBvawnHBry+dX8Gczv/rthM+AxGBc/xYGJNfpqIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBsUtgfR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBsUtgfR"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36b9033d230so552762a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 04 Jun 2026 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780590548; x=1781195348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tt5XveIXPd5LExPILUEQj2Sv2Xr+T+q71wH/D2X5w18=;
        b=mBsUtgfR/fqfq3rGizTQKsBcT0wHhoQXzCZfcEySE634bJ6dw/5yaKPQAL+ITan48j
         nW0PXYX1nWbgnB8DMwTPjzPSKg+f5ScL7cNXKhFSFlWvdOMZOjNVrkdJb4PnZ3Gh4O6U
         Z0hPjmR+84l+g6Pfese7CvEKOxWnP+uOgjywQ2WWGY0IZYBpDvybK8O9xrlqL/8XV6XZ
         KcKqTogHAUGfQi+iFDqN4FRH/JPycsjyt170+ANyJCYQ9D/MpIZSD0XpVy+Uz5c/amCR
         SmWmMXlYzw5gBFsDlLZaf5UAOUnpbdABG+ZRCFU1IjTDBo/3wg04BitOACVyPKya6uPw
         5uuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590548; x=1781195348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tt5XveIXPd5LExPILUEQj2Sv2Xr+T+q71wH/D2X5w18=;
        b=WtiCKh6fnH7BwUdwZKDN8apxmNzeUNdBjU//WtV1UktFzhuIWQYWsW3pHnXRXxt0TZ
         EsW89uxhyYOx6As1bRSDlllTFNFWXkCpkmQDbFsu0yTQR46l+E1YMcsSy/2Iz2HB79jF
         374CMcDn+KLJqU79kO9AGzku4X5YYW20zF5qsYqqG5jo+9VFJV+Odf5YaLO4cq6jmkPM
         TEjYKzVnC+PHE7a9xuyeD49N1Gu8RGrlU8a2YhI1b97PW4VrHLMCVFH0xzg6Mb+1cTx2
         G7iEK3J2rLvBW/8MRyJcZ9ZZtesZU9kkr3EY1kPPFb7HKn+HS/zIbDHBiMkKQ+FQuH3Z
         UZcg==
X-Forwarded-Encrypted: i=1; AFNElJ88plbg1YSgpINu2oQ+2x+Hn+kOBKALyBisXv2cGrmNihIRjHc1lfHBgz/rPNAfiY9zCWhI94bcLx7sjoBjX1rj8XRPCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YylVNWH7f6pKvPd+YCiesus3d5S39OB6ZK5cyy53TsFw0YLd+8f
	fbwInUfQwPsfTalp+luK8SHBLYrCk2pT00YGv0+GfHetlrf2aGfi/LaC
X-Gm-Gg: Acq92OEa+tKUzaNS81O94DNwRFXTRPzFhnZdxU37qDzbvWIYCUnQ/VSi/lkTIRBAMRO
	u69e2h/zrYpolA/urMrF/ouGbN/zQcgSu/he7ea+RcYrgIaqXJw3ssxnAYjw3sUlnYSlehKiJEK
	h5T8GFsTwCMpRwq8fNHsLiRzfldUbxPTD0xBQTWITYokxfgOt7OLR9Aoj2MrSuru6F1HbbjasVW
	UTAMjv34ipGVd29SO6iFGn4hwulMW3HVKk/cI1yvshio8yJqjg1YXAZB6CZV/JcQd+Zem6PASrb
	x99tQbPMe1vNxBSPLGbXw5S2rTCq/u0sxqSeL5uOdO8wzsCQygIx1DUDtDYC/B6qJVCrNy+Yzsu
	UxE9pjDMRt6hJp1wmAhqwAcsCixB1pYaWGhTzTv0Sw5Z4mrJ+CFdVq7/zeYbG4kfSyWQEPzpgv1
	If2Zic6Su2WRnise0RoNGaqWdiQQBqrTWPjvDVmQdgtpgfqbikdjDhTuNdjJ3VWljMyAQSmYgYK
	z4AhVzKFxjVm2TZ4wdf3l2WrJeK
X-Received: by 2002:a17:90b:2b4b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-36f781bded1mr3553423a91.15.1780590548307;
        Thu, 04 Jun 2026 09:29:08 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f712de91asm3670255a91.16.2026.06.04.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:29:07 -0700 (PDT)
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
Subject: [PATCH v2] regulator: dt-bindings: mt6311: Convert to DT schema
Date: Thu,  4 Jun 2026 21:56:24 +0530
Message-ID: <20260604162624.644241-1-ninadnaik07@gmail.com>
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
Changes in v2:
- Correct "MediaTek" in the title.
- Drop "|" in the top-level description.
- Remove unnecessary regulator node description.
- Remove unused labels from example.

 .../regulator/mediatek,mt6311-regulator.yaml  | 70 +++++++++++++++++++
 .../bindings/regulator/mt6311-regulator.txt   | 35 ----------
 2 files changed, 70 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6311-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
new file mode 100644
index 000000000000..f65ee2c90298
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6311-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6311 Regulator
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
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
+      pmic@6b {
+        compatible = "mediatek,mt6311-regulator";
+        reg = <0x6b>;
+
+        regulators {
+          VDVFS {
+            regulator-name = "VDVFS";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1400000>;
+            regulator-ramp-delay = <10000>;
+          };
+
+          VBIASN {
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

