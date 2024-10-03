Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F3D13DDA7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 09:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727947673; cv=none; b=iunNQQZHrcENBLJlXmAcBxflnyCAkd7M8knVFDXXDT3tcF7M0ITGICcxkpZ7hdjkke53M0/F/TI4G9x+GY4ooeUANjclmjxtY8va+1xCRzCzCq9E1403qwdHWMAVCPOXRO35GRjfuSJkWOkLsCHVnRQ0ippqwlU4PB6Cuq0AZOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727947673; c=relaxed/simple;
	bh=uXkA1kXEXhP7MvBmfvAhSdLcx27NcgjN9m+rUt+dGzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYGm1W7KrSgYNUioz8d3eAq8xEsMzEhMBrYKgZKlNmxhnGab7+jX71xrbXZWkpg+0kJ49l1oDqw9lMqiAh5Hqpn+rxIA+kKCvVkKJoZNaFrSXy82PdZZlONnLDgytGbj74s4dJqSP2kqwnVVJerl1ddR8qDOwxVT+g79IPzNG5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Hoy1yVvT; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Hoy1yVvT"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20B0140147
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 09:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_XRHeGrowjL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Oct 2024 09:27:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=ukleinek@baylibre.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83D374013C
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=baylibre.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83D374013C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Hoy1yVvT
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 83D374013C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 09:27:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37ccf0c0376so507667f8f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 03 Oct 2024 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727947667; x=1728552467; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8evBbk/IwxxgJLl6adf7U2FK+xKf3XGZPnSLuIWsvAs=;
        b=Hoy1yVvTXe3quPSyusD62O8d9vUEQu3wjbMy4cs4sz/MIaG6OPpb2lWOR3VKTHfps6
         1R/FaUXvFfCUAJlp2DV8YC1pmP2Pz+HXncA8VgmL8QNSIcBfolQvBb//Se5uw2GyH1Vi
         VaTx44YkfE5tQHUdoGNmis0AYnVR8WX9hUNWU0yZ4TSvx6clvUw44P3KNngVbcwdNsAv
         oeiNYsqXk7E9cAjcAePe5Y85P9xRFkvyZYM1g1dLOstqd6b1+E1pXnHRji0dxpiU8rNa
         8cg8Xp6HzVUpQz00H0I2FtZXuPt0Viz0tgSh+HASbhLrBk5oAER5OcaoU9PNGtaBbHt6
         /4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727947667; x=1728552467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8evBbk/IwxxgJLl6adf7U2FK+xKf3XGZPnSLuIWsvAs=;
        b=neRmKMezvXQWqh1PLDfjHm2R6yBFqc01n38uFppmrI+Zr3AocquWUHM98oAzWmvs+3
         8qRDs+vqAR6gDk6DYV4ZKjsPIXydphRqAlxHU3bNOuLDJDIr1hmHHiwf9L/pQBttXkWc
         kcr/y0x+PaXrReaiMpiXDUDlRf71vYDmkrAfKNMV7gMdJuq7hunP9xgHUOMWHnNsE9Tu
         ktnv1DzeIaguRNw8fAy56W4dMX0yS2btm0cTTjwhEpqqfpbYWwN7XzcaA0UuLwlSmEYB
         V5DjMj5vBH1GrreCYPCL5g5pe19XWHanBJfIGuenqlNGgjkr2e7ihD9YF/BIMP83hZGR
         eCeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNp97GQ4NjiQV7TKr3eFRF04y5rY9ndWe8ck+pAOJM9ebSMUOtt9hIgexdHkhTnEieEy+rRQC674eYPnj5fwTpjqLTtQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzt/2c/UYqe1loHfgaRB7idzwWsi2JC5Hn8ell9VpX1239Nt8t3
	5pjZZKFFmF9CaKXhnIV1TmJW4TFpiq03HRgOlEMxZxQRI6NsH5K+W7ZEJL55il4=
X-Google-Smtp-Source: AGHT+IHekoCrEouitVYfb8Yy3HlP99xd5ZykhItjucwYVLFSB9uXwVt08HFWHlBeglYtqaJQ2Pm8Mg==
X-Received: by 2002:a5d:4a90:0:b0:37c:d344:8b42 with SMTP id ffacd0b85a97d-37cfb8b2ec0mr3807558f8f.15.1727947666441;
        Thu, 03 Oct 2024 02:27:46 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d08242d79sm847425f8f.51.2024.10.03.02.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 02:27:45 -0700 (PDT)
Date: Thu, 3 Oct 2024 11:27:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Mehdi Djait <mehdi.djait@bootlin.com>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 0/2] Add driver for Sharp Memory LCD
Message-ID: <q53inyaxyvfib7okxzazepxzarqmq4rubbasumvvx2woioyp42@fbtn4poujsyh>
References: <20241002033807.682177-1-lanzano.alex@gmail.com>
 <t4lefcykpoe5i36wb4x5u23sseh6drnphtivuqc3mjviat2vvc@7hg4jyhxvpye>
 <ees3m2qmazah2547ys62zvbrvo4dsgki2z2jwulwz4dfjtm4hk@kpmlapv6occv>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s5o77kb33dofvcnw"
Content-Disposition: inline
In-Reply-To: <ees3m2qmazah2547ys62zvbrvo4dsgki2z2jwulwz4dfjtm4hk@kpmlapv6occv>


--s5o77kb33dofvcnw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alex,

On Wed, Oct 02, 2024 at 10:33:13PM -0400, Alex Lanzano wrote:
> On Wed, Oct 02, 2024 at 09:56:38AM GMT, Uwe Kleine-K=F6nig wrote:
> > On Tue, Oct 01, 2024 at 11:37:35PM -0400, Alex Lanzano wrote:
> > > Changes in v8:
> > > - Addressed review comments from Uwe
> > >     - Replace pwm_get_state with pwm_init_state
> > >     - Use pwm_set_relative_duty_cycle instead of manually setting per=
iod and duty cycle
> >=20
> > You didn't explicitly mention that it's fine if the PWM doesn't emit the
> > inactive state when you call pwm_disable(). You're code should continue
> > to work if you drop all calls to pwm_disable().
> >=20
> > Ideally you mention that in a code comment to make others reading your
> > code understand that.
>=20
> Sorry about that! The intent of the code is to stop the pwm from outputing
> when the display is disabled since the signal is no longer needed. If
> it's best to emit the inactive state rather than calling pwm_disable()
> I'm fine with making that change.

Calling pwm_disable() is best iff you don't care about the output any
more. If however you rely on it to emit the inactive level,
pwm_disable() is wrong. I don't know enough about your display to judge
=66rom here.

The code to disable the display looks (simplified) as follows:

	if (smd->enable_gpio)
		gpiod_set_value(smd->enable_gpio, 0);

	pwm_disable(smd->pwm_vcom_signal);

so maybe the logic you need is:

	if (smd->enable_gpio) {
		gpiod_set_value(smd->enable_gpio, 0);

		/*
		 * In the presence of a GPIO to disable the display the
		 * behaviour of the PWM doesn't matter and we can
		 * just disable it.
		 */
		pwm_disable(smd->pwm_vcom_signal);
	} else {
		struct pwm_state state;

		/*
		 * However without a GPIO driving the display's output
		 * enable pin the PWM must emit the inactive level,
		 * which isn't guaranteed when calling pwm_disable(), so
		 * configure it for duty_cycle =3D 0.
		 */
		 pwm_init_state(smd->pwm_vcom_signal, &state);
		 state.duty_cycle =3D 0;
		 state.enabled =3D true;
		 pwm_apply_might_sleep(smd->pwm_vcom_signal, &state);
	}

?

Best regards
Uwe

--s5o77kb33dofvcnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb+Y40ACgkQj4D7WH0S
/k6Jjwf/VkhVbrj5zZduvEjBR6Ryq5075XnahyFTpoqckqRcE+V8H/OzEfaT7fsA
VAT9CFZPEfJ02N0jj2m4V82vzDlwk8m9Tiw0b8m5eFB3NeJLpKUh4Fi4Np3Lp5AK
jIiCwhOEUY6Iw1bWsW2qj66Cism13MQ0tUlq43y7lxHNI/RzrysnZxYFX0FGCfkg
PDQp7WW3JWJF3uH4yr1Mycw1gSzd0ECUG0/VG4rwiqc+jr7H2FYU3tcnVZgNPsD4
Na680Wj75PWN6l5SYDEj04196IvNGz2psPJqxpaWwrtHquBLYQ/MvNXJ3XX21PnV
k4ppnw4FCPFAuN7nTlta4MWjKi66gA==
=YxME
-----END PGP SIGNATURE-----

--s5o77kb33dofvcnw--
