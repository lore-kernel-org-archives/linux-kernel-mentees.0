Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D10414A3A
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Jul 2026 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429239; cv=none; b=t0Gr6LQUS7yR83EfDARBllv5kT9z/nvVJMKiOCJAc06rroI/8OKEndIqf1e9Cs01XADY4xQhD7ARep4YByFHqRfYGEWw4IwTQ9czHyi8glE8jM18FIwvVV/Gww1O4g/GRYLcRr+jvOe1oiGfReLuR7KsSBYUlkqIz07RcuyNPX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429239; c=relaxed/simple;
	bh=Uf5wdHbvLT8glBukS87Z5XtjDjsk3W7uGIPm/Abkx0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtz7Pcgzunizxq8taU+MmBbwqwzRoL0qNQ2+1EmHEbz9yY5f8IwhV76X6ueRQKK0WV197HryFb4f1iaBFoJtbMIlfhWSqG2C+b9peEJgo4l3B+gcQdzWMvz9CTqMJc4FgZs2Fe9ktZ6iJdbPaMMBoL84UxLd4nnarkZUggIXoNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJyPflOV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJyPflOV"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84830c774a0so556559b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Jul 2026 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783429238; x=1784034038; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjSN27vhCfpwDogooT1C63qE/61HtdzQ904BFc54Umw=;
        b=fJyPflOVQ4ZTBYcE5TJxcEO4ee/OseNt/OnC8oYb6XwPRqwhhr3oQJq2aN8qYpU+n3
         +B7oP5zpGa7TgJA3AL5xXC9H7M+1pY69q1N4AztXdGy4KClbd6VjKIieTZN5DEM3Hj/9
         N1S1aX8gxV+n6ngiS8GhRvgELsoKY3J6yRx1z/4edyFdJA27Gm6sfGdSnPMdfwOCPESg
         YrIr7YF6S19doUe+IDtlEW5/qyyW9ZmHagzOC5gtrKAjbcjQ2ieXsDgTyGghTPZ6hU/R
         U/Ll4b648RF+/2yj3/JlgPm0FPHfq0He5EiTJzvCSK9Mff/otyRNHI1SRTtk5F9KMA1u
         esEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429238; x=1784034038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjSN27vhCfpwDogooT1C63qE/61HtdzQ904BFc54Umw=;
        b=XC+PT5K7jLJGM1sno5psnkuf/M5fRstMuvPJYvxJLh0E2ZlexCXglr77k2JZfgV91x
         +dQ2Zbtt9yqUNfr5pTuoC8pLufgo3h2U/MuBbpAnW2VArqv68vjcOgs2DuVR1NHF0sHs
         EfRT8hnVMOf25zBEW8i6bzltocvrdM8k/2KT9TWTPGcKxtFZlFhl2VqKydxl5VjQBKBa
         zxaI7Rfi0e2RZtl4c5Itzx8+Dn2Sl98kd5TvTvaimlnexSnLyMMfgDsi8zGjyWrfxgrY
         C74+IbnWiz0fSJ0z2SiNLZz/K/qaDAzjmLi0X95Eh7/wroBHk3u1yupTHi+q7AZIXkPO
         lUdg==
X-Forwarded-Encrypted: i=1; AHgh+Rohm38xM/1qrzGoaXp2Vhp75UoeExER1WTzRrPrrkkG7fAjxpKdtwwLO5ABaMNyeN18dM3ZrCRubpx2UijkTFlzEqtScA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzawcJAWymrnguMB0w0DJV2tslACGrfy3J6bauwEnCtlEhRjdwn
	ckmfgps+QLWb5jJSWVoWb6xY8khqxI9akGNbYKaS0kZr6O4BGd2rjAye
X-Gm-Gg: AfdE7cnENHp0YfUdYJ3ZUmVV+xqDqjVtZ+BIeYoBYjHO7S0YV0KbxJ/rIN9q7YE9QZZ
	e4/n9F32zgMCtVOJNgTvnhYk6+vvySgNXn27Fd8+/70kVVrvIB5hm+qWUMT8tbF3lsnHchB2aWI
	3x1WGpvlBTy8U9sl5zt7Lf+CEro8Uahe3dJXv3vEvmzaYpdzOCSAL45u5HmTkJ8XhzmyoCZjK11
	a3jJBXp8BGeHzv0Is3mBzIkk19bdRvZopSxxXlp4W1CLTgTLMKtYjb3CxsAKB748Lzj1NkBNhWo
	ib/SErzYN8FSG24eplPK1XMnmX2swIj6dyiTmg6juYyuw8pqxAxtQPl6+nHgj3uJ7ZYicn8kJl4
	5Qu8xo5k1Q/8Bvx9buZBeInxQMx6FRySLrVjYZmZsKougwsqhzN7K++agukfa9A5z78NSqzW7ir
	UvY5EXl2zS0dJBEKJDVkQHdmB4ulwMV0qK502+DDTtQf2uDYDdf3biUPxZBwr07wInW+ZakrOuH
	fkyforInW0DsOKtagmmDUU=
X-Received: by 2002:a05:6a00:2195:b0:848:2f74:d8d3 with SMTP id d2e1a72fcca58-8482f74dc06mr2504483b3a.68.1783429237597;
        Tue, 07 Jul 2026 06:00:37 -0700 (PDT)
Received: from [192.168.0.101] ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5b95sm1010719a12.3.2026.07.07.06.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:00:37 -0700 (PDT)
Message-ID: <1b5ff53e-53fd-4600-97d8-7ba34d139e5e@gmail.com>
Date: Tue, 7 Jul 2026 18:30:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: leds: bcm6358: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jonas.gorski@gmail.com, noltari@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, me@brighamcampbell.com,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20260609181731.1379846-1-ninadnaik07@gmail.com>
 <20260610-gifted-zebra-of-reward-2ab6c7@quoll>
Content-Language: en-US
From: Ninad Naik <ninadnaik07@gmail.com>
In-Reply-To: <20260610-gifted-zebra-of-reward-2ab6c7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/06/26 2:09 pm, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 11:47:01PM +0530, Ninad Naik wrote:
>> +maintainers:
>> +  - Álvaro Fernández Rojas <noltari@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: brcm,bcm6358-leds
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +  brcm,clk-div:
>> +    description: SCK signal divider.
>> +    default: 1
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2, 4, 8]
>> +
>> +  brcm,clk-dat-low:
>> +    description: Makes clock and data signals active low.
>> +    type: boolean
>> +
>> +patternProperties:
>> +  "^led@(0|1?[0-9a-f])$":
> "0" is already in "[0-9a-f]".
Thanks for pointing out. I will remove the redundant 0.
>
>> +    type: object
>> +    $ref: common.yaml#
>> +    description: Each LED is represented as a sub-node of
>> +      this device.
>> +
>> +    properties:
>> +      reg:
>> +        description: LED pin number (0 to 31).
>> +        maxItems: 1
>> +
>> +      label: true
>> +
>> +      default-state: true
>> +
>> +      linux,default-trigger: true
>> +
>> +      active-low: true
> Drop all four above and switch to unevaluatedProperties: false.
> unevaluatedProperties should be also placed after $ref: common.yaml for
> example.

I explicitly listed those properties and used additionalProperties: 
false based on Conor's feedback in v1, but now I agree that relying on 
common.yaml with unevaluatedProperties: false is a cleaner and more 
modern approach. I will drop the explicit properties in v3.


Thanks,

Ninad Naik

