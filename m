Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262919EED3
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 29 May 2025 01:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748481608; cv=none; b=AobhwMUxN+TZ3IUZYDchSZV5y+zZPd6ckrYHFgFAAxTHknno1hELlrIFLcHCe/MwJP9oeLxlqJJM0NqKMbPronSNMH46g1DfI66K1t/ijJFV1YRqC8T2md+L5nl3n4sUJsGYp6X/m/24fOzrPTIunbWfQlX6nEXpYs0lKYVRTZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748481608; c=relaxed/simple;
	bh=weLUrWlQLKb4fzO2n61X6hL157RdfiXucWdU3yxcejU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltT3zROvHl4S6E6PhgcUN5BhFcNVnKdr5GUn/W/RGrJV3odU8uP4Mh9S95YwWxyr4c/NQ1u7B8TRRW7KBANIO2/HdtZdWAEZ/sEwcmqbmgpEnMjtYjXs9FG3ZgQfMMKwLZ7AIZcH8eBLdqZ6TCG3rfb4NNF3eG4FGxJwGzJkHaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWc5gFVr; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWc5gFVr"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c46611b6so408934b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 28 May 2025 18:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748481606; x=1749086406; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPkWpdyNAewyD1pyj4zfn6JvYvHEDl1eszM2O/BEBpg=;
        b=AWc5gFVrvL0VFDg/blj4cVZpWhgUg1jRdopRQq1W34fJSkt7jvWYjk6n3SES5FhFab
         yTBqwO/VG/1OUVk+0qjBY3c+4qy/MlGFTNsbqZ1nou7q25dyw4/HJNHGG+o+FvxqhG2s
         zbgdEyfhvZrqxYu+cfsO+Uxbky5JBVLQxoM6oGsg4qp4+xIsX5n5p9IphWoxvewg4DEh
         AdET7d9qSfTKUo/NoA56XHGBAd1JpDEwLntfMjtCc8EcWWJFGvgEyT7a6oxVts/HXV7O
         9jPVfSAc5zKAWJ3H8Eb+lA2m2mBVpal15gr/ysK9SJDvBAiVyN6v2fK75o2QZerFdUBi
         V52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748481606; x=1749086406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPkWpdyNAewyD1pyj4zfn6JvYvHEDl1eszM2O/BEBpg=;
        b=AvEOF+u9Ch4XTUISOR588AIuX1SBYPdGI+M7p2Aj9zIZr09I7u3fTbIPf6mcpy0Nh0
         GcG10ZHDWsYyaP5cjZ8bHQI+phje5PVrjM/1CEjY6/Jn6BXjNJ5epqdGOaUwDTpTrhNf
         lBgYZ/SgLxqPKPDn5YCQs24Y9TZwAbM5KlIbgIgEGcYiEe6v9IOeR1oMFZ6PRVYTdSUx
         DEdpeWFUEdhOoQbd8XUxCGLGN9l9mIcUEj+AHM2sd9nwri8lMxSdnlxlYhyaW7VZTh2R
         SPjV/uvhOu2/0EXkE6wuBq57CMUCsRKwnorYCI5cUZAbiPoGM1iAsmJ8cPRp691D22zE
         o8dg==
X-Forwarded-Encrypted: i=1; AJvYcCWK7K4O2yITxb4g2TJLWCdRL6oxHyXI1QSj9OQa6NDr9WR3kK8jwbq7Q8boekEab02Zsuu2wPWMBuamt48QlDZQ3KFABQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0ZEhxr+fhIzqXJBEvDAVcRUEDzh3+qvNI7EeAyo2L+lrn5fG5
	BoP+9bsy7o5OL4j0WMptmUL4ke/DYemuYGxITkewx/mZECDHvwR7XDZU
X-Gm-Gg: ASbGncsy7dKj3jiBHR5kbGFaErgiqs/nyY28Iky3XZzY6vb/doZh2X9A0r85leDMAXL
	KlA4shJvrKkZnsMp55EQi88cWoQwmgA/DgkEDmlWlnUqMaGC5SwcZSR45vbPPP5xtl0ZPN/fSXN
	dueEOVjdFD6UmzOjKCM8Ysa9xw++hbiIPgpKzVoeaqBC20X6zXMsZYnpnH+wqyZVTUYJ2S/vPf0
	VtRFB4r0IKYcmxK00lTcGIo0iQ/wDVQfJY3K3wjKVqeyEPHeVZL5NofA5NI9evAUnrvFTYfmENI
	y+KgDaCUQ5FQeMy1OfmTYfdnkvqcjalUb4pZfcfFHiqXtxJRKSE=
X-Google-Smtp-Source: AGHT+IFbs2dDZq4hWhGCBBIpkkepV8NfjoRKYy9BWo37/cU7FNNPSmNTTgq0Enpjm77Ucc2OZh1z8w==
X-Received: by 2002:a05:6a21:710a:b0:20b:a75e:fa32 with SMTP id adf61e73a8af0-2188c3b4898mr30416971637.40.1748481605944;
        Wed, 28 May 2025 18:20:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafad4sm231277b3a.116.2025.05.28.18.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 18:20:04 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E05CD41E4844; Thu, 29 May 2025 08:20:01 +0700 (WIB)
Date: Thu, 29 May 2025 08:20:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: George Anthony Vernon <contact@gvernon.com>, dmitry.torokhov@gmail.com,
	corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 3/4] input: docs: Fix Amiga joysticks grammar
Message-ID: <aDe2QbVwsmo83Wu9@archie.me>
References: <20250526135957.180254-1-contact@gvernon.com>
 <20250526135957.180254-4-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="32vja2NKutgRl3jI"
Content-Disposition: inline
In-Reply-To: <20250526135957.180254-4-contact@gvernon.com>


--32vja2NKutgRl3jI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 02:59:51PM +0100, George Anthony Vernon wrote:
> diff --git a/Documentation/input/devices/amijoy.rst b/Documentation/input=
/devices/amijoy.rst
> index ea4de1ac0360..cbc5240f8af3 100644
> --- a/Documentation/input/devices/amijoy.rst
> +++ b/Documentation/input/devices/amijoy.rst
> @@ -1,14 +1,13 @@
> -~~~~~~~~~~~~~~~~~~~~~~~~~
> -Amiga joystick extensions
> -~~~~~~~~~~~~~~~~~~~~~~~~~
> +~~~~~~~~~~~~~~~
> +Amiga joysticks
> +~~~~~~~~~~~~~~~
> =20
> =20
> -Amiga 4-joystick parport extension
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Amiga 4-joystick parallel port extension
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =20
>  Parallel port pins:
> =20
> -
>  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D   =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>  Pin    Meaning  Pin    Meaning
>  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D   =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> @@ -90,17 +89,17 @@ Pin Meaning
> =20
>  ------------------------------------------------------------------------=
-------
> =20
> -=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  NAME     rev ADDR type chip   Description
> -=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -JOY0DAT      00A   R   Denise Joystick-mouse 0 data (left vert, horiz)
> -JOY1DAT      00C   R   Denise Joystick-mouse 1 data (right vert,horiz)
> -=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +JOY0DAT      00A   R   Denise Joystick-mouse 0 data (left vert., horiz.)
> +JOY1DAT      00C   R   Denise Joystick-mouse 1 data (right vert., horiz.)
> +=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>          These addresses each read a 16 bit register. These in turn
>          are loaded from the MDAT serial stream and are clocked in on
>          the rising edge of SCLK. MLD output is used to parallel load
> -        the external parallel-to-serial converter.This in turn is
> +        the external parallel-to-serial converter. This in turn is
>          loaded with the 4 quadrature inputs from each of two game
>          controller ports (8 total) plus 8 miscellaneous control bits
>          which are new for LISA and can be read in upper 8 bits of
> @@ -108,7 +107,7 @@ JOY1DAT      00C   R   Denise Joystick-mouse 1 data (=
right vert,horiz)
> =20
>          Register bits are as follows:
> =20
> -        - Mouse counter usage (pins  1,3 =3DYclock, pins 2,4 =3DXclock)
> +        - Mouse counter usage (pins 1,3 =3DYclock, pins 2,4 =3DXclock)
> =20
>  =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=
=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D =
=3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D
>      BIT#  15  14  13  12  11  10  09  08     07  06  05  04  03  02  01 =
 00
> @@ -179,12 +178,12 @@ JOYTEST       036   W   Denise  Write to all 4  joy=
stick-mouse counters at once.
> =20
>  ------------------------------------------------------------------------=
-------
> =20
> -=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  NAME    rev ADDR type chip   Description
> -=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -POT0DAT  h  012   R   Paula  Pot counter data left pair (vert, horiz)
> -POT1DAT  h  014   R   Paula  Pot counter data right pair (vert,horiz)
> -=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +POT0DAT  h  012   R   Paula  Pot counter data left pair (vert., horiz.)
> +POT1DAT  h  014   R   Paula  Pot counter data right pair (vert., horiz.)
> +=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>          These addresses each read a pair of 8 bit pot counters.
>          (4 counters total). The bit assignment for both
> @@ -213,8 +212,8 @@ POT1DAT  h  014   R   Paula  Pot counter data right p=
air (vert,horiz)
>           +-------+------+-----+-----+-------+
> =20
>           With normal (NTSC or PAL) horiz. line rate, the pots will
> -         give a full scale (FF) reading with about 500kohms in one
> -         frame time. With proportionally faster horiz line times,
> +         give a full scale (FF) reading with about 500k ohm in one
> +         frame time. With proportionally faster horiz. line times,
>           the counters will count proportionally faster.
>           This should be noted when doing variable beam displays.
> =20
> @@ -238,26 +237,26 @@ POTINP     016   R   Paula  Pot pin data read
>          This register controls a 4 bit bi-direction I/O port
>          that shares the same 4 pins as the 4 pot counters above.
> =20
> -         +-------+----------+-------------------------------------------=
--+
> -         | BIT#  | FUNCTION | DESCRIPTION                               =
  |
> -         +=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> -         | 15    | OUTRY    | Output enable for Paula pin 33            =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 14    | DATRY    | I/O data Paula pin 33                     =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 13    | OUTRX    | Output enable for Paula pin 32            =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 12    | DATRX    | I/O data Paula pin 32                     =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 11    | OUTLY    | Out put enable for Paula pin 36           =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 10    | DATLY    | I/O data Paula pin 36                     =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 09    | OUTLX    | Output enable for Paula pin 35            =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 08    | DATLX    | I/O data  Paula pin 35                    =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 07-01 |   X      | Not used                                  =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 00    | START    | Start pots (dump capacitors,start counters=
) |
> -         +-------+----------+-------------------------------------------=
--+
> +         +-------+----------+-------------------------------------------=
---+
> +         | BIT#  | FUNCTION | DESCRIPTION                               =
   |
> +         +=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +         | 15    | OUTRY    | Output enable for Paula pin 33            =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 14    | DATRY    | I/O data Paula pin 33                     =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 13    | OUTRX    | Output enable for Paula pin 32            =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 12    | DATRX    | I/O data Paula pin 32                     =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 11    | OUTLY    | Out put enable for Paula pin 36           =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 10    | DATLY    | I/O data Paula pin 36                     =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 09    | OUTLX    | Output enable for Paula pin 35            =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 08    | DATLX    | I/O data  Paula pin 35                    =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 07-01 |   X      | Not used                                  =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 00    | START    | Start pots (dump capacitors, start counter=
s) |
> +         +-------+----------+-------------------------------------------=
---+
=20
LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--32vja2NKutgRl3jI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDe2PAAKCRD2uYlJVVFO
o5C1AP4z9f6kZASk1dzc0JBf8ilOARUtJWgs/bIuTrwqyfPhhQD+PmuFJvAiNQKB
X57M2s574YwbaQ8T6xSOYdsYMm4HWAU=
=qK3n
-----END PGP SIGNATURE-----

--32vja2NKutgRl3jI--
