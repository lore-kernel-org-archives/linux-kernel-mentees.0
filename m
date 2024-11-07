Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22272215F7A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730995497; cv=none; b=O45/nQdYXg5s8fSXEM30VYuTOKA8Z6wN1dX6YK9k08tP7xcVR2KNyzY3A9n2Um7FFC+OwOjBgWd4zbsK2Vi/lLDZrIj80vXTGdX41/xngZ1gVs82bH72ZklMZEtYRuEehWKvPIbjXjNtr6Ngf2ZcCLrgMo6npHspgI062TYjG+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730995497; c=relaxed/simple;
	bh=++Ve2R0sTl3/Af3ywbFC4oo8hw4a8zRpz8+lgtmrgu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGSVkzemwOTZVb4Ug3lce1RY7SjUxuwIBoS38gUSN+XsezWNkzxOjQKahOZfhjO0S7WQOzRVG+eXuBOtbe6WH0d5aVtEP3Jm/SRrtb5lLS9uLVgoKmRbPxZavJE3CZITsixcNwxBAV2vIsuZanFiDYVKbQOcoByLSpHoBOctNTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHHwuF4f; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHHwuF4f"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B244641E84
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 16:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPQlhE8pV1NZ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 16:04:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B36F41E8F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B36F41E8F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RHHwuF4f
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9B36F41E8F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 16:04:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9B0BA4481F;
	Thu,  7 Nov 2024 16:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C94C4CECD;
	Thu,  7 Nov 2024 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730995493;
	bh=++Ve2R0sTl3/Af3ywbFC4oo8hw4a8zRpz8+lgtmrgu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RHHwuF4fxfRW3tQjxVEZ4VJfnCvaN1TO837iTx6nKNtwcVYVhMgPP2hylh24GcwL4
	 a6i0fd0+GhfSvKYhOIdoltsV0KhycO6jLLedxhAPHSjvC95vZQL++eY42jjVwrgiGt
	 YCAkX6I5DoUZUY5usnPt8tbbPqCfjJP4iJXf+rN6lvA4qnu75YO9vh5Jd+u4lcICag
	 xT0CrlMrtiGM7uU7lnm1/HhWRrgdZ5YPDcwmpBpJZRZhY1Nv0EB/g8r3KKlOOl/C+i
	 qYSWy9OEcAV0RTMlHQglL1+PAzLO1mOGd+4WDzY//q4094mwQ9R+RvEw9L7kCCsK5r
	 dsPqx893IaLPQ==
Date: Thu, 7 Nov 2024 10:04:51 -0600
From: Rob Herring <robh@kernel.org>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: Fix repeated words
Message-ID: <20241107160451.GB2770783-robh@kernel.org>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-2-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107061124.105930-2-xandfury@gmail.com>

On Wed, Nov 06, 2024 at 11:11:23PM -0700, Abhinav Saxena wrote:
> Fix unintentional word repetitions in devicetree binding documentation:
> - usb.txt: Fix repeated "two"
> - mvebu-devbus.txt: Fix repeated "from"
> - gpio.txt: Fix repeated "Both"
> - pinctrl-bindings.txt: Fix repeated "device"
> - cavium/bootbus.txt: Fix repeated "one"
> 
> These issues were identified using the checkpatch.pl script.
> 
> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt                 | 2 +-

This and...

>  .../devicetree/bindings/memory-controllers/mvebu-devbus.txt     | 2 +-
>  Documentation/devicetree/bindings/mips/cavium/bootbus.txt       | 2 +-
>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt  | 2 +-

...this I'll take. The others need to be converted to schema.

>  Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt     | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index d82c32217fff..530420475a4f 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -304,7 +304,7 @@ pins 50..69.
>  It is also possible to use pin groups for gpio ranges when pin groups are the
>  easiest and most convenient mapping.
>  
> -Both both <pinctrl-base> and <count> must set to 0 when using named pin groups
> +Both <pinctrl-base> and <count> must set to 0 when using named pin groups
>  names.
>  
>  The property gpio-ranges-group-names must contain exactly one string for each
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
> index 8b9388cc1ccc..1983d7eabd2b 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
> @@ -43,7 +43,7 @@ Read parameters:
>   - devbus,bus-width:    Defines the bus width, in bits (e.g. <16>).
>                          Mandatory, except if devbus,keep-config is used.
>  
> - - devbus,badr-skew-ps: Defines the time delay from from A[2:0] toggle,
> + - devbus,badr-skew-ps: Defines the time delay from A[2:0] toggle,
>                          to read data sample. This parameter is useful for
>                          synchronous pipelined devices, where the address
>                          precedes the read data by one or two cycles.
> diff --git a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
> index 6581478225a2..1bc655d285ce 100644
> --- a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
> +++ b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
> @@ -15,7 +15,7 @@ Properties:
>  
>  - #size-cells: Must be <1>.
>  
> -- ranges: There must be one one triplet of (child-bus-address,
> +- ranges: There must be one triplet of (child-bus-address,
>    parent-bus-address, length) for each active chip select.  If the
>    length element for any triplet is zero, the chip select is disabled,
>    making it inactive.
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> index 6904072d3944..500b76ba2ab3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> @@ -18,7 +18,7 @@ states. The number and names of those states is defined by the client device's
>  own binding.
>  
>  The common pinctrl bindings defined in this file provide an infrastructure
> -for client device device tree nodes to map those state names to the pin
> +for client device tree nodes to map those state names to the pin

Actually I think this was correct. See "client device" used above. 
Maybe "client device Devicetree nodes" would be a bit clearer and use 
the right form of Devicetree.

Rob
