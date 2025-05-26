Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BA11C6B4
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 26 May 2025 02:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748226891; cv=none; b=BHcF1OI8chb6M3Cihn37xk28w4F7D1fiYSvMaO4kSFvFcmrqmkNsvFbRGJxDJQcDCzLRD2L10dJRkHmyeMEEk7wXfsFZklHS9yMP+kepWPq6wAOcrTPKf5Z5pOGYEClmYbcgvTRSOqCB6xoqsvzGl7iNna0Cz/CJnAb//YYTSOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748226891; c=relaxed/simple;
	bh=BrsL6bLwBpPFSCG8U6SgP3NVr0sJJLRt3AVJmRMalIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9/Ietlm6WLdSSg41Qhl5lTisgPGNw0uzNVUaRh9ltgSsgAh9czqsXZS/YGA0GC4xK2+pLlpuoVmmXfxnGVphMfjW+Vnpfdu7YQsbbNcvbiceZRLMIdYAsnrr6A3oKzD1qsJdo4KkpI4yjsqLRUvU/6wfCCM8dqEPVvEUnylg78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6lOVF1s; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6lOVF1s"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af51596da56so804355a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 25 May 2025 19:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748226889; x=1748831689; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WNdOJh+NnMF/Str+UwFKXBafijjedPkZ85jMh2ARzic=;
        b=F6lOVF1s58oAMODUVkRnYiiYaegX11E0wvInESQRfwh0H5oxA9XsxLK0lOmRoGM9YQ
         uIrfkC0EwsV3mPI4xbrMbrxmRVSBDkVAVgq79jv9cCV08N7CfHKlMWL/mx1BEDcTVhkJ
         UeBiTqsh+HLAcy3sjitUUT9M3SKIkXh2uVnw/MKRshvCryXOQXNvj0V5M/xqVfeklcdp
         GTxnHhpG/BBFziXD6ATIC4xeeQuRUTuwIBzwlyDgn6rOfa9MNv2m0YU4Klnf1u57Rhqy
         fYXo0WLZ8t+JeXuhlr7HsPFD+8/SMxEI7c9WdXnYwYT4/Bkxfs9zBa7Cx7oCn07zXMYt
         V7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748226889; x=1748831689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNdOJh+NnMF/Str+UwFKXBafijjedPkZ85jMh2ARzic=;
        b=XmoHzcAHF6BoRj/jpWc1eciLoVNV0uPDeBUJQLBkZulCdaO8jEOlkg5OtCiiqXXqSL
         ErskcdXeWxWpcyjjnTgv0KTFxxWMG3DPp3S06YYbuanX3IZHMW2J/Ifg99b4zBMiV+ph
         ahZdskYT76P+i2edj81s+iRrmlRDzhv5fTqsDnKfB7X4gM0kejTddzv4lpN1cTYkUgAO
         kzcZtYfoDTYZBD92IuXsyKte/gnvOAatwbxKYsIZ1t7NKDOf+Kf69BtHperIKyFJEPTj
         5RYk5uticG4NMTVxT0Ex5lvmGczCjPJ8n9dDXLZ/y4Hs1ceQpuon6e7FxZcFOr7lN0YK
         loFg==
X-Forwarded-Encrypted: i=1; AJvYcCXJox1MZmuZ9bmJt4IYDp9R1b2T9uDq793MQ9BnTEXQ5a+OzFnFAdhCj6up0Vpg78es8YhH8KyKFNzDbCpvsYokMR/CIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyL+moCYpEFPBMav47+YLodJ0ixOi7Y7DuCmXoEyVbtyrQDHuRB
	k2FMQ7/68qxgfuuu08jsROkXivvmRgZPaFrPSe46rhTO7Lml0Bc3sMNN
X-Gm-Gg: ASbGncuZu7YEVSBCY4UDB9fy1uMcpYMhCckxFHTOxar0rIDoCE2RgAcHT1uLqV2tAg/
	JgcRCmSEUwh7GpoJWdAaSLQR9i/BXMCDnr5eSvxw3AwBunfxPd/nHyCjC1aXEPzX4dpQ+PBr/Vg
	la6zW0O+w5l07eM++gw+5jhNKAPzRpnHZnslTcPdd7sETsGQmvhOOHZ95xxbO9rXbRnBg1m9EbA
	lQCl5jZ3RMB/TSI3sMm52ttXhstZ1DrirNuaF5LU2eDVFuF4jc/hdlONvDh1bPFB/IWcDU0WbN6
	XK4lf+9TCPjCyT4VzletGbjp7Q6rF6/yhjBEFBS80GR7TKMjAO92MHIYqYQYFw==
X-Google-Smtp-Source: AGHT+IHEQfVO4jOQL3Of/QYcqiFqVxdgSNZqlpR3S0pBQS+f1Nln9HrB4Or+CN1VaN22zOC7F3nnsg==
X-Received: by 2002:a17:90b:55c3:b0:2ee:94d1:7a89 with SMTP id 98e67ed59e1d1-3110f0ee05cmr11603312a91.1.1748226889213;
        Sun, 25 May 2025 19:34:49 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e59b3sm11123443a91.33.2025.05.25.19.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 19:34:48 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E3FD74230C03; Mon, 26 May 2025 09:34:44 +0700 (WIB)
Date: Mon, 26 May 2025 09:34:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: George Anthony Vernon <contact@gvernon.com>, dmitry.torokhov@gmail.com,
	corbet@lwn.net, skhan@kernel.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 1/3] input: docs: Fix broken table formatting
Message-ID: <aDPTRGHNx2P-_wXj@archie.me>
References: <20250526011443.136804-1-contact@gvernon.com>
 <20250526011443.136804-2-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NdA65ZAYfdmxNg3d"
Content-Disposition: inline
In-Reply-To: <20250526011443.136804-2-contact@gvernon.com>


--NdA65ZAYfdmxNg3d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 02:14:41AM +0100, George Anthony Vernon wrote:
> diff --git a/Documentation/input/devices/amijoy.rst b/Documentation/input=
/devices/amijoy.rst
> index 8df7b11cd98d..f854ee975247 100644
> --- a/Documentation/input/devices/amijoy.rst
> +++ b/Documentation/input/devices/amijoy.rst
> @@ -123,7 +123,7 @@ JOY1DAT   Y7  Y6  Y5  Y4  Y3  Y2  Y1  Y0     X7  X6  =
X5  X4  X3  X2  X1  X0
>          clocked by 2 of the signals input from the mouse serial
>          stream. Starting with first bit received:
> =20
> -         +-------------------+-----------------------------------------+
> +         +--------+----------+-----------------------------------------+
>           | Serial | Bit Name | Description                             |
>           +=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>           |   0    | M0H      | JOY0DAT Horizontal Clock                |

Fix is verified in htmldocs output, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--NdA65ZAYfdmxNg3d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDPTQAAKCRD2uYlJVVFO
o2UyAP4uQBKtj4I45lSGFA3/M03jhbOnbCEU1RWANqhj+EXxuQEAwMBEdTeIbwPZ
ed6fGLQmf/Gd9hfT6HKiFbyTPd3wvw8=
=5jsN
-----END PGP SIGNATURE-----

--NdA65ZAYfdmxNg3d--
