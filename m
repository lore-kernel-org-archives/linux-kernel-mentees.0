Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AAD7DA8C
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 06:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747980220; cv=none; b=kCnlJeq5dVZUsVg6QM4rhdcjKWUkH0ICcAZ73hI/YdFmLayul5GhmS+L4A2BJpi4gqcJK6DReR9LCA7ryapmvNgCJVD46xwB21qEdJR3mUeOO5ciOrRBxiJEG/0Tox3Cbma0xYsn1vpqRkSsTz0ws8Bh1LkJXT0cx4GH1/PRvxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747980220; c=relaxed/simple;
	bh=I5qguV0L/tA+Xwh2AMUys0D4J77U+VviyWoODICSkD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozdBIt+JxiwiR9b5EDW+vC6i/rUvZ4Q1ZPvPT7djtiIZwgn4l/Dt1yI9Hh4l4KBeC9xq1IFn+Esq//K407C7Gvybl9jsKR2b8i2CBaBlvWjlEjJG/wWFZ8g5CpQknYmBXy7lHZl/2NXceyecyybItXum5kVvoGSl8BptAqTGJVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYwOhEmr; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYwOhEmr"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c7a52e97so4921416b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 23:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747980218; x=1748585018; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S/coq0/Ft/GqaFo4CSoc7RYMxYKYlx891WXrsKT4Ajk=;
        b=jYwOhEmrtcH1kOPKecnuYJ3cTCuDeAR/Zd1DvDfLeu9eNCYWwIrur913pe8QsCTAOY
         cwv2GHw/G+GRs7Mx7TfpuzGZIjqad3vyT/E9ue3Q0h/rP1YbBXVgvF5hV88IGTIeENgL
         GxL6rqRDHo7DcjzoNKfIIOsigtxsN+pUvu/pw+ivxVa4FrPuVTjJ8T0B/ky5U958pI55
         Z0++Iedi7L3h1JFtx6UzcpQN/zzeRndUUzv5HC1k07D0Hsim1jwAmFObYzwC7d3ICIZS
         rlrEQ+Ex+6aoL/cW+Qevpf+Ru5rjaFg03NW5goqH1hOIchNKlkxFmvSexMnClvxDlsHr
         dlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747980218; x=1748585018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/coq0/Ft/GqaFo4CSoc7RYMxYKYlx891WXrsKT4Ajk=;
        b=acfUsRJ3xBKJhvPnavXrJybTvZFES//rTKYWT0NqC9kc0pusgq7/gnfd5z1B5OcFRU
         cm5221NIBFxyGuSWTh+wMOc8ioq/dLuV91FN+0Rus3W1qyIsWCQEnGz0Ink+MYw0w030
         c2sNkqdK9FQ1krHkg13WvupTOPsu2uHp0C3TMAk1KoZnOSpv23o3M9UudIbz9IeO18Te
         FZMMzbdHlQumvJVoVPrDC3tGO0uG/0Pcjjf16X2649RmTA5IkaRH1zh/xPRMIaAAjwEm
         lE0DXgXiQC/aiSHKbWi16r/sS3pHk1psFNxmrC/j0m693XADku0SUxTL0SsTTW4PkgDx
         jrxg==
X-Forwarded-Encrypted: i=1; AJvYcCWEC243g7REvRDnaqQgwyqUu9mca12tbNibZPQgPd+jo55y5CN4zXdPar2vZX3HSIDF+pVTuiij1v3+0hwPo8ED2RJGOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3+TD5WtPYwdaSsVovudK188pE+cGQOZdIOAN+BfWbys8xlu72
	NsVKDjXLiX0OLb2V+uasaesoGU6BvkGMz4rVZ2n8yJdcs/7G+b3MTeqT
X-Gm-Gg: ASbGncsJHgWald5PBa6fkwxVFRKVcIorvV8HcAHECHanlwsh8gDoKkmyopji6hHEBDW
	1T11/0/kgoxszEbj5JXKmF4HWoDv4CSOW3n1UXJXEbqoCc3HbXyEHMvm3LneGCIv3xFJ2fyH3Xk
	rpl24o6WgIUUcWnLFHD5gzLaPxitOc8zyu+Y04nTGFynY/boimAMl0GerfFls2A8TwOqORehGB8
	eSyKsP37U2jwimlmyI0s6Ilau7/Z6BGbPjPmezweRG6fBjomaXj76YOHCsh1Mo3b07jFV/9oq1Z
	sqHJxDYoV9+n0e9m1v58lHRMXp9uFVjpWqCfLKnslvi86gDSIIw=
X-Google-Smtp-Source: AGHT+IFIJEFHoKjH5yEQALdGWxi4lQlcAObqnu0RIN3kI9jd1GsqNKPY/0Iv6JATgsNYZY/FOEa9Bg==
X-Received: by 2002:a05:6a00:66d8:b0:740:9d6b:db1a with SMTP id d2e1a72fcca58-742acd507ccmr32710267b3a.15.1747980217570;
        Thu, 22 May 2025 23:03:37 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742adad3d7fsm12247963b3a.15.2025.05.22.23.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 23:03:36 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id BBFF942439C3; Fri, 23 May 2025 13:03:34 +0700 (WIB)
Date: Fri, 23 May 2025 13:03:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com, hljunggr@cisco.com,
	dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com, corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	W_Armin@gmx.de, mpearson-lenovo@squebb.ca,
	skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 2/4] docs: Improve grammar, formatting in Video4Linux
Message-ID: <aDAPtpE-5mkZ6P9y@archie.me>
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-2-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BsexJJInFepDDmfr"
Content-Disposition: inline
In-Reply-To: <20250522115255.137450-2-hannelotta@gmail.com>


--BsexJJInFepDDmfr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 02:52:53PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=C3=
=A4 wrote:
> diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documenta=
tion/userspace-api/media/v4l/biblio.rst
> index 35674eeae20d..856acf6a890c 100644
> --- a/Documentation/userspace-api/media/v4l/biblio.rst
> +++ b/Documentation/userspace-api/media/v4l/biblio.rst
> @@ -150,7 +150,7 @@ ITU-T.81
>  =3D=3D=3D=3D=3D=3D=3D=3D
> =20
> =20
> -:title:     ITU-T Recommendation T.81 "Information Technology --- Digita=
l Compression and Coding of Continous-Tone Still Images --- Requirements an=
d Guidelines"
> +:title:     ITU-T Recommendation T.81 "Information Technology --- Digita=
l Compression and Coding of Continuous-Tone Still Images --- Requirements a=
nd Guidelines"
> =20
>  :author:    International Telecommunication Union (http://www.itu.int)
> =20
> diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/D=
ocumentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> index 42cdb0a9f786..96e0e85a822c 100644
> --- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
> @@ -48,7 +48,7 @@ capabilities, and they may support :ref:`control` ioctl=
s.
>  The :ref:`video standard <standard>` ioctls provide information vital
>  to program a sliced VBI device, therefore must be supported.
> =20
> -.. _sliced-vbi-format-negotitation:
> +.. _sliced-vbi-format-negotiation:
> =20
>  Sliced VBI Format Negotiation
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> @@ -377,7 +377,7 @@ Sliced VBI Data in MPEG Streams
> =20
>  If a device can produce an MPEG output stream, it may be capable of
>  providing
> -:ref:`negotiated sliced VBI services <sliced-vbi-format-negotitation>`
> +:ref:`negotiated sliced VBI services <sliced-vbi-format-negotiation>`
>  as data embedded in the MPEG stream. Users or applications control this
>  sliced VBI data insertion with the
>  :ref:`V4L2_CID_MPEG_STREAM_VBI_FMT <v4l2-mpeg-stream-vbi-fmt>`
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
> index b6cfc0e823d2..ccd439e9e0e3 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
> @@ -64,17 +64,12 @@ FM_RX Control IDs
>      broadcasts speech. If the transmitter doesn't make this distinction,
>      then it will be set.
> =20
> -``V4L2_CID_TUNE_DEEMPHASIS``
> -    (enum)
> -
> -enum v4l2_deemphasis -
> +``V4L2_CID_TUNE_DEEMPHASIS (enum)``
>      Configures the de-emphasis value for reception. A de-emphasis filter
>      is applied to the broadcast to accentuate the high audio
>      frequencies. Depending on the region, a time constant of either 50
> -    or 75 useconds is used. The enum v4l2_deemphasis defines possible
> -    values for de-emphasis. Here they are:
> -
> -
> +    or 75 microseconds is used. The enum v4l2_deemphasis defines possible
> +    values for de-emphasis. They are:
> =20
>  .. flat-table::
>      :header-rows:  0
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
> index 04c997c9a4c3..cb40cf4cc3ec 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
> @@ -104,7 +104,7 @@ FM_TX Control IDs
> =20
>  ``V4L2_CID_AUDIO_LIMITER_RELEASE_TIME (integer)``
>      Sets the audio deviation limiter feature release time. Unit is in
> -    useconds. Step and range are driver-specific.
> +    microseconds. Step and range are driver-specific.
> =20
>  ``V4L2_CID_AUDIO_LIMITER_DEVIATION (integer)``
>      Configures audio frequency deviation level in Hz. The range and step
> @@ -121,16 +121,16 @@ FM_TX Control IDs
>      range and step are driver-specific.
> =20
>  ``V4L2_CID_AUDIO_COMPRESSION_THRESHOLD (integer)``
> -    Sets the threshold level for audio compression freature. It is a dB
> +    Sets the threshold level for audio compression feature. It is a dB
>      value. The range and step are driver-specific.
> =20
>  ``V4L2_CID_AUDIO_COMPRESSION_ATTACK_TIME (integer)``
> -    Sets the attack time for audio compression feature. It is a useconds
> +    Sets the attack time for audio compression feature. It is a microsec=
onds
>      value. The range and step are driver-specific.
> =20
>  ``V4L2_CID_AUDIO_COMPRESSION_RELEASE_TIME (integer)``
>      Sets the release time for audio compression feature. It is a
> -    useconds value. The range and step are driver-specific.
> +    microseconds value. The range and step are driver-specific.
> =20
>  ``V4L2_CID_PILOT_TONE_ENABLED (boolean)``
>      Enables or disables the pilot tone generation feature.
> @@ -143,17 +143,12 @@ FM_TX Control IDs
>      Configures pilot tone frequency value. Unit is in Hz. The range and
>      step are driver-specific.
> =20
> -``V4L2_CID_TUNE_PREEMPHASIS``
> -    (enum)
> -
> -enum v4l2_preemphasis -
> +``V4L2_CID_TUNE_PREEMPHASIS (enum)``
>      Configures the pre-emphasis value for broadcasting. A pre-emphasis
>      filter is applied to the broadcast to accentuate the high audio
>      frequencies. Depending on the region, a time constant of either 50
> -    or 75 useconds is used. The enum v4l2_preemphasis defines possible
> -    values for pre-emphasis. Here they are:
> -
> -
> +    or 75 microseconds is used. The enum v4l2_preemphasis defines possib=
le
> +    values for pre-emphasis. They are:
> =20
>  .. flat-table::
>      :header-rows:  0
> @@ -166,8 +161,6 @@ enum v4l2_preemphasis -
>      * - ``V4L2_PREEMPHASIS_75_uS``
>        - A pre-emphasis of 75 uS is used.
> =20
> -
> -
>  ``V4L2_CID_TUNE_POWER_LEVEL (integer)``
>      Sets the output power level for signal transmission. Unit is in
>      dBuV. Range and step are driver-specific.
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst b/=
Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
> index 7c3810ff783c..8c03aedcc00e 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
> @@ -6,7 +6,7 @@
>  .. _v4l2-pix-fmt-sgrbg12p:
> =20
>  ************************************************************************=
*******************************************************
> -V4L2_PIX_FMT_SRGGB12P ('pRCC'), V4L2_PIX_FMT_SGRBG12P ('pgCC'), V4L2_PIX=
_FMT_SGBRG12P ('pGCC'), V4L2_PIX_FMT_SBGGR12P ('pBCC'),
> +V4L2_PIX_FMT_SRGGB12P ('pRCC'), V4L2_PIX_FMT_SGRBG12P ('pgCC'), V4L2_PIX=
_FMT_SGBRG12P ('pGCC'), V4L2_PIX_FMT_SBGGR12P ('pBCC')
>  ************************************************************************=
*******************************************************
> =20
> =20
> @@ -20,7 +20,7 @@ Description
>  These four pixel formats are packed raw sRGB / Bayer formats with 12
>  bits per colour. Every two consecutive samples are packed into three
>  bytes. Each of the first two bytes contain the 8 high order bits of
> -the pixels, and the third byte contains the four least significants
> +the pixels, and the third byte contains the four least significant
>  bits of each pixel, in the same order.
> =20
>  Each n-pixel row contains n/2 green samples and n/2 blue or red
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst b/=
Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
> index 3572e42adb22..f4f53d7dbdeb 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
> @@ -24,7 +24,7 @@ These four pixel formats are packed raw sRGB / Bayer fo=
rmats with 14
>  bits per colour. Every four consecutive samples are packed into seven
>  bytes. Each of the first four bytes contain the eight high order bits
>  of the pixels, and the three following bytes contains the six least
> -significants bits of each pixel, in the same order.
> +significant bits of each pixel, in the same order.
> =20
>  Each n-pixel row contains n/2 green samples and n/2 blue or red samples,
>  with alternating green-red and green-blue rows. They are conventionally

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--BsexJJInFepDDmfr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDAPtgAKCRD2uYlJVVFO
o3fvAQDs1BsfrMrlMWjpOY5ChsMQIfp+JDgAINOVN9oM+uxWGwD7BbAp4WJR/sZe
TrbuxSWQRqeAjSaf4X8a6aSlx2lXUAU=
=KaiC
-----END PGP SIGNATURE-----

--BsexJJInFepDDmfr--
