Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440941EB46
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3eh1t+o"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE16940A88
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 10:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE16940A88
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m3eh1t+o
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SF2SVhArvcfn
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 21 Nov 2023 10:14:03 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 25DBB40A82
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 10:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25DBB40A82
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6d7e67c169cso92606a34.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 02:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700561642; x=1701166442; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2rBM84BPH3h1OTNeKF8gkahQrwyTUFEFO20bhp2Xhd8=;
        b=m3eh1t+oSU1E0kBp3Rr9rIXNy2koa9M+ULvXIqhVVcvwgE/1yBgndmUUO1+a7Pk6xn
         u1M24xy9VsxxaD0mptxUimV4rTQj30+EY8c3z7h3/2SjwbYtynUqYmvdd1iUwWW1Poqs
         BpTNpE72ee0ez6wgxF5fnFcdBI90CNEg61kLvZoM5XBha1Y2ajkcwgnu1alQxImVmZGm
         SHQfnnvp0RJtMzeAcnxdou5IU36KI/jVcDlTqJBY1D46mm84pvXFxqMTcVAYGHlA7nfQ
         i8e7UgkUXeLLkHTdp3A57MLbBeWeOfqMtQpZB+zTUh/pf2Lfb3jVH7ZP20FIyXJQedIv
         LAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700561642; x=1701166442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2rBM84BPH3h1OTNeKF8gkahQrwyTUFEFO20bhp2Xhd8=;
        b=PQc4GfVkg1gFdwK0lRMgODXM0h9vZWFYnjDmM3xincpo58JxI47x9tdTLc0+Fw1gG1
         6b6JdDMdYTRccloyXnGuUUaqa2TRUGHnx9oI3+aAMGtu/G819KUIDuvrsztiBgod4lwJ
         zjg9TIZrRUtK3Qdy0TtebQMU5UhliWdA0ei8uQuZRX7BhlN51PMZxb0AQwcGOMUsfjfU
         xhDN/MG7xcMkCKJ9Bz/hvZT+XGNs9nSsK8YTF2cqd1sSgg+jfLmGm7pFb8M0z/kowha8
         7b+z2JQAl/TkuEVap/sDFsx5PqDWJpodx93437LFmSj3IAsMxtLa3ndtQJ2+rtm/o11f
         lq6A==
X-Gm-Message-State: AOJu0YxXTBxJuliZIgO3eu4zf+ZFqd+z/hqXURDBBi/cXgouBXlYXegf
	vGW3VUVXHTaNMnBGZ1nV5GU=
X-Google-Smtp-Source: AGHT+IGhEXVp30ly+W+J0Vq5BReMmqT7YvixSbVC5mluqZTiIrvaPLLb925ROrcuhxW/NFuCjXOCsQ==
X-Received: by 2002:a05:6871:7b0c:b0:1f5:c7bb:8f2d with SMTP id pf12-20020a0568717b0c00b001f5c7bb8f2dmr12045321oac.35.1700561642127;
        Tue, 21 Nov 2023 02:14:02 -0800 (PST)
Received: from ?IPV6:2401:4900:2353:8963:b940:1ac0:2fbc:6b6? ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id f2-20020a056a0022c200b0064fd4a6b306sm7538948pfj.76.2023.11.21.02.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 02:14:01 -0800 (PST)
Message-ID: <4eb9d00a-a672-40a8-a923-d728432b1250@gmail.com>
Date: Tue, 21 Nov 2023 15:42:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: iio: chemical: add aosong,ags02ma
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jonathan Cameron <jic23@kernel.org>
References: <20231121095800.2180870-1-anshulusr@gmail.com>
 <20231121095800.2180870-2-anshulusr@gmail.com>
 <81149957-0403-4e41-8405-77ef8bfa3c8c@linaro.org>
Content-Language: en-US
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <81149957-0403-4e41-8405-77ef8bfa3c8c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/21/23 15:33, Krzysztof Kozlowski wrote:
> On 21/11/2023 10:57, Anshul Dalal wrote:
>> Add bindings for Aosong AGS02MA TVOC sensor.
>>
>> The sensor communicates over i2c with the default address 0x1a.
>> TVOC values can be read in the units of ppb and ug/m^3 at register 0x00.
>>
>> Datasheet:
>>   https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
>> Product-Page:
>>   http://www.aosong.com/m/en/products-33.html
>>
> 
> 
>> +---
>> +$id: http://devicetree.org/schemas/iio/chemical/aosong,ags02ma.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Aosong AGS02MA VOC Sensor
>> [..]
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        light-sensor@1a {
> 
> 
> You called it chemical, so why this is here light-sensor?

I was working on a binding for a light sensor in parallel at that time,
I probably forgot to change this when copying the example from the light
sensor.

Would be replaced by "voc-sensor" in the next revision, apologies for
any inconvenience.

Thanks for the review.

Best Regards,
Anshul
