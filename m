Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B9B42A792
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  6 Aug 2026 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009507; cv=none; b=VQVQwHptdZXcpElUIJGp70Li/k7+npzYolneLSOvz9zF43Gj9fkZWfUH1gYAKLFsrYbffO7761ScteehItyMetCVwbIhiGYlVYe4NvjwZ2SF430A4+mwHa77TwQ8Mmycggq5DqHu7MxSmrbNJcKw03Zw74TEggR4wkicCaR7Q5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009507; c=relaxed/simple;
	bh=TeAZHoCbWw14IefsUCwbSK6oDvJqdpRiQEV6O22Uwdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6hLN+QAUJ/S7y0ffvke9WHv4kuC0kZsDK+ILI+lfzn3d4SsERG2wuRlKNocGLgH4GdAUI9A6ZBNUqZnDy3W8XwCHeaXRHe/PWUTG6oKRjcVzdrEP6FO9DzeUyNTxpQLDj17aN7N51HdgqXwSj1QLEqB45wkT3Xu/B/Wq51kXxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOSwRue4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOSwRue4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso17723465e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 06 Aug 2026 02:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786009503; x=1786614303; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2/mFRvlwdBz00We0HdqUhSQE0scSFWYjxULPu/jANo=;
        b=TOSwRue4kkLOKq3YwcCRkFiW1jsig56dsEDYZ9Y0F0+ZeEhfF1UoMAF6aF5uHDHAZM
         XO+CtmvBNwGrk4QPUEuoJMPW4VNlv+h2Gnoz6Atv8zLnQFDbGGmZJsOZRW4BR9l1xHnz
         OCCuW7eEt8Bj1piffA5L40YbQkHUBYYKhohb1l6t9y0wy5uw0WphN9XayYix4PMO4LKO
         +PoDKBJO8f7BHZ6VmgCPqdDr/HoPFY5o4aFj+rnHvbvsSK74HUTdzotk6k0UeVW2Huor
         0KpwmRir8sS8uBvHWQ9O2+ZPE3xx4L5pPSCbn8CqRU2vqUu+tHy6rmS7nC5UU6L7Pl6+
         zowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009503; x=1786614303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G2/mFRvlwdBz00We0HdqUhSQE0scSFWYjxULPu/jANo=;
        b=bMMLgDnOX0bsiKmi3YYzIIS3HVOJ8LfLnPT6kG0KeaGasShg2VszewG8c5oZQ5q/oN
         2Pqtizq/8s7iuP5hT3iFBMuifeqwDDkKU2CHsZXi/by8pG8AfL7pRzfYddvV3pfU25YU
         oSOBupjsu5qpBieWqbPJPmoLg1Mw0X9sdjVyhljq2NltcWAgW85zWn7ZZb43Jn109vNN
         BZp4qwVRq344b+UiBxkCU1DZTYdMftXfX1fF4TJx1SMNFN14K3Q521yCcKa05NePUq6s
         JWBgufnl7lI9ZpIjHTsQ+5mkfJwHljA3HDBA8/kbAfrpo3xILDDIx/pE5R9Pijq2cUQv
         8JZQ==
X-Forwarded-Encrypted: i=1; AHgh+RomPbO2qLFFjc2RO8kaei79TedPQFJGA4HnYXUP2g9p4zCOJxxgZqBIKsKOCzFhK0SAjWvGzyDeHHrsNc10h5QhX1BYjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEYsjnMxmQtXwhqph+RA//htnH98KGADnJ82yZPxdGGZDBeAzz
	ayvd7UUEgn3Ag4Hhrj1wHzBxv6lQYVaTjACS6g/enTnWubjYhUesukHO
X-Gm-Gg: AR+sD13ULf3Ng3ylO8F3B370zCkzJI+VsNNhaAvy60eMozIQW2MqQSu6A0IE9xu4hCU
	ymqelYn5+8dSd0L2B8hYSFte0xIqp2TpzmqL9tQ/LmNvHouJgpK2vYiPAtJgx0pvymXEClSnnZG
	hvH5V2x4rczbqPcujFssnz21xd52aIrjI8wVMqX1Lv7PqKApJJI/lF+/LsPbPIoRG9iPkH58reE
	78DNwyFEaOq6yQqwXcSJI339G/UemOaZTyXsgr7kbl5SynZfj7ZGjMSeUrb5vBHcFOBuKSx4Q+2
	l4q/RFFjCWEg/Qmt1SStInNwakHYWRHH/kX/o9xx0yLPVTu41LFinN/mWS/axxvd6NYYdnfUDc3
	5y9GI5YPE5QaJWFbNVAaAWNUONl7gYuy5+NTGQvWb6IDIA8UebnSEdlGRUO5KpL2Pc659ZdIyGh
	cIQIAsUWI9UqKg9PdrSWGaGub2rX6bZ6IZhEgMby5rIVtLCij+CRAo
X-Received: by 2002:a05:600c:4444:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-4994e7d4057mr171030015e9.18.1786009502685;
        Thu, 06 Aug 2026 02:45:02 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e99b8b5sm76385095e9.2.2026.08.06.02.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:45:02 -0700 (PDT)
Date: Thu, 6 Aug 2026 10:46:13 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: =?utf-8?Q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Brigham Campbell <me@brighamcampbell.com>, David Lechner <dlechner@baylibre.com>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] iio: humidity: am2315: add am2320 to i2c_device_id table
Message-ID: <anRXbXxTLUfUgEPd@nsa>
References: <20260805183733.1000550-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805183733.1000550-1-nico.antinori.7@gmail.com>

On Wed, Aug 05, 2026 at 03:37:26PM -0300, Nicolás Antinori wrote:
> The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
> communication protocol and measurement conversions.
> 
> Add the "am2320" entry to the i2c_device_id table.
> 
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---

One minor comment from me (maybe Jonathan can tweak it while applying).
With that:

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

> Tested with Raspberry Pi 3b+
> 
> Used as reference AM2315 Datasheet [1] and AM2320 datasheet [2]
> 
> [1] https://cdn-shop.adafruit.com/datasheets/AM2315.pdf
> [2] https://cdn-shop.adafruit.com/product-files/3721/AM2320.pdf
> 
>  drivers/iio/humidity/Kconfig  | 4 ++--
>  drivers/iio/humidity/am2315.c | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/humidity/Kconfig b/drivers/iio/humidity/Kconfig
> index 54f11f000b6f..6907805945f3 100644
> --- a/drivers/iio/humidity/Kconfig
> +++ b/drivers/iio/humidity/Kconfig
> @@ -5,13 +5,13 @@
>  menu "Humidity sensors"
> 
>  config AM2315
> -	tristate "Aosong AM2315 relative humidity and temperature sensor"
> +	tristate "Aosong AM2315/AM2320 relative humidity and temperature sensor"
>  	depends on I2C
>  	select IIO_BUFFER
>  	select IIO_TRIGGERED_BUFFER
>  	help
>  	  If you say yes here you get support for the Aosong AM2315
> -	  relative humidity and ambient temperature sensor.
> +	  and AM2320 relative humidity and ambient temperature sensors.

The above (same on the tristate title) does not really scale nicely and
we've seen too often already. So I use something like "... and similar
devices"

- Nuno Sá

> 
>  	  This driver can also be built as a module. If so, the module will
>  	  be called am2315.
> diff --git a/drivers/iio/humidity/am2315.c b/drivers/iio/humidity/am2315.c
> index f29baa251f9f..5bce5eec45cc 100644
> --- a/drivers/iio/humidity/am2315.c
> +++ b/drivers/iio/humidity/am2315.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Aosong AM2315 relative humidity and temperature
> + * Aosong AM2315/AM2320 relative humidity and temperature
>   *
>   * Copyright (c) 2016, Intel Corporation.
>   *
> @@ -251,6 +251,7 @@ static int am2315_probe(struct i2c_client *client)
> 
>  static const struct i2c_device_id am2315_i2c_id[] = {
>  	{ .name = "am2315" },
> +	{ .name = "am2320" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, am2315_i2c_id);
> --
> 2.47.3
> 
