Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660D74779B3
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 May 2026 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081749; cv=none; b=vBGPFNlu9wPVAN+3/IE5Xd/DLIaeZTQR7jCKAhHDmk6pPrSX/Gr8gtHQAr1eHD46T/7kmtJFFV7L2F37tiZbIJ8WkexDvlNDw9XXWqyR+qTZ4r7V5qbhpNGfhwFdyxHwaphLaWtFXSBRvJeFa6zsIV/k0VZ54DWRA5YNblmK2PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081749; c=relaxed/simple;
	bh=uerMeSSQ3acxmOZMeTOC3qPnNJjEqmCZDN82K86gjYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDrxqkFSC188V0nZzLbQFSA9j15Ifs3M3gPCOcILkyN51EWd/JQFtO69yyCxY9Jmwij6kEluRzwjbvXtWL6GQ3qB6ULzEGuigMR2lsKV8etsrm3WMBFRBJJkjlln53sVn8bfmTlH0L2J7+m/M44fOKE59ENLb8IgXnXG4VBgDlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r3xosj2V; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3xosj2V"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67c3cb1433cso6617985a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 May 2026 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778081744; x=1778686544; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Nckv/LuldqfEBJSIft5ijwXQ8LBQOLvQF7H6CHlTT8=;
        b=r3xosj2V0lADZ3Lx5p+aMyWat9FaX6evAETxg4gHmjc4UFZiOVSkq8lMReFRnmZ0uk
         Co3mOVgiC/Czu0dI+L0Prar8tZAygq18cmy2zLOww70CizTESBaAMxYNHWZ6OcxSEnix
         1ZW9hioGj1TKUB4U/QErLq2reZqFGFvCCr5Ry/U/oMomaZ4yrg9DFpmF1n06EySTOoIJ
         8YbH/bw+8W0wuV1irZ98AQVFfKa2gCjVz3oI0rg5CX+fvz82KcsEXzUmzmzmh0MwdvHL
         fHQxRTanaFi6WkSrlFQkH7WLBwwBcvnb0HMHDSk7TmZHfGggvykVnS5NUqe1dFYPoYYR
         6W5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081744; x=1778686544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Nckv/LuldqfEBJSIft5ijwXQ8LBQOLvQF7H6CHlTT8=;
        b=ErBC1sswYeRQLn++pA5V+U+LqssYdkPMijYNVn05/w7hRb9bYOaGycEYYgaWRKU8wL
         d/Y+codK0GRxlgsFUw+5KbjWhulFKZAmbAKtfZJWhNuKR2NMPFZZ8Olw16DwALl1FcYy
         E8RnzMqgiQw0x0iVRErknol84PQITSnZWohg05X8A2vVdrTmZ/4wUwxRibuNWbjf5P1d
         7BPX58h6B/t0JAgM5He0nedXoLw9N3bNbSNb7vvl9MkQXHSNu4LSV8jwlfkb9GFt9+H6
         jKdZlO4Fc/CgDUrmllxwc0OsdvqVe8TG00NUANke4xsCZZJ4eB7gMPqzXOr0ZQgePbHD
         VW4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/EYLxbyds7K7mwgH706t6LHJsZ38VWW9y66K0bLuVQMrmEBBhzSFUflYdvrbmULpE8SSL7ZD3FRp7rd6s+gPsigOm0Wg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyB1AwLCxVnvMQmlqNf0C2eTno765KZIuhCSbswdwQevWLf7tNz
	ZirQ9cMupIL5+99tYIhzO/YZyLa/6KhK3gaDiHmsR8/VPVS/On9ct12o
X-Gm-Gg: AeBDietlsm7+jBkh4i/PnQ920lGDks4mH8mNaj0k97PwZkzI9v8peNkCrCqKbLYllTi
	PehKS4oNcUOO18XcZk07zs7fWe3Igb1gE0CsJ8Yfmlf/L49Ye2MJcfIMLDxUdsHlcu9ssEgRUFY
	uTJ0pUGyrq/+SyoGqrIAH8kyMyMJTUYnkLWagQshU7KrzTwHgnzO2LHsIPSwdFiJTtfRZRbfhcc
	+PvEhAFM7GnPKi/m1x4U5PlNRNjj7nUeiYwiZq+Peai461gQs+m4LYayDiG82KvnJNH4qEeQT+0
	BzK5cY3ZsJ0cFnfhuMRPqS2kT0Fp8Lw3i2bmyU/Q4Oe1zJ+K1eOZiixwOZi7CI00IOxVLiFLnDD
	w7xgWcttGaqxbwsHUG8qgbHYQYBcT4jaTXW4lmyYhhrjngE6wx6T84h93NP4gPCiRPGfldwONzC
	Zk/KoksHsrfxIBytBFJwPnynJC8CylgJb6rdPqT7r1
X-Received: by 2002:a17:907:3e0c:b0:bc6:1550:ec56 with SMTP id a640c23a62f3a-bc61550ed0amr134372466b.39.1778081743850;
        Wed, 06 May 2026 08:35:43 -0700 (PDT)
Received: from [192.168.37.44] ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55f00d170sm96974666b.49.2026.05.06.08.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:35:43 -0700 (PDT)
Message-ID: <16c08754-840f-440e-a252-b14172393394@gmail.com>
Date: Wed, 6 May 2026 17:35:42 +0200
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
Hi Andy,

Thanks a lot for the detailed review. I'll address all the points in v2.

Regarding the series structure, I need to clarify the correct order:
1) Guard (mutex) conversion
2) Header sorting
3) Devm conversion (with the new TCS3472_Powerdown using Guard (mutex) 
directly)
4) Wait time implementation
Would this be OK?

Aldo
