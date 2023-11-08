Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2109010FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 00:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0lu9RZh"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8778E81E17
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 00:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8778E81E17
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m0lu9RZh
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pVPqjRiUJEVf
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  8 Nov 2023 00:34:20 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E503281E14
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Nov 2023 00:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E503281E14
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cc37fb1310so45560665ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Nov 2023 16:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699403659; x=1700008459; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bo+wNYvdH42XBot0MOWGC8vCva7jElVxl1Yf8J6aNZU=;
        b=m0lu9RZhxmulIiFqupszgzaRLRONkNYUvdT8CMsKLk/UNgO2uonTaXBjlGXtob7dRf
         VgZfG8QyLoqDtnGRpKqJCAEb2IoXeR9+xR3/ud9ar6N4vLFGOQdXoiUzOdisJSAGDor6
         sosQqpzYXSvfG3KGxGE3wJTcIB/DUpBOXhgoYewzFWm0Cyw2ZbLNvbaZREtSfzJXWqB1
         dJi2rTDV59ExW8FMVUU9cuTul24ljpbyf4IB5HeucBt0LwD+4q1Q7vrilmCdng1wSM3k
         bhpCudHKVOAJh4v2HSleyNf8fHqDh8OhStFaxyne7fHHJ88Hgr5ULG3teB4oAcuLD0NW
         +56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699403659; x=1700008459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bo+wNYvdH42XBot0MOWGC8vCva7jElVxl1Yf8J6aNZU=;
        b=lD9peSvttHLy0DNzYZuii1jfOooZL2VIpm3W5X5ICWQlMJj63EbFBgtgMOBGCpizip
         sAdRDHBf+gOE2JPsV8rsPpblgCjpaLSDRbjhtSGeNRbuCr03I0wOYtH/74CvmFu3SX1W
         3IPOGWYtUBYqlGvcO6E3vLn3dEbo7d7Dpvn6M2k9aIQPRYmi0fQHNCf7lGbxu1eOZ3H6
         P/sTOnEbKlRTSRUA1b/o8WuF0UebiSfM5TWXMoeZ8fwEeDNRD0Bzxb5YDCwBwyqII0OE
         sLyZYE0/DfbnorS7ssRcB7SIPJQ6w/BuJAtaiQhu53RgyhTQHQyAAKWydQcZWa+rrYKm
         QJzg==
X-Gm-Message-State: AOJu0Yxy25CPrz1k9Kk2jx3nYoznRnyjPfTDXICLhm1sY5Ph+kMakCZN
	GJsV8qeRbnEVDHytFqi1CuM=
X-Google-Smtp-Source: AGHT+IFDPzQtLh6+yY5GKCHMN9W6XwtxJ90L36jbtGh9dSGXzUV4r7YpeRT7sM7ArPOdn2NSQT8ExQ==
X-Received: by 2002:a17:902:e9c5:b0:1cc:4ff3:c837 with SMTP id 5-20020a170902e9c500b001cc4ff3c837mr517996plk.68.1699403659132;
        Tue, 07 Nov 2023 16:34:19 -0800 (PST)
Received: from [10.3.171.174] ([103.4.222.252])
        by smtp.gmail.com with ESMTPSA id j24-20020a170902759800b001c47541ecd7sm396385pll.250.2023.11.07.16.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 16:34:18 -0800 (PST)
Message-ID: <f66cab34-266d-4e9f-b53f-26a2948f863f@gmail.com>
Date: Wed, 8 Nov 2023 06:02:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add asair
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231107173100.62715-1-anshulusr@gmail.com>
 <87762a47-9caf-435a-9b73-397384660b11@linaro.org>
Content-Language: en-US
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <87762a47-9caf-435a-9b73-397384660b11@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/23 23:16, Krzysztof Kozlowski wrote:
> On 07/11/2023 18:30, Anshul Dalal wrote:
>> Aosong Electronic Co., LTD. is a supplier for MEMS sensors such as AHT20
>> temperature and humidity sensor under the name Asair
> 
> The name of the company is Aosong Electronic or Asair? What does Asair
> stands for? Sensors name? Then it is not a vendor prefix.
> 

Asair is the brand name under which Aosong Electronics sells their
products. I thought Asair would be the better choice since
all their products use that as the manufacturer name instead of Aosong
as well as all the retail suppliers of their sensors.

>>
>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index 573578db9509..df3204f9dda6 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -143,6 +143,8 @@ patternProperties:
>>      description: Artesyn Embedded Technologies Inc.
>>    "^asahi-kasei,.*":
>>      description: Asahi Kasei Corp.
>> +  "^asair,.*":
>> +    description: Aosong Electronic Co., Ltd.
>>    "^asc,.*":
>>      description: All Sensors Corporation
>>    "^asix,.*":
> 
> Best regards,
> Krzysztof
> 
