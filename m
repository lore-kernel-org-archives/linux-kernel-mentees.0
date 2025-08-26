Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FA01E522
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 00:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756166420; cv=none; b=sUL3Q4eHmJyxwfTLuj9kdMt3zE7XcSb4qjQCEeN4sovnM+bU0gs0FO9eqwjfYSl2kHOGNeCoM01B1bsKRgNWpYbU40UMYuhUn4upU/O2BM4pxRGAk4ZuDcunK9uPV4kL7FpA5ccVkpU+0mBz3yVoNeNllpd5PqhKRtf9LQyKCzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756166420; c=relaxed/simple;
	bh=TDpFI82D3io9gMkfH/lD9/zXLjfE7kfmh5GusZvi/F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E81K4sgRTvCKntzz1C4b8nxNYk6NgvxIpgNmgO6HN+NE1Wtup0DiSfNoGHleA6v0GTJJR10Lw5OWEURFaC17EmlqwZt6VD5+92jnTHKchaSqu1epZqEUsnZXbzzyamyn2ES7N08F/ivDLFif3cSIoq1mtXLaF1IZmilqssdDHAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Heb5liDg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Heb5liDg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-246151aefaaso33602585ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 17:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756166418; x=1756771218; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bhz1fF4U+DhNYPyCFpw/CCH8ZrUQI3yiXeaOt7DVaoY=;
        b=Heb5liDgeH8nCBu2qM7SPkiy7+1d7m3uYA+kJOPz4Qf71BcjkwId/8GB3DuvHZwbeU
         D4gXtkR3yr7ReVc31Q02N7zJ3BoHJlxDQqtOaRPqFR2YOd/oAg06535skKXT02XFI7Ey
         tUYeSAM6RlzKfG7Hv21IbXcm5vIp5ojx3x9ln/yVgv8A5IVg/QUDlPMkyyCYYW1wxXmT
         wLC/ASRVfI3Lojzw2FFBEayMmlS4K0EspuyF7wHpbv19EiZtw6tHjbf+Hjq8ESU2UdPL
         8rwnc4qR3ZhMP//YhksxED9LWMttAx8HQzCh0h9v0vSnf+MTFLILve//edMFo9gj/v+2
         OKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756166418; x=1756771218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bhz1fF4U+DhNYPyCFpw/CCH8ZrUQI3yiXeaOt7DVaoY=;
        b=wnQZKlD/EEry7N4mkr78D24eL9ia85JvuAMCyNm79nKpKctxrcXLkmrhfqotwQnrjM
         EW8L96sPalJodOhKOY6Z7TYyhF4amCxyzyCkvIYYti2oDl4XyxTx0ad3pOUf8qpggi9Q
         Nv3zlzg6bzDmxNrVpHqh4auwlBLFxWfGLkqCamkaqcNYZlZtsOTzXwq0Isr+TfBdLWj9
         fQqn636aBGGb9btes1kNy2MaK9oDTA62cg+JSU/Jazdf+UB+uoU3zs0gkdNS9r+UpIV/
         ekaBJkgZU0TggNgFPztF4NXAPD1EDoj5grzzn54b4DjJ1SULhJ1g8zu31+otHRMMY84u
         SiBg==
X-Forwarded-Encrypted: i=1; AJvYcCVLC8KsiNa+OmKaqH6RwUI0SLknQvdq6TzTI89IVC6avtRQDItHfYWCe4Sh/NMKPyRF1vGIu0RAYy/GLOQLdrKorLTi6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEiUDZIGyfYNFwotr/6Dl0vhz1cXCtqo+hdLRO7VMNe7t9vFkm
	nEE5ny1EtoFRCp/RDGcFShgSlyEmuMS7+/VMT5RlbYgULjeGwcBQ2mqZh6QXVLXQ
X-Gm-Gg: ASbGncszDLuouOlctVL0sHyenyk59Ir7GkwR94nyBJiAL8v+NzubWRVvx1eKduRyIdd
	z3Krz8B3d60t7h6BD3BnyNE3rbtY28O0zrcB99i2g8p3jJ1x0c1h0Li6xeN5WOXjmghVc8GLehE
	oVCm7Ffyyx4EkL3H9SYrO2hmIRsbbLQ3NbbCMH0lv+cOJarElMkuXOWGqV53Q7r1Q7IblcBX3ft
	uicr0DMG8DFrfTKXTYaSbdge6nhxL8zTMYwlzBjoyjoe0z458P2eCxrbr/GK64oXtmRgr+f9HCf
	A7ehXWKdJjidWcugQoHSc3Mmn/ELrOGTNP0KR9wrKaz1T0NwbpsCq9RB9mAxbIe0Yn0+m1dbTNb
	cvCwmYBGnZGLyJqSQU2tpo07lA7epxn0R
X-Google-Smtp-Source: AGHT+IEMgSMRQ1ikjY4VVuI/uxUeQ227HgXNoOUIeOsE0YIjbeix1xu/8PdTXUgoE19eW0OYm0XX+w==
X-Received: by 2002:a17:903:2a8e:b0:246:7e31:ddbc with SMTP id d9443c01a7336-2483df49581mr13729215ad.13.1756166418312;
        Mon, 25 Aug 2025 17:00:18 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466887fef9sm78286985ad.114.2025.08.25.17.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 17:00:17 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id DB23C424E25B; Tue, 26 Aug 2025 07:00:14 +0700 (WIB)
Date: Tue, 26 Aug 2025 07:00:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	I Viswanath <viswanathiyyappan@gmail.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Documentation: process: Fix grammar errors in
 management-style.rst
Message-ID: <aKz5Dh8sS8_tB_Iz@archie.me>
References: <20250824185015.6312-1-viswanathiyyappan@gmail.com>
 <87y0r8c7ga.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JxywI3ScyCU0OdPl"
Content-Disposition: inline
In-Reply-To: <87y0r8c7ga.fsf@trenco.lwn.net>


--JxywI3ScyCU0OdPl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2025 at 11:10:29PM -0600, Jonathan Corbet wrote:
> > @@ -42,9 +42,9 @@ actually true.
> >  The name of the game is to **avoid** having to make a decision.  In
> >  particular, if somebody tells you "choose (a) or (b), we really need y=
ou
> >  to decide on this", you're in trouble as a manager.  The people you
> > -manage had better know the details better than you, so if they come to
> > +manage better know the details better than you; if they come to
>=20
> This one changes the meaning of the sentence

I think the sentence means that people under a manager know the details
(i.e. intricacies) better than their manager himself.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--JxywI3ScyCU0OdPl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaKz5CgAKCRD2uYlJVVFO
o9+SAP9w++xpjhfwavW2hIqz9hhO9CwZPxDgSmKG/kD8Na0i9QEAm6bikX22FoRn
CB9SZYae0kv4csonpddVwv19QQzwpgQ=
=pnJV
-----END PGP SIGNATURE-----

--JxywI3ScyCU0OdPl--
