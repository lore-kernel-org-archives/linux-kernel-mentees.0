Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA8DC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 04:32:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD5CB20724
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 04:32:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzhOeaNJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD5CB20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9C74688B96;
	Mon, 13 Jul 2020 04:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBXf7el-K-e4; Mon, 13 Jul 2020 04:32:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76F3C88A6D;
	Mon, 13 Jul 2020 04:32:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B1A1C0894;
	Mon, 13 Jul 2020 04:32:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54509C0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 04:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 43A2B86A7F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 04:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2FVqgbWCzkK
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 04:32:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A459086A70
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 04:32:40 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id p3so5505856pgh.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 21:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=G0JQrKT2yetJx9RdaIRiBdtxJ5m9P3e1e1yI2fZaU1U=;
 b=BzhOeaNJw5mc5XUov/Aby2l6NocWwThlY3twORbn1TwIDEoS3dKplFq8UgCrSYkMGv
 qEtwSKA1ryLnIiIRujXDfjEWDVKfs8NA7RaZWuMJbRdg1QNecr0Og0cGbpvHL5dNDidB
 G9ntvhTYoBk5vfpkqDvnryNvn50HxvcDQRy23XjFK0+XArxpAbxzNq7Ef5iHMvb0JCyj
 cq+3aeq4oisXukStf8Ki6YcAuW2inCs7jsYRr56Vwc00TVGLfymccFg7D0WLsPzONQtM
 rWazDh0hCkNM+cALPcHJlKJwdj2Y1yblBcZiwCdG56LRNHyL/6wFWRlQWWQniqycLL++
 kADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=G0JQrKT2yetJx9RdaIRiBdtxJ5m9P3e1e1yI2fZaU1U=;
 b=mAS5rPs6H6iuIY8mUmXu99+CgfeuS79gTrUZaihWKf3COmRL9k3nSc3VPyn0rP3J+t
 kszHX+2YY3fNyu0FQteh22+SIuYrPG8wlm+midWoIwiCcWh7GYmM9D1bEER2jSmrqRbP
 gZpJ8iRgGZtLRGPQGbTs0fYM9/ym9KCk1HEaBkEgy+pDmTNAjZ5+11DsOYQFYwESQkLq
 7yrNFoSnRFoh7w3seaCz0Q6dh7iEVGnraJV3f/kb0kP6F4Yk+HeQhqZvYI8A0wezLwAC
 83Sjknql8MRV3U090rynn9jgP1pKtJLhJJDUd2kZlFWc8Ku5T6BtXUxdXyuhsdu17GYn
 m/FA==
X-Gm-Message-State: AOAM533+rOc9H6IzPKNh/RGe5G0Yee9Ufyecehe8bOdem4rTx2/X7Sql
 X3qmRwJLTTKCei7QRBhB76A=
X-Google-Smtp-Source: ABdhPJwXO6SeKMCmOZOl/KjVLx4853d3XOrA4E29kKM+JtagHQgBdc2yZIz66f924rIWD+2BovOAGA==
X-Received: by 2002:a62:7a56:: with SMTP id v83mr72044979pfc.114.1594614760091; 
 Sun, 12 Jul 2020 21:32:40 -0700 (PDT)
Received: from localhost ([2401:4900:1692:3ec9:34c4:54d3:ee0a:4af3])
 by smtp.gmail.com with ESMTPSA id c1sm11473199pgi.52.2020.07.12.21.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 21:32:39 -0700 (PDT)
Date: Mon, 13 Jul 2020 10:02:30 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: apw@canonical.com, joe@perches.com, linux-kernel@vger.kernel.org
Message-ID: <20200713043230.d7rhv6znvswt2h4u@mrinalpandey>
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: Fix the usage of capture
	group ( ... )
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
Content-Type: multipart/mixed; boundary="===============5356437968978899696=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============5356437968978899696==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="awgtzp4uvp3ywwiq"
Content-Disposition: inline


--awgtzp4uvp3ywwiq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The usage of "capture group (...)" in the immediate condition after `&&`
results in `$1` being uninitialized. This issues a warning "Use of
uninitialized value $1 in regexp compilation at ./scripts/checkpatch.pl
line 2638".

I noticed this bug while running checkpatch on the set of commits from
v5.7 to v5.8-rc1 of the kernel on the commits with a diff content in
their commit message.

This bug was introduced in the script by commit e518e9a59ec3
("checkpatch: emit an error when there's a diff in a changelog"). It has
been in the script since then.

The author intended to store the match made by capture group in variable
`$1`. This should have contained the name of the file as `[\w/]+` matched.
However, this couldn't be accomplished due to usage of capture group and
`$1` in the same regular expression.

Fix this by placing the capture group in the condition before `&&`.
Thus, `$1` can be initialized to the text that capture group matches
thereby setting it to the desired and required value.

Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4c820607540b..e73e998d582a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2636,8 +2636,8 @@ sub process {
=20
 # Check if the commit log has what seems like a diff which can confuse pat=
ch
 		if ($in_commit_log && !$commit_log_has_diff &&
-		    (($line =3D~ m@^\s+diff\b.*a/[\w/]+@ &&
-		      $line =3D~ m@^\s+diff\b.*a/([\w/]+)\s+b/$1\b@) ||
+		    (($line =3D~ m@^\s+diff\b.*a/([\w/]+)@ &&
+		      $line =3D~ m@^\s+diff\b.*a/[\w/]+\s+b/$1\b@) ||
 		     $line =3D~ m@^\s*(?:\-\-\-\s+a/|\+\+\+\s+b/)@ ||
 		     $line =3D~ m/^\s*\@\@ \-\d+,\d+ \+\d+,\d+ \@\@/)) {
 			ERROR("DIFF_IN_COMMIT_MSG",
--=20
2.25.1


--awgtzp4uvp3ywwiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8L49kACgkQxIwpEWwx
hGRqHhAAkLywFExf90xnmdGZGVYQ1QQ8aYFuW6gV+Jvehv2GMfZUO35DCLkLfIsP
Rsx8I58ZbZHv19LfdOYxhb2gvgeTX4/8+eSCtRwyE7Zd6BUMdoJt6/BE/QljA2xF
CKXlVGX7OpIESqsQbQAq+vMqbcqYDZjCeWh3x8U1cV9pZ09mZ7CL/SqRr4Qfmcbi
uz8MOA4xNF/hISLgDwbyFiw6GIJJJ+mfrBqdhLHZ+E/W3Jx+1Kj/DwiqoXlMKJz8
NtOYb2CZ/zvQ89LK5H/Ed1e6az6yG+7a29f78Zes5Z51Pz9ApKjNwonNCyqE3UvH
04HJ3fAZHicKol5uQAb0RFwmyVUsk+iFCSw065GK738KoQlWNwnQJ3FosuOrvLDQ
22iIGLCH/sE+gWD7bgjCHJuVvWVHEDBqObFbmymqk/Hm8q/c4d2UGbxBSg0kJll7
tK6H+QTQCShukdccK8xRj4f5qwJgq6JBfrpEvKuH197ZHp/lrsIf4l4cdnPOhGsI
bEqg0xOv9jZbBrD3V/YpJhBuKDQxvUc8ihprTHHmWdJDuXtHutpO57r1pu4/UtpT
2XMPEE+AoV699FJwvHpSKcMu0M8dC+96D+t52knPefO5ea7Vsrmhw1G14fkY3R8i
DmlwKh/o/W+P04+3eW5uHblwudILshETG2POmU8Hdtzu2+reDOI=
=757s
-----END PGP SIGNATURE-----

--awgtzp4uvp3ywwiq--

--===============5356437968978899696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5356437968978899696==--
