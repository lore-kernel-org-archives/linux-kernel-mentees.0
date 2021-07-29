Return-Path: <SRS0=Pn+h=MV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411AAC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 08:31:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86C7060FE7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 08:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86C7060FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4473840219;
	Thu, 29 Jul 2021 08:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1sBvcwA6tVI; Thu, 29 Jul 2021 08:31:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 22FCC40025;
	Thu, 29 Jul 2021 08:31:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D99A8C001A;
	Thu, 29 Jul 2021 08:31:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0450DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 08:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D23ED4012A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 08:31:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lr1hfgVH13Bm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 08:31:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CF5640025
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 08:31:52 +0000 (UTC)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 58CCD5F93A;
 Thu, 29 Jul 2021 10:31:50 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: desmondcheongzx@gmail.com
Subject: Re: [PATCH] ntfs: Fix validity check for file name attribute
Date: Thu, 29 Jul 2021 10:31:45 +0200
Message-ID: <2424055.QlFIqzKPrH@devpool47>
Organization: emlix GmbH
In-Reply-To: <20210614050540.289494-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+213ac8bb98f7f4420840@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, anton@tuxera.com
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
Content-Type: multipart/mixed; boundary="===============8667145855885396833=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8667145855885396833==
Content-Type: multipart/signed; boundary="nextPart2416868.LEy6h3IvCX"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2416868.LEy6h3IvCX
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: desmondcheongzx@gmail.com
Cc: anton@tuxera.com, gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, skhan@linuxfoundation.org, syzbot+213ac8bb98f7f4420840@syzkaller.appspotmail.com
Subject: Re: [PATCH] ntfs: Fix validity check for file name attribute
Date: Thu, 29 Jul 2021 10:31:45 +0200
Message-ID: <2424055.QlFIqzKPrH@devpool47>
Organization: emlix GmbH
In-Reply-To: <20210614050540.289494-1-desmondcheongzx@gmail.com>

Hi,

I was just scanning through some older vulnerabilities and came across=20
CVE-2018-12929, CVE-2018-12930, and CVE-2018-12931, which are all still ope=
n=20
according to linuxkernelcves.com (originally reported against 4.15 [1]). I=
=20
looked into the commits in fs/ntfs/ from 4.15 onwards to see if they were j=
ust=20
missed, but I can't spot anything there. RedHat claims to have them fixed i=
n=20
one of their kernels [2].

Which makes me wonder if the issue fixed here is a duplicate of the any of =
the=20
above. Is there a reason I can't find any patches for the original issue in=
=20
tree, like the issue only introduced in a custom patchset that Ubuntu/RedHa=
t=20
were using? Is this thing worth it's own CVE if it's no duplicate?

Greetings,

Eike

1) https://marc.info/?t=3D152407734400002&r=3D1&w=3D2
2) https://access.redhat.com/errata/RHSA-2019:0641
=2D-=20
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
=46on +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 3160
Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-IdNr=
=2E: DE 205 198 055

emlix - smart embedded open source

--nextPart2416868.LEy6h3IvCX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCYQJncQAKCRCr5FH7Xu2t
/EknBACWisFFpJAxn+isaQff639lnnAPEn8ABLf1II4r/EFgnqoBuSrAMvVfJvjC
IxOI3aCtR9XtK6GjB5q4FI4YoE+jd7K+bwR//lInCvwnZdaPZvBGM0DFCzJ62kWl
P6HYTgnZvbNoThgf0S2GB0e/KoU7BH5hVvFSpIHBQoqSkRHRJQ==
=+ScD
-----END PGP SIGNATURE-----

--nextPart2416868.LEy6h3IvCX--




--===============8667145855885396833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8667145855885396833==--



