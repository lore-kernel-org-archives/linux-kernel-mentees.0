Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB6C2F37
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 29 May 2025 01:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748481654; cv=none; b=oq2qL6+KB6UptdnaigV5J+4PbCCh9ybiDorwPq9Sy1EWBrfRoCltzUx1YhJa0dmwOb7hEAThfVQRqFX7wPxALpDFYO+CNXPYsXCSiKZyM6tB8FK4WQajTiJnzvZLWgzGxdNNjjjkjEcF8Gkz672NszXimdwi11Mu9DqZZMtLjIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748481654; c=relaxed/simple;
	bh=3OK0VxEb+VLLMAFdOrUGLFNoNozrgMg19aZDk5v7nDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVWEPg3M6/Iag4p9KzykkWCtsYE96f95MnGyRe0GV263TP88oa4YHMZyEznFRhQ2bkzzprqjLbeebhSLkmBI94Cw3DxVXCGrpJmu33eGEXDBABRFkwb5unBC8N4uoN4v6QCDPKqo9IS1WkHh1Jm2CKJTyYfdSaXIhJ23wc9XkoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIUPgM2S; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIUPgM2S"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b2c40a7ca6eso437054a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 28 May 2025 18:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748481652; x=1749086452; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y0+2QuQx+ehz4K9bJJ84ML9CjshKIYtlcF+IayumVjM=;
        b=FIUPgM2SH3nv+M1oasrreqeIeFnB4scY+ywRwDu3tgfOgnZz31sXT1PPOxqdFi68lQ
         Sxeu0n0aiFAJ7mizSCOmz12Tg+G2QhcmRj4A1JOq+gH7xUicRJC5iYhVY7CFUEwkWdiD
         i6Mqi/Amtj24oxzGN0BjPM2iqZOdCpgLxg8krUGojOM/LKyDwCPhqxC/hC0T2xq9xREz
         YtgoPD4iDiZkp4fTVQctT6QschNW1BTgqNK09ae02PYUJOdK8g6ZeoI8BtxYRxhRbYKI
         LOiJ7AFyZwicftvSmOZTLdO0I4b2JwvGC+Bw1Pdw62+vUEXT7umGne6oHpctSbiJeRdS
         iQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748481652; x=1749086452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0+2QuQx+ehz4K9bJJ84ML9CjshKIYtlcF+IayumVjM=;
        b=Wm3hhaAlmbbo2TB+YzXEjZpN4RMoDnvIvV+R1w9UdvF/tehhnk6hWjG5bMqFOftOP6
         KsjesYaJgssC1kPkOrLJoY/hkuzrImLPsSDhBQaeyFWMGx8HU2YnX5zvhYKFEASiAJvX
         dRVEenoy1gj+OKHUS/1xpLSCLtLknlHvLgeKNZ5Y4VIKBfNH2Z1ry3PuYTxG21x9otGE
         2yA3D/iEFUPaOt1DYMUveW0+cLhfGoTtQFA5ATsp6+HQCTczcSsXwgcC7Vzt/XNSDT7H
         Yd5/FzXPQKL1WLH1vE7kQUHZ8BfYaMJZIf4xcpdmGKNCigxJ5hvzn0tEyACvKNv2FZs7
         r6Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVBgS2zyEq0KBOesslS6UlW/uRxHmDLAFB4a4RJYyexsMOa/bCR27YYdEVCOrl7hKtFlXkXVSvilv/NyjHhJjZDiufaXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoQw7zf1nN1Ujt6M83T18nyYbTcrXTab3VpbRTzqmDEn+lCiWr
	xaj0k9nvQUvmJfoiv0OhVjJ0bAkzVKjlUZK5kTSAGz7S9UleWoTp+fujcC+uuw==
X-Gm-Gg: ASbGncuMEhmmcqNXnNyHPrEp8NJJ2MMQDk3BgCixTe7CRx1g1KTbrbfqKj6UKSVI5Mm
	N94ETFdCjA5ZmK98637hm5Zc2AV+URkoXkW2+7vKudmYGjAQIF/zo9smy/r/2bzWrBNVRdtr2ku
	aC1a8qv21nRlOg8r6AYqVeTo2aIoLQxOSnBMHx5/59yjpZ03f034hz9wtkwClnh97tSPAld5TdH
	ltl/cwjpHqBZ2Cbqd5PDS2B6aac/nYG+t4yDst0+1TlwHO+drikVmsW4EetKk15JA3KbRGGCZTy
	vmIBVspKB0VCbY8cYuXDwCepKu1V/3u1P134o38iSmGuDKIkiRs=
X-Google-Smtp-Source: AGHT+IGpXSSNw5tDig6jalJ6b4bhI3tDTgUvpr1WwFbPiYU4ovoIe4S/MayssORVh28ZBDmQUKt5Kw==
X-Received: by 2002:a17:903:2312:b0:235:5a9:976f with SMTP id d9443c01a7336-235080195f4mr4823515ad.24.1748481652338;
        Wed, 28 May 2025 18:20:52 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc95dasm2150585ad.23.2025.05.28.18.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 18:20:51 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D3D9741E4844; Thu, 29 May 2025 08:20:49 +0700 (WIB)
Date: Thu, 29 May 2025 08:20:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: George Anthony Vernon <contact@gvernon.com>, dmitry.torokhov@gmail.com,
	corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 4/4] input: docs: Make headings compliant w/ guidelines
Message-ID: <aDe2ccCxG8I24gsQ@archie.me>
References: <20250526135957.180254-1-contact@gvernon.com>
 <20250526135957.180254-5-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xF0tG2VH+L8g8DO8"
Content-Disposition: inline
In-Reply-To: <20250526135957.180254-5-contact@gvernon.com>


--xF0tG2VH+L8g8DO8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 02:59:52PM +0100, George Anthony Vernon wrote:
> diff --git a/Documentation/input/devices/amijoy.rst b/Documentation/input=
/devices/amijoy.rst
> index cbc5240f8af3..a81e9de481c7 100644
> --- a/Documentation/input/devices/amijoy.rst
> +++ b/Documentation/input/devices/amijoy.rst
> @@ -1,10 +1,12 @@
> -~~~~~~~~~~~~~~~
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Amiga joysticks
> -~~~~~~~~~~~~~~~
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> +Pinouts
> +=3D=3D=3D=3D=3D=3D=3D
> =20
>  Amiga 4-joystick parallel port extension
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +----------------------------------------
> =20
>  Parallel port pins:
> =20
> @@ -19,8 +21,8 @@ Pin    Meaning  Pin    Meaning
>  19     Gnd1	18     Gnd2
>  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D   =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> =20
> -Amiga digital joystick pinout
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Amiga digital joystick
> +----------------------
> =20
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Pin Meaning
> @@ -36,8 +38,8 @@ Pin Meaning
>  9   Thumb button
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -Amiga mouse pinout
> -~~~~~~~~~~~~~~~~~~
> +Amiga mouse
> +-----------
> =20
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Pin Meaning
> @@ -53,8 +55,8 @@ Pin Meaning
>  9   Right button
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -Amiga analog joystick pinout
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Amiga analog joystick
> +---------------------
> =20
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Pin Meaning
> @@ -70,8 +72,8 @@ Pin Meaning
>  9   Analog Y
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -Amiga lightpen pinout
> -~~~~~~~~~~~~~~~~~~~~~
> +Amiga lightpen
> +--------------
> =20
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Pin Meaning
> @@ -87,7 +89,11 @@ Pin Meaning
>  9   Stylus button
>  =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -------------------------------------------------------------------------=
-------
> +Register addresses
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +JOY0DAT/JOY1DAT
> +---------------
> =20
>  =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  NAME     rev ADDR type chip   Description
> @@ -159,7 +165,8 @@ JOY1DAT   Y7  Y6  Y5  Y4  Y3  Y2  Y1  Y0     X7  X6  =
X5  X4  X3  X2  X1  X0
>           | Right      |  4   | X1                              |
>           +------------+------+---------------------------------+
> =20
> -------------------------------------------------------------------------=
-------
> +JOYTEST
> +-------
> =20
>  =3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>  NAME      rev ADDR type chip    Description
> @@ -176,7 +183,8 @@ JOYTEST       036   W   Denise  Write to all 4  joyst=
ick-mouse counters at once.
>    JOYxDAT  Y7  Y6  Y5  Y4  Y3  Y2  xx  xx     X7  X6  X5  X4  X3  X2  xx=
  xx
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=
=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=
 =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D
> =20
> -------------------------------------------------------------------------=
-------
> +POT0DAT/POT1DAT
> +---------------
> =20
>  =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  NAME    rev ADDR type chip   Description
> @@ -217,7 +225,8 @@ POT1DAT  h  014   R   Paula  Pot counter data right p=
air (vert., horiz.)
>           the counters will count proportionally faster.
>           This should be noted when doing variable beam displays.
> =20
> -------------------------------------------------------------------------=
-------
> +POTGO
> +-----
> =20
>  =3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  NAME   rev ADDR type chip   Description
> @@ -226,7 +235,8 @@ POTGO      034   W   Paula  Pot port (4 bit) bi-direc=
tion and data, and pot
>  			    counter start.
>  =3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -------------------------------------------------------------------------=
-------
> +POTINP
> +------
> =20
>  =3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  NAME   rev ADDR type chip   Description

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--xF0tG2VH+L8g8DO8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDe2cQAKCRD2uYlJVVFO
o+p5AQDjvhscw1VppovnGOx4e9IlS1aQ/twuA/EprY4nn7POugD/USwRk/E7Vev3
pyd1/PacDAOe+xt+gSvJykXAizoFigM=
=o5E0
-----END PGP SIGNATURE-----

--xF0tG2VH+L8g8DO8--
