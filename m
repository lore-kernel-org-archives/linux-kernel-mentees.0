Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F74487BF
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 May 2025 01:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747618499; cv=none; b=nd5MRfJuqGkHM3efYUbh5rvVT4Yd2BAKVcjy7H5Xzr2OBF1AdCMavACjqeWraXW1dyvfa2wFm7FLDmaIwhCYEFgtNBN1Q3Rnxgx7rAgekVqRPiYiGsKOT19H5d93KmvGtTEDNciuy8e4FO/Xn9M10byD1UGUqiupOd+jA1STnD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747618499; c=relaxed/simple;
	bh=+cK1q0ymnUg/mHJDwYZoJnetGH2PBSkc9JbbkxO0spo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/p05SDl4FKZFVJtNzCYukQEtHg88VW4n1Jvyj4XU5HTRJoHN2LR8elMR+39ztmv+AeZljuiTHQzbpAoc5CQzGaZJF/62qfh4jzWPxIL85tZav9dAwsiJDJrQrDTUbe0J/OWF5ckSMChPoW0chf8T/1U4SJh/3bWnl3un7HUyhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQC+NFBk; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQC+NFBk"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b26f67f10ddso1468415a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 18 May 2025 18:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747618497; x=1748223297; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YJw3m5koFrpNVxPypmc74Te20NLAMcYM0zAmtYxiHlU=;
        b=hQC+NFBkv0GqHcdvcU5Qnw92R7sQj9aeTOtE4FFApne6M8fFM9GngscHkuGH+D1emr
         0cDxquHPessz/izC/K+t1JTifBmXemEOd95YnqvP/dMaKgwJ25qYfOA/Y7mEaqmriLVf
         56JQ7mOf7xDiqClNezAPzngv0AAi8sJwG80sfVu+YVNO3Km3wQei/x+O0Wr25jOAnDBG
         VGNSg7vxVGoT8FGWwobHdgCNYYetjrJEY2G++hQ/aSp4l26LvKgLp5ZsMNhNE8qVjgKc
         Tzqleu5gaK0v8mzzvnwt7YQZY0yQzafwsbYcyA2udNEr2JeN7wsuG3jiwrepm1GVIvwZ
         s9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747618497; x=1748223297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJw3m5koFrpNVxPypmc74Te20NLAMcYM0zAmtYxiHlU=;
        b=T6rM3T32z5/Cqdb4fr3R8MrcMSl2qM9zRG7hxbVSpXviGzKuWK8f7+fe9Wg6MWJqfI
         H7pfRfIVLrV2qrE9BC9R0+9MXKh3T20ftyqa5UjTjkHh2InbPjy433A4Om8ofldM93Ao
         hzlUEgSe2NScXo1cdyzHzBOiR49gJKAXk9zJcBiQysQvoS8iYlcy9M1IdZ478WuIreJz
         MR2iui7YoTS2Z/VdL9zRVT1CRk9kZhK3lSImNySz26TyANqwgOc7bljaG8VOsR+Q6gtX
         EYObgrMRvdyQALXp+TusW2vddaJ4TS4zhJY+1G4DrvMtLO7qwYQa8/5jY8afJwX7Ichg
         M15g==
X-Forwarded-Encrypted: i=1; AJvYcCVxaPlEbDDgkitKPaIB1jBHFLQJ2Gx/p86xqQFLUz2g/xBXXSpr+WJ+g37Sg73mFJUWTP7lJsceCK2TsHeSQRQC8RU2Qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmFj0hBXTDVBn4QsPleEDYS859ionH+HE/8LTgJREhWQ6MGS7p
	QXDKCKHd1UQ7H3+c2SOcSAwyrIgiEm3C1LstdPMhuIT62d4Myj6+Ra+W
X-Gm-Gg: ASbGncuPIbWlleW9AmoENMdHaA3mRTQjSkBQsZCQ8KCmYhQEulCV3mV00j9vT0FTbTy
	H5QwXRQ2q445s8DkvIg4U0nASYYhZ9so4pOkbXA/FtMnjRtsgvy5z8Mck4HVGHGzLeNdYc2P3wm
	1jG6ZJJZucbsO/LM/fTavE3TtRwjaKAaD92d0QjcsVS0O65Gy8oJmanCY6g10Akj1mQh88rYc99
	mAmnJskPgV6kNHdwXcpC71OKAExOPijVFL0d15ta1t3Q4cynZBz76Smw/oMmp4nMRRto4X95EE0
	HKzK8Iw/8rYPp2nXgMRYVeGqg1oQMA2SL7n8zX8pgwcVxcYTQ+M=
X-Google-Smtp-Source: AGHT+IG80zWj+sy066RDG0Tz1XDstR2SdNQZ9XXiAM9bjtr3R0IvPNWz6ja1URE6R1Z/l84eHVuryw==
X-Received: by 2002:a17:902:e78b:b0:231:c992:3722 with SMTP id d9443c01a7336-231de35fea0mr138296945ad.16.1747618496578;
        Sun, 18 May 2025 18:34:56 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed5426sm48895085ad.237.2025.05.18.18.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:34:55 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id F2A394208F51; Mon, 19 May 2025 08:34:53 +0700 (WIB)
Date: Mon, 19 May 2025 08:34:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca,
	saeedm@nvidia.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 1/4] docs: Improve grammar in Userspace API/DVB API
Message-ID: <aCqKvd4xJJVEzOar@archie.me>
References: <20250517132711.117618-1-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eTLKgt0aUb0RiHBN"
Content-Disposition: inline
In-Reply-To: <20250517132711.117618-1-hannelotta@gmail.com>


--eTLKgt0aUb0RiHBN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 04:27:08PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=C3=
=A4 wrote:
> diff --git a/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.r=
st b/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
> index 8fb73ee29951..6ac1e5cd50ce 100644
> --- a/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
> +++ b/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
> @@ -26,7 +26,7 @@ Arguments
>      File descriptor returned by :c:func:`open()`.
> =20
>  ``tone``
> -    An integer enumered value described at :c:type:`fe_sec_mini_cmd`.
> +    An integer enumerated value described at :c:type:`fe_sec_mini_cmd`.
> =20
>  Description
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/userspace-api/media/dvb/fe-set-tone.rst b/Docu=
mentation/userspace-api/media/dvb/fe-set-tone.rst
> index 9f44bf946183..a985eec140cf 100644
> --- a/Documentation/userspace-api/media/dvb/fe-set-tone.rst
> +++ b/Documentation/userspace-api/media/dvb/fe-set-tone.rst
> @@ -26,7 +26,7 @@ Arguments
>      File descriptor returned by :c:func:`open()`.
> =20
>  ``tone``
> -    an integer enumered value described at :c:type:`fe_sec_tone_mode`
> +    An integer enumerated value described at :c:type:`fe_sec_tone_mode`
> =20
>  Description
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -41,7 +41,7 @@ this is done using the DiSEqC ioctls.
> =20
>  .. attention:: If more than one device is connected to the same antenna,
>     setting a tone may interfere on other devices, as they may lose the
> -   capability of selecting the band. So, it is recommended that applicat=
ions
> +   capability of selecting the band. It is recommended that applications
>     would change to SEC_TONE_OFF when the device is not used.
> =20
>  Return Value
> diff --git a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst b/D=
ocumentation/userspace-api/media/dvb/fe-set-voltage.rst
> index c66771830be1..e80ba7220d2d 100644
> --- a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
> +++ b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
> @@ -26,7 +26,7 @@ Arguments
>      File descriptor returned by :c:func:`open()`.
> =20
>  ``voltage``
> -    an integer enumered value described at :c:type:`fe_sec_voltage`
> +    An integer enumerated value described at :c:type:`fe_sec_voltage`
> =20
>  Description
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -44,7 +44,7 @@ power up the LNBf.
> =20
>  .. attention:: if more than one device is connected to the same antenna,
>     setting a voltage level may interfere on other devices, as they may l=
ose
> -   the capability of setting polarization or IF. So, on those cases, set=
ting
> +   the capability of setting polarization or IF. In those cases, setting
>     the voltage to SEC_VOLTAGE_OFF while the device is not is used is
>     recommended.

Either way looks fine.

> =20
> diff --git a/Documentation/userspace-api/media/dvb/fe_property_parameters=
=2Erst b/Documentation/userspace-api/media/dvb/fe_property_parameters.rst
> index 1717a0565fe8..2e067fac1ce7 100644
> --- a/Documentation/userspace-api/media/dvb/fe_property_parameters.rst
> +++ b/Documentation/userspace-api/media/dvb/fe_property_parameters.rst
> @@ -72,11 +72,11 @@ DTV_MODULATION
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  Specifies the frontend modulation type for delivery systems that
> -supports more multiple modulations.
> +support multiple modulations.
> =20
>  The modulation can be one of the types defined by enum :c:type:`fe_modul=
ation`.
> =20
> -Most of the digital TV standards offers more than one possible
> +Most of the digital TV standards offer more than one possible
>  modulation type.
> =20
>  The table below presents a summary of the types of modulation types
> @@ -143,9 +143,8 @@ ISDB-T			5MHz, 6MHz, 7MHz and 8MHz, although most pla=
ces
>       (DTV_ISDBT_SB_SEGMENT_IDX, DTV_ISDBT_SB_SEGMENT_COUNT).
> =20
>    #. On Satellite and Cable delivery systems, the bandwidth depends on
> -     the symbol rate. So, the Kernel will silently ignore any setting
> -     :ref:`DTV-BANDWIDTH-HZ`. I will however fill it back with a
> -     bandwidth estimation.
> +     the symbol rate. The kernel will silently ignore any setting
> +     :ref:`DTV-BANDWIDTH-HZ` and overwrites it with bandwidth estimation.
> =20
>       Such bandwidth estimation takes into account the symbol rate set wi=
th
>       :ref:`DTV-SYMBOL-RATE`, and the rolloff factor, with is fixed for
> @@ -200,7 +199,7 @@ DTV_VOLTAGE
>  Used on satellite delivery systems.
> =20
>  The voltage is usually used with non-DiSEqC capable LNBs to switch the
> -polarzation (horizontal/vertical). When using DiSEqC epuipment this
> +polarization (horizontal/vertical). When using DiSEqC equipment this
>  voltage has to be switched consistently to the DiSEqC commands as
>  described in the DiSEqC spec.
> =20
> @@ -280,7 +279,7 @@ DTV_ISDBT_PARTIAL_RECEPTION
> =20
>  Used only on ISDB.
> =20
> -If ``DTV_ISDBT_SOUND_BROADCASTING`` is '0' this bit-field represents
> +If ``DTV_ISDBT_SOUND_BROADCASTING`` is '0' this bit field represents
>  whether the channel is in partial reception mode or not.
> =20
>  If '1' ``DTV_ISDBT_LAYERA_*`` values are assigned to the center segment
> @@ -331,8 +330,8 @@ broadcaster has several possibilities to put those ch=
annels in the air:
>  Assuming a normal 13-segment ISDB-T spectrum he can align the 8 segments
>  from position 1-8 to 5-13 or anything in between.
> =20
> -The underlying layer of segments are subchannels: each segment is
> -consisting of several subchannels with a predefined IDs. A sub-channel
> +The underlying layer of segments are sub-channels: each segment is
> +consisting of several sub-channels with a predefined IDs. A sub-channel
>  is used to help the demodulator to synchronize on the channel.
> =20
>  An ISDB-T channel is always centered over all sub-channels. As for the
> @@ -728,7 +727,7 @@ DTV_ATSCMH_RS_FRAME_ENSEMBLE
> =20
>  Used only on ATSC-MH.
> =20
> -Reed Solomon(RS) frame ensemble.
> +Reed Solomon (RS) frame ensemble.
> =20
>  The acceptable values are defined by :c:type:`atscmh_rs_frame_ensemble`.
> =20
> @@ -954,14 +953,14 @@ DTV_ENUM_DELSYS
> =20
>  A Multi standard frontend needs to advertise the delivery systems
>  provided. Applications need to enumerate the provided delivery systems,
> -before using any other operation with the frontend. Prior to it's
> +before using any other operation with the frontend. Prior to its
>  introduction, FE_GET_INFO was used to determine a frontend type. A
>  frontend which provides more than a single delivery system,
>  FE_GET_INFO doesn't help much. Applications which intends to use a
>  multistandard frontend must enumerate the delivery systems associated
>  with it, rather than trying to use FE_GET_INFO. In the case of a
>  legacy frontend, the result is just the same as with FE_GET_INFO, but
> -in a more structured format
> +in a more structured format.
> =20
>  The acceptable values are defined by :c:type:`fe_delivery_system`.
> =20
> diff --git a/Documentation/userspace-api/media/dvb/frontend-property-terr=
estrial-systems.rst b/Documentation/userspace-api/media/dvb/frontend-proper=
ty-terrestrial-systems.rst
> index 8cd461ceeea7..8aad9ea817f2 100644
> --- a/Documentation/userspace-api/media/dvb/frontend-property-terrestrial=
-systems.rst
> +++ b/Documentation/userspace-api/media/dvb/frontend-property-terrestrial=
-systems.rst
> @@ -52,7 +52,7 @@ DVB-T2 delivery system
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>  DVB-T2 support is currently in the early stages of development, so
> -expect that this section maygrow and become more detailed with time.
> +expect that this section may grow and become more detailed with time.
> =20
>  The following parameters are valid for DVB-T2:
> =20
> diff --git a/Documentation/userspace-api/media/dvb/intro.rst b/Documentat=
ion/userspace-api/media/dvb/intro.rst
> index 6784ae79657c..854c2073e69a 100644
> --- a/Documentation/userspace-api/media/dvb/intro.rst
> +++ b/Documentation/userspace-api/media/dvb/intro.rst
> @@ -1,6 +1,6 @@
>  .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> =20
> -.. _dvb_introdution:
> +.. _dvb_introduction:
> =20
>  ************
>  Introduction
> @@ -125,7 +125,7 @@ demux, CA and IP-over-DVB networking. The video and a=
udio devices
>  control the MPEG2 decoder hardware, the frontend device the tuner and
>  the Digital TV demodulator. The demux device gives you control over the =
PES
>  and section filters of the hardware. If the hardware does not support
> -filtering these filters can be implemented in software. Finally, the CA
> +filtering, these filters can be implemented in software. Finally, the CA
>  device controls all the conditional access capabilities of the hardware.
>  It can depend on the individual security requirements of the platform,
>  if and how many of the CA functions are made available to the
> diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst b=
/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
> index b46fe2becd02..81b762ef17c4 100644
> --- a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
> +++ b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
> @@ -195,7 +195,7 @@ Description
>  ~~~~~~~~~~~
> =20
>  The audio channel selected via `AUDIO_CHANNEL_SELECT`_ is determined by
> -this values.
> +this value.
> =20
> =20
>  -----
> @@ -413,7 +413,7 @@ Constants
>         -  ``AUDIO_CAP_MP3``
> =20
>         -  The hardware accepts MPEG-1 Audio Layer III.
> -          Commomly known as .mp3.
> +          Commonly known as .mp3.
> =20
>      -  ..
> =20

The rest LGTM.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--eTLKgt0aUb0RiHBN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaCqKvQAKCRD2uYlJVVFO
o+RSAQCFV3VgFDn9Fj6rKxB23n+7i1Q+swFN3Gm3Nbk5s8OA5AD/fM0YmtplQlH5
p4rUS7lNOIlcBlpkn7TAGeq7rb7QEgQ=
=NIGC
-----END PGP SIGNATURE-----

--eTLKgt0aUb0RiHBN--
