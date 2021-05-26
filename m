Return-Path: <SRS0=DCdj=KV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070AEC2B9F7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 26 May 2021 10:06:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5724961059
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 26 May 2021 10:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5724961059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19F3D83C67;
	Wed, 26 May 2021 10:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FKEbYVpafpyM; Wed, 26 May 2021 10:06:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43A0182ECF;
	Wed, 26 May 2021 10:06:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2286FC000E;
	Wed, 26 May 2021 10:06:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAE08C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 May 2021 10:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A918040575
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 May 2021 10:06:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2OK5toqqAKw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 May 2021 10:06:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F5DD40271
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 May 2021 10:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=RTL0YUJC5bTgHB3rr9d5JzhmkX+MPRCkX3Z5f/ZfoIw=; 
 b=H/ZH+V7fPt0bFbpnORL3NeeKS1NIF7F8GL9L5BF0Up1yA1EKow1Cgxk+rPe765clKv6DWQ56QB4fFYkhrH0kIk0voXlqMHd0LOVx5UiLeh0ZbZuZHwnZn8f3nkqvp8SxNsOBDGWLN3pRZvl1pM2oMggNf4AcWDQuNWZ1hCVFNBO0FHpt5tpSI1a3rKxGGBQNcQnl8BkuYETvqYMLgHN4pZ3kkDvsFhnR68vFPZPChvMSpB+A49rjIr6aVT3EpQQ0Eu9tiu7up+J3Jd+KRRu5eouw5sZLzwoyVIHyO/5BCfk/BdVDF3sfBRS4jd9BzFCE2WK24qUd/TXv9IvzFxLByQ==;
Received: from 1.pool85-50-22.dynamic.orange.es ([85.50.22.1]
 helo=[192.168.1.120]) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1llqQq-00035i-SG; Wed, 26 May 2021 12:06:34 +0200
Message-ID: <bbe198f1432488d4fcbfb84c249b4e55a50b5bd3.camel@igalia.com>
Subject: Re: [PATCH] ipac: ipoctal: fix kernel-doc syntax and remove
 filename from file headers
From: Samuel Iglesias =?ISO-8859-1?Q?Gons=E1lvez?= <siglesias@igalia.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Wed, 26 May 2021 12:05:30 +0200
In-Reply-To: <20210522121944.11182-1-yashsri421@gmail.com>
References: <20210522121944.11182-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, rdunlap@infradead.org,
 jens.taprogge@taprogge.org, linux-kernel@vger.kernel.org,
 industrypack-devel@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============7370311082035509391=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============7370311082035509391==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-f9pVxU9gW8q5Fs96aXmZ"


--=-f9pVxU9gW8q5Fs96aXmZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Samuel Iglesias Gonsalvez <siglesias@igalia.com>

Thanks,

Sam

On Sat, 2021-05-22 at 17:49 +0530, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning
> of
> kernel-doc comments.
> The header for drivers/ipack/devices/ipoctal follows this syntax, but
> the
> content inside does not comply with kernel-doc.
>=20
> This line was probably not meant for kernel-doc parsing, but is
> parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'),
> which
> causes unexpected warning from kernel-doc.
>=20
> For e.g., running scripts/kernel-doc -none on
> drivers/ipack/devices/ipoctal.h emits:
> warning: This comment starts with '/**', but isn't a kernel-doc
> comment. Refer Documentation/doc-guide/kernel-doc.rst
> =C2=A0* ipoctal.h
>=20
> Provide a simple fix by replacing this occurrence with general
> comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
>=20
> Also remove the redundant file name from the comment headers.
>=20
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> =C2=A0drivers/ipack/devices/ipoctal.c | 4 +---
> =C2=A0drivers/ipack/devices/ipoctal.h | 6 ++----
> =C2=A02 files changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/ipack/devices/ipoctal.c
> b/drivers/ipack/devices/ipoctal.c
> index 3940714e4397..2a3a94f72dfb 100644
> --- a/drivers/ipack/devices/ipoctal.c
> +++ b/drivers/ipack/devices/ipoctal.c
> @@ -1,7 +1,5 @@
> =C2=A0// SPDX-License-Identifier: GPL-2.0-only
> -/**
> - * ipoctal.c
> - *
> +/*
> =C2=A0 * driver for the GE IP-OCTAL boards
> =C2=A0 *
> =C2=A0 * Copyright (C) 2009-2012 CERN (www.cern.ch)
> diff --git a/drivers/ipack/devices/ipoctal.h
> b/drivers/ipack/devices/ipoctal.h
> index 75f83ba774a4..773dc41bd667 100644
> --- a/drivers/ipack/devices/ipoctal.h
> +++ b/drivers/ipack/devices/ipoctal.h
> @@ -1,9 +1,7 @@
> =C2=A0/* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> - * ipoctal.h
> - *
> +/*
> =C2=A0 * driver for the IPOCTAL boards
> -
> + *
> =C2=A0 * Copyright (C) 2009-2012 CERN (www.cern.ch)
> =C2=A0 * Author: Nicolas Serafini, EIC2 SA
> =C2=A0 * Author: Samuel Iglesias Gonsalvez <siglesias@igalia.com>


--=-f9pVxU9gW8q5Fs96aXmZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQP+ZAvaXWkfuKXiEf/S6MvF9w0MFAmCuHWoACgkQf/S6MvF9
w0OLgg/+LV3KqR1htIZVhhQPi2+KnjqBI6fjsF6pm0aYa6P0zRf8kqSCM/Z9Gk2V
ntTgqBWOgKdlN5hyRRZnkzJsPZnqRAeglyZbJ2wfbfYE8G9hrBL75ZUmUJf/Bw2T
9HxvMHNOZM2aTG1avIHmW6J++GOiCN1ptucjHS4OEGA3cadyO8zYCO66fWH1nLtO
ls0Wzdg60OjiMtBBISFXOCgUkJNLIs1L9ug8IZIXbenrKbOhnTwnjzyy80zX44Lc
MuLAjABIixSFw6KDR+uGlJVqcNge6nHJmEze3A3b5QDrYE/1mQnuzwLjKfJTj5OU
lEFLvtDr9YmnpkRICwwn2X6n0mgSIAdNnVUP2JaVE201AsUoXWdqN2AsDLqCjE+W
6lbIt51EfRQdSI7YKm+YW2smSTe/4nKvbUDFsQmLWGjgijt6X9QSxiCdKJxlKp5L
HsHVtH60mflOlRTyHWI3kiNUIMhP51HOt3B+DhmVaszuWhE24FAS9cj+nPPCWPDk
JorrS6sxpzIRiuMV4maIfnZDiFpBS2UHzJeDmJAleBq+eU1qo9CU9huwtbzp2aY8
p0+XRTPrr8bG2h2XfOWxpghwgbz8SuVB03PRdWKZN5q99u/XUyeRgqayDH9KWBrv
ygPsw2ZvbCj9Jaa4MAjAaNz8CqfPkTz+ri+/tKpleotJMhznMGo=
=OK0d
-----END PGP SIGNATURE-----

--=-f9pVxU9gW8q5Fs96aXmZ--


--===============7370311082035509391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7370311082035509391==--

