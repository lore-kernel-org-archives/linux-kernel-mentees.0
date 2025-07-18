Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4824F1DC997
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 08:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828271; cv=none; b=ELWb8+mSaNPVengJsfZ0+53h20i4HT0ficoBzkgz48w8uOTul+U4Hn1AOsR9AGXnT1GSHQSP38u2DTIYLMX+xTTwsZEASL6E9pkePW2u+OIthA322l5WBunubs8Bqsvf5784lv/+0XWL49AWy8IRspbMP1yoc6qKG7gLbB01Sjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828271; c=relaxed/simple;
	bh=KAk0DmLd1Szc+8RqLN4Q1eSR/knVV6oNPm+weoQTnSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wr6OB2kADg6NSalT62qs14+fyTWpEu/3hOD26FfsR/Zfd79JffXzGQsl9R0ILq0fu9E3aaumwjpLutk7pa+P4u0/n7k7Yp3y6527O2qb7jNmYU8NYHjURzNrf+XZo9GEhMneU7049UQvRozCbFH+ej3ngYfIxe86jx3HhbiiAXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=DwnmI5zd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="DwnmI5zd"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so1469470f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752828266; x=1753433066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQUcoTZuNnVFMQcqVlD/dsEaFXowm3+QSDfAXy+mm2Y=;
        b=DwnmI5zdu4j7IbFkyGJkkq3Su1o7OCuRjtKKo8pWcCI9lGR49gsgThJaN2JCFtYRa/
         oFS0kCXLGtfgTO5KaJhgm4LY6Sa6E4yWXmP02INkW0gwZwwphvX6Qoiqbp7aURjmWq0I
         CBgooSKPzI/eNNaOzwmmhmYpoHMDlRgaOy0Tq0Inop023IVcQhzoqV5Nux4kjm0d4xRW
         L+YPyOfrdI3wZwXJF/83fK4O1mIguGJ7wW5NXa3GK7pNQmyyzwRsQ/cINzb7NktKw789
         rSieoHttJklgmqe4wt/IeJt1S0kaSoSggXdXCUv24nyeTLuE5eEK0lXmUaP/jLbdgfVl
         6n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752828266; x=1753433066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQUcoTZuNnVFMQcqVlD/dsEaFXowm3+QSDfAXy+mm2Y=;
        b=mtYv51byw8QB5n0GZRGBy7dyAd/6am9OEiM5QnwhEfxvp2geDhYsNKJ70pLaQx2AIB
         XoZ23wyzOAZDhy+a8wz2FvJrUhMsbM2Cx0I4BrhjvGLGUtv04dsKu+L7i88oHiGnz2yH
         FTQKrpA5Jmhmiv4flO8yze2HLSTNCvRkYkZavfsS5f+mMtOmNmPne/6aE20wh+C72740
         vQ53NpIEYyhGn0MlBa1mUMz9r07zip6yg5KbnZQH5CPgnMQ7O+W+gOB+uWBYzC7Gf2Cp
         Mo7T7ppTpIi+GBWjbQvgt3P28386XkuopcISC6c3G5gUXqaaSTuE/sVsSlFAHRrs/ZfU
         TlOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYbHPwOnZuFZFzvKxCFENq5O8ZfShaKj7BZV9nwu5MzkYIAuOI5L16O0EtOv6+rWcqbgRosCrZSHqgVif86EtzyiQEUg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf6VQRAx3mA9W8vhK7Cvdd6SYHi55EamR4wxmP9hZ+WCewYFhK
	xxix3xO1t48ty19gjBmk+UYpstvEHNLmKyycT6T5psF9VvWRf4clZy3QFdjvKhGBssU=
X-Gm-Gg: ASbGncs12NBOrBEfM6LaRXcqmEvh5GmeU0cRP5PQMswBA35EMieimJBqVpdcwVCxTy7
	Y6tcAg0JFHpHZIK28Xr5c/yfyX17RRPuygN+9rghexLvUblSp6oj8tOR4QfEHbJ96+chjH+XOBK
	uvI7Zctvs1A9+Cm5r58Tr3elELO/1NIQp0nmMIVS3X4wW+pj5fegWh/eSTiZTRcP6xAPD1rWIe5
	No7VlNWmLAo98a+ljJzGQhGVeu0oCvhh9FnwiW9NohANgRgweiKu4DkfHirXtX7NTwBPpWElm+q
	ER/NzsETjgeF8ByxeIXzKV+nmIxB6D/Dve37J1exLZgELyaJUKtbrS/h0Rnpiq7j+WyVh/SJSga
	q6JB2KPhZ5DUzUjOFix2iFLTywVljD6YKs/OKLJYD5JsuKdel
X-Google-Smtp-Source: AGHT+IF1DTxp68FxooAN2QX2xUqfuF3c4Mb9kU6Zx0w2YlTbaB6gQlG+uHFwhWQB3m0w5QaqnggY7g==
X-Received: by 2002:a5d:584c:0:b0:3a4:ef33:e60 with SMTP id ffacd0b85a97d-3b60e51844bmr7888727f8f.40.1752828266224;
        Fri, 18 Jul 2025 01:44:26 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:9aa9:dd5c:bad6:e31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45627962384sm58208115e9.2.2025.07.18.01.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 01:44:25 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: Add initial support for OrangePi RV2
Date: Fri, 18 Jul 2025 10:43:37 +0200
Message-ID: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds initial device tree support for the OrangePi RV2 board.

The OrangePi RV2 [1] is marketed as using the Ky X1 SoC.
However, after research and testing, it is in fact identical to the 
SpacemiT K1 [2]. This is supported by the following:

- Similar integration in the Banana Pi kernel tree [3], which uses the 
  OrangePi RV2 and identifies it as the SpacemiT K1.
- Comparison of the device tree code showing a match to the OrangePi RV2 
  Linux tree [4].
- Locally tested the OrangePi RV2 with the SpacemiT K1 device tree, 
  confirming it boots and operates correctly.

Patch #1 documents the compatible string for the OrangePi RV2, and 
patch #2 adds its minimal device tree. This enables booting to a serial
console with UART output and blinking a LED, similar to other K1-based 
boards such as the Banana Pi BPI-F3 or the Milk-V Jupiter.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]

Changes in v2:
Patch 1: no changes.
Patch 2:
- Added aliases section to the device tree.
- Removed the memory section, as it is populated by the bootloader.
- Updated copyright header.

Here is version 1 of this series:
  https://lore.kernel.org/spacemit/20250711183245.256683-1-hendrik.hamerlinck@hammernet.be/
This series is intended for the v6.18 merge window.
I'll follow up after the v6.17-rc1 is released as suggested.

Hendrik Hamerlinck (2):
  dt-bindings: riscv: spacemit: Add OrangePi RV2 board
  riscv: dts: spacemit: Add OrangePi RV2 board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 40 +++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

-- 
2.43.0

