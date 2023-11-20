Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2832F12B8E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f2ZNz5Th"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 940B360B48
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 10:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 940B360B48
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f2ZNz5Th
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8dDeJAOHrlw
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 20 Nov 2023 10:15:49 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0A81960741
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 10:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A81960741
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso568116466b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 02:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700475347; x=1701080147; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQvgpCFnhaazymxXhphPFYasGRDeKdii9QoGG3qjZ8w=;
        b=f2ZNz5ThBEkQ+NNWdcLgIToqYx7DER1ouOS8CURTy+BszDDdikQW30O3tmWuDaAD23
         FoLiGIg9vV4JeQjKt3ySK8Q6mSrFmt150SKoqDDlBbCqXXj925g0bW2d1spYLvNPR0IT
         a+SQxK9LRkCfSYhqhUAwG/1Tfz4Gjx2TcGjQSRYqPPZBR+B8ya1+DyggNEL8ghi0JtD9
         5xFcDcHpcozlPR6LGB53WGwcn28BilxWSG8g+Z708F8jNPgiJRAmwfBkfkp4wYz88LaN
         Ipi6ahuv3WBCiPQdF+qn2g57VzdauuCXAw/Gk4VANT+njG/wJf0Igy6VRvY7hwrsCbXG
         +jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700475347; x=1701080147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQvgpCFnhaazymxXhphPFYasGRDeKdii9QoGG3qjZ8w=;
        b=oiR/N914Gnv+P9OR2SpnZDBvSQ/JgA0D6teExz72jzUyZ26VO0zaAnlJOwOeCTCM2G
         rfwOyFGoWcqEELYRhRPZD/fxEfJokcBKAp5qA7GbFWm1KSXhQG+LD05bMVP3buuX7ULc
         wpkFyx1hsITZNe2DcYJAD8crvXAXxzTi4P75oZr0iotf8am6zohWufa7I1RU2Zn2RwZU
         EZH2G7dDYWXttF8RJiJXWFE8aaIwHnH8gXBat8fjPZs74Q0fSWNZl/rc8KSV5Tdq/9hf
         7LH3UcEdKMVq924OSvJS9vKfvF8rGhFnT6tsumTsb7TSt8g0wZzWmtkzPro36BZyg8TI
         t6bw==
X-Gm-Message-State: AOJu0YzTE1vNKqU11il5yzaSzS2KRnN198fDbjnZSzuAU+hv4fzlM49O
	sMPuGzJc/JkP5voX+NR7KIgq9g==
X-Google-Smtp-Source: AGHT+IHzo0OO8PoMXTARWBHZXKM7DLL9A1qCpjY86RTeFujsT7cu/9mBk9e5WoUXy9WiZDmwtbgTug==
X-Received: by 2002:a17:906:2cb:b0:9e0:dde:cc9f with SMTP id 11-20020a17090602cb00b009e00ddecc9fmr5231853ejk.22.1700475347140;
        Mon, 20 Nov 2023 02:15:47 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id lz10-20020a170906fb0a00b009737b8d47b6sm3709867ejb.203.2023.11.20.02.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 02:15:45 -0800 (PST)
Message-ID: <efd3819c-6507-49c6-ba4d-7b6d9b7ce87b@linaro.org>
Date: Mon, 20 Nov 2023 11:15:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: pressure: add honeywell,hsc030
Content-Language: en-US
To: Petre Rodan <petre.rodan@subdimension.ro>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jonathan Cameron <jic23@kernel.org>
References: <20231117164232.8474-1-petre.rodan@subdimension.ro>
 <20231117192305.17612-1-petre.rodan@subdimension.ro>
 <20231119134939.GA8784-robh@kernel.org> <ZVpswo3MSScT43Bo@sunspire>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZVpswo3MSScT43Bo@sunspire>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2023 21:14, Petre Rodan wrote:
> 
> Good morning!
> 
> On Sun, Nov 19, 2023 at 07:49:39AM -0600, Rob Herring wrote:
>> On Fri, Nov 17, 2023 at 09:22:57PM +0200, Petre Rodan wrote:
>>> Adds binding for digital Honeywell TruStability HSC and SSC series pressure 
>>> and temperature sensors.
>>>
> [..]
>>> Changes for v2:
>>> - Removed redundant quotations reported by robh's bot
>>> - Fixed yamllint warnings
>>>
>>> I'm failing to run 'make DT_CHECKER_FLAGS=-m dt_binding_check' due to
>>> python errors and exceptions
>>
>> What exceptions?
> 
> thanks for asking.
> 
> first off, installed packages. the first 4 are not part of the official Gentoo repo, so I might have prepared them with missing options if any where not included by default.
> I know nothing about python.

The easiest is to install them with pip. You might get old versions from
your distro. Although in your case, it looks you got most recent.

> 
> $ equery l dtschema pylibfdt ruamel-yaml yamllint jsonschema python 
> [I-O] [  ] dev-python/dtschema-2023.9:0
> [I-O] [  ] dev-python/pylibfdt-1.7.0_p1:0
> [I-O] [  ] dev-python/ruamel-yaml-0.18.5:0
> [I-O] [  ] dev-python/yamllint-1.33.0:0
> [IP-] [  ] dev-python/jsonschema-4.19.1:0

I guess this is the problem. The dtschema explicitly asks for:
    "jsonschema>=4.1.2,<4.18",
because newer jsonschema does not work well for us.

Best regards,
Krzysztof

