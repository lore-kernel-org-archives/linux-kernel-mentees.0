Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75EB190679
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730959893; cv=none; b=aK+2Pw9HgPoaCeHv8yM3ui4LWIzdfPw9yXWFCyefqxzgRvvKiYkmirXSrHxtem8NyBU85BM0+0f/M7iWqYs+UNxA09ZhCbD52cD4HpbNFWyFfVCzMUREAEmGV+5YdGXr4Ye1eE/7Rrg/qsinAQOgwvPTP+ag0QJQEkdXBtJO18A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730959893; c=relaxed/simple;
	bh=5ccryXiFMCZqpwAcb8tIEL7hAQ+1BqdnpslvGenxExs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LZcnXM9yTb9vU+R5DQM4Nl91n3e6CxWKG6GzVS7n/BvGVwyWElnsVGQFLaDAXtmYH2/oQ0G05ZjMRzoNiQNHvdLuu0ow8qboRoEnO0GvuzDp53mYAICkETgIVCBO7UVGCLnkZQTyy4X6GHnGnKSEIUMaJZCLDQknZvFVKfp1c34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itLRo/mr; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itLRo/mr"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31C3340119
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFKHrMS1YZSU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 06:11:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5BE0B400D3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BE0B400D3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=itLRo/mr
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5BE0B400D3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:11:31 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20cdbe608b3so6116275ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Nov 2024 22:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730959890; x=1731564690; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdcIOwk3kp77s1l8BhKYHWZOlMgYXx/DfwT+R9F7N9E=;
        b=itLRo/mrpm5aXnJOI2H/CldTBcJTmRp1v6kTsC0N5FjZ6FeT+x+X+aiIOzK9GZC8ft
         hDE7fLKgvFvbQktfKmO8FvkK+HL32kos2aVWzoUXt8MkjFWmyukFWWR/FdYSuQbKovlM
         3LAotSFK5EotueuEcRoeOn+Px2hWUbBuQBpGwJSzzcUQ47KqGmyM+B4XM8x/MvZb3ult
         gwmpTq3WoIrTz24mYPwDyScFu3fTTQlK4c/s9ONk4Doy3gSsD7whzgeYGbXWeQi8STT5
         zRDhLNlZTnS4R6S0fdfRzlmo3dzOF1BbWMq4g8P92VUK0m8NNaxSZDNGsAsOVr93Xrmk
         mMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730959890; x=1731564690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdcIOwk3kp77s1l8BhKYHWZOlMgYXx/DfwT+R9F7N9E=;
        b=O9P3J3kcuixmzGqt5kqF4HtcgDYwUDJodbEfT9o3Nh4J9tA4ONgjr4mQA87mQ5ljHO
         jwiHZKk8UujxfJzg4O8why65/CTrKLKxWRSzrHCXRqcM0kb2WKdbJG1Ht7Y/x5qy/dID
         oLSUfm96ElN7wmodzaRkiaDS8c+zATpbeXX04/MTTTdsFMRFsXvbZU9O4RC5guAJIhyM
         5KncIpyYfApaXv7oU6Xt2eftQrW/ms7l79ROdZdf5jIw0irL71zf3Z62sdxBjUD4UlbL
         pSmmXqhjhM07TxjRHEdnhfRdBmZFsfiE1+10A5JHlSANV5DGGXTPwnf802D8vsOIUOKG
         hCQw==
X-Gm-Message-State: AOJu0YxGtDWeWBQTlesqngp9DNe6bI89+Cqc6sQrFdxRw1VTttoyzdWk
	tHWOadovFc5SKzmkelNlhew9DSO8UfNWYVVm/kG5or1i83fWuxO5rGwGWjHC
X-Google-Smtp-Source: AGHT+IFb44ve8UxBIvy91ELgGSUmf+xH+y8rohtBiFFGcFZF2HaHBFlJbfOx82kv14jZNYjFRB9GRQ==
X-Received: by 2002:a17:902:c407:b0:20c:da98:d752 with SMTP id d9443c01a7336-21178618acbmr7885715ad.16.1730959890021;
        Wed, 06 Nov 2024 22:11:30 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7cf8sm4652465ad.34.2024.11.06.22.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:11:29 -0800 (PST)
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
Subject: [PATCH 0/2] Documentation: dt-bindings: Fix documentation issues
Date: Wed,  6 Nov 2024 23:11:22 -0700
Message-Id: <20241107061124.105930-1-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small patch series fixes documentation issues in devicetree bindings,
specifically addressing repeated words and trailing whitespace found using
checkpatch.pl script. No functional changes are included.

Patch 1 fixes repeated words in various binding documents, while patch 2
removes trailing whitespace from several files.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>

Abhinav Saxena (2):
  Documentation: dt-bindings: Fix repeated words
  Documentation: dt-bindings: Remove trailing whitespace

 Documentation/devicetree/bindings/gpio/gpio.txt        |  2 +-
 .../devicetree/bindings/interrupt-controller/msi.txt   | 10 +++++-----
 .../interrupt-controller/nvidia,tegra20-ictlr.txt      |  2 +-
 .../bindings/memory-controllers/mvebu-devbus.txt       |  2 +-
 .../devicetree/bindings/mips/cavium/bootbus.txt        |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-bindings.txt   |  2 +-
 .../bindings/regulator/regulator-max77620.txt          |  4 ++--
 .../devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt      |  2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.34.1

