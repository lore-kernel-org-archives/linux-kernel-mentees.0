Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C153B22ACE7
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Apr 2025 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304091; cv=none; b=gXA7tMH7dPu68TLwzRlwyTEFJRbgUR5pR2Gimo4Xv7jDiet8AVidKvtXcBouaSDHZEFdeWVunldTd+gqY4h2lh3GNrWOnnB1mLAC88NgGN1/HmgO3pvRPc+onKFT0mFBv5YtAcm6s60hqFUQtzbSt3wpj6c8GiZT71gJMfu02r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304091; c=relaxed/simple;
	bh=b+b5f49WuUM/GVoPNhs0qQ519kURG3dfG9PkIjCLyIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsNPFI/vAKFumiFNfR1d9Drc4AJe2L3Av6lkwJgaW4CsRdhHfX8XIQrBFAQlAK+QZ3iQbcx+nDMOJqacu40FTwSX1WA2eT2SSUkJs/6vD4wpgr5qgfZSvZe0B/mIEC7sN4xabubVWkJxCeWhYK6MR/Gtw0ffZM4jZcKqhgAYreI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fyokxpUY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fyokxpUY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so2845309f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 23:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745304087; x=1745908887; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/pURcEhBEHdxpYhnWEBaI44DGcypxp9nMdkY7Iw/QyY=;
        b=fyokxpUY9Am09zUcwxtpCROj1olu3eTN0Fcz7ZEn3HE3D9EUiFE945BdC/h1UD0gqQ
         97zdqx4SxTVqmjihXVAKkz0ibxZ4+PXZOG4AKFYONtEkBAQL/tbV7nMR6428msvsmkjM
         XOXjBB/ewxQobx/795WCAztpcnl2ISfgVn6UJ2p1Fj080E50ZgrOJu/pjhBdTkuU1UG4
         015ZqbQYpNqP/KI9qIgc8L2taINovr0JUSZlWYDfyUlSMnStG0YMv8sFidzZDkCbce1I
         H+XUE2NZedFwjPl4y2UHAKIusxyj4sNcB/4za5FPM8+oxm9rY5USfrx60gBPhZd6HvKi
         nOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304087; x=1745908887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pURcEhBEHdxpYhnWEBaI44DGcypxp9nMdkY7Iw/QyY=;
        b=czhyHRDmR28inlgJAMlW91WRs7s8AC0Bv6eaSgXHxz9b3UwAgw5nWI5mibMTzM0vLG
         e5Mf8+bWVKz6KLoNqcqwQ51JMNUttAbeqtUTBGJ7+1j6EvxY4AhIBmhAIcJAZlfiA9x6
         D8O2ba1W6kJdGzDDoBAQAjx0ZUJmtbvmTULa9AM0elTAYnXUWw/YndDV9ZSMg4yLwNcA
         99UabD8Z8nUfscFnGyZc9ftWV1G5BW8YLNJhODpzg+8K2NEOoOfakTCw6MzyXGM8Q4r3
         AEf5IpNARAh4Oscz0pXNrPV0SNZJ/gngpEqci1TSWQvscRGUThlSbWXnqQAAOaNWLHxY
         TEvw==
X-Forwarded-Encrypted: i=1; AJvYcCXJqcioh5hRqcM7I6ug9i8ykzmQxV3PLXaP3JjXDz/jdrfKD8KYbJEGea60rs2Qc3F/ZklQQY19pwUgvn/xCeETC3T/Jw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc8KPAGT34zbQk0Mh61+KRf3rAQMXZQjeXgZdqLSlqUYQHcP5f
	znsPqXf0QmA0Fl7Ew78BTWANoAOjjZUZRnVcEQ8WuyTYwg8z/G/KVYaYH90G9YU=
X-Gm-Gg: ASbGnct2aN/0U4/nD29DeYgEN/8XdcMj9ZIccJ5z5A+dKjhFoaHnnk7RiruH0Z87Wp3
	KLw0+FJB/9r43/KL1shDGX5dGAZGOoiRlIoPNqpBXTNi4KzYx42OP5dT9hHjopdBIL7euas9cUp
	r2ky5DMJeeLbQhSRpC+jGdzrEbWwKKZceOugKRYQ2MA+uddZj1SjABfZPPJJ+pONgxYCtI+Zjop
	QbQnM/dfPCFFIYOsfypVdUgXOm+a/pmZLKCSwqyY6iFfVKQHpmAWLkJNnSaaEeHp4aghJb2U7xr
	VYdr57Zwcdnnr9vGYSxQzxsogDjmwa9LhOL70KyHUjQFYQ==
X-Google-Smtp-Source: AGHT+IGY+z1SYzbAwHQ1bDwluBsR27wnP/M2SunDoCiRoLo03vSfRP0XeHzwdWtlYLn2l6uyLgUtbw==
X-Received: by 2002:a5d:584e:0:b0:39c:2264:43ea with SMTP id ffacd0b85a97d-39efba2a69bmr11843060f8f.3.1745304086981;
        Mon, 21 Apr 2025 23:41:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5bbc13sm159163195e9.17.2025.04.21.23.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 23:41:26 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:41:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	sonic.zhang@analog.com, vapier@gentoo.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 4/5] staging: iio: adc: ad7816: Use chip_info for device
 capabilities
Message-ID: <0145edf4-aef9-45c2-9a74-8c15abb1286c@stanley.mountain>
References: <20250419135638.810070-1-gshahrouzi@gmail.com>
 <20250419135638.810070-5-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419135638.810070-5-gshahrouzi@gmail.com>

On Sat, Apr 19, 2025 at 09:56:37AM -0400, Gabriel Shahrouzi wrote:
> Move device-specific capability information, like the presence of a
> BUSY pin, into the ad7816_chip_info structure.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/iio/adc/ad7816.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index 39310ade770d0..ab7520a8a3da9 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -44,21 +44,25 @@
>  struct ad7816_chip_info {
>  	const char *name;
>  	u8 max_channels;
> +	bool has_busy_pin;
>  };
>  
>  static const struct ad7816_chip_info ad7816_info_ad7816 = {
>  	.name = "ad7816",
>  	.max_channels = 0,
> +	.has_busy_pin = true,
>  };
>  
>  static const struct ad7816_chip_info ad7817_info_ad7817 = {
>  	.name = "ad7817",
>  	.max_channels = 3,
> +	.has_busy_pin = true,
>  };
>  
>  static const struct ad7816_chip_info ad7818_info_ad7818 = {
>  	.name = "ad7818",
>  	.max_channels = 1,
> +	.has_busy_pin = false,
>  };
>  
>  struct ad7816_state {
> @@ -98,7 +102,7 @@ static int ad7816_spi_read(struct ad7816_state *chip, u16 *data)
>  		gpiod_set_value(chip->convert_pin, 1);
>  	}
>  
> -	if (chip->chip_info == &ad7816_info_ad7816 || chip->chip_info == &ad7817_info_ad7817) {
> +	if (chip->chip_info->has_busy_pin) {
>  		while (gpiod_get_value(chip->busy_pin))
>  			cpu_relax();
>  	}

Here we could just check if (chip->busy_pin)...  The place you really need
to change is ad7816_probe().

regards,
dan carpenter

