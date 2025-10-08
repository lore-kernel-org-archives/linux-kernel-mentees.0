Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5E81400C
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Oct 2025 00:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759881704; cv=none; b=PCjMe/hKD2nGSeq91wgOH5712XYOQxasuRU94dpUEHPeiJzkFjYjUS3we6ACgRmwNM0UGhozAyIdQnsGGnI+BRgidy5V/auf/7VOm11MlHhIXJTYh8IQvkvHyyDiQHQdIfTmfo1cz8fsHgWoq9fU+aQXUqucKc5RBM/h8Ei4dMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759881704; c=relaxed/simple;
	bh=HBmCVEFJbv2kiaRdVBoJHVhH1kJ5GFIYxxjuk93NNyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwjaoMtJ1NfvlGllL4Ibsr2ku2TanzJ/2ruYqpTuMPwiyc/EDdb53LvGqzTCdbKVtIA11HtfJY6vhBiaDZ/DA9/VzGzAC4YULd5Ax5hvKYdxmc5KjvJaAUG/VDdMCrwyVMcB2BnmLkAW4u+C0GzhNg3KUcceGN9UucrkN4eg9SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZhUEWdA; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZhUEWdA"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b55640a2e33so5104441a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 17:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759881702; x=1760486502; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HBmCVEFJbv2kiaRdVBoJHVhH1kJ5GFIYxxjuk93NNyg=;
        b=JZhUEWdANRSsSsGI+Jv1/uPa4K91p6nWj5cZlpJW9Otzev6U0bWJ/UYuD2zAnr0CJD
         v5kafzsR/rhOf12TXe6sPZv4o/HEwiUrYzFC52wtG14HHxdkLvTjxPY6KTPTMovm/hjs
         zez96Ss5THmzaZWmlhPqPifwmVPv24otufxggvtzmWew/bPoFPKIOxJPMtYU3qFx5tZw
         A5EdKmbet5YQMQsYMKU5FU3St+anBsfCQcK54E9Mn80r39J+dYdX1O/cuWAEX+/Sgm0l
         NDgvf6gLwwnZd7NN8XAnOtGaqjonKR8LKY9j49DkQCqKkW606DMDA0tQBPeaFS0wkBUS
         NypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759881702; x=1760486502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBmCVEFJbv2kiaRdVBoJHVhH1kJ5GFIYxxjuk93NNyg=;
        b=SPkLi50l9v4krdjRyb+Qoj4mE4I8hYp3x6lyrfQccp/M1GTjclKP4zxtne7bf+euLj
         5Msf1+DIP0qSLyFq2V1IJ24GiNPzLdYtu7JURrTz8qzbj3PFGufYih09Y3X5b0v4azsi
         ANnCnc5IQRHdJlVCi3pPF5UCs60JVVWDGKLovW5ANnxCdBGFDGFkiNJijyuVEAwF0sGI
         9OM5/3SO4ZVArcP5cHdLrcsrhp2rBdVOq0uEoupLHgQaJmz4SD54g1ZfR5Ad1QG+q+5e
         btntvmGop0KRXb9Y8AAnW73jkhDZ7cooL2WpccHNr/NHF50Y2FLX4U+anxCsm4g0gn/f
         ee8A==
X-Forwarded-Encrypted: i=1; AJvYcCU+2eWm7yv6prdrrwbft8hOkaP6QzYu8IfoZNPu7KJ8FxcBRen7DeM+BUj2gponrmzcBGmk30hZKkk/FRx8ctlHmi+VtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSHFEH+fL2NYroODsW10w4IfIIiPcruTC7S3yhF4DCpXX9L5kT
	2Izh+pYvlbbPAkJWC7cU+jZmpjoyyB8glcAla7QGDxEy9OJFWA8EII9b
X-Gm-Gg: ASbGncsJ9SaiOYEpYs8B0WM7ozftxT6yLEw0SKEOpvsQMJVX8DHwTVd6Dq2ksT4gkLP
	I79ZF5MU1NEm9S38I3oY9Rcaa9dpppOKCvaBA7D0vU+lJKe+yjkph7/seIlqicOsoL+QSb4+bVy
	H6h1x+tvFwjnJ6SZD1Eos7ukHJHeq+BEzlgGdDYtn0LlNlo8Ri3RFPvDJMVHavqtjhu1/YmAyHP
	xW95xNDD2w2prLUGiav8X89iiaV7b3zZToiUP7ka2ZXwx1iMPbJqzGC87zNsocwtXH32Zy5KLMT
	n+FnvmcaqApsd6oUkCZIdpn6HlEbtcv2TyCeh6dDqBklq9Hi0N+/diBCxh8VP4JmWfCsgGYRvTt
	hV5XNp93dZ7xAu3lv7ycOvgdffaFN2lCeVNRcqdrnMZ/kHdNSJQ==
X-Google-Smtp-Source: AGHT+IHI6SipQj91c1vmLSFiOqIaOwefO3QQs9+bfgg/4mvECMIsZcVKX8SEp5HMEolcaTUK42Latw==
X-Received: by 2002:a17:902:e54a:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-2902741e857mr17501365ad.53.1759881702182;
        Tue, 07 Oct 2025 17:01:42 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510ff9a8sm980371a91.8.2025.10.07.17.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:01:40 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 062764233430; Wed, 08 Oct 2025 07:01:37 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:01:37 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 1/8] Documentation/rtla: rename common_appendix.rst
Message-ID: <aOWp4RXBN2iayT-p@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-2-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bPrGD7sryDE01aLw"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-2-krishnagopi487@gmail.com>


--bPrGD7sryDE01aLw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:50AM +0530, Gopi Krishna Menon wrote:
> common_appendix.rst is intended to be included by other rtla documents
> and is not meant to be built as a standalone document.
>=20
> Rename common_appendix.rst to common_appendix.txt to maintain
> consistency with other common_*.txt files and prevent Sphinx from
> building it as a standalone document. Update all include references
> accordingly.

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--bPrGD7sryDE01aLw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWp4QAKCRD2uYlJVVFO
o4OOAP4uFuO1E6ytqdspEZ4WG7emXxflG1kNie6NJqWxpwX+MgD/T4akmHZvTpT/
XIrgErE+u7Ms0xsIdcYEKAqyV9wkKQ4=
=GCZL
-----END PGP SIGNATURE-----

--bPrGD7sryDE01aLw--
