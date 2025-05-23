Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600C62248BE
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 05:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747979916; cv=none; b=PlzqiQ/jbnyvReR4wrkhI142Q26Jktagm0qMUb3pfIdjVFMj4Kct1BRLNBs/IwxZlwMV6lfcsyp46EY37Tiex0//DuGuAljIl6qcRpwldtMhpt9+nygYAAEuFgOxWdsISf++97r6Sd2zYYxbVvYyYK8ZJa7YYP75iycgvWzEroo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747979916; c=relaxed/simple;
	bh=owZ/lU8dtupeRTF15mnxjml4CvEQKy8zwKtEkgHkWn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NH9kMgmmDvUPyeA0Fq5lk0CfAkDtytxqtT9dg6gBo28M3x9PrrWY1+xIocNsSeKvuv3FEWj07GwA+4ss0+ELC7XzTKqY+BxQE4exoZhmIBJw4/EnDFIP+FtOcH6UZxCVdDVXZEki0FOiPwK4/W722ThsGLQGTvj9WSi8MjGFN2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yrk29ivB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yrk29ivB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23229fdaff4so65030865ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 22:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747979914; x=1748584714; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2yC9lrfG1PxVLBogrteX7LxyUkKTOJwJKIR9j9soKH4=;
        b=Yrk29ivBZEfUZ0kgQv+ACCD0aKkMcbhYVDlb6h0GNblbynXWni7Bq760/la98uSHXx
         TxZI2EUb9/bIJpC3beAoJcohlawjMGDYHmcv5i+VcPYx/Ikl7dDk7KMVa26OhxRnWS7w
         u/fekzaZxCjNFCEI4EE7KplA+qYH801HvlLjLvcq8KKNSgGUza3Y1pbMoRa3WEQnkyhj
         EGWHQAAqP7mWvdrgObJ7L2wtL+sVil/eWDchpy/B8BNF4bRPzZq1upJ008AU/7YUzB20
         SWZsWsHICU+Ey4A3s158P1vb0NTlFKW7Eaj7dKuFMbuPtf1tdaxXNP4Kg3/6B2+rUGQB
         XPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747979914; x=1748584714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yC9lrfG1PxVLBogrteX7LxyUkKTOJwJKIR9j9soKH4=;
        b=jZ385TMkAXjMt5V6kTb0NGQDQmfURn+Z6XbOH3L6kuTE0Kon0OKF1gQuLCgAeo8NUg
         kAexJCsxP3epcU30Qr7YVQSM/DqUD/VaW4e0jb5xyqHahHu4hPbGqAPh5fAm1FLS96IC
         AdInADLNG9Mys7WoJAT2LJFm63qP1NU6lKwIvzD9DVn6Mh6f/hXt2ShSKPBO4YSFiGuq
         ZLWWi2gpJGKX4ebzM920+2E7BTOEXcbidJGUJ/rnXkTd1QVR3kkkHcwFEb270Vnq54iv
         BIIZ/3VLNEljOCf8GiYXQ0d8w8Dke/5JzefSMRS4SoL8BOgSu2Xj+IkCSI9KKP9ljk2B
         cz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9B5nzpb11zmPm12neNbnWG7b4TGyjeETe/ZooAotY0VjQzOmL26m502QjHpgXvMSrMnidvfGdj5VHQl9+LMD2xTG5HQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4u8FEtbEe+nLA9+uFICdLni93oy2U66zxogH5Xmc69wyhg2fs
	w6vuKFVK0JG4+YrUYYZJKTtwMezsefUrEh0DVxKPUlFcYvn444tDROGr
X-Gm-Gg: ASbGnctRe8U5/ZJR6ZBY7fZrEOyueQ/piVCWHgEYKNez//8RFXpmb9Uzn4M2BcYuUsH
	41sX8gWsjywc4UIBiFkoCD3Kx+c6TnQy6hlQE3hyRre2GZvCqC7apAVnxF8OaO9MSTfrge6nqnc
	74kzx+5vI1ejbuljxEeoMxBNSpgw3Pt9DOUoqE53ZIDlS1G4sTRNYJYsv0sPf7pgF0h78SK3gxl
	OOwHr38BTe8HmT1N2qxM0jvNzWT6k9XFmco/7pyya8TWwX7Lsa2TqqC34r+41vehg7m/aqvOZaq
	H3kHFkMF1QCn5XAL9J8nU+IX6XuXMssz/9ZOztlZ92SzY78BY4g=
X-Google-Smtp-Source: AGHT+IF64/8o+6vAg+hZspj9EWdeCaklWFEjqbqK4Y+/f1M+1By+5sa1g2OuLuYF++Vswc8mONqEyA==
X-Received: by 2002:a17:902:e844:b0:224:1c41:a4bc with SMTP id d9443c01a7336-233f219a0d8mr26981835ad.12.1747979914443;
        Thu, 22 May 2025 22:58:34 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac959esm117665315ad.33.2025.05.22.22.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:58:33 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 5474C42439C3; Fri, 23 May 2025 12:58:30 +0700 (WIB)
Date: Fri, 23 May 2025 12:58:30 +0700
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
Subject: Re: [PATCH v2 1/4] docs: Improve grammar in Userspace API/DVB API
Message-ID: <aDAOhl7gKhkcTEjk@archie.me>
References: <20250522115255.137450-1-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mw+femNPDBom7NIr"
Content-Disposition: inline
In-Reply-To: <20250522115255.137450-1-hannelotta@gmail.com>


--mw+femNPDBom7NIr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 02:52:52PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=C3=
=A4 wrote:
>    #. On Satellite and Cable delivery systems, the bandwidth depends on
> -     the symbol rate. So, the Kernel will silently ignore any setting
> -     :ref:`DTV-BANDWIDTH-HZ`. I will however fill it back with a
> -     bandwidth estimation.
> +     the symbol rate. The kernel will silently ignore any setting
> +     :ref:`DTV-BANDWIDTH-HZ` and overwrites it with bandwidth estimation.
"The kernel will silently ignore any :ref:`DTV-BANDWIDTH-HZ` setting ..."
> =20
>       Such bandwidth estimation takes into account the symbol rate set wi=
th
>       :ref:`DTV-SYMBOL-RATE`, and the rolloff factor, with is fixed for

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--mw+femNPDBom7NIr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDAOgAAKCRD2uYlJVVFO
o9u0AP0Xys56re20EnXGptNdWmdJS8g6Z+F9QJt+Wr6I4Kqf3gD+PQUaje/WI57e
sdkr/fLl5iCAx/bAYBG+rx1FZAPTegg=
=TzqD
-----END PGP SIGNATURE-----

--mw+femNPDBom7NIr--
