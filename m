Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCF21865FC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Oct 2024 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728286862; cv=none; b=rLLWkI7NTB0g3bKDIIiaBHkx0hgw8seDGr2MJMn0C9bWGfLpGb9UBljxMS0XCHUmmFv3bGJoaTHeV84/AJTDpEyL4TPgFbswBNKdo/LFiuVIDgoEa2Dz/GiN22UXetZpui3SRJiE8qduhtqBnWbAm3FeHZitTLH4rtzT18U1aW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728286862; c=relaxed/simple;
	bh=ipEZArsJZcihaFEO48QVP9y4kH66dpAf9QgRnY+Q46g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxLKa8VnpLtgaFgYqPfO7CcXvSbjlCEPqFZS+u5RuQkj44snYPxHchcgwzYOT6v7ZGhne2nmPawJDd9AT5xCYkgMjf3pY+hnT17CMeDEBTSz/TGY3ole0WgSAlaMlRct/5Jy/7Szf/fir5D38LEdgTJYXnVosTDF5sPO36X2nXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aIknuHSC; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aIknuHSC"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F23F6067E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Oct 2024 07:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zA2UvEnz6i5S for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Oct 2024 07:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=ukleinek@baylibre.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EC07605CF
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=baylibre.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EC07605CF
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=aIknuHSC
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6EC07605CF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Oct 2024 07:40:55 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so8002323a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 07 Oct 2024 00:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728286853; x=1728891653; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWJKfNtCPiadgKKpV44m6e67/qtZJV5vu299cJKq5tw=;
        b=aIknuHSC2E7t2qkCLsfk3B8pva4jP7cT96tqY6wm7yPxnpHCleZxY6Vxl0t/oljP96
         J1mGQrUsA7kZ5Nlk6H4viqAMdUOT27XWbj6Ffeq7LueRswO3Qi4BF0c6sWb+ApvpMRPn
         LIUKZC3nQIgKSwyiIclJAftBRiNBu4wCOLzhxcno1xYDsrhVIQESv7Z+tzmoufnxZO6M
         Ufoiv6a/adIH5tfbIokaTCHxkQS3AMjvXrDWsDK5DOi7Itdi1/XOcN+/TtMYf2TGU0vT
         7fVfrxEYQInTntFI5GVJQwm3TKODF2/pATmQYd1h2o0AXOQ5E+HwSQWbse5OnGnkOAK3
         ANXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728286853; x=1728891653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWJKfNtCPiadgKKpV44m6e67/qtZJV5vu299cJKq5tw=;
        b=YS7Q9mjM6UYVZZ68+lrmAVyIXNkr2tP3BLp3jLbZn0LQB5AiY+YEpOmvHVt7DQFPqS
         Jkt5/7VunnqoNmvJArZtDYAQxDql3kq3IwRfjrTLcB2AC7sgwZxsXuraIbtyeMPlCXy4
         QoESQXX5dy/7xoGlxMLNXhUOhBUggGC2qAdma0WmYVOBtiBa6slgbSDDo55s1e+n7k0A
         vExjcp7Y/QJKlzO8OwOcYgY/hlODfDENhq5j8VfCcV1/uU64/hSEEHg6C8+quGElo6b6
         6brdn1AwBeiXWz22KZ2rwuZ9r6i64hgBSL9lL3P8ft6zP7aqBoVHNnDKZ4JbOw9KZEd/
         a5ww==
X-Forwarded-Encrypted: i=1; AJvYcCWwAq7SfGWg0qim/0ahjH7Xvw/Q+Q2UxF9zro3djcfZPQifz82O8EXH5sevXYqihJpR9UU/TpN6uEtdXQhOlEmInvLkyg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy6JceSjVj+bS0lO45TaN5owH2EqbWZxqYv+PWf8otF71/IZz6i
	DlUNuGd9txXbg6WQ7G/c6Up/CM99kBCemjpGBNxd1EDqLw82Pl7Xpub3WRCIV10=
X-Google-Smtp-Source: AGHT+IF//KDeerBcPYweQBWGXHGNK7a6K40VAoRzC9NTXizIxqpvNDX3VoTgSZDIg96mO42u95txWA==
X-Received: by 2002:a05:6402:510d:b0:5c8:81a6:f14c with SMTP id 4fb4d7f45d1cf-5c8d2f3b9f3mr13100141a12.9.1728286853116;
        Mon, 07 Oct 2024 00:40:53 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05ac2casm2877129a12.34.2024.10.07.00.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:40:52 -0700 (PDT)
Date: Mon, 7 Oct 2024 09:40:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mehdi Djait <mehdi.djait@bootlin.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v9 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <62sidvqna6q6s2dqzs6s7ftxwfyootptda6n4fww6tyjdwyhuh@ylifsc3f5ff6>
References: <20241007013036.3104877-1-lanzano.alex@gmail.com>
 <20241007013036.3104877-3-lanzano.alex@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bkeu5bpplnv4ln4m"
Content-Disposition: inline
In-Reply-To: <20241007013036.3104877-3-lanzano.alex@gmail.com>


--bkeu5bpplnv4ln4m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Helo Alex,

On Sun, Oct 06, 2024 at 09:30:06PM -0400, Alex Lanzano wrote:
> +static int sharp_memory_init_pwm_vcom_signal(struct sharp_memory_device *smd)
> +{
> +	struct pwm_state pwm_state;
> +	struct device *dev = &smd->spi->dev;
> +
> +	smd->pwm_vcom_signal = devm_pwm_get(dev, NULL);
> +	if (IS_ERR(smd->pwm_vcom_signal))
> +		return dev_err_probe(dev, -EINVAL, "Could not get pwm device\n");

s/-EINVAL/PTR_ERR(smd->pwm_vcom_signal)/

> +	pwm_init_state(smd->pwm_vcom_signal, &pwm_state);
> +	pwm_set_relative_duty_cycle(&pwm_state, 1, 10);
> +	pwm_state.enabled = true;
> +	pwm_apply_might_sleep(smd->pwm_vcom_signal, &pwm_state);

Error checking for pwm_apply_might_sleep() please.

> +	return 0;
> +}
> [...]
> +	} else if (!strcmp("pwm", vcom_mode_str)) {
> +		smd->vcom_mode = SHARP_MEMORY_PWM_VCOM;
> +		ret = sharp_memory_init_pwm_vcom_signal(smd);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to initialize external COM signal\n");

sharp_memory_init_pwm_vcom_signal() already emits an error message, so you
have two here. One should be enough.

> +	} else {
> +		return dev_err_probe(dev, -EINVAL, "Invalid value set for vcom-mode\n");
> +	}
> [...]

Best regards
Uwe

--bkeu5bpplnv4ln4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcDkIAACgkQj4D7WH0S
/k7h2gf/eEHlwAqR7oTCVvouxztY4+TYaE0xRY3n+Kwl1dNP692bNGSB5xz8llDm
fCpOvHstEF3v44e78Kk5+2E8ROCtMxYteMl+GvncKCFIjKyM4ECrPJOgudMqbCsy
+47UVwwNIVFfvCqc06oFOtHPwur4WTlaLM8OuAoblvtEZkPkzrWJM7vzRHv0Mmq0
l3Lg1qF5ham2OM1pJZCNE/IgFT+aIQW2K5Rp/XfiLjIGShVc8x4KtGhb8Dozk01Z
yzD4+rGlHSawPpJaKq7HYj+P9odCkgVo5oR1fd0RHWFPjgy4fB+V3Id04uava27X
0UFlrJ2BVl1u0cUjR/RZCDp7adKpxw==
=8rmd
-----END PGP SIGNATURE-----

--bkeu5bpplnv4ln4m--
