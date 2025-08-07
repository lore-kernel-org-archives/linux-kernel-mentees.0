Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D621ABDD
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  7 Aug 2025 19:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754594340; cv=none; b=HgweiytqXeIa1brB0fsA/5zDNcDDTFKqQ8cf0GMgDRlia5c8UFRaY8AZL1hudbzf26lYGeMss3+WMI8EvPs7TFw8uA5EnnyBcwNJLfWl7JHpOYkB8VrME01ea46DvqGjylzP4vfCkZonjE+rOMGhf40ub9y3M81Jal8MQvsbpTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754594340; c=relaxed/simple;
	bh=P6CYGkCBsS2/j/K0E7tBx1r/xDresPDft3Hy8CqhCSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CD/3unMMbQSHpJqzuY7FXHE6BvxZbeBWC3akPQw0R3ltYRtOl3DnJQW2xlWe839H6CPW+VsAgs8cRUPbCQD3wW0A7UPNEfRm0OSInWgoEBrAkPn3zODD7nrVP3jLN6TdDPhaPuILDZDgd8jE7omGizA9PBcTr/GTh52af7hWIho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=EwJdssL9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="EwJdssL9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b7886bee77so1080951f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 07 Aug 2025 12:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1754594336; x=1755199136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMojSpDs0TkBAWsUruscamCHlztjGhkLSL63bamzheI=;
        b=EwJdssL98N3QdZd2BfYaNfOKjthP9MFMkNfl06XNSe1nTz3LASi0td4bZe6VuuhOuc
         N2Rem9t1d3jOADCWpkG7I1e4hG9Qx2TTJUlSCuWnxt83w2EbSQ1nlSLmrl4w9Gizhozo
         3mtlDS8zfiXda81rk/1co9viGoMqNIRvJaipmJvAZhEOQOhCyp+wSVsnQjb3qHgTve98
         4oSgYAiWOEklK1om7tBaiV8FDMp7PVrTGwZr9ilmeW2tAK/oLELr/buJ72ZaNw9yrB7s
         9+0turUbHhE0dOWCh+CnkbT+8n6+Y1gtpQZ1Hz4uloK4xf+ucAv79a8lUuYfRZixRN68
         BBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754594336; x=1755199136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMojSpDs0TkBAWsUruscamCHlztjGhkLSL63bamzheI=;
        b=LHUZf2SPosUPI7/UX16XQ/gcUVOPZGjWUwojSvH4QROmLlJYGhD/qaBeS0QStND9yl
         c57Rd2z18XPY7tJYRg6CxDJqjXAFYIjhwrYFoJPiW8MQRVRnFhD46WVHc6M0ZFGYS/RT
         sARuHoCLvnghXsqoxFoIIA1wzbLJ7P03TkwQsu8u2iHNqSDfjKPsTjXZDRvF4hj93U8z
         ddnq4O1DelpYefV5ef5gx8KjiHM/Cn6aRwwboiWKUnELmOmnsV234no9/jmItSXerI3/
         G22GeyDb8BuQjGkelebIFGKnYz4+ZU/dkDtmUVclLGQgnk6aJuvJmszY21hwFpxf5ZR9
         ofzw==
X-Forwarded-Encrypted: i=1; AJvYcCXf2ZiVIk2u4+mn9IJXuwpJJ4oUyAK3Ylha6JAhhd2KBOHVicfbX57+aN77/Q/DmocpIWnqlFLjqJC9MEzdc+K83PEg4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqqZkNlCMnjzBtQ3vZONtXrSNPvven5Q3awVMLTB2RBplbHY3L
	BLESg+OefytR4wqYoF3YrNh/tt9scsg+TdiV+Qk3URJV/0OEz0qTakButhrg0aYLPlE=
X-Gm-Gg: ASbGncvMmvV8KbaP0KM3DKy4+faNZCtuuqUCt2Dt1bVB1Pc9500PWjejQiyYG3rHFBM
	tBzT3chU5ZtHQHPFpDRA20/3fmBjzvfeR+BIrmfev7z8+oPPKdBqodBONKBPJMby7BdOOPCv+EN
	TsSFJrnoRyj0ldGd6T0/O1Lt3V36w6xElIw7pIeJxV552Sb22TTNJKvZHYZ2ooMnipJqLo6H6Ts
	nQ/xtzYWpTK6+VwDXA3ZKntXs5X+Bn5DHKfPrgdtin5B5LIbzWjQEN7lZC4zklQYwSG9Jt9DvNB
	jPWB3uJRlt32HxpUubwvPKjdnvKsYCNmbGrUI1v2wG9JctOZ/USYQFrjEhyevHpctAOMCTYdxnz
	FgbEEAIPTK8peYc2rdbvX1JEJxYUFnepBP/bgBJ/qq8GrUVLcUg==
X-Google-Smtp-Source: AGHT+IGmsZp5QGEdNPY5skMi/ehXySxn/2GJ+zanQmX1/LX2oBeqJ3fxjEoYN3cf/lF9eTayqWyhUQ==
X-Received: by 2002:a05:6000:40ce:b0:3a3:65b5:51d7 with SMTP id ffacd0b85a97d-3b900b54b20mr297294f8f.26.1754594335784;
        Thu, 07 Aug 2025 12:18:55 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:3bcd:db43:406c:324d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3c4d02sm26988589f8f.33.2025.08.07.12.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 12:18:54 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] riscv: dts: spacemit: add UART resets for Soc K1
Date: Thu,  7 Aug 2025 21:18:17 +0200
Message-ID: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reset control entries for all UARTs in the SpaceMIT K1 SoC Device Tree.
UART0 was functional as it did not need a reset. But the other UARTs were
unable to access their registers without the reset being applied.

Although perhaps not needed I did add the reset for UART0 as well,
to ensure consistency across all UARTs. With the current-speed set to
112500 baud rate, it matches the factory U-Boot settings.
This should not give issues with early console usage. But perhaps it could
be a good idea to let somebody else confirm this as well.

Tested this locally on both Orange Pi RV2 and Banana Pi BPI-F3 boards. 
I enabled the UART9 and was able to use it successfully.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95..7a5196a98085 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -667,6 +667,8 @@ uart0: serial@d4017000 {
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
+				current-speed = <115200>;
+				resets = <&syscon_apbc RESET_UART0>;
 				interrupts = <42>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -680,6 +682,7 @@ uart2: serial@d4017100 {
 				clocks = <&syscon_apbc CLK_UART2>,
 					 <&syscon_apbc CLK_UART2_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART2>;
 				interrupts = <44>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -693,6 +696,7 @@ uart3: serial@d4017200 {
 				clocks = <&syscon_apbc CLK_UART3>,
 					 <&syscon_apbc CLK_UART3_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART3>;
 				interrupts = <45>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -706,6 +710,7 @@ uart4: serial@d4017300 {
 				clocks = <&syscon_apbc CLK_UART4>,
 					 <&syscon_apbc CLK_UART4_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART4>;
 				interrupts = <46>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -719,6 +724,7 @@ uart5: serial@d4017400 {
 				clocks = <&syscon_apbc CLK_UART5>,
 					 <&syscon_apbc CLK_UART5_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART5>;
 				interrupts = <47>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -732,6 +738,7 @@ uart6: serial@d4017500 {
 				clocks = <&syscon_apbc CLK_UART6>,
 					 <&syscon_apbc CLK_UART6_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART6>;
 				interrupts = <48>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -745,6 +752,7 @@ uart7: serial@d4017600 {
 				clocks = <&syscon_apbc CLK_UART7>,
 					 <&syscon_apbc CLK_UART7_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART7>;
 				interrupts = <49>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -758,6 +766,7 @@ uart8: serial@d4017700 {
 				clocks = <&syscon_apbc CLK_UART8>,
 					 <&syscon_apbc CLK_UART8_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART8>;
 				interrupts = <50>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -771,6 +780,7 @@ uart9: serial@d4017800 {
 				clocks = <&syscon_apbc CLK_UART9>,
 					 <&syscon_apbc CLK_UART9_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART9>;
 				interrupts = <51>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
-- 
2.43.0

