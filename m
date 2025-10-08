Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326272110
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Oct 2025 00:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882033; cv=none; b=SvctKzZx5JP8gci2CHSrEjFVEBS7to9Mgl6yLFjwj/wI++6ioYv6yyDY3fJOnXKiE3qN3nSDnlB1zeuUgr3grP4qqdFHBubAk7Cluw0xpKNz7f9P5oHgS3FwQuOyxRmDNIc/dN2XnrJlYDvgJPkVwx+cRVV3aMB/GvnYXhBDYVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882033; c=relaxed/simple;
	bh=vC8ooiip9yJoKnRrYy59NMGAT5KdgSyvEGK3SSFeUbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGHXpr0zXahJgBDSboftsLTDUf+37uOQ2qBO1EFNK/OJbNB6rVO+QsIujgKS5hKucqXWkg0RY4PRkwLtxHc/+h1gIw7X9rgJfuM0wBKMm43PeYZgrzVV6E/Eanq2UFwcVZzHN2+bATOwUeYn1pT7uOseO3/LdMzTeVufx3KHeDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vak9R7+u; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vak9R7+u"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-782bfd0a977so5966703b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 17:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882031; x=1760486831; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vC8ooiip9yJoKnRrYy59NMGAT5KdgSyvEGK3SSFeUbc=;
        b=Vak9R7+urkGg4NkW/rVarShRbg6ras89v8E4p8KjvthDxmn41osbxUSwprLm6vNlDh
         1vJONIkw8YGuEX1bslyIKvoBoTRJsu0tY6CU6CK1BLDpY7NGvxWInO/2fwl19WUBXTz5
         pJYutYZHfwmQJpwuTDfCIdc0TeuUM5EJO9UUg0Ko7oII9iWuxG4qwRIUo301HDQ1nRbf
         jt5q3Us6P9wETDdLpjNJsGjQpxdDwpQyeFiDsjlxnOOrkqSWR+6CvKIIEbU+1x0LtKdV
         lXAzKr1+xSEA93Jtrz+jcP+2UcIvUx3siuIzH3bcNZVE/a2yXx2QG4YGihG0vBVgsubM
         GqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882031; x=1760486831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vC8ooiip9yJoKnRrYy59NMGAT5KdgSyvEGK3SSFeUbc=;
        b=BlmGBKixn5x1chU1TRkySmDR4Q9NpGrDrUzU3ZtDQ8K9mUDfkK1SCa/jm+Lc1W1Znw
         xGJMNJbg5z49kVW36KCqe0LkMhsghRlm1kK5lzmLGOqwg7OIeMHOyANCcr7DKKDGLlGj
         4DnL556iY2SqMcbI68VDO+AaaR55CGJdBZKXJvQMhFsMp0DGaljPR2yALy2txo6YQGrq
         Y4G5g2xgwe/4ItfYzREYO5AfvFuw6GF8aKKoEb4bzWSKnHn2PWG2FXDnGL28kU+UB0FJ
         760G1FneXwaoTNQgdbtYsxS4nQMQUH3YaH/UkHsbwnO1ux3lMCQxogPR1rX29qVOj3pO
         oBKg==
X-Forwarded-Encrypted: i=1; AJvYcCVG8WJvN5nOqsStXIn94ydmwXGik1K6jjLNdGH7MqNtcM7ZTnLOHATMzAvyH3I/XbrOE+JCSPhFJLCoGXQG6h4nBs/JOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQMTo/nZz5VtkKQn9OoESmWqGHDEZGg66OdMsWwtjN5T7mSWUh
	a7d8PXrJKKwBKOtMBF2EJ+OltJykMU2xFNpfZrl6LgZNyVmbXJh4og4d
X-Gm-Gg: ASbGncvWNKL/lokTimk/awCu4a6BWld74kGxXoXvn2mTDvMS5eG4xVR4LzcxCZOwCJS
	s0/9LJWmhVTuff5zTqcF4mCuUmV1JJFd5mMMi4SN/g2u0rAMlzuubXq7NAU3yFTCWDU3KFTeiyb
	J7Fvzi2CnZK1e8OAYmQzIagOtL6f7vS+3wmfEk8j62aeiQNJGf17OP66PE8ZPuTonMlqeJgZXJe
	mEEUhz8T+y505yJLY6CNxakjWF5z1mFnuVeWk27o9g1AEAd2G70nmMowkQMi3oIQrA1KTbdhIyc
	58fX0MvCxLQNHkQa0zg5QzQNublg958XtdBZFnfKTukSvYrpZmyvuoXQUYHm/Xzg+J6bWZszlF7
	lUCCPn02wTXySANMIAOHBzOyK0n9NCfK0nbe1d/18LywALfHpWA==
X-Google-Smtp-Source: AGHT+IFc8t5RIReyxhe/YhSffa5uXVtkzd3/79NpH3j4fjj8RiMnktaajaSJ8gcmock1LzX66HbTfg==
X-Received: by 2002:a05:6a00:17a5:b0:78c:99a8:d294 with SMTP id d2e1a72fcca58-79382c6bb87mr1630730b3a.0.1759882030944;
        Tue, 07 Oct 2025 17:07:10 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b020537d2sm16845105b3a.58.2025.10.07.17.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:07:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 50F3C4233430; Wed, 08 Oct 2025 07:07:07 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:07:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 2/8] Documentation/rtla: rename common_hist_options.rst
Message-ID: <aOWrK-vPQaqbgUAH@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-3-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B//GlOCCMvZhY8mv"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-3-krishnagopi487@gmail.com>


--B//GlOCCMvZhY8mv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:51AM +0530, Gopi Krishna Menon wrote:
> common_hist_options.rst is intended to be included by other rtla documents
> and is not meant to be built as a standalone document.
>=20
> Rename common_hist_options.rst to common_hist_options.txt to maintain
> consistency with other common_*.txt files and prevent Sphinx from
> building it as a standalone document. Update all include references
> accordingly.

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--B//GlOCCMvZhY8mv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWrKwAKCRD2uYlJVVFO
oy9ZAQDYJV6qE/AzMUzQwGGq8HBR5bcwCtyChfYiU9bhnHMyLgD/bkifhp6WZd4p
YPpU7zjarwlFUjfFPhgF7OOFDRTrkAk=
=kSCJ
-----END PGP SIGNATURE-----

--B//GlOCCMvZhY8mv--
