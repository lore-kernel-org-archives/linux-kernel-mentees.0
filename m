Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFBA1773C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 12:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ar7L60g+"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E5406107A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 12:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E5406107A
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ar7L60g+
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJ2wMZVrHDcO
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  8 Nov 2023 12:29:47 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CAD3E61079
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 12:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAD3E61079
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso47534905e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Nov 2023 04:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699446585; x=1700051385; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WEwxhVkZ+suZRCLepHPEDyEGjw0C04lFSj6Fq9O+qQ0=;
        b=Ar7L60g+7nyW9QknUhDYoDMAG/yYlfQxOzvM9MP9nux4KHay9BfeksLr0gOA58X48X
         Jb0RaXUUF72X4LpbwCPVacL0aViGihK8k0qVtRrou1B5SerQsSKQtMdhd27I4ufbXVsM
         9laa2GitgRp0CPBEWwvJIkzWslvddl6E8MJrNWTIuM1PinKtCfrMPfMTsHlo+Yx4+L59
         7McAmB8r3q8Sut3FvdfwRc2XsdPMzIcQ97KkXodz0iC6mRR8XYBgYkCbvcyjy7ftWHz2
         LOhPbrt86XFoLBS+VGUaFLrWDMvSc9fCgreYuVxm3A6EM2I8Q0sedqM4f2XXl/7xOHJ4
         x5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699446585; x=1700051385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WEwxhVkZ+suZRCLepHPEDyEGjw0C04lFSj6Fq9O+qQ0=;
        b=Qd6Zz6EtKpzDBqiHVZ6qtvVl6DccOktYkWePdwPZWo41UClkwZz+0uHk7IIQ5ZzfaO
         K9Nl1x9V4Ly7XzoodRJVAI6YjHtl+E4prIVU+gW1rtc2Jb9cBmORXeCti5sKyHtiRgSw
         dpyAiIyvSb8PGEMKhGjlBKdepDIh48+s+m6+d3UrQPq+0Mn7BZTjZ1a1fUZvCMLsbvLz
         LfNONIXocmXDaDELgCMirLkOUYDS/nLrDBAZ1Y3NG87eS06eMvgaI8Jxk9c4YPwdJ7ou
         wrt8uWbQtcrN21kfVpZ3jIXtDeSzsJN952dw16wqbCUwX5aulC2gYq+PVNHrPGFfVM7x
         0xKg==
X-Gm-Message-State: AOJu0Yx1rt/cFPDQmxEDgFVAN42tuGBbS8S9SaeSvj9JK9dKBG6rqi5R
	9Hm/RBkQzFIo9VfmJUvxtbBSPA==
X-Google-Smtp-Source: AGHT+IGtvteu6oY5MW/lFPUmgAUSn2VrQkswaslGXVnER/rgoZB80sOS5KVjqmC4mIFBHB7BCdNOlw==
X-Received: by 2002:a05:600c:4e86:b0:40a:20f3:d126 with SMTP id f6-20020a05600c4e8600b0040a20f3d126mr1515948wmq.6.1699446584659;
        Wed, 08 Nov 2023 04:29:44 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id jg2-20020a05600ca00200b004065daba6casm19287874wmb.46.2023.11.08.04.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 04:29:44 -0800 (PST)
Message-ID: <6f654341-a9c0-4412-ac87-5800d6122023@linaro.org>
Date: Wed, 8 Nov 2023 13:29:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: trivial-devices: add asair,ags02ma
Content-Language: en-US
To: Anshul Dalal <anshulusr@gmail.com>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231107173100.62715-1-anshulusr@gmail.com>
 <20231107173100.62715-2-anshulusr@gmail.com>
 <1d5d1357-0b53-4639-add9-2b3f38aae744@linaro.org>
 <90cacd34-4812-4792-9bf0-362200431452@gmail.com>
 <77e1d308-6ac3-4200-b72a-6d5717869b06@linaro.org>
 <7501036c-4e1f-4993-97a7-6c36c7cc8358@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <7501036c-4e1f-4993-97a7-6c36c7cc8358@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/11/2023 13:15, Anshul Dalal wrote:
> On 11/8/23 17:31, Krzysztof Kozlowski wrote:
>> On 08/11/2023 12:54, Anshul Dalal wrote:
>>>
>>> Hello Krzysztof,
>>>
>>> On 11/7/23 23:17, Krzysztof Kozlowski wrote:
>>>> On 07/11/2023 18:30, Anshul Dalal wrote:
>>>>> Add bindings for Asair AGS02MA TVOC sensor to trivial devices.
>>>>>
>>>>> The sensor communicates over i2c with the default address 0x1a.
>>>>> TVOC values can be read in the units of ppb and ug/m^3 at register 0x00.
>>>>>
>>>>> Datasheet:
>>>>>   https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
>>>>> Product-Page:
>>>>>   http://www.aosong.com/m/en/products-33.html
>>>>>
>>>>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>>>>>  1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
>>>>> index cd58179ae337..9cd67b758a88 100644
>>>>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>>>>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>>>>> @@ -47,6 +47,8 @@ properties:
>>>>>            - adi,lt7182s
>>>>>              # AMS iAQ-Core VOC Sensor
>>>>>            - ams,iaq-core
>>>>> +            # TVOC (Total Volatile Organic Compounds) i2c sensor
>>>>> +          - asair,ags02ma
>>>>
>>>> I think you miss VDD supply.
>>>
>>> I am sorry but I'm not sure what you meant. Are you referring to the
>>> addition of some information in the commit description?
>>
>> I meant that your device might not be trivial. Your device takes VDD
>> supply, which is now not described in the bindings. Do you want to say
>> that VDD supply in all possible designs is hard-wired to
>> non-controllable regulator supply?
> 
> I can't speak for all possible designs but for testing this driver I had
> just connected the VDD pin to 5V out of the Raspberry Pi. I have since
> verified 3.3V to also work.
> Could you explain why `vdd-supply` is a property or point me to further
> sources. Wouldn't almost all devices have a VDD/VCC pin for power in?

Most of the devices have such pin. For most of the devices we include it
in the bindings.

git grep regulator_get -- drivers/iio/
git grep vdd -- drivers/iio/

If you do not describe it in the bindings, then your device will have to
be supplied by always-on regulators (and marking controllable regulator
as always-on because of this is not correct).

If you are unsure and you just work on some sensor not used for final
product, I think it's fine as is, so to add the regulator later if ever
needed.

Best regards,
Krzysztof

