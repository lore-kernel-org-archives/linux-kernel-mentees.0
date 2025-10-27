Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55BC314D19
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 18:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588266; cv=none; b=VrpUc+gYe6ObNgM+zcmTgzHUWtGSB5zXwawAm0p73DK5phf5CeKoOPvI0alf0MdMiNk1fkNU5Gtbg/Yw2567WiIZS6b4VN0lEemcwpghZX54wazq2HPLi3gxuAEuW3jNPBxaMfvJPsVotoTNstLcahh5WCMCAae/x7qnYtuo79k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588266; c=relaxed/simple;
	bh=6gWdTMfQ/SknYRion7bPpp9wf5wuCuXCY4S7nMleIbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hNnBnYKZo3p+Smwdt5TlE/YOwb3zbs/vbObmMzFEmC6zLMPmsrqbAB0Ws86WFH6rO6Nmuosx+CWI+Mk7MMEVMMORpvQx4LrzLVNlgLrGOPM1ixFiFkD5fKAz+XB3cxOwwtSEbHGhKv6hj6QVsR6boePPKZGYcIm044/n4t9FK64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXpGg7ip; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXpGg7ip"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A3FA8235E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 18:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8cC1YijpWle for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 18:04:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=david.hunter.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B83882356
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B83882356
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FXpGg7ip
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4B83882356
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 18:04:23 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-5d61f261ebfso2237333137.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 11:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761588262; x=1762193062; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7gXv3hz0xqp/f7k2sKRT8AGUrr1BgpZqId67aBhRxKc=;
        b=FXpGg7ippvZwTbzOxeW/6x5ZF0tn9EUqWeV1cpeeiRZ8nyCGus5GBAJzJyzBnBg+N/
         fCa0490kk/Iwqrt7MnwQNUFSjY6LJGqYI7Vp0C8bzrep0IvbDyHYUwc258tfCkzFj3J1
         C66bvG0H9U/5zgKAy8A0BJLYJxM4ip0g9txWRdgKnZzcZCyDqNQ1mAMnjE1+eZkKGZ4m
         vdVcyyC6Lu5TeH1CwaDTNvrvdnJf0DkWpL/RK6Dls2/SxBwGzIO1pw+QgD2fT/6CR7YX
         P/73pdM8/ZX/lRWaDIzMHsumltbMCVDPmXcOqdgPWrh0ZIodzuEc3dRt0gOgqzn8Zhks
         GF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588262; x=1762193062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gXv3hz0xqp/f7k2sKRT8AGUrr1BgpZqId67aBhRxKc=;
        b=bwtvzHDtcw/E4QMhJhh2r/+MWqZ30OrLaJtuecgP0hrSvMVeaNv5RVaBHU1u9+WzVZ
         IUA9DFHecir8c29rsk9bRT5JnvMMfx+UnZFxCT6Qy6aMNuZtppWNi3SOO5Hh7zIZ9fAJ
         asjs3y0uKQVONhWcSgH+CWe0qyF2tiQ6xsNFEx37faivKPBITtxw9887x+b+qgwnVaPV
         i+5POIi9vh0B0DhXIN9B1meJzVrNYnodvygML+W6/EN8YaPgp+OrgNeK6YyTBRzyunF3
         1pDtasrx4Q1xiDzH0oRgd+Z9PksP307hjt+3Y981h4Q5vKFObLB0ISkWcVzQ9l/7TpkF
         6aEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXncrWKVuNPkmKVdtCnrqT0m4g6TVHGJELSDeAcjfkMaz3DyoLCYVY9lb2Nvz7h0yoi+FtvUKEk7nSiM1/P6yMepU9wyQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxYxhwZR6+mKFdraWBB5YkTMG5ggonRO2UyVXNJY/veppYWVJaP
	/EeAwSuaxygzH0InJKVS67V6PYPgL0KF3cjQhnq3niBfWl5lxZKJgR7r
X-Gm-Gg: ASbGnctg0BHfj6UWRmX+SVBxGh3tAyGSEWUkQtpCUz5WdNwcQeI68RYVrOukFuAFEgk
	arH3ra7+qXfh6xmIzPEraXxEjvb+064wlVKnycCXgmYSP2mv/n/Mcu5VUOb1X+ufAqiObjn6v/l
	O4WB6/YEm4KMeqTda7QuUwCEz59Vd7VKaf+QZUK59/etyC5yeNifjX82axwMF5jnGXo9ooOmjW/
	w9BStq03JZ1bm0sHKIGwkiQw2vynDOenlJG+xPDmYqxzfetBUuradU/chdjy+y87QPbbdww7cY3
	GYvSqQPDe4Um+GO2ChMycOTxwaPXuZofVCDcOycoBJPnVe3qo+Kz1uJI2lqzvYsDjfbPw532arh
	rHNDBi2PMu2G2XaPK7Hvc9u8NhwmSxLHR5gxDvDjyMroSvRaBHn8zDxwLIrET8/jIhldiC02O6b
	po7TP8VsR8UDCOeMlm+Ye3kDQJAF0Ozie4dNZx1g==
X-Google-Smtp-Source: AGHT+IGfuNL47CB8BqWQlli2IWxIwUYM0B0XFQwY9e9lve8a3B49aif6vcJ8NDckDpi0OWKRSm19Xg==
X-Received: by 2002:a05:6102:f09:b0:5d5:f6ae:38c4 with SMTP id ada2fe7eead31-5db7cc4fd8cmr279495137.45.1761588260294;
        Mon, 27 Oct 2025 11:04:20 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934c404f64dsm3120082241.11.2025.10.27.11.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 11:04:19 -0700 (PDT)
Message-ID: <2efb85cb-5373-4da6-972b-8e79952cbc33@gmail.com>
Date: Mon, 27 Oct 2025 14:04:16 -0400
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt_bindings: sound: ti,pcm186x: convert to dtschema
To: Ranganath V N <vnranganath.20@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251026-dtbs-v2-1-cd3b713a288e@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251026-dtbs-v2-1-cd3b713a288e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/26/25 13:26, Ranganath V N wrote:
> convert the Texas Instruments PCM186x Universal audio ADC bindings to DT schema.
> 
> Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
> ---
> Convert the Texas Instruments PCM186x audio ADC bindings to DT schema.
> ---
> Changes in v2:
> - Fixes as per the reviews suggested for the v1.

It's better to list out the actual changes instead of only making
developers go to v1 to see which feedback you actually brought into
version 2. > - Link to v1:
https://lore.kernel.org/r/20251021-dtbs-v1-1-493c1aa253bc@gmail.com
> ---
>  .../devicetree/bindings/sound/pcm186x.txt          | 42 ---------------
>  .../devicetree/bindings/sound/ti,pcm186x.yaml      | 61 ++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 42 deletions(-)
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
> index 000000000000..306905eebd68
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml
> @@ -0,0 +1,61 @@
> +﻿# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
> +description:
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
> +
> +  reg:
> +    maxItems: 1
> +
> +  avdd-supply: true
> +
> +  dvdd-supply: true
> +
> +  iovdd-supply: true
> +
> +  '#sound-dai-cells':
> +    const: 0
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
> +        audio-codec@4a {
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

