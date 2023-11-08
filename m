Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1B5101D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ni6nDbMg"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD3E581EC8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 12:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD3E581EC8
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ni6nDbMg
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHA_fv48gap3
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  8 Nov 2023 12:55:23 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A5C9081EC1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 12:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5C9081EC1
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c9b7c234a7so62060285ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Nov 2023 04:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699448123; x=1700052923; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cnFnGa1Xq3NRu1+Ex0WsMtBFHv4Yfs3kHDcwQXFSzNU=;
        b=ni6nDbMgW8w+yhZQgidvczROG8RcVxDPwRDI/MZFyT+d66uVvBVneVujKnFq8/Jg37
         XDxk7WGiUZqhd/Ri+UiKuosqrb93qYmzT64wrS9t84E9mUkXboEL/adgEUgYFeHLflYS
         rh0jKWhdE7Le2qAOASb4cpfc4bMAuJWOYtznZ/RjhZMHfi+Pa9l4IqpntSVyiFB6o16j
         filY87Ax5gbLc3/jhGeknA21i3BNFKmKIQKkYParGW+G47tQdtVMGvHCc0Kgr8N1PRQk
         SC94h+GEpxUu7GerbwtKx3pUtbBqSndCD9muAetbmJ9yvqfVL0wPeZf1VEoT+iHVNcAH
         kOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699448123; x=1700052923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnFnGa1Xq3NRu1+Ex0WsMtBFHv4Yfs3kHDcwQXFSzNU=;
        b=oLoxt3u1/1uVOvS7wjTNFisp/TiKJlt3L9eCgUpN+tAG9BIsn5maKQB1HdEq4M6gDS
         4zNpHDO8y02OyPZIFSA+Kyg3T7tGNDIny/NYL8mf8N23eG7V9irOBvuN53hAGkv2vYY1
         L8V+lNS/16edQIlzXJ5x9eu551WVvCb0d5Cz0MSkRL6JVP/ESPz8A8lHpDIxQtltxPpI
         qUXy2NyR3RGKMkSepxz1g+Nw6XZEphxxgCQ9nsH/rnNNRXMUswST4L5sBprIFJs8kpJe
         qtyzWsdqXNnYcKgnivfJNk7I62kbCIWnXzYz6OppvSXFfmXCSQ3NkCRZ8wxtdGFcU/SB
         hNKQ==
X-Gm-Message-State: AOJu0YxG6GXNa+ggMPpJD0oURF+3jvVCQrEAPbGoMB6B8H216vDAflSp
	B2CCU936HDL6TqkuxON+39s=
X-Google-Smtp-Source: AGHT+IGrbJU4UhYwNZD8MuOWryrbZUlLrn0fvKGeRWexgJYA0rdUWu3Ogr2W8YqZPCXVFJU2nxeJFQ==
X-Received: by 2002:a17:902:c403:b0:1ca:7086:60f7 with SMTP id k3-20020a170902c40300b001ca708660f7mr2494532plk.28.1699448122932;
        Wed, 08 Nov 2023 04:55:22 -0800 (PST)
Received: from ?IPV6:2401:4900:2353:8963:b940:1ac0:2fbc:6b6? ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id ju1-20020a170903428100b001b8622c1ad2sm1695286plb.130.2023.11.08.04.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 04:55:22 -0800 (PST)
Message-ID: <e192a58e-47f8-4410-81a5-de1ebab3251d@gmail.com>
Date: Wed, 8 Nov 2023 18:23:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: trivial-devices: add asair,ags02ma
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
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
 <6f654341-a9c0-4412-ac87-5800d6122023@linaro.org>
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <6f654341-a9c0-4412-ac87-5800d6122023@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/8/23 17:59, Krzysztof Kozlowski wrote:
> On 08/11/2023 13:15, Anshul Dalal wrote:
>> On 11/8/23 17:31, Krzysztof Kozlowski wrote:
>>> On 08/11/2023 12:54, Anshul Dalal wrote:
>>>>
>>>> Hello Krzysztof,
>>>>
>>>> On 11/7/23 23:17, Krzysztof Kozlowski wrote:
>>>>> On 07/11/2023 18:30, Anshul Dalal wrote:
>>>>>> Add bindings for Asair AGS02MA TVOC sensor to trivial devices.
>>>>>>
>>>>>> The sensor communicates over i2c with the default address 0x1a.
>>>>>> TVOC values can be read in the units of ppb and ug/m^3 at register 0x00.
>>>>>>
>>>>>> Datasheet:
>>>>>>   https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
>>>>>> Product-Page:
>>>>>>   http://www.aosong.com/m/en/products-33.html
>>>>>>
>>>>>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>>>>>>  1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
>>>>>> index cd58179ae337..9cd67b758a88 100644
>>>>>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>>>>>> @@ -47,6 +47,8 @@ properties:
>>>>>>            - adi,lt7182s
>>>>>>              # AMS iAQ-Core VOC Sensor
>>>>>>            - ams,iaq-core
>>>>>> +            # TVOC (Total Volatile Organic Compounds) i2c sensor
>>>>>> +          - asair,ags02ma
>>>>>
>>>>> I think you miss VDD supply.
>>>>
>>>> I am sorry but I'm not sure what you meant. Are you referring to the
>>>> addition of some information in the commit description?
>>>
>>> I meant that your device might not be trivial. Your device takes VDD
>>> supply, which is now not described in the bindings. Do you want to say
>>> that VDD supply in all possible designs is hard-wired to
>>> non-controllable regulator supply?
>>
>> I can't speak for all possible designs but for testing this driver I had
>> just connected the VDD pin to 5V out of the Raspberry Pi. I have since
>> verified 3.3V to also work.
>> Could you explain why `vdd-supply` is a property or point me to further
>> sources. Wouldn't almost all devices have a VDD/VCC pin for power in?
> 
> Most of the devices have such pin. For most of the devices we include it
> in the bindings.
> 
> git grep regulator_get -- drivers/iio/
> git grep vdd -- drivers/iio/
> 
> If you do not describe it in the bindings, then your device will have to
> be supplied by always-on regulators (and marking controllable regulator
> as always-on because of this is not correct).
>
Thanks for the explanation Krzysztof. If I understand correctly, having
an vdd-supply in the binding indicates that the device may be powered by
a controllable power source instead of one that is always on.

> If you are unsure and you just work on some sensor not used for final
> product, I think it's fine as is, so to add the regulator later if ever
> needed.

No problem, I can add the required properties in the next patch version.
I need to make a few changes to the driver anyways.

Just out of curiosity, the sensor supports reassigning of the i2c
address by writing to the 0x21 register from the default address of
0x1a. Is there some way to represent this in the binding.
For future reference, is there some exhaustive list or specification
document for all the allowed properties.

Thanks for the help,
Anshul
