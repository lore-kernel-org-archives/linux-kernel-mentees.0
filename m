Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C815D2DF6FF
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759841487; cv=none; b=SnI77KhJT+/0HK2CINPahaYWii3Nsb2b3LlOfXVspGUXkjLS85dS50BtVTp/MTWM1tSGUunAF03p9ftIVmAhL4vPpd7PF1N11IfNkAY1sUPvpO6J8Ftsh1jpVBpYq7PMJrJUBARH3MFWrHswLgXgdJUzGyRQWqcmbX2NUhbe5k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759841487; c=relaxed/simple;
	bh=Cva8F6I6vC8G5UAuRvxmhYK0EkV6IdIuOcxrR7JOX88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHZBH1mYVX0nRsITJUY1ifyIFbZgerP3dsXGqwu58b5J19AUVnBo0vHC3PgyQmfqrryXSLxvvrAuPl+4YNkwKc0bRweNM2gwn0dgfNxGsY4cU+0+C57hwGCdgLpwOXoEFvI1SdB2wVQ5/bAhN8+1CRgvwmZodUYXjERLPy2HQSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGbDBlVS; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGbDBlVS"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2681660d604so64681865ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759841485; x=1760446285; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cva8F6I6vC8G5UAuRvxmhYK0EkV6IdIuOcxrR7JOX88=;
        b=KGbDBlVSO+WAUBtnphYXI0OfyEGL7wYaApHy8q+umlpLkqQqLr7A7ynPbMkROsCEB6
         NEuFfg8knlZT7KrrffHOSiTZALb1wO9sVOfxxFQbHIhDQhRvatiK0J51FOB9bZPqbrE2
         LHOmp1z/7SpX4EwQ/77GveP4IKTbGA3RuWvPaFuAVjIOliLenRyIQx3eCDnFEv8CJNDH
         B/g1btBJcRYm/fvF/tF029nxQ7Sk/2LKzjm8RLrYzCgc6GvCBj8LtHHWKGbaJ9bTgt76
         EjK9Bop63xM55PXxFa1Hf2mLdmW8SL1EclpBuYPQEYqY1uLTIZCKtYTGFMb6CfDENCCI
         /vJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759841485; x=1760446285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cva8F6I6vC8G5UAuRvxmhYK0EkV6IdIuOcxrR7JOX88=;
        b=YUjYfUB2Y5PeZY+5xVO2cf6RVSXH5ol+zHAXYNlKCbVhX1PRSpmQMM9anDo62pq6vS
         va77mDOacegg8EvJJqelbCoIxBwgJrbsU0x+Uut/BcFjlLxwBJlMoUs+juiZi1k27HJF
         NckOSJ17Tm4eGkU5rhGDHmmJLeM5hdJkauZ4RvI1l/WCWoQah/6ZNqBtAvvaHM5yFMEJ
         lj+0aHennGSp/YP5jTgF4uwecZi4JYciiqPb/8arcos0+uD2TN1Q1bwpinrsTRz64e/w
         +vQ4MO8CznLPJcvkwpTUX/MdZiC07kyjOAGFuEQwD6/kIUAGRPEsky/fD+eM8G/BvK7t
         ndgA==
X-Forwarded-Encrypted: i=1; AJvYcCUPDqkjgZed7yw/MAwXBsYk6ZEXgjDVOKi6mibp3GNEx+zGoEncX+WFv9qK+ci9oDjvjXIMBbtv3WcSgxkoSwJ8RByfig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw14xEFoeEOTiHyoXYmD2jDaIwcon5Ov8C44PmKdVdgjKr073Ro
	Yj/9gKFcj4TKBYHAPIev1C5zp9MHk7M9Gi6/r36aschMADgDgy9Ly2s0
X-Gm-Gg: ASbGncslcQWofi41YaPtFAHwNzzqBRMdCQ6mbNu0Urp8gA18HiX61b/SP6fbHxxt0FZ
	ugtuVjyhxNdEGbKBbB5vDzq38tKR0X0J0JNPAEqfWWNhfMsLHD1Rw+p80b9dmY/QcklZtHjk96/
	vgTKFJSSWW+7RAEOAPxhgOtBEMnTLSn2okFdtthjcCooMRgsNizyrxcGne5iWTx+rXmLmExrP0v
	11tIhpjnc+go3G2gYycNazP0rT3OYZU/lis9XlCaa9rhSrnF/38frbQkn2swsnQq4ftn5yC8iUy
	AyK/YLKsbTh/hMoZw+tWBS8cap2o5nXIFl9QFmuw54bT7oGVDiZWDoiiT170cB4znnUnq0B/KSd
	ffJe5b1LeoD/OiSqycV9hKbQtNuuDm048/Ak4sLzD5v59FZ4pVQ==
X-Google-Smtp-Source: AGHT+IFTrYmtFtu6V1DCF12R/dF1cAY3Dw1DuL07n3gmGJkW3ViP+is1CMwAjywaqv3EDHY01fPzPw==
X-Received: by 2002:a17:903:4b08:b0:27e:f06b:ae43 with SMTP id d9443c01a7336-28e9a649321mr194985855ad.53.1759841484702;
        Tue, 07 Oct 2025 05:51:24 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d125e9fsm164605965ad.36.2025.10.07.05.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:51:23 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 6C85F4233431; Tue, 07 Oct 2025 19:51:20 +0700 (WIB)
Date: Tue, 7 Oct 2025 19:51:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Crystal Wood <crwood@redhat.com>, Tomas Glozar <tglozar@redhat.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	John Kacur <jkacur@redhat.com>
Subject: Re: [PATCH] Documentation/rtla: fix htmldocs build error by renaming
 common_options.rst
Message-ID: <aOUMyGvkibvOV0IS@archie.me>
References: <20251007083228.17319-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aqWyVnMMiWmFfUQE"
Content-Disposition: inline
In-Reply-To: <20251007083228.17319-1-krishnagopi487@gmail.com>


--aqWyVnMMiWmFfUQE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2025 at 02:02:26PM +0530, Gopi Krishna Menon wrote:
> Running "make htmldocs" generates the following build errors for
> common_options.rst
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
> common_options.rst is intended to be included by other rtla documents
> and is not meant to be built as a standalone document. It contains
> substitutions that are only resolved by other documents, so building it
> independently results in 'undefined substitution referenced' errors.
>=20
> Rename common_options.rst to common_options.txt to prevent Sphinx from
> building it as a standalone document and update the include references
> accordingly.

Fixes: 05b7e10687c6 ("tools/rtla: Add remaining support for osnoise actions=
")

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--aqWyVnMMiWmFfUQE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOUMxAAKCRD2uYlJVVFO
o3YeAP9WdHh/AKliEi1H/a68qdAmPGP1E8E/I+1Uax3Rh/iTnAEAtEZNoEUlrDTD
kmIkMjKutwIPwYQG3Yr/miznYMlg1gQ=
=R3wE
-----END PGP SIGNATURE-----

--aqWyVnMMiWmFfUQE--
