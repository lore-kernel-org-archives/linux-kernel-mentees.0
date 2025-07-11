Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B048C2F2C5C
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 11 Jul 2025 18:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258810; cv=none; b=Px43Kz5vJqgk4206h5VcldZDqFWbY3+uWWC87nQ8pzEO/+pM8Xezr1f341HSLoUfypYQWsrP42MJccGv7ze+MUupbsW0iA4beSuDGKb4d2hb9R6qpIL9zxb13IbBPycDKJjkPSSHYjiHI1Eu/GPDo6kWOWTXfNU/pUu7dhrm1nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258810; c=relaxed/simple;
	bh=I2K1uHXw4EQkyH35EpeDjkCvWXqIGNmebVNMyD1Rqwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cszl5ZcdIkexnpGK6W6TAhf1ZS5nsYW0/mWktv3V0E2tg/aK4ZF+MGtU26GOX/iPMgKdAK17+ese4OlAmFbKQpPoZSG+YKcmhY/XwogeUoWGW9b2nSOA17kChb8hKMbpaKycg/XZZT2gs89g9oyEXGPwkRcp+l/f4Ss0+au8Cd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=nhaseFSo; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="nhaseFSo"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a588da60dfso1745463f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 11 Jul 2025 11:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752258806; x=1752863606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajLVmCN8EV1ROtFCYKGnJZHORiVxqh3PONYE32dE2Kw=;
        b=nhaseFSoApC0Wu536da6YMX4SyOPCQ23CWa9Eh0vu/FUQsiZM4SofBLnUIpIb175r0
         RjxTGK2dgrvgz38ikbLtrIY7txjyt4TB731iiFYe7Teqww2LI7GbXB04miTQlNYUeYxf
         wwngHO8h2D0A2vSYCzGGx99IyeJHt1MedYQv073cANn+3IJupFcZIdZ/B23U371VbBCX
         aq+9Msr822W3U764/jxmCD4Ip1yQCocgdheCVMO0n2zpYsyVlTuyiYv5jcgzO0XDGFWg
         KBT5gug4awriB/SiUTModtMGqk3MIsbGNFNLMrM1bHp7IhW8K4CT/hKG0wXVaAIYZucx
         SBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258806; x=1752863606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajLVmCN8EV1ROtFCYKGnJZHORiVxqh3PONYE32dE2Kw=;
        b=sTEcyls15nmb1zVfgcGIJd8P+00WcVGKEtTNOcoWjtuEjAvuDYq/aBq3GR1ikw8aIK
         ProXdhVKI5CqL5a/+HmZe15hP3Tsxl3jBPsxiRYe8ay89Y7zJsBmrpvG8vucIJbrrZZM
         jUpofNUY1TDj3u573odEDgPSVCJoSPvwVimvd3euCBQ/VIohfo80SMVjm5i6p5qmEJ1S
         KUFv6KqDGEsepTRECXd8WAQyL18VrHOtbOkcdIe5HUaXcnRZqoUn4LATD6BIQtNXBeEc
         3H/NfZlpRxA+UJXZi6FfGNovgYTa0QbQmEeBAkk2/m13vghtmgm6UQ47BgmMthYtu/iw
         jKZw==
X-Forwarded-Encrypted: i=1; AJvYcCU5EM1UKSBitU/aj/QPugFe041YWHQ1ddGcNLPg0pq3DzbP3E5/eNuxa5oAtku1S0HquGYJlfaH1AnWUtad5hGTqJ+rEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YztXwt+75pTgxnt1yKq059eWEt7WNU9pfluMSDM27LDYv6AqUX7
	me0Ly1//c7+Af5tKdTRot7QK5EgJ4gM7raBa0/7xEfaiQ7W3LU6LrewUfhQfO0yRqLk=
X-Gm-Gg: ASbGncue8U57a2e9/2/74rpG2SocGf/b7Jqg2GCQqAdPAFh/RE/dfe2ch90y0EdaXxX
	dHvrtkjbsFbMrGpgzlfHfvE/v7dmYTmUqewzHF3rHOwKIm67Vd4col0hHrWvzuNbG9Fbm9dWnaK
	BxO9LsN2JEkMY9joMxjIdyl7icIgN9ScD9JIMxFpG9yNkvu/K25qcuyxw0JHh7hs3gCxMrKPqU9
	YpGjMjwRY23KaducGsUQTGHGwkIZnp3jnFJtJY+bzOp2OtiJ1x6ecHUEIRvedjHDP0NECVuWwPb
	h+HejHLYRTY1x/zRct1vkZ5aB+EPgdouEW300sE8b4KJkOKGXwuqGauS/HzrCCtbJD0o/iPVhmA
	Zk7u2sIGbBRS0lFntPj1dQx4Hinm16bCwTnlJenxjmhtkHGMYptqy1buoxJiH
X-Google-Smtp-Source: AGHT+IHoIVVNWSLMADUf1EqgQlVt++Sa+z/qkL2VbBz8sznu1zu8Z81BC5P4gKRYQcV0niTuA1b6wA==
X-Received: by 2002:a05:6000:4108:b0:3a8:38b4:1d55 with SMTP id ffacd0b85a97d-3b5f18dc7dfmr3898978f8f.28.1752258806040;
        Fri, 11 Jul 2025 11:33:26 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:bed2:2848:b66c:32d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45601053020sm705205e9.36.2025.07.11.11.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 11:33:25 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH 2/2] riscv: dts: spacemit: Add OrangePi RV2 board device tree
Date: Fri, 11 Jul 2025 20:32:45 +0200
Message-ID: <20250711183245.256683-3-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
References: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the OrangePi RV2 board [1], which is
marketed as using the Ky X1 SoC but has been confirmed to be 
identical to the SpacemiT K1 [2].

The device tree is adapted from the OrangePi vendor tree [3], and similar
integration can be found in the Banana Pi kernel tree [4], confirming SoC
compatibility.

This minimal device tree enables booting into a serial console with UART
output and a blinking LED.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 92e13ce1c16d..152832644870 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
new file mode 100644
index 000000000000..8313f9589cd2
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2023 Ky, Inc */
+
+/dts-v1/;
+
+#include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
+
+/ {
+	model = "OrangePi RV2";
+	compatible = "xunlong,orangepi-rv2", "spacemit,k1";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>;
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x0 0x80000000>;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			label = "sys-led";
+			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
+	status = "okay";
+};
-- 
2.43.0

