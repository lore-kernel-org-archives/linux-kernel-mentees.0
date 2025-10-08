Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B449E170826
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Oct 2025 00:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882181; cv=none; b=RUBTm+U1sH3TgY1ZZvjrm656BJI0zGE/ZF1afrtWwCwdXcoVfSLaJjov/zGStHABUKOWkA5323BtuXtmy/YDqQeJfNPTAePRb/O8ZvH37fcz6B/2iVSXuYDijAnJPkPqYRCycM+yter5yLkeklL/8MuoLm/EHtEgbR4c8TFPBTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882181; c=relaxed/simple;
	bh=SiqBsvlUVBV9X2tD7iHdB7FMlNgyz+EJDz9g/wHLMx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZShfgz4ikBmJhJa2JTiqFU92e2HAPWhuRkqfpvJ5+g6sngyZXFtPVJVJgUDxblv3u+vivRrEWOkBqykXLT8G4Sln2uNjSAHzmShlCIaoGwA5HpIuoJBcHHmo6W0esQwuXACvl0tQiKnUSO2RNnNozRTD4Cray/M5QRJzI7Nt0H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuHy/sK7; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuHy/sK7"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7930132f59aso1522889b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 17:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882176; x=1760486976; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SiqBsvlUVBV9X2tD7iHdB7FMlNgyz+EJDz9g/wHLMx0=;
        b=YuHy/sK7ZNdWyswYCny2QI56Z6ZqKOY2KEKIFvlD7fEP4o+wbWq8Ss8HBe0litBiJr
         ovv5KiRz+nS77sC4o7Lxru+K4gpoDZ4EnAr0TuxnqgV0s71uRxjn+zatxTEHCl8Y9OPy
         HAjjysiyMOsko4bTpk8HnPaVQtNjgSMWOukdLYhvTMdMcNuAPypg+nTgXmiE0mjeNvnG
         xtfp7jBLPlW0Qj1J8/DJ6z6eUPxnINtNAHazY+qyJHhryDSappHCKrTdnDM//JV0UGaW
         AgvMwotamtVrauXXgI+GkD3V1Tji9WUqF/0JN3oG0qBt82vhZvL0POusq3PDWSQRzdYT
         ofjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882176; x=1760486976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiqBsvlUVBV9X2tD7iHdB7FMlNgyz+EJDz9g/wHLMx0=;
        b=sl7YTAr1jqO9S4Bte4R1Z6vWrHspe4RbvoRxmD12fur8qxtG5D/iVOXDlEPxLrBW7W
         k63fx5QdRTes84nSHyrUvF7VX9/Pe5UZJRQ+3CojPg80vEoBJ9b2M9RWXXKv1GksaNyY
         CAJU1A4/+1mnGvYAxZx6JyqyUnB5RZONdO+x/KODynjRFuBR0qbaaVgiZaKJf+8+6uey
         SJ7G+AaUGlEOsezTnO7OfqxuTxQpqCumCgtPWLPW5QPI1WmrWR2dUUOLH+hVH2CUyeNx
         uqqHLaBr65Go1quktpwl/tz492b0ydqIFz3l1X3f9j0bHsbW96XZXCuECOMMkkZ6A3bb
         851Q==
X-Forwarded-Encrypted: i=1; AJvYcCUh3kM4tZCSFsEEClMTaZ/qPdim2OlDQmr6RmAYn6i1KSH6rBTmZY8FjiyFt0xrOMFO5jRboYZ9PgLbQDHH4u1dDNggyw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt4gH+oLBOo4SnPTFrB6m/F+s6nMm37cUPq3DvaxA3dk2qqjCJ
	KRQ1mQbnreY4vCSXQxz2t7OzZwatRzIVgKHNOJiu8MHj9kbvIOBKs7AQ
X-Gm-Gg: ASbGnct+ua+LD53v/fqVJiwPQH1+6ZK75TqVOCQs4MaaIUqe5G8IaGspWQ498eEYlHq
	2LkacwhZiBpZNTpR3YB9umfZZS/YYtMCj5WjnMPpsLRGU26Rfog8KcDxqXWTXTgj+zO98Nd4GDK
	W5/tZ6ouK9SIbSrrx1pRpD2th3g39Vjv/WJdWwj+fGw4yAcP916Qc9FWSyfwvJ5qbBdFvsZjTca
	C904atllWoOIrQCiJLlxXjMXBoF1aS+TZxWBnfz5QNrsGV1+G+bkBRs1tyQacGrLJWL7+uIs1Tq
	qLOxUNftD/5WVdv7qAPk6U/7lAmWgp9OppRyUdHQQjVZS73CSzSNxmnwGdHMW3FfATKyDbKhILe
	xdi30es3kUVn5vjvoNNJZ4dTPN/yQUIAGVuCdRvLVKKAcC3+DEQ==
X-Google-Smtp-Source: AGHT+IEHG1de0uoqO9lTHMhoFoIvSH90FZPEhO4rUV9YGSfs1T4dWZ9gPM/Xr/7y7qCcN9U5mlfWcg==
X-Received: by 2002:a05:6a00:80c:b0:782:5ca1:e1c with SMTP id d2e1a72fcca58-7938723daa6mr1650070b3a.21.1759882175592;
        Tue, 07 Oct 2025 17:09:35 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b020535a7sm16838884b3a.54.2025.10.07.17.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:09:34 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id F13204233430; Wed, 08 Oct 2025 07:09:32 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:09:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 5/8] Documentation/rtla: rename
 common_timerlat_description.rst
Message-ID: <aOWrvAA6AO27pI6_@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-6-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="II6TKWeT/WeCoHc0"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-6-krishnagopi487@gmail.com>


--II6TKWeT/WeCoHc0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:54AM +0530, Gopi Krishna Menon wrote:
> common_timerlat_description.rst is intended to be included by other rtla
> documents and is not meant to be built as a standalone document.
>=20
> Rename common_timerlat_description.rst to
> common_timerlat_description.txt to maintain consistency with other
> common_*.txt files and prevent Sphinx from building it as a standalone
> document. Update all include references accordingly.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--II6TKWeT/WeCoHc0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWrvAAKCRD2uYlJVVFO
o4FmAP9/w4MDtIyaMU+Ss/owPly7TFCYgH/WICY1CZthinPMBwEAzV1VA3ObJgkL
f0XErbJOut5p53OZ7XcUvsO9/0GmNQg=
=4qSZ
-----END PGP SIGNATURE-----

--II6TKWeT/WeCoHc0--
