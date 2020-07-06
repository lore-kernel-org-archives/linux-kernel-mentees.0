Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED6EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 08:08:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1780206CD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 08:08:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bwp6lPO3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1780206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 990238815F;
	Mon,  6 Jul 2020 08:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgNgEjgO8E+U; Mon,  6 Jul 2020 08:08:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA9E2873C5;
	Mon,  6 Jul 2020 08:08:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5DA2C0893;
	Mon,  6 Jul 2020 08:08:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F875C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7540786CFC
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IuXnUXhNbr0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:08:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BEF5486CF5
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:08:27 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id mn17so3155447pjb.4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=57SmcvTTJq+HCNeIIZQntQ5DuldpJNDCvDiuVSLSmQw=;
 b=Bwp6lPO3piX3s1dbb1E0CO0Y5SuunCLzWP2NeeIV7g8y9PoMuepf5PyNt42hVOgO5T
 9utoqt3jaL9mtc625C83Qdwv7OtcGWYEBlpnRO8gfL+v+Je3nLkW1CfjqsKAl/D6aejS
 TxEZF9MQPXLE/YX6Ll/Zf2UmYbWvzdMzy4v003LIJQzGCVMmzFWCNwsbLWm5X5cNriWt
 Xh/lv0OelHfFGslTaKXDiSVawY8JohbVvGm1V5ixqHkgb0LoXv2pehkvgkAeeVBEXTVT
 ypT90qfa/xc7VcLz2m1nYVkRYqatCi9TwpXzSC5XUr4Qt+3Q+mybZNbKFKyTirYbs0+K
 c7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=57SmcvTTJq+HCNeIIZQntQ5DuldpJNDCvDiuVSLSmQw=;
 b=cw5NQGHk1Ma0gKFINjQRFwqqaqlFMLHYeYcWUWP4e+crUIyFFj6OhqRffQEjlixvQ8
 eykx6xWzvGb8PrKJxPnbk/Yh8PX3uq32NKVWxlgF3rGiEqmUgtERqx6lLs/z0EOdlyXP
 u25N9wZlMXqbqE4M9egyi1isffDjk+UFMW3Zxx2iPzpaMsq0JH6ZHM7XIY+Ua/NXWo7S
 3Pc/VvShRS59NJoco779i3X2Fz7S2y6M0Gckb6VnevgNTxPW4qEhMlWEOXOE0iCkCeeI
 CCn0EsxAnchP1WFBCsayUePTcFU9lisv/b2pM8xcOJm9kFGodIT1xovRBpMXX6tV6OOU
 fJWg==
X-Gm-Message-State: AOAM533QcKSRQRjI6OSXbQzu8wmblfLQgXgZ2Ny/er/4I8v+lYTFiqF3
 aQMSI1VKtbR5Z5EvpbG4qrQ=
X-Google-Smtp-Source: ABdhPJyU5/dePmWwZKb/ZlhzYoixVn3njABpuB4tMOWUdQzF/fkYvUkGS6z+HYNODLUTHKAez9uDkA==
X-Received: by 2002:a17:902:c402:: with SMTP id
 k2mr39925848plk.184.1594022907257; 
 Mon, 06 Jul 2020 01:08:27 -0700 (PDT)
Received: from localhost ([2401:4900:1690:7530:58b3:f707:e54d:cfde])
 by smtp.gmail.com with ESMTPSA id y10sm18178957pfn.121.2020.07.06.01.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 01:08:26 -0700 (PDT)
Date: Mon, 6 Jul 2020 13:38:14 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: lukas.bulwahn@gmail.com, Linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
MIME-Version: 1.0
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: Adjust spelling check
	false positive
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
Content-Type: multipart/mixed; boundary="===============3099061258214249021=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============3099061258214249021==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="apubnetzu6cmrkr2"
Content-Disposition: inline


--apubnetzu6cmrkr2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

checkpatch.pl issues warnings on the commits
made to scripts/spelling.txt for new entries
of typos and their fixes. This commit adjusts
checkpatch not to complain about the same.

Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
---
 scripts/checkpatch.pl | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3cacc122c528..538776faa96d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2994,14 +2994,16 @@ sub process {
 			while ($rawline =3D~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
 				my $typo =3D $1;
 				my $typo_fix =3D $spelling_fix{lc($typo)};
-				$typo_fix =3D ucfirst($typo_fix) if ($typo =3D~ /^[A-Z]/);
-				$typo_fix =3D uc($typo_fix) if ($typo =3D~ /^[A-Z]+$/);
-				my $msg_level =3D \&WARN;
-				$msg_level =3D \&CHK if ($file);
-				if (&{$msg_level}("TYPO_SPELLING",
-						  "'$typo' may be misspelled - perhaps '$typo_fix'?\n" . $herecurr) =
&&
-				    $fix) {
-					$fixed[$fixlinenr] =3D~ s/(^|[^A-Za-z@])($typo)($|[^A-Za-z@])/$1$typo=
_fix$3/;
+				if ("+$typo||$typo_fix" ne $rawline) {
+					$typo_fix =3D ucfirst($typo_fix) if ($typo =3D~ /^[A-Z]/);
+					$typo_fix =3D uc($typo_fix) if ($typo =3D~ /^[A-Z]+$/);
+					my $msg_level =3D \&WARN;
+					$msg_level =3D \&CHK if ($file);
+					if (&{$msg_level}("TYPO_SPELLING",
+							  "'$typo' may be misspelled - perhaps '$typo_fix'?\n" . $herecurr)=
 &&
+					    $fix) {
+						$fixed[$fixlinenr] =3D~ s/(^|[^A-Za-z@])($typo)($|[^A-Za-z@])/$1$typ=
o_fix$3/;
+					}
 				}
 			}
 		}
--=20
2.25.1


--apubnetzu6cmrkr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8C2+gACgkQxIwpEWwx
hGRLeA/9F8MmzdX0tgNWa0XFs1IZ16begYDgIbHg5U0s4wLDAMSZaiE+DsYG+gMA
QOcrVGfUzyEgIWBnuF3c0niQRsD/NYQlilS/sMwVebEMVCF8DNCALUHHjuXqJjVI
ttoUYTxtEoS6HG+GXKnA53jJ6wBJNzjN6FI1hwQmkooYLEj+IktNSlmaCXI2SeYl
XqRCL7fBUT6X7iFUN8kRv0MyJIrfAMKMUzSPv2hTOByzpl8qhcddWesobGBFtyp+
KBxUIseDsIYTeEO+TY8YyO0qA82tkM9IwjVCj5nr8jdLZ0+sn7Yw8Y3mwQ/d+wMl
Z7TOi74VzKqgCWLs5rJA0GmaAK5dX4IwmH+rK1HCIFby/+UuUOWFAMSjQe27zgjM
5tG/WpWEx1o5s1/mACcshTXuswV/DH+rOcNWY8xDKQg9hbGFvHnCYueWs/kPYxfX
uO+/3zYpX77R2aAcjb0YcyEoz/zAHSDAjdawHv8gFSI5SUhgHtN0e6nHEZwcjnAT
PV17f5EgBn7u3KR/W+5kA7htzkxJ98tdmgH1/de/Dzd8RXIe0FgFesypjA6Hx5sX
RC+/HCzIh/7wTMXHr1TJZ3JUiNrb1rf3ljWFG7i8xKEae7/OfPwjW+Q2EKG1DkYS
lCehcZf9PpcFkgL08sDFiHN1/WH4hIAE/KmmsfJFpVFAjhXmu7o=
=BxqA
-----END PGP SIGNATURE-----

--apubnetzu6cmrkr2--

--===============3099061258214249021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3099061258214249021==--
