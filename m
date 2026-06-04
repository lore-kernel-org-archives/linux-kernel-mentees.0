Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78E93932DE
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Jun 2026 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560608; cv=none; b=LCaSqsbTZWciGmkfvUFowGbMQM+VGT0gSJOA0OYDjGjIPr1/3PcuFi2AE8F7MNKZ5HuXx8ognyKeGLVgedIHuxCDxubMbYxomY0M2N2pXdVylUS/YBRHiWHB2STEE3a41A3nyrWwO6EbLAHtzNxakQ6di3YkKnFa8aDHHJRxuHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560608; c=relaxed/simple;
	bh=FZQMkrX+okeT4SlD7Tf4t2UW+eiFRO3yu1a1DqNEutQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GIXHAHdLVFfUPECIXlnXvUZTVwqaK3wYp7DQFylpSuEtXMqemoq7Vy50eFSFt02d66Ech/YPMaetCBkexv25kbYiccNM9HOcYXBvWvEZ6kcM4xevc54IpPWmjtHCTBasiIgixAClpO97lP6ngg4gJbYZytN7DTba8VM6KRUl6lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJJKdXTy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJJKdXTy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef82204c6so180852f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 04 Jun 2026 01:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780560604; x=1781165404; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eq5xpfpddkc8h4wqB4/es/lPRW0lpYTExJdBasPpfqU=;
        b=ZJJKdXTymBCGRwPLxoelUvndJ/E+gt5FwnF+ZepxpDjJFTJXi/qHxg1g9cMtCrFKBL
         8dwHrUThoFP11nAhdsMbUlYOm/RQ//ft2e+gH58N1q22qb/f5QVpY6q5y0zWVGlhuPND
         NtQOxEYKm8SPisCX8z1vUoDeVGYKmo20579AZBgSw7SGKB5MRnqI2/GoC2CCzDx/U8Rr
         gV1N6/hrvQp7A/phc81Dfh0Tm/oXimH7Y4YTG7DdWdeTQnjj9sRQvDu35zYAjTpYzvgi
         O5MYO/gzyjRzSFmASEUO/XK+5q8bvzfv2BEHPNI6TIXb/uU7huMTPAmpj3D8EkQyccV2
         OSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560604; x=1781165404;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eq5xpfpddkc8h4wqB4/es/lPRW0lpYTExJdBasPpfqU=;
        b=BHOUZqqDUu7+a9dwbzuUs+CQ+M0z8WIfcaMERRrSuyJNXaIIETvs+NwNb0TjMy6o6Q
         5r5WoYbudjAL+jwJ61cQuMDr78ENgefEt2uggkhPoIAw6ovFiW+hBCXQu0AFP966myZa
         4+MqoQyG4F+Rdq/lGoNYcWF0VfvUkd93k3B07e3QwPWLY4YJaGpL0BiZH0UvRKLHU92i
         eCKnRRGP0+1/QCaex/I/GZOXPskbTR/U5Eq2jIKkr8ZjTWJsrf3668dM6qAEz+cwuf17
         DMw0GtOFcRr1tATxaThwZtpu4siru5h5YnKgrEUMu/RF2Qag++HHpgbkwedYuU5MejUE
         6PlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MsBJnl/YG+lpqfQmC6YAACduCMls7iizr5qTehOt0p0A4paz+2XKtkVwZUbp0V31tLJ9BAOf6y5euA0leAACYcsSSxw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yya7h/X036XXFM9s6pXlL4BPFBvl6+JrApva+aJyYoXyzwEO6nz
	F1Z66m9izozNlCXLgx/p9QF24d8ebibz+jgRlCe+Y4hmI4J47akbdwHU
X-Gm-Gg: Acq92OFeazossPD5pxuBzwiYnN2dqceC/kjLGdx1LR5oSJn4Iu+rpT7jlsQ3wGIxZ7c
	KsHPAUL2AdbvtZWm/bfX1SylX1k+1AdxQOcqLPQ+IasuVVg6mhMVx//GTENWjdG92fz/PsBmZY3
	VfTm3eEX0ZDDasaUyP256f0MN9j6gYX+Uog6G0R56l4X7+Sv9qjWucB62H0EGA5Y0D64hTUU0zI
	zjDlccuZEPHZAFJ7TulCu8/F7ytgg7ADGJq62jvIVqXhEbQ6rzLSyC88tkNkZA79GhI8j4qSLKw
	bExMaFxcQRQm1JbxVnxUQoMmdTvKWN5qWz3hhJz0YG9Mg1qO5DqVbBo5Hlngn5e34ukuE+Ju5MP
	QkE83sK/b2gwAI9SrJwS+oLrWfC2LMpXyf0oqxHonqQWmUZXICZpsg7CxjubeZJXr7e1hwRb5Bw
	s61xruLcfysPl8r0hWVrKZjXvjmYIOMggCENaAGQKUPeySGMRiYhI=
X-Received: by 2002:a5d:4987:0:b0:451:3b12:9bca with SMTP id ffacd0b85a97d-46021831001mr7968041f8f.25.1780560604206;
        Thu, 04 Jun 2026 01:10:04 -0700 (PDT)
Received: from [192.168.37.44] ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2eadefsm15126722f8f.11.2026.06.04.01.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 01:10:03 -0700 (PDT)
Message-ID: <d82b27d8-4e0e-4749-bea7-a09f43554fb2@gmail.com>
Date: Thu, 4 Jun 2026 10:10:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] iio: tcs3472: implement wait time and sampling
 frequency
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 shuah@kernel.org, joshua.crofts1@gmail.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20260522123420.45495-1-aldocontelk@gmail.com>
 <20260522123420.45495-9-aldocontelk@gmail.com>
Content-Language: en-US
In-Reply-To: <20260522123420.45495-9-aldocontelk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/26 14:34, Aldo Conte wrote:
> @@ -196,15 +359,29 @@ static int tcs3472_write_raw(struct iio_dev *indio_dev,
>   		if (val != 0)
>   			return -EINVAL;
>   		for (i = 0; i < 256; i++) {
> -			if (val2 == (256 - i) * 2400) {
> -				data->atime = i;
> -				return i2c_smbus_write_byte_data(
> -					data->client, TCS3472_ATIME,
> -					data->atime);
> -			}
> -
> +			if (val2 != (256 - i) * 2400)
> +				continue;
> +
> +			data->atime = i;
> +			ret = i2c_smbus_write_byte_data(data->client,
> +							TCS3472_ATIME,
> +							data->atime);
> +			if (ret)
> +				return ret;

Hi Jonathan,

Two questions on the INT_TIME case in tcs3472_write_raw() before
I send v4.

- The compute/write/commit pattern issue you raised elsewhere
also applies here. I plan to swap the order: write first with i

return i2c_smbus_write_byte_data( data->client, TCS3472_ATIME, i);

then update data->atime only on success. OK?

- Sashiko flagged a race ( 
https://sashiko.dev/#/patchset/20260522123420.45495-1-aldocontelk%40gmail.com ) :
target_freq_hz/uhz are read without
the lock and then passed to tcs3472_set_sampling_freq() which
takes the lock internally. Two options:

1)  Take the lock briefly in write_raw() to write ATIME, update
     data->atime, and snapshot target_freq_hz/uhz. Then release the
     lock and call tcs3472_set_sampling_freq() (which takes the lock
     again internally). Minimal change, but ATIME and WTIME updates
     are not atomic with each other.

2)  Split tcs3472_set_sampling_freq() into a public wrapper that
     takes the lock and a __tcs3472_set_sampling_freq() helper with
     the lock already held. Then in write_raw() take the lock once,
     write ATIME, and call the helper. This keeps ATIME and WTIME
     updates atomic.

In these cases, what is used to do?

Thanks,
Aldo

> +
> +			/*
> +			 * ATIME just changed, so the cycle time changed too.
> +			 * Re-run the sampling frequency logic to recompute
> +			 * WTIME and preserve the user's last requested
> +			 * frequency.
> +			 */
> +			return tcs3472_set_sampling_freq(data,
> +							 data->target_freq_hz,
> +							 data->target_freq_uhz);
>   		}
>   		return -EINVAL;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		return tcs3472_set_sampling_freq(data, val, val2);
>   	default:
>   		return -EINVAL;
>   	}


