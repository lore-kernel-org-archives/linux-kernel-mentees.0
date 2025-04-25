Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A005817996
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Apr 2025 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587091; cv=none; b=hi43znQoo49aByKDKHcBF88k4SFGTq9l/05wlEIqED+HOWkr/bEUiOPP2m9Ock7XeB+KkwIL22pxWFIhShsEWy6G72xUh/g0qhIx81dPlktm+EwOqTdLfp1TNg54rWSI0nOQsNdZdUSVe1/rUV+Ly7lEaM8n15/VtGHje24hNb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587091; c=relaxed/simple;
	bh=9juRr8sLTz6yET5bKxGWoa/rfH2ALpXj1tjC+No5OIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KX1y56aTraJ4+YtWMUDKBrZliplRykpxXaaBlot1IdRUkKsjFuJah2M10XbQLCileo7Rpv3iJv7G4Yd61mP91qg0AFybRJBsYxSylRdxnRqeQKkTqw+26EBSJJe6M1c6S1fDRaqWstIDGkDsELS+sSVOqZB1qWnYqB+bTeFg7c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YbUOTWxu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YbUOTWxu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so16655845e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Apr 2025 06:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745587088; x=1746191888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WiZQEQXbMAh4QSTUazeZTDFr/XgIvOyC1vsWeFbPWQo=;
        b=YbUOTWxuTLP8eYFHDs8OtTGF6JrAmObhA3pBaajYsK7vzHS5+QS67N1BOwVeqD6yn0
         6PTTVNCg1vPQOA3V3TKbHrS98sO1Dh+to/p0nzqwoIr1QLB/Od0NujZySc8qAwK9hPbX
         w/vnH09rzoHqJeihAc5UKCw4yjrmPunYNi+tUKKIC/qi/tkL7zE8UzXB5zWildI+F6Sr
         iUsok41/WNDLuhntcE5CIAqKMyXgbkF99Rak1iSUMZ+j6N2yjSjtUkYhiCX5iHoWGRc2
         FH9rGHzeBQl8zstsJJF/wCRcwP7Z2J5yI+zw0PBwPfftYfnGvJ7ETf5Cb3pfWyS2D3fV
         wDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587088; x=1746191888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiZQEQXbMAh4QSTUazeZTDFr/XgIvOyC1vsWeFbPWQo=;
        b=iWG0A8TjZVKRVjMMgk0++zsSnaSDRNgPo+b+TWFpVA4YPgbAX0Y3u0zM5ZxmsMuBQX
         Ap9rSEBT5dSyKmCfHIML0dHUyx4X0T6cDpfDf0g/nsEtWj0SGcyT7Fcs+AvgHkyIwKZz
         NqbV9W0uVZCY0Zg1uwSLHgOhHPYdPWocs4lFvEv2CgAVECm80CTBK2DQrrSAlbTZrK92
         orwGdNCpxSAgbdDZyN0OOyIU0fCWlFuS+HOY96PSvFXG3TiGEEJSn9DW2F3SMxLxNPl7
         tPrs6jiBT83ARb49jF3vEdhmnUznRR12MCFACCdgaMmGE4TI9FtQxGsmYoAc11KZ+osS
         F1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUp1q2t45XemVTdxqYngJWWdJx/o1zVGEBEP6rur2sPp79OSYSQ2E/6Sv0GOvW+8REI6aJewiDxoaynkQWDfpIzm+p+SA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQV8HiptpSTyftSuCLVBR9DVoCSN/xL/mCTlgOMJDI1wQ7z/66
	C22/kEjjwkrTYU2sAdtYxVn/gxR3+YTGWTAm6nX+KgCPYgk6Xh3dSXgyOPHgvB4=
X-Gm-Gg: ASbGncvK0PRilRfIxB0lY+hVH8OMPORN4m3+THNPgxsGjPvpWHruMyPmIJ0t1NHvm6W
	WnlGI9RRhMXujx04nYOcGbFURiU+c2nE742Uw1x8M1Pp7l4AWBtcWRJclUCpRGUYY9hW7GxjcOE
	N2tk1p9Ls2Xgy+6ZVGxTs+y7A1hZhisLndHtCjNnHxq1NaG/CjxyhiKXf8uhrSPtg6yP4dVLh/I
	EpCiY1Us8owgktBCLZ1m/y82wfbrpi+RJWQnXkgKLOivNj+Gnjgdn/HXq0QyytTA0NqGQWYAIyM
	XA5idDfj5uHJH2SsZQrfov68DSHslWho71QBk5mmQlz59Q==
X-Google-Smtp-Source: AGHT+IHbDjS1PQI7NTlpMT+Bu2EFu2dfDgHH1BOBPjpV0q2B/rN6BZiZF+DNqb4h89r5ixKpK9+CrA==
X-Received: by 2002:a05:600c:3b83:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-440a65def49mr25292515e9.10.1745587087859;
        Fri, 25 Apr 2025 06:18:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073cbe386sm2330109f8f.42.2025.04.25.06.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:18:07 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:18:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: andy@kernel.org, dlechner@baylibre.com, gregkh@linuxfoundation.org,
	jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com, nuno.sa@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v4 2/2] staging: iio: frequency: ad9832: Refactor
 powerdown control
Message-ID: <0771a9a7-ec49-487e-afaa-46a39f0b8ba2@stanley.mountain>
References: <20250424223210.91317-1-gshahrouzi@gmail.com>
 <20250424223210.91317-3-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424223210.91317-3-gshahrouzi@gmail.com>

On Thu, Apr 24, 2025 at 06:32:09PM -0400, Gabriel Shahrouzi wrote:
> Replace custom implementation with out_altvoltage_powerdown ABI. The
> attribute's logic is inverted (1 now enables powerdown) to match the
> standard.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
> V3 -> v4:
> 	- Use guard(mutex) for simplified locking.
> 	- Use an extended attribute.
> v2 -> v3:
> v1 -> v2:
> 	Refactor powerdown functionality.
> ---
>  drivers/staging/iio/frequency/ad9832.c | 69 +++++++++++++++++++-------
>  1 file changed, 51 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 2e555084ff98a..b8b52302abf36 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -174,6 +174,32 @@ static int ad9832_write_phase(struct ad9832_state *st,
>  	return spi_sync(st->spi, &st->phase_msg);
>  }
>  
> +static ssize_t ad9832_write_powerdown(struct iio_dev *indio_dev, uintptr_t private,
> +				      const struct iio_chan_spec *chan,
> +				      const char *buf, size_t len)
> +{
> +	struct ad9832_state *st = iio_priv(indio_dev);
> +	int ret;
> +	bool val;

Declare val before ret.  Use reverse Christmas tree order.

	long long long_name;
	medium name;
	short name;

> +
> +	ret = kstrtobool(buf, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
> +	if (val)
> +		st->ctrl_src |= AD9832_SLEEP;
> +	else
> +		st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP |
> +				 AD9832_CLR);
> +
> +	st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
> +					  st->ctrl_src);
> +	ret = spi_sync(st->spi, &st->msg);
> +
> +	return ret ? ret : len;
> +}
> +
>  static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  			    const char *buf, size_t len)
>  {
> @@ -185,9 +211,9 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  
>  	ret = kstrtoul(buf, 10, &val);
>  	if (ret)
> -		goto error_ret;
> +		return ret;

This is unrelated.  Do this in a separate patch.

>  
> -	mutex_lock(&st->lock);
> +	guard(mutex)(&st->lock);

same.

>  	switch ((u32)this_attr->address) {
>  	case AD9832_FREQ0HM:
>  	case AD9832_FREQ1HM:
> @@ -232,22 +258,9 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  						  st->ctrl_fp);
>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
> -	case AD9832_OUTPUT_EN:
> -		if (val)
> -			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP | AD9832_CLR);
> -		else
> -			st->ctrl_src |= FIELD_PREP(AD9832_SLEEP, 1);
> -
> -		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
> -						  st->ctrl_src);
> -		ret = spi_sync(st->spi, &st->msg);
> -		break;

This is related.  Keep this.

>  	default:
>  		ret = -ENODEV;
>  	}
> -	mutex_unlock(&st->lock);
> -
> -error_ret:
>  	return ret ? ret : len;

Unrelated.

>  }
>  
> @@ -270,8 +283,6 @@ static IIO_CONST_ATTR_PHASE_SCALE(0, "0.0015339808"); /* 2PI/2^12 rad*/
>  
>  static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL,
>  				ad9832_write, AD9832_PINCTRL_EN);
> -static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL,
> -				ad9832_write, AD9832_OUTPUT_EN);
>  
>  static struct attribute *ad9832_attributes[] = {
>  	&iio_dev_attr_out_altvoltage0_frequency0.dev_attr.attr,
> @@ -285,7 +296,6 @@ static struct attribute *ad9832_attributes[] = {
>  	&iio_dev_attr_out_altvoltage0_pincontrol_en.dev_attr.attr,
>  	&iio_dev_attr_out_altvoltage0_frequencysymbol.dev_attr.attr,
>  	&iio_dev_attr_out_altvoltage0_phasesymbol.dev_attr.attr,
> -	&iio_dev_attr_out_altvoltage0_out_enable.dev_attr.attr,
>  	NULL,
>  };
>  
> @@ -293,6 +303,27 @@ static const struct attribute_group ad9832_attribute_group = {
>  	.attrs = ad9832_attributes,
>  };
>  
> +static const struct iio_chan_spec_ext_info ad9832_ext_info[] = {
> +	{
> +		.name = "powerdown",
> +		.shared = IIO_SEPARATE,
> +		.write = ad9832_write_powerdown,
> +	},
> +	{ },
           ^
No comma after a sentinal.

> +};
> +

regards,
dan carpenter

