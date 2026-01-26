Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD97221DAE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421628; cv=none; b=Dm+jgwub5ebaDShlAzOBjwDsvVps5AlQZ0V0BNqZnRfJOlz+XnwAivZNHPRX9GL25/EXgDg+0KC6ZNgzjcf7qfOTiJRxz3hsQiBiAUIyIY394HTnY9JJwOIs7osvr4mssRIbnQUgOePoVRRdCHjCQzXxJ7hFTSV8CyZGgGLhf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421628; c=relaxed/simple;
	bh=tJN8cBuW1VuIx84lc7fZGDOv71FRj+5cuSY3sUiPiOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Smaz0JTEOpY5x6MoiU1HNT4CBoXZ5WTFa1F0Xq3KzQW0CGYokIVWl5qvS4yCzHAhnHkuX0aeKPmcM5fYonb+OtfxZBGyMeYGDCAoPS2YZ+W77Qb1gjBbSugLAfvoY5BMYmUarRF2oiaDvz+flUx7tey6QDd8HysVU0XMP0ByXEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YxV2zIaL; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YxV2zIaL"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA14340811
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 10:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjYVAVuEifiM for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jan 2026 10:00:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 706E740810
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 706E740810
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YxV2zIaL
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 706E740810
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 10:00:25 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59b679cff1fso4209900e87.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 02:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769421623; x=1770026423; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJfKflYBu18fhX3WN0xj5fj1Y8QY4H7l3AO1Jpg4o/o=;
        b=YxV2zIaL4cO2dtFPib+owmzh8jlm39Xb/upx6i9V0r3DD3SxZbbgxiPGG6CfIqMNyw
         0gyYd7fPmKMkYOPOot9yVVhh9cz20+Av8XocvRlNqLIDbdRgiTlm4M3V6EuhvPC5eIkd
         UXTYXT8JmXsYOAQVnn4yXUBOg8f7DgWmi/E/aLZ40kODCPmBGVM3ifBCsQLwbf0MU4xq
         z/PrEVqYENvBP6pZl2r6yzTquuAuTru/iZczeRH99bTdWXj1K9mcOp9QtHwFlhSTAqte
         6PxWceXr4KxJHLw+IlWNqvjymenooSLBt4ycTGuIuP79n4ib1aPfVSzp7JlkdZJ1yq4M
         YNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421623; x=1770026423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJfKflYBu18fhX3WN0xj5fj1Y8QY4H7l3AO1Jpg4o/o=;
        b=m4VjU/yOW4V4rwgcDptiqwu7KGX6FrtzOFeTlvxki2tPRdJUpIUvvyq2xmsciCmeR4
         z5l0TFsbTSMBzI8hJ0wHcIHcV/vpxYqx0+Aq0WZB31gGJ3qcea/ha3I0eSSkpmY+k2ZZ
         hYsv78YxWZqO3fCRc76K8zKotdBttREkJYd6Rya7QR8FGFHuhPTqKerYy5nvjYLel3by
         F10Ikx5LdAkaZzymFj94xDDsikyJSs/RNE2xHtBHQG6jNLUlnkE1L6fRaTUI+LVu39i+
         n3HlOdtKRbB1oqDZ6jMkfTOKCaTDUDjwUwEKlmU0CeeIzpIELCFPHfpWiXwXEhsOpxJb
         BZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZEGpRCuybRcSP4hw3WP6zgNVxm1DmDZdU3BD9EHyIvTzfozTgQ9eSjkUGbd8SeKjiSRKppWAc+Z1UAwAzNm+A+7nazg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwHohnWDj7hqh6NA1sFMzoDX0O9eZfGk+l4oXuyi2IycVSo/AXp
	UgG6n41PUIdTVfzkflUFNRdpkaskaxnJeDIjF2v6C4tyM5IBmalmkRwa+Ai8kgZhMo8=
X-Gm-Gg: AZuq6aKly2JCh4+G75IJVQbRi+bgjod5uUtgJYDxLeE9wGDLZLzkyUTH6bPw9AYlWhR
	fkfwfBuoHVn4K072oknYqEt1DYvzqvy2abtSjZ4mKqrHJZdFjDVykxJVLDIbK3COB4ok5TdHALl
	Q6zOgS2Zd1xrOUOLZq7clhCdiqAtpx+alFqV/ALN4CVZha37gBMI6ePnZazRr4CIUuuVvuMjLIl
	ttnOJO62rW5M58qNswtK5OZIT11sb/XDBQvq723mQxPlQNVmdY5S6iGvPIY93y00mENA1TENp2Y
	1S7RtSxErdkZVSm2zRkCDx0zvA8FdhkKp724XMcYuwmgvxtu4AUkdHKOgMgsr26589w9P2zeEjI
	sjtOiqmG51eDqYfoeGo8QL9JVTWMh9XtYE8/PIlfVxcGMXvxuLuzaPartj6So9NG03cBPL4T8rg
	LnIZRKVAQIb8Y2qbTn05VSlk7/texBNosovGvw8rix4UhhGh05lsWk6hTRNBm7yE9G4w==
X-Received: by 2002:a05:6512:2387:b0:59d:e5dc:8815 with SMTP id 2adb3069b0e04-59df3a496e4mr1399980e87.22.1769421622547;
        Mon, 26 Jan 2026 02:00:22 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:17d9:6808:3dfd:3f30? ([2a05:6e02:1041:c10:17d9:6808:3dfd:3f30])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59de492781fsm2485887e87.89.2026.01.26.02.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:00:21 -0800 (PST)
Message-ID: <6dc69230-b0d4-456f-8798-e771769f1fc9@linaro.org>
Date: Mon, 26 Jan 2026 11:00:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/armada-370-xp: Fix dead link to timer
 binding
To: Soham Metha <sohammetha01@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
References: <20251203195859.65835-1-sohammetha01@gmail.com>
 <49b45635-5f17-4cfc-8324-8c6f59fec082@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <49b45635-5f17-4cfc-8324-8c6f59fec082@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/26 21:05, Soham Metha wrote:
> 
> 
> On 04/12/25 01:28, Soham Metha wrote:
>> The old text binding 'marvell,armada-370-xp-timer.txt' was replaced by a
>> DT schema in commit '4334d83904fc'
>> ("dt-bindings: timer: Convert marvell,armada-370-timer to DT schema").
>>
>> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
>> ---
>> No functional changes.
>>
>>   drivers/clocksource/timer-armada-370-xp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clocksource/timer-armada-370-xp.c b/drivers/clocksource/timer-armada-370-xp.c
>> index 54284c1c0651..2221148e2de2 100644
>> --- a/drivers/clocksource/timer-armada-370-xp.c
>> +++ b/drivers/clocksource/timer-armada-370-xp.c
>> @@ -22,7 +22,7 @@
>>    *     doing otherwise leads to using a clocksource whose frequency varies
>>    *     when doing cpufreq frequency changes.
>>    *
>> - * See Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
>> + * See Documentation/devicetree/bindings/timer/marvell,armada-370-timer.yaml
>>    */
>>   
>>   #include <linux/init.h>
> 
> Hi,
> 
> Just a gentle ping on this documentation patch in case it was missed.
> Please let me know if any changes are needed.

It is picked-up already and in linux-next

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
