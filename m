Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4C1111B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/fdheDu"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 131DE610CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 09:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 131DE610CC
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V/fdheDu
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMOsCpHbyBUA
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  9 Nov 2023 09:24:15 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1FDC660ED4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 09:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FDC660ED4
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5bdc18756a3so502996a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 09 Nov 2023 01:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699521854; x=1700126654; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9z5YMQfnjQ/GY0LeFlyZmhpmN5+9DIXygr9TI/NBP0=;
        b=V/fdheDuxlvSFCdUJ6SDB7hDVQJx455x5vk1tkSoK7uoyxrfZjzKDeRiWAggTOQV5R
         YkwhaNgcvK6d23wFd5OhpECgBab6dXEImJBHB/Iy6PvkJLtblHY+kT7Peu2IuP2OHKJk
         kdAuw9kERiTIbMMJItvbwiasDgfh1bvwKrQ6hv8qZGHfaNw8BKt+ZEQe0W7OkJ4kIhzD
         kno8XS23YHSyQp6wKqycz8pN6zWQ6cshTJR2tbP+OJ4Sg6Lbmkqn/mb4DemjYxX8xj7S
         5ZK0cqfzUTZgenubDAD4clAjH6JxENOCGfxSLTuhzlQTcvrVvEAlFaDpjVVIAyEoImIn
         rr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699521854; x=1700126654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9z5YMQfnjQ/GY0LeFlyZmhpmN5+9DIXygr9TI/NBP0=;
        b=tJfRowhX9+0/cDTsepCh3jH1lSJ+ZMI2gaWS+MLvWs8bUgHIIkqXXjLweL8/2WYBaj
         h7E1VI9uBYq9BQmreb0wxcY0vjnL1hTQ+zdbQWxc/aarS6i2oEcTsbWlCao0a6X4dkVp
         Tpmz9L7xEp44XtYcowo4dto0yCZGlwT5gDqzJCtu9pUuyOKyU4pCBAyDpZBZOPSxwIA4
         4+TUA2ujq/pgMRy2x3GKeGXZ6PV6gCfQBLZT312xOYbI3xj15cMSfzoFI1o2Wza9PTT/
         +IOENff+J8aIPQb2U9mEQmlUF1mjp3al5i5yrIhBLjpX1xGYrQP5PNCh8BgKamC/AVoN
         F9Xg==
X-Gm-Message-State: AOJu0YwCQPmacmukMWBAjr2og4Bbm1tII2tslAvBKbm+qsL6U7OimQAx
	Uh/pnh+D3Dofp7JK3kbr5ic=
X-Google-Smtp-Source: AGHT+IENlNBi+FriuTiTX+gb9LYPZEJOn3W+qGieoAr6eCO/lUZaRo1Awj8aaYwZJVxrv6apffV17Q==
X-Received: by 2002:a17:903:48f:b0:1ca:e4b:148d with SMTP id jj15-20020a170903048f00b001ca0e4b148dmr3491122plb.65.1699521854398;
        Thu, 09 Nov 2023 01:24:14 -0800 (PST)
Received: from ?IPV6:2401:4900:2353:8963:b940:1ac0:2fbc:6b6? ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id h21-20020a170902eed500b001bf846dd2d0sm3066878plb.13.2023.11.09.01.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 01:24:13 -0800 (PST)
Message-ID: <1ceb75c6-e65c-4c82-ba7f-7eb5dfb65018@gmail.com>
Date: Thu, 9 Nov 2023 14:52:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: light: driver for Lite-On ltr390
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
References: <20231109090456.814230-1-anshulusr@gmail.com>
 <20231109090456.814230-2-anshulusr@gmail.com>
 <CACRpkdYtawfonnkGXzTD65fx4CMbbTaXe359tm7=57saHSNfqA@mail.gmail.com>
Content-Language: en-US
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <CACRpkdYtawfonnkGXzTD65fx4CMbbTaXe359tm7=57saHSNfqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Linus,

On 11/9/23 14:49, Linus Walleij wrote:
> Hi Anshul,
> 
> thanks for your patch!
> 
> Overall this looks good to me.
> 
> On Thu, Nov 9, 2023 at 10:07 AM Anshul Dalal <anshulusr@gmail.com> wrote:
> 
>> Implements driver for the Ambient/UV Light sensor LTR390.
>> The driver exposes two ways of getting sensor readings:
>>   1. Raw UV Counts directly from the sensor
>>   2. The computed UV Index value with a percision of 2 decimal places
>>
>> NOTE: Ambient light sensing has not been implemented yet.
>>
>> Datasheet:
>>   https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-390UV_Final_%20DS_V1%201.pdf
>>
>> Driver tested on RPi Zero 2W
>>
>> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> (...)
> 
>> +#define LTR390_FRCTIONAL_PERCISION 100
> 
> This define is just too hard for me to read, can you rename it?
> 
> Does it mean LTR390_FRACTIONAL_PRECISION? It's fine to spell it out like
> that instead.

Yes indeed, that typo would be fixed in the next revision.

Thanks for the review.

Best wishes,
Anshul
