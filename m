Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098141EB195
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 16 Oct 2025 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760604652; cv=none; b=IDLjLcMazT7sxtGjIZVDZHqWfThkN9NNHOByXDgLOey6h+ZzMn3QgUS4NQeT3roknMfkIRytjaBFEzH21EU+JKAq8rAhg3CpUhrOuBPypSCXtatIMN3/P4/JAyGRzX+fx0KqoibJPNFdiawsuG742eR8TedPhHpbqelQK5aYB7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760604652; c=relaxed/simple;
	bh=5/XS3JraEjxk1JfmUJdTZhej2bh1Sw1yywUdb9kgz+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEhKyI0sCJ6Mss3rL2dqNG3lagC34fUes4sgXmJyD1Z7Clg/WCS8jGZVh0BqB15h+cmL0tzihXcBMjmyKzOHhV72GKXF8BUYI1wq3mLXH+Dca+Df20SFKznlpm0iFqscx2ppYc4IdgZ83J+R/JyIWa4rausLgCkXR8I++fyL9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ApVSHSZm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ApVSHSZm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3e9d633b78so110285166b.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 16 Oct 2025 01:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1760604647; x=1761209447; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HPGh/INSa2zSUyaHqMg9VH3NffLUw7enDRxb7tS1TjQ=;
        b=ApVSHSZmVhPa6Pa5821ueh28T29wv8zZ0jaoXTpIG+VWaz303wY2enj6MBVQwjfKtN
         3hWs1uFq0xNHGTuL6FxcGmlwsAn6kZ9b3F+geG8/XYDcuuEyLlN3/XDZQXBG4Eul6coC
         TeU7n97vM0bbJDt0lbYWQX82G5RPkHkwK+Je/SK/qZpZo1dMg1VIRBBNh9KdvJwfyr+F
         TtCb+fteW8MpZxwWhMGoahPk/hIuAudrdouHOpAGzWyYBTWIkSxrF4K71ErjlZ7Fajfk
         XyrQbdD1l8WUW70cWgYyNEss4GWr7XppSFAu8Q7HJpmWDX08xz5gXjLW3ajsvXxIgbvZ
         0ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760604647; x=1761209447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPGh/INSa2zSUyaHqMg9VH3NffLUw7enDRxb7tS1TjQ=;
        b=gb9KJumJ7Os6Jy8AIlD9nNvfcdp0+4WI0yWsMkVQ0uTeeMCUE7s/zTrekn0JDXh7ed
         VGIkmf5Ta38wk2TZNl1PeXPmk3b3bo7Q3GdHq+VH0VrCqzvu7UjKDAHksDXfHJsZ12qi
         5CDZsT+fJreJsdNHGlKOe4twxHOmSyUOwo3Vc+f8zFT3Q9S2I/o/2GVjw85uQgtJmCEk
         P7t9y0jlTVr3SpRUqJfui7mEdG1vm4MT7MW+mpaR3M77rsIoppUieKaDAWkRr6QzrCxO
         CiFK5tIy4Q6nljKDEnBnXi+r21RoC53YgvcBGBNSypHxjfQjX0pSj8W1uor70yiaLEgY
         ODkg==
X-Forwarded-Encrypted: i=1; AJvYcCUSrdok3m5wyVVGS3bggUOG++nEjgxf7hVl6lJAzn1kSQD4WH52M/S0Xzhc+wjbq0rGGg3evvokmeG+BW9nrvz9Pskt7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxORDe/hSVoQC2tgUgyR+6h4z+V9i9xPHaQ1/5e/txpQVNP9JXv
	QH89fplOZhzOwUIuVI+k5mkta+Pyzv/qEnBAG+IIi+L5/NYWtSwMIHWk6VXvfK2mgEc=
X-Gm-Gg: ASbGncvGnBQSR24iKYvHkHtK9UrmiQzIT6ruYU8EZwZrjp3HW4IERzzc6DOehAyWpNS
	ieMxkzSpbijyIJujNLiYUiNqZfLUGcLpJOb1/NoykYg5jgh9jcUyoHxe3PsL95cw7OgQvg5H6IY
	4/FhlOECnbsjmKlV2wEVt4KGpJIVJG6dbkoUpej2QDt4pffrkceyKd16bwygFzAXu7K2E6uoeah
	ltUKirkOh1oGL0BcApGnhVCJKMN2AKT0unxnaBTXr9y5dijLPBbXoSyWvaLnDTdvLxyIYbV3mWM
	45eaIf0AtZZhjNZ+mZRByGQ1PdO9pH7Rv/o+5Xw6A99ruEidr4WP4BKXkEF10+ujs7DvvSO5tVZ
	TXFTe4yecNOG0HVKIE43YtGp/jcjkvhjziz0xtUULQs1bzlFxe+3LrAVfeUMJVC+IbO2eAKUCnG
	D/xKjyPqqn6GLKhOAwRqmwjTQysnaB8B+n3D6VN19u5xgOzH7JsVnQ
X-Google-Smtp-Source: AGHT+IGs/Ex7rQ3pCPhtdm0KlwKe9GFuI3YTsI4ki3K0pfy1MU+O9okm6dWvBIHwMxGo4ooAzD+LEw==
X-Received: by 2002:a17:907:7a86:b0:b3f:f6d:1d9e with SMTP id a640c23a62f3a-b6051dc383cmr402374666b.6.1760604647221;
        Thu, 16 Oct 2025 01:50:47 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b5cccda99adsm457507666b.41.2025.10.16.01.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:50:46 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:50:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: ulf.hansson@linaro.org, chenhuacai@kernel.org, 
	david.hunter.linux@gmail.com, khalid@kernel.org, skhan@linuxfoundation.org, 
	zhoubinbin@loongson.cn, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, kernel test robot <lkp@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] mmc: pxamci: Simplify pxamci_probe() error handling
 using devm APIs
Message-ID: <o55ujlbvxwezsf3ogqx33pcbg5b2lviy6bv5ufnz6t7yi4v23t@i6uiafh6no6c>
References: <20251014184657.111144-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6zooc3ooxgc2c7fb"
Content-Disposition: inline
In-Reply-To: <20251014184657.111144-1-rakuram.e96@gmail.com>


--6zooc3ooxgc2c7fb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] mmc: pxamci: Simplify pxamci_probe() error handling
 using devm APIs
MIME-Version: 1.0

On Wed, Oct 15, 2025 at 12:16:57AM +0530, Rakuram Eswaran wrote:
> This patch refactors pxamci_probe() to use devm-managed resource
> allocation (e.g. devm_dma_request_chan()) and dev_err_probe() for
> improved readability and automatic cleanup on probe failure.
>=20
> This eliminates redundant NULL assignments and manual release logic.
>=20
> This issue was originally reported by Smatch:
> drivers/mmc/host/pxamci.c:709 pxamci_probe() warn: passing zero to 'PTR_E=
RR'
>=20
> The warning occurred because a pointer was set to NULL before using
> PTR_ERR(), leading to PTR_ERR(0) and an incorrect 0 return value.
> This refactor eliminates that condition while improving overall
> error handling robustness.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202510041841.pRlunIfl-lkp@intel.com/
> Fixes: 58c40f3faf742c ("mmc: pxamci: Use devm_mmc_alloc_host() helper")
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
> ---
>=20
> Changes since v1:
> Following Uwe Kleine-K=C3=B6nig=E2=80=99s suggestion:
> - Replaced dma_request_chan() with devm_dma_request_chan() to make DMA
>   channel allocation devm-managed and avoid manual release paths.
> - Used dev_err_probe() for improved error reporting and consistent
>   probe failure handling.
> - Removed redundant NULL assignments and obsolete goto-based cleanup logi=
c.
> - Updated commit message to better describe the intent of the change.
>=20
> Testing note:
> I do not have access to appropriate hardware for runtime testing.=20
> Any help verifying on actual hardware would be appreciated.
>=20
> Build and Analysis:
> This patch was compiled against the configuration file reported by
> 0day CI in the above link (config: s390-randconfig-r071-20251004) using
> `s390x-linux-gnu-gcc (Ubuntu 14.2.0-19ubuntu2) 14.2.0`.=20
>=20
> Static analysis was performed with Smatch to ensure the reported warning=
=20
> no longer reproduces after applying this fix.
>=20
> Command used for verification:
>   ARCH=3Ds390 CROSS_COMPILE=3Ds390x-linux-gnu- \
>   ~/project/smatch/smatch_scripts/kchecker ./drivers/mmc/host/pxamci.c
>=20
>  drivers/mmc/host/pxamci.c | 57 +++++++++++++++------------------------
>  1 file changed, 21 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
> index 26d03352af63..d03388f64934 100644
> --- a/drivers/mmc/host/pxamci.c
> +++ b/drivers/mmc/host/pxamci.c
> @@ -652,11 +652,14 @@ static int pxamci_probe(struct platform_device *pde=
v)
>  	host->clkrt =3D CLKRT_OFF;
> =20
>  	host->clk =3D devm_clk_get(dev, NULL);
> -	if (IS_ERR(host->clk)) {
> -		host->clk =3D NULL;
> -		return PTR_ERR(host->clk);
> -	}
> +	if (IS_ERR(host->clk))
> +		return dev_err_probe(dev, PTR_ERR(host->clk),
> +				     "Failed to acquire clock\n");
> =20
> +	/*
> +	 * Note that the return value of clk_get_rate() is only valid
> +	 * if the clock is enabled.
> +	 */

The intention of this comment in my WIP suggestion was to point out
another thing to fix as the precondition for calling clk_get_rate()
isn't asserted. If you don't want to address this (which is fine),
drop the comment (or improve my wording to make it more obvious that
there is something to fix).

>  	host->clkrate =3D clk_get_rate(host->clk);
> =20
>  	/*
> [...]
> @@ -759,16 +752,8 @@ static int pxamci_probe(struct platform_device *pdev)
>  	if (ret) {
>  		if (host->pdata && host->pdata->exit)
>  			host->pdata->exit(dev, mmc);
> -		goto out;
>  	}
> =20
> -	return 0;
> -
> -out:
> -	if (host->dma_chan_rx)
> -		dma_release_channel(host->dma_chan_rx);
> -	if (host->dma_chan_tx)
> -		dma_release_channel(host->dma_chan_tx);

I was lazy in my prototype patch and didn't drop the calls to
dma_release_channel() in pxamci_remove(). For a proper patch this is
required though.

To continue the quest: Now that I looked at pxamci_remove(): `mmc` is
always non-NULL, so the respective check can be dropped.


--6zooc3ooxgc2c7fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjwseAACgkQj4D7WH0S
/k6mDwgAsXfmGQvI3EWoF/Xf7HICwAuzocExje3sDIKYBM2h6ePeiozPAL4KW/36
K33TIV+nzcHI2enredvl0hZ45mlc54A0qsINU0PCI06DBSz2ACIPjSvv2iHs3gwL
jTcCuAtQzXWHqYXDN1Gb1x92B/s+sOL3gJkGQMfDQUv6JQDUlM1Ip4yrH/XyNy/F
6VbqxHDWPxjYroGphTanRSJNz3YvtmSRaerx6KzDweCMMI3kDj0xdAMxNS8twViP
PQHwsyW9znXNi/Old+xa0EoTawa0s9xAYsDtWu57LutautBHOLM7qz5+B8CeY0Vf
cxANyYd/x8WF5++m59blZxAtM02bGg==
=Yph/
-----END PGP SIGNATURE-----

--6zooc3ooxgc2c7fb--
