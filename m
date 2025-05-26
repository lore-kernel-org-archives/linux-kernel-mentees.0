Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEA01BF58
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 26 May 2025 02:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748227392; cv=none; b=cUa/DK+OWyyKjqZjBl6trcZgbc8tEitupDYRdyr5qbLnNJMO9EHOJ/pV1vrBZ55KjkDKnQQueyqmDOfJqpwv7t7CwH4XzldCnhnW/THsw6SUF9yaEl5r9csDLJVDr11zvSlLCFscOW0bid/ZEfCBa51Bi9Tl8OnCmg9Kr6Br6V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748227392; c=relaxed/simple;
	bh=IC9uFzW1GraEckz1npeV7R+FHBO0O1DM7iSkV0imFfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYNamW2uG22JMbL8T9Qx1yDFrfU0zAOSFaGY1gMPSogRhU314tzVOthQknUnAFafrAmXjAyS2aDyI7bchAI6X+yQqKkcpSIVEPrCEj3ZTV3CuE1B+6GdH1sUem3kixCRx2LyO1DUXjU2Cy2a9Kfc+5uw59Qo843wbdY7l4pfr3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCH7Yxi5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCH7Yxi5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23035b3edf1so10699885ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 25 May 2025 19:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748227389; x=1748832189; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IC9uFzW1GraEckz1npeV7R+FHBO0O1DM7iSkV0imFfc=;
        b=bCH7Yxi5uatFT8tPMRR6qHySjRs/e5FDt+WwcdjMLTJsQuPWVZsIyc6RzBZCnE90kV
         WYrl5bad+XbhPXiu7tURp53PCPo46kWRiEoXaxwYhsZD3WvWy0HTqUiXaKs/bVCyaZ6s
         fBQIpLLbcdhzPmV8LD93mKWq9i/4BxJzLsqZvaTCYZBWuRGO7SGrrYt301lwfDCuC61T
         /vVzR/4zB8d6dTdVGUYSTEGfNwjFomtbEleDran/f0DrV12FWskWa5/iyJERd3Jbd2hd
         Xc6SLhL+WGOBFKSknw4XgnPMF/TWHHpzyi2kVUSIakx1dteN3PbYVQLaWUw2MqKHnuKh
         9fqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748227389; x=1748832189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IC9uFzW1GraEckz1npeV7R+FHBO0O1DM7iSkV0imFfc=;
        b=DO/DJJzaswKh60K31oobWabwzUN0lC2f7l2WgGph+Gy6gdzPx8Y8l2XaTyEDzsYT7B
         590L+DYoqBpM4nMgpFC/1yW8bR7LFU67nD6hV0CVmPjMngJUy00CM3cEBVstVUnFaZai
         4oRjvnxd9l4C9zUe0yZF2LUHf3AcxvQQHvhYAxo+yLrMHFcNoxip5d2RFU9U++7o9tuS
         ehYs1kHlRPIe1LrYqmcli+fZSNYalGHQ0Ttd077Ee8M7EI7ggVIhEMYFYEeqP07Ibn3S
         vKrVWsSNR4gl23c6tt8fGOZEdZithZ0vxPVpCsdtlo4Ps1p2Dj2dV+AxFGzjtQd6jxHN
         2iDw==
X-Forwarded-Encrypted: i=1; AJvYcCUjdR6hWAikZvsk9MROG9z/DDhnjmIEmUsBcZ5bfEy3NEP541R5PoszTVfvty+UxPFAEXJqN2PnoRz7YLBOm6ULC+Pt8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwM7e7BeWwE6GVY8M+aFymNuXCfi2cIQt2o9sX+9eWb7Mdw0wMn
	ybbLASGiTyJ8LmPy4bs+swuWgOZfa/QMZDuKt52EYmHnaG++ZdORsrNs
X-Gm-Gg: ASbGncumDI7SHRT2/Hy4ndNhUYlX6RopMuFsgxssCj/qpqR8jWFMhBAkqL3EX/QbNm6
	tkgZPQek6wGywZ0md5+VvewaMIvQ/AN6i4zTWnvy7VB/E30VZW8rdWUppK9mZdcCHd8awZK+2Wg
	zQPRvIV/AltOVzApj+vF+kPailqhUMDeN9Jptnt46za4ory8iVhdU/AWHFXIIXC4iEyXDqSDHD0
	JzHjZb4OxkU9nOJryTPFs1WPK5q/yFuvGJUJviSgGzhAbaqEwIY/+pfpsd2yAnVoLcg2QbjpRyH
	DTNoqGMIFpnj+Xw4Jf8RpJxURvq+KL5zdyOsdu2656Mpcp8laY8=
X-Google-Smtp-Source: AGHT+IE6IcDKP2eGy0o5YUOcd7vy0oot3F0p/IA9NKNpgNt6Jgt8tKvcQqxG3tD4qVmt2iBDGkOm/g==
X-Received: by 2002:a17:902:cf42:b0:234:1163:ff99 with SMTP id d9443c01a7336-23414fd5dafmr132980195ad.43.1748227389024;
        Sun, 25 May 2025 19:43:09 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23430aefd6csm21797535ad.82.2025.05.25.19.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 19:43:08 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 7C89B4209E8A; Mon, 26 May 2025 09:43:06 +0700 (WIB)
Date: Mon, 26 May 2025 09:43:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: George Anthony Vernon <contact@gvernon.com>, dmitry.torokhov@gmail.com,
	corbet@lwn.net, skhan@kernel.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/3] input: docs: Fix Amiga joysticks grammar & formatting
Message-ID: <aDPVOlBIpnqc7Tez@archie.me>
References: <20250526011443.136804-1-contact@gvernon.com>
 <20250526011443.136804-4-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KntiioOK2g5D1YkR"
Content-Disposition: inline
In-Reply-To: <20250526011443.136804-4-contact@gvernon.com>


--KntiioOK2g5D1YkR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 02:14:43AM +0100, George Anthony Vernon wrote:
> Make small grammar fixes to Amiga joystick documentation.
>=20
> Also make heading adornments compliant with the guidelines to improve
> organisation of the page.

Split up these two changes into separate patches.

> -~~~~~~~~~~~~~~~~~~~~~~~~~
> -Amiga joystick extensions
> -~~~~~~~~~~~~~~~~~~~~~~~~~
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Amiga joysticks
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I would prefer to keep section adornments in this doc as-is, though.

> +Register addresses
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +JOY0DAT/JOY1DAT
> +---------------

But adding sections for register addresses looks OK.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--KntiioOK2g5D1YkR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDPVOgAKCRD2uYlJVVFO
o4yOAQCqnQ8RdNDxbTGXB7K4fMlodV6JHiDTp29uYq1k1Vg9PQD/U6L1ZPND0gt/
ysOPMZ9UazUaRvV6Ybqo2lFne86ZBQo=
=CFhb
-----END PGP SIGNATURE-----

--KntiioOK2g5D1YkR--
