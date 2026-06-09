Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69913EFFC1
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  9 Jun 2026 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000877; cv=none; b=D5retXXswVLbuauaQwvBeQ3uWRCP1vfg2Tv5ZaiONTWKnYyD8xqf8OsuX7LKVyVUZoZuFxxEoudg5rPT5YKYVK4Ue3hu0bLhXMzzHSlFtLSwXc7yKz3svgY5VkvnGdTRMd72G5c5A8aDQrD2Nn/lhhrhKy+Ox0Ub4DPFJBq4PY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000877; c=relaxed/simple;
	bh=qqIJGaelpjCjAoGfpKtBIlbZrM/CcXnrhKiMbcgVp6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RxUDpw8Ev4/MEOSRmID6bpcRNHTrDbZPabzl4h+JNV73I8ZBcnLzRC6ZBirE2vhw06lggv2OT8NJhif0eDJoeZ1Yogg6B7Vvvawcx/Bd9t7Ct/vN9blYp6TRCAzQkA34Hh7YerI+Qadj6xtYDvAKBQdekBcr2G/OsquzOiaxAo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vb0QPgZv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vb0QPgZv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4905529b933so57827435e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 09 Jun 2026 03:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781000874; x=1781605674; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYkVB+VTXksJERZstjatMjWyHHCh3+OMcrv2hxaXb3w=;
        b=Vb0QPgZvkU02MgoZI2Orv0p0XYiL3ejtOpgIvzttgbWg9XX/lVuoJHpe2KVRq12v6r
         jCI/q2ZrnucSBp4mDyk5iEMLeH1fmi2lZhZpkVpH83nUG4Naq3jsTdlROyEcwfmEDe7J
         6YSJTVKMrA2pRajBWkT/7LUJJ5rfYwkY42V78jE3AokjkBorawVMpWs7Pz4+LGc+kOqk
         gQeszViRkJeJsybCap9PRZNyRsVQAtqoQI5D7d6BGVPdjH/qo/5iKB4VL9UHKR2v+sJp
         RfQY81DyJL24yRikGQKAKVN0thP66UHlk40WHGJYVpTl88AYab221s1E2/riqfSbpYcM
         iz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000874; x=1781605674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYkVB+VTXksJERZstjatMjWyHHCh3+OMcrv2hxaXb3w=;
        b=Ip1P6Hr914dTcMqEcj6GI2X+gr8wxnuz+K974nusMT5IzUD/Go0eF7inxTkJqtQ7lT
         jrt8ajrlfgGMcOWC1WMiSYihR6tYfNJ/zUczVkOauICcZNI0zFn4Q9DNTeaWzXfK93gx
         6UVYXr67LTAXlFz6u+bwVwEWvJUfMXRiwe6eCytvLYFwGrKIGbC3mErXO3zDSu37lgVa
         ZwgRJ7ba/PQKm4SBxAQdc54gNe/1KOtoFu/YOAs+9fyVUOEEGo15DaF0d12h1p4wz+oK
         Xm7f5/RH5zDNVtYDXHdvWR9GAJYmzSc4nn/nwCLnjFh+HVNYB4NwzQyKvf+W+z++/wJt
         shdA==
X-Forwarded-Encrypted: i=1; AFNElJ9LEhZJnq+XK6W0Tn/OOhsiv32UPGDZxQkwU7Yn6rl9YUGQtHkdGtotI4gBXaT7U45qODufasqp32LL5mmC22ug0zI2Og==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBFbeXsX7n2x55omekiRfm+YcXnTQ9aAyJ30J0w5IvUVwOqeTl
	OcqO8uBAitxYIAh8H/VsCiTnONkeZrKuPIuC+yjpJ4s4+t8VaVkATH8e
X-Gm-Gg: Acq92OEp79r2jU4RVUoMCuhjlehquoxj7Bo6U15DuychSDG6+KpyD+Z96TCt9G1JKiJ
	7gQsa06IoDrWG1024m/qw9G5xYBr0I77j/490Zqs7mskpLXVI/QslZQbFkJtn2BqFZdrW4J9hiy
	A7k+BHJC4IQgKJTbjvtZN1ZAYIwbhi1PGJmHK4KQLiWS9egM3F8e3VFjcM6liM2f5aRVWgMc4gh
	xqBxYOo9MfAZc3KRtG0MP24vT/9Wcw6Dct/OmDKzN5cdxBudERTrdQaxIbhfvikkZ97PD+zov+6
	MhAG7OEDI1iWDBmJ2Sv5inBc8y0JBdZB1uHn4FLGtLXg7Ti6p6+l80cwH5NqHqDQXyTd3AeTxuN
	NtyFdHKFTt/gNNHn5nI3UZsPjIVDGhCFJ9AvQYTaX40lEtlzmewz2eP1k988wR6fTocmGHovkWf
	i5bA+l6hkSVodaN9ej7mTSfohTO5uUT6TrGx9EvP6d
X-Received: by 2002:a05:600c:5248:b0:48f:d612:3c4a with SMTP id 5b1f17b1804b1-490c25604demr318499125e9.1.1781000873937;
        Tue, 09 Jun 2026 03:27:53 -0700 (PDT)
Received: from [192.168.37.44] ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc140sm560788485e9.9.2026.06.09.03.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 03:27:53 -0700 (PDT)
Message-ID: <55020e69-ffe2-4d40-bdac-e6649693ebb7@gmail.com>
Date: Tue, 9 Jun 2026 12:27:52 +0200
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
Content-Language: en-US
From: Aldo Conte <aldocontelk@gmail.com>
In-Reply-To: <aie2Y96Oylb5EEtM@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>> +static int __tcs3472_set_sampling_freq(struct tcs3472_data *data,
>> +				       int val, int val2)
>> +{
>> +	unsigned int atime_us;
>> +	unsigned int init_us = 2400;
>> +	u64 cycle_us;
>> +	s64 wait_us;
>> +	int wtime;
>> +	bool wlong = false;
>> +	u8 config;
>> +	int ret;
>> +
>> +	if (val < 0 || val2 < 0 || (val == 0 && val2 == 0))
>> +		return -EINVAL;
>> +
>> +	atime_us = (256 - data->atime) * 2400;
>> +	cycle_us = div64_u64(PSEC_PER_SEC,
>> +			     (u64)val * USEC_PER_SEC + val2);
> 
> I'm a bit puzzled why cycle has "us" suffix. We divide seconds by seconds...
Could it be ok if i place a comment here like:

	/*
	 * cycle_us = 1 / freq, expressed in microseconds.
	 * Numerator: 1 [s] = PSEC_PER_SEC [ps]
	 * Denominator: freq [Hz] * USEC_PER_SEC + val2 [µHz] = freq in [µHz]
	 * Result: ps / µHz = µs
	 */

> 
>> +
> 
> Unneeded blank line.

ok i will fix it.
>> +	/*
>> +	 * Wait state is needed: make sure WEN is active before programming
>> +	 * WTIME (and possibly WLONG).
>> +	 */
>> +	if (!(data->enable & TCS3472_ENABLE_WEN)) {
>> +		u8 enable = data->enable | TCS3472_ENABLE_WEN;
>> +
>> +		ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
>> +						enable);
>> +		if (ret)
>> +			return ret;
>> +
>> +		data->enable = enable;
>> +	}
>> +
>> +	wtime = 256 - DIV_ROUND_CLOSEST_ULL(wait_us, 2400);
>> +	if (wtime < 0) {
ok here i can write a comment:
		/*
		 * If wait_us is too high (so the requested frequency is too
		 * low), the resulting wait exceeds what WTIME can represent
		 * (max 614 ms without WLONG). Enable WLONG, whose step is 12x
		 * longer (28.8 ms instead of 2.4 ms), and recompute.
		 */

>> +		wlong = true;
>> +		wtime = 256 - DIV_ROUND_CLOSEST_ULL(wait_us, 28800);
>> +	}
>> +	wtime = clamp(wtime, 0, 255);
> 
> Seems like wtime calculation is not used in the below conditional.
> 
>> +	if (wlong != data->wlong) {
>> +		ret = i2c_smbus_read_byte_data(data->client, TCS3472_CONFIG);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		config = ret;
>> +		if (wlong)
>> +			config |= TCS3472_CONFIG_WLONG;
>> +		else
>> +			config &= ~TCS3472_CONFIG_WLONG;
>> +
>> +		ret = i2c_smbus_write_byte_data(data->client, TCS3472_CONFIG,
>> +						config);
>> +		if (ret)
>> +			return ret;
>> +
>> +		data->wlong = wlong;
>> +	}
> 
> Not sure, but we can move the
> 
> 	wtime = clamp(wtime, 0, 255);
> 
> from the above to be here. It might also need a comment why wtime can be
> negative and why we move that to 0.

Ok for me to move clamp here. I would write another comment here to justify the 
clamp

	/*
	 * If the requested wait is so long that even WLONG cannot
	 * cover it, wtime may still be negative. Saturate to 0,
	 * which is the largest possible wait (256 * 28.8 ms = 7.37 s).
	 */
	wtime = clamp(wtime, 0, 255);
	ret = i2c_smbus_write_byte_data(data->client, TCS3472_WTIME, wtime);
	if (ret)
		return ret;

> 
>> +	ret = i2c_smbus_write_byte_data(data->client, TCS3472_WTIME, wtime);
>> +	if (ret)
>> +		return ret;
>> +
>> +	data->wtime = wtime;
>> +	data->target_freq_hz = val;
>> +	data->target_freq_uhz = val2;
>> +
>> +	return 0;
>> +}
> 
> ...
> 
>> +			if (val2 != (256 - i) * 2400)
> 
> The same is used to calculate atime_us above. Can this be a helper
> with a good name?

ok i could use
#define TCS3472_ATIME_TO_US(atime) (((256) - (atime)) * 2400)


>> +				continue;
> 


Moreover, I would like to take this opportunity to address the comments raised 
on Sashiko:

https://sashiko.dev/#/patchset/20260607112713.299968-1-aldocontelk%40gmail.com

I propose the following changes.

For the read and write event functions:

The read path would become:

case IIO_EV_INFO_PERIOD:
		period = tcs3472_cycle_time_us(data) *
			tcs3472_intr_pers[data->apers];
		*val = period / USEC_PER_SEC;
		*val2 = period % USEC_PER_SEC;
		return IIO_VAL_INT_PLUS_MICRO;

write becomes:

case IIO_EV_INFO_PERIOD:{
		unsigned int cycle_us;

		period = val * USEC_PER_SEC + val2;
		cycle_us = tcs3472_cycle_time_us(data);
		for (i = 1; i < ARRAY_SIZE(tcs3472_intr_pers) - 1; i++) {
			if (period <= cycle_us * tcs3472_intr_pers[i])
				break;
		}
		ret = i2c_smbus_write_byte_data(data->client, TCS3472_PERS, i);
		if (ret)
			return ret;

		data->apers = i;

		return 0;
	}


Regarding the oscillator tolerance, I suggest using:

tries = 500

Currently, it is set to 400, based on an 8-second interval divided into 20 ms 
steps. Considering a 20% margin, the total duration becomes approximately 9.8 
seconds, which corresponds to about 480 steps. Therefore, setting it to 500 
appears to be a reasonable and safe trade-off.
