Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EF12367B8
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Apr 2025 06:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303793; cv=none; b=X3ixcOl15FAtmIrwlHxgzU0DPY081b4ck8MWQcag5BSmAOaKSHyeLSNjHdiwfXjyJU1fl1fv5/JcmomKH5Mak/KotYGYTfVG6D0Y01JlfVWN4ig2g33xERcoPoudoHy3bhY8guEe0G0FGskTPnSx8l5Hnk99KNabCs+9CUFgsLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303793; c=relaxed/simple;
	bh=GiP/jlLbMozxOxUvrEms2VWQOoLHWMI7XjFly4V6b/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSiJZj22AceCvFk50RvdBPLK47tMFfDX+UJhJ8rqj2BUPq9MfQiE17m0jk5SrNx22e3FI0jfhsxTM0pknHBktyGwXDsmsnQcxiciORKXzgwQIyOhj10XUrMOvIluJKC010ekQ6sP8ELAKQ8925fjp1jtm+Pl8d/Bqh61ljr4+EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eb4QTehu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eb4QTehu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso56085905e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 23:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745303789; x=1745908589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MuuIFzXKAKOtJ/juljvbLrxvScq2q/lihuCqoG9qgYs=;
        b=Eb4QTehuwEpzyGv8dojXeTZWJ7USpnqWxHIYFi4KP8sfFjGFItc0BnlcgbHOz7xbjw
         hesaS1vgOr/NjwJZE3DOGwoCjC+7mVf27pFrgmIyJYr0LrSG+wwSQ8aLKU4pVh8u7EBI
         RaKs+Q4v3eFvSQQlxDNrB4vbBM/nVQF7xAzaXAqhCUMjkc7zXp6w8nXqhdVG8d0YiA6x
         C34rPw2OaKRAk7hNGpGGIQ4VWF4/JrGr/QLBZdwi9lSJ0qXrvVlFx8kRLb+kqLupcsPB
         Wtq3FM7WY6o/hOhTfQhlhqh7XDtSjZoS6SqYmd1r1YHelp4uk4PqTH/fV/1m+g9Gc22W
         7Jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745303789; x=1745908589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuuIFzXKAKOtJ/juljvbLrxvScq2q/lihuCqoG9qgYs=;
        b=hj+EhHfLRxrLwo2G6AtI7wFaUy9MrOqIN8WkIRMMJpL3l4GQ6EweuajFMIMGJMkgNX
         yn6Uwmj+pykG9ix60/X2iwF7kLMSry0q4+aImUb8ok57DMS9OeP7JwiLC/mmnRSt/dnc
         zgUk1+9sPK3KLZsOdPLWyqXgDtYDbWRH0BIGlWHk0BjhwNHA5NNbTtKXw/MfxN27OlhF
         CiGLZHfGB6OcAZkeq0lrX5A15/QPaNf3FBmBCgU6mvjq5TefUXsOm66aIBcocHZQSDxn
         9e9WhL9xxP/SQ5E9WxjIUla6+LsrCAAczP4duKWQ/PCZnPwg0w3KH2oB/tmh71TJ0B6I
         ywdw==
X-Forwarded-Encrypted: i=1; AJvYcCWvrshHFnB+pXrETWVwkfWrhF+Y6w/EDWaYOKIY4iRXU7DRyKH80ojZ6Tb8glg3N4wnK7Hz2JC0rJQ+lBrzPlEHvTQLSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPLu8YkcJrSqChWJqTp62xQySiDzakwGD5Mk2KVG8lhxFPeXSu
	BeRvBRHUUcxNbmAmt/1iVKXSB7WwKpOkRo/2clUu5tHYHzCrgwK+wkhVxZdlqEQ=
X-Gm-Gg: ASbGncsoSjzrLhoLL7LL1MWw8oimjFhqQ66fA2Tf70B5qZxQksAgA6JquuYRap5uGJ0
	6MsUpofN2eA4NyOFG5k93g5Ld0Zbk7mnKplUSBFFYBxcWbakwsyMBp7Z/oQqx7zQG1ttkAwDd5C
	TewyoXiHuhNt/j9/8NCa9984+I4KG1+PwKBeN5kr4FTC07GSOg6pqZ/c6QNZUq3+8aBz9ax7LFA
	hNr8wiNxnMMRa4i50OBAefT2mu39HlVm9gQ+iohmOt/bu+/MuBU7fxlAacqfSH8DOFvCzlT67Hk
	JdC3KymRA2bbYZfnaC1k/VUVFoY7Qc5lwbKB1qMCo5BEuw==
X-Google-Smtp-Source: AGHT+IG58ERkjB/D7cQnQR9ULR7mf0eJW0CrGoysFAmK0fVh9EIq2V04mHgq1He3cbNy5XZ0uVNl7A==
X-Received: by 2002:a05:600c:1c12:b0:43e:ee80:c233 with SMTP id 5b1f17b1804b1-4406ac20146mr111342455e9.32.1745303789459;
        Mon, 21 Apr 2025 23:36:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa433133sm13898825f8f.28.2025.04.21.23.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 23:36:29 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:36:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	sonic.zhang@analog.com, vapier@gentoo.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/5] staging: iio: adc: ad7816: Introduce chip_info and
 use pointer matching
Message-ID: <b17dc4de-9fd2-410e-8c5e-f27e550d3eca@stanley.mountain>
References: <20250419135638.810070-1-gshahrouzi@gmail.com>
 <20250419135638.810070-4-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419135638.810070-4-gshahrouzi@gmail.com>

On Sat, Apr 19, 2025 at 09:56:36AM -0400, Gabriel Shahrouzi wrote:
> @@ -84,7 +98,7 @@ static int ad7816_spi_read(struct ad7816_state *chip, u16 *data)
>  		gpiod_set_value(chip->convert_pin, 1);
>  	}
>  
> -	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
> +	if (chip->chip_info == &ad7816_info_ad7816 || chip->chip_info == &ad7817_info_ad7817) {
>  		while (gpiod_get_value(chip->busy_pin))
>  			cpu_relax();
>  	}
> @@ -353,6 +367,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
>  {
>  	struct ad7816_state *chip;
>  	struct iio_dev *indio_dev;
> +	const struct ad7816_chip_info *info;
>  	int i, ret;
>  
>  	indio_dev = devm_iio_device_alloc(&spi_dev->dev, sizeof(*chip));
> @@ -362,11 +377,15 @@ static int ad7816_probe(struct spi_device *spi_dev)
>  	/* this is only used for device removal purposes */
>  	dev_set_drvdata(&spi_dev->dev, indio_dev);
>  
> +	info = device_get_match_data(&spi_dev->dev);
> +	if (!info)
> +		return -ENODEV;
> +	chip->chip_info = info;
> +
>  	chip->spi_dev = spi_dev;
>  	for (i = 0; i <= AD7816_CS_MAX; i++)
>  		chip->oti_data[i] = 203;
>  
> -	chip->id = spi_get_device_id(spi_dev)->driver_data;

Delete the struct ad7816_state ->id member since you are no longer setting
or using it.

Btw, this patch didn't apply for me on linux-next.

regards,
dan carpenter

