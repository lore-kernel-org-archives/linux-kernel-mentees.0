Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F15916404
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZRyCjCO"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0907540A9B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 12:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0907540A9B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NZRyCjCO
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlTWdLOTEL6s
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  8 Nov 2023 12:16:57 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6E7DD40A98
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 12:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E7DD40A98
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6c320a821c4so6012700b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Nov 2023 04:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699445817; x=1700050617; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0odlHwOtNd/gQ2OSreSLITmOX7RsQ54slrLEuU0nUY=;
        b=NZRyCjCOHKweLMZ2lIrdH98GoHBA5A0wAAqcQ/6D4pqmgYK5ol/Iuxp+hidpLrB1qG
         UIeLexVfM9Ao7UdqjLrEY9shME/t6Vo1uIy4NaEscgUaE4AfxXYuGdQ20FcSpfFFDS0y
         QY7SvQa+iTY88Fs/5isRzN+E7o7gQanu4c46UUqxclgyBh2Pl/1hU8vKhyo3ITfChhsf
         ysqpRIJfucqKAMQ+EXT4U44hRFl7EfunMOeQ/VZL5k+MN9VccpeML4MmRaBDgFr9oqgA
         sTdotgy1czpOn8XEXBmKS40Xdad5IeeFGDNaHpRgQOy2OAibNyE7wQ+2+AEUw1W6wze+
         gykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699445817; x=1700050617;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a0odlHwOtNd/gQ2OSreSLITmOX7RsQ54slrLEuU0nUY=;
        b=Dbfq8l/Tmcv9ZPD8lgBh55wBCVnCm2jFlZKL26Lg4lzAm+rTmT+6iN0PX+B7PJxF7f
         /vE/jkM+TglfdwZuVBKvhtjZdT7k/EGPn29flvTUxbR5v9DjVYy+0dnGdUllpbmnkwvz
         RQZJLgruNmzogjk7Q9Lx7gagGFC7B5xlT+tPy+fZNn+Vs1mwXz4lDs3BqLR2OfeEnJ+A
         JVoiqF9unpAVXZG5AEPAcT3yshp8+RJJhVje6hA+auAisJkRC2vVzmtIEOWEeJJnfphS
         NusYjraZACcMDOLTfdtpJY1yR0IKifvZItXrrAj9ry59V1l87iSdkEzrrp99GBdF8iDz
         85dA==
X-Gm-Message-State: AOJu0YxzgkKxJ5wXpYhYVrje7efNZRmSKDv8cl/pRtCz5ZVxz99nHv5I
	9KqUeP62j518kaw74lrSRFs=
X-Google-Smtp-Source: AGHT+IEgvBlfFoAm3o5yLspuEPCkpGv8ovqzhX0voi151tq5DxVHhnPFdmjziZe7SPm7I5oHL/driA==
X-Received: by 2002:a05:6a00:88b:b0:6c2:cb9a:885e with SMTP id q11-20020a056a00088b00b006c2cb9a885emr1597966pfj.15.1699445816503;
        Wed, 08 Nov 2023 04:16:56 -0800 (PST)
Received: from ?IPV6:2401:4900:2353:8963:b940:1ac0:2fbc:6b6? ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id b21-20020a056a0002d500b00688965c5227sm8836395pft.120.2023.11.08.04.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 04:16:56 -0800 (PST)
Message-ID: <7501036c-4e1f-4993-97a7-6c36c7cc8358@gmail.com>
Date: Wed, 8 Nov 2023 17:45:24 +0530
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
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <77e1d308-6ac3-4200-b72a-6d5717869b06@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/23 17:31, Krzysztof Kozlowski wrote:
> On 08/11/2023 12:54, Anshul Dalal wrote:
>>
>> Hello Krzysztof,
>>
>> On 11/7/23 23:17, Krzysztof Kozlowski wrote:
>>> On 07/11/2023 18:30, Anshul Dalal wrote:
>>>> Add bindings for Asair AGS02MA TVOC sensor to trivial devices.
>>>>
>>>> The sensor communicates over i2c with the default address 0x1a.
>>>> TVOC values can be read in the units of ppb and ug/m^3 at register 0x00.
>>>>
>>>> Datasheet:
>>>>   https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
>>>> Product-Page:
>>>>   http://www.aosong.com/m/en/products-33.html
>>>>
>>>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
>>>> index cd58179ae337..9cd67b758a88 100644
>>>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>>>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>>>> @@ -47,6 +47,8 @@ properties:
>>>>            - adi,lt7182s
>>>>              # AMS iAQ-Core VOC Sensor
>>>>            - ams,iaq-core
>>>> +            # TVOC (Total Volatile Organic Compounds) i2c sensor
>>>> +          - asair,ags02ma
>>>
>>> I think you miss VDD supply.
>>
>> I am sorry but I'm not sure what you meant. Are you referring to the
>> addition of some information in the commit description?
> 
> I meant that your device might not be trivial. Your device takes VDD
> supply, which is now not described in the bindings. Do you want to say
> that VDD supply in all possible designs is hard-wired to
> non-controllable regulator supply?

I can't speak for all possible designs but for testing this driver I had
just connected the VDD pin to 5V out of the Raspberry Pi. I have since
verified 3.3V to also work.
Could you explain why `vdd-supply` is a property or point me to further
sources. Wouldn't almost all devices have a VDD/VCC pin for power in?

Best Regards,
Anshul
