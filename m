Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670302641FC
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  5 Apr 2026 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775401953; cv=none; b=fH4rtzcpduKz2VX3ZlGDhMiD+odUIaES1yiL6Q+f/jvJwBdr6kq7T+1RXAriv+oVWIq8xP94H5590nT84kq96o6ZJzlk/61b1IYGGN/pg2/ffmniLaiZMf39moQOhKJuJKiELpgxOfobX59RP/5SHDNFleG3N/QpYA4VasY+aj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775401953; c=relaxed/simple;
	bh=Clxc1TNqdtfpEHL/HS2PI3FNSIwolS3sq/7BAEx+TJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c64A0PXQFiy9nFRbdX2TPRhODl/gqUy8d73lFw0PivB7dUG2vYRGyCTDuu0crlo7RXE7zu7yvfj2o4zMjIQUV7cdRHS4PahdEGbld+l+QQNXas424SY995tslckR5xaxqULtFp3p7+wAbyNrvBX2GMAiH+Jbd61LLt0blilPyQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=xg4PDt4J; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="xg4PDt4J"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40ea611d1a4so1340544fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 05 Apr 2026 08:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775401949; x=1776006749; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8BANRRy4E4zRqxqgNimKW4aaAELzYPRotrVokPpoURw=;
        b=xg4PDt4Jzjoh4ga5JlR5Lprlhz2NuPO2fPrHDoiCTd5GIMxNs/sMd6fp/ffhvgSHBj
         sKtvsBlZIfcOCOLgAEy/0v3p8ApxmKW+X49dtv6scab+0R74D+kHrCuaVKJZHh6iHdGZ
         aFnSRDLMcFMu/ivBt8M4sXOhV9jN4AXZc5DNX8IzdSJMFjWlCTJ089ijFeIzUjRku1n7
         eRfOppfndwc0lopv9aCVG2DVvYDYne1yS6Vc+BgHmd8JBkSdnZTxv9pl7S2GnEucK/zI
         TsL6cMkxJR6XSMsmoyeYe09/ciiY5EjwoCZlwHGxUXcTNAgI/HMG2zXPnPcnN031dkWE
         A6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775401949; x=1776006749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BANRRy4E4zRqxqgNimKW4aaAELzYPRotrVokPpoURw=;
        b=kFx5Yl16a51P6UVud0q8Hym9iVr842iXhAFGGeYl6CXyViYnBQ1fv6uO1RbH9BUM/f
         Sc0mvCDPbuGWx6vSPyXPK0IPGUdr3jE2yT8kcBqUA5w8Ml1PVtrODGbAPSJ+SSPYy/iw
         djZWC98jD/4J/LIQuKWWhecHwxdztnrkubWS5ig85d8P/pnUsprUdh0G37eJCfE7/0o+
         XDKBiIqYNLqNMip95OAMK+B1K2eMJEAbS+9F7jZOpiXqcqfisV4SRYK9NnGQINnDxuJU
         DZvLhiRsV5zwyt6L9K+BxZHkQbNOPd3fqnschN+bfi9/CMVNy2EdblVHGwT9ZwG95/+j
         Ipcw==
X-Forwarded-Encrypted: i=1; AJvYcCVdiklHDQjVVgQmdc1K30XnRzZ3cabGkBSJnXBoU2RLzIuukRV/l2Fzzj1U9ZkS8w0YqfYUwNM/bfaVdMNmSxeE18oBJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmAqM2Q3/tax+ovOWsMZ/t+ymunNWWWcXGcz68O1yXxTNx9FDX
	HSlMX+6p1oxmf0o4GUh/gKMFj755vuN4Kc/XehtKf+T96Q6QPPFl1rMGwxu6MfugeQA=
X-Gm-Gg: AeBDievNm1SjNGGTnizIT+AZJ+ac+JlLOzpZBnWlSvwXDBylPaP3pcm/9vy9yNjJsLv
	S0Mz2reAr4NcTKVeMkWqUQLohxkl9kvLe+UCXHhCKdajOPJZ+LFQaVGYw31FaNqjYeFZInjjZj/
	gktTqAVpclmmnktxkqt9IkRq3/WEPr3tBBzIuz7+CXfm5IuQ3ZyVRYrg39c+7fCGm1x2ObZECM1
	KHCSKztmU2RYR0GYwHmWR/zaZBx3jqKYgVmVrCdvbA1+fmn12WlveVW5Uy+4f9XBualDNbJBBK6
	5mGKmF2l02RDZxfxts2qs1TpaOPikjaYim387WT//CDL7E4L0QrExyVP2h3G+Y9SwWa22WhHUCn
	yjabVQ6S7hNuXKG5Axaik2O/5G+tuvxJmJnZi866e2SLtIJVp6nhRPHJ7btcNkgkx5Cup0dFmqi
	BxvsasWTPyn7NhyCSx0b0xGQrZ/2Gobs2EcxgYhSeWwiQXt4S6uN5j1KOzIy5dgIAuLSpjqErJt
	Q==
X-Received: by 2002:a05:6820:1686:b0:685:5300:f1ab with SMTP id 006d021491bc7-68553103d5dmr897234eaf.34.1775401949238;
        Sun, 05 Apr 2026 08:12:29 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e80f:4ea3:56f4:bada? ([2600:8803:e7e4:500:e80f:4ea3:56f4:bada])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eb25a55asm9790995fac.10.2026.04.05.08.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 08:12:27 -0700 (PDT)
Message-ID: <bb46e400-4d1f-475e-bf36-7035554b453a@baylibre.com>
Date: Sun, 5 Apr 2026 10:12:25 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: light: cm3323: use dev_err_probe() in probe
 path
To: Aldo Conte <aldocontelk@gmail.com>, jic23@kernel.org
Cc: ktsai@capellamicro.com, nuno.sa@analog.com, andy@kernel.org,
 daniel.baluta@intel.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev
References: <20260404205853.18559-1-aldocontelk@gmail.com>
 <20260404205853.18559-3-aldocontelk@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260404205853.18559-3-aldocontelk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/4/26 3:58 PM, Aldo Conte wrote:
> Replace dev_err() calls with dev_err_probe() in cm3323_init() and
> cm3323_probe(). cm3323_init() is called by cm3323_probe(),  so using
> dev_err_probe() ensures that deferred probing is handled
> correctly and simplifies error paths.
> 
> Remove the redundant error message in cm3323_probe().
> 
> Tested on a Raspberry Pi 3B using i2c-stub. The driver probes
> successfully and successfully read integration_time after this change.
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
> ---
> Changes in v2:
> - Add struct device *dev local variable to shorten dev_err_probe()
>   calls to one-liners (suggested by Andy Shevchenko)
>   
>  drivers/iio/light/cm3323.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/light/cm3323.c b/drivers/iio/light/cm3323.c
> index 0fe61b8a7029..5b36fc265c6c 100644
> --- a/drivers/iio/light/cm3323.c
> +++ b/drivers/iio/light/cm3323.c
> @@ -80,22 +80,19 @@ static int cm3323_init(struct iio_dev *indio_dev)
>  {
>  	int ret;
>  	struct cm3323_data *data = iio_priv(indio_dev);
> +	struct device *dev = &data->client->dev;
>  
>  	ret = i2c_smbus_read_word_data(data->client, CM3323_CMD_CONF);
> -	if (ret < 0) {
> -		dev_err(&data->client->dev, "Error reading reg_conf\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Error reading reg_conf\n");
>  
>  	/* enable sensor and set auto force mode */
>  	ret &= ~(CM3323_CONF_SD_BIT | CM3323_CONF_AF_BIT);
>  	data->reg_conf = ret;
>  
>  	ret = i2c_smbus_write_word_data(data->client, CM3323_CMD_CONF, data->reg_conf);
> -	if (ret < 0) {
> -		dev_err(&data->client->dev, "Error writing reg_conf\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Error writing reg_conf\n");
>  
>  	return 0;
>  }
> @@ -236,10 +233,9 @@ static int cm3323_probe(struct i2c_client *client)
>  	indio_dev->modes = INDIO_DIRECT_MODE;
>  
>  	ret = cm3323_init(indio_dev);
> -	if (ret < 0) {
> -		dev_err(&client->dev, "cm3323 chip init failed\n");
> +	if (ret < 0)
>  		return ret;
> -	}
> +
>  

checkpatch.pl should have warned about having to blank lines here
now. Prefer only one.

>  	ret = devm_add_action_or_reset(&client->dev, cm3323_disable, indio_dev);
>  	if (ret < 0)

