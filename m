Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC699416CEC
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  9 Jun 2026 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012168; cv=none; b=uPat3Y+bUcj637O60Qmls2hfUGqgNJszJAi5FTL89nWKjwZzTV3EiwbrcKVvZzoU2U4g2u77Vlpdg23aL78hMUQSocTZzCt2y9HN+uvn2h1kv0phDBUc1A1vkmu9dGHsRnhW7530/ZueGhF0o0UdsPXeWnrBCZN/voPa8Sz5RXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012168; c=relaxed/simple;
	bh=KQ00C/T0PtTvLOkQ9jgo4BMm9vvhzvMku6FHwA90IuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GCQw2QU/kl3BLa+H2Vg4ZyqWCaUeb4ZWXJnbq9wwOS6tVIXHw+cFFVgcKMpC+1MkrLSvTXCFmCUallV5qYvms6SoFkT2kH4XY2ATBI+WHvAeD2X8thXIegOp2ee6CjWGgJHBRUDc1DVzUjy4LwbVq+iUwt8auIMuNVWVXsBvcBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iofe4SCy; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iofe4SCy"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so3764951f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 09 Jun 2026 06:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781012165; x=1781616965; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nko1eeZPe9gacI4aqgmTtbFeb0B90PMqb5fo3nde8io=;
        b=Iofe4SCyhM5yfQNW7UN9NHiwZxFMmolcYhszM7Lbu19R3+c1yidIcN0h27Rs9wEAb8
         avruaZX1qT+S8JRwDUDd6ibyr9L0b+0USHXh3aMeSonKFbQli36viA7VTV4ARfIiGG5E
         kUz2tW+T4HGGoorBBQy3DakB378JBShPIhhRlFIwH4OSSI3PGHGtwK3FKg9h3CQvib2N
         yGehiLGdom4SKn2fggSYIiKgYO0wzqYi+L86KNkHCpQ5XlCj1A2gO91k1PBGd9ar/Oox
         DgHAf4je8kukH7qeuns++ZP6p8ZptItkNVq9rj2vXMIebGTGUjjwhF1iWKNY3BT8rD7h
         f4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012165; x=1781616965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nko1eeZPe9gacI4aqgmTtbFeb0B90PMqb5fo3nde8io=;
        b=PqbWLDNzh9fchGesaBhRevOWodLvedgJd0xsJ8yFiqVOf1yEIQU9YvWsSWL/tuihos
         8dULdsSXhgjauCE1obUQliWXfrbQvhzAxEciRlRmG9vzj+9/NWDhIfs8j4SFqCRaZYSE
         T9ttmloemhH8B639xy79THFyv7uXLAWmnJLDa9uvMIKmE9eIogJzBesIZnYxykaDsAx2
         fT69mh0UrpeN+aPQ74x8VSQ9jfkigiTtC9ptjNq8dBrpHctt/lAZeR74mcW74VEeWCwR
         nLvroEB92eYW06mupPes/zHSThiOWPoGussDj0CvQe1so9KjvQ2qaOyLtVgWNbtDraif
         d6ig==
X-Forwarded-Encrypted: i=1; AFNElJ+jjtE0lxqoAnnswr+aoznh/v+9SIy7zF6oTPuLxt7QJvZSJdlSE1404O1Ax978J0kMl1/1urRTaGA7oMb5jsHrKcBZ3A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4egffD5tUXErrRaHBO2sXddzDDVuvmkOBLMnXzEq5vVC6nM3B
	vJ1/n1RS7+BIIktczvkaIMyRDMvOp9tgj6Z0FfNufA6kVeAzpCltJF6z
X-Gm-Gg: Acq92OGgwgz51GTqCCO7UPgqZyHhBQrHhD4qj6cKSholLvGdf3AjXlwRNnuQPSSavff
	VGBCSkbqUh3fo58VXt9MIyuHkDSwwOQiocxN5WlbcmAZdZva82hJlK2g3OjgwKZ6yJejK/9agFD
	620+bu4LSuFUcdnjRkAxL3DLq1OyNAKor1iaMfA1Hfg/q7qulPcaUyinHrZTa6q1rYEoISH9dn7
	1c533akG/gtMYAm4Ey+ZanK/weXmI/JdH43V7VhjzoJLOfWfCYejaLWImW1eGie50Rqnjig72kb
	Izn4udG+QazIWTOx88Ddayf69bHJBjNjP3eW9eACW+ic7IBREgrC094zfkKUucekhQDj98GyJ7y
	kowyL0/636AEUpgGrj9ZCtpQMv5248mrDVaBogD58S3/wzd9Uw2ZsiMzU5kFfeXvAxm3/B+vRR1
	Vtf93w2grTzqwhjFZ+WMOnDmVqDZl0RMp49TycMJtb
X-Received: by 2002:a5d:544d:0:b0:460:1643:caf7 with SMTP id ffacd0b85a97d-460306467aemr22662161f8f.27.1781012164957;
        Tue, 09 Jun 2026 06:36:04 -0700 (PDT)
Received: from [192.168.37.44] ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm110805558f8f.27.2026.06.09.06.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:36:04 -0700 (PDT)
Message-ID: <dd8129c5-fe15-465e-8203-103be3d0c9c0@gmail.com>
Date: Tue, 9 Jun 2026 15:36:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] iio: tcs3472: implement wait time and sampling
 frequency
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, shuah@kernel.org, joshua.crofts1@gmail.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20260607112713.299968-1-aldocontelk@gmail.com>
 <aie2Y96Oylb5EEtM@ashevche-desk.local>
 <55020e69-ffe2-4d40-bdac-e6649693ebb7@gmail.com>
 <aigD0vmVJvKbtONg@ashevche-desk.local>
Content-Language: en-US
From: Aldo Conte <aldocontelk@gmail.com>
In-Reply-To: <aigD0vmVJvKbtONg@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/06/26 14:15, Andy Shevchenko wrote:
> On Tue, Jun 09, 2026 at 12:27:52PM +0200, Aldo Conte wrote:
> 
> ...
> 
>>>> +	cycle_us = div64_u64(PSEC_PER_SEC,
>>>> +			     (u64)val * USEC_PER_SEC + val2);
>>>
>>> I'm a bit puzzled why cycle has "us" suffix. We divide seconds by seconds...
>> Could it be ok if i place a comment here like:
>>
>> 	/*
>> 	 * cycle_us = 1 / freq, expressed in microseconds.
>> 	 * Numerator: 1 [s] = PSEC_PER_SEC [ps]
>> 	 * Denominator: freq [Hz] * USEC_PER_SEC + val2 [µHz] = freq in [µHz]
>> 	 * Result: ps / µHz = µs
>> 	 */
> 
> Yes, and replacing the USEC_PER_SEC by MICROHZ_PER_HZ.

ok!

> 
> ...
> 
>> 	/*
>> 	 * If the requested wait is so long that even WLONG cannot
>> 	 * cover it, wtime may still be negative. Saturate to 0,
>> 	 * which is the largest possible wait (256 * 28.8 ms = 7.37 s).
>> 	 */
> 
> This and other comments make total sense, with them it's much easier to read
> the code, thanks!

to you!
> 
> ...
> 
>> Moreover, I would like to take this opportunity to address the comments
>> raised on Sashiko:
>>
>> https://sashiko.dev/#/patchset/20260607112713.299968-1-aldocontelk%40gmail.com
>>
>> I propose the following changes.
>>
>> For the read and write event functions:
>>
>> The read path would become:
>>
>> case IIO_EV_INFO_PERIOD:
>> 		period = tcs3472_cycle_time_us(data) *
>> 			tcs3472_intr_pers[data->apers];
>> 		*val = period / USEC_PER_SEC;
>> 		*val2 = period % USEC_PER_SEC;
> 
> Again, use HZ-based multiplier, see above.

Here i do not understand why MICROHZ_PER_HZ is better.
In the previous case, we were indeed referring to the denominator of the 
calculation, which was actually a frequency, so MICROHZ_PER_HZ is indeed correct.
But in this case, we are calculating the integer and fractional parts of a 
period, so I think this would be fine.
Tell me where I’m going wrong.
> 
>> 		return IIO_VAL_INT_PLUS_MICRO;
>>
>> write becomes:
>>
>> case IIO_EV_INFO_PERIOD:{
>> 		unsigned int cycle_us;
>>
>> 		period = val * USEC_PER_SEC + val2;
> 
> And again, use HZ-based multiplier, see above.

as above...
> 
>> 		cycle_us = tcs3472_cycle_time_us(data);
> 
>> 		for (i = 1; i < ARRAY_SIZE(tcs3472_intr_pers) - 1; i++) {
>> 			if (period <= cycle_us * tcs3472_intr_pers[i])
>> 				break;
>> 		}
> 
> do {} while () seems better choice here (and do it in reverse order?).

Could you suggest the do {} while {} form, which seems better? Because I think 
it is already comprehensible.

> 
>> 		ret = i2c_smbus_write_byte_data(data->client, TCS3472_PERS, i);
>> 		if (ret)
>> 			return ret;
>>
>> 		data->apers = i;
>>
>> 		return 0;
>> 	}
>>
>> Regarding the oscillator tolerance, I suggest using:
>>
>> tries = 500
>>
>> Currently, it is set to 400, based on an 8-second interval divided into 20
>> ms steps. Considering a 20% margin, the total duration becomes approximately
>> 9.8 seconds, which corresponds to about 480 steps. Therefore, setting it to
>> 500 appears to be a reasonable and safe trade-off.
> 
> Agree.
> 

