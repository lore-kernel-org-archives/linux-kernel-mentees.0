Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8BAC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 14:01:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9289820771
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 14:01:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cl9A375s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9289820771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7346C87D28;
	Mon, 10 Aug 2020 14:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D2gYhODBhCUB; Mon, 10 Aug 2020 14:01:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 10FD787C11;
	Mon, 10 Aug 2020 14:01:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F277EC0864;
	Mon, 10 Aug 2020 14:01:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F225C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 14:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 89B4D8772C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 14:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kPxjcFvy7sH5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 14:01:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 23F7E8770D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 14:01:38 +0000 (UTC)
Received: from localhost (p54b3345b.dip0.t-ipconnect.de [84.179.52.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 794D720729;
 Mon, 10 Aug 2020 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597068098;
 bh=ozzlIOEoLX+gjwBMiSFazOCYHVq62zd4+ksVu4HA5Zo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cl9A375sVSL97XtiyCHrZc43oV5aQlLdIle/TQUJocpV4+rLildqkG5f1HyUbqQCJ
 wrf8BCqkI9igEjwfg/Jeem/nudegoAaXeoNqX3zbnx34npyAYUBJCPJwqzsW2IUXAP
 kjt62544nlhnHC/NGLJiOpSU2Xfn1SfWuR0rlQiU=
Date: Mon, 10 Aug 2020 16:01:35 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200810140135.GA3923@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
 Tomoya MORINAGA <tomoya.rohm@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20200805165611.GA516242@bjorn-Precision-5520>
 <20200805193616.384313-1-vaibhavgupta40@gmail.com>
 <20200805193616.384313-2-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200805193616.384313-2-vaibhavgupta40@gmail.com>
Cc: Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomoya MORINAGA <tomoya.rohm@gmail.com>, linux-kernel@vger.kernel.org,
 Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-i2c@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 1/2] i2c: eg20t: Drop PCI
 wakeup calls from .suspend/.resume
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
Content-Type: multipart/mixed; boundary="===============5800917097047435473=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============5800917097047435473==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 01:06:15AM +0530, Vaibhav Gupta wrote:
> The driver calls pci_enable_wake(...., false) in pch_i2c_suspend() as well
> as pch_i2c_resume(). Either it should enable-wake the device in .suspend()
> or should not invoke pci_enable_wake() at all.
>=20
> Concluding that this driver doesn't support enable-wake and PCI core calls
> pci_enable_wake(pci_dev, PCI_D0, false) during resume, drop it from
> .suspend() and .resume().
>=20
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Applied to for-next, thanks!


--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8xUzUACgkQFA3kzBSg
KbbVVw/5Afnt1eYRB6Rom/xFdNwBnxwUyukASNVrJsWtIYfCqUGG1LonmrRXMsE+
LA9mmsPHiFhrFnQXeJE9PD2YushTsR97U50NBuMRvz3OuyoLTZErdyZZH7+yMoKF
HsJ7n+ZtrQ/x3Ca2c0ePRd/8qOy6/4zCa7zvpsG8IKoHo6w4iJ3U8PrkYI+40SGp
N8MC0Ja3fc4AUL+YJoFuNVfs3pWmMSm7BUc8W7L457tSHw9pkSFuMauvYy2hMGez
o1bXhYpT0DSK3EKYaviPvCl2csCx2j+kUrU0kXh6XuXHmom1ScMzWMiVFPq5yNmr
6GusaohaNgI2sZyKW9BK5YW1pf6On2RnDsonj6rnAigaY+E6gPFVe/eDfurmBNyF
t7bU7rCIazTNU3B0R8cLmS9mYm1TfSiy930+lounooNu2N/xLKYKpbKtnIxM+0/4
Jxa9vZqYMuglRCi72KnNBW5tnLFaHrAsQQ2ZAhtJIopkPt6SJRmfmTkJAsuokYIp
mT1rgGGMBWbtMCsKuqo/cK3rsfcbG9t4U0DYbe4lt//q+s1L137Qp3ogJonH3/kp
Jf244WG3ITpgKC1EHNyleH9AYZsmzX2s+CHJIOrjunhXxQi49JRhAp2jwQiaHRCX
tOAWUIAIPdQL2ffk2C6hQxDsbVBUcOHb3X29uUVNbHY034IpV/c=
=uBOB
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

--===============5800917097047435473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5800917097047435473==--
