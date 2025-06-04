Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B07B1DAC92
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  4 Jun 2025 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028566; cv=none; b=GFEmCPe8jSLVIDtNs26tYl/xq5ImiXoJJ2w4zzVxPwLLVgmainm3ZmZX/BDhs/JLDGDzm4k0m7ADYBYYxCwD6tTylzhuX0dYRSUVlT3NzgUH7bHXLwqEq5KHE+u2RP+Vbs1o1YtecerD705spYpMRv/xdW/iRPuF2CDjg9a13IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028566; c=relaxed/simple;
	bh=grsrZugybN3F6VyiCoKld/OeM/h4bD/8V9Nm5ynOLUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4gAamKc0N+lrFiJU27Kz/uUwHBkw9pjGOt0MRQmpSVfJ0O3dDwjoEq6D+ab5+4ez7heFrV8ZpBJsWeupzu+YiE2GM8EyX6uChMb6qR5BfYvJ+scXQmRcSeq1zeMaZP1uK8tEMMB3205nvOCU3sEKJI4bKhYFZA37jhKZPmDC3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYMQCSnI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYMQCSnI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2352400344aso47504935ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 04 Jun 2025 02:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749028564; x=1749633364; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nI/6YlgTzUh2prtcIfEjGRmgA/bBPARRMlGcFScsjKQ=;
        b=nYMQCSnICxlw0luPvpnOG4uiavI15cysHZ2m3kCESCj3069Pydvf6jYPwL3TM0/R8t
         bQOqX5nfi+OjJEBitD3iRzsHHtq7ARNl9fASgjf6rqRyfdvtw2UlxNUq4Mg2OzD0wds1
         Q0BO6ebp1F73C1K50MTM/bRJB4/mYr8y/fhdeQzMgAoaLQdsa4y749+06cav7JanComS
         Cd9E6nXudtTC5vq129ssBX1Mqfnqx804s6AaHJkrYiV6w+6XXNdG7pmbI0IykjBB9rZw
         KonUmsT5kX0u+VkSls949fW4/z9ZTvOKeAJLeQqG3LdkXBzGlZAdB4SZ0OsnW2lQj3Sc
         q2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028564; x=1749633364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nI/6YlgTzUh2prtcIfEjGRmgA/bBPARRMlGcFScsjKQ=;
        b=J6Uino/8QZoDTkzTlhFni++dBlx+zh7p6rZxBeO3DcPiEXtZqufkj/Emw8m6p6lJSp
         Tah7Ixv1cesCTg7hbPXo9LKORtpAJpzDmasxLniUXLaeRhGibP10lNOWNU84BxrYUaLX
         T+dZFNVE7ZWcaG69NmDrJ9klsp8lfllfoU064MLW1YI09EMqQWbVn5sAC5GQpw6gMDtA
         /LI3VizbMR3SAoEqjnk1MB345iZFrye3N2J0z82C96x0l9blaswiRYGnBIihtt3hZWVL
         l/r+KID0RUhiSvAq+lg792d7GogQhrGmayh2GTRJI85CL4W31gsEz40fgHY7nJP5CRBX
         QowQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhvK725nerP4/LhKCme2I/7vBt4UsXZr09H2BHZ4+2x9Ha12MjW6gBMxCXK9Qp3ubVifsl+TxG79SIfmypUnnqiMBRlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcA29GzwoMBv6KrNkI4/wRCJGvkB3PxIv6nn7XzGw9zEcure3/
	X8COhiRAeE7m1MXFMQEawajafbTUjctUDzPIBQJlg4caX0j/4/fXyFuhGeDqTg==
X-Gm-Gg: ASbGncuQdkAUgbp2DiV4wSsqn6MJUnd2YlmpM++RS01zKaPGY3sLG/peVSqNQZ/o4gj
	sAaMHh5fdbcTXPq4oVehB27B4iPMnptbLoBGNAXNSovv0wpg4xajWlraPsGDtCN9y49iDi1yoMv
	lLCyedsF+G8/CdJAx5P2nHzzkPnQ4iWF0Up40a7G95ZRG5FyIndtQ3Y+dvTjlQOapRumGX3yLJg
	ZnHDz6ZRAprYHlCNeOdLMn+XUkMPU90/ImvmxPkydm98vn0jHs7+4Aq3wdno315Uc8KrED+YLlL
	VMTH5Z/11L6dUNg/MmjOePqil3CAiN3yvT3TwTCxnuS4fF7+/kg=
X-Google-Smtp-Source: AGHT+IHzv3k2gTUTKifPbpkzozgMxHoz7WVl1+DoJ5owKz1/z9GU0aQ8jzHXBqgXCR7VY6lLjPPErQ==
X-Received: by 2002:a17:902:f684:b0:226:3781:379d with SMTP id d9443c01a7336-235e1504d3bmr28548765ad.33.1749028564327;
        Wed, 04 Jun 2025 02:16:04 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf47edsm99708245ad.161.2025.06.04.02.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:16:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 239904208F51; Wed, 04 Jun 2025 16:16:01 +0700 (WIB)
Date: Wed, 4 Jun 2025 16:16:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>,
	linux-doc@vger.kernel.org
Cc: willy@infradead.org, linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
	masahiroy@kernel.org
Subject: Re: [PATCH v2] docs: symbol-namespaces: fix reST warning with
 literal block
Message-ID: <aEAO0VFSuIIKH8Pn@archie.me>
References: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com>
 <20250526211039.163449-1-khaledelnaggarlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="36Yld1iwtkyBYIys"
Content-Disposition: inline
In-Reply-To: <20250526211039.163449-1-khaledelnaggarlinux@gmail.com>


--36Yld1iwtkyBYIys
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 12:10:39AM +0300, Khaled Elnaggar wrote:
> diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation=
/core-api/symbol-namespaces.rst
> index f7cfa7b73e97..32fc73dc5529 100644
> --- a/Documentation/core-api/symbol-namespaces.rst
> +++ b/Documentation/core-api/symbol-namespaces.rst
> @@ -85,7 +85,7 @@ namespace cannot be imported.
>  The macro takes a comma separated list of module names, allowing only th=
ose
>  modules to access this symbol. Simple tail-globs are supported.
>=20
> -For example:
> +For example::
>=20
>    EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
>=20
=20
LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--36Yld1iwtkyBYIys
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEAO0AAKCRD2uYlJVVFO
oxXFAQCQBvmwrk24N85ZsbVQgSBPpBLTRsUUnF6bCri79+v0EwEAvvvCCxaNOgkD
G9uFKpE386a6N4Q/Jm9LmW6tAkZtHgw=
=Qhoh
-----END PGP SIGNATURE-----

--36Yld1iwtkyBYIys--
