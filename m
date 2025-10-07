Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120632D9ED8
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 11:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759837641; cv=none; b=qKI+I+RxIsdkMjlwrhdGqDs9D5QgGe1OHGD91w4Xil1u6u8plnFo35rJ9WkyO2slsZ7RxI+9zERjKydh3Kb9QtrLyGZdLXzPYKxP/3nkXhlmwyLjt/ju2JhJfioacpssRdahGL97gw5GkkI/aoEL+vJQ7SYg7VwSvhKKqYiu6Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759837641; c=relaxed/simple;
	bh=tHybA+sPs/+b+P0zGrwAATn7fve3huRWbNvhgJc3ask=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQUyHGGUkxW3m59CyyT8h4YEg67g4TETBjsDWD9KJ2WgET7EPfhkvH/CfPEDkrMuxGqGzBYMKmWurHLjof7fMJogPSgZ6tsupeWBEOoDAt/Ygi3SqSzx1SDxTqpzKKqk7j274ppIgbQ8atwdjz2XFElTWlVMgwocDoKIZ2dc4Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaCW6vBq; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaCW6vBq"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-78118e163e5so5633684b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 04:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759837639; x=1760442439; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CpCgxhORN6lEa4s+DNPc1Y/IXSmA220J4nQ7qgIWmeM=;
        b=kaCW6vBqjDqEd6UpzUyp62welMgxBYxq86OqPjTLJlLiPeAZx22A0PP7yLNxVHMyml
         C/txE4IyOZ+hrJh9Ck1maWuFFISoo8cJ8QChNAoRhjtKUiZtBWdagVy5e1vCMsKzCmZs
         5mOjuInjq9+UhQewn7LqL/r9oR1NrLBzg4WufmXibnVb2FiOtwOOCrvGjrlU+go0KQjD
         YSejqqANDpm10Fz2ggTjzt01ILdMTJCz2T8SxepJvJ/AmjgujtxIwllJu1Zw0kBNJaOI
         JHjrDdKTLDmY4/i33+n5n3gypbkPvbRCTyyhedBnp2IIiljuC5qzJVLqQT4cE9+w2BQ/
         t6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759837639; x=1760442439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpCgxhORN6lEa4s+DNPc1Y/IXSmA220J4nQ7qgIWmeM=;
        b=kdH7bWiadx204cqhTW4XkvqIlJtejgcs38WzIMvYrCGym1vy3k3ih7vCl0sJWXrP1R
         HQmoWIjeyK23su4jocbKethv26rI3yAg51nPoYLfRA39ogVcBRoPFMMuHb+wcmRk2Fwz
         ejllr7VcJo3JjYdXU18wyiUkljapnZrFxiLdtwsYjrwtGiGun3058P6ml3a8Ix7LS3BL
         PICBvbsBtG6I7DE/8GR3dew9y/eGPVpYnN1brWi7kUZY8679PBnCkr8SN4/QCBIawuyy
         E8DTA6SR4N2NpaMmzy+3T+kPMREafvKx/AIre+SyuA3vnQV+zc/TMqY2qOza+N28J9/A
         3vEA==
X-Forwarded-Encrypted: i=1; AJvYcCVSJgqDSL4kuOMVB7yoOgD1/hyi0WFA/vOwDC3CzTJW+oKoqRUKCviEsM01Zp+OYXmdA6hLDK+9AdyuCc9SdTESIz3gwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhfa/7scULo2DtTGBB3cWIqf2zrG+KZbCI4tGTOJg1DXlM6Yq2
	iUSYcwWYbrX4OcohCD8MDsCuSuW4n/gyzmgEv6vu16mwqTrqy6Lzdc/2
X-Gm-Gg: ASbGncvmCfFU0qibYeQwIV2rn6Zge6y/Dfkxnj8RkRA03CyKp2GEXtzf+KmmpzfyODZ
	VroRpb/1rlDKS6sJx7rOoDDzlyZLGafE8yZrJNN9aQWCDYU5ou5aGHy7b0YCVPR1EzznF+ermBU
	okA9t5mUl1YCLZJb3Yc24OiKQakGT1p3mC2D+3louKEm1Hz9gFmV1s8S+qebjmCUkKey4RHfZNy
	y6FFFSwgZwXfBx5rEp5MiM2Lz3g6oybJylyncI/lYWaJWc2IwIC1VA+Engl7hTupJzLpc3IhFGM
	VsYiAvbXMkGV7G0KlAj5J4F5Ii/Bq9aL0jpjYFmF6hu/cbFzNW2upCADnTT8LImgQVzsAZUAqFl
	8cRlsuLImBk4fsEVlBBE3DHYpGiqpHDMbP+0P6tlG1epHfqJVQg==
X-Google-Smtp-Source: AGHT+IH44vhk9d17Lw4GXZ5yzA6My6EceoSjc9zLI8SRcAEeP+70+Ts8xj+ACG9aEOYyI9bijbzveA==
X-Received: by 2002:a17:902:ce0a:b0:26b:3cb5:a906 with SMTP id d9443c01a7336-28ec9c97565mr36083695ad.16.1759837639170;
        Tue, 07 Oct 2025 04:47:19 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d12608fsm164155715ad.33.2025.10.07.04.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:47:18 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 865214233431; Tue, 07 Oct 2025 18:47:15 +0700 (WIB)
Date: Tue, 7 Oct 2025 18:47:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Documentation/rtla: fix htmldocs build error by renaming
 common_options.rst
Message-ID: <aOT9wttB8cQvFDdj@archie.me>
References: <20251007083228.17319-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YjlEHS0UDQisqRua"
Content-Disposition: inline
In-Reply-To: <20251007083228.17319-1-krishnagopi487@gmail.com>


--YjlEHS0UDQisqRua
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2025 at 02:02:26PM +0530, Gopi Krishna Menon wrote:
> diff --git a/Documentation/tools/rtla/common_options.rst b/Documentation/=
tools/rtla/common_options.txt
> similarity index 100%
> rename from Documentation/tools/rtla/common_options.rst
> rename to Documentation/tools/rtla/common_options.txt
> diff --git a/Documentation/tools/rtla/rtla-hwnoise.rst b/Documentation/to=
ols/rtla/rtla-hwnoise.rst
> index 3a7163c02ac8..cc2721315552 100644
> --- a/Documentation/tools/rtla/rtla-hwnoise.rst
> +++ b/Documentation/tools/rtla/rtla-hwnoise.rst
> @@ -33,7 +33,7 @@ OPTIONS
> =20
>  .. include:: common_top_options.rst
> =20
> -.. include:: common_options.rst
> +.. include:: common_options.txt
> =20
>  EXAMPLE
>  =3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/tools/rtla/rtla-osnoise-hist.rst b/Documentati=
on/tools/rtla/rtla-osnoise-hist.rst
> index 1fc60ef26106..a11c485f127a 100644
> --- a/Documentation/tools/rtla/rtla-osnoise-hist.rst
> +++ b/Documentation/tools/rtla/rtla-osnoise-hist.rst
> @@ -28,7 +28,7 @@ OPTIONS
> =20
>  .. include:: common_hist_options.rst
> =20
> -.. include:: common_options.rst
> +.. include:: common_options.txt

For consistency, though, you may want (in separate patches) also rename
other common_*.rst files.

> =20
>  EXAMPLE
>  =3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/tools/rtla/rtla-osnoise-top.rst b/Documentatio=
n/tools/rtla/rtla-osnoise-top.rst
> index b1cbd7bcd4ae..c7bc716b2899 100644
> --- a/Documentation/tools/rtla/rtla-osnoise-top.rst
> +++ b/Documentation/tools/rtla/rtla-osnoise-top.rst
> @@ -30,7 +30,7 @@ OPTIONS
> =20
>  .. include:: common_top_options.rst
> =20
> -.. include:: common_options.rst
> +.. include:: common_options.txt
> =20
>  EXAMPLE
>  =3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentat=
ion/tools/rtla/rtla-timerlat-hist.rst
> index 4923a362129b..547dfc7ace58 100644
> --- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
> +++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
> @@ -29,7 +29,7 @@ OPTIONS
> =20
>  .. include:: common_hist_options.rst
> =20
> -.. include:: common_options.rst
> +.. include:: common_options.txt
> =20
>  .. include:: common_timerlat_aa.rst
> =20
> diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentati=
on/tools/rtla/rtla-timerlat-top.rst
> index 50968cdd2095..3740fd386ea8 100644
> --- a/Documentation/tools/rtla/rtla-timerlat-top.rst
> +++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
> @@ -30,7 +30,7 @@ OPTIONS
> =20
>  .. include:: common_top_options.rst
> =20
> -.. include:: common_options.rst
> +.. include:: common_options.txt
> =20
>  .. include:: common_timerlat_aa.rst
> =20

For this patch's scope, LGTM.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--YjlEHS0UDQisqRua
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOT9uwAKCRD2uYlJVVFO
o26DAPwO4e7EjANEwcmc6zau/qLSOmqV1xhe8ihZQO2SN2a7QgEA2X3LzAtWqe1I
Kid1Ufu3MBRc5B/abDTix3q8NM7L6Q8=
=FDcR
-----END PGP SIGNATURE-----

--YjlEHS0UDQisqRua--
