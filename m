Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564281DE892
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 13:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756127196; cv=none; b=J0IoGGsza0Kg0TnZCiHZwSlgXWwbMfMfrYIzLeKNC8p46LGkEJRyHTHL1HX7UMpz9JeT2zIzmWklLbGgg2s7FbXwHKKhDI4m6d78IsqhfEIL/K5/XSgU+i0HL2GUPYJt216M5xQICYWh1s+kwRWzeL6AE5fcqtOZRqyqFQQotjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756127196; c=relaxed/simple;
	bh=FeHS+tJrW9ZraKAp3dY5aFZJX+0uhfMK5f0hPXIAq/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kqf6EfhUQfMP3z5mDPO3FQyKUNTfEntF77pvaqET0xvTfEt5quRcRLugnd1BqnhzBJewJyjhK1CFnX94oASE5PG+PcT+5CRptXWoBE91JM0eFryl+jdd6jjM+4WP4fK0Q7XctoT5TGVLbBkjvHd7za+MfimsBspF/gO25Bs0Lac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laLkbgNz; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laLkbgNz"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-246648f833aso14380625ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 06:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756127195; x=1756731995; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FeHS+tJrW9ZraKAp3dY5aFZJX+0uhfMK5f0hPXIAq/A=;
        b=laLkbgNzkBLfwV1Xwd6Joki+9VlMeWD28HEXjIaFvO3mPLKq1KUiAm1ba2eQWuYNBD
         zB/KfmoxnqxeLyLIyzAn0arR5fU4XM6hZh9dxs8Mya7rgcmP7oYd/19D+yu+CYg+EcEb
         E/TIh9/FaJ6jBDwnwA8UZYRWxco7uWfaZd966jxc+gj79gb2fYH2Ma6785itiG02t+8L
         c65PkWDZMtnfdxvbQ/iv8H2zhEM1ffwA4hT3YOdiiAjq5gQnX1H8l9jaAoc/346RD0NX
         bJSB+LEfsfjmesHL3r2VrWv+J8LLlWHTtcVEAySXbnN7+E1chbxxcFBVWvVZBF51tCmP
         VAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756127195; x=1756731995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeHS+tJrW9ZraKAp3dY5aFZJX+0uhfMK5f0hPXIAq/A=;
        b=rrwJENdw02zG7Gy14vJSfQtl3ieZqwNzRhOZ6HaIQuIR/soEkwTICXsvZ1xOLIAY/s
         R63ELBoZuCOrIdxEbkO+DDXG0if/xQsjQaYFGGQJoFm34oJnfGDNKJWFSfiqTrG98vgn
         4brLVYM/gpYUc9ajzt9d+3wJOqB11pcc5zJo8euwoeBfOcV+zCqeNiee9vzBJjkAtrXS
         60KIgbgLDVd6uznoBONKnaWNLGwp7xlbffRDUX6r6Zc4BmXxObgiVqiTL/fsmhHpQLPy
         cSzz0aOgbzEHcBKgXKqDMfkE4ieVxmF+ksIjgVvpgebQyX+Zt+MSmpISJfIWey/3j9Gj
         a05A==
X-Forwarded-Encrypted: i=1; AJvYcCXCP+TGHCcjTv3k+VvHlpk+ixEbXfP/zAcgVIubKLz90eo0sJwxZ06yZn5GfgInfWq3UzV/tO/Mh+XBEJhfuNwqB7y1Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ15/Kcfw4gesg/N3+BR418U7kWc+pYerW7TV+PNa5lUNdGulU
	+cK/ayOvARcb/38+Ur0lesPOPa3wnX97ABgARGW8j10yFACtXtN5GsYT
X-Gm-Gg: ASbGncv+WIvXGmxm499pO6dzHjs6P11xtj+Gdv0yublAo5JFTMydLuNMJbY6fBuM53w
	Zhh9xa9cgMUx2v8nLQKYhe/Admb21mMEZptqbB1Q/bx2i+DTdQIPWXuezmJj0VUcsdLU9yagTk2
	Tw9pm3z8scRQEd9Txh5TF9+k38QsFQknOC4KJpz4KqV8Q6G62pdJ3oqRh1Ay8IoKNSjaBrzAD5r
	mQCtfQGrBhxBx0EPF7zV+DKqBB5qq/ODeBGcJOo42EGVEvI3GpJy8i6RO/s6LJ8HekgVPXErAiN
	M1mRUImHnn4Y7Yed5LYimH1hA2QkPrsrywPYCAVFg+pWpvYWaK2rGWoXcm62oYRhY64cfxfSFg3
	y+uyY1AM659tcUQzD+SH1nVdTkprrhRhCS2eskS+j5XQ=
X-Google-Smtp-Source: AGHT+IFsrdGj5ONohaBrEbHATvRUaAGYnpkIopiRoXVCgitKhuXtw0IQV0Dnk+CfztUMDHaeXeFWDA==
X-Received: by 2002:a17:902:cec2:b0:236:9726:7264 with SMTP id d9443c01a7336-2462edc37a2mr180907925ad.5.1756127194436;
        Mon, 25 Aug 2025 06:06:34 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466886122dsm68847975ad.101.2025.08.25.06.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 06:06:32 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 599494020B61; Mon, 25 Aug 2025 20:06:30 +0700 (WIB)
Date: Mon, 25 Aug 2025 20:06:29 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Eric Biggers <ebiggers@google.com>, Mark Brown <broonie@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] selftests/arm64: Fix typos in malloc return value check
Message-ID: <aKxf1X1u8QHAdvqW@archie.me>
References: <20250824131647.490439-1-zlatistiv@gmail.com>
 <ed07c6f9-e389-4387-8585-6f1206da1a07@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fIO8M9lhbFK9DNqg"
Content-Disposition: inline
In-Reply-To: <ed07c6f9-e389-4387-8585-6f1206da1a07@web.de>


--fIO8M9lhbFK9DNqg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2025 at 03:40:44PM +0200, Markus Elfring wrote:
> > Fix double "-ed" in malloc return value check
>=20
> Refine wordings in error message string literals?
>=20

I think what the patch author (Nikola) intends is "The error messages' word=
ing
use parallel structure device, where the second verb should've been in
infinitives form. Correct it."

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--fIO8M9lhbFK9DNqg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaKxfzwAKCRD2uYlJVVFO
o0qZAQDaefbC0aa64Pk+TLexCY84I8KwjJWmZwptmBm5h9RRqQD/U/dm64bgsWdS
gKnKPBGmuJkji24s6mH1W1FT1SvNzQQ=
=EI4L
-----END PGP SIGNATURE-----

--fIO8M9lhbFK9DNqg--
