Return-Path: <SRS0=QHLe=6W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CD7C35280
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 May 2020 01:21:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89B4C208DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 May 2020 01:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NucDWMIH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89B4C208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4E56A2046B;
	Fri,  8 May 2020 01:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eLnU4Te9CazM; Fri,  8 May 2020 01:21:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 644AD20434;
	Fri,  8 May 2020 01:21:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A2DBC0859;
	Fri,  8 May 2020 01:21:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F347C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2020 01:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5798B88B15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2020 01:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x02-SZQ0p+8k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2020 01:21:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BD7A88861D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2020 01:21:30 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49JCGC0TrHz9sSk;
 Fri,  8 May 2020 11:21:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1588900885;
 bh=fn1FAITXWrHoD5p0YkLk4NDvgXCTxZCopaiWSoAE24M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NucDWMIHzyEWKhv2Jpz5V57pCJSGVwKFECNyZ49I5pY1ukFXmrdSaz/00q2KpJDbG
 EWLv3FYAKffEQaBXd+sOR9qlvTBznRmAqjavXEhcZjrKMl21SATXigYcr4tbNlyzQh
 LO51vcA7p09iXpAntaH3rroJpzap350FUwdpbwPhGyiGuMajhFMQvdhcwTjZk4XvX6
 G0uZxVdYMDn1xLuA7ffyANP3YNjHI4Dm3OcCE7Iyy/sdLK4IVaRP0dKDCAajrN0BVY
 oKN7dnuctm+yzNgINA/ovWbnsNKaMaQHaqsWKxt52evUDbcrR1oWWSEzL2otnQG0AY
 Py7s4KqVpoUUA==
Date: Fri, 8 May 2020 11:21:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200508112121.6f665d74@canb.auug.org.au>
In-Reply-To: <1588897421.5685.152.camel@linux.ibm.com>
References: <20200430160205.17798-1-madhuparnabhowmik10@gmail.com>
 <20200508101402.267ca0f2@canb.auug.org.au>
 <1588897421.5685.152.camel@linux.ibm.com>
MIME-Version: 1.0
Cc: paulmck@kernel.org, jmorris@namei.org, linux-kernel@vger.kernel.org,
 madhuparnabhowmik10@gmail.com, linux-security-module@vger.kernel.org,
 joel@joelfernandes.org, linux-integrity@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, serge@hallyn.com
Subject: Re: [Linux-kernel-mentees] [PATCH] integrity: evm: Fix RCU list
	related warnings.
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
Content-Type: multipart/mixed; boundary="===============1811478300378217368=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1811478300378217368==
Content-Type: multipart/signed; boundary="Sig_/.D+o4SMW3l1UQxFqbqJwcNG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.D+o4SMW3l1UQxFqbqJwcNG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Mimi,

On Thu, 07 May 2020 20:23:41 -0400 Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> Sorry for the delay in pushing this and other fixes to the next-
> integrity branch. =C2=A0It's in my next-integrity-testing branch.

OK, thanks.

> This isn't a bug per-se, just annotating the reason for the lack of
> locking.

Yes, but these warnings stop the syzbot's testing in its tracks :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/.D+o4SMW3l1UQxFqbqJwcNG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl60tBEACgkQAVBC80lX
0Gy1kQf7BffVVaIpxbElKwALAau8rs7TlHqdions0ViHqWb9XbhY3sNQ1phj1nt5
QORcaLptQ5HmVAVz227Gdg15fnkJPeHg0/w5rUHyzV7f8PePzYE9wZGVvOik+9Sg
1d1QxHj8AHnRM+Ag+zCc7erThznlgkSKnMOWHonbV73Li9C9aGYE9jTE3L7rFcuh
b1AN0cliyojwb4E9bIbadn3fSUXivHKR0kHFcx5OFLZmsimBVjMYI19tZQm1RslG
HYHdEDBG2uGLgVRF6O53nj4FMTVNHJuMNa/gSJU/FgZIF5vAGnSuEE6od7LhT++3
+/bdVfFcjwWMKQ447SfxBZXwlos1Mg==
=FC49
-----END PGP SIGNATURE-----

--Sig_/.D+o4SMW3l1UQxFqbqJwcNG--

--===============1811478300378217368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1811478300378217368==--
