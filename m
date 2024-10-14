Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FC714D430
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892966; cv=none; b=CdyimnZ05qXkiroJDUIbIbSiW6I+K0axsViytuPWMGVYxBQKfQ6udkS24vnztyCNTclw4r+eOvfg3EBxDK1Kvk/UvPbZPTg0LWAAVtf83emuCZyprxI9AEps4O+ykc+8pjLfLrfsnIX8q7DLLWOXzuxoKFI9mJ/y/br4Z0T95/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892966; c=relaxed/simple;
	bh=4RlZOlgSupAxgWagLLro/53S7NCRTENxGSsZn/UbRdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTPzayZ7SP/CTme7hc0xJOEtgbpLA3UpXGwUnZFE/ZMwHWGmvSev6wPTXWVsAX2Xh05RJzKj651qlIiwh+I62R1uEwPYs6pvs0RsivmxyOlevbe6fW/CpNvksUBtB00/GD489ocAcP8Ek9jwIZlrPGAFJyScaHlD7ePCPdaYSvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HX8bXn7C; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HX8bXn7C"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 888B04049C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 08:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9S9Csf4Ww80u for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Oct 2024 08:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=ukleinek@baylibre.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EC5D4049A
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=baylibre.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EC5D4049A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=HX8bXn7C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8EC5D4049A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 08:02:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4311fd48032so18202815e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 01:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728892960; x=1729497760; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4RlZOlgSupAxgWagLLro/53S7NCRTENxGSsZn/UbRdU=;
        b=HX8bXn7CHoJZYZOCC3mXExf45h+5LI+IQoKXdTnsfQlwmOUroV2t4dLgLfy+/Tpaum
         33QX3fj9bgX8el/c+GxZ74gWHORKN4Aj4H0EIMVTc9MWglC/WjmMQHx8Dg7B9mYoVjTU
         qpIsyrb+8PWav92AQT324AnbAFIVvBj5WnR95qO8yK3FV4uWlOCKUWCbBcq/zMmB1g6L
         CYEyPbSC6kTPsoN0+6d27VtpHsQPJUOxKEiVjXqN+/6Lku7RUd9q4oOlkDdGSWyKwbkw
         HtEpylTzkKVcTaSTTCqFxDcBr5dK4Pu1BdfaDfJ18wYibhiVEo5+DevsVJV8VpMCWL5v
         t0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728892960; x=1729497760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RlZOlgSupAxgWagLLro/53S7NCRTENxGSsZn/UbRdU=;
        b=TNa24/yVVCZMrGkVQa6UVQanaX1hcuVlgpufxSHVJ3ebqSdhzUeMjjC+f9asZtNh/l
         +RetiPPXm8d7/250I18QI+ZatQcA9L+izdwdGVxLrn8gGS1R298FchHiSnBsOglYWlpz
         jkUxBGI7saJsV5G2gbKiI81oQUvfITJbgTLViaT2IE7SNV3hBPlEH7+SZqP0ct1XM3Vu
         vjVFEQOklVlqFHB7mXv3D0l3DbK8sKKzroQF+DnM6znzi3gSXjCFVs8IihRqSZ8WbwFY
         hOhg2j97oYHCD29EaYHCh3o0/DEqyKlywJ+omAlO8EWXhfOH0Iwp6gerWmKebBbueGsq
         86Dw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Q1lWm16W1o2uU4ycteHpCCr4PlBP/kyXTKlrA7kwK6xFiHI9IAalBJ0DECRo47Y3lPmptYsRDh34y1zWwUCDtXScVA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwQrlV91efhDtbO4JzzF+ZummJEiRgeCe6vm1yK6wmdbiD6FTBz
	FVc/oQWZzJvZTJpgh16Mx2qY1S76+NJsHxH2+K/G5gmXCiv3csIfS1/CC/16sjA=
X-Google-Smtp-Source: AGHT+IGHI1oWFXV9DcSfHKsT0K9KY6FX9DQ9bVpIzkaaGAOafugiZ3ojqGus5aCjg1CPitlaHNm9Qg==
X-Received: by 2002:a5d:688b:0:b0:37d:462a:9bc6 with SMTP id ffacd0b85a97d-37d552fd82dmr7764949f8f.36.1728892959854;
        Mon, 14 Oct 2024 01:02:39 -0700 (PDT)
Received: from localhost (p509151f9.dip0.t-ipconnect.de. [80.145.81.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fe7csm10751841f8f.70.2024.10.14.01.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:02:39 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:02:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Mehdi Djait <mehdi.djait@bootlin.com>, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v10 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <zlgxam2ph67gbxaf64tznc6gaediik5vzfus3kgbanu6ke4vxs@6emuicykaike>
References: <20241008030341.329241-1-lanzano.alex@gmail.com>
 <20241008030341.329241-3-lanzano.alex@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nfdjdy6igf2fhtdw"
Content-Disposition: inline
In-Reply-To: <20241008030341.329241-3-lanzano.alex@gmail.com>


--nfdjdy6igf2fhtdw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 2/2] drm/tiny: Add driver for Sharp Memory LCD
MIME-Version: 1.0

Hello,

On Mon, Oct 07, 2024 at 11:03:11PM -0400, Alex Lanzano wrote:
> Add support for the monochrome Sharp Memory LCDs.
>=20
> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The pwm bits look ok now.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--nfdjdy6igf2fhtdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcM0BsACgkQj4D7WH0S
/k5wWQf9FfmMItjVRgRZH9tOPUX8zANyqph7Rsnz7icv4muLFmBRJDz3p4s02Ifw
vnjzp3F3ONPAom9POqZn5akcxHl+98+LD9D/fX4eKwdQVxYZsPlFi72VcoQ1Bree
tIfmZxTDoP0HWpqDB4zDyVbvRlnYgtPHteFddN4vCa81Ua0K5zOqgl1lqTyen/FX
XfhKS3GGBml9wTgjQ31Us0EXkQaELjXwURwCRobwCRiEm5j5bJ5o7juVymoKwLSc
c07MB/X1DR7G0Z2CegTx88SCcpBq/wd68vzn5bn8fbf+JoMvJ3YGp1j9pdjyJpQK
RRVObhQN7P7/nIVqvo8XhmUk3Rf2Yg==
=IozP
-----END PGP SIGNATURE-----

--nfdjdy6igf2fhtdw--
