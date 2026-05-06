Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F2830BF6B
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 May 2026 12:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069970; cv=none; b=dcN9mTI9FofbOcRhJVGFCImnfMrVGT7pr+FopJQBroy7dlAXQGXjy9dhsEzbjOqF2xds6eFuJ45MmTqqBBsoWSnEXLgLqy4bDGpqSoebmLBK/a2ru7ovC/qNGJ2+vv27D9K4ela3rTjyQKKd4BGsNa83Z7h1NWoZ/Ixy2RqzLV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069970; c=relaxed/simple;
	bh=WEYp9Pc0nIkcN+xiiA1sakOUxmN97k9d9UtFeOmdugw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BY786Q6sHz1/NbTdLYdSpe3V3kl+hdDJ+zS0VzObENzjfs9kvhA5/QS8vtPlgRCkGAOap+b8S/8+C+Oe07KE2H+IIYhqcOEHDaoH1XP4gN5d6Mh7Q0ZG3cLAXAkCCorZMcAK/uOpLNnRhObRuUs42vXLVe7vYtCjOvA52VoX0mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSd9s6tw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSd9s6tw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-449de065cb3so4021913f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 May 2026 05:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778069967; x=1778674767; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ky0aM7E+PpEfVJyxjQiWZoXt7cbpeu7WIfgg1hOUvWE=;
        b=CSd9s6twkEels2h6lJTVsjs+RYZtUZ5+Hat4sI8tTa6+T4r0hCuY2z/QGAy7/4DdxE
         VDnMkW4EkRuubNNlYWpaXFOOd7jLmxRk1/lo+UKAZHzJxIW/S6DuSbLWNo26yZGNoqSq
         Fw/KbaqfMQR7aOWH3wRG+YydykQtqv/8zixZl1BVjL3u+vESqwwT4RHaC7hIkUUVsEfa
         F6igH8nGq82Spyons9vJThfgylQoCPWV0Nl3C0hUjx1rktC+/BxJwMcGB7VdnkisT7pv
         LD5UunSfEzmHfKqAR7O/ETWowUFxC/99JbCoAGnHLgplLt4BoumZ3+dc9mQtsa784hsu
         CAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778069967; x=1778674767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ky0aM7E+PpEfVJyxjQiWZoXt7cbpeu7WIfgg1hOUvWE=;
        b=MxChxMl/4JJZWZU0W8ettrsLdFoRObP0Fb1AYcbGwbSKmOlWuG2k+df09zxVdjOgl7
         Iuk1y8iHnUpzbaV1jRq4Xfx3h09z1+Y8aAugUTrij/JRGUZq/3E35iDV1l3OK3VQvaop
         w+j55pBNVjQORkM5JLzWlzUWIuY9KWo3Vc+fClOSfSBr2TlnVo6DPwh/A9ktoUoVeXb2
         1CVjzJJ9r/jlQy5cUWD51R1t15aBqshjX8SB/cvfGbTszfeQL8vULsSssesPG5a4fxTQ
         1Zq6Z70Gz6mdXBNbTZUWiKwCEHvgdbSY3q/dlPBrO9wBI899B8Bn7a0Ot0gRSmbcNJr3
         3+iA==
X-Forwarded-Encrypted: i=1; AFNElJ8AMviDPyAnN54XLO1NmKAjHDBa1RNf4OpqaMvOZqQqcx7je4o3SqUVvQn/FZ2OAmr0VfpoVR4ZIsKeWsmJXQeNW1RPOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaE1GspQfo37noHS07U8vBos7v+5qsZZ6HgwdFcyHsVUE6p1Vs
	Frke6TPeDD7PUFYSkCK+2e3dKjKaguAlQFXKyJJxKYFdAi5PCo7231jR
X-Gm-Gg: AeBDiesJpMmSrEhTbO3vQpFUN1z0kUOKq+FtS2NeWbpIXM5tZWYpY/Kv8HWXPEm0m7B
	eFhdj9uDtUMWoL8YaQ86Q26/dHQF+QcRHO0/ugfMxbmLoiyIDBUJYzBuFY4WZY/k2XwqjPP8/z0
	6VTpASomZsXGTKqztCtqUzAQ8yCVEwXXzQNyWa2iPIH4GkvnjLCyzKFRJC/5xupqNbq/adsdLU7
	L1MOSdaEWMCzJJNsUxVAW5ZmtwPHCWsk6FEgbryBCC5aCOk4g4qUpQeVQcu7nB9oZiHtVA0keGn
	JvgB57OiwNzB1oWnY8Ct5e6ATdtPZH8ADAyMXkPpDZBsIQCnpE11xYenXzR7FMPE+wR30buD22F
	R0aagA6++tmh3q66qCfwh15qcg/SqHoxx2d1ZYhdeBDcF+/3aOlbFGnJVveka7GOUfRCWMmvhtr
	l6GACUZuKNc5Pq8KIeXInhz4UhCxSDlRdnFAF0s6vU
X-Received: by 2002:a5d:5f90:0:b0:44a:8c10:40dc with SMTP id ffacd0b85a97d-4515b9f3c74mr5875556f8f.18.1778069966515;
        Wed, 06 May 2026 05:19:26 -0700 (PDT)
Received: from [192.168.37.44] ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052483166sm12046902f8f.7.2026.05.06.05.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:19:26 -0700 (PDT)
Message-ID: <1c02501f-c9f5-4b94-bc9e-a6f1f07209f7@gmail.com>
Date: Wed, 6 May 2026 14:19:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] iio: light: tcs3472: devm conversion, wait time,
 locking cleanup
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, shuah@kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20260506094311.222500-1-aldocontelk@gmail.com>
 <afsWI3MKoWZS4mL3@ashevche-desk.local>
Content-Language: en-US
From: Aldo Conte <aldocontelk@gmail.com>
In-Reply-To: <afsWI3MKoWZS4mL3@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/26 12:21, Andy Shevchenko wrote:
> On Wed, May 06, 2026 at 11:43:08AM +0200, Aldo Conte wrote:
>> This series of changes modernizes the tcs3472 driver by completing the
>> devm conversion and updating the locking style to use an automatic
>> guard (mutex). Furthermore, it implement control of the WAIT state,
>> resolving a TODO.
>>
>> Patch1: Converts the driver to use device-managed resource allocation.
>> This removes the need for an explicit remove() callback, since cleanup
>> is now handled automatically. It also adds a new function called
>> tcs3472_powerdown_action() that powers down the chip when the driver is
>> unloaded, removed or when probe fails after the chip has been enabled.
>>
>> Patch2: adds support for the wait time resolving the old TODO comment.
>> The user can control the WTIME indirectly by writing to the
>> sampling_frequency attribute. Changing the sampling
>> frequency attribute results in a change to the wtime while preserving
>> the current integration time.
>> Similarly, if the user has previously set a sampling frequency and
>> then changes the integration time, the driver re-computes WTIME so the
>> previous frequency is preserved. The patch also handles the deactivation
>> of wtime when the requested frequency is very high, as well as the
>> extension of wtime to its maximum values (by enabling the use of WLONG)
>> when the requested frequency is very low.
>>
>> Patch3: converts the remaining mutex_lock()/mutex_unlock() pairs to
>> guard(mutex).
>>
>> All patches have been tested on a Raspberry Pi 3B with a TCS3472
>> connected to I2C-1 at address 0x29. Sampling frequency and integration
>> time changes have been exercised checking the value of WTIME and
>> consequently WEN and WLONG. Raw RGBC reads, calibscale, integration_time
>> and threshold events continue to work as before.
> 
> Thanks for contribution, unfortunately this series needs much more work
> and more preparatory patches as well. I have reviewed the current series.
> Please, follow and address (or comment why it can't be done as suggested).
> 

Thank you for your review.
These mistakes are undoubtedly due to my still limited experience. I 
will start working on them right away.

Best regards,
Aldo Conte
