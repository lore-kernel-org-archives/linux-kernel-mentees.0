Return-Path: <SRS0=EU8F=BE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84102C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jul 2020 11:21:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D7620674
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jul 2020 11:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+QlWSBU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41D7620674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0973C888B9;
	Sat, 25 Jul 2020 11:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id As38-pc4gdvp; Sat, 25 Jul 2020 11:20:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A4DED88730;
	Sat, 25 Jul 2020 11:20:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87CC9C004E;
	Sat, 25 Jul 2020 11:20:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB249C004C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 11:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 950F586962
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 11:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPmFrSkqpZ00
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 11:20:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DF10B862FB
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 11:20:56 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id d4so6812460pgk.4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 04:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=qZ9zuT5XNTwD5x/hJj9cp89V9J9I9FVn40abpeVcxqQ=;
 b=J+QlWSBUs7vDC5zgLPrQjGlU7/KKqnBCfDXUaEJPweBHnfSTvz8IihN+zWIcwDLzm1
 J6QTSMc7GbxoPBieH/IiAKJsSSFkqmex8JLGhs6a5DdkfN6QB4XyuwCFLv4+HffMCIMa
 BT4yoO5/RLWZR6kzs76hSnUFAyu1l0M5s05sDBudzaCesyz60OMUpUj0kECe1TvwxISv
 sgAImrXRriScHySCMIvfpLRipfa7OyXgUeYn+67DLC1sFrvZbPSRRrAfMwwGzZChtB4A
 /mwB4ylB5SLzOKlojB+Wbci5axQCKwyzTeP0EjVO/f+kQZEoDDpkRVxvy00Sogw3eErj
 25tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=qZ9zuT5XNTwD5x/hJj9cp89V9J9I9FVn40abpeVcxqQ=;
 b=MA3S3hfN+Jw59LtLngU4kWfFUuAo+zcijOCK/I57ur5GaPn7iwkkcqREQyA3Ps6eXy
 5ZkC4tDShga5zb3XyASm00NP3GM5WYme0CB3H4N/eOLobwPxta93rk8x7aoSNQhSQK0N
 S1DuwlLa0K0gs7hmcFB9ECO9smEsKelltcgtPEg1BX1HCSs7PO2algqqpgJLOy9NBgNC
 jvXRVp1FHDG7eJrhX1pIPOznHwiSPCHD0QA0+ltY0QpzGV11D2pGmp45EQfN5wzoNVlA
 gh63lHHK26duO2gd3jQQBuUcxj0EbmZKEjgVsBHBddMelMp+4IL7lKQySUOYAQgArpqT
 IR3g==
X-Gm-Message-State: AOAM530yXFEKa3TL269pltLJ8lxsBA0tN+ZT4RyI22k7JfTKKXX1c00D
 3AfcclH5WrAd0u79S7c/wKU=
X-Google-Smtp-Source: ABdhPJymiX5CZBIdd2Y1O25zXMpHi9OblQbJEoxhuEl0CWzubnJo4BRQ3AWfj6f+KCjOw70MPFHuuw==
X-Received: by 2002:a63:1a16:: with SMTP id a22mr12290701pga.142.1595676056425; 
 Sat, 25 Jul 2020 04:20:56 -0700 (PDT)
Received: from localhost ([1.23.143.88])
 by smtp.gmail.com with ESMTPSA id s194sm8892490pgs.24.2020.07.25.04.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 04:20:55 -0700 (PDT)
Date: Sat, 25 Jul 2020 16:50:49 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200725111847.pnt2a36ndd5lbqre@mrinalpandey>
MIME-Version: 1.0
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: Fix SPDX license check
	for script files
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
Content-Type: multipart/mixed; boundary="===============0851476153466794836=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============0851476153466794836==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="myld7bmgt6cxn4d4"
Content-Disposition: inline


--myld7bmgt6cxn4d4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In all the script files(except yaml), SPDX license identifier is expected
on the second line, the first line being the shebang. Sometimes, the
diff content includes the SPDX licensing information but excludes the
shebang when a commit is made to a script file.

This can be seen in the commits like commit 37f8173dd849 ("locking/atomics:
Flip fallbacks and instrumentation") and commit 075c8aa79d54 ("selftests:
forwarding: tc_actions.sh: add matchall mirror test"). In these cases
checkpatch issues a false positive warning:
"Misplaced SPDX-License-Identifier tag - use line 1 instead".

I noticed this false positive, while running checkpatch on the set of
commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
This false positive exists in checkpatch since commit a8da38a9cf0e
("checkpatch: add test for SPDX-License-Identifier on wrong line #")
when the corresponding rule was first added.

The existing logic looks for a shebang in the patch/file being checked
and if a shebang is encountered it directs checkpatch to expect
license on the second line by setting `$checklicenseline` to `2`.

However, this approach doesn't work when we don't have a shebang in the
patch and `$checklicensline` continues to be `1` in this case leading to
the unnecessary warning.

Fix this by setting `$checklicenseline` to `2` by checking if the patch
comes from a script for the cases when the shebang doesn't appear in the
patch.

Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4c820607540b..80dfa83ed0fb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3167,7 +3167,7 @@ sub process {
=20
 # check for using SPDX license tag at beginning of files
 		if ($realline =3D=3D $checklicenseline) {
-			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
+			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\// || $realfile =3D~ /.*\.\(py\|sh\=
|pl\|awk\|tc\)/) {
 				$checklicenseline =3D 2;
 			} elsif ($rawline =3D~ /^\+/) {
 				my $comment =3D "";
--=20
2.25.1


--myld7bmgt6cxn4d4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8cFZEACgkQxIwpEWwx
hGSUHg/9G1AuitW1oJi+yrMc3TB+HSkXbICvJ+lRQgB+/sU5uXm0r7lRRNmoFiwC
8RzdItxLa/8veD4YZ71wdoenELfTWRW7oHcL0aq7JZeolWW9P78xuhkQ7UaZaBmR
1iSi7moyMI14nhfTqTQKOUHy2SnIJPNp45TgKTrk95WPeyJL2TBJkHKvu+OJp4sS
Aw8qoC7qBAsNNc+CUOOcP9gKf0OI9ptpWb1F6eSpWwc8+qBXy/lEWpMhhKHbh6EN
Hvl0DqsWNGV/n66EQbBopzS6NLy+9r/DffxRuH7T7E4/xLMSOx7Sly3UttVLKBar
tQiM3C+0hcgnR4UkLckH1ld/XcF7GyDw7IurifoEPRz8eY7rByDwdWKPubW715yK
/mO/sSUFXL6vM8jNmdhcgH7BbNgBLnLl5gFeQawXO5JGhdOvMb3rZzro+Oa7/uO2
dSCtz2NZYusc4A6i4eC51sDfJ0uxVUwTdmCpHmL8FQu8SYV7vCN34DOpmvnqd0O8
P71fN21sBPDFvJxFMxcHPcP4tNILwThu2jozmpAhufNAOY7WyzAzCvVL2dPZI2WZ
beRGtxtSNTLRvEwM4hb5vrZ5GMLfj3WFb6OdelrghXJ2zAb4kgaCRyP5SlDH/4Ya
6/I87HxLSOXkMIJauL0TQbEI/22AERnZHfmsVVrrDCjCVVm5jao=
=VHNb
-----END PGP SIGNATURE-----

--myld7bmgt6cxn4d4--

--===============0851476153466794836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0851476153466794836==--
