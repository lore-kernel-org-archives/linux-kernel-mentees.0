Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18161192D9E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730959902; cv=none; b=BT0Gf/uvQ9zvo9L4k8tvhV1TbNgaIpz86RHUtOaCpFId6QfgZ52RTGMJ/p1rRURgZzpKwrqe54/XmJGmagy7Waw8jfLt1u/DQwqSJGAVgBwppwXyMtciwiXc58m6GSjCcDPUssueyox93KdHNUTHsNXy6v4CExJ/Vz2GvYcsOdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730959902; c=relaxed/simple;
	bh=43RcNsIvUGi4595SU91AS/BTSl3E6gi5tuIlWyaKPmM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dK/YbB8LsqIZC7brIvdh9adXG6AQ/LORwxLi5s1PfUL/poJbJ5SIZqxcejaJRFaCW7Mz/bs4DWEgIskorqrgY0OQc6P9TiEg1vObt0oAF7vNczyHhB4Aw3geeU9RqVZxon2oGGH0a0uOWbGIpEFzCuWZ7sHiD2okVMMkR1Tse9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GG8GJ2Xu; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GG8GJ2Xu"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC9A381E77
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YycgfkpDxbOA for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 06:11:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B37981E7F
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B37981E7F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GG8GJ2Xu
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1B37981E7F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:11:34 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso6261285ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Nov 2024 22:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730959892; x=1731564692; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALXydKzISbFOwh8LfCoyMfvmblNdzLozEw5VVs994Xc=;
        b=GG8GJ2XuIY6UNhciwW4v8sMrYFnEvfJVb+FSmWzkdWgGgKkmBZs5vhH4AKlzsbc1vs
         +972ql+XG3A8RoSHoXvhSdOvupwnPyUJzts3KOfn+b0PQ01yW2fX5GtTbs3sdMq9sTpY
         czbFOe92TUC5Qj2Z0JzE7MYnEQ83DaUElwflHk56zyrzM1z7LHFyPLR935EjcgBizNqa
         9JkLChY1YZmKW31v6Co6p+f57VHfnE7R3KWoB0IsPsdqtG00EK5wpo4xBfjNiXgAQ5NB
         Ou+7SoRGgBAqdnoEFDqq4w7kAN3E56YzV1voDubE6oxceswHMxAE8w1sfPaFWIDgS4ff
         teeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730959892; x=1731564692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALXydKzISbFOwh8LfCoyMfvmblNdzLozEw5VVs994Xc=;
        b=GdClqZL8je3l/1XzhjJCpMs3VyPphp4QphMHibZeVtzP7Y7sjV5ge20hr2L4iaksnO
         NDgvGdXJmwHJqitB3uQK+N44nKfJsBGH0TCFSUtTU86dLuw1r0hkzxFDFQSkFm4qWn0B
         AY/Hw/zolNhreqWU5aNIzCx3+gdtAygmyar0Jjy+k5etF1ZtEcJdpHe38cIOH2eLeaBV
         pH3pqw2rYfVbyCT1qh0Wzw4g3JIgclE4c2zY/XJDja8d4/jGYvStebdbuIzTlc0iJRzV
         nbtLau0tqQ8abEk15dg431syS70N0Xdu1AxjF7FHbFr644illSKQSCI5evQEvniXg5qb
         hadA==
X-Gm-Message-State: AOJu0Yy4N++386KbGWYw2dRH2oAMLMZIjlQuDjFzKT15ypq01/BHi73S
	m6cnjE4iRZKB9CUp6kkMbmPkTT0PKq0LcERfoGZ907j8gzJaqpLuGNTNDR2X
X-Google-Smtp-Source: AGHT+IH+74hwtw/dolRKBe95lMKx0IkBL+BrHnQnQvcxznJIGMkm653MQz7fgmgSPs8j9V5HslOTGw==
X-Received: by 2002:a17:902:cecd:b0:20c:a97d:cc7f with SMTP id d9443c01a7336-210c6c3ec78mr584066825ad.41.1730959891752;
        Wed, 06 Nov 2024 22:11:31 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7cf8sm4652465ad.34.2024.11.06.22.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:11:31 -0800 (PST)
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
Subject: [PATCH 1/2] Documentation: dt-bindings: Fix repeated words
Date: Wed,  6 Nov 2024 23:11:23 -0700
Message-Id: <20241107061124.105930-2-xandfury@gmail.com>
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

Fix unintentional word repetitions in devicetree binding documentation:
- usb.txt: Fix repeated "two"
- mvebu-devbus.txt: Fix repeated "from"
- gpio.txt: Fix repeated "Both"
- pinctrl-bindings.txt: Fix repeated "device"
- cavium/bootbus.txt: Fix repeated "one"

These issues were identified using the checkpatch.pl script.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio.txt                 | 2 +-
 .../devicetree/bindings/memory-controllers/mvebu-devbus.txt     | 2 +-
 Documentation/devicetree/bindings/mips/cavium/bootbus.txt       | 2 +-
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt  | 2 +-
 Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index d82c32217fff..530420475a4f 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -304,7 +304,7 @@ pins 50..69.
 It is also possible to use pin groups for gpio ranges when pin groups are the
 easiest and most convenient mapping.
 
-Both both <pinctrl-base> and <count> must set to 0 when using named pin groups
+Both <pinctrl-base> and <count> must set to 0 when using named pin groups
 names.
 
 The property gpio-ranges-group-names must contain exactly one string for each
diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
index 8b9388cc1ccc..1983d7eabd2b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
@@ -43,7 +43,7 @@ Read parameters:
  - devbus,bus-width:    Defines the bus width, in bits (e.g. <16>).
                         Mandatory, except if devbus,keep-config is used.
 
- - devbus,badr-skew-ps: Defines the time delay from from A[2:0] toggle,
+ - devbus,badr-skew-ps: Defines the time delay from A[2:0] toggle,
                         to read data sample. This parameter is useful for
                         synchronous pipelined devices, where the address
                         precedes the read data by one or two cycles.
diff --git a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
index 6581478225a2..1bc655d285ce 100644
--- a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
+++ b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
@@ -15,7 +15,7 @@ Properties:
 
 - #size-cells: Must be <1>.
 
-- ranges: There must be one one triplet of (child-bus-address,
+- ranges: There must be one triplet of (child-bus-address,
   parent-bus-address, length) for each active chip select.  If the
   length element for any triplet is zero, the chip select is disabled,
   making it inactive.
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 6904072d3944..500b76ba2ab3 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -18,7 +18,7 @@ states. The number and names of those states is defined by the client device's
 own binding.
 
 The common pinctrl bindings defined in this file provide an infrastructure
-for client device device tree nodes to map those state names to the pin
+for client device tree nodes to map those state names to the pin
 configuration used by those states.
 
 Note that pin controllers themselves may also be client devices of themselves.
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
index da13999337a4..682db2b561bb 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
@@ -3,7 +3,7 @@ Freescale QUICC Engine USB Controller
 Required properties:
 - compatible : should be "fsl,<chip>-qe-usb", "fsl,mpc8323-qe-usb".
 - reg : the first two cells should contain usb registers location and
-  length, the next two two cells should contain PRAM location and
+  length, the next two cells should contain PRAM location and
   length.
 - interrupts : should contain USB interrupt.
 - fsl,fullspeed-clock : specifies the full speed USB clock source:
-- 
2.34.1

