Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490C83B95F6
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 20:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704199; cv=none; b=LYCGP1skxTp+N0mCLzv0Ir9mTxlNx4RilkMj4cUOVnJTzdObmBVeXHgVyl0rnx7S9rQXEjXvcRkCErJztTOb/S9nzso/SvliJVh/bbIARneiCvR6CbSFdteiffqFqixCsIrGVRL//3pw1ENmPXtVVC+qmNGaRW6OvF6roK5lH/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704199; c=relaxed/simple;
	bh=jHFlF295HYzF2B3H7tjKS4sy/QRMeoh2eLu7AGEMh9s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Oh6oJXyodSLFCDyTY32m5/2KffToPpIoWEMrFUro3H2qLukKS248zH0GY4jTX+rOGt4K851ZdKdtIjIQJWgOLrzkOOI/Eb+GdAhEbOcPrBEHZiX+0u0iM9b1xSUo/XnJhs5nIhxK+LJP4ZpwWnXH4IZpY9+3se874BE/+bW+4Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvGYQ9yi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvGYQ9yi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so120712015e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 13:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778704197; x=1779308997; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jAvNBpV8Q/y6fPQg34WIPbh535gNEElB5bP/5NvjoC4=;
        b=pvGYQ9yiimDpWZ568SLV9QaEYTnWwUWN9DNn+H4K7QrbzN/pmX/9xwdvRJox0CYMxX
         4CSCWw3663GzGg9pcTEK+tS564OSdVVnrsJjDw+/ffnbwmH775ZGNXkmxFYJKlZFbODD
         qejES+2SjQAgRf1E7XiAZBPJgJxJU9IZAR80V8ukvOlN/G7ga8bSOvzgN2TUs3/Xgxte
         u0b+sHdyakf0biVatef2Sry9TmyZ1B+lMsOHTpekbek15N52PMWuknnKprpTrdYhTHFn
         JWG2JPbXPDRB24I2vZDGp1XKj/3YCC4HDXAUSvNVd1fVCM1KFj8t7ptgRcUsYApMgvj0
         MBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778704197; x=1779308997;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAvNBpV8Q/y6fPQg34WIPbh535gNEElB5bP/5NvjoC4=;
        b=FQr2wyqti0B7yr+FseY0dnn9MJrSOQt12QoDofoARy86IPRSMi9fHgV0+c7cUHix/5
         m+L4kzKyqReHXN3LNE6KwgsciX/QryKgc9S36yR/vAppBCx31HuWxaLzSavgzqp1szt1
         Y8cw8cA+v3r3yl40pQ1EZVHOw7avbnA+ArKj2iVfBasqzh2vZd1UD/yS9ahL2kfK/Hef
         dRVpIblkkNBL9uGjY+xTY8T67ND8YzhbpvKHoUQ7cAY8sidV+6tAyuitumvYCPzlBJ6Y
         rFU+zg2y6lNG4XOIw50tz7gNuoRBn0K/SQmSKdpurAd46JdR9+vXKVXp7j/EOxIbY36o
         Nd9g==
X-Forwarded-Encrypted: i=1; AFNElJ/P2t2TwdhaLoYJG8D196tHoOgSpwfJW1NuO4kqUbSg+3MCaPcfmPujZkxXclrBlbW/fXwSQC+uGWwFaFVXEyVolOgw1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHPyNRYY2td7CO7lkc7WQVKJHfVyRWTgsYeuuPLJSx3YUqXtYe
	R2eVLplxzCLpjhQiaVE69sL/eTZlbFWf8JB+jiKoC2QsLduf+NyD3Tiv26VzOQ==
X-Gm-Gg: Acq92OF0qLgkRQ+iATwOzhEcEdUfu5RbIeV7Zv7G4Ber15dfclL41/lxvSkQiH9+aMU
	fEARCo2fX2hPOZdDbABTayTWcZACmrH3b/JbhCZMHT2w1PPJ7BKaIHA7qvY68o5tLvA4HZcYLNH
	Nqr4DGRZbcqLnRpjvq2K7kEfs++vDjHK52Uyyg4TQCXoFeVLJxHjWFX6qmwc9UsYI4vUEDimtRn
	GgV3BXtQTyp2pNlFw+zgUAWosKZDTDbBkzZ/+wBmVp9Vgptqu+Db+GsOAiGqRzN59pUMtW518j5
	ptQ/WcC/32DgWofVpVlalTfioP2PzvX6OVE50Cv8S7KUgbTvtMnTHo3aQrpMmNfGH2O+jAgWFR7
	+86IkOhy4znyRJ2cyM6jh0z6kpe5ET90bbxcECiyP0kQM1iIsuOjFfkuFxUsZnuSpz9FrwxU3+N
	J6I49uccL8A2dr5a+iVgu2ZJhCRTQE/XqcU3pR2PdhmdRjfdXtamcZmgEL1dWKje8k5ik8u/I=
X-Received: by 2002:a05:600c:8705:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48fce9c731dmr74047535e9.9.1778704196412;
        Wed, 13 May 2026 13:29:56 -0700 (PDT)
Received: from ?IPV6:2a01:e11:5402:d840:f1ee:c5d:74e4:6e19? ([2a01:e11:5402:d840:f1ee:c5d:74e4:6e19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd64da1absm21690035e9.14.2026.05.13.13.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 13:29:56 -0700 (PDT)
Message-ID: <0de09560-6a79-46f0-8a63-3fb904a38231@gmail.com>
Date: Wed, 13 May 2026 22:29:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] iio: light: tcs3472: use devm for resource
 management
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 shuah@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev,
 Joshua Crofts <joshua.crofts1@gmail.com>
References: <20260512223215.25596-1-aldocontelk@gmail.com>
 <20260512223215.25596-4-aldocontelk@gmail.com>
Content-Language: en-US
In-Reply-To: <20260512223215.25596-4-aldocontelk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 00:32, Aldo Conte wrote:
> Convert the driver to use device-managed resource allocation:
> - Add tcs3472_powerdown_action() and register it with
>    devm_add_action_or_reset() to ensure the device is powered down on
>    cleanup. Before this patch, the chip remained powered if probe
>    failed after enabling it.
> - Replace iio_triggered_buffer_setup() with
>    devm_iio_triggered_buffer_setup().
> - Replace request_threaded_irq() with devm_request_threaded_irq().
> - Replace iio_device_register() with devm_iio_device_register().
> - Remove tcs3472_remove() as all cleanup is now handled by devm.
> 
> Rewrite the read-modify-write pattern in tcs3472_powerdown() and
> tcs3472_resume() so the new register value is computed first, written
> to the chip, and committed to data->enable only on success.
> 
> Use a local 'dev = &client->dev' in tcs3472_probe() to keep the devm
> calls compact.
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
> ---
> v2:
> (Suggested by Andy)
> - Rewrote read-modify-write in tcs3472_powerdown() and tcs3472_resume()
> - Use local 'struct device *dev = &client->dev' in probe.
> - Dropped "Compiled with W=1" and test details from the commit message.
> 
>   drivers/iio/light/tcs3472.c | 107 +++++++++++++++++-------------------
>   1 file changed, 51 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
> index 4fd4fd74d0d6..7a6dc8360326 100644
> --- a/drivers/iio/light/tcs3472.c
> +++ b/drivers/iio/light/tcs3472.c
> @@ -427,13 +427,38 @@ static const struct iio_info tcs3472_info = {
>   	.attrs = &tcs3472_attribute_group,
>   };
>   
> +static int tcs3472_powerdown(struct tcs3472_data *data)
> +{
> +	u8 enable_mask = TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON;
> +	u8 value;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	value = data->enable & ~enable_mask;
> +
> +	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE, value);
> +	if (ret)
> +		return ret;
> +
> +	data->enable = value;
> +
> +	return 0;
> +}
> +
> +static void tcs3472_powerdown_action(void *data)
> +{
> +	tcs3472_powerdown(data);
> +}
> +
>   static int tcs3472_probe(struct i2c_client *client)
>   {
> +	struct device *dev = &client->dev;
>   	struct tcs3472_data *data;
>   	struct iio_dev *indio_dev;
>   	int ret;
>   
> -	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
>   	if (indio_dev == NULL)
>   		return -ENOMEM;
> 

Hi Jonathan,

In v3 I have a small style cleanup: replacing 'if (indio_dev == NULL)'
with 'if (!indio_dev)' in tcs3472_probe(). This was suggested by
Joshua Crofts in his v2 review.

What do you prefer it is a separate patch
or folded into the devm conversion patch (which already modifies the
context next to that line).

Either way works for me. Which do you prefer?

Thanks,
Aldo

...

