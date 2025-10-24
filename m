Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E05C309DDC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 21:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761341474; cv=none; b=fp4yTnVqKKdtn9zYTBViPN8oeHyRWEvdAzruv8SVmHdOJsXrAdU20LfPGs/DyL63TxezmkIB+pVs7u76FPbPGZWGVINAHOMeIaVSLT9i8UaP7U+P9E1KYg3dalmG/CJCWhStRC3WqUNi6zkUCQgS+RL55wa1jc4ArxUoqx0FbO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761341474; c=relaxed/simple;
	bh=iQDu9KC5sD+ItNRHrzjtO65uP6xTrysOY0tRBMoc5s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNyz23rThQIu4HlgyxvMR/gDstFiThqA/2AswuEcQ5xrCwDnNylLJmbkPd5BdwuX4KFAJFXOR3SzvhxW0DSMlLAohJQAkYckQgrWRSvpEu0Cg1tkZU98mmM11fAIc7XGW7wwctUumqvkMch7kF4Nv7rccHKyy9xAlIsGhjP45og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBQW66xd; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBQW66xd"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1426140CE5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 21:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjS6OYsRDl0v for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Oct 2025 21:31:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2728440CE3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2728440CE3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bBQW66xd
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2728440CE3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Oct 2025 21:31:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B293604D5;
	Fri, 24 Oct 2025 21:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BB3C4CEF1;
	Fri, 24 Oct 2025 21:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761341469;
	bh=iQDu9KC5sD+ItNRHrzjtO65uP6xTrysOY0tRBMoc5s4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBQW66xdqKosVkU7SxiZ/0PMK9kQ1KfHPoux3oR0xLniv5aHATn7er+ChFSESMRpf
	 a+UjF561m9EJ4I2ham1n8ym+q6h7hH8wUaWE7vNbrtntjsZyVzjtalCtASGhG3YzUG
	 /7kwCEL9EAu6+J+AdCsulpZOJXEBfrd79jAkyG9Wkyl70g7t1TLDuY5rOorsRk60oe
	 GU8DcBuI0tR1o622yUvoO9B+XKjIS4RzxCyhtdSk7BBGD90cN/yRyLRfn8Q5iEcCy7
	 UkbKIESPHEI1yVPM1S7FexBpvJHHMgXA7kumrOibBwyp62ejofMaXFJj5SAHT7AiPg
	 oIMFloq7wfaKw==
Date: Fri, 24 Oct 2025 16:31:07 -0500
From: Rob Herring <robh@kernel.org>
To: Ranganath V N <vnranganath.20@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] dt_bindings: sound: ti,pcm186x: convert to dtschema
Message-ID: <20251024213107.GA2841379-robh@kernel.org>
References: <20251021-dtbs-v1-1-493c1aa253bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251021-dtbs-v1-1-493c1aa253bc@gmail.com>

On Tue, Oct 21, 2025 at 08:33:40PM +0530, Ranganath V N wrote:
> convert the Texas Instruments PCM186x Universal audio ADC bindings to DT schema.

Your patch fails to apply with "b4 am" due to the following:

WARNING: Message contains suspicious unicode control characters!                                         
         Subject: [PATCH] dt_bindings: sound: ti,pcm186x: convert to dtschema
            Line: +﻿# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause          
            -------^                                                                                       
            Char: ZERO WIDTH NO-BREAK SPACE (0xfeff)                                                       
         If you are sure about this, rerun with the right flag to allow.

Please fix and resend. Some comments below.

> 
> Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
> ---
> Convert the Texas Instruments PCM186x audio ADC bindings to DT schema.
> ---
>  .../devicetree/bindings/sound/pcm186x.txt          | 42 --------------
>  .../devicetree/bindings/sound/ti,pcm186x.yaml      | 67 ++++++++++++++++++++++
>  2 files changed, 67 insertions(+), 42 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/pcm186x.txt b/Documentation/devicetree/bindings/sound/pcm186x.txt
> deleted file mode 100644
> index 1087f4855980..000000000000
> --- a/Documentation/devicetree/bindings/sound/pcm186x.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Texas Instruments PCM186x Universal Audio ADC
> -
> -These devices support both I2C and SPI (configured with pin strapping
> -on the board).
> -
> -Required properties:
> -
> - - compatible : "ti,pcm1862",
> -                "ti,pcm1863",
> -                "ti,pcm1864",
> -                "ti,pcm1865"
> -
> - - reg : The I2C address of the device for I2C, the chip select
> -         number for SPI.
> -
> - - avdd-supply: Analog core power supply (3.3v)
> - - dvdd-supply: Digital core power supply
> - - iovdd-supply: Digital IO power supply
> -        See regulator/regulator.txt for more information
> -
> -CODEC input pins:
> - * VINL1
> - * VINR1
> - * VINL2
> - * VINR2
> - * VINL3
> - * VINR3
> - * VINL4
> - * VINR4
> -
> -The pins can be used in referring sound node's audio-routing property.
> -
> -Example:
> -
> -	pcm186x: audio-codec@4a {
> -		compatible = "ti,pcm1865";
> -		reg = <0x4a>;
> -
> -		avdd-supply = <&reg_3v3_analog>;
> -		dvdd-supply = <&reg_3v3>;
> -		iovdd-supply = <&reg_1v8>;
> -	};
> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml b/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml
> new file mode 100644
> index 000000000000..f1ade490f688
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml
> @@ -0,0 +1,67 @@
> +﻿# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,pcm186x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments PCM186x Universal Audio ADC
> +
> +maintainers:
> +  - Ranganath V N <vnranganath.20@gmail.com>
> +
> +description: |

Don't need '|' unless there is formatting.

> +  The Texas Instruments PCM186x family are multi-channel audio ADCs
> +  that support both I2C and SPI control interfaces, selected by
> +  pin strapping. These devices include on-chip programmable gain
> +  amplifiers and support differential or single-ended analog inputs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,pcm1862
> +      - ti,pcm1863
> +      - ti,pcm1864
> +      - ti,pcm1865
> +    description:
> +      Must be one of the supported PCM186x models.

Drop the description.

> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      For I2C, this is the 7-bit slave address of the device.
> +      For SPI, this is the chip-select number.

That's true for every I2C or SPI device. Drop.

> +
> +  avdd-supply: true
> +
> +  dvdd-supply: true
> +
> +  iovdd-supply: true
> +
> +  '#sound-dai-cells':
> +    const: 0
> +    description: Number of cells used to identify a DAI endpoint (fixed to 0).

That's true for every DAI and stated by the constraints already. Drop.

> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - dvdd-supply
> +  - iovdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pcm186x: audio-codec@4a {

Drop unused labels.

> +            compatible = "ti,pcm1865";
> +            reg = <0x4a>;
> +
> +            avdd-supply = <&reg_3v3_analog>;
> +            dvdd-supply = <&reg_3v3>;
> +            iovdd-supply = <&reg_1v8>;
> +        };
> +    };
> 
> ---
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> change-id: 20251021-dtbs-3a31f699c461
> 
> Best regards,
> -- 
> Ranganath V N <vnranganath.20@gmail.com>
> 
