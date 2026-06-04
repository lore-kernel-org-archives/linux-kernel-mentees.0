Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072DA1F5834
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Jun 2026 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780565030; cv=none; b=ao+lYZTeub2zPiZ8LJczCLRjXd/tfLwJn4MYkg/7CvDL6uUE80bYGS2muSnpTd7l5uz1CV5E32mrxR0j5pPjH+U5iEDYOV4fe0ihUg/VmNhz4GLp6xLUPtYVJwYGWOqa/LgArQreueg3LsXg1lu9yrLuWq8mEKR3aoEkkIzRmec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780565030; c=relaxed/simple;
	bh=T6PJIcN0CqXy1IMyNX5j7l7VoaRlD1edtziIdcR7Ezw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XhsFMJ71Qw+wAHTGF8M5FSPciWDdAPXji8ZbbEKrEyPaKLFsCgDbP5IXNRpj+mVLxSYxbAeFCAycJ82DGBS2DkHBq+n3tyBKwlA3TN0orOY24HHrF7pptV91woyBBejtWOkxGslczZjmWzYqgN+uRYTWiAIEf8svJeaKXG8NCfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Neyl+eXZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Neyl+eXZ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4602e2a0372so13891f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 04 Jun 2026 02:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780565027; x=1781169827; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E1VE4yRo1ptgnYBqpUBjxBfNspfbEp7xrbxqWVzPNzw=;
        b=Neyl+eXZGAufnkad2Uv3VUAErXAJ5YmrZ7pg2ojFrGVDt7LSAIKP6ESGtPOoRd5P/o
         sOd9JHiHexxUz98aXZT3MkOdJYDXORQnEHcIn4OCT4CGpDK6qh+HAlMnI/nV4JdWKKTH
         G73IpBFbofbHT7/nRAnEBVt1KHQ+Wwv2AGLV8kkUcKI61ZU2aTn7gtp1jw0Yx9GCTwnV
         M7r0xelHNxkBlS8OEQgKhv/gAiMDt+ToijPAKJoYSu09sjfmMpFbZPZHEfvwnSIqjC4U
         KuJXF8kJ6vz8TF2yc9hIxFAhT5cb0OfSgwuu5Lz/WeLXmdRXMAcNwFUg7Nej0YDvesmD
         xthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780565027; x=1781169827;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1VE4yRo1ptgnYBqpUBjxBfNspfbEp7xrbxqWVzPNzw=;
        b=Fp3Dp8PpJroD2gFKmydViFDmFSRuQoxmsvZSVPRosgVPxk1nlXUgkKLKGlnNeKaVhp
         fCcVMYkqvmGKb9BlCz/jFZZNluWGJWnExDtoxIKUaD5hSwJqGJGTImRVeLAd/vGkFI2d
         OHjfGY01beKR87fuZHADw1w7lrtNI3Cws7a0BbrpdGIU0s1oMAt8zZ7LZ4eFxNP+Gw20
         rAT//nfat0Iva0vVuVGXYa7G4IUpgOOkjM9Iftc/ASWad0TosZcz7oYB04kLsAXYvuuh
         kQDUmKsz3vZBDzJBgAgk9wnv9wrDsjn9wJ17rDVGlP6xY0Fx3546HrXOIYVVJ5FqgLH2
         dgWQ==
X-Forwarded-Encrypted: i=1; AFNElJ98wW5LYDNwJSl7DgQY+6n4/3nICDlUUsunNqwBdpsrnR8hly0bBBINgMqLXxhgH/xzeQT/2RC3MzyhCR5/n8AxgVZ2sg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0OGZ4iLeT4p2aGLQA73HZNA6DUx+ui61ypninO0okh7w6FXnd
	R3AWRkunUFArxQknzCeImn02XPpwhdw0InWbnX4jkKAt1oPyh2N3P2/3
X-Gm-Gg: Acq92OEK0lzdd3hX8XOhDMvh+r7TCAkgZPQsJ6lpu4vkgeCQR7L55KFNoDVTqX3VB8+
	7VllIrXJDQzPGsVvVKMMAjH7Pjz0q70FUR2UWYnRnETbXC4GDI1DlFvFvlAYwzRnxssdMDVE/7H
	4m4cfta7eeLp6K4aM2r7GQrD6uLR4VZ6zz0258aXlS0uIUcMqU0dEnO+nCT03iT/Xtuf6raMOy4
	A5b18G5TM4QStRj+9ZNJfDkvw059Fa3OpBIh4yQ9BqtRMzsZUaVGPYne+ZQdl58nbA+B9MNdUrL
	2Cw5ON2l3FE0+KxqbTBvfpj0qh7Yy1OHqbaSilpofV1bwzF1osbOqV7BYdYSiSL0fY+e9XqhLGt
	f3X3wXk+EOQw28So2DpGYFSoTt3VUG49DS74K7cWtcEdqV51dIjA/H3alMAZkaNE8gYb+4WIzbv
	ZCf/dwW4JwFwjyl27g7b8NWSfBQKEupFk63qcocgVv
X-Received: by 2002:a05:6000:46da:b0:44a:247e:67b1 with SMTP id ffacd0b85a97d-460216bdebemr7681514f8f.5.1780565027275;
        Thu, 04 Jun 2026 02:23:47 -0700 (PDT)
Received: from [192.168.37.44] ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm14667219f8f.3.2026.06.04.02.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:23:46 -0700 (PDT)
Message-ID: <9c0bec93-e102-4655-8074-fd544b16d912@gmail.com>
Date: Thu, 4 Jun 2026 11:23:46 +0200
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

>   static int tcs3472_req_data(struct tcs3472_data *data)
>   {
>   	int tries = 50;
> @@ -166,16 +214,131 @@ static int tcs3472_read_raw(struct iio_dev *indio_dev,
>   		*val = 0;
>   		*val2 = (256 - data->atime) * 2400;
>   		return IIO_VAL_INT_PLUS_MICRO;
> +	case IIO_CHAN_INFO_SAMP_FREQ: {
> +		unsigned int cycle_us = tcs3472_cycle_time_us(data);
> +
> +		tcs3472_cycle_to_freq(cycle_us, val, val2);
> +		return IIO_VAL_INT_PLUS_MICRO;
> +	}
>   	default:
>   		return -EINVAL;
>   	}
>   }Hi Jonathan,

One more thing on v4 before I send it.

For Sashiko's "tries too short" finding, I made the timeout dynamic
based on the actual cycle time:

	cycle_us = tcs3472_cycle_time_us(data);
	timeout_ms = max(1000U, (cycle_us * 2) / USEC_PER_MSEC);
	tries = DIV_ROUND_UP(timeout_ms, 20);

2 * cycle_us gives some safety margin, and the 1-second floor keeps
the original behavior on default configurations.

This solves the timeout issue but introduces a new concern:
tcs3472_cycle_time_us() reads data->{enable,wlong,wtime,atime}
without holding the lock, both here and in the SAMP_FREQ case of
read_raw() (also flagged by Sashiko).

For the SAMP_FREQ case I'll just add guard(mutex)(&data->lock)
before the call:

	case IIO_CHAN_INFO_SAMP_FREQ: {
		unsigned int cycle_us;

		guard(mutex)(&data->lock);
		cycle_us = tcs3472_cycle_time_us(data);
		tcs3472_cycle_to_freq(cycle_us, val, val2);
		return IIO_VAL_INT_PLUS_MICRO;
	}

For tcs3472_req_data() I plan to use scoped_guard() only around the
cycle_us computation:

	scoped_guard(mutex, &data->lock)
		cycle_us = tcs3472_cycle_time_us(data);

	timeout_ms = max(1000U, (cycle_us * 2) / USEC_PER_MSEC);
	tries = DIV_ROUND_UP(timeout_ms, 20);

	while (tries--) {
		...
	}

Could this be ok?

Thanks,
Aldo
