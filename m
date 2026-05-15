Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF5530567E
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 May 2026 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860636; cv=none; b=S2fpK5xKE33Nmy7qts7/Wa+fm5jDcu58xAgD2JTlfjbZFyvKbknPlM5Ovnb2PDGLiopjHvY/rJjnUH7a1jK2hPvGslV8WzokSxwcF0g3LLxNQJwNNBZ+KiEQwyv7BTiITWg9OnXecL/DyjFp/DDrxDhGV1GFBJvWxo1wRlvGZMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860636; c=relaxed/simple;
	bh=IguJtA/166vSHwZlyrAaam1VOaDrr3Yd0bxakY+IMn8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AXHIk2sAp2YS24y81v7KvxW77j/O+2AEDuMDLEs0hFjSZLVDCDS/9dB8ODxoIkyzb/YozJGaPJMI8tIhrg5K0oDWaRAb/lTElPjSPVPrvZwXnF3Y0hx5T3xx1EWMAtzyW/260LUcBK77efHSLAXdpgZGvv+d+6/0eImAc1AuWL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADDyqp0C; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADDyqp0C"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so154867195e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 May 2026 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778860633; x=1779465433; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1uF5OyOIkN83/pI3J73aYzFyGQaV0SrzSZ1PhK/Byvg=;
        b=ADDyqp0CIgO20JxKlgz83QloKnfbHUQSq77/1LV8v/bzbXKRN63gCHNeMzgFmPfqsE
         IddSN/I9G5QklvznsXhBrH/yqZMO0HB5UZhVQp2IAUDM1Qs8EONGH1j6UL+zvCylaHcr
         1kqaojrNS6gr21uelXlZXEdLzJJUPN/1sfVi1zlV+267itrhBaZnKhuIvIK1VribQpBM
         Uxh+3AzjF/58Z3qzSlikuk9ua4EfPmVKWEVv5R8MQQOPvysb0+kf2XvVb5VdL8c0ZULe
         R3uGDVjn3YbPtp5E4p+KY3k5iNed+kPbv2+ChlgIoEN+XXWhUUKc9t7wZB+Na3+yAk77
         81wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778860633; x=1779465433;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1uF5OyOIkN83/pI3J73aYzFyGQaV0SrzSZ1PhK/Byvg=;
        b=PxFGLugBamN1MdBKODQnvdY0UYq/gINlzQX1XEaHB51eZC0cFPH7max8wQ4slxXARZ
         j6DqNlrDn5mYORpqwBwvjnvF4DMAd0cNX+vXTz0CIdimdDspPOyvfSoNAj1Yk+vneavP
         eOgOdQW8vM65nCbmaGsyQBgtHhYYjHDAhlweXsJwYseYoU2pgj8M00k2coWLyFI6c0eo
         gmUpR6CQ/ULTSnWS2kKIcaUr2ZeV3NTvPFHxz5Cy1aB/PfFxCrpFJ/mDOn9LEuZfSqhQ
         oKc/DVET7MmR4ZO4PgbFYz+5dJtJOhtQsOzDkFErnn91zG1+vKMMW4ZtIWIUpJwU0RwC
         /yZw==
X-Forwarded-Encrypted: i=1; AFNElJ+u4//hdE9HaVrHgyR3u0AU79gwQ7qOJog0hDOAXYdIzEQk8bMLMTjV1zTWkjkJaWP6imGHlPHl1uyRkcezP5rIFax0YQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlr6WMWKcIdIegi9Bxg42aRfMGfrWCCFXLhRTKNFCfNdVK8h2U
	Sij2t/j246fuqNjdBQhi9QRdOxdPC2kypc0EeFx8Gi/dIWEeb+MyZpv2
X-Gm-Gg: Acq92OGSFZn5MYVkSv4mBHssptMlaovTY9WKB1YDgidkApWnw2Ay0+Ah6vKqPQTXQqR
	4wezM9+zdbZz9KYESZMfpbEa7Oeu0h0Y2RTWGHEliC6dAOgqYIaInmB/6RLhEOBZSVUQeQRWfuA
	ukFFyKq43eWCSfR4QAhFUnsHT4zd8USaj0vDx3oED+ZN29a2r4wb1UO5fFe/R9yjAA3uoqK7N3i
	mOiC0DKJuAnZbrXNcl3kkHy3Nw8nTatfRoeyjaKgm0zfxO0XIdPIDMwwc0f8T4JmSEvAkVNgf7b
	H572AWdZBo9B0f3WnoW4vcMDxq8iJms/YeLz1KvJKlAYkWjXM95qU1+5/Gpj7chdEy6WZIG8dAh
	1VJMwf42R47pUu6xUr9dPvwdF7738ujAyiMUdEEGSQTsml7nAlpD+iVjpgeAT34ujSqWBapWrns
	8tjRN4n7oTUff5tNNppbVzYr+VD4fVMw==
X-Received: by 2002:a05:600c:3b28:b0:48f:d835:e0e1 with SMTP id 5b1f17b1804b1-48fe632678amr64882635e9.20.1778860632725;
        Fri, 15 May 2026 08:57:12 -0700 (PDT)
Received: from [192.168.37.44] ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe60fc0sm20287995e9.21.2026.05.15.08.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 08:57:12 -0700 (PDT)
Message-ID: <0a0d0931-f1a3-4ee0-99fc-91d379490838@gmail.com>
Date: Fri, 15 May 2026 17:57:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Aldo Conte <aldocontelk@gmail.com>
Subject: Re: [PATCH v2 4/5] iio: light: tcs3472: implement wait time and
 sampling frequency
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, shuah@kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20260512223215.25596-1-aldocontelk@gmail.com>
 <20260512223215.25596-5-aldocontelk@gmail.com>
 <agRdzneWb2RIidIp@ashevche-desk.local>
Content-Language: en-US
In-Reply-To: <agRdzneWb2RIidIp@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/05/26 13:17, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 12:32:14AM +0200, Aldo Conte wrote:
>> The TCS3472 has a wait state controlled by the WEN bit in the ENABLE
>> register and the WAIT register, with an additional WLONG bit in CONFIG
>> that if set multiplies the wait step by 12. The driver previously
>> defined TCS3472_WTIME but never used it leaving the TODO comment on
>> the top of the source file.
>>
>> Implement control of the wait time through IIO_CHAN_INFO_SAMP_FREQ:
>>
>>    - Reading sampling_frequency returns the chip's current cycle time,
>>      computed as the sum of ATIME, the fixed RGBC initialization time
>>      and the wait time (which depends on WEN and WLONG).
>>
>>    - Writing sampling_frequency programs WTIME so that the resulting
>>      cycle period approximates the requested frequency. If the
>>      requested frequency cannot be reached with any
>>      non-zero wait time, WEN is disabled and the chip runs
>>      back-to-back conversions at the maximum rate allowed by ATIME.
>>      If the requested period exceeds the maximum WTIME range, WLONG
>>      is enabled to extend the wait step from 2.4 ms to 28.8 ms.
>>
>>    - The user's last requested frequency is stored in the driver's
>>      private data so that subsequent changes to integration_time
>>      recompute WTIME and preserve the requested sampling rate as
>>      closely as possible.
>>
>> Add TCS3472_ENABLE_WEN, TCS3472_ENABLE_RUN and TCS3472_CONFIG_WLONG
>> bit definitions. TCS3472_ENABLE_RUN bundles the bits
>> (AEN | PON | WEN) that are simultaneously set when the chip is in
>> running state and cleared during powerdown, and is used by
>> tcs3472_probe(), tcs3472_powerdown() and tcs3472_resume().
>>
>> Remove the "TODO: wait time" comment at the top of the file.
> 
>> Suggested-by: Andy Shevchenko <andy@kernel.org>
> 
> Inappropriate tag.
> You must not put tags on your own, if in doubt, ask first!
> 
> ...
> 
>> +#define TCS3472_ENABLE_RUN (TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON | \
>> +			    TCS3472_ENABLE_WEN)
> 
> Better style is
> 
> #define TCS3472_ENABLE_RUN						\
> 	(TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON | TCS3472_ENABLE_WEN)
> 
> ...
> 
>> +	cycle_us = div_u64((u64)PSEC_PER_SEC,
>> +			   (u64)val * USEC_PER_SEC + val2);
> 
> First of all, it's one line. Second, the divisor for this function is 32-bit.
> And at last the castings are not needed. I think I already told these...

In theory, val and val2 could have a value of INT_MAX. Therefore, the 
calculation INT_MAX * USEC_PER_SEC + INT_MAX results in a value of 
2,147,483,861,748,364,700, which can only be stored in 64 bits. This is, 
of course, an extremely rare case in which userspace writes an 
impossible frequency that is simply too high.
Therefore, div64_u64() should be used instead of div_u64().
Therefore, the following code would be required:

cycle_us = div64_u64(PSEC_PER_SEC, val * USEC_PER_SEC + val2);



> ...
> 
>> +	wtime = 256 - DIV_ROUND_CLOSEST_ULL(wait_us, 2400);
>> +	if (wtime < 0) {
>> +		wlong = true;
>> +		wtime = 256 - DIV_ROUND_CLOSEST_ULL(wait_us, 28800);
>> +	}
> 
> Why 64-bit divisions? Do you expect the wait_us be outside INT_MIN/INT_MAX range?
> This will need a comment and/or dropping the 64-bit arithmetics.

cycle_us_MIN is reached when (u64)val * USEC_PER_SEC + val2 is MAX and 
so is INT_MAX * USEC_PER_SEC + INT_MAX. Assuming this, the division 
would be 10⁶ / (INT_MAX * USEC_PER_SEC + INT_MAX) = 0.000465661, so 0.

Therefore, cycle_us_MIN would equal 0 and cycle_us_MAX would equal 
PSEC_PER_SEC/1, i.e. 10⁶; consequently, wait_us_MIN would equal −614400:

wait_us_min = 0−2400−612000= −614400

and wait_us_MAX would equal 999999995200:

wait_us_MAX = 1000000000000 −2400−2400 = 999999995200

This means that wait_us needs to be s64 if i am not wrong.
> 
>> +	wtime = clamp(wtime, 0, 255);
> 
> ...
> 
>> +	ret = i2c_smbus_write_byte_data(data->client, TCS3472_WTIME, wtime);
>> +	if (ret < 0)
> 
> What's the meaning of positive returned values? I think this function never
> does that. If I'm right, drop ' < 0' parts in all similar cases.
The i2c_smbus_write_byte_data() function returns a value of 0 on success 
and a value less than 0 in the event of an error. I do not understand 
this comment. Could you please explain it to me in more detail?

> 
>> +		return ret;
> 
> ...
> 
>> +		*val = USEC_PER_SEC / cycle_us;
>> +		*val2 = div_u64((u64)(USEC_PER_SEC % cycle_us) * USEC_PER_SEC,
>> +				cycle_us);
> 
> Is this even correct? We take modulo of cycle_us to get under the MICRO range,
> then multiply to MICRO (seconds) and divide by full cycle_us. I'm lost here.


> 
> ...
> 
>> +	cycle_us = tcs3472_cycle_time_us(data);
>> +	data->target_freq_hz = USEC_PER_SEC / cycle_us;
>> +	data->target_freq_uhz = div_u64((u64)(USEC_PER_SEC % cycle_us) *
>> +					USEC_PER_SEC, cycle_us);
> 
> Okay, this might help with the above... Can you deduplicate this division to
> a helper with a comment that explains the calculations behind?
> 
Something like this could be ok?

/*
  * Convert cycle time in microseconds to frequency in Hz and microhertz.
  *
  * Given:
  *   cycle_us = T, i.e. 1 cycle lasts T microseconds
  *
  * The frequency is:
  *   f = 10^6 / T    [Hz]
  *
  * We split it as:
  *   val = floor(10^6 / T)
  *   val2 = (10^6 mod T) * 10^6 / T   [microhertz]
  *
  * I.E.:
  *   val = 10^6 / T          (integer division)
  *   val2 = (10^6 % T) * 10^6 / T   (fraction scaled to microhertz)
  */
static void
us_cycle_to_freq_hz(int cycle_us, int *val, int *val2)
{
         *val = USEC_PER_SEC / cycle_us;
         *val2 = div_u64((u64)(USEC_PER_SEC % cycle_us) * USEC_PER_SEC,
                         cycle_us);
}


thank you,

Aldo
