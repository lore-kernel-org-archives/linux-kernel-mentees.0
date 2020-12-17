Return-Path: <SRS0=+FSu=FV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A80C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 20:51:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B95823A03
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 20:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B95823A03
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0A914876F2;
	Thu, 17 Dec 2020 20:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9DFioDTnwKo; Thu, 17 Dec 2020 20:51:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 47419876E1;
	Thu, 17 Dec 2020 20:51:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33247C0893;
	Thu, 17 Dec 2020 20:51:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8340BC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 20:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6A6D487963
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 20:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zQm1A3MTa-g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 20:51:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 17B298795C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 20:51:48 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id C77711C0B7D; Thu, 17 Dec 2020 21:51:39 +0100 (CET)
Date: Thu, 17 Dec 2020 21:51:39 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <20201217205139.GA27883@duo.ucw.cz>
References: <20201214054205.5263-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201214054205.5263-1-dwaipayanray1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, dmurphy@ti.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2] leds: Use DEVICE_ATTR_{RW, RO,
	WO} macros
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
Content-Type: multipart/mixed; boundary="===============7375091077380420656=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============7375091077380420656==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Instead of open coding DEVICE_ATTR() defines, use the
> DEVICE_ATTR_RW(), DEVICE_ATTR_WO(), and DEVICE_ATTR_RO()
> macros.
>=20
> This required a few functions to be renamed, but the functionality
> itself is unchanged.

Thanks, applied.
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX9vE2wAKCRAw5/Bqldv6
8oczAKCz6icf73jdIi6aH6CPpLRzv7IIZgCeP4obrTCBsKSaLRrxZeFZ2+JH/vQ=
=b7N8
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--

--===============7375091077380420656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7375091077380420656==--
