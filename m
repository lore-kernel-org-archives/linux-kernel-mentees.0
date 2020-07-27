Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF450C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 11:50:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7545F206E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 11:50:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHZM8+D9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7545F206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4CE0887C66;
	Mon, 27 Jul 2020 11:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f-ALBpR9EM1V; Mon, 27 Jul 2020 11:50:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C197887CD2;
	Mon, 27 Jul 2020 11:50:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9ED1AC0050;
	Mon, 27 Jul 2020 11:50:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E09A0C004D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D688C87CD2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-twznIjyu3P
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:50:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3AE7387C66
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:50:14 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id 72so7876666ple.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 04:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=oJunrlFAEEwhvbCLJRB3+Wm9QZpBB2WzV4o2hAD5fGI=;
 b=tHZM8+D9WgwvlitMZBEeRs7nwn8L2b00h29NdXXsPlux7cKK3HAbVA4ITsRkpacn7m
 VoPZ89KVBKNrezGBgQp2WfPW0uaXlEaYgijef7qdi2knKkO3/JzSXIZ3e2QBbWxVRmnm
 hmA52+5/w8s+L5KdyeFV7dayGFk0WqHytjUA1P7tIIuMrPH6OBVqPnuIJZPrelY7WDiw
 8DpKZejyLRavdIm2S7NbhhncL6P4layQ5juG7uPC/bJjSVl3oMnoZJOTJ0AUTUG9CjCs
 uOdxilZ9eVbrl0852tQe1EvbqQIsmLWjciDT+8Wd+W4iiWiMNAlHRVkJsaTtj8nCRuGp
 1U/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=oJunrlFAEEwhvbCLJRB3+Wm9QZpBB2WzV4o2hAD5fGI=;
 b=TTwrBZhMN7NfhdOOzr15jN/ED0H0nMysdQ8AZo3D7nFl/CgHL5pchtsGbFNQVkt8Oh
 fkFhGXiHzHzoI7s2f7h+/4lZaqCmxu8DqlXm1b+oGO40kMErUESIMnUqxa7rED9onml5
 962Ydo2FoHwBqZDsphwffZY0j3cF+IWpb+l7810rMrYwRjD/XoRRLbhQ7RPUcxeuGWt3
 PDem+NSc9Tl5BFKXmLXqFs/3GE0jWULIoHvxZinuIKBLEgYq/b/5NJkIDWai2Vskwno3
 4PrP/Gtl9yIjmjc4P55pLtO9n3BZHdrLGy4BeLTlxBI0Yw83ck3MaPgvy+EwMVMSkCUZ
 7ReA==
X-Gm-Message-State: AOAM533cU0CQOWaRSznMoyOgcTRnp943a22LRcPnmAkuXMiSKPJqjdpk
 SoXrYkaODr5ZHJJ4pDMM0Lc=
X-Google-Smtp-Source: ABdhPJyMdRPdg8RzZQOFDa0UhIEWAMPLcQO1uwMva4zlsX6vBOGahcBoTAmfiU0+fF9HvUGxLfqiJA==
X-Received: by 2002:a17:90b:378d:: with SMTP id
 mz13mr2788335pjb.98.1595850613737; 
 Mon, 27 Jul 2020 04:50:13 -0700 (PDT)
Received: from localhost ([1.22.79.77])
 by smtp.gmail.com with ESMTPSA id f1sm18152872pjo.1.2020.07.27.04.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 04:50:12 -0700 (PDT)
Date: Mon, 27 Jul 2020 17:20:06 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200727115006.7eccxuxcqu2qxx77@mrinalpandey>
MIME-Version: 1.0
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: Improve SPDX license
	check for script files
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
Content-Type: multipart/mixed; boundary="===============1746477659696103633=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============1746477659696103633==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pkt44ijw7idtfksx"
Content-Disposition: inline


--pkt44ijw7idtfksx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In all the script files, SPDX license identifier is expected on the second
line, the first line being the shebang.

The diff content includes the SPDX licensing information but excludes the
shebang when a change is made to a script file in commit 37f8173dd849
("locking/atomics: Flip fallbacks and  instrumentation") and commit
075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add matchall mirror
test"). In these cases checkpatch issues a false positive warning:
"Misplaced SPDX-License-Identifier tag - use line 1 instead".

I noticed this false positive, while running checkpatch on the set of
commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
This false positive exists in checkpatch since commit a8da38a9cf0e
("checkpatch: add test for SPDX-License-Identifier on wrong line #")
when the corresponding rule was first added.

Currently, if checkpatch finds a shebang in line 1, it expects the
license identifier in line 2. However, this doesn't work when a shebang
isn't found on the line 1.

Reduce the number of false warnings for such patches on scripts by
checking the permissions of the file.

Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
---
 scripts/checkpatch.pl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4c820607540b..695300839f48 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3166,6 +3166,10 @@ sub process {
 		}
=20
 # check for using SPDX license tag at beginning of files
+		my $filepermissions =3D `stat -c "%a" $realfile`;
+		if (int(substr($filepermissions, 0, 1)) % 2) {
+			$checklicenseline =3D 2;
+		}
 		if ($realline =3D=3D $checklicenseline) {
 			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
 				$checklicenseline =3D 2;
--=20
2.25.1


--pkt44ijw7idtfksx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8ev2gACgkQxIwpEWwx
hGQlJxAAkaFO+7LbsSAomw9gYRfaCqwwrr1p/Wuu/U1r0I8+4A69F0JFilNUoGMw
Hl4X9/BiGOSWwttBnSev8vav3ez7Wtk7ojmIf83riLBkP1lQqtCoNukkZnUTF2sJ
2HtObB8ksggO5iIpZ4OLhTrIfHUYoftSq9Qf+C69odyOCrdzZcJNl0vdudQWb+0k
dpueOD5I206ox9TZivzbkrAlL7I6yjaVHzoA4FsrHK4lQp3Wdk4WQTmYfVA3+NbH
rdOGS3KJFrHa/SCbQK3kvclYbN3Bi/1WqGqXiGNKtU4Z1bFN+KN1JBSsFYN8DTax
6ZB0BZTJykq3HOp29wC4bS8qsXtswY/vfAPeLlJ+DgrL5/ygZJY1dihbLNzop2MO
ycBlusxXxU/9EAOjhKENreGS5YjaOf5NfemtMltDuf1gektQA70ZrI7pslWsBlSI
IW1oL2ixBTH0+sgCyS2JCQ7vaSJt3bqNS0OvoQ+kVOSzc0jrRaP3/UTo9pidyyMO
t7PTt4WXP8mbK9S0Xbgo52YutM9d26lsFdhhsCSfPwGkF8GWQ0FdlrTSaJlcM6mV
cQ3XZerr2DBohHlRHTRxzYcfztdGGZAtycSX5JZspyK5KEGtw1UmO1Kc7XFXW13x
RYavL9EWfiGVa0PQJ+NGl2/lWFlXCqhX39DQWD3gR8DINda7Syg=
=X4W5
-----END PGP SIGNATURE-----

--pkt44ijw7idtfksx--

--===============1746477659696103633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1746477659696103633==--
