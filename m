Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC439C04A94
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 11:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 281138410C;
	Fri,  4 Aug 2023 11:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 281138410C
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cn1s6G/u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aFqRsC6oa7sE; Fri,  4 Aug 2023 11:57:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2242A81A9C;
	Fri,  4 Aug 2023 11:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2242A81A9C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1ABDC0071;
	Fri,  4 Aug 2023 11:57:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 624A2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A55E41CAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A55E41CAD
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=Cn1s6G/u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ca-dhnpESEch
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:57:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5A41429AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5A41429AA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F36D261FA0;
 Fri,  4 Aug 2023 11:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3301CC433C7;
 Fri,  4 Aug 2023 11:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691150225;
 bh=9dHPIWei1lQvg0gJ7x4MSUMPkCG5dKhD6C1oBv23fuE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cn1s6G/uxcXadA0vnjvrmc9fNJzoBMgl0EPmPI8Zpf8J59g7sqNGGaW4B74fy+/mj
 KnFrsTMuc0s5drUhxhuK9bREK1+hREvd/VH5MQnAOK26jOBX4ZTPtTHiMqHfhXn/Iq
 lQ/UnrFDpTzwHlW1w2pzBOzwOIxjAEMVKmgLRAYzJpf5N66Wc/lv+RGUEVZmqU7CO8
 Sqb2kSD9g/CmODlGDDHqE69pKfzpXA47u04Urkl1CsADPxJCkmAQbUX8LK/n5pMxfC
 cRgGnEa4WX8t2z7tJ6FojOmGV7ednBicrxdR84XxDzO3ej3nle6Uli5Sr4RlEbqvat
 SO4LNy4MnGREg==
Date: Fri, 4 Aug 2023 12:57:00 +0100
From: Mark Brown <broonie@kernel.org>
To: coolrrsh@gmail.com
Subject: Re: [PATCH 1/2] fixes warning
Message-ID: <abc6fd12-345b-40ac-838c-7e7c954ffcbd@sirena.org.uk>
References: <20230804115121.34035-1-coolrrsh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230804115121.34035-1-coolrrsh@gmail.com>
X-Cookie: I'm hungry, time to eat lunch.
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3040313825799644847=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============3040313825799644847==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EinGkbFxHzb+mjgS"
Content-Disposition: inline


--EinGkbFxHzb+mjgS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 04, 2023 at 05:21:20PM +0530, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
>=20
> drivers/spi/spi-mpc512x-psc.c:493:5-13:
> WARNING: Unsigned expression compared with zero: mps -> irq < 0

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

>  	mps->irq =3D platform_get_irq(pdev, 0);
> -	if (mps->irq < 0)
> +	if ((int)mps->irq < 0)
>  		return mps->irq;

Casts are almost always the wrong choice.  If the issue is that the
value is unsigned and can't be negative casting it to signed isn't going
to help, though here possibly the type of the variable is wrong.

--EinGkbFxHzb+mjgS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTM54wACgkQJNaLcl1U
h9CjLAf4iPJD/78J99DOMVoPiGetjhuwUND1SXwkKmss/KVgI911p8J+nZKXVQIg
ktvKmMxfAMGqJG69wrBBa+u7+NqCP/vHGFHai3x7rJY0bcuy1GnWtYE3yw//rVQ+
gLMWsKHfzKySHHTBxiZOKz6g3V4brPfYVOSoYT4Ygmtp58XzCzR8bfQIzMqtGHKi
4IjPbIj4horjA1G6RuPo5sPA9fF/UIQOi4ZFPTCUhEj1h9hYvHRqL543qNvEsooL
BvztkYTIH+CL7HC7PnIxGnMUStYwbwo4nA0tHB4LSUIn/yMYXOKjtefR5npKhu/M
XEB2ccAhWvaWI+tSU6MMV++LWp9B
=B5cz
-----END PGP SIGNATURE-----

--EinGkbFxHzb+mjgS--

--===============3040313825799644847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3040313825799644847==--
