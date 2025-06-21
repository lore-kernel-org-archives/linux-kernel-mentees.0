Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE36E2745C
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 21 Jun 2025 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750504922; cv=none; b=kjrmF+jtyQ/Q6QikVDZHUZGjmUczczN6pFUbNJTrf8awc7rpX2c74xV+hI+MJXnVXSMT2awN7XBZ0KJYcEBcAXx9RDJbLHRBKEAZNK3//Kz7DOAbC6aDx7Piq/Si3sFgu6MhXPlL6M6TMj5O/6oMYUBAcTySse3kbeTZlU8kDOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750504922; c=relaxed/simple;
	bh=ohRWAiCfbgS/aXA4RVDCNgMCTaTOzaemdQHvS/o3vaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQKJpq9UE9vuVniZWoAyXS5hstLFgkMhIBBDhNqbsuNIi7jERU4y9M4Hjel+eIo5XTZI0YnHxV5esOdS0i+m6MI+BcoRvZUYrq23ssUzleIJ7xp1gmUpC8SjnAvsHgt6hQOhY5jSLktjk8f3ymAi6TNO3LH4nAqKKtbqAvZG3Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOXilbID; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOXilbID"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748ece799bdso1814192b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 21 Jun 2025 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750504920; x=1751109720; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=woaxyv+j8Y1KBB+MeQ1QihpwoORfG9XIi5cXFKLshHY=;
        b=VOXilbIDpbfh5SnzXSHk7N0C9AkLD7db9MHPOsOWT3GVuKgXe8THIk6ksl0NKDjojn
         +B2D5LqfrET1/nnmuTjTyTro1Y8ZKsgaQE4GWfOgnTUZ7ZVSqx7cqOzkJ3LLWlC5Mk1B
         epnRMd3JhSLQhUPLUNFKIWzzpCMDvTpZllTX/dt5JeOnvd/BHwd+bSD9QLw1tvRSOHKd
         eMPc0YDsKqUPg5tNTFeppeQEmTIqKkURPEHq9GQrGDyn6Buitrbbxgmisu9hGbjXRG/1
         DFWdrR3qGmM17nwwtetmKQVmjwTYGD2xWXa+SJmRjKNVdxBx0tgIF7qVIbhFC99Kk4kV
         Z30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750504920; x=1751109720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woaxyv+j8Y1KBB+MeQ1QihpwoORfG9XIi5cXFKLshHY=;
        b=kgwT4X3GWt9MegfWtyDf5EYdscuL1aYvbOmTpgxfyLWHdH/CUbiOjOP/4f9iAY3gFt
         8ve+wUk7XomiDD2iLWG/JFtTfAvL0oBfoxrqEVfjTztTWNq41grkeupOgj0BNabHlWwX
         1foyqmeRgC/cVZ1YcVnzusMlAh0/V/Y0bUIeO+lED2SzAMNDpB1NFb1cvy8dqNEfOXoo
         tQQ2PoA504uI/8GK8Ui0QOPVRUUUp/b4ldqQLcpLuPPzzdrEhBradfJxPn8t0D6ew7kU
         c+B16vUxO+aX/yzOhfnWmdVEtj8V6G8vGseWAxNgRM7T49GQUzlwnCKhNpAdO4y2aGYQ
         HKhA==
X-Forwarded-Encrypted: i=1; AJvYcCXa6DsjfIZNqguqlyx2NKcT/FTt4HPVk/Q395gPej4GZ3hHP/ih5ApJhI41aGSubw7De0Cr0hnYlVvW1EeMMxR/6QZOcg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2eCMj/ZJKTixVKZfzSUSWzwzNMZWm7HAvO402nwTU+xx68AuG
	ljl9wBajUELRJXAbxSsaQHFGsx6BgyLeyBz7h/V3O1wGPj3wm5oSAOO4
X-Gm-Gg: ASbGncsT1uOYUJmKJKuGGxlLKdMpIwUSExqXh4106eKQ1c9SVvLzncEgpKDjst9yHUy
	P9rtx2w+Y9//HI1ghW2yqZVSMLjiu4MBfreE/OXLm3gm5foqoCiOZGTAnUKdoXy2f3t5hy0EhY/
	Txzx7odkCAUIi/g5yzKrKNaLRrsy1207D6IcagCrWvnm1v/LMouIiX6sH7MgDjqieh6QDA3KuKh
	UH1POnbWKBJ6dW+4Q5i5+/Go6YT7cb/63T2rMmP4ngEEVuBwpwt1e6h94q7gLu12Mf1WES3bzSK
	YQhnXkT8mplnO75ia0jyG2hGWx7ZA57unS2hYe4//76R0EMuE+4toS8l3Rp1dQ==
X-Google-Smtp-Source: AGHT+IG/O8T1LnjkmwUuzaEvqwFNIWd0CfKLMGROZs4Ty0QlCl2WpaGZb0qmuhiRZruQg4JzjsVl/Q==
X-Received: by 2002:a05:6a21:68b:b0:21a:d061:2f84 with SMTP id adf61e73a8af0-22026fa63a8mr9871935637.30.1750504920143;
        Sat, 21 Jun 2025 04:22:00 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a4ac6b2sm4099007b3a.69.2025.06.21.04.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 04:21:59 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 0A4874207D0B; Sat, 21 Jun 2025 18:21:54 +0700 (WIB)
Date: Sat, 21 Jun 2025 18:21:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: corbet@lwn.net, davem@davemloft.net, edumazet@google.com,
	horms@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	skhan@linuxfoundation.com, jacob.e.keller@intel.com,
	alok.a.tiwari@oracle.com
Subject: Re: [PATCH net-next v3] docs: net: sysctl documentation cleanup
Message-ID: <aFaV0kD6zI6N0Keg@archie.me>
References: <20250620215542.153440-1-abdelrahmanfekry375@gmail.com>
 <aFZ5OhP3Ci5KzOff@archie.me>
 <CAGn2d8OT0SS+wYphKBmM21Lo__N_ZFRyZCQ8pL34c0Z0bqDoag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LQzEutQpcKFcOvi9"
Content-Disposition: inline
In-Reply-To: <CAGn2d8OT0SS+wYphKBmM21Lo__N_ZFRyZCQ8pL34c0Z0bqDoag@mail.gmail.com>


--LQzEutQpcKFcOvi9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 12:58:46PM +0300, Abdelrahman Fekry wrote:
> On Sat, Jun 21, 2025 at 12:20 Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >
> > On Sat, Jun 21, 2025 at 12:55:42AM +0300, Abdelrahman Fekry wrote:
> > > +     Possible values:
> > > +     - 0 (disabled)
> > > +     - 1 (enabled)
> > > +
> > > +     Default: 0 (disabled)
> >
> > I see boolean lists as normal paragraph instead, so I have to separate
> > them:
> >
>=20
> Thanks for the fix , should I resend it or is your modification enough?

Resend (v4), with the review suggestion applied.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--LQzEutQpcKFcOvi9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaFaVzgAKCRD2uYlJVVFO
owp9AQC6yCLXGLrK6u9AU7f1j4MGLkn7iAokGhf3h4Sn5sFUFwD+NWMMTo0awl4Q
nQikhcvXjjXr+nCOmOTomS1uS3ZQEwU=
=8KNA
-----END PGP SIGNATURE-----

--LQzEutQpcKFcOvi9--
