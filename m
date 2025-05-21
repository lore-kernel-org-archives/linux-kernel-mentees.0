Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181A97081C
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 02:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747795732; cv=none; b=DnkhNxx76bMltQF48Ul9Kq000e9qMN0EMKrHDeo3i46/tIz8Goi0WTxQRDpEKZC0PN2U1dhKFlXirxlP+qKqgdqev/FtQhcnZ9Wb0wjJVdUnhIxwIVb05xfFqdwtuHyyU4HVTXGecHSH4IC4vg/7fcrLI8yXTIqwlnA3ZMzjyv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747795732; c=relaxed/simple;
	bh=pQWwG4FE7E75O7y9KDeZqn7/YOWBpQ604/XkiidUzBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRQ7f38C9D7BIebjyi0aHovtFDlFBlk7AjzHu4uwqno24OC0tw+T3n5InHAuVViphT+yAaAjdwRLCKNMSptYFo5/u/kxLRFh2i1mFwUpOfYeEI0Z2KjTYnfuWAZywxSm/PMihhSDWz2OJFZmpnfthGWJHs/dSTJyeD8SyoD0mok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XK13J1pQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK13J1pQ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742b614581dso4859066b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 20 May 2025 19:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747795730; x=1748400530; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2NbDA114bT4M3eihLnGg0sok4WOyWpUmS0wQOI9syg=;
        b=XK13J1pQpLW2WvcCgSZ9Ijwoywp7STX6MvBh7DC6Nbpfq66tmw9mwHMPXRj+oCOX1q
         bQPmSoviSiG0dfHmQ8Vwy5wWiB1vMW3qX8arC0/tX6yw6z6Zn65PM8ma6/ZB6GrakVwz
         vpBdyZwecRXHf6HX0/3diUIDHHY14nUR8ah7bKnBv4kiH8yhh5hPXYf2XQKclKRG/WmF
         m/sNlwmMkmw1AyoxEbwPvVvTtFPz477LRrEoAJDjPA4tGiBnXG67MqNk+tFwVTKI9QTV
         nAp6Rnpn8Lj0cwDgGT+atvczIJmiMyNnzQqmx1IANAeiAXdZI9swbQlZPqiMs1/42rhz
         E7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747795730; x=1748400530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2NbDA114bT4M3eihLnGg0sok4WOyWpUmS0wQOI9syg=;
        b=snmiXl5cVA+8hI6TlzIr8QfhNpi2sYoXyEcYUcEqSRUOAKsAOS2q1Yw2qtl4zLkH3X
         iBPRtCjA+VNcrFOSX2eVj0zZ01A4Xw7GpIyiJ69JJ9UkxOczbiB2cyLDMtQ+xf57DPBm
         VC74QSG0pH294DgpU1Bk6/9X6Uuvh+5xLlmii5Jmqa3BknWDkhC24WMY9pnfBp3juKzw
         V/0wyPuqYLewOcqiDzvS2O1h+XIbDozR7deqxLncdjcZwKS4Hry7JhYQiTSvWdicmcOi
         /bXjvR2nFHm0PvEQOFsGNbSBD9pfyUNg5E7aUwW8Wlux8xtCXAYhn/gx4EilwlQKjjg8
         QwCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8ALKT3MjEU2R6NhPHgfYAgeaV5rCo4vSfb/kUCmWUzQGNaXprvTVbvKWvelzPvm8sh//SdQHCQzNcfM55ib7YalcBLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhrDkKk1YoI3XvrUScXmt58WM30fMTEC49GyGaN5/IXochpSAu
	mn4OOPKM9pkbGxfJWMWwkz/soOep5amOdYiWczP0fm1nMhRfu47kweHH
X-Gm-Gg: ASbGncuG25sjJmV0vyO3osv5tM8wuAQn7dLtNz9vXo6xTuheCX+0C3efzqK/GDLFDHq
	knBg08IpB4eH1nbAIToIQCCMziRSQ+u+Ac139yQ4oFmXww+keZl/sJuukjcIfL5WbJpUSh6zksQ
	Ma2Czet2VzU9gfOKNgfgsozP1CXrz0HWn4U7gnzKGXgunZ5xWTKjCjo5xUItJLd83bikb0Aj38S
	DGINnBhicCZ1YoDMsOmeURoWhih2sw6Jo03TsZygeJGBp4Amn3C8CEMF0lgRhHfEXK6KpBBrJRL
	VjyfTXa8fkAXpv79y/6CezLRNPc3/BeyHmZxIluwwXtfI2S2NCU=
X-Google-Smtp-Source: AGHT+IFX+g62ovxud3Kx3IZsJ/gdDGHXTo7y+fh/QB6c4bXsAVjJmkxY8O/Y1Pe1xDdgpFg9+SxQkw==
X-Received: by 2002:a05:6a21:1089:b0:1f5:6b36:f56c with SMTP id adf61e73a8af0-2170ce39a55mr25774895637.39.1747795730168;
        Tue, 20 May 2025 19:48:50 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f364fffb2sm2516031a91.33.2025.05.20.19.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 19:48:48 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id F08AE42439C3; Wed, 21 May 2025 09:48:45 +0700 (WIB)
Date: Wed, 21 May 2025 09:48:45 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca,
	saeedm@nvidia.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
	mario.limonciello@amd.com, W_Armin@gmx.de,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 3/4] docs: Improve grammar in Userspace API/fwctl
Message-ID: <aC0_Dbx4rZkiwkxe@archie.me>
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-3-hannelotta@gmail.com>
 <aCqKNg3p_VlGbce_@archie.me>
 <264386b3-075d-ef1d-e3b2-9a2937ca05cb@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0QQaGeC0l+16FwB6"
Content-Disposition: inline
In-Reply-To: <264386b3-075d-ef1d-e3b2-9a2937ca05cb@linux.intel.com>


--0QQaGeC0l+16FwB6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 04:01:11PM +0300, Ilpo J=C3=A4rvinen wrote:
> On Mon, 19 May 2025, Bagas Sanjaya wrote:
>=20
> > On Sat, May 17, 2025 at 04:27:10PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=
=C3=A4 wrote:
> > >   3. Write access to function & child debug information strictly comp=
atible with
> > >      the principles of kernel lockdown and kernel integrity protectio=
n. Triggers
> > > -    a kernel Taint.
> > > +    a kernel taint.
> >=20
> > Improving grammar includes s/Taint/taint/?
> >=20
> > Confused...
>=20
> To be fair, the changelog also said "Fix typos". So Bagas, do you mean=20
> "Taint" should be always capitalized? At least this doesn't support=20
> that position:
>=20
> git grep -i  taint Documentation
>=20

Nope. What I mean is the opposite - lowercasing taint word as it is not in
first word of sentence nor a proper (named) noun. And yes, I was writing in=
 sed
syntax.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--0QQaGeC0l+16FwB6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaC0/CQAKCRD2uYlJVVFO
o6esAP9/bJwCrrj/nib8pSzd6lPgroUAO4W0naZG7b26fSq4bgD8CE7syGvkZQVR
G7IhqPXv6+OnwWkVI43fqKeA+7bUqAM=
=TDrk
-----END PGP SIGNATURE-----

--0QQaGeC0l+16FwB6--
