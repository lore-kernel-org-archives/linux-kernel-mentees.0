Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEA115AC2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 11:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcrcvKYa"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3A8E40926
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 11:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3A8E40926
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YcrcvKYa
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntc28_HyCl_I
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  8 Nov 2023 11:56:26 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 248AB40924
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 11:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 248AB40924
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cc921a4632so56877525ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Nov 2023 03:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699444585; x=1700049385; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYbvOLurRN2/BOw0AFji1VhZFNjdDiIJj9UJ87sPrXY=;
        b=YcrcvKYa2KvyhELnu/kGCV+5sAG6h/CJah4QPab+yuUUPPOMd0dWBhENTumnmwOqFz
         Yca0uImYJojd9pbzaGGfreqgJ6UhN7/aYDdk3tT3jRAyGuXfxrQw/jPBQ+m1z6WAls92
         qh+LoMRg+rzdK24AH1kt/WaZlvkz5KLdDjO2GHzRj5edFvqBLP7cylpr+JDBcFY2ZF1N
         FvRfsfqi1NPtzF7kfoLzxV4nGYVwsz7f4v3mIGydj6fUwulxaM+6BNHjqOvUizv2Xz9b
         tJPc1J19AiplP3F8T9nCgBBTTW38rGAlwN7chm3lMScIxSwAoLMxKJzx97oTxYQebBil
         80Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699444585; x=1700049385;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYbvOLurRN2/BOw0AFji1VhZFNjdDiIJj9UJ87sPrXY=;
        b=N1QP8QJv4hlhXNnX56uuq1WmH8+TQfjrTqdtn489ks8Ixv37Emgr96cQNufmEFxgnD
         5/Ur/Qz1DvBcKJeWOOCf+LKhGovY+ETbeEyWYeXKrAD6aNinazBPfJflv7/eegO83zQl
         DFGj+h/tF/tD83RbU/Ui9UAaE7wK5/fa2Iq02ibl4fVP1PyyMTryeGPT87hNT9UnED80
         DCsl8ehubnLhNq3RfLltWm+ACrOOr4QukHRMBF/UX4O1KMd4Cp0yhdjfXx/wq3NCWzaL
         gBrB737fRGLKgWg4PZlLMz9JTdqKDGtZvBabfWu5tcZsIKpNTD2kt4OEue/gaMlREKza
         bfGg==
X-Gm-Message-State: AOJu0Yx+OsGktbgvjKfUv7AVahnsHevdo9lurb7mxLn3edDKxIwto7Ts
	lxs/tPs/p2pNXTCJ9bwwlMU=
X-Google-Smtp-Source: AGHT+IHOd6LPtQEWQHjx/4sw4zdHg3cUPlqo8agp+i1omFqB+neRAFxtaqz37Fedc2P08oT3QqZs1g==
X-Received: by 2002:a17:902:f688:b0:1cc:5c8f:4056 with SMTP id l8-20020a170902f68800b001cc5c8f4056mr1759221plg.42.1699444585194;
        Wed, 08 Nov 2023 03:56:25 -0800 (PST)
Received: from ?IPV6:2401:4900:2353:8963:b940:1ac0:2fbc:6b6? ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b001cc307bcdbdsm1583627plg.211.2023.11.08.03.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 03:56:24 -0800 (PST)
Message-ID: <90cacd34-4812-4792-9bf0-362200431452@gmail.com>
Date: Wed, 8 Nov 2023 17:24:56 +0530
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
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <1d5d1357-0b53-4639-add9-2b3f38aae744@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hello Krzysztof,

On 11/7/23 23:17, Krzysztof Kozlowski wrote:
> On 07/11/2023 18:30, Anshul Dalal wrote:
>> Add bindings for Asair AGS02MA TVOC sensor to trivial devices.
>>
>> The sensor communicates over i2c with the default address 0x1a.
>> TVOC values can be read in the units of ppb and ug/m^3 at register 0x00.
>>
>> Datasheet:
>>   https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
>> Product-Page:
>>   http://www.aosong.com/m/en/products-33.html
>>
>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
>> index cd58179ae337..9cd67b758a88 100644
>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>> @@ -47,6 +47,8 @@ properties:
>>            - adi,lt7182s
>>              # AMS iAQ-Core VOC Sensor
>>            - ams,iaq-core
>> +            # TVOC (Total Volatile Organic Compounds) i2c sensor
>> +          - asair,ags02ma
> 
> I think you miss VDD supply.

I am sorry but I'm not sure what you meant. Are you referring to the
addition of some information in the commit description?

Best regards,
Anshul
