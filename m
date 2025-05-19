Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B226A33B
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 May 2025 01:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747617801; cv=none; b=j0TDAWl8lZGZlPvGa5TuIr7HFBBqxINJ4MaJj8Uy+ov53XIqp74+X45Cd23yqyfFBQGyjOOZdw4NRzCe3EIvKUDqjtzD2W6cxoGqw/q3LO7TSiuoh4ol9EH8c9PCW1zajGSlmDF1/pJa1Mzz7PEmDTAlV2rdnadwe/CQTnGY1JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747617801; c=relaxed/simple;
	bh=szWYp7O1akrqBtwUu5NvIsHLJaVg2FHDjHhZJoI8YT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rjqdq7fn2S26ujZ50xlWLcuuRrgxNTUXgu4NSetePBIkcv8YfcAcXcjh2vuKXnFLkA1L260s+fSBaMlF8yV53UKOJy0nJZ4Kre8pJtYHKjzqjNF98LSrE/YvQOuHPs3dGkZALCv/DDwvx7NiaQCRuL9Afv6H3yjUIpJ8vu1t9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9Bs4o7f; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9Bs4o7f"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30e57a373c9so3628358a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 18 May 2025 18:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747617799; x=1748222599; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1bGtewRmtax5G8PsycrpOk9GXsurx+/jHhRp4qP6ZQc=;
        b=D9Bs4o7f7J3fr1qbjuPC+ObD6mFyY4s2yaaWacb47Ek9Rs2drTvPrN1TWuIqa1YWoo
         SxI6q18GyJRI1Kmz5zRCAF+3Ut8n/OeDbihFNf1B/5czhFTn/5wL9Aj7il/3PX9zWpln
         KvXERX329y7U+M30xW9D3D2teiWkeTZv66mrQABjfepHbOipBN6OS/T2QJnkKDv1mkW7
         c4e9CAhfja8GVvgXXmAQzsUX+6Pn2uz7tPPfhYHBgzcUqHIAnCh23PNzmvQGNfWXeLWL
         4MtMFdGSgqT5c5nlONXLJNE4cTB3oRN2+AVBGcJkdtvlYwQ+LhpK3SpDuUWnIz3j+lX5
         cRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747617799; x=1748222599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bGtewRmtax5G8PsycrpOk9GXsurx+/jHhRp4qP6ZQc=;
        b=Y6RMRrNRSP/FYbdoufPYqbhTX6FzACcS0Aft76yGaCG371JnuPyRpmZvs/VM4zVimw
         ehC06CenLv1rH7aOQbG3ZBsHrSz+Yij6ciqV1bPkCauzyA23Lf05C/duet1nVW7vv/Oe
         NtswSdoAO87Qx83nfg+YhOROTFmLkJdwxA3KCdl6DEQcx7hDiNUHvH4EKew3n6ynXnYp
         rQG7YuIjBAcZV7CGVlsnWIaaUxly6UzrnrgVC3xfCZ9Nn7xNCKlfkwXr+LuW6RLWA6e9
         Bmy+CmNzHKrDtkjU2V1nIoNpCFjSF7XcLa9RzyTr6nihTWGXXpBNQpVvkGZys+Rq3gsP
         bBlg==
X-Forwarded-Encrypted: i=1; AJvYcCUqOUU7un7cjso35WwGCVbvGOyeezMF1tLkgFvyoEqmBFVyG2G6XJdYSKDqcKmXufcByA0cLZc3OG4JJ7QE96D2jCjXhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqYZcfEFPZmDkWwA3WWgZ6sKsPI4apck8LwCb9jPtHinSw2zxT
	NuZlMbI0tKC4yeTQXhunDrmvXqawnNwz4YYfPb8kvtvLyKMk9R0kzh6d
X-Gm-Gg: ASbGncsUCm786s+FWadoEb+lO0m3mIBdrqp7JyIlzjVi9n7/2Hmr2P4ZUD9mOhDXeL0
	1G32m7yOoSIKAuj2lxJ/GODEXvT8IhFvrVcmcohMkjmwfCIqA7LtRexcrcxAASinXHOZWoAXCsk
	7Gflm7WU/b+Tw7zXFktNEMxbxzxatkgETEAbfY8DjPYU4gKKlRO97nZh8+oryfIWAa2Fp4qad0L
	VbAhrnbCev2Y8QdCHYUnGu2sHXlEEnDiW7b9m0fdz/xjaKRUi5J6u1OQLBWPCRhAjHmUEKS5aFt
	4Pe6kZLUpMCVvJCUC9n+LlkEM3FjvAU8vYusJDN/y8y5IYU/+fM=
X-Google-Smtp-Source: AGHT+IGhp0HWQnVXgH14PYeJQ2R9fzT3qMmupNX50fb1NBX+cVX4ZTlETPO/cA9Q5e1EncDrB5Fikw==
X-Received: by 2002:a17:90b:58e4:b0:30c:4b1d:330 with SMTP id 98e67ed59e1d1-30e7d5acb3bmr17124738a91.27.1747617798662;
        Sun, 18 May 2025 18:23:18 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e9ad67011sm3905474a91.33.2025.05.18.18.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:23:17 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 79F874208F51; Mon, 19 May 2025 08:23:14 +0700 (WIB)
Date: Mon, 19 May 2025 08:23:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca,
	saeedm@nvidia.com, Jonathan.Cameron@huawei.com,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 2/4] docs: Improve grammar, formatting in Video4Linux
Message-ID: <aCqIAkoVr2yvDJbN@archie.me>
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-2-hannelotta@gmail.com>
 <871psml4t7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/utPzO/+BR3FoDfM"
Content-Disposition: inline
In-Reply-To: <871psml4t7.fsf@trenco.lwn.net>


--/utPzO/+BR3FoDfM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 02:08:04AM -0600, Jonathan Corbet wrote:
> >      description of the correct character encoding for Programme Service
> >      name strings. Also from RDS specification, PS is usually a single
> >      eight character text. However, it is also possible to find receive=
rs
> > -    which can scroll strings sized as 8 x N characters. So, this contr=
ol
> > +    which can scroll strings sized as 8 x N characters. Therefore this=
 control
>=20
> This kind of change just seems like churn that isn't really improving
> the content?

I prefer the original as both so and therefore have the same meaning.

> >  ``V4L2_CID_RDS_TX_ALT_FREQS (__u32 array)``
> >      The alternate frequencies in kHz units. The RDS standard allows for
> > -    up to 25 frequencies to be defined. Drivers may support fewer
> > -    frequencies so check the array size.
> > +    up to 25 frequencies to be defined. Because drivers may support fe=
wer
> > +    frequencies, check the array size.
>=20
> Here too, I'm not sure I see the value in this kind of change.

Again I'm agree.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/utPzO/+BR3FoDfM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaCqH/gAKCRD2uYlJVVFO
o6lDAQCh/VCPdKz68FdKnXg5XJbiBgln/GYY8iRzwFpsCPadfAD9HpM6f4+7YuDY
jIyhgK1015KkczdjAzWsPn94D9NZGw4=
=r/+a
-----END PGP SIGNATURE-----

--/utPzO/+BR3FoDfM--
