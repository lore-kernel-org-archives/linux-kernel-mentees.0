Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE3D1804E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Nov 2023 16:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlwKfkrJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35D8E82C3B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Nov 2023 16:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35D8E82C3B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JlwKfkrJ
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrEzTt737XpH
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 15 Nov 2023 16:00:57 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E9A2B82C21
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Nov 2023 16:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A2B82C21
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6b44befac59so772595b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Nov 2023 08:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700064056; x=1700668856; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VsQDT2w0FjShhzuIz0BGJBYesGwhop9/GhNrCvVLr2Q=;
        b=JlwKfkrJ4ah47aRAP1mFUSHR2U4SS+NZmMZh7yi2YmY7aHYNrotyeD/8apempn2Qvy
         YIQo/dHf2cGcz/+gC/KXmasJHXhTk0w+/nYiibOjow13nim8lOBNZtpq/9i+WQ5aY2nQ
         JyaFA6KiOS24bD+IE+DLLGJZe3ipS6wtKHQ4IRChT/aEMBAdZBapG/v+mUoZIO37Hyr4
         FCl/0mGojZiffOd2oauI6DJr4qhZhE3ihI3vzcqmSYOGatVuDPQVgg47IAhbMgIruGZs
         AQun6IvPafZq1j9omp4kuOEieWH7CQOhyr0ZZMBOoJMOqE9cn370d9Of3lDQLkZKIJwD
         lkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700064056; x=1700668856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VsQDT2w0FjShhzuIz0BGJBYesGwhop9/GhNrCvVLr2Q=;
        b=uxZ0ohxLRexd+CCn36N8wDl/rEYJhsMchGkN8zufb+6OXmKJ0pYGeZLu5Ey2Frp+Ss
         JE1kH1eK7fyonT7ZpaDk/hJYyDIbUjyYl5n09rJJ027Oay67z35eBHWL0dgf9SFD2uYw
         SbZvS8qREotsIXXq6yAYD4n6fXFwrM+4gfqNiMmdVv9q5wTl45VgIS9A/eB1nMGttfzH
         h9rtvvuzJxQaLZCR5qOEGMG56AwS/vDOwoa14sDHEf1bDRLsR9vlJWknixxB1z7wud0e
         grQ0qtMsifEBhwNWwcxcGTmMeZ16JxdtpDjQODp665OlLu6LqTOkUuPENurwyIgIodSY
         tsgw==
X-Gm-Message-State: AOJu0Yys8NSW/yGhNZFlyVUI7IsUYHrpQI23CVpzTLEh0jriOvygt5oi
	92+poPe5rxYmOSJ95/lDZfk=
X-Google-Smtp-Source: AGHT+IErQoAlZrZcHWhp4ZkLm0PXKuCT9RSh1Z01Cc4NXpJxtkY2vJXfxyBL4/jbcb3YpioGTdSvwQ==
X-Received: by 2002:a05:6a20:e108:b0:187:962d:746b with SMTP id kr8-20020a056a20e10800b00187962d746bmr669389pzb.9.1700064055825;
        Wed, 15 Nov 2023 08:00:55 -0800 (PST)
Received: from [10.5.169.250] ([103.4.221.252])
        by smtp.gmail.com with ESMTPSA id h21-20020a056a00219500b006c046a60580sm2943372pfi.21.2023.11.15.08.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:00:55 -0800 (PST)
Message-ID: <9b1674d7-c41d-4d8b-bb28-09ed201c72cd@gmail.com>
Date: Wed, 15 Nov 2023 21:29:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: add aosong,ags02ma
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jonathan Cameron <jic23@kernel.org>
References: <20231115125810.1394854-1-anshulusr@gmail.com>
 <20231115125810.1394854-2-anshulusr@gmail.com>
 <20231115-stability-arrive-e0458f6f7b0f@squawk>
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <20231115-stability-arrive-e0458f6f7b0f@squawk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/23 20:08, Conor Dooley wrote:
> On Wed, Nov 15, 2023 at 06:28:07PM +0530, Anshul Dalal wrote:
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
>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
>> ---
>>
>> Changes for v2:
>> - Removed device from trivial-devices
> 
> Your $subject still says "trivial-devices" though, so please fix that in
> your next submission.
> 
>> - Added standalone binding with vdd-supply property
>> ---
>>  .../bindings/iio/chemical/aosong,ags02ma.yaml | 48 +++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml b/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
>> new file mode 100644
>> index 000000000000..4a0278c6318c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
>> @@ -0,0 +1,48 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/chemical/aosong,ags02ma.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Aosong AGS02MA VOC Sensor
>> +
>> +description: |
>> +  AGS02MA is an TVOC (Total Volatile Organic Compounds) i2c sensor with default
>> +  address of 0x1a.
>> +
>> +  Datasheet:
>> +    https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
>> +
>> +maintainers:
>> +  - Anshul Dalal <anshulusr@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - aosong,ags02ma
>> +      - asair,ags02ma
> 
> Why do you have two compatibles for the same device? Please document and
> use only one of these. The aoson website says:
> "Guangzhou ASAIR Electronic Co., Ltd"

I'm sorry but I couldn't find any reference to such name on
http://www.aosong.com/en/
In the contact page (http://www.aosong.com/en/article-34.html),
I could only find references to "Guangzhou Aosong Electronic Co., Ltd."

> so I suspect "asair" is a more apt vendor prefix.
> 

Asair is the brand name under which Guangzhou Aosong Electronics sells
their products [0]. After a prior discussion with Krzysztof [1], I
thought it would be the best to go with Aosong instead.

The rationale being since a vendor can only have a single prefix, if
Aosong were to sell some new product under the name Aosong, it would
then have to have the same vendor-prefix as other products under the
Asair brand.

[0]: https://www.linkedin.com/company/asairsensor/
[1]:
https://lore.kernel.org/lkml/1f62ab04-1679-44b1-b95e-e3954afbfa88@linaro.org/
Best regards,
Anshul
