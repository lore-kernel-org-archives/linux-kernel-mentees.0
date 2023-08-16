Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C551C04FDF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Aug 2023 11:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDB2182ADD;
	Wed, 16 Aug 2023 11:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB2182ADD
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j4TPxBFZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MGvS-2evrEH; Wed, 16 Aug 2023 11:32:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C477A82897;
	Wed, 16 Aug 2023 11:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C477A82897
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B355C0072;
	Wed, 16 Aug 2023 11:32:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C065C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 11:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2999F405EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 11:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2999F405EF
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=j4TPxBFZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2W8te3V2HrW9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 11:32:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DFB4400D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 11:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DFB4400D1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C535664D16;
 Wed, 16 Aug 2023 11:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295EFC433C7;
 Wed, 16 Aug 2023 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692185564;
 bh=2xOS9Ld+w0qO2eM2HA9uJpDMMPYYfr/7NgPud8oJcjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j4TPxBFZ0VxAVNBUL9DmPZ/WzSLqdErfVGVGG6Cf1xYYX5Tr78luoHilIefnK3y9u
 tp6bYePWB2W1aHdVpr1W9nBoN8uuFX9U4blYrwdpbktNZ6ajK104hAi1kzKOD2Unh2
 IymCdpE6aDG+LDC6xz6OtfqVDcAR7vXoNKQVWDMRPJWO3UUwVGixNvqb0SyeBCUjnN
 pQpp0ivTtEmHHrVIzFXqQywXWm+39xnI5wHQzOxWcXCVSFf/VqNpCjMm+rb454YLCw
 tfLjfdDuImCDxWtcnwHPDSVdpBdXsjkcA2Iet89eV6XaHZeRLEuK7SypIrx3X0P2Py
 45sWKqoqeB9FQ==
Date: Wed, 16 Aug 2023 12:32:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Rajeshwar Shinde <coolrrsh@gmail.com>
Subject: Re: [PATCH v2] spi: spi-mpc512x-psc: Fix an unsigned comparison that
 can never be negative
Message-ID: <df10d700-3f3f-4665-9197-534abc24523a@sirena.org.uk>
References: <20230813141207.150336-1-coolrrsh@gmail.com>
 <CA+VNjV1=xVyRkvB6RAnLySAOzS=X1XiJihrtiMx3Jmifpdq9ng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+VNjV1=xVyRkvB6RAnLySAOzS=X1XiJihrtiMx3Jmifpdq9ng@mail.gmail.com>
X-Cookie: Old soldiers never die.  Young ones do.
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
Content-Type: multipart/mixed; boundary="===============2105559923859617812=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============2105559923859617812==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KL7GBASS+uLiJbx6"
Content-Disposition: inline


--KL7GBASS+uLiJbx6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 11:38:48AM +0530, Rajeshwar Shinde wrote:
> Please verify this patch.
> Thanks & Regards

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--KL7GBASS+uLiJbx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTcs9cACgkQJNaLcl1U
h9BQ3Qf/USrvotjLsrG2uhdFdBNTSLgoPfyPn7aZfW078uQjRfu2pxAsW/UNZ+06
M9uWCnrvp0j81+XW2T4asJCWFeXGogNs2JIlw76v5YA3PmsZZuu7vZf5pGHyANSK
2X3LnOoV900V2N9nddUfe5eqCUN9KGtiS/Kba++q3fdUxzQdQlDJFqLQrG+m760x
h63/Ey0Vyu1OG9ASs7qiNvuVQvLKQ2Kkp6WehO7ZwnM1vt16gSsgeyx5qcc/FBO2
2rhH8STfTTco6/G6TJw9hnvQMFXHP0x8lQaNlWcchmzivGlrdMb8Bc18Vbl48r3L
iXGaZkd1rr9skkg731EnacoON8SDhQ==
=LppQ
-----END PGP SIGNATURE-----

--KL7GBASS+uLiJbx6--

--===============2105559923859617812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2105559923859617812==--
