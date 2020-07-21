Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11FEC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 05:44:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9974620792
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 05:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgD0/z+d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9974620792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 49D3486ED0;
	Tue, 21 Jul 2020 05:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k173YEN2abf0; Tue, 21 Jul 2020 05:44:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 845B286EC1;
	Tue, 21 Jul 2020 05:44:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DFF2C088E;
	Tue, 21 Jul 2020 05:44:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B10D3C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 05:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9909A23E8D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 05:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jP+XE8WUm8Uo
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 05:44:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 6A54123BE7
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 05:44:25 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id cv18so938114pjb.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 22:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=T6VbhQzj+SoLnb8Hzx0AWp/QMypNt46Td8Z8gjqcmFE=;
 b=VgD0/z+dqnWwc9wtvaxwVvy40ayFAjzYZ+eGF/DUbaJAn/bLSlb3ajLD3rnClA+Nl6
 EMZzIxc0UyOmhxoBW7JoxlaK5mkcOxCMrk7urU5A+VFP4akL7Huq8vESaJiD1A0K1kP5
 OiTDp+xc8/xssggjXAfAPp88zsq6MhaGskxxyTnzDu69XRSwLUAGKHkAOfAbW8n7azLq
 sP1j4Kf1YSx81g/Q39kF3RyLxNj08zz3IeU07kqfdkCov5aaL3KfocAEBj6NdXKnLoDj
 /gEcp4sKJWbuVITom82ybEfONACoH+qoQy5Eyn6XOzzSfDRJtDMosI19Ncsdw2vJ159N
 u1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=T6VbhQzj+SoLnb8Hzx0AWp/QMypNt46Td8Z8gjqcmFE=;
 b=iVWb8drmbHCMgq+oQFJ9HFtG3vwY8MGM8ULFzrnmTNk3QiPUoXoD3kDufbmsr2PxOU
 YFeZ4y9rBCeAtFoubxNdD15/egh9UPP3tbs5tCp1EhpcNu/eslEJNbGCOFpuesaBINGq
 o/pwO+3QdFODFo4+GzTm8aRjGXWnlUPYGmhXZeo5SwysEPgqOPcQEBONVbtk3YcErR33
 UyySfruLE8e5BUtM/lTcsbE6aJ2dcmr5YRmI62HVuenLZ57oylRw69MFR2JE/cUQdV/9
 OQ53rfXW7TpE8PTwW2NiwYQ0rF07v5LVuTWdCnc0ltWL7cnr7Ch5yobXChR3NitF1Ai9
 rAiQ==
X-Gm-Message-State: AOAM530Ojk5YP3SUB4skP1zM8P/08+2BZWta3BZWsyTHuSKT6Ebweugr
 ghd0htR0ifm524C4Zc5OGkA=
X-Google-Smtp-Source: ABdhPJwZ1pAgSn5gr4AKS9CvH7EKs17b8iHqX+JPOJCdkqGPM5Mqxjpscq+ncs4cLqlH2W0ifj7G1g==
X-Received: by 2002:a17:902:8697:: with SMTP id
 g23mr20474002plo.94.1595310264870; 
 Mon, 20 Jul 2020 22:44:24 -0700 (PDT)
Received: from localhost ([1.22.41.82])
 by smtp.gmail.com with ESMTPSA id x17sm1017976pff.188.2020.07.20.22.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 22:44:24 -0700 (PDT)
Date: Tue, 21 Jul 2020 11:14:19 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200721054419.kab7i6l6zkioddh5@mrinalpandey>
MIME-Version: 1.0
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: Fix SPDX license check
	for scripts
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
Content-Type: multipart/mixed; boundary="===============6233046578546474060=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============6233046578546474060==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5iy4xu2tq5c5prhh"
Content-Disposition: inline


--5iy4xu2tq5c5prhh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In all the scripts, the SPDX license should be on the second line,
the first line being the shebang, but checkpatch issues a warning
"Misplaced SPDX-License-Identifier tag - use line 1 instead" for the
scripts that have SPDX license in the second line.

However, this warning is not issued when checkpatch is run on a file.
The case for files has been handled gracefully by checking first line of
the file to be a shebang and then setting `$checklicenseline` to `2`but
this doesn't work when we don't have shebang in diff content of a patch
and `$checklicenseline` continues to be `1` in such cases. Therefore,
checkpatch expects the line `1` to contain the SPDX license when it
should have been `2` instead.

I noticed this false positive while running checkpatch on the set of
commits from v5.7 to v5.8-rc1 of the kernel on the commits which modified
a script file.

This false positive exists in checkpatch since commit a8da38a9cf0e
("checkpatch: add test for SPDX-License-Identifier on wrong line #")
when the corresponding rule was first commited.

Fix this by setting `$checklicenseline` to `2` whenever the file or diff
content we are checking comes from a script instead of checking first
line to be a shebang, thus, informing checkpatch that the SPDX license
should be expected on the second line.

Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
---
 scripts/checkpatch.pl | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4c820607540b..bdd2f9a80891 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3166,10 +3166,11 @@ sub process {
 		}
=20
 # check for using SPDX license tag at beginning of files
+		if ($realfile =3D~ /.*\.\(py\|sh\|pl\|awk\|tc\|yaml\)/) {
+			$checklicenseline =3D 2;
+		}
 		if ($realline =3D=3D $checklicenseline) {
-			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
-				$checklicenseline =3D 2;
-			} elsif ($rawline =3D~ /^\+/) {
+			if ($rawline =3D~ /^\+/) {
 				my $comment =3D "";
 				if ($realfile =3D~ /\.(h|s|S)$/) {
 					$comment =3D '/*';
--=20
2.25.1


--5iy4xu2tq5c5prhh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8WgK4ACgkQxIwpEWwx
hGR6ixAAvXREZG+FcyDUOrGNoTeGEbX9sfmor35w8p/9zwmJ+xU0zcTDBaHu6tNw
m1xb/szI3GmQS0NCLyrusX09zMKu4INA+57fS8xFTuP3S67a2NgOX8GmnvrGnK+4
+XfuN/lIrno6N7X1/D8tmfbkz92AqodVxVC8/71lpimEGgNrlIP1POY2AtFYT++d
7mY0GtAyOFTRDQZwYoZQpNv1d0b+YDthyzSAnXGexLGc7ACgfhZ/xTelVXddKsIg
Eg+0b0evI5eyeTIrMU0X2tjvdbTXIq3eJ+Oo6vqle2P85ZE4ZFbITz+4qGQ5jN19
fjwxHyfnuOnvNH1mKDAQhQYHKqkiOP0QRWyGaRpJWAi5h8CqDF4w2SY7oX7VNojo
A6hob+1mhCYIDu9m171zEZyi7XvbzVgGlSiPnqyMHAee/zIwfVlM6egbQj7dTpaK
lhcZYP+xrOPKzDaCg+ZUmXroxEQTbpVdgGtCQzES0Id68TJ3slIbMT6zwJI5Tovr
7upzJOOaKakqBrwws6Ec7H2ZF52zhlMS0pmeEvYjG09JptcqtE1oEPKkkLZ6hRMs
PPB19kvQDqYfiuDE4jnx4hhE/y39EIZ+zm4TQ0hdXTmQgEu3ZbQSLZtU3HeiTmWx
Cq44dacQyc5JVZyq2h8is8qt2KUEydxrzfF4ICNdvHvwbyi/jO0=
=jpye
-----END PGP SIGNATURE-----

--5iy4xu2tq5c5prhh--

--===============6233046578546474060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6233046578546474060==--
