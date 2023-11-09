Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545347E4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceiMkKWn"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 640EE41DBD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 10:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 640EE41DBD
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ceiMkKWn
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pl2WR2I--Auk
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  9 Nov 2023 10:37:03 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 89744418B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 10:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89744418B3
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5b9390d6bd3so1484126a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 09 Nov 2023 02:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699526223; x=1700131023; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j4upJP2Fg5H/4Bb05iQ23yejvTGPnKm3BWZ8iv5K1f0=;
        b=ceiMkKWnhe93wivsy+1RGgMN7K9lwx1eh1gciWa3Hmi/kD2zje+r7zmHuL/f1v6524
         uvj/fHSpC+tq78e82bHKxHWq13EJHaOO/aXtrIYfOhZS8hID/D4FRiBP5O/aVopydFI2
         btbON/W9mIgKRUn75fOiAoIbDiOYjsNzbAA/Tl2vqEJ6uqnk1suodiE3fPkGd510ro4C
         lRPaEEZ17z01EhCzLFKV60LVqkpcHdIHKrvxL92EXd6/KqVIehxprusBeN+fo8QdtwRw
         39qDM70ZXwzUU93r7Ckl0uhL+G+s//AooWLU4Uh9OA28XEdgemJlp8CYOqedjcIoz/dy
         Xv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699526223; x=1700131023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j4upJP2Fg5H/4Bb05iQ23yejvTGPnKm3BWZ8iv5K1f0=;
        b=GaXAvJ6FSn/7+oYGrpatZNpK013f7qkbT4QpCYvh7IGA+vCuESOQYiCgJHloThBJ+G
         VjrX4dZMUFCNQbhPRYClgH6fUS6NcURj4OTxD3ANefjxDj43yfe2sg2mSQUODJSDSFIA
         gv7LWPKX2upr85LYAN/Fi/JGIYCMETdNax8BPnU0F3JNxULN0dx/QOWkkl2MoB1Q5WU1
         17qT+nQapKYXpDrnhXmlEfCcMY3rg4UVetWM4O2RsEFDrULxlC710FfITpXfEn46GXXV
         dnP4ZgUyeIPDeI4NuDky26Vsq7yvRo/EXVmK+uW0kXrLy/lzmmQGJsir2fdzNn6ASGxT
         0sMw==
X-Gm-Message-State: AOJu0YzX4avXkQwJPonzN6HAn2SERM+G20onXFQYwMQxciLibAxopZ9l
	I3Hwg0TRVeNX7pUc5yDFNJ0=
X-Google-Smtp-Source: AGHT+IEhHqHsa1Dl5340outMycvmGWx1r/7lCTKlGNoYQzJLvjRGNpI9+HJVQ4a2LrhxC0BzPLclFw==
X-Received: by 2002:a17:90a:7346:b0:280:735:bece with SMTP id j6-20020a17090a734600b002800735becemr1826896pjs.16.1699526222670;
        Thu, 09 Nov 2023 02:37:02 -0800 (PST)
Received: from [100.127.18.209] ([49.37.136.118])
        by smtp.gmail.com with ESMTPSA id w16-20020a17090a15d000b00280202c092fsm1079008pjd.33.2023.11.09.02.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 02:37:02 -0800 (PST)
Message-ID: <844937f1-b3f7-4156-b60a-e9e17d8aed6e@gmail.com>
Date: Thu, 9 Nov 2023 16:05:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: light: add ltr390
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
References: <20231109090456.814230-1-anshulusr@gmail.com>
 <f7fea4d1-c1ae-4ab5-bcbd-30683ad7a349@linaro.org>
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <f7fea4d1-c1ae-4ab5-bcbd-30683ad7a349@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Krzysztof,

On 11/9/23 15:57, Krzysztof Kozlowski wrote:
> On 09/11/2023 10:04, Anshul Dalal wrote:
>> Add binding for Lite-On LTR390 which is an Ambient/UV light sensor that
>> communicates over i2c with an address of 0x53.
>>
>> Datasheet:
>>   https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-390UV_Final_%20DS_V1%201.pdf
>>
>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> 
> 
>> +  interrupts:
>> +    maxItems: 1
>> +    description: |
>> +      Level interrupt pin with open drain output.
>> +      The sensor pulls this pin low when the measured reading is greater than
>> +      some configured threshold.
>> +
>> +  vdd-supply: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        light-sensor@53 {
>> +            compatible = "liteon,ltr390";
>> +            reg = <0x53>;
> 
> Please extend the example to be complete - interrupts and vdd-supply.

Could the following be used as a suitable example.

#include <dt-bindings/interrupt-controller/irq.h>

i2c {
    #address-cells = <1>;
    #size-cells = <0>;

    light-sensor@53 {
        compatible = "liteon,ltr390";
        reg = <0x53>;
        interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
        vdd-supply = <&vdd_regulator>;
    };
};

Thanks for the review.

Best regards,
Anshul
