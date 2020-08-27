Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0170C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 06:13:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA5A20786
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 06:13:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJ7IDALj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA5A20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3C2CE204D6;
	Thu, 27 Aug 2020 06:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQgRevEXasoE; Thu, 27 Aug 2020 06:13:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 68A46203AF;
	Thu, 27 Aug 2020 06:13:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60A6AC0890;
	Thu, 27 Aug 2020 06:13:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C6E3C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 87E18867F6
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxZ-suVYHdes
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:13:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5F23A85551
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:13:13 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id m34so2574239pgl.11
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Aug 2020 23:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7MiJnnCB7gA9xNLiLdoYWbkWU1ENIMWv1Ue7ThJkkSg=;
 b=VJ7IDALj3eCK89RASzq43VLVDEUVCjDhPf2iKceJrBoDU3gtBZMa6ZPcFjPcTTOdVh
 qiVtzqiEYBkcfMNd9cqH0qvSWL7NSAqWYhzk3Kl03BPQWCfdQsWzg3yMfVr+eeDGBTBi
 nB+GtuNjbPaiHlwffNh2boqPVZKHz0ZUa1USez7HEf3gNk9l5qcP5gYFPHzCqrSsNwY5
 WHhAv5kDrd2IJNUGHUhglMEEcFz+tEbyEB2oEh1IsJhuI5XayOVCbV5T4I3tnsr5/bab
 H4wGCm53ADG7zGC6IPqFkLGdgkHsw1LUyfeRMx/yBLZfZmERfb/vakQKlQ+HkuhXU+W2
 D2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7MiJnnCB7gA9xNLiLdoYWbkWU1ENIMWv1Ue7ThJkkSg=;
 b=hQiyHnpnIupvTM3bETL29rhFit/hWNE8RpEUN0A008lsQZaX+aM3ZSG4PfnRzIA3ss
 rUl7r8VUyWLFaftWF7Rkv9r7E8485gxGx3n8L0xS/XET6rvSf9vBQZrj/Q3OUmALtZaD
 CodHnh791MaSe5M1RhoSarqF6kiYWJ7QSAlBMO9rLSOChR58EtRYfC7bwQI13LijkUfM
 fXw8jS4261jUzEV58LcI7EqVldQgE1+bMgkUws68Y6udQZkzh2TrsVX8pg3Dxo+G8xjJ
 mmvxcKRWf1TcLYUkdngYkxuTBgmN0z4+cxXk73oJAasGPTEPq0jBU6knc4b4rcl2ozVi
 9uEg==
X-Gm-Message-State: AOAM530QoPwsPNkiSAE2FBB/Vn3M7KoGFddqjNrVe79z12pQBSgkKn2B
 E8U1yDZm+qad5OffB5RIcio=
X-Google-Smtp-Source: ABdhPJxsnvGh+UpxXc7fL3jCzBXil3Jc/yzbZYcCT6WA9PvD8AUWt9OwrZmO+lllZcV4TRikbGrSzA==
X-Received: by 2002:a17:902:c286:: with SMTP id
 i6mr14602297pld.219.1598508792870; 
 Wed, 26 Aug 2020 23:13:12 -0700 (PDT)
Received: from localhost ([1.23.143.13])
 by smtp.gmail.com with ESMTPSA id z127sm1239420pfc.113.2020.08.26.23.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 23:13:12 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:43:07 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org, mrinalmni@gmail.com
Message-ID: <20200827061307.54526dz54p3gd45u@mrinalpandey>
References: <20200827060523.6fi34tcrg5xndzuu@mrinalpandey>
MIME-Version: 1.0
In-Reply-To: <20200827060523.6fi34tcrg5xndzuu@mrinalpandey>
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
Content-Type: multipart/mixed; boundary="===============7475510899670483951=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============7475510899670483951==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="who45lfp6fkm33xn"
Content-Disposition: inline


--who45lfp6fkm33xn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/08/27 11:35AM, Mrinal Pandey wrote:
> commit b72231eb7084 ("scripts: add spdxcheck.py self test") added the file
> spdxcheck-test.sh to repository without the executable flag and license
> information.
>=20
> commit eb8305aecb95 ("scripts: Coccinelle script for namespace
> dependencies.") added the file nsdeps, commit 313dd1b62921 ("gcc-plugins:
> Add the randstruct plugin") added the file gcc-plugins/gen-random-seed.sh
> and commit 9b4ade226f74 ("xen: build infrastructure for generating
> hypercall depending symbols") added the file xen-hypercalls.sh without the
> executable bit.
>=20
> Set to usual modes for these files and provide the SPDX license for
> spdxcheck-test.sh. No functional changes.
>=20
> Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> ---
>  scripts/gcc-plugins/gen-random-seed.sh | 0
>  scripts/nsdeps                         | 0
>  scripts/spdxcheck-test.sh              | 2 +-
>  scripts/xen-hypercalls.sh              | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  mode change 100644 =3D> 100755 scripts/gcc-plugins/gen-random-seed.sh
>  mode change 100644 =3D> 100755 scripts/nsdeps
>  mode change 100644 =3D> 100755 scripts/spdxcheck-test.sh
>  mode change 100644 =3D> 100755 scripts/xen-hypercalls.sh
>=20
> diff --git a/scripts/gcc-plugins/gen-random-seed.sh b/scripts/gcc-plugins=
/gen-random-seed.sh
> old mode 100644
> new mode 100755
> diff --git a/scripts/nsdeps b/scripts/nsdeps
> old mode 100644
> new mode 100755
> diff --git a/scripts/spdxcheck-test.sh b/scripts/spdxcheck-test.sh
> old mode 100644
> new mode 100755
> index cfea6a0d1cc0..758fa645ed99
> --- a/scripts/spdxcheck-test.sh
> +++ b/scripts/spdxcheck-test.sh
> @@ -1,5 +1,5 @@
>  #!/bin/sh
> -
> +# SPDX-License-Identifier: GPL-2.0
>  for PYTHON in python2 python3; do
>  	# run check on a text and a binary file
>  	for FILE in Makefile Documentation/logo.gif; do
> diff --git a/scripts/xen-hypercalls.sh b/scripts/xen-hypercalls.sh
> old mode 100644
> new mode 100755
> --=20
> 2.25.1
>=20

Sir,

I realized this was not supposed to be a single patch. I apologize for
the mistake. Kindly ignore this patch. I will send new separate patches
to the concerned developers.
Kindly let me know if those patches need to go through you first.

Thank you.

--who45lfp6fkm33xn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl9HTvMACgkQxIwpEWwx
hGTjRA//fseUFzC6NHdsdgXC21urwrvDaRE4VtOjJk3R0DCO5Tj//VBuUM6ad62y
R2E7TYkBL0/UwAKpahcP8MfPpMPrOL8RD250dv+DI+yY5MrzKmITDrCg33v7FQbn
EaMMMGBo1v1NDy45EQf573y7nvul0rIyfuxJOsuWr3/i/yZWwco3o7eLD1uuDPmm
cWV8VP0JcKyEaRNRM0bdfrRaRynLbBSKkLAB1FiQBbnQgiYxXYkbkR6/zOuszsWa
CMLjXTH8BUkhapkcVzjBVBZ5rbX1TSqefutQaSTxKhXRMxT989PXESDCk9jaxHJ6
QM157KXqEzUzZ1TrHlJsgbEVwGjkcsFUdzSnwQgYNoZ8CdkJrDTPewVZf3too+vG
bQiIjzC8gvx3BrPvr25q56u1WPpMD4UbXiZPTegO3HVNsxWa+s8of7udMlflzT/6
j46g4e8/W+8IgFrLwF817Lh/Xh0mdW8JqJ2p1D9UjiuSPvV5/AcNfn8GPSGhMXUa
mpcIiPxPZljs1iC0IKbESHyjzNIo22+PR9CML0CxEarbqjh0rqTDsrualxK81Q72
dAfuJqC4RKEDBotvdybHaYfp/Baz4YTVSki9rd5bkW+jDoVxKNuAIdSZHM60MLuV
pXgJNm6gSYYXyGmlTyE+ypw2AIEiR5g32ZXMFgletJhGk4V+JrI=
=Sikk
-----END PGP SIGNATURE-----

--who45lfp6fkm33xn--

--===============7475510899670483951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7475510899670483951==--
