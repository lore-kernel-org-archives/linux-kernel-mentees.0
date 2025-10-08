Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5E31DEFE8
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Oct 2025 00:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882276; cv=none; b=d8DNCAMbL1zHEDevA1dDoUP/BIg8bNa9UB453qwHhQsdlAwkDIj0WK65YRyTYfmgmimHiaOBnvdGqKZR9IRfahYkF7ZkXty1Uq0bSeIztkqMbSpRymuXpy6K/n2V/hECQUTWdb1FMe+cHI3e2MijHlRxd/Mb9JMovobLAa2dx7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882276; c=relaxed/simple;
	bh=ZIJx91VEzutYWV6rmjWMuQo94kEzRhO28O6Sss2x0vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8jxnPJ3gnFCTdzizosUAYgxl0zbCehyMhqdjg/qe2mYHJp06WBct4nfaOKXXRY6YkHC1CmiAUQxI2CTffib1bzuUe2TUg3A+U9AlPbjf+Q1rt0xkIB5lWXPCZeJxbqDEmJBvanHj6kisx4ZzhAIaVFOirLuzHfyPfP898B3lzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NT1ZKSEb; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NT1ZKSEb"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so363807b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 17:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882274; x=1760487074; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIJx91VEzutYWV6rmjWMuQo94kEzRhO28O6Sss2x0vY=;
        b=NT1ZKSEb37iS8PM6JfEpFMmdG0etn+7KgmYEHGAFGpfkvNZIYn83MzblF1XCYYVKg9
         fbLu7Qmvm4YPclNwzgJDDemDbHlL0Ra8VLJzHcROtGFvAPjLemnpJiyyMUk0XWUdsPDo
         eH5JKJ4B3YpuM/oZXa/0oEbCVYMVosOEuuDIZaeeJAqmpHIbvhN9kiXzZXxduMo/lE2c
         sAaXKM6wXhophd+ee5wgPj+j1DMvOxhcCzt1B8nQpk4MCiNmHbIi8X1TgFhOVOV52IOv
         r+3FtwQ75itesKS/tw1EuMg6wV+u+eJ8EAKxUHjtHAf/1To3DeoB9mfAqSrMc01W9iYb
         rBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882274; x=1760487074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIJx91VEzutYWV6rmjWMuQo94kEzRhO28O6Sss2x0vY=;
        b=JPKRiAP1bVdTg21RfblyagWBt7m19C6Nbv/zDUazo71wgzlZ0sc8XZtsuPudtrDBsD
         ytImEBlk0CwrYu3EngECethokgjab1utyDmdFrB4sPKJOIjhPma6IBFjMzLybx/QMHUn
         DMiYBj1vqPPoHFar1u8pfQztK129VAiQmy3aVIRfbe/k6hO61muyPOmLMc24qbZjwPx9
         zg5CYMQia2h1Om4jNNioiXSNjP0DMYF5r44YLn49cJva0EaEJ0DC45KFGh1C6bMFtxyG
         TyBoNQBa0TDbtVC63gb30ouwf6dyx4rq9rYOH6IChqP72G3qcvXTMzO5DzV9PuAJx9pM
         fvHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc8455gaSKdHI+Z1B/M9T+wbx6L1FJRsAY8GuXbr6Hzg5OTK2EVjaWRTyoltuwEIaibvS04foa+67KSD3f0doPrnQtHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVedHH3x1sqXKwQzOM2lb41ll/1NGkPK7dhtA3a/WACQQ6cye1
	xhr6VbGzeXbiCY+Ns7mCOgAICGFvA9JMfnKN6Qk1qL0qOGRs83HjsfL4
X-Gm-Gg: ASbGncsOswp0rEY6AxZawlLqBahxSVPdkzuDbV46dFJ9eJE2IKWjsrfM9LuQKY6lGwW
	hyFcqJ+qneEvm9s/4b+LLqu2YSHRlfIq8Q0qOXl7bFFrMVXVHWiLeJ0g0pnEgColqZpk7V/TmGV
	RLZLFyOSTDLZQugj1v3kZ1slB7ej7fPRnKeJ7PkAbI7vUP9jJcCDx2hJKHh0332ejAE6nURugqH
	4CVpIJkCNyyIRwIxIUm4jW0nbyW+0mxUPfarXasHskxM94lUt0beNIwoBq8+1fRaEc/IGNpzaMa
	ZEEe2AGpsnEzo8FNpLx5JM7RYeKlaHqbJIilTaadgPgaA1AQJ1UBg085r+947jyoaD2t81NTYEV
	bKRyqJwahGQtZcA/vEcCRnULTMzJkMJWnWO0OPnX/7EhPvSmpsA==
X-Google-Smtp-Source: AGHT+IFW3sow5y/lVKkATKYFm04W7RgDI6fSuHLvh6sjhQYKQ7ak+ZYw+RTchKbkNXukK9zwt+mgiA==
X-Received: by 2002:a05:6a20:3d1c:b0:23d:45b2:8e3c with SMTP id adf61e73a8af0-32da8df23aemr1423045637.6.1759882274312;
        Tue, 07 Oct 2025 17:11:14 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9dcb3sm16910186b3a.11.2025.10.07.17.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:11:13 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A0A074233430; Wed, 08 Oct 2025 07:11:11 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:11:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 8/8] Documentation/rtla: rename common_osnoise_options.rst
Message-ID: <aOWsH5Lgra60g9-k@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-9-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W+2lsue7TXY5gcQ4"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-9-krishnagopi487@gmail.com>


--W+2lsue7TXY5gcQ4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:57AM +0530, Gopi Krishna Menon wrote:
> common_osnoise_options.rst is intended to be included by other rtla
> documents and is not meant to be built as a standalone document.
>=20
> Rename common_osnoise_options.rst to common_osnoise_options.txt to
> maintain consistency with other common_*.txt files and prevent Sphinx
> from building it as a standalone document. Update all include references
> accordingly.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--W+2lsue7TXY5gcQ4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWsHwAKCRD2uYlJVVFO
o7BjAQDfo1t5Lr12kg1pMMFioSkS+Xkr4egh4nTgsiztQ9ybyAEAnvnzwOgWbSWl
t5mwwHHqH9/4f2X5NKq6K97vtzUEKAU=
=VmlC
-----END PGP SIGNATURE-----

--W+2lsue7TXY5gcQ4--
