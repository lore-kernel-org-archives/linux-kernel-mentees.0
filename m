Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7C71F4FA8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 11:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977675; cv=none; b=h30vgILzkEnWUtI4RofnU8o0djiRWpRQZfL0SqfUmcvx4hBxKwTJoIJyIViuWg++4AVkiXPkzIaZ6qBrd1+KypcdV9yulIgI+dmg7b4lgtHHsOiBS8l6pacF85iZRxFSFXuHR8mLfVkJdXmOnBlFzyQKgUq4iIBtncCxKDNvH9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977675; c=relaxed/simple;
	bh=3RDsctzj+jKcHyPmCDmgDEvkYRZVjj3F2h2JnfN6XYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gl9iUCha+HCVzL0L8zCzdXDosu+oFtyl5f4HGbpW6qYUAcpPxKODbXeOIaoPgk35lPUuZQA5RgwgH+pKa5uaY+wMCJQYN8LtYsmbO4o0B6O3M/TYGcQSDxc9Psdn0ASmg1qVHU7yz6TzkE0507OZju4ZfKeuD8AUcJDxYO2fpLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEkUUHT2; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEkUUHT2"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 177C66109A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 11:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1t4a8b0w9Ehz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 11:07:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6857E61081
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6857E61081
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CEkUUHT2
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6857E61081
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 11:07:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 951715C0496;
	Thu,  7 Nov 2024 11:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504A7C4CECC;
	Thu,  7 Nov 2024 11:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977672;
	bh=3RDsctzj+jKcHyPmCDmgDEvkYRZVjj3F2h2JnfN6XYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEkUUHT2AyhLlnl5b5Kr1aHQP+HLUSQogHUG19q1+lqDySaWJ0NwDuaoCr01ID9vp
	 ErMXgC7nML7+V9kF1Mp0H2Dz1RPL/xYpcwwUr1eyHZWAw+R8FB8t7L2730xLblaMnp
	 W4H5RJYM2bn2TSm1bIAOHaonkfGI/TxTIj6+fxZZ69fnVmt5EFUWD0jBE1DVkzottY
	 LW91NKPMxk3T3e2WcVXGU0x7L64WnT80R2SpOoNMeAgUln7KQEKgcDTpKOOBRkHtxa
	 xaOyhJt+VrQA7oR8749NarQRcwH42e7ilCnd6UWg8cdc2/eWVMHqtvQvuMsaqadkam
	 dECzA0PDtrbSg==
Date: Thu, 7 Nov 2024 12:07:46 +0100
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
Subject: Re: [PATCH 2/2] Documentation: dt-bindings: Remove trailing
 whitespace
Message-ID: <gjxevyovxhymwm2ps37hfq3vmpmmr4pqmohq67llxrb2plb5zz@pvsmkqmhemx7>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-3-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107061124.105930-3-xandfury@gmail.com>

On Wed, Nov 06, 2024 at 11:11:24PM -0700, Abhinav Saxena wrote:
> Remove trailing whitespace from devicetree binding documentation files:
> - regulator/regulator-max77620.txt
> - interrupt-controller/nvidia,tegra20-ictlr.txt
> - interrupt-controller/msi.txt
> 
> No functional changes. Issues detected using checkpatch.pl script.

Instead I would prefer these files to be converted to DT schema which
would result in their full removal.

Best regards,
Krzysztof

