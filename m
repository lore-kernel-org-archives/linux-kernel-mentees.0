Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773CB1373
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977629; cv=none; b=s9A4IvSCUgmpfW7VCt9h5T8UkrNMhGpVG13TFWsqskMkfpOmfm0Pz/hbWKf4mv9ksyXWMVzWOhMSV48nqrWqMZ7MUB1FsgttW6iAXAd0kEGvBkMsVevgj4oqBEnbxtUCZKVT+uSQ+wQwNABVpFfUAXW5j682ojo6P/Axn0nKcaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977629; c=relaxed/simple;
	bh=wWy454JTOGwB3Dt5B8irjoHMNnCGPA3U2n8E8e3Bk0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XppsdhzZrhi2lqx4rZYVN8XdO1rtIfvUJowyy7QNWCBptx8DJ3cuPPRcMmv+qV/EgSXvikTAGTj7vFKztd1VeIIppZgp05iX1N1QDpWxXWHhRFffWozF0TkthZLxYEAofMPHslEtWLEbn1e3ZAQFafthPjdj6ugDuti2Txtv6co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWZa3o68; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWZa3o68"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CCEF415A5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 11:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpcRqVT-fwyf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 11:07:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E06C54152D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E06C54152D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CWZa3o68
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E06C54152D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 11:07:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61344A4378D;
	Thu,  7 Nov 2024 11:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3D8C4CECC;
	Thu,  7 Nov 2024 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977624;
	bh=wWy454JTOGwB3Dt5B8irjoHMNnCGPA3U2n8E8e3Bk0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWZa3o68QMtmlz5POUfbiLm5sYgt9IukvYZXN97Djjp9HIdmseiG15pDIVmBC6RiA
	 m2POD/vZ4N06dRngbW2hegsUAdIFmM/r86xPqXoLUPY4D0BTkQ7Y/W8jjnxYLKRadn
	 6pvdun9SekcnvlcAE/R/faCsTcDAueuGZXcpO2ZLfG8SL4eFlNWtJWzUnykueK3CFa
	 0WJ23Z+8RlCz9+fPUa1uNv2z6pXpFbOUj+9ORYnifzISrGxwQEEuhJ+OC3ft2fv0DD
	 4asM8n3W0BkaqI4fbNgICo9Og/FQv+ZgLBWjyjAJwyR6vibJrt85QY2gVIiO4Mq1oC
	 H5F67hRkq2pOw==
Date: Thu, 7 Nov 2024 12:07:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: Fix repeated words
Message-ID: <huswmfhrf4mfewxchalts4chpddo4z67bg3kmsr3cfhhstob75@pzzuwfcvoiay>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-2-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107061124.105930-2-xandfury@gmail.com>

On Wed, Nov 06, 2024 at 11:11:23PM -0700, Abhinav Saxena wrote:
> Fix unintentional word repetitions in devicetree binding documentation:
> - usb.txt: Fix repeated "two"
> - mvebu-devbus.txt: Fix repeated "from"
> - gpio.txt: Fix repeated "Both"
> - pinctrl-bindings.txt: Fix repeated "device"
> - cavium/bootbus.txt: Fix repeated "one"

This we see from the diff. This is trivial commit, so rather write
concise commit msg.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

With changes above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

