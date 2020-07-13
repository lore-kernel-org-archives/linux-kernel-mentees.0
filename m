Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C17DC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 09:58:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 607982068F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 09:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5IGwJ8G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 607982068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 30BE08963F;
	Mon, 13 Jul 2020 09:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7KJkPOEwzdEy; Mon, 13 Jul 2020 09:58:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 635868966C;
	Mon, 13 Jul 2020 09:58:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B662C0888;
	Mon, 13 Jul 2020 09:58:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2B68C0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 09:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ABC2386FC9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 09:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 381lq3JFFEyY
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 09:57:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C319286FC6
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 09:57:49 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x72so5783637pfc.6
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 02:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=GJb8wBpXKfaeq0uD/Mku0pz1DCntVD17alciGMLXamw=;
 b=V5IGwJ8GKTef6QcGuPYfGMbdrBlZF+OKmSdBznouqKtPoQAUfvaPVoJGYzwtxq23cI
 aLVsveaYHsGT68CVkygAnHGPG10h2COkEfGqYeeM8NzWt1haKsmBFBDfywuI9rc0hOPD
 cJt9Gsia53PD8TtvMYY97rF3mGmIcwO5DxCRSt3XP33MCxC9O1/piW+Liqndl3CsyPg9
 BoUip8yeX0H1MHsrCoDA1MxLEvgKC2YwhjdEJ+xo25Mjd/jWl6aVlsk5+wzilRwp8PIh
 bsmhLmfWgNlwxUaebvam/lfHyOQCD06cFYJy8x1t3vw+n/kyoXZgyKh1MfoIaZl+WKOO
 0s/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=GJb8wBpXKfaeq0uD/Mku0pz1DCntVD17alciGMLXamw=;
 b=K3fazqx6dasMGAylcM+s/ud/emkSsWiUIvtwwoKV2VPA6BKn8DO5SzBRzKQymairR/
 0YrdOHY875r6+XsNOu0zqkMNiopeGRlYBYdly13nubThSmVRHzMtQH7zd4Je3YjFBE2W
 6eikbwdmlf2HddrthiWJoQLuDojXqY8QnJEQXNLBJrc6y4FFMcy1UIMw9yk8s/S7AOjX
 Jr4tWEhUvn2byOQgs5dVvQU1kMeeaFBynOZVImQVwSMUUbIlXeZatJbrZwTfNtrdeD20
 aVyX9MCCvUfMrLdM+kNHDLxDrDTAdbNxX+uVl5f9K/C2mqO7HZMKnFxtxcV7wzVgo1bV
 OAeA==
X-Gm-Message-State: AOAM530Rmg1bC2/sNxw8/Uj1c1GEal9TOXzst425o9ffWa4VH5hkz3Ev
 dytg2hBl9gCb3gH+P0Egpr4=
X-Google-Smtp-Source: ABdhPJyYQwv+e4OM6Ah1yHb1IKJVTk5T40pDT6tlg/6NvyjkqV74G0Q/OrXQU8tJPFIEGmMTNOqK/Q==
X-Received: by 2002:a05:6a00:1342:: with SMTP id
 k2mr72280151pfu.32.1594634269306; 
 Mon, 13 Jul 2020 02:57:49 -0700 (PDT)
Received: from localhost ([2401:4900:1692:3ec9:34c4:54d3:ee0a:4af3])
 by smtp.gmail.com with ESMTPSA id c134sm13857545pfc.115.2020.07.13.02.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 02:57:48 -0700 (PDT)
Date: Mon, 13 Jul 2020 15:27:40 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: lukas.bulwahn@gmail.com
Message-ID: <20200713095740.mi3cnx7tccoetxgc@mrinalpandey>
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============0799920421734888310=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============0799920421734888310==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="44qq7k4ubusxyrgk"
Content-Disposition: inline


--44qq7k4ubusxyrgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In all the scripts, the SPDX license should be on the second line,
the first line being the "sh-bang", but checkpatch issues a warning
"Misplaced SPDX-License-Identifier tag - use line 1 instead" for the
scripts that have SPDX license in the second line.

However, this warning is not issued when checkpatch is run on a file using
`-f` option. The case for files has been handled gracefully by changing
`$checklicenseline` to `2` but a corresponding check when running checkpatch
on a commit hash is missing.

I noticed this false positive while running checkpatch on the set of
commits from v5.7 to v5.8-rc1 of the kernel on the commits which modified
a script file.

This check is missing in checkpatch since commit a8da38a9cf0e
("checkpatch: add test for SPDX-License-Identifier on wrong line #")
when the corresponding rule was first commited.

Fix this by setting `$checklicenseline` to `2` when the diff content that
is being checked originates from a script, thus, informing checkpatch that
the SPDX license should be on the second line.

Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
---
 scripts/checkpatch.pl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4c820607540b..bbffd0c4449d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3218,6 +3218,9 @@ sub process {
 		next if ($realfile !~ /\.(h|c|s|S|sh|dtsi|dts)$/);
=20
 # check for using SPDX-License-Identifier on the wrong line number
+		if ($realfile =3D~ /^scripts/) {
+                    $checklicenseline =3D 2;
+	        }
 		if ($realline !=3D $checklicenseline &&
 		    $rawline =3D~ /\bSPDX-License-Identifier:/ &&
 		    substr($line, @-, @+ - @-) eq "$;" x (@+ - @-)) {
--=20
2.25.1


--44qq7k4ubusxyrgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8MMA8ACgkQxIwpEWwx
hGSRJRAAsMYeE4Swt/WwzR5VJdgGPnJVVC6u/27PuoX/usH5APs9oLkP0gY8D7gr
7zYT4VY2wvRbr/uCDVJV5oLRK0+FBgOl6GqBtjajyRAmnVIJ2CcaPe1QhRkb6nOq
jXYX/LcQidtWzdw8EAb1UpiiUf8PrI4zUrJ9ZnWhZ9kFHz+K2duRXta3qw4ZTzJH
6oZiAGggSob3UXuyncjvKlX+OuwOSTW5RTf08keq5PtUrRespPW9rj9VThcbzeLX
/QA71syi1hr9joZOtPQ5HOKK7CAHrptKQLJfZmnNWnSa9bBPo1G12F/UsRZeevBu
xGdmTZE3QhP1QRl4IbSlOvY2nBF6pkGBryLB5GG8dYpu0SXha6LRa/GZEz9OxzYo
QkfjxVXvh4LM5gsHA9qU+monUuvkMzuWG/b8naW2nVBgQsI8WubKH8C7QH8eiRuA
bfRgS4XTUrs0Y58BykZ92gOlhtO3ld77Tm/dy3vFKvbDJpO1Bb5VIzzxi8lGGFzu
N6M0iWhDeAThGd9eWJNeTWQl4t1XcJzo67Tgru5utctQWu2uQrQgVJQvgytWjJlK
LAEDMbHjW6HkrnpYM2kkNX1MOJfPc3tdr+o4pkoNtoulN5fTNqGdh6M1Orv4r3vB
Aes9BE9LBFQcU8B3YN9bsNNuTRO7XxCwZoyDytx3Q6Hms/DoxOs=
=+V3B
-----END PGP SIGNATURE-----

--44qq7k4ubusxyrgk--

--===============0799920421734888310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0799920421734888310==--
