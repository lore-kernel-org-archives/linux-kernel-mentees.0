Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A3DC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 03:24:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E93C207F5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 03:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTy83YYo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E93C207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 48E0088F8C;
	Tue, 14 Jul 2020 03:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LwdvhZBNtCL8; Tue, 14 Jul 2020 03:24:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 55BB988761;
	Tue, 14 Jul 2020 03:24:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A0FBC0888;
	Tue, 14 Jul 2020 03:24:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3C96C0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 03:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C25CF8981C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 03:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZPDZhtNH7Qu
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 03:24:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 103CD897CA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 03:24:04 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id j20so6971862pfe.5
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 20:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=iESc58qsCWo0MOiWWMrd826m2kwPmJzkRlaRAPDMlJg=;
 b=CTy83YYoRTM97x83TSuJrtfiLCfmO5yYfWG44rNBiMyasplcnmu79l1AhuH0aAeRcF
 a8bfXhLGuCxT3MyGfm6AKmuscnciyKw/GwCvxsGCtXpFHd8CS6C/nHJFaPXzLBFMV53j
 3iA4z268pLr7fh3SRUowYJXbIrFaOuvDwD8RxqTDCFGWCsblcQogNOW+5tCBo92EfbAH
 i9gaxgUIcFobeEhuaKfvLn/slskxIIXZ646Oq+Bato0ACZZfXvLMYLbCfSCjxuerEtXj
 hwD6/8KYW6zQyYq6x2TXRVHG8vyFNdWpUGByWUxp/erS+uaeIZmvbClGpdexDSTCy3b/
 utPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=iESc58qsCWo0MOiWWMrd826m2kwPmJzkRlaRAPDMlJg=;
 b=Ihhh/T9TsRHP7cShNjA92cRw2B51lYkfW/e1YVhhxBODfeXk7HnIrYolZw+CNS+F93
 k9aFZwBXIfoaLe5WY3v3t24x8R01Ky3ljYXPvHgLaJ7hBzWEPjnLfpS73PtW8S7g/Gby
 mu2Iz/S/sA4hM/drMoSaCeg+a7FcvUJgukUkoC5qW0uAARDD+FtnOMqssY6wNmwo2v+I
 zT/8JH0auck+5XL0Nu0Mee4CjD33C0Jy6cbAijphl1QjGLcvJuPnUkitl/ZqzzVr5Xek
 XhqaEi7KIQUpbImAc4JIgWmGeLvq7/RCrGpiawBL+1Z1IlmY4UrAIc+0OuWeOItAdJHX
 ssnQ==
X-Gm-Message-State: AOAM531eOb8Xk9Di0qrvlQ+NBgn3x1Gv5hxYlFVEHh67g0xJh5C7Qmdg
 iNJKHISEKWnx+bJoAmy/Vls=
X-Google-Smtp-Source: ABdhPJy5ZWDHRZblS49BB/qSP1YOiDhEXi5QdEeykc/Pi+bPTuEAyzWyGorUXWnekmGk/CIeduaGTQ==
X-Received: by 2002:a62:cfc1:: with SMTP id b184mr2379255pfg.153.1594697043507; 
 Mon, 13 Jul 2020 20:24:03 -0700 (PDT)
Received: from localhost ([2401:4900:1692:3ec9:71c9:35ac:ef44:ed57])
 by smtp.gmail.com with ESMTPSA id k71sm876866pje.33.2020.07.13.20.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 20:24:02 -0700 (PDT)
Date: Tue, 14 Jul 2020 08:53:52 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: apw@canonical.com, joe@perches.com, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200714032352.f476hanaj2dlmiot@mrinalpandey>
MIME-Version: 1.0
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: Fix the usage of
	capture group ( ... )
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
Content-Type: multipart/mixed; boundary="===============1415206148514257546=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============1415206148514257546==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o3hgmmmbz74cezwk"
Content-Disposition: inline


--o3hgmmmbz74cezwk
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

Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
---
Changes since v1:
Add Reviewed-by and Tested-by tag

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


--o3hgmmmbz74cezwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8NJTYACgkQxIwpEWwx
hGTIig/+K/F3MQXvHGf/sxp0Q8Q8vh7vwX94sNKlsETxD7jjx9j8CbXafzRWwH6D
ZIVmH73PtuJ16K7Gs+RFEqOpwKvi86Xh8NN01aqKby+HFPnt6bVCA8T2wPzxyaz5
aDRJuCHe72ObRNoZUKenEFnNZIJoEIoriQz4vtdsauYrTYR2VUZC73Xp/0w2wF6v
EBzhXZrMe5uimgzOC3styUjqPqFpLdKMGszse3cdpRXnx7Fj4CfqYUnUwaNXsqmU
DINeDaiylCVC1SFKhCPRLfOHGxRx/sutxFk3RW1GvCw8xVJ5enG569yWgYqAEWrJ
MCdAChq14ZxV6VBzLOYwGBhZWu9rAVr0TEYMAQ27Nw+sHKN0GigmTdEpI++iwkXT
6r8s2vn2RZYc1hXIj+3VL2OMmxp1ag3M83g766VTou5mAJN4+54DyH5SE+PQTweq
1acIk9OBbAvUCNx0hOvHsyi64afT5q10G6EcOKcmzp38HwAHv9s1pFY2z1gyXi9q
dQgYPZxZT2//W4LrL3XEJoYU6CvybZXrHJ4UnOGfhC1jqbWxL2Ug08SHsVI00c3k
ynF+EHY1iYK2KhTXdnVRlFZ6JseLGu5ajMFPe/guF51h6nX1HKULNjAzWNk04op1
2kxdJ1g1KnvNtFu8Zimgn3aF4SGZar6hGSkdYkCw6BpbKQQA/zk=
=1xgs
-----END PGP SIGNATURE-----

--o3hgmmmbz74cezwk--

--===============1415206148514257546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1415206148514257546==--
