Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1C92E2DC9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 23:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755818048; cv=none; b=V45kxNE+8aucT4xdzKaCCF1Pawx3HgQqr12PLzWxpYW7EE7nHjmH/1XBlft0ujRqOC0nzTPnWkHjFfpxiyaryfGMHgHpvJLXuI2aC9lYVVD5q2EXqlEmgMvKIHfOXX/UCBagI0I/HK3qSci0T+jF2EYTBj9U+lRrF8YQsvGQ/zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755818048; c=relaxed/simple;
	bh=+Fd4hex0v5A2Jp8km47dNwNpIjquGOCRML4KaiRjcms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZcDSQowNRWsX933nPP2u0w1foEzsh4M/xs6jItYLiKmbM8grICEnqdnXN0zHmIkeksVORIqRop2H8J+kCW0Ir+dtO6rMSFI+QTjWbxm6vOPyuTXV0IJgsiOso1d1575oD6X8nYzJe87JiZNu4t3esMg1yfscd/DYcjYBDg3RRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gcyop3vU; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gcyop3vU"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32C6280E65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 23:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PksAot6r2XI6 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 23:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A12AB80E6D
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A12AB80E6D
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gcyop3vU
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A12AB80E6D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 23:14:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC34F439C5;
	Thu, 21 Aug 2025 23:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42098C4CEEB;
	Thu, 21 Aug 2025 23:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755818044;
	bh=+Fd4hex0v5A2Jp8km47dNwNpIjquGOCRML4KaiRjcms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gcyop3vUYz9QId350sMm0ZlAUM2Bs/MFkuVigXbACaCwMIscE82rjkJmclwZ0OkvQ
	 bOTU/I3kifjCxleGmqbZEQxHjyNIF1GRjQY5/zSGLuB/8459vQRKQYpJlGA1fTs6LF
	 y3Nt5aiPalMRTrm/bYoTTDoS6TKqitHu0KJSzewzovbxnYmJoCY1fpr3ODez2n9qK9
	 rJQU3eiCzzMUUb2Kk5yNfa8bobj7fyq9xE2Y/X9UpqxbVGlgthCwonDc3eHlTb15Di
	 HYJpmhPFf82UxxJOSZq8s8SaYXvTpv5SZr83tGJT72HfwHijEkDC5RMhNQBAdzEaJo
	 HTOiVeP0egqHA==
Date: Fri, 22 Aug 2025 00:14:00 +0100
From: Mark Brown <broonie@kernel.org>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, shuah@kernel.org,
	linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests/alsa: remove 0/NULL global variable assignment
Message-ID: <5e9d15e2-d77f-4540-8528-0a7c60d7f92f@sirena.org.uk>
References: <20250821200132.1218850-1-zlatistiv@gmail.com>
 <9c310ab7-0f0b-412f-8df7-71730a2d2caa@sirena.org.uk>
 <CAHjv_as7m7UbSLAPU6hX_=tAvLZYR_7Q=1n+Xq-nW-6OJ237PA@mail.gmail.com>
 <f7ff446f-2a9e-49dc-af7a-6e4c76803471@sirena.org.uk>
 <uzfke2ry3rhdirqpdb2bdjkoemj4rgtfwsio7yf5la7p3p2ait@6umacnfdeto2>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fpvv84RzATYdGRRa"
Content-Disposition: inline
In-Reply-To: <uzfke2ry3rhdirqpdb2bdjkoemj4rgtfwsio7yf5la7p3p2ait@6umacnfdeto2>
X-Cookie: Warp 7 -- It's a law we can live with.


--fpvv84RzATYdGRRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 22, 2025 at 01:57:05AM +0300, Nikola Z. Ivanov wrote:
> On Thu, Aug 21, 2025 at 10:30:50PM +0100, Mark Brown wrote:

> > Do you have a reference there, note that these are just plain non-static
> > variables?  I wouldn't trust checkpatch for anything that isn't kernel
> > code (and even there it's got issues).

> This is what it says in the C99/C11/C18/C23 drafts I found:

...

> Since as you said checkpatch.pl is mostly intended for kernel code
> (which I was not aware of) this patch is probably not desired.
> In case it still is I can add quote to the draft and link it in the patch.

No, it's fine - thanks for checking the reference.  I suspected this
might be something specific to how the kernel is linked:

Reviewed-by: Mark Brown <broonie@kernel.org>

--fpvv84RzATYdGRRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAminqDcACgkQJNaLcl1U
h9BdCgf/TfI3HsI809BC+afmSmWtLf0s3lTuAF0GOKUDNAB5r8rYhxWVTiYOiiDQ
Wbr6b2ESocsiL6w7ZwqMsO3y80XRxU/FNTIWZuJlQV4J6eLnFoj3XQPE1LBAW/3z
Xo+vmTVeIf3UZ81+f1tr8feL/m4Nno2sdWEY5Cg1OA9ToX9i/clLFRME4GsV+CpV
E9OMqsbcRq44Q+o/bgf17RyVFj5wxnS/Rxj4hdxka14xPXMFpwwEYh7F+H7aNsne
eCM16uieEqa5hQeyf26ZB1pHT7K+17s9/2A3wJ7j1/Zv5jevH479yW1eKnFiTf/Y
PtxUT5D2fDcvbh2Mc65o+aMnhFA3hg==
=Uoem
-----END PGP SIGNATURE-----

--fpvv84RzATYdGRRa--
