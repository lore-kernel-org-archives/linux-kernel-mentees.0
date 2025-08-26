Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DA651C5A
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 00:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756166465; cv=none; b=AM0i6uYNVaY74x89fSMMfseI1IoBkDz+0+ERSfWNMZWLnUSPA3FZB+tZcG4fYJj/EEYbweGf8eGGNmBAxKOUwlai+Y3EuNI1q3qSZkM/z5mqtpgLcMumhJIicUaYV+8G/97Lbo4AqBEQ4ggCQx6GyYoDTHoJ8AjkrBet5U+0OUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756166465; c=relaxed/simple;
	bh=mHFuIXiNmbEkoVbj8VOYF+pRey/xF5VfytxKQHW/a30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgblfomdPc9qjeef2teKAeF5mTHEAExFPKgZBZSs0rzu279BBG6h3YZh/3/zVqe4fKF/iv2R+ayZBTw36amI7uYbvLigBWLUU/igGwydv12YLKIR6fP6i9Tt9WHlDFiPPKWlEGvw8IzFSq/2TXB0nWeL6D+lOtpCuEhpnf1xF7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8PfqGeu; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8PfqGeu"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2445806e03cso58124115ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 17:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756166463; x=1756771263; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHFuIXiNmbEkoVbj8VOYF+pRey/xF5VfytxKQHW/a30=;
        b=B8PfqGeuihU+/9XXwc0BZBzHlxYMMANbLzZxqaSyuW21YeD/ne/+TF4NKUd4LDhtLv
         7Sw/0pRLlWRs+UMKD7+uCO+rh3TwtyDJahu4fRIsG84ru2ozJpm5Te6E0EvISukCuOX5
         uFxQPaYVRxuJVqmHS8bklzTqgTAOhpDnIxwRf/hNACJn9MZI5zAhW4c8M6ApCIQsMXwd
         IKmLyIZq3arpl/rTXqVgshBTK9DUSE4m9SBJOxa6B73EzI1dfblyS910Y6Zfalq8J8br
         2VbJjmJecTUABI7Pw2PwUPPeipOW9iKy6N7DEdTo5UjCeb+aIf/IPHqZHsvnzFv1qivk
         Myfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756166463; x=1756771263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHFuIXiNmbEkoVbj8VOYF+pRey/xF5VfytxKQHW/a30=;
        b=SYSQkcptkG3M7bC8wccMlr0kzlcIjOp3gCoCmVlKrX8fletVumGlJ7iXSzY1OmgKWo
         XcpMUFEh0Mc83PYtUTFEYQIyP0Ffrj2W6ZmSNl9KaX8sLM838Obpctv8O7NZa58NDh/L
         mhNXhs4XS78dk/TkfFunH59M258X1XaP/292aVPRFIYj5fs5/Bm9/2zI4zKMcMTGYaYT
         5fJfbNHV9n6OY2nvpoOkPv0sRUNchY/Y0D6z7RfYb0JUARyAHYTcfBe16MYZOwPFenyz
         EMILz/QbAx/6L3HSplyswA/CpToakC/aCtgd8lUqbVY1LkSqQfEqkCMGY2jvDN+9Tj7W
         6z/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdLbShNQH/UXukNVsLuK69XKuplIuAA2CIJ4k/jry6knAB+dCjyqsNZPGuMtWoVSWfsDVUPMioSlqtaAoZE39NJ4cjtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxE3eTPDlVqg0syzMurQg2n1XevRYMe2CVWTZcAo26/EaNPtMA0
	/brhq9RV5ud89+QXhjQky8MJCoXc+vvtnkZbwn7PEUIjrGFkB5cw7EB/
X-Gm-Gg: ASbGncu94mTYfRSN1L98bqv4PmsJOO1yzELS81WU6/5+2vC88nUh+eJ8REvtbo4cq1D
	0gW6FjGoCy+R5JPRYNbB1m6U/W/aHP7ow0wcJruN/hEBtNKWGxKosXWFFdQ7Da1SrysstZtW9gE
	MHmkvZ/kozHwTJXYftKHdHqDaFi/roV8GSg45ob+Mw5RzRZvlfN4TXLfr5fGZI+d3bOTukIchP5
	55X/jm244jsmHgkrOGVzkp1Bqr3DD0HzoJ3KVl+Dlb08e57FvuvsH7B16fBrA8aq+3T4EIoluJ2
	SnF2vs+EH/LJHjtGONWbKT3kVlS/82e4mcX8yq86KauFE4D9rp7jOk//7jUwEPI8Lh4e5fvS4el
	T7rI8C+V0byNp49WcW7AngA==
X-Google-Smtp-Source: AGHT+IFKcbvwi0kAjgdjFjeLliZLzfUxsoGc6FLH2aqpXBw/4v6OLvxDvjNLeydrT6uV6iibMapBlg==
X-Received: by 2002:a17:902:c40f:b0:244:99aa:54a1 with SMTP id d9443c01a7336-2462ee0b77emr192667065ad.7.1756166463145;
        Mon, 25 Aug 2025 17:01:03 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2467e3238fasm70835275ad.104.2025.08.25.17.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 17:01:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 940E6424E25B; Tue, 26 Aug 2025 07:01:00 +0700 (WIB)
Date: Tue, 26 Aug 2025 07:01:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Eric Biggers <ebiggers@google.com>, Mark Brown <broonie@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] selftests/arm64: Fix typos in malloc return value check
Message-ID: <aKz5PJev5HwYcs09@archie.me>
References: <20250824131647.490439-1-zlatistiv@gmail.com>
 <ed07c6f9-e389-4387-8585-6f1206da1a07@web.de>
 <aKxf1X1u8QHAdvqW@archie.me>
 <u4bv3ypqrdaz5klrvs57ptp7tu25etf7xzvoytrgnz2xohiysj@vua5mcbpznio>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1viLhCQliFWdXD/L"
Content-Disposition: inline
In-Reply-To: <u4bv3ypqrdaz5klrvs57ptp7tu25etf7xzvoytrgnz2xohiysj@vua5mcbpznio>


--1viLhCQliFWdXD/L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 06:44:23PM +0300, Nikola Z. Ivanov wrote:
> On Mon, Aug 25, 2025 at 08:06:29PM +0700, Bagas Sanjaya wrote:
> > On Sun, Aug 24, 2025 at 03:40:44PM +0200, Markus Elfring wrote:
> > > > Fix double "-ed" in malloc return value check
> > >=20
> > > Refine wordings in error message string literals?
> > >=20
> >=20
> > I think what the patch author (Nikola) intends is "The error messages' =
wording
> > use parallel structure device, where the second verb should've been in
> > infinitives form. Correct it."
> >=20
> > Thanks.
> >=20
> > --=20
> > An old man doll... just what I always wanted! - Clara
>=20
> Thanks, I did not expect to get schooled like this (in a good way of
> course). Should I send v2?

Sure.

--=20
An old man doll... just what I always wanted! - Clara

--1viLhCQliFWdXD/L
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaKz5PAAKCRD2uYlJVVFO
ozARAP920T/0c5L0WMnc2FkxNDSA5EjC8NhZPcRc40EQJvrbNwD/ayi0OlIl/02c
o5bAFcYS6XvDl8io8108nSUee23LSws=
=iJfj
-----END PGP SIGNATURE-----

--1viLhCQliFWdXD/L--
