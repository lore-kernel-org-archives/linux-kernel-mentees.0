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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA48C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 05:44:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5259720792
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 05:44:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVLpdUrv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5259720792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1FCED2408D;
	Tue, 21 Jul 2020 05:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xi68pfRNeImX; Tue, 21 Jul 2020 05:44:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ACA2A23E8D;
	Tue, 21 Jul 2020 05:44:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BBF1C088E;
	Tue, 21 Jul 2020 05:44:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18971C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 05:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 06AEA88648
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 05:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7OmvBea+-0Ob
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 05:44:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 51A9A88642
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 05:44:43 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id mn17so1018703pjb.4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 22:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=xG0tTcvOJyIseE0/OM/Ogk+QB5HJBvzcKTlH/zpHuJ0=;
 b=JVLpdUrvFgMvLP2+ETvdblreHVTY2xZl6aEPbLHbf8unuV4KjyM3lqesb/UIhdodZt
 YZOaRUWmodtBntw+M/xSGFZcGJnL0QLK4k/SsFoC0LaA/+OgcrrH27jA/u0rKbmCOPB1
 QJywX+G9j0adOO3iEniCGK8tACkAkAnsfyyahyz17gFvfIYHLq0uWde7m0gBJ0w23nOg
 GOwzAAQBV/2kADVmO21JodYR61Bfxyj76GO6E8nyCU8+xoCw8811g3ngIC7G2y7TH1My
 AQKVJL6J0LMfb+4p1JA4O593+SJT0oeoJzM3hAh4bp1JlTip6yNyrUGBWuaaeKgrCzaB
 y1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=xG0tTcvOJyIseE0/OM/Ogk+QB5HJBvzcKTlH/zpHuJ0=;
 b=nDbGtHNsxgCdFJ2PusP88CpRibHPcoQjbueUkc2tGMQ3Fk23Twa7caG9Q3sZcm1jAp
 i8j/Dj703rAqBYRNGZCVRM4jXGdJNlOPuciGPKNiG863WOzOAs8sHL3Qnxfoc8/QhYHL
 Puj/+jKoo2W+u1Itq/kAz94151QaHW07SMBA4/Bc4ZjJHIZQwex0lnRSQrvY+HbFeQe6
 P7P6zTtBESB1bZ52bATMHvaX7pG4yBqvsInnL0qCdVF2nO+fOPXBogx/TqrHnhP/OgjN
 OpebtkgwZRjLeOCyGiizGvC/itl3j0LB+uwhCYGbgb9mMRdOOPXl6hmTATfDP0uel1Bm
 PoZA==
X-Gm-Message-State: AOAM530iNf4+WJ+fILB9NF0oDjqLEo14QrXO9KibfMI6IrkngDKoqfQ/
 ZlErYhG3KAcU0g6NHbe4KSpkxtN9UFq5PA==
X-Google-Smtp-Source: ABdhPJxuIZGsFM7SjDwIkbNpoYBQRrLdn0FWw2QA4iwUNB+ZUoajvYeeqW9YLqJKF+EbAH1SuCtUag==
X-Received: by 2002:a17:90a:d086:: with SMTP id
 k6mr3056745pju.171.1595310282843; 
 Mon, 20 Jul 2020 22:44:42 -0700 (PDT)
Received: from localhost ([1.22.41.82])
 by smtp.gmail.com with ESMTPSA id d16sm18804427pfo.156.2020.07.20.22.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 22:44:42 -0700 (PDT)
Date: Tue, 21 Jul 2020 11:14:38 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200721054438.z7nhvykoqztofoui@mrinalpandey>
MIME-Version: 1.0
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: Warn about missing
	shebang in scripts
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
Content-Type: multipart/mixed; boundary="===============6390427805195657642=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============6390427805195657642==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c4zhswep2v6z37d4"
Content-Disposition: inline


--c4zhswep2v6z37d4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

checkpatch should warn if a script doesn't seem to have a shebang in the
first line. There is no such check present currently.

Issue this warning by checking if the file is a script and checking
`$realline` to be `1`, i.e. the first line. If these conditions are
satisfied and the first line is not a shebang, issue a missing or
mispaced shebang warning.

Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
---
 scripts/checkpatch.pl | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4c820607540b..c79233c64cee 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3165,6 +3165,13 @@ sub process {
 			}
 		}
=20
+# check for missing shebang in scripts
+                if ($realline =3D=3D 1 && $realfile =3D~ /.*\.\(py\|sh\|pl=
\|awk\|tc\|yaml\)/) {
+                        if ($rawline !~ /^[ \+]\s*\#\!\s*\//) {
+                                WARN("MISSING_SHEBANG", "Missing or mispla=
ced shebang for '$realfile'");
+                        }
+                }
+
 # check for using SPDX license tag at beginning of files
 		if ($realline =3D=3D $checklicenseline) {
 			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
--=20
2.25.1


--c4zhswep2v6z37d4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8WgMYACgkQxIwpEWwx
hGQnVQ/7BpV9Lw8YvxUFPttcUDC6Il3ubQK28jupyXsf4XDhb3CmxCJdfHVUylyv
Pi8JYS9MvMojTQqC+b5cWmoirTM8phSL8Rh2/p431YdUgiAABx20mrBGk0Ge7sLh
OWmuvD4Uz5a5HKXY/clnPAk21i1aXAcBk2+jRKBuNRty7fvpviIL8+rWiQbazvdW
BphGPw3fLgGLMPRuEoxR5h+aMGd+cg2POnw8nSBGaB3zSMmIL7dFGZovGXOJoqYW
JCUDrVkd8ldtP87k/qkyogBuqPK25cvjCtJ2xPHFp1ud29COOR2DC8xuLZjfMi/E
ITQ73j1DREzGJ3zmK+zaxcamSSVxGCQQu4KIuw/cQjNgcr1wKjb6x5grRTPLNBB1
bkI6kunrTcrOJNnoD/+upzZVE8jt+hX1BG1MwuAdzHrdTIp9nkw7C+nGU37eBoUR
GG3JXQZMBKfSfBVvQhwn2RozKqSTjQ4yHTygqeGhn998VwnXuv2wKCkzYoPliPnh
KK34rjuN0eU3lI+e8KaF1d5pAfv47nOlvOU4lQAbh7SqQnTmHkFgvghHsFXJOxVC
ZXd8OqpT+wbn3J1mH2zNKdUe3QlxmjlM0ssaFJYeoQHq4IDfsxpjShZ3d7vTFKxl
Y/Ylw8iwlbtbP4wFk+ldGNkEiqiqZZnMB852HJetdixb+DYLy5I=
=hnlC
-----END PGP SIGNATURE-----

--c4zhswep2v6z37d4--

--===============6390427805195657642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6390427805195657642==--
