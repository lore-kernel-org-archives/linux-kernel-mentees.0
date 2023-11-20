Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CF320F1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 04:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tom-fitzhenry.me.uk header.i=@tom-fitzhenry.me.uk header.b="hTQ/+wow"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEC8681489
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 04:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEC8681489
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=tom-fitzhenry.me.uk header.i=@tom-fitzhenry.me.uk header.a=rsa-sha256 header.s=mythic-beasts-k1 header.b=hTQ/+wow
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.402
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id md1lsP-FQupw
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 20 Nov 2023 04:26:36 +0000 (UTC)
X-Greylist: delayed 529 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 20 Nov 2023 04:26:36 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F7B48146F
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com [IPv6:2a00:1098:0:86:1000:0:2:1])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5F7B48146F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 04:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tom-fitzhenry.me.uk; s=mythic-beasts-k1; h=Date:Subject:To:From;
	bh=PF8OjO8c7erf1om3rhrjk7pSuZlvp3jAiSRCfEz0K14=; b=hTQ/+wown69y+zfD5Kfn0m1xcf
	+GIGSHtANnev5XxSBf4rJRb9b0JqDxuaaqJF0X0SnSz6wQbF0ilbYxGR7/rN32EUwIYV3pwmMDmLO
	WvaYMMMQd8iDHG+K7DW/c21dLA+RyV2Cj0e7OM5eftRJfnkQD3njD67Epncc+uWBND1n6Y0qdVmOT
	lBqc95uKQvkPeft8zzQ5cNhFaAkZVQhN57tZHgJFaRujeoE4yRth9NZPyC+BFRhql5B60qZsSzBrr
	BRmNpd7qGwuH0N4BH7zgVAQCV5lo63Dlr4GCK3POWJH2qzZuzIQ1T7oHLYzadcIqwxp/vt8hDWKwH
	I4CnEyPg==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <tom@tom-fitzhenry.me.uk>)
	id 1r4vjj-00BoLo-LQ; Mon, 20 Nov 2023 04:18:16 +0000
User-agent: mu4e 1.10.8; emacs 29.1
From: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
To: vincenzopalazzodev@gmail.com
Cc: bhelgaas@google.com,broonie@kernel.org,heiko@sntech.de,kw@linux.com,lgirdwood@gmail.com,linux-arm-kernel@lists.infradead.org,linux-kernel-mentees@lists.linuxfoundation.org,linux-kernel@vger.kernel.org,linux-pci@vger.kernel.org,linux-rockchip@lists.infradead.org,lpieralisi@kernel.org,robh@kernel.org,shawn.lin@rock-chips.com,skhan@linuxfoundation.org,strit@manjaro.org
Subject: Re: [PATCH v1] drivers: pci: introduce configurable delay for
 Rockchip PCIe bus scan
In-Reply-To: <20230509153912.515218-1-vincenzopalazzodev@gmail.com>
Date: Mon, 20 Nov 2023 15:15:30 +1100
Message-ID: <87a5r983ea.fsf@tom-fitzhenry.me.uk>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-BlackCat-Spam-Score: 0

My RockPro64 occasionally failed on boot with this crash dump, at least
since Linux 5.15. Since Linux 6.5, every boot fails in this manner.

I applied a similar patch[0] against Linux 6.6 that sleeps during probe,
and I'm now able to boot successfully each time.

0. https://gitlab.manjaro.org/manjaro-arm/packages/core/linux/-/blob/44e81d83b7e002e9955ac3c54e276218dc9ac76d/1005-rk3399-rp64-pcie-Reimplement-rockchip-PCIe-bus-scan-delay.patch
