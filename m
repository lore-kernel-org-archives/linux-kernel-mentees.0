Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8391DDC08
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 20:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755809877; cv=none; b=UAnjbs1kX1B1Wy6Cj0Gh9CbhgbDhYKghfxhJxTIyG05Qu0BqMT5b0wP9sluUXPKgAK4c7Tb60d0CtCYjzzqoyCDc2tzrqqRMjYsGoAQFMAQbPK/XkXDdfzc9Ng0e0YE6JQ35JUCAyFwC9jpDBUova+FG8wKKwhCvFCzx6D7b8LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755809877; c=relaxed/simple;
	bh=Rbd/4KwEl8hFhj9W4DP/GsOYavHXATjdIGBQxWM6AIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5P1P5GcVldjWzf1sjVp0QIIAcM65j97GNVXQosFF+eiTchhr1bthTiST99fyBe1Sj525HXdwO04hS5XKJplTG9M6Apz6zfCrlRD2X4dAYqxwddySVSF+Fr/odXu5H+mLsKCmyWd+wfeh6lcE9vCXyQvVUMk1RVQgaiEQFOa4uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKD35vlM; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKD35vlM"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B4176151D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 20:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tdkc_EUTSn7U for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 20:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A86261518
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A86261518
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GKD35vlM
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7A86261518
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 20:57:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BAE440105;
	Thu, 21 Aug 2025 20:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C3CC4CEEB;
	Thu, 21 Aug 2025 20:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755809374;
	bh=Rbd/4KwEl8hFhj9W4DP/GsOYavHXATjdIGBQxWM6AIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKD35vlMLUuMNmiLl+X/wclsjiC8FOsiKGz6gejy1ADhyxU7/QyRe26AxpfDUXm1l
	 WLTzefSWPGECKFFJpdO8qmUqktqgabiAcLfYXCWBkyod+7msM/TB0d9NE8e4OhzhI+
	 PSRqtZCulGcm30KUmuXhNDoh18+ySu2PByFuDhaG1EYxBFpowmJuhlCyqYUDS3qXUq
	 sc/96ANW63gn1RldkhMvRcGytD1dT5tp2AdGYjHOayUI5aCjWkmmG0g0FVxEzLPqzD
	 jcK0fXwlTMPN0CwKuHl+HU0WELfQUJc2aH4OGmNnoDQ/MlLWL/eGAIkoCNcQrqC4/L
	 x5gd5FTvzl54w==
Date: Thu, 21 Aug 2025 21:49:29 +0100
From: Mark Brown <broonie@kernel.org>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, shuah@kernel.org,
	linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests/alsa: remove 0/NULL global variable assignment
Message-ID: <9c310ab7-0f0b-412f-8df7-71730a2d2caa@sirena.org.uk>
References: <20250821200132.1218850-1-zlatistiv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LIJm8UEXT3cPURDU"
Content-Disposition: inline
In-Reply-To: <20250821200132.1218850-1-zlatistiv@gmail.com>
X-Cookie: Warp 7 -- It's a law we can live with.


--LIJm8UEXT3cPURDU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 11:01:32PM +0300, Nikola Z. Ivanov wrote:
> Remove 0/NULL global variable assignment in mixer-test.c and pcm-test.c

Why?

> --- a/tools/testing/selftests/alsa/mixer-test.c
> +++ b/tools/testing/selftests/alsa/mixer-test.c
> @@ -53,10 +53,10 @@ struct ctl_data {
>  	struct ctl_data *next;
>  };
> =20
> -int num_cards =3D 0;
> -int num_controls =3D 0;
> -struct card_data *card_list =3D NULL;
> -struct ctl_data *ctl_list =3D NULL;
> +int num_cards;
> +int num_controls;
> +struct card_data *card_list;
> +struct ctl_data *ctl_list;

Nothing now sets initial values for these variables so they all have
undefined values which is buggy.  The code is relying on the default
values.

--LIJm8UEXT3cPURDU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAminhlgACgkQJNaLcl1U
h9CPJwf/aY4pSg8MnKf2igmuuzd3CZ724kH69g0zDGajBcie5gE89S13NPjG7KgM
/VqX6quyiBtSYbWQKw8FvgygKrkxmoBsuuIFuv9k2FeTGSfi3pHkiVjYcCIjWgsj
svj8YUiPvueCupUt1/gHGwx0KcAaAd2gwLJhl0smVHejqgcgvk7fTMINwjWmdkLq
nNS/nn1SSEc0vxspvndTPrt/P1FcOhkhrc+62bIqsHCtxZDU+fJ9+Z7LUz6PZxlq
sSC6kl39VKdLcu4WI0ZwUk/D8T6CX4AZPyhrAZdhz9B91KppvdqN3HbgUAjdBlq7
QMgeLAk0USWC4pI7l4umXzxb+xUc6A==
=1rKS
-----END PGP SIGNATURE-----

--LIJm8UEXT3cPURDU--
