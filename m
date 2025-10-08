Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74983134AB
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Oct 2025 00:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882070; cv=none; b=YcjEoDPiwbFHM0cKruQ0Lc13Jtwtiwj+hAQXgo0YGKYKGW/4um2D7KzlkB4JvTZqt7hyxqPfHihncdEjBt/g7VKqgPTmPVKjyDtBzj80IzXLoHJWsLUAxGaH0dhW4Cbm1TykDBAqP3eCjdPUj1MbbrEyIQlIKkw10MDkWBdI9Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882070; c=relaxed/simple;
	bh=l4S5DxriXVBDip76PzIYOyJuhXHx4LTL9c53nJwdfoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGeBIbOfQPl8Nveav64619drOnbtgqXo8IcuuJeL+vUYQTueEQFXuBWlzsVB72qjOI5zXVypr5iLMxUr28EbXOqmI+xVmURSeDsUaIXqox1ZH8VSBJ7wgcSCaCSNYSjGk0+fdugx1AoismysN1dfPeoRRehCo9MVPdQOrZrNCGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTf2Wd+c; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTf2Wd+c"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b631b435d59so1165978a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 17:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882067; x=1760486867; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4S5DxriXVBDip76PzIYOyJuhXHx4LTL9c53nJwdfoQ=;
        b=MTf2Wd+cFW6q1KP6h1ZMcB53nEgdearPnbO2WEC6hs11A1LAYPesyx8EkdpjrpqqFc
         VHXYl2QxqX7fYd16RhvPoQQOuqTGCDQWhjeg3Vk050fUWqt/9GYnB8/Bot0Iw19ClV7l
         UL0jSY0HyhAS1x4a2+YlK1opSpIlvLnc6XGeeDEvMGIjBEo5c0cNILh0fhcJhCp+yknj
         OHeUSSjnh1R2gQVQvrLdx5b0UKHb7H/i7910h17moN799+dgrKoc2S9+xGsXqPDixsOy
         mgIW3Ac6umTRQ6ywm36xLipz5/uattycYzoP0+GoWYHvziBpXSFjZmc7P0C0q/RIVMbs
         pvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882067; x=1760486867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4S5DxriXVBDip76PzIYOyJuhXHx4LTL9c53nJwdfoQ=;
        b=SL6WjaGb24BI5LNKlFO1Q+ixmn/stuVo+3O14WmBbxa418orbFYFfDEqZ+9tvo15ca
         1bQcTm3VFLhlUM4A5rum5ofTHv128j58bDMwfMZpf52VyOKUYFOBUtigHQd54Jh7I05o
         LuBF3hcvn/keXELRE/A+W9QNuOPbreKdYncOmybEyPqlBDqDbNJAfghrXHK4jbM1i1hP
         VC2kIXGSrgrgYHPDwBlL7qZmEkhdQp+cv2B0SJKE/kWTNHQugaBaRjI+RNJlL5Ri6a/F
         onWEhWobqHcVfHBqyvZbm4/hfI2b+MpVhu7jtWJXk74S83zswPyLyuR/eqi5x6/utlmm
         /1HA==
X-Forwarded-Encrypted: i=1; AJvYcCWrVnP7J7kL0qrI57yAnumGALiNREB3yPTmFy5FyE8l8OFBzQEvjpgepUM7qYgo5AZGjLFLO8ARDy5lNyTjnMSGE7MjAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTL8fmI5QXU/PKXpCN6fSrp3LdUXrdCskJ8iWZD7qQ1OgflbCZ
	xzYQ/HD34dl88nMY0WkR4uq4pMR+fxnoqX/us3ozAAU64PK8m/9YBqlZ
X-Gm-Gg: ASbGncs2lDc6fUztCOHld5TBxYz2/fJfUvSBTF0p1Qtl5h98wWRIsecQ03cxbYmDW1U
	W4XFAalGDue5Qcx48X14Nua+L2tMmEunirIEUSj2+AWXCnBbv025YXSG7IAdImHpCgayus70ArP
	WIm52xP2yZzDKNximZBxn3X7vOfYQepJ/3DlfRqsf8h7mg/5DmBshIUakcinaGbwKbkLAbK5ZrP
	cOtjOfo2AyQa5eqMvBjRLGyEqR9KiSap+EoFGvCvCSI0nOy7K2pBIy0W2hwodkI5/7RWDmSY4KE
	Te6M4juV8cPfPycA4FvQWUf/mlEwb5Pspq+KnrYFPNu06NK313iBx7t/Ap1r4wFw4jImKPOF2ev
	j6fJEeDuQkIZ3r8USbmtjJFOaIRLJYW+TMjU+2vt4O+R+aO6jaw==
X-Google-Smtp-Source: AGHT+IFvLrrTtLYc/WdPj/MLYULIodTkELvA/9nEoTpJDQVKXDnFiVL5AgqY4kmgosIYn/DoCBNTOg==
X-Received: by 2002:a17:902:e550:b0:268:15f:8358 with SMTP id d9443c01a7336-29027402ca0mr18266115ad.42.1759882066181;
        Tue, 07 Oct 2025 17:07:46 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28ea1d99ab1sm140124385ad.9.2025.10.07.17.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:07:45 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 262AE4233430; Wed, 08 Oct 2025 07:07:43 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:07:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 3/8] Documentation/rtla: rename
 common_osnoise_description.rst
Message-ID: <aOWrT79N-Pavz-6z@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-4-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v16T4K3LqUohqyO6"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-4-krishnagopi487@gmail.com>


--v16T4K3LqUohqyO6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:52AM +0530, Gopi Krishna Menon wrote:
> common_osnoise_description.rst is intended to be included by other rtla
> documents and is not meant to be built as a standalone document.
>=20
> Rename common_osnoise_description.rst to common_osnoise_description.txt
> to maintain consistency with other common_*.txt files and prevent Sphinx
> from building it as a standalone document. Update all include references
> accordingly.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--v16T4K3LqUohqyO6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWrTgAKCRD2uYlJVVFO
ozVZAQC5CsLiy7sQl+rTtl5xrbElBxWgvxQ21/IMGdTbJfuv9QD/WSnjn7oWG8BK
g6i2dSDUeR5aG7vCmABdR1Qmzhp+ggY=
=skU1
-----END PGP SIGNATURE-----

--v16T4K3LqUohqyO6--
