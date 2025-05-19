Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E6E6A33B
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 May 2025 01:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747617868; cv=none; b=uemPUsD5aMvh+4BkAOcEYWLKcY6IEI6oVYVoE38IC+qd/Va8+lKdgZINY5wA81gjY4wRpPE9ZgK4S6EJx1KQltRSUshSH5wpYCS+xzA2GTlQaL1/lgRdoIhMQmBhsrRTN5ll4i7E93USoanK4erhXjITlNyB5WfIJdLEYelp+Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747617868; c=relaxed/simple;
	bh=0Mn907apcqk4ftoWhNEr8s8u2ajYUpJbiKUPrJnj5VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhmsyGD9Am/glGb+Fi0NrS6c3nLkP5S0jIqH/SD9JCP6abssSIABUSqx9gd0cRm5rNjpyvido/S7lZxTDCN91c90f60rO9TCZGM+ZPIDkezYEAqp2CmWhFyEykbb/1inrXOTJiO/rp7o6BduBMdofXIWeBtz7ZmzcaUDHs9ww5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOlp3RTC; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOlp3RTC"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso3907909b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 18 May 2025 18:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747617866; x=1748222666; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qb7uwEjaTjw03L+H0ygK9UsMO/p5h9HkBJdLou1UQ6A=;
        b=jOlp3RTC2s8OYUg7P63zEi2X84Wlr0KRMrJ4bhPZHFrZS9S3rlMebUFNtzdc7CT/s+
         KedBLqIASWecrcCA0bmhpgxXjXIaVMnM5g/cV4cOPL2dEahJJ8LzRsN11YYkGEZo4Udc
         t1DYRXMzTddR8MtiYptQCtqlTOurazoHkbPE1KjZbLHdM57PzobXhOuQvaJjXS3mLILt
         UnEQ3j5CBrGakavsEZlKd6jHRe4+vrVsQ69qbDQKA+T34DkXKSOedRWh1Cgbg1RZlag6
         51M2WwB6csoNmd92wVII1+OB5RXavaHz6+SQN2FpSaqGNhx1ga6UtQ6R5ajIw06N40z9
         Elww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747617866; x=1748222666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qb7uwEjaTjw03L+H0ygK9UsMO/p5h9HkBJdLou1UQ6A=;
        b=AcqJnx1B2LNEofCEbbx4d6PAkzXaPgw3cGxU54HgBpzhUmlhc/wEl8uzs7L+62aZH9
         CchBifmQsdMV3wzhwz3G6c932iFDvQXRWsZKZZ6Qvnv7c17Suiz7QZvwO+aCWH0WG7GW
         hyJRvGK+9dzOV3Yu5C3peEl2PegGsJSZ8wkECJwbAKtKBU2pCWazcxUDIHcTqIFogp7i
         6lsZzF4w+Wagxvehah5+nB91Wqt7WiAefkZ9BAWp9mx1S8pb4DzmsbkrdhSSat54ntIG
         09hQ1uUK1eSni0GLp98vMtnIyLMo4fQph4azOYg+nnIJmf9uCxtFBT+qek3RuJfl1Ob1
         IA/w==
X-Forwarded-Encrypted: i=1; AJvYcCXgRxN3dGp7AaSgM/P0pFURgCVqtNs13oRCEIrBUKXRWYIfSQNiW5oirKDIWTd0TK6BkO0pYtL8SvJosKfDm7elbTQzmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbHB0rK0W0gedHQjw3DkWDt7ENE2m40V1tQzBi3lbhwLD2xDFa
	X7JH8q21e8CeHfX2IrPDBb9zS4DcA1LpYLXEiJcqXHkl6ElU5PyjtVzt
X-Gm-Gg: ASbGncsRrkqzCbEVwEs+t4y2qZxcmzVxRTciU2wkmmtSN8Xgv0OomAzc6AxbPxYEL8V
	J1cmc2aAbbatmUXx27iuzTmhwEDZErDk/B7tw2aKH6v6IcGbTpNyIFTn+QlVeq9aejL+2uMevG+
	1y2fNB85znstJC+BYVy2LeK4onvvZKtPy6OKQa3piHAdv8jx6jXtRVmDVPE/gPH2mz5hA0UnUlv
	7/ZadgbAzQjxk8iDGwdqoGAAuzA2QW7y70T68wMSgkpxQnRFSNyITt3QgC076T5JB/aGGBD8w5t
	muk/cNJN9dG9bD4PXnKG0vVdDwtotb0BImQ3qPZoABn36yczWSI=
X-Google-Smtp-Source: AGHT+IESt+JW3EmmZPX7JFCGdF4Y2iqQAYLZIpyJtPr2h5uP+J/IaSvOxp0AYEtOnIaJ31Fi/Xc4qA==
X-Received: by 2002:a05:6a21:3384:b0:1f5:769a:a4bf with SMTP id adf61e73a8af0-21621a23f5fmr18441528637.36.1747617865723;
        Sun, 18 May 2025 18:24:25 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a314esm5060446b3a.165.2025.05.18.18.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:24:24 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 756274208F51; Mon, 19 May 2025 08:24:21 +0700 (WIB)
Date: Mon, 19 May 2025 08:24:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca,
	saeedm@nvidia.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 4/4] docs: Fix typos, improve grammar in Userspace API
Message-ID: <aCqIRTkUW6y7UiZH@archie.me>
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-4-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C27Db6pMBwsXho4s"
Content-Disposition: inline
In-Reply-To: <20250517132711.117618-4-hannelotta@gmail.com>


--C27Db6pMBwsXho4s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 04:27:11PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=C3=
=A4 wrote:
> diff --git a/Documentation/userspace-api/sysfs-platform_profile.rst b/Doc=
umentation/userspace-api/sysfs-platform_profile.rst
> index 7f013356118a..6613e188242a 100644
> --- a/Documentation/userspace-api/sysfs-platform_profile.rst
> +++ b/Documentation/userspace-api/sysfs-platform_profile.rst
> @@ -18,9 +18,9 @@ API for selecting the platform profile of these automat=
ic mechanisms.
>  Note that this API is only for selecting the platform profile, it is
>  NOT a goal of this API to allow monitoring the resulting performance
>  characteristics. Monitoring performance is best done with device/vendor
> -specific tools such as e.g. turbostat.
> +specific tools, e.g. turbostat.
> =20
> -Specifically when selecting a high performance profile the actual achiev=
ed
> +Specifically, when selecting a high performance profile the actual achie=
ved
>  performance may be limited by various factors such as: the heat generated
>  by other components, room temperature, free air flow at the bottom of a
>  laptop, etc. It is explicitly NOT a goal of this API to let userspace kn=
ow
> @@ -44,7 +44,7 @@ added. Drivers which wish to introduce new profile name=
s must:
>  "Custom" profile support
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  The platform_profile class also supports profiles advertising a "custom"
> -profile. This is intended to be set by drivers when the setttings in the
> +profile. This is intended to be set by drivers when the settings in the
>  driver have been modified in a way that a standard profile doesn't repre=
sent
>  the current state.
> =20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--C27Db6pMBwsXho4s
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaCqIRQAKCRD2uYlJVVFO
o6oRAQCch6ZyjQnZ+Ta0fpLCTrdGb9XDfOXLHyqm9LKjTOJqAAD/T0uDMjeMhCoN
+ThzRnw2EF3ot8Nzqi3EzdqC+4IQcQM=
=bDnk
-----END PGP SIGNATURE-----

--C27Db6pMBwsXho4s--
