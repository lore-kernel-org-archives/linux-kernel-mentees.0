Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CBF39ADC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Dec 2023 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgA9jFD5"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92396810AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Dec 2023 13:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92396810AA
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mgA9jFD5
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nMV2ISSrqXQo
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 20 Dec 2023 13:58:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AABB481091
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Dec 2023 13:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AABB481091
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B3D4615C4;
	Wed, 20 Dec 2023 13:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA80C433C8;
	Wed, 20 Dec 2023 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703080708;
	bh=siuPVaQbyp9Y+DByvHYZF7aijD5vvRxGyIuV/JOPGN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgA9jFD5LL9kzW35wjHfO1U3CHYJw9R2Jft5l4/Wt57hFkdnWw7aXEgLRTjjJzhqJ
	 mhfLBCpI0Y54M6Lg5boqQpRylW9xx4yC84/MOfVDEWctvaQG7B/A3oZdonxQltyDBJ
	 UPsAoLQOLiP3VogNXjIfbzBhNO0y7b77eiQzRZU6pEHgMECZBavQhhVxE+7fnIjglW
	 As6IK8oL1WBTvpEnN+L1s61ZDS3JRfFzEFw2Voh/wmy8BrbI+4vVnfjvWlTVMbO0Qr
	 1ynjAVjlSD9lKwrMGG/xX6lg6wKqynZYIqgtPHta8W/z88wIkk1Plh5awJWRPXa6Nr
	 /+rVQAEX/qjqg==
Received: (nullmailer pid 116540 invoked by uid 1000);
	Wed, 20 Dec 2023 13:58:26 -0000
Date: Wed, 20 Dec 2023 07:58:26 -0600
From: Rob Herring <robh@kernel.org>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Shuah Khan <skhan@linuxfoundation.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: dac: add MCP4821
Message-ID: <170308069917.116385.808780928089948753.robh@kernel.org>
References: <20231219090252.818754-1-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219090252.818754-1-anshulusr@gmail.com>


On Tue, 19 Dec 2023 14:32:50 +0530, Anshul Dalal wrote:
> Adds support for MCP48xx series of DACs.
> 
> Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/22244B.pdf #MCP48x1
> Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf #MCP48x2
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> 
> ---
> 
> Changes for v4:
> - Removed 'Reviewed-by: Conor Dooley' due to changes
> - Renamed shdn-gpios to powerdown-gpios to conform to
>   gpio-consumer-common.yaml
> 
> Changes for v3:
> - Added gpios for ldac and shutdown pins
> - Added spi-cpha and spi-cpol for the SPI mode 0 and 3
> 
> Changes for v2:
> - Changed order in device table to numerical
> - Made vdd_supply required
> - Added 'Reviewed-by: Conor Dooley'
> 
> Previous versions:
> v3: https://lore.kernel.org/lkml/20231218164735.787199-1-anshulusr@gmail.com/
> v2: https://lore.kernel.org/lkml/20231217180836.584828-1-anshulusr@gmail.com/
> v1: https://lore.kernel.org/lkml/20231117073040.685860-1-anshulusr@gmail.com/
> ---
>  .../bindings/iio/dac/microchip,mcp4821.yaml   | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

