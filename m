Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5455D193425
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730959905; cv=none; b=TYMDDJut/W3KHGQMdiZ0hGXn0ZlwrH2KWHXKQlzsMAwWPW0JqR56o4S4D5+FneiZeC1DFv90Y/bsGEz4SsAzyVFWUGkTPwi/e3yVY6gKH4VhHNPA5j+3PoxyiOAsFIXf0EIr+64d9zyo3Hh4g4ebvOa896So9vBfpCzxq29z8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730959905; c=relaxed/simple;
	bh=ns+qICv4ryQ7JfsDRazMozL0fDUROfR+O8kTeP4q2ck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RNLz3ISR/MaL308UGN9lier3HvfwAcJBlhtPJSx2qVBccpDqNWvFfmjUrNPSlyZbLA4C5jyUwux7KnyV3QHsRCpSYGkbtOFvYtCphRdNs/44ClrlJ8c7P3D9P08JF54pc1Dy3Lg+5oGkCbi12LJKjEKAZMWwxgtqLCAQSZ1TN+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6+m2Zb/; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6+m2Zb/"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD37881E7C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IMEBDthufrc for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 06:11:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93E2981E80
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93E2981E80
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j6+m2Zb/
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 93E2981E80
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:11:35 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20cdb889222so6367795ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Nov 2024 22:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730959893; x=1731564693; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXBEpFmFzi8INkB2Bb0DSvGG6kE3LNqjdEC99i0wI3w=;
        b=j6+m2Zb/0hQqo1GBT98P9hHPpY1S2Bh83CT6XiCL4hFI2WN7TWxGeXyIKWB2isZ2jN
         7+OZGd4Fo/38HuTPWazoP5SWp5LpoB9Ys13p+fTrQ3ufUHvYyIH9hxa9LlQPOtYGa5BY
         /jiGtj4i7cxnDKxW/6ILMVoPyMkh4xv8z3EH7QV1WYgcnLZiSBcj3jkMDTxbD+i9iy8m
         SjtBOdaKlXXfOp1cf5q38DPHJBbwp4e/B0fDehiDXEjl+MSE7h7IDCgUenNsFU4kJeEu
         9oBIx+P42FWHDFq/WvqhFzWSAQ66CkY2jfFgD++nZESljfor3Xm6WLeIEt3nNJezyneD
         0HZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730959893; x=1731564693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXBEpFmFzi8INkB2Bb0DSvGG6kE3LNqjdEC99i0wI3w=;
        b=CG8WAbSp184NUNqaYDqr+MOUmM6/aNUb1daKR4ZawuobVM4IaUqbYo9rryeOuWYd3n
         YJzHHrUN4NNMN+zLJN98Ih/R12Jpt3khEjiU6caJ8VMpPn9zWmH4U7CI8xnEx2Iwc1a7
         /fTR4NxIPcrR4PHwE4xp8UfbIPoUms1IJRKMTh+icMTOoaWhxwagbF2Y/jFMZ5nMxt9m
         xkKkxEc32ByXkMMdn5C7+vrZZRBXtMVXw4PUdpEKRF/1MtiSv5dpn+ZjiTeCBe3Yybv6
         x81tI6tcf6BY9s+1DwcEdKOqhJY91VT8cWJk41DmrFWWlGWJF9hYZ3fcHBWoYBcbj4+/
         gIDw==
X-Gm-Message-State: AOJu0YySytDL6JA6/ITdd2SOMB4nFNes7ElEv2lc/yuk8dEryunaw0X2
	1ZghiXqJcDB3j3X0Q0L/vGrA7iCV+h5r6vcpR+32Au9Zj+nSDf7nVPAkAF3k
X-Google-Smtp-Source: AGHT+IEhLX1Ix3kvbnhGTk3oM5FNMOle9lT4S2S6mmMGQXogZWZm53W55lSd+4P4hV9Wykx6SDq4ig==
X-Received: by 2002:a17:902:ec88:b0:20b:8ef3:67a with SMTP id d9443c01a7336-211785b1234mr10045595ad.7.1730959893349;
        Wed, 06 Nov 2024 22:11:33 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7cf8sm4652465ad.34.2024.11.06.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:11:32 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 2/2] Documentation: dt-bindings: Remove trailing whitespace
Date: Wed,  6 Nov 2024 23:11:24 -0700
Message-Id: <20241107061124.105930-3-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107061124.105930-1-xandfury@gmail.com>
References: <20241107061124.105930-1-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace from devicetree binding documentation files:
- regulator/regulator-max77620.txt
- interrupt-controller/nvidia,tegra20-ictlr.txt
- interrupt-controller/msi.txt

No functional changes. Issues detected using checkpatch.pl script.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/msi.txt   | 10 +++++-----
 .../interrupt-controller/nvidia,tegra20-ictlr.txt      |  2 +-
 .../bindings/regulator/regulator-max77620.txt          |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/msi.txt b/Documentation/devicetree/bindings/interrupt-controller/msi.txt
index c20b51df7138..2109a3454cf6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/msi.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/msi.txt
@@ -12,17 +12,17 @@ potentially including additional information.
 MSIs are distinguished by some combination of:
 
 - The doorbell (the MMIO address written to).
-  
+
   Devices may be configured by software to write to arbitrary doorbells which
   they can address. An MSI controller may feature a number of doorbells.
 
 - The payload (the value written to the doorbell).
-  
+
   Devices may be configured to write an arbitrary payload chosen by software.
   MSI controllers may have restrictions on permitted payloads.
 
 - Sideband information accompanying the write.
-  
+
   Typically this is neither configurable nor probeable, and depends on the path
   taken through the memory system (i.e. it is a property of the combination of
   MSI controller and device rather than a property of either in isolation).
@@ -48,7 +48,7 @@ Optional properties:
   not encode doorbells or payloads as these can be configured dynamically.
 
   The meaning of the msi-specifier is defined by the device tree binding of
-  the specific MSI controller. 
+  the specific MSI controller.
 
 
 MSI clients
@@ -117,7 +117,7 @@ Example
 		reg = <0x1 0xf00>;
 		compatible = "vendor-c,some-device";
 
-		/* 
+		/*
 		 * Can generate MSIs to either A or B.
 		 */
 		msi-parent = <&msi_a>, <&msi_b 0x17>;
diff --git a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
index 2ff356640100..0c37e569e6f3 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
@@ -12,7 +12,7 @@ Required properties:
 - compatible : should be: "nvidia,tegra<chip>-ictlr". The LIC on
   subsequent SoCs remained backwards-compatible with Tegra30, so on
   Tegra generations later than Tegra30 the compatible value should
-  include "nvidia,tegra30-ictlr".	
+  include "nvidia,tegra30-ictlr".
 - reg : Specifies base physical address and size of the registers.
   Each controller must be described separately (Tegra20 has 4 of them,
   whereas Tegra30 and later have 5).
diff --git a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
index bcf788897e44..7484c0728e27 100644
--- a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
@@ -65,14 +65,14 @@ Following are additional properties:
 					Valid values are 0 to 7.
 					This is applicable if FPS source is
 					selected as FPS0, FPS1 or FPS2.
-			
+
 - maxim,active-fps-power-down-slot:	Sequencing event slot number on which
 					the regulator get disabled when master
 					FPS input event set to LOW.
 					Valid values are 0 to 7.
 					This is applicable if FPS source is
 					selected as FPS0, FPS1 or FPS2.
-			
+
 - maxim,suspend-fps-source:		This is same as property
 					"maxim,active-fps-source" but value
 					get configured when system enters in
-- 
2.34.1

