Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCB5225A3B
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747980866; cv=none; b=Oq4bTehYfdKT7qkUX0eRY1CCFVEpvn6/z+7YvJx+YfWzPqD7gN2JeTEVdLl+sl009v9A7yQnqq1hgnf5wnTHd6iGN0aW5SPV5p37I08+eqe/VQt35PkZxUgKyAWe3Z3FyTzQasuZCDcw4uQVW1MFa7ZY7EAlDVmsVqLNkJ+HLIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747980866; c=relaxed/simple;
	bh=QzJNuVs8vVKFKM8wKyULi4Vvzh4pwY3oC3m/lfAcQ9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUawQ2KfNfzPsQhU1f68lUjSwdFdZVMYvLXL71+OWak/66KLnaUGr6OmxSIc6fKhhLjUjk9Go5KRR45pKdqAhrN9E2oW406oSa2wmKc8+5LQhn45c1qY+HavqtDA7ui30ocHuZcJMyAvmdTIdfRGpyLipDuVO+IwTB21PPMS/rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BT5Zw799; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BT5Zw799"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso9985487b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 23:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747980864; x=1748585664; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHl3B8D0g534+xOMHpbFZ1fPtFf+LSieMSonGIYFvHU=;
        b=BT5Zw799ybH3SMtZ6W5JqE1JxzC5jlCNuLe1V/yXZwEwlyK9xHnFrfg/Oyau5JwrK+
         KNqTF9wBGDydlubuzeXhKV+ilLil5tgjUUbCoLvAEYYpSCSIzj7IrhuaJ12srpCA62M5
         cdcQ+lqnuA7QuPOx0s51d1BoOntE8B1yyyS4dW00LLGMeZE9AIA6j0cPT1JZt1ysecAp
         6/WazXv6ofKLWpMrerroKuwN/wls3eZBDc4Xs09+Vp34p2Vcfh55S8UtuGuulzaqNJQ1
         WWoAoFUnbMS5fFqjpZS07bZw9l41Wflto/MmMIWO4xVHqdOZvHVBj+696mdlQRL5/coS
         0NNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747980864; x=1748585664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHl3B8D0g534+xOMHpbFZ1fPtFf+LSieMSonGIYFvHU=;
        b=eenh3nYqsc7GwOyJo12Uxo96TddHHZ8Lm0uEA3uuTdJKpiEZVOCRSr7KwnG1Sup60I
         6E+eEzRZAupbThM59DzCnhxjH1CJEYBAg5kn+Vdaf1AyrPP4KXovOXqYWJJBQ3VSlpQq
         zBFrZxq5OXPb99uletDkwNDjCNvtCUYpGWntsoezDH9DFKmqxiEflr/NN9uNJL3zWJNC
         LT67QOo6tpVkldFbsgyRJR9TnJzsHst1WwHlO4AAmAl2uS92uc+Wi0ajgb4AoNLUA4en
         jiAwzgFe1iaVV40NHqYYb6dl+GVvQDn1/0UYuaLU7Bl2lsiw8ni6TcL5k1jcnu0Bw66Z
         eJaA==
X-Forwarded-Encrypted: i=1; AJvYcCUc1QfUTrznrTPSPiLGm2VxdphDZs/5PHq8g6HwKtLQsYVCS/lJEMXGYmqQyxvP1vEIv1XgwyC2nEQUrtYRni8536HGeA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhV4MWy+20TxHUkPHQlmowPKAmLgfoppRUjG+u9DUaHxOzu1cB
	iZN65cR1FsvqDltvKcRUEEp78foOC1ns6OQfMqVVZjrCIaOWL6cCYmFO
X-Gm-Gg: ASbGncsb5xECZyJ2g+4+Dr64Em/CECz12xSY57LwV+A4rKaMiRTDKUW2iLKmxWO6SeF
	7sh7mzdxyAqQo+LNH21hFmgrvpCJjBF/sJqdP+d/UOVM+BS58JZ0O9kjqKhin25J2z7zCQKshpG
	rgTkTY5Df4bcmuyBcmv4G1t8s+AD+HvG3ioTRRZmsAFXgwWhgcvfgUr6ouHOOV0F31aJe9OSILe
	/AlYA9Pv3rYea6nBwJqH7Qms5GR+yA+sF2afEUr2ozJl5wNJeLGduLykbeeJ2RKNoyuRlJDa96R
	BVbQt2BlepKRGNRP3BKZ9r9GuRpJccqZa8QTmuW+dX35fxg1zPwbYOnxyX9MEA==
X-Google-Smtp-Source: AGHT+IF8NcYpLF/vCpsLTmL2BavFzYK0IE92XL7WtADDDe8q+CJGuAknVVIFrJ5MaDtWDYAN1k9fkw==
X-Received: by 2002:a05:6a00:2d04:b0:73c:a55c:6cdf with SMTP id d2e1a72fcca58-742a978ebbbmr35788381b3a.1.1747980863708;
        Thu, 22 May 2025 23:14:23 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742af5d1cbbsm12065992b3a.149.2025.05.22.23.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 23:14:22 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D2C4942439C3; Fri, 23 May 2025 13:14:20 +0700 (WIB)
Date: Fri, 23 May 2025 13:14:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com, hljunggr@cisco.com,
	dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com, corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	W_Armin@gmx.de, mpearson-lenovo@squebb.ca,
	skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 4/4] docs: Fix typos, improve grammar in Userspace API
Message-ID: <aDASPKOpCjv3rUeQ@archie.me>
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-4-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7URSTXlAz4njnFY8"
Content-Disposition: inline
In-Reply-To: <20250522115255.137450-4-hannelotta@gmail.com>


--7URSTXlAz4njnFY8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 02:52:55PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=C3=
=A4 wrote:
> diff --git a/Documentation/userspace-api/sysfs-platform_profile.rst b/Doc=
umentation/userspace-api/sysfs-platform_profile.rst
> index 7f013356118a..6613e188242a 100644
> --- a/Documentation/userspace-api/sysfs-platform_profile.rst
> +++ b/Documentation/userspace-api/sysfs-platform_profile.rst
> @@ -18,9 +18,9 @@ API for selecting the platform profile of these automat=
ic mechanisms.
>  Note that this API is only for selecting the platform profile, it is
>  NOT a goal of this API to allow monitoring the resulting performance
>  characteristics. Monitoring performance is best done with device/vendor
> -specific tools such as e.g. turbostat.
> +specific tools, e.g. turbostat.
> =20
> -Specifically when selecting a high performance profile the actual achiev=
ed
> +Specifically, when selecting a high performance profile the actual achie=
ved
>  performance may be limited by various factors such as: the heat generated
>  by other components, room temperature, free air flow at the bottom of a
>  laptop, etc. It is explicitly NOT a goal of this API to let userspace kn=
ow
> @@ -44,7 +44,7 @@ added. Drivers which wish to introduce new profile name=
s must:
>  "Custom" profile support
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  The platform_profile class also supports profiles advertising a "custom"
> -profile. This is intended to be set by drivers when the setttings in the
> +profile. This is intended to be set by drivers when the settings in the
>  driver have been modified in a way that a standard profile doesn't repre=
sent
>  the current state.
> =20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--7URSTXlAz4njnFY8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDASPAAKCRD2uYlJVVFO
o7K9AQCAadOCdr3sLHWQNMQdtCOg92nM0uxCES3VUJaSEZRzoQEAk4qnDQ4yVHkO
T7roqthiiUAgSj8C3VgyyYkT8DK/YwY=
=u/LH
-----END PGP SIGNATURE-----

--7URSTXlAz4njnFY8--
