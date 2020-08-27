Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E064C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 06:26:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA9122177B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 06:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okV3rgmr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA9122177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B9C6C86F92;
	Thu, 27 Aug 2020 06:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NT8-XvDWG078; Thu, 27 Aug 2020 06:26:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ECB9886746;
	Thu, 27 Aug 2020 06:26:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4598C016F;
	Thu, 27 Aug 2020 06:26:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00A1DC0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DCC2186F92
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s76SKav6xLQW
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:26:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8E42286746
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:26:52 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u20so2712927pfn.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Aug 2020 23:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RsMY/I5OAe+zBpGdLjZQnUHo4Lg3vz6Pr/JdbiQ/TqU=;
 b=okV3rgmrWyme/MXq1RJFHJR7J11AHRr3Ug9HofeeOB7akxe6L9EA+viDRhWuCUU6bE
 7Wq5lhmVS2+vBJkMxebErACHEbDekxv5Z1KCG3xNJiLSSx+XqkoA9QyAc9CrlDlwtZTi
 LY2oDpn2CvuAs4DHiV23Wm85pntCYlHQRRGjxuOi56QK420q85UW1vVPgf7HwD1+loi3
 ym3wP/TmK7VC4yegYUc/cFdH4RDP7eS2prcmTYnuPrnBcRRfSYiC3lcs7DgxIt6p6S8r
 0CEE1JRcR9Bi9qA93k1kFwwziLSPBF46vjB8UYDpEUsGwgvwObO7M+B1vTygmoYDWqUc
 pBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RsMY/I5OAe+zBpGdLjZQnUHo4Lg3vz6Pr/JdbiQ/TqU=;
 b=GNLSLRIyQd9W5xDODWnGoIi06JwgTGRxY8W4RgikjaDW0Ec9F5IZazyOvxRAdJjeon
 OTYX3MHtczPYhMqHAm3MSxOdWABmD2nFVmboODHa6vIrMHDG2N5iZlVCyHhm2kCkTpWH
 DLZFdEr+diFu6MAXyQF9fOUIUYMz1YMaPjGiXC8imVDpiZi6JuMTJXcmZ3fzbChc89PY
 rXQDYN34wn6zNOwLv3nrOc82dog2sk2fekviGJv5tcNg4ntSw4dZ5qwQv4q0pKnookLx
 6bD6becpOVSoO0qERZUQolxsIhPQcinpXJvmy+1v/DCR7COTqYKXSRa/Gqz+qjVDMju6
 nSeQ==
X-Gm-Message-State: AOAM532QbiIPdGrLCEkvycxewSavMxdwP/ZYL+hqr3k5v1YxXu1fSLtn
 vtu1KZ0c1V+tALhoADxd9BA=
X-Google-Smtp-Source: ABdhPJwH6sMe2IseEWAfXOJNldhkjxc9wcot7HsfGFBSz/gqzHi70q4UWwROJ4Moa7iVRzGwXm2t7Q==
X-Received: by 2002:a65:58c4:: with SMTP id e4mr13721152pgu.188.1598509612044; 
 Wed, 26 Aug 2020 23:26:52 -0700 (PDT)
Received: from localhost ([1.23.143.13])
 by smtp.gmail.com with ESMTPSA id x12sm1317681pfr.42.2020.08.26.23.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 23:26:51 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:56:47 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org, mrinalmni@gmail.com
Message-ID: <20200827062647.7olorxqfd2nrbzyf@mrinalpandey>
References: <20200827060523.6fi34tcrg5xndzuu@mrinalpandey>
 <20200827061307.54526dz54p3gd45u@mrinalpandey>
 <CAKXUXMyZsENwp2jM106N_uao+yj=R-tGJDLerSO-GqtL+Qd3qg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKXUXMyZsENwp2jM106N_uao+yj=R-tGJDLerSO-GqtL+Qd3qg@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: Add intended executable
	mode and SPDX license
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
Content-Type: multipart/mixed; boundary="===============8707006602764114609=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============8707006602764114609==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ixj5bajoa2rbyrup"
Content-Disposition: inline


--ixj5bajoa2rbyrup
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/08/27 08:16AM, Lukas Bulwahn wrote:
> On Thu, Aug 27, 2020 at 8:13 AM Mrinal Pandey <mrinalmni@gmail.com> wrote:
> >
> > On 20/08/27 11:35AM, Mrinal Pandey wrote:
> > > commit b72231eb7084 ("scripts: add spdxcheck.py self test") added the=
 file
> > > spdxcheck-test.sh to repository without the executable flag and licen=
se
>=20
> s/to/to the/
>=20
> > > information.
> > >
> > > commit eb8305aecb95 ("scripts: Coccinelle script for namespace
> > > dependencies.") added the file nsdeps, commit 313dd1b62921 ("gcc-plug=
ins:
> > > Add the randstruct plugin") added the file gcc-plugins/gen-random-see=
d.sh
> > > and commit 9b4ade226f74 ("xen: build infrastructure for generating
> > > hypercall depending symbols") added the file xen-hypercalls.sh withou=
t the
> > > executable bit.
> > >
> > > Set to usual modes for these files and provide the SPDX license for
> > > spdxcheck-test.sh. No functional changes.
> > >
> > > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > > ---
> > >  scripts/gcc-plugins/gen-random-seed.sh | 0
> > >  scripts/nsdeps                         | 0
> > >  scripts/spdxcheck-test.sh              | 2 +-
> > >  scripts/xen-hypercalls.sh              | 0
> > >  4 files changed, 1 insertion(+), 1 deletion(-)
> > >  mode change 100644 =3D> 100755 scripts/gcc-plugins/gen-random-seed.sh
> > >  mode change 100644 =3D> 100755 scripts/nsdeps
> > >  mode change 100644 =3D> 100755 scripts/spdxcheck-test.sh
> > >  mode change 100644 =3D> 100755 scripts/xen-hypercalls.sh
> > >
> > > diff --git a/scripts/gcc-plugins/gen-random-seed.sh b/scripts/gcc-plu=
gins/gen-random-seed.sh
> > > old mode 100644
> > > new mode 100755
> > > diff --git a/scripts/nsdeps b/scripts/nsdeps
> > > old mode 100644
> > > new mode 100755
> > > diff --git a/scripts/spdxcheck-test.sh b/scripts/spdxcheck-test.sh
> > > old mode 100644
> > > new mode 100755
> > > index cfea6a0d1cc0..758fa645ed99
> > > --- a/scripts/spdxcheck-test.sh
> > > +++ b/scripts/spdxcheck-test.sh
> > > @@ -1,5 +1,5 @@
> > >  #!/bin/sh
> > > -
>=20
> Why do you delete the newline?

Sir,

I will rectify this and include the above suggested change in the final
patch.
>=20
> > > +# SPDX-License-Identifier: GPL-2.0
> > >  for PYTHON in python2 python3; do
> > >       # run check on a text and a binary file
> > >       for FILE in Makefile Documentation/logo.gif; do
> > > diff --git a/scripts/xen-hypercalls.sh b/scripts/xen-hypercalls.sh
> > > old mode 100644
> > > new mode 100755
> > > --
> > > 2.25.1
> > >
> >
>=20
> I think it is fine to have this as a single patch. It is local enough
> to say that we are touching all those files in a single go.
>=20
> Other than that, it looks good to me.
>=20
> Please state to whom you intend to send this patch.

Running get_maintainer.pl on patch suggests to send it to the following adr=
esses:

Kees Cook <keescook@chromium.org> (maintainer:GCC PLUGINS)
Emese Revfy <re.emese@gmail.com> (reviewer:GCC PLUGINS)
Matthias Maennich <maennich@google.com> (maintainer:NSDEPS)
Thomas Gleixner <tglx@linutronix.de> (maintainer:LICENSES and SPDX stuff)
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:LICENSES and SP=
DX stuff)
kernel-hardening@lists.openwall.com (open list:GCC PLUGINS)
linux-kernel@vger.kernel.org (open list)
linux-spdx@vger.kernel.org (open list:LICENSES and SPDX stuff)

Thank you.
>=20
> Lukas

--ixj5bajoa2rbyrup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl9HUiYACgkQxIwpEWwx
hGSEdBAAnEVx5edaHyV4rpFEk4h2EjhHfyXLWqzrouNWzvO9TmJSVon3YbC2KKh3
ZobX9WN3EdHuSOnR7lDyOE0RUpYvRybkBrVQkyaAdWIfEK1/ZLd6lcSoS9MI8GPL
yHzkXlJfpJ7mjtg1SJwOa4X/+5DEz+8DhWLdgOS+NuQyUOvot+6etMXq6JzPQKfs
0cW+FSJ6K5/HvgLyDpPAukDVhOn8rMV88fSFOS18cIY8yEHPMsLEPPTRtLhrS/RB
C8WCtHGKtGr6E2cYRFpwP+s3QAQDzpG0nyUIj+AWXCPzo5lAlPCMp8BHdTTGbs+p
GpwQ2WS5fOZr7A+fkMudE3E71kkveKkffDJvOZ3a+d5mm47SK8aMlLs+xBx0A39I
r6sq5nKAKqEtg9LXuXR5Xyl/GffxYyVLyLEydfAIo9lckVqUf14tNPkfGqYfV7JG
IFL+L+2FeRH/X/DEo3JHZv1hwviZH/XOCa38hrqMoMQVQPrEBihz4AFb1ok3Rs/O
/ujG6oF71wQmFRhOFvJfVpwQ2XHoOvy84JFDEznHIBbPkZdlNUYAsIJr8NKIObXf
qlw6bfYoErT33HbFnwLj6LfSVS6ax2mCbzNScIIrG+QQeBDcMiPz6vx3BD9osszC
VEL4JDnLmLRIq79wWibwvMlHKkNGaiOjPUsCmGIZUM1AMwCLbss=
=grhn
-----END PGP SIGNATURE-----

--ixj5bajoa2rbyrup--

--===============8707006602764114609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8707006602764114609==--
