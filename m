Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03584C00528
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 11:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D4078235E;
	Fri,  4 Aug 2023 11:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D4078235E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J7cjC8BT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cweLHvPjvsFP; Fri,  4 Aug 2023 11:57:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8040A8137C;
	Fri,  4 Aug 2023 11:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8040A8137C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60B71C0071;
	Fri,  4 Aug 2023 11:57:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 161F3C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2BC241FEF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2BC241FEF
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=J7cjC8BT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BoPUnGz3oPC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:57:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D2C040268
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 11:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D2C040268
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6140A61FAA;
 Fri,  4 Aug 2023 11:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C5DC433C8;
 Fri,  4 Aug 2023 11:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691150270;
 bh=Hy5tBLVvyiNSH0rp2i+vLXsQeQlV4Nlwg6l4ueJwAn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J7cjC8BT7JZEUauN1+f9MosXfMgeBYGrsx/jD4vSZi9JhVXz1w9JrIUoJjxI3LC/V
 2+kPizIHwNhQ3Thukq8BDqICnVrEQuErZw+vWV01sX2W3zgzpQtfuGCk9IcJcfw8aV
 7nZ9XrhJE/l5+VigGsZQj7xulFJoNPedQomoGULn55iVKyTw26szInv4gjpz9qu/8f
 /NrPUpQ6U9J+2r+TWjO/RsRK/40hjWqSPPUq8sCpLvQeBtyoJ9/gZ+L3txky+3UZeO
 i6H+ecXRhdpySHxTTpzAe07RUJ2mn0So0dZIhSORdRwDsJNJ7Uzmgr5U4FFY/1QWus
 XXBi5fdko9tyg==
Date: Fri, 4 Aug 2023 12:57:46 +0100
From: Mark Brown <broonie@kernel.org>
To: coolrrsh@gmail.com
Subject: Re: [PATCH 2/2] fixes warning
Message-ID: <d8dee07b-dffe-4c01-87fe-aa9e6793a9ad@sirena.org.uk>
References: <20230804115121.34035-1-coolrrsh@gmail.com>
 <20230804115121.34035-2-coolrrsh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230804115121.34035-2-coolrrsh@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3048670039214585172=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============3048670039214585172==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="izFkksqRR1HeZCfX"
Content-Disposition: inline


--izFkksqRR1HeZCfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 04, 2023 at 05:21:21PM +0530, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
>=20
> drivers/spi/spi-mpc52xx-psc.c:332:5-13:
> WARNING: Unsigned expression compared with zero: mps -> irq < 0

Same issues here.

--izFkksqRR1HeZCfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTM57kACgkQJNaLcl1U
h9BQ8Qf/bMGfH248D/CvTPjmRz989S56xktgSHZdNyZgCA4d1qeywVUzMaCC1Vua
KVWTVpX4M9n1XBLtBDg7J5RxuqtBrGOOoVJVJCbKdBnNRlbvvxQPOeMUJmd8mizO
zkQo5womAePvY5ePRIkAbWbtlO8QVlBiO1NicNRaSWZjLap73Jge6QmbtGLatEsX
ERe3YR45fSVSpM25M4SokjkIANW9CFSZcCp96xKnYOgrdnn4M398Oa1AjDAMA+5x
372zCmFC4uCMHS22dvjTPV+P4mHVepZDRpSxbioIN0QPo+6P2rRWiSFgj/L+6T0Y
qXPHnX3ZSCSJW6vrPmGx84LEUPhQYg==
=wUH/
-----END PGP SIGNATURE-----

--izFkksqRR1HeZCfX--

--===============3048670039214585172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3048670039214585172==--
