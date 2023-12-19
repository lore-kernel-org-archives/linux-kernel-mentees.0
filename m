Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE9E125B5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Dec 2023 08:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOhKVdG0"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2250860DC2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Dec 2023 08:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2250860DC2
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iOhKVdG0
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWOcYkvG4VI4
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 19 Dec 2023 08:51:36 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 53678606B0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Dec 2023 08:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53678606B0
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a2331caab22so326388366b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Dec 2023 00:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702975894; x=1703580694; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rGIe2EK7hNusSYJr/yUJ1iPMkVap71w4BkhPzGCj38s=;
        b=iOhKVdG0zzDCk/M9ylTJfADUnVcleUS9vPGYILQRY8hPZ5OkWtuSY8EfiRKICMf0v0
         ij8ZjUYXPXNPHBygZiol1PnitIonD0A3tygeJv293xCeAdqqxyembmUWj3Fwp3DVDc3G
         a5j1v30MvVTo545Es+IRR4ALar+FYSMafkXeBP+hi0d3hW59WL3Yj2azMMFB9UdpHZ1o
         1ubU145cTNrw6wz9iJ8snh1y5L6Nl06VH0bao2It9WbQPyVk46+kPbeNhai7stWlfLDR
         beMwRYY6CQlOXzu8DJXOoX6qt/dCqaq+LIk+KtN9MQcTooYNG4rfD1QXhpHbvqq/HFRt
         i7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702975894; x=1703580694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGIe2EK7hNusSYJr/yUJ1iPMkVap71w4BkhPzGCj38s=;
        b=oXpHUhINXYiW2q9sB2ln6fGuzbic+TA4fe2bLbIDjqjeTX+CmzI9N9Qz7tfwd4yvlz
         huQryc9uHKaYRq84/BZ39zVnWKCmnnwDP6jvFGN8UatjZoZGq6rfrrOBJ8sQR4TYtDIS
         Wzo6JRPp9lCLXezQCjJyJxvRRTsGjqSsdHxDJvhUOWO/dYNNR5tsNzV1LKjrdOdFxVp4
         7oEOoW8x5BqXq6Tul66yzcp/z6jd08QtX/3bc417yOOnVuRDu11WMGNCHKngtCpTCjRM
         Ul6/HHif0NqsjGapgl7MjuUYVs1mWend1q/ZIVxGcDerXVfYZhy/OToW1K8JHkzHGBVv
         barw==
X-Gm-Message-State: AOJu0YySHxFdjv8zAG/wrNxyu6P5z8rNXUacNEj7lkpbdbHRaFlQhng6
	opAl1wt1cLAVAN5ZBBM5cHoxuA==
X-Google-Smtp-Source: AGHT+IE/uLtEN/FQI2tcw6havjOhmTS6nbfETIUblw3ZL/bE4vejZuPZaRPy5gLrnwq498fAk2CWpQ==
X-Received: by 2002:a17:906:c29a:b0:a23:6c1a:d119 with SMTP id r26-20020a170906c29a00b00a236c1ad119mr833386ejz.124.1702975894309;
        Tue, 19 Dec 2023 00:51:34 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vc11-20020a170907d08b00b00a1ce58e9fc7sm15019716ejc.64.2023.12.19.00.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 00:51:33 -0800 (PST)
Message-ID: <1fa6128f-03c1-4f41-8dff-4191893f460c@linaro.org>
Date: Tue, 19 Dec 2023 09:51:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: add MCP4821
Content-Language: en-US
To: Anshul Dalal <anshulusr@gmail.com>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231218164735.787199-1-anshulusr@gmail.com>
 <f8aaf7b3-fa17-495f-9c1c-9ddf6fb41d8a@linaro.org>
 <6c1e13b3-28d2-42fc-b9c2-dcfc4793fc39@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <6c1e13b3-28d2-42fc-b9c2-dcfc4793fc39@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2023 09:42, Anshul Dalal wrote:
> On 12/19/23 13:29, Krzysztof Kozlowski wrote:
>> On 18/12/2023 17:47, Anshul Dalal wrote:
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  vdd-supply: true
>>> +
>>> +  ldac-gpios:
>>> +    description: |
>>> +      Active Low LDAC (Latch DAC Input) pin used to update the DAC output.
>>> +    maxItems: 1
>>> +
>>> +  shdn-gpios:
>>
>> Open gpio-consumer-common.yaml and look at entries there.
>>
> 
> Should I name the property `powerdown-gpios` instead of `shdn-gpios` as
> specified in gpio-consumer-common.yaml?

Yes. You can provide the name of actual pin in description.

> Furthermore, do I need to add gpio-consumer-common.yaml as a ref?

No.


Best regards,
Krzysztof

