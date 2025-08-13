Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94022F0C54
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077018; cv=none; b=QWGM6zSIDv1nMbTtLndAZXSkpemgwMOjlzd3RwgficqiwS/MJ36IsjoC4ndbaZR+tWMVzd+cDujx19xUFYFfhKwLd2xBz9709cfGWn3WtODho/NXSXtv7DQ6ysWfr4/z3mCf/c+9te9FLy80a8V/fwv8yxLwH+oVfKDlWNEByHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077018; c=relaxed/simple;
	bh=nSnlQzS3Oijb3uuQVtZaTkeoC2ip6X+Cu8XPFNiTPn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rlKxnsbOd3xlLkndQVRGuFo9NHXhxGMZPc58rF1oop+4RKMrz9lO74skhUletuL6t2fd8rh3vSAN6UBpxYcOy8aJzD9XbcXFhSD5i9v15MZb4zkbDAM+B9JKDNsirdbmzMowN7S7l1AXq/m2+AYCl1vOlbMjE4EM+vJTEsVQBQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=W5sBoc+M; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="W5sBoc+M"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so6474107f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 02:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755077014; x=1755681814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TEyolKpesJRN4enzfkBag9GEI6SkLDls4Ifg+2q31hc=;
        b=W5sBoc+MPTpPL6mKQr8ywhSZyn7NdEqijCPXVXMHYse5cAEAU/uwI8ex6GJyT/AsUi
         xxtBJnNJa/divpCOlVXAS8tzLW334ELgSerkd3h+fCfwd0O/b4KQdwrgst8i6FJwWnQ9
         LTL2w7an79QWJfXIuVwlIYWaE2wsFTKPExT7MtUz4/6UYXI8fp+V5dqhddRRAe9oPSNb
         ClpXywWP4T/QbEos4qyeIM/jiQkLVMmEvAW6VOOsMiwx2ZXs5BcnnBG8J7gSqs4BPZsg
         zuQv05FFBttp+IVhTnPSsEajrxkSsEBNbxfMyxzxvulT4to+Dw51PfOtjTkm3DLJ6TWU
         iKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755077014; x=1755681814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEyolKpesJRN4enzfkBag9GEI6SkLDls4Ifg+2q31hc=;
        b=tbX0VyE47yhBtEWxlnwOt32DbitOn+aPZROU3Xk368hHi9m9VGFG/Jrfs8KyWnAXzo
         6PhgYIdIVn/6SBP5KcXeFO3WeC3oCc79sjdSNb94a398XvSLpsq5zX6i494t9cqGWpdJ
         JdCfJeSA+oG/mLm2/zaOx17FgH7/OiJeIJdPKpqw2selrwQ6c+EzPaec6pRWxdpU21ox
         zLtlDg9cqWSNYO/rMypHdYZ3I/iWn1TKEEVPs108N6DleegrTFw64c/7Xxol7Mb/tXse
         A+la2+TEow3TOF7Hc3KroPzioxyqWRM9f7bWfKYE+0r5bIeA3v20DEd98E3Yl/w9HZlg
         gETw==
X-Forwarded-Encrypted: i=1; AJvYcCW8NHYkxXbmSDyzRf3+etn8l+XNKNL4AqG6/GzcMG3g0EFNB4454kmIbGrGVZnvvKglZgFeCQ2lL2yr9fW/5gHXOUXuTA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0zffBJEVvPC+n5EG0QWNzB6rvZ/sWkjjWsPY/AIZUy/Ffq78g
	kc3u1OLbTaMfiA7Fpr3PzGilDvN41q4tRhPqGvxFmm+qqAReqlEZr8+5TxD5JosUQhk=
X-Gm-Gg: ASbGncswJy3phS/bdR7jiGwGf3ahnyU/mEoVvG1jmuq+k1d0MlNuIFG4fJwBKA0BoPc
	5A6yKaJhQjr6wu8RXUzR4mU+DP/+gjjkTsP90C+jx8aIJQxyLUiwrM1l0OpVy4GDYytk3u9b4ox
	r7gWceJAX4k7q2RmUcERRmkl2w4tJgC72q/EPMG7iaAs+RlYEeEX8iuvqOYzPKMf2q0fO+0up7d
	ThN5p+HLUukc2GasiXqbw1HFOdEF3I7gb1b8961wdbLj4gb3YdB+45LuQqDmL/jfTM4Y8r88VYm
	u7Pb5gs/gBsOWG8EKxQaQdlO3+R1lZaSSeAxsB16u0mqGYucFkFvxHLm+XBDCp5F3/srGkALfM3
	tdzsdVDZudR1FYicWIbYdIA2VZrSV4ofLPZrFhSWfiHOzrmenIA==
X-Google-Smtp-Source: AGHT+IFxawn2hn81XiBMFzlp9R7LXDt7IQlnw4bYwjrbGUdm+VKiMtSVAcwLlkK3/1f3t/cZPUZtdA==
X-Received: by 2002:a05:6000:40cb:b0:3b7:9b58:5b53 with SMTP id ffacd0b85a97d-3b917ec345cmr1916488f8f.45.1755077013860;
        Wed, 13 Aug 2025 02:23:33 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:d33c:e682:2af6:3c3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm47966077f8f.4.2025.08.13.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 02:23:33 -0700 (PDT)
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
Subject: [PATCH v3 0/2] riscv: dts: spacemit: Add initial support for OrangePi RV2
Date: Wed, 13 Aug 2025 11:22:38 +0200
Message-ID: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds initial device tree support for the OrangePi RV2 board.

The OrangePi RV2 [1] is described as using the Ky X1 SoC. Based on research
and testing, it appears to be identical or very closely related to the
SpacemiT K1 SoC [2], as suggested by the following:

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

Changes in v3:
Improved changelog: Reworded relation to SpacemiT K1 as presumed identical,
based on downstream sources and testing.
Applied Yixun Lan's Reviewed-by tag.

Changes in v2:
Patch 1: no changes.
Patch 2:
- Added aliases section to the device tree.
- Removed the memory section, as it is populated by the bootloader.
- Updated copyright header.
Link: https://lore.kernel.org/spacemit/20250718084339.471449-3-hendrik.hamerlinck@hammernet.be/

Here is version 1 of this series:
  https://lore.kernel.org/spacemit/20250711183245.256683-1-hendrik.hamerlinck@hammernet.be/

This is the follow-up mentioned in the previous version, sent now that
v6.17-rc1 was released yesterday.

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

