Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528B231DDB7
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 15:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790027; cv=none; b=Oxdx8AV5FT3WhXDBOgucAaylvMFWHL9NYVmxBFEF4zDKkouIalC7i6qOgh9CE+2g48HxtneZrf5riJErUw5CqbumdmoOELPyOPBEtdw9hUquu68Rvg+oD7ugYi+brZmQgSdqquBuGmOxsFvq5L+Hsku0WAWdD4uqN1llKgZMtk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790027; c=relaxed/simple;
	bh=pTn8q9gyy4U3k5WPUfs8ClUunMArOq9kWVVYSQNm6jA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZM/9+/M7rdqwf6iYjTywH2GpqTUPZi5OjPdItQflWAGYd1CLOrDtALud1qQZyPSsxqt/AAyt1fcI4Ll6bfQvOwKwEK/o5z9aD/1gFcEeLbraP8TwYSIm25nrFy0Ie62YSfAHSIMCp7lkq9x4MLC9zGyQ19npQI9PVC6NfPacgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=j4GkwgME; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="j4GkwgME"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b098f43so8282535e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755790022; x=1756394822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sjxBGydTfjruOh7OE8E/RbRzU+dSv4jaJNJXDHUfdU=;
        b=j4GkwgMEPiVrgI/xv8bYdhT7Sow7rscMoYFFi/eOG83HroiOSja7DyqXb4fsx9QbKu
         JN/udpL0xjtjyf814a9dNq6fDbAjtbAcH2pGjEimnYnuT9WoiSHgIgXwWr4AIhldS0gR
         axONhNZxsILzkQotMQ1EQL7jPPPBnI4+HQTDBGM37fL5m4zXHezjKQgix57kSZH8oMWb
         viOn7mFCcnM4kmuPCIjjJD0WEeljg1y62L5DeoMd3WhktPI8LuiJBoTkHgun+N0U/CPc
         bTKX4W5cbGkritwMB4Lh9x0n1WOgcEMc3tkaSZTeJJOrPKwMzvsb9ThKRU6BUmhrlyH9
         TE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790022; x=1756394822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sjxBGydTfjruOh7OE8E/RbRzU+dSv4jaJNJXDHUfdU=;
        b=AWgJ4YHvO5BSQvnclGrTft2FH/Iuil1zhxQBu95oiRjgQMFiWYMaDiFwFaP4clyPKq
         0kzUykvir77aJ5tkg8Hx0Ex9srBb/W4yoljuFZc7nc8YyO7JOi1crdd/TrmiDNcULJJX
         NgzMmwfnLGJ8XeDBSD+XmBJeNcAQ3Q6GgkBErDYHtF3p84Ka7Wi99kYvH6K8/5z3C55t
         28glsc/7CJ2GCrwCh3/V1SQMVtoStjkH9h+U0zQyVTFaJPz1EuD5rf3EC4heKpt208Ov
         VhKFAihW2aoNF4AqkHJZ1LXDArewZTQtQUAZAUqy7mwqpS9BKQUrVMvW2ZGWRuFTu0Vg
         7Npg==
X-Forwarded-Encrypted: i=1; AJvYcCWDEvfmJO3PKEn4ilz5fzxu78GfCpjOjTAoc/pOh6I4qo8V4PnWwyk+pd//SgbfkS/cPUvd1bdmaBn9jC1ZblktuxB8fg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUgKsurmjztEJbT0gd43lkkyqSc+50qMxmZDwqT5J6ZhD9fIfi
	fDqA3VRUKBuVVDkFK2GPKBfhbVY11dIA+3JybARJXrFJ7J8KF82L+pH2+FP1CHFW0pg=
X-Gm-Gg: ASbGncvcM91i5wUdV7WVyZzwO0ufQLTUfd2mIp2dIT/fsAza0U1RYQwOeoZG7n7gFm3
	dFvY8tK0tgGqKK43iefe+zio5tcOvaTmEhKaRGbb218fKCSszosZ8BvRKKFKuNG46Uxg9oleg10
	lRXb1BfzjBl6WduQpAf34is015IewcCHjjbu9PFMQsipLYFt5CjNEPSO+a2y0AyHHcxhf+F4wv2
	WbybWATRN9qlVbXjvk3MQohTP0Z8lUn/QVqqGWOc/4aL6Itrrsf61wRrZf1CjclVeCiTI1pnSyh
	GDkgShJ/ZpGFpKJzzAU26DXtgYdofI0iJ5WbbqXe3w92QS+OyKfpAMJp7Y5vOKsQDpIsu0HkGRF
	LaOKJaAB32weNhhUw1Me958or4IZzC2OjDxI6yeeh7cm8NGHNjA==
X-Google-Smtp-Source: AGHT+IE+4ute/Nv5CZt5NNaDUwvVYtWu4YiNVI45PLItPoW2P50dq71Gb9k2LF4AVVqf2Lr512IxQQ==
X-Received: by 2002:a05:600c:1c90:b0:45b:4282:7b60 with SMTP id 5b1f17b1804b1-45b4fcc3244mr15901095e9.34.1755790022155;
        Thu, 21 Aug 2025 08:27:02 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:f5e3:b428:f4bc:eb5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50dc00b6sm1538345e9.2.2025.08.21.08.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:27:01 -0700 (PDT)
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
Subject: [PATCH v2] riscv: dts: spacemit: add UART resets for Soc K1
Date: Thu, 21 Aug 2025 17:26:19 +0200
Message-ID: <20250821152619.597051-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UARTs in the SpacemiT K1 device tree are probed by the 8250_of driver,
but without reset lines they remain non-functional.

Add reset control entries so that the UARTs can operate when mapped to
devices. UART0 is already de-asserted by the bootloader, but include its
reset as well to avoid relying on bootloader state.

Tested on Orange Pi RV2 and Banana Pi BPI-F3 boards, with UART9 enabled
and verified functional.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
Changes in v2:
- Improved changelog
- Omitted current-speed property for UART0
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95..6c68b2e54675 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -667,6 +667,7 @@ uart0: serial@d4017000 {
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART0>;
 				interrupts = <42>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -680,6 +681,7 @@ uart2: serial@d4017100 {
 				clocks = <&syscon_apbc CLK_UART2>,
 					 <&syscon_apbc CLK_UART2_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART2>;
 				interrupts = <44>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -693,6 +695,7 @@ uart3: serial@d4017200 {
 				clocks = <&syscon_apbc CLK_UART3>,
 					 <&syscon_apbc CLK_UART3_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART3>;
 				interrupts = <45>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -706,6 +709,7 @@ uart4: serial@d4017300 {
 				clocks = <&syscon_apbc CLK_UART4>,
 					 <&syscon_apbc CLK_UART4_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART4>;
 				interrupts = <46>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -719,6 +723,7 @@ uart5: serial@d4017400 {
 				clocks = <&syscon_apbc CLK_UART5>,
 					 <&syscon_apbc CLK_UART5_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART5>;
 				interrupts = <47>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -732,6 +737,7 @@ uart6: serial@d4017500 {
 				clocks = <&syscon_apbc CLK_UART6>,
 					 <&syscon_apbc CLK_UART6_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART6>;
 				interrupts = <48>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -745,6 +751,7 @@ uart7: serial@d4017600 {
 				clocks = <&syscon_apbc CLK_UART7>,
 					 <&syscon_apbc CLK_UART7_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART7>;
 				interrupts = <49>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -758,6 +765,7 @@ uart8: serial@d4017700 {
 				clocks = <&syscon_apbc CLK_UART8>,
 					 <&syscon_apbc CLK_UART8_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART8>;
 				interrupts = <50>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -771,6 +779,7 @@ uart9: serial@d4017800 {
 				clocks = <&syscon_apbc CLK_UART9>,
 					 <&syscon_apbc CLK_UART9_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART9>;
 				interrupts = <51>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
-- 
2.43.0

