Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC2A233136
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Oct 2025 23:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759965568; cv=none; b=M6K6wTKBRCOCWAHV0mVQbwLMUkG+aB6vUoBGHswrtSu9IpPY6PoBDzFgDUsGkQXm5L4jG8lr69oyAxa/aUFuBAvCramfoooRhS6ysxi0pFoHaIOY5d3EClZkIchuKQoja30M87ueCvNK9VqZoqAeO7xQ8K8TDv4Gs7vOn7wmNns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759965568; c=relaxed/simple;
	bh=CuUPOtIUJzTkfPFw0WgfFvYdrpTftUfYNdMNY5bK4H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnpMwRv4v1J0K+J14C+3zmXuMqK5Jlp4SKIpqZ3iAgdcJG1e9eI7WysHWBm5bxQ+y6pgsnrxhfl5tdgoUXKeG4+JKxZsR9PLtp2jQWzRguBghMkTofOPPUEyyAaPOd3fNkT4mxuupl50iMlHpsMc7AKwooG51BOEwYXCvaeNb/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6Wpxa7Q; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6Wpxa7Q"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33082aed31dso436583a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 08 Oct 2025 16:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759965566; x=1760570366; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CuUPOtIUJzTkfPFw0WgfFvYdrpTftUfYNdMNY5bK4H8=;
        b=K6Wpxa7QQ51Y9il9K/pfHLhGjh/sgOH3rwqpq5zotjWHZHJ32PlShIIc4KYRr+i7MI
         SR6YSY2GtEMv7B8OcPCtqpPxNXKvQ8OyN6vtEEIUxIx7rpuXXH/TaLDf92esPiBLr0Pj
         x0hRHDZv7Ulykm1Q7YVY5wHaPE51cqwqXlrsnVE/sRCK2RKwfYrgwy+HG91YE+rTaoMb
         M86bRgALQfCLG38puMTh2m8mO/58jY5xux/Nbf+LwznfT5JAmsL/gNCOhznSsZWwF+ou
         qwHTpzgRfJDFuhd5pXWUJ9lAmXaOpzAC2cHsl6QwMLDtU8q7lotIVpTCHsCPhlVutTyi
         wWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759965566; x=1760570366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuUPOtIUJzTkfPFw0WgfFvYdrpTftUfYNdMNY5bK4H8=;
        b=mR3ojkCj3DX7T+nh1CaEMId9uGHqPxHpRHPmBigwr88feUUpY/WuujbaXqibqFGbyi
         5yfI0GNPniAXfvyWhWuyGplq8sbwFdgxS4eJrejhSug+QmGi75jNdHImDxN6XKURQY/3
         v09kIuN2NSWhMVKfcppa3jy8JYe0e3ME1d+jfqaDaS+nF05ODIvmICCOeppbff8FDY/G
         GWFHuP70WC6tIZ5ZywxejwIyNvs7cSuYK1w2Yb7/A+0TTAK0C1XWqJIWfU0oQ6xr6L9I
         s8jNBg6y4waIden2OxG9HWZ9nzA963JpRROFJ9lnmlMR0USzR/V9CDTWTp5BVa4D5f4l
         yxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU98e6L59yh8nWXT8zgv4Lv8oVUcKzhndNfkwyKsyucYmyJ/QcXRMmUa2wSNJhE/hs803hFcUdoZnH7/OhUMKNz+WRsaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YylFdk7/nmNT+YwARc7DkGaoWvhT2kbikA4RbAHXM6pRFaRc8Ef
	sloNau5Nbklud6/20QHDayoUjFtqulAyyd+LlF6wFh57NAYZqRTsZSZY
X-Gm-Gg: ASbGncupNGuqpjeLkCQEiMCrwdgmEJ3PkTjflBHRywOpaaP3BHOat5LfaFHUVnkogU5
	6Or9AFgFBKA7LPgI7um2Fp1bvpG0+lAU6oXgERx1o75mQphmSQViuQVsH1AmWpQeAyGaj2/cC3q
	0QtXx7ZGFvuXLabXENek4iQQX+2JYC+30GoWWVimmX+06DtdtS+MG4+gL1jLIhJdcao/cSZ9TsX
	tG1XWC6xf/X3uPyLlI3itC+2TeiNhxFww7YGlqlByr5Hc9g9nYRw+Cnh2wDJlAmIPiqMmdjGmgl
	oDpm33fx6GfBidcmU1Oc3xPnnvb6ENQ81jxo01MTsaPj3HpIXVNsNQlUpozIlf5ZkzCyYMiQ+lj
	jRq6gWYSrAsrFs25LvbEb5GKuvIKAt4mcc7ZbOPwrEqsKP7OP1g==
X-Google-Smtp-Source: AGHT+IEqQwohh35D8DAkh9yjSUR0i5+iZzIj3lrkntQw2k0Ckim3fwA3XU6urWopN5QyOgXBfW7pSQ==
X-Received: by 2002:a17:90b:4b8c:b0:32b:6cf2:a2cf with SMTP id 98e67ed59e1d1-33b5111895amr7030812a91.14.1759965566295;
        Wed, 08 Oct 2025 16:19:26 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b631e32a56bsm6005356a12.6.2025.10.08.16.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 16:19:25 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 5B7904233432; Thu, 09 Oct 2025 06:19:22 +0700 (WIB)
Date: Thu, 9 Oct 2025 06:19:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net, tglozar@redhat.com
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH v2] Documentation/rtla: rename common_xxx.rst files to
 common_xxx.txt
Message-ID: <aObxeg12WxHtNu7B@archie.me>
References: <CAP4=nvTjauRawBPTnGEztZpdDSNhGpgSJtjoTFuq+cCQHP5oEg@mail.gmail.com>
 <20251008184522.13201-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="laywoOT544AkU5an"
Content-Disposition: inline
In-Reply-To: <20251008184522.13201-1-krishnagopi487@gmail.com>


--laywoOT544AkU5an
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 12:14:27AM +0530, Gopi Krishna Menon wrote:
> Running "make htmldocs" reports the following build errors for
> common_options.rst:
>=20
> Documentation/tools/rtla/common_options.rst:58: ERROR: Undefined substitu=
tion referenced: "threshold".
> Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitu=
tion referenced: "tool".
> Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitu=
tion referenced: "thresharg".
> Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitu=
tion referenced: "tracer".
> Documentation/tools/rtla/common_options.rst:92: ERROR: Undefined substitu=
tion referenced: "tracer".
> Documentation/tools/rtla/common_options.rst:98: ERROR: Undefined substitu=
tion referenced: "actionsperf".
> Documentation/tools/rtla/common_options.rst:113: ERROR: Undefined substit=
ution referenced: "tool".
>=20
> common_*.rst files are intended to be included by other rtla documents
> and are not meant to be built as a standalone document.
> common_options.rst in particular contains substitutions that are only
> resolved by other documents, so building it independently results in
> 'undefined substitution referenced' errors.
>=20
> Rename all common_*.rst files to common_*.txt to prevent Sphinx from
> building them as standalone documents and update all include references
> accordingly.
>=20

Much better, thanks!

Fixes: 05b7e10687c6 ("tools/rtla: Add remaining support for osnoise actions=
")
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--laywoOT544AkU5an
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaObxegAKCRD2uYlJVVFO
o/fiAQC0qRxBu2mn9qrpCb4+e9qDwMwy95k1B/6YiM0z2onj6gD/QV8GsID6JvYc
EgEDoO4HFiznrFm+/0AEfEHho52DDQI=
=oGsZ
-----END PGP SIGNATURE-----

--laywoOT544AkU5an--
