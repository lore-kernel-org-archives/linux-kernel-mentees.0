Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB82C71153
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 Sep 2023 17:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A67F540992;
	Sun,  3 Sep 2023 17:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A67F540992
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ICDsKd4G
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3xJr2OIZ7gfI; Sun,  3 Sep 2023 17:30:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 513534097C;
	Sun,  3 Sep 2023 17:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 513534097C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DAB6C0071;
	Sun,  3 Sep 2023 17:30:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC726C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 17:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A4B4404E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 17:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A4B4404E0
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=ICDsKd4G
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Os1E9qUVH4am
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 17:30:03 +0000 (UTC)
X-Greylist: delayed 591 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 03 Sep 2023 17:30:03 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CF5E40012
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CF5E40012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 17:30:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C6721CE0947;
 Sun,  3 Sep 2023 17:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D577C433C7;
 Sun,  3 Sep 2023 17:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693761605;
 bh=aFwMpJsQOtfOL4BviOw5xCCDbKtqj3RKzP4zm1qzzww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ICDsKd4G5cqHnlOigs98nwbL5wtjO/l4Y0bVE9OKxqEEiq9A3krBVGi4JsHlsgz/o
 S2UmHucnoJK+OGKOVmTALNxjzXttVIZqxC703cCSTOMCkjP+Yxabq57pNzbc7Mu0Je
 095ma0pWb3F52eUQa0lhWyrCAp9bOgSshem7vtLiEXccjKpqJmhsw63Sea0q/mnicG
 qKvSEwKay6XKQ4bD9oHBrBMQOmeMJrPjVeGSV3JQcEtC9qFbkXsd+eojM1N1I3RYK4
 M25SqVRsZ/V1L0HwzFO/CBE01yPEmjZRZgALStEyGPPL4jxg/oibTioDbCX9dlhPRZ
 H4nQGkf0JZbgw==
Date: Sun, 3 Sep 2023 18:20:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Rajeshwar Shinde <coolrrsh@gmail.com>
Subject: Re: [PATCH v2] spi: spi-mpc512x-psc: Fix an unsigned comparison that
 can never be negative
Message-ID: <ZPTAQWZ0XoL9zfW7@finisterre.sirena.org.uk>
References: <20230813141207.150336-1-coolrrsh@gmail.com>
 <CA+VNjV1=xVyRkvB6RAnLySAOzS=X1XiJihrtiMx3Jmifpdq9ng@mail.gmail.com>
 <df10d700-3f3f-4665-9197-534abc24523a@sirena.org.uk>
 <CA+VNjV1K6WoKPqP4zrax5SOF3UFCiJ5oYA=YamjZwfZ5fkEHWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+VNjV1K6WoKPqP4zrax5SOF3UFCiJ5oYA=YamjZwfZ5fkEHWg@mail.gmail.com>
X-Cookie: Give him an evasive answer.
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
Content-Type: multipart/mixed; boundary="===============1397441800905479279=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============1397441800905479279==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k3VdGoWfWwkGY0zV"
Content-Disposition: inline


--k3VdGoWfWwkGY0zV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 03, 2023 at 08:12:25PM +0530, Rajeshwar Shinde wrote:

> Remainder

Please read the mail you are replying to...

> On Wed, 16 Aug, 2023, 5:02 pm Mark Brown, <broonie@kernel.org> wrote:
>=20
> > On Wed, Aug 16, 2023 at 11:38:48AM +0530, Rajeshwar Shinde wrote:
> > > Please verify this patch.
> > > Thanks & Regards
> >
> > Please don't send content free pings and please allow a reasonable time
> > for review.  People get busy, go on holiday, attend conferences and so
> > on so unless there is some reason for urgency (like critical bug fixes)
> > please allow at least a couple of weeks for review.  If there have been
> > review comments then people may be waiting for those to be addressed.
> >
> > Sending content free pings adds to the mail volume (if they are seen at
> > all) which is often the problem and since they can't be reviewed
> > directly if something has gone wrong you'll have to resend the patches
> > anyway, so sending again is generally a better approach though there are
> > some other maintainers who like them - if in doubt look at how patches
> > for the subsystem are normally handled.
> >
> > Please don't top post, reply in line with needed context.  This allows
> > readers to readily follow the flow of conversation and understand what
> > you are talking about and also helps ensure that everything in the
> > discussion is being addressed.
> >

--k3VdGoWfWwkGY0zV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT0wDsACgkQJNaLcl1U
h9B4Vwf+IheQSKPrAkq0gdrld/T0ObUrjfSjw5ssj6fRSnZuNB1Vdc2/4AdeTS5e
68W6QjOJJBbHNBDNSuYtOxd3fYmykEQHcES3Lqb0xITDwT1Z9Ffnt5H2kAfqBo90
Kud+cyoenb2ftSqsIr6yMb3Wi+ZDHWSkrYgPabgRKaFJySP5qka1ZKGJ4X9zaQ5Y
Dkmk3o6U3BUk/iBiKHlCrNUrWqiKygHBAiLuUzAWotC27wQhJChcnfCcu44mbIoT
8y1yx7jzpULvu8G2lV2LiGVkqzrk+AYE4+LPx2oN9Iol8Gtuc6q88eTESGvgT48v
Ogto1KLtvTrBUT6blWzfDXbSfTFZRw==
=4v21
-----END PGP SIGNATURE-----

--k3VdGoWfWwkGY0zV--

--===============1397441800905479279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1397441800905479279==--
