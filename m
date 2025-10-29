Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299462E2661
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Oct 2025 10:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761732412; cv=none; b=seBBfhBHYWH4J/+mkJL+yuZgAst8pGKMETAaXfrcgzVG9zwj330mjDaNUpUpeFDoPSxKgPmuA879HauijPCGEHYzVTOAUDDRaezLgvDTFE0P1FV5JoiWA3zQyv7khr8VRoSpsAgaWbpUvXqDpmRybVa5Vin0CxCAsrMjyLnXHjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761732412; c=relaxed/simple;
	bh=R7TNYAS5wBwGQKOT7kKYUnlsZDdYhtWGEcAM+aRVqRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wo+8W6WTmRc4F63D2KpA7+R+0PMR84mvwju9QvPiwKgGWQW+UPuOiYchJD8V6mfXkkCjh4FLB4vOkbFUbXtby4UDDxyHBMadm8fN0DmktNhsOGlqujCpwKxudikh6Uld0sfxCxwnU/HxKwbFwCuZphcdyWazbX/ef3Ww215gQJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Nb3BupOG; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Nb3BupOG"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63bdfd73e6eso1484690a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Oct 2025 03:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761732406; x=1762337206; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7TNYAS5wBwGQKOT7kKYUnlsZDdYhtWGEcAM+aRVqRs=;
        b=Nb3BupOG+r/UPIf6zLVMAUmKH3Ilulro+l4LYYO8/wzXyI7rVmH3j6+jWqbckrEyaZ
         DqmKqULkLQlidOljFnf5EVmXJYrOMW8f5C5z3iKosJ8ZxIFEwOXas8VTvFR7OFqjGqPd
         QkSkOOpGZghAN6ATqiCX37HenFeoE3v1oLOqSZkObRyZqMTaZ6OzO+HTybtkjq21uKEi
         qLd4tv0yXVxCy5VjkGlZapWyeKQ0wB1pzQnB5vh20DhNQH7E8EE9n51bWrip0lZDoJiN
         /cwFwxytefxehYDDbBzBdwqw8+m6wXWV0ndRqnZTpLLomEedwZ2JlLxOTFK3Q9/hXEwn
         3ZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761732406; x=1762337206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7TNYAS5wBwGQKOT7kKYUnlsZDdYhtWGEcAM+aRVqRs=;
        b=idkV0z4EU1/TxKPhD/AllPZvf1JVQttLS5NTIGZ0wTirDa1QVgkJpLI5r9LlnVTy3m
         R8Y9rmqlb/5BFWvhBic8uRNT16n0iRCFVPXWJ4eINV2uodA0eqigSx9GXiHBqC49JxmI
         97UZqE3U9EeppL9Cm95qREwcwq6riOxqlLMq2PIg3ENUtBNX5Dh/jQxqSnvcWB2IQiMO
         Y1zffu8LczoLcIckgBNBq9tTOlBAI9PBRBfaHUsthTb3K++JaM6Z3bF28hiUb3KxFALj
         YFH++DA1xncYLJzP+GBkRP3W5Ss8QQLhj/MJmfPsNBXDkM1q3Di1w6LSzzAkvVM3vLSl
         xi/g==
X-Forwarded-Encrypted: i=1; AJvYcCWIYt224zlPrsw1FvQ3edJek9j2qpbr/lx0vSN72k9wrSOxCAsuPnvDM6uLLjuIebTOlnZUvm84LPB4uD6FKcGnMr40+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiYRPTzEgdxryoYJ87cPKyya3aGO/h/aJN1G74ksmO/UaN8p81
	g/xqp0g0EEt03dcSo9Y44NSgL4rOudW9m+dthscfIPvxUk0/4yOAta6N8t0fNrrjvNI=
X-Gm-Gg: ASbGncuclLoq+lgN8O0nw1HmBZK5lShjHaRrkxl+ROuQwhWHu/bZ7FWJ6qhUYu1dmSp
	LZI6uw6Lu4XI3ryf4mi3BM8c5B/n/SE6oS7J9uVCelSnud7hb1fNxrCMqcwjuG99xRubHj9hsX3
	hI9JEFoKaE9TNLSaDLASO6XFttSSpJtu0cn8g86Ft85RbEarAL9siSapeSu4gk5xzVJt/8+aUmx
	Q1/R/6YsQVnlbt4WQNPgOlGM5TMazuU8LxZilwLprV5YOybwSXpAMQz4UIMPYzovRBczOpxsqtf
	ztWGR4bqFX5KZKxRFdRaI/hc7WxrJE5ivHEpLV39IveXP622kO0pbZtDrvqbnqeBJswl3Zntfxf
	R9kIFnK5OrQeFpi/GCdjyLrHq87nJDSdtRGy0pKPdlmZbDH1H1TbPCChjuBqnsorRI/TZhgoTA0
	T5fbypTw==
X-Google-Smtp-Source: AGHT+IHRXJzy9yzlM8DWiE1VUER2udZQSYyk7sKg644Ac4f1zGydRVzswmr3CWYbQFSp2yb5bFrm8A==
X-Received: by 2002:a05:6402:2750:b0:634:c377:e1ae with SMTP id 4fb4d7f45d1cf-64043325c9emr2072388a12.14.1761732406260;
        Wed, 29 Oct 2025 03:06:46 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6402a6be2eesm4054053a12.16.2025.10.29.03.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:06:45 -0700 (PDT)
Date: Wed, 29 Oct 2025 11:06:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: ulf.hansson@linaro.org, chenhuacai@kernel.org, 
	dan.carpenter@linaro.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
	zhoubinbin@loongson.cn, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, lkp@intel.com, 
	skhan@linuxfoundation.org
Subject: Re: [PATCH v3] mmc: pxamci: Simplify pxamci_probe() error handling
 using devm APIs
Message-ID: <xeocbqo4zmdshchzmwvpyv6spch547cwjdqimmfrwtgs5wahbe@ym75aj6663zr>
References: <20251023145432.164696-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="if34ak3qbo6hovkh"
Content-Disposition: inline
In-Reply-To: <20251023145432.164696-1-rakuram.e96@gmail.com>


--if34ak3qbo6hovkh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] mmc: pxamci: Simplify pxamci_probe() error handling
 using devm APIs
MIME-Version: 1.0

Hello,

On Thu, Oct 23, 2025 at 08:24:32PM +0530, Rakuram Eswaran wrote:
> This patch refactors pxamci_probe() to use devm-managed resource
> allocation (e.g. devm_dma_request_chan) and dev_err_probe() for
> improved readability and automatic cleanup on probe failure.
>=20
> It also removes redundant NULL assignments and manual resource release
> logic from pxamci_probe(), and eliminates the corresponding release
> calls from pxamci_remove().
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202510041841.pRlunIfl-lkp@intel.com/
> Fixes: 58c40f3faf742c ("mmc: pxamci: Use devm_mmc_alloc_host() helper")
> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>

LGTM, thanks

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--if34ak3qbo6hovkh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkB5zIACgkQj4D7WH0S
/k5MFwgAmXg8LU+2YUmlwv6EhqtvdIyYkH0TWb0g80d+RImXaQuI/g9tqNzydx5p
zOvoRLskbQadH5duJ+TPeuatZkdWDXjKnxKeAa3UqkLICWtSrOhImwbC6HlzqclO
JKBZYdKDThmikKFx/znRMIi+hLAFAjzUmMO6ebIjb/L4j85nUD3jUtopmYd7Wv5q
KSDIn8Fb+XxejoeuFqtS88QXyJ72r2PUeX2PhGAKc6/8eDZUbNnYBxWHc1bncCHP
5qkKOauJPOLKzWFLmM/Dnbsc8dwiYYXJ61vqxS8urCGdE57hb3w1w9pUY7EDioZE
TlzrXUjdzPd/fNmb1WcpXXkU/WLJJA==
=Vlt7
-----END PGP SIGNATURE-----

--if34ak3qbo6hovkh--
