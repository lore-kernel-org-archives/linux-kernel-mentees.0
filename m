Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79311ADC7E
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 11 Jul 2025 18:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258809; cv=none; b=Qe1Y0nIxVKRlFedHNFarJjxh59Jmh+9ZGQeg6kNVGWVVK5tTtJ5TpglBfgl+8MbVxLO+KmqBhCIX9nrOZyZhfIdHm4BVf1WaJHqsHcccCPLJVhU+9GovBaRC2rAELGOvEGyaeAreA46OKVRC3iLUyZVZ0BAQWLkpQgSECTahh+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258809; c=relaxed/simple;
	bh=1G0N7Bw1f4gd8ihh0vme3OMtchuWzqYwrdve1euwDuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h0NZuDQGBYrVp7DDRCcGUf+AgShx2b1MBjYZYiIh5OpXVMI8R8VA9U9Fsv6VXdpD9rueu/YjWZuTnihHQ/bQgw/DXNzhVteoy9X0vxcbrsOUiyjZOMkUCsbq+83655K9lWOQRJB0BW8PeHxciRGaLbRIa2rPpEHlWyyqz2iITUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=lcW2uUhF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="lcW2uUhF"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453066fad06so14854885e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 11 Jul 2025 11:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752258804; x=1752863604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wGlAjOiaXk4Ea4ZU7FQtfjdQUVKQwTgsf1DZ7CdrvG8=;
        b=lcW2uUhFY/LYvdbcKp/EAbCaVzSS41O1dEDdfTYAbuiB/43UoenxD1jBR3bO0fpfE9
         ei4YowipPiX4nAd8mA7DaoxHe/FPWWIr0fBCqFsv5ftfsHRiqXUtSr5hd4PGOUMkgNlD
         +jAnVgWjUy5k/5iVrpwFCMn3bb2BPE9pQP8vOL2rOYtgRY/kJwpRIt5Viz2xrNbTqrxs
         QL/T+3RBL2duxDoIi1JqVL8zUj2+91o6vTArJ1KeS2qPscviXm0khaClLjnvxozROTeZ
         kPv/p+t47IVCWtbIry+VVfdN2Xx8+aSDrDo8sIG6X5lPJ3xBoQwPvdFl8H5ep/HTXPk9
         egIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258804; x=1752863604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGlAjOiaXk4Ea4ZU7FQtfjdQUVKQwTgsf1DZ7CdrvG8=;
        b=q1b9Ia+eivB/zpZCJrjWRz0ZfiX1wQjxSMuKAtltmQQiZvTc+sQgvgVTI5rmzg8OXv
         F/N/U0B6/nIHj8S9eJz8yXjxdj1Td5F3PSN1sKdMmdX1qkA5NHnsKI+lUa3896KcKNt5
         v7l+solglZZLGdTMqkxXSyIczlsn1EuOgBwpaQBvyTc+AceOlJbrGJbooHrltgcLF9ki
         9/5ytV1D5zTG5S++uQagVS7jpVNHk/YaSuVba9io+nsFxI3UUt1QalmGrI2FpRPxDIHI
         n7uAb4NSThtTmuKXc7fr0EKRYOdfpkvn96Pu/boVE3zTLWygJfiaMlZHIzI+O1m739Of
         qRpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYEwyXRuVHH00gvR3nO1W0M2ztbfan3lk/HS1sf64bPpxUGB1CwWDmcEL7q+ajn+8RYN+VFvWrc3M8fgQQ+ITs0C8v3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfHHhdzzR/i8WN0aiZ9Yt1aWxbZc75XpTXifczvU7Ob13TUEYQ
	I3J9MmBMqNweG2eJmBI7RC5OYquHc4r+KCwfh08jbVMW+Ib/jNOHLgYKOKlc0WnpfbI=
X-Gm-Gg: ASbGnct2BKY6fjmdJUFp2H+68+zUwcvwQo4BdtgEDw6knmhTQuoUeydNpwXMznExVqj
	befjV68vJ8S28BDZnCPu8BOYokB9jKGN1FhLWv/Wj0fs3O3vWRc7uoONUSiPS+cN4MCIfzrjYF+
	IjjbNnXyLB8nPqQ9NGhnlj52n+Uu0I8VhwWepSpaNDP3SC9FUJras2SAuYgBnz3VXxy96PGBCz5
	+g0rC2udlH0xhuBc806gtOpz+s3eidjD92epLdiSoD1Ll09kEcQdjFwoHngOQS2/FBhkcGHGYpq
	pJ6EQ2d5HiUvVYduQUjEzT01ie3ceWtVQRA1aJQhl1lravgNzLYlkzOixdeeScEq4RcqmiXls4c
	m8c+MVv70l6Qn9Q/ydY9b5MYAXqFQtx9afu4beGF2XTNdLvfS2g==
X-Google-Smtp-Source: AGHT+IG0eptajR/3ce/67Zp32WT9bRB0ErxbOxP9NIp+sKL8MyAm504UpLdi7e8zbMZpfT85BGq8cQ==
X-Received: by 2002:a05:600c:1908:b0:450:cac5:45e7 with SMTP id 5b1f17b1804b1-4555f895800mr32393375e9.1.1752258803998;
        Fri, 11 Jul 2025 11:33:23 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:bed2:2848:b66c:32d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45601053020sm705205e9.36.2025.07.11.11.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 11:33:23 -0700 (PDT)
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
Subject: [PATCH 0/2] riscv: dts: spacemit: Add initial support for OrangePi RV2
Date: Fri, 11 Jul 2025 20:32:43 +0200
Message-ID: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
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
SpacemiT K1 [2]. My proof:

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

Hendrik Hamerlinck (2):
  dt-bindings: riscv: spacemit: Add OrangePi RV2 board
  riscv: dts: spacemit: Add OrangePi RV2 board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 43 +++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

-- 
2.43.0

