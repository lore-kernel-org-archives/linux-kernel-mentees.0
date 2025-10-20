Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42543128C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760969401; cv=none; b=PVJpfooFXYhAlkVI5zL1Io6JgJqja3pT63PJIPGaEPutNKv0JiRHsh0ws1gWRXdON4ECgBtuu3VPFB2xFUj+iX6wyVwgviCtr+XHcB189flc6oOCt7WDr+xfKmYMRGUyWZWAlkCHrED+oeT0gwFAsG8bVUNeTazQ7vGhhMgnEMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760969401; c=relaxed/simple;
	bh=mj7mtAXynUlbGhhLJG7Mwgh1VRhEJ2oHwjlG5PZy+A4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NHyZITEMvWhHpSLDJ2G3fMyqjdj9Ek8FU65cemJ5TbQEZk2cjN76LyPi1wd2s1pW1mBTwK4yt/Cui9EurkvJAAtt10MKUdXzbhapK3ZlX3wYEpLn3KB5kD3uSuDcf4uqIJgFD2XE1Kq58bAhWceZiuG0dzNhnOwBWBSanngKf6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmx.de header.i=erick.setubal@gmx.de header.b=h26cGRMZ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=erick.setubal@gmx.de header.b="h26cGRMZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E0048416B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 14:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.488
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXmfhXjq9rTs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 14:09:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=erick.setubal@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED7C284076
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED7C284076
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=erick.setubal@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=h26cGRMZ
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by smtp1.osuosl.org (Postfix) with ESMTPS id ED7C284076
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 14:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1760969395; x=1761574195; i=erick.setubal@gmx.de;
	bh=ilaKx3VrCzJFqFkn9EEeILAPzWt543OSLHXWjNxF3LA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=h26cGRMZuj5zicWdi52+EA55k7ALW6FOZBnbu9z08yLNhT2Q1KyT60exT1apTH5t
	 4Sr79eZyaBMvwe+Iij6pdgyYvKjKYUnxTwhg7TmVBkyH2IFunBZmWGmOo5EWTHJAY
	 /BR7JehdfZhwfxPNtoltS2l2kdwROHv/GWpYDZVoc9dTjWQplYpNAMyQvzOeSrmOd
	 /Zo/MIFITouOm5pIWmJgTc7MrwNB3q7MqJxHwaNQWiAHzU+mu8OD3/Cyk4Q0eDJBD
	 ibsGzyXxFy0R07FBKSLOVALhMP89J8Sq5gRS8JwzDndW9CJGD/0THeWjzQ9Toe7im
	 V2L5AzY1zJIiYRnTZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from zolxn00301.speedport.ip ([84.145.119.168]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MA7KU-1v3k1D43Tu-00D24D; Mon, 20 Oct 2025 16:04:34 +0200
From: Erick Setubal Bacurau <erick.setubal@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	david.hunter.linux@gmail.com
Cc: Erick Setubal Bacurau <erick.setubal@gmx.de>
Subject: [PATCH] dt-bindings: leds: Add TI LM36274 backlight driver schema
Date: Mon, 20 Oct 2025 16:04:28 +0200
Message-ID: <20251020140428.246460-1-erick.setubal@gmx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XVHZcp4uVhOorQkpFmxIkqTy42AxfclF+bCUZrhh0puG1tRkEJz
 2wwdwhvubQoYTl+DoAvN/t7hnY76sSpjKSODma8SECeSWZ0rPaNPDfY9Wv0mjbcriYXCuGp
 J4CK0ojmWANMpFBUZBw70pPUKm3v2o8d6f7SFX/7YA5OLAUfo/sW2KxicZgZZKIvUERGmxr
 iba9k6O1CTrg2s9ZNF5jw==
UI-OutboundReport: notjunk:1;M01:P0:AuXUE4pR5hc=;K1Lezke6G7ZsivDeVtHbgNxzGFQ
 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
 humPYAJNfGK21fjNtodwd2aOck=

Add the DeviceTree binding schema for the Texas Instruments LM36274.

Signed-off-by: Erick Setubal Bacurau <erick.setubal@gmx.de>
=2D--
 .../bindings/leds/leds-lm36274.yaml           | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.ya=
ml

diff --git a/Documentation/devicetree/bindings/leds/leds-lm36274.yaml b/Do=
cumentation/devicetree/bindings/leds/leds-lm36274.yaml
new file mode 100644
index 000000000000..390ca660c0be
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm36274.yaml
@@ -0,0 +1,81 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-lm36274.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+title: Texas Instruments LM36274 4-Channel LCD Backlight Driver w/Integra=
ted Bias
+maintainers: [Erick Setubal Bacurau <erick.setubal@gmx.de>]
+description:
+  The LM36274 is an integrated four-channel WLED driver and LCD bias supp=
ly.
+  The backlight boost provides the power to bias four parallel LED string=
s with
+  up to 29V total output voltage. The 11-bit LED current is programmable =
via
+  the I2C bus and/or controlled via a logic level PWM input from 60 uA to=
 30 mA.
+  For more product information please see the link https://www.ti.com/lit=
/ds/symlink/lm36274.pdf
+
+properties:
+  compatible:
+    const: ti,lm36274-backlight
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+=20
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  label:
+    $ref: /schemas/leds/common.yaml#/properties/label
+
+  linux,default-trigger:
+    $ref: /schemas/leds/common.yaml#/properties/linux,default-trigger
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+patternProperties:
+  '^led@[0-3]$':
+    type: object
+    properties:
+      reg:
+        description: LED channel index (0..3)
+        minimum: 0
+        maximum: 3
+
+      led-sources:
+        description: Indicates which LED strings will be enabled (0..3).
+        allOf:
+          - $ref: /schemas/leds/common.yaml#/properties/led-sources
+          - type: array
+            items:
+              $ref: /schemas/types.yaml#/definitions/uint32
+              minimum: 0
+              maximum: 3
+            maxItems: 4
+            uniqueItems: true
+
+examples:
+  - |
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        backlight@11 {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+            reg =3D <0x11>;
+            compatible =3D "ti,lm36274-backlight";
+
+            led@0 {
+                reg =3D <0>;
+                led-sources =3D <0 2>;
+                label =3D "white:backlight_cluster";
+                linux,default-trigger =3D "backlight";
+            };
+        };
+    };
+
+=20
=2D-=20
2.43.0

