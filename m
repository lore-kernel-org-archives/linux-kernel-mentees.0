Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C23C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 06:05:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CE820786
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 06:05:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tb6Qz8Nf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11CE820786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D06D886C6A;
	Thu, 27 Aug 2020 06:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3osd-T8j2AAn; Thu, 27 Aug 2020 06:05:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6B83C86C67;
	Thu, 27 Aug 2020 06:05:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50EABC0890;
	Thu, 27 Aug 2020 06:05:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F618C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 771F0204C8
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mbUCu5RN-aGI
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:05:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id A0C80203E4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 06:05:30 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id m71so2667084pfd.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Aug 2020 23:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=XQbEXt3fZ/W7+BiIQkzUc9SkudfADulAy0GscFpS1UY=;
 b=tb6Qz8NfwhkIf02zLR+0QuIQpfujCimZtKsFhZD6Uqa5qvb6RJkeMW45R1gIocWDNF
 1/HoMeLzZEtXrLFlRMvKy1hBOtLNM4+Gdg3Vj/68eVbx7XbL9FM9PVOYzm1U4z8bANsG
 7klma/gJSoc8g/qzAgq6EGsFx347KiVs9p1y+YGvAIVJiZVHVEdqyQ0rbF8mwxYNJ5bc
 uXmSWwKkQRomqZPeAVOSzd/kwq9B9ozPCHRuqBFzEVT9JN1gNmcKuso/a0KcWGWJD7Gs
 qk15R9EfRxEZ1zCZhWn5G+kfisYJYn6KoSQX0WAUPmAKwr48fjUgP0GGA2aowu+lNUur
 8S5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=XQbEXt3fZ/W7+BiIQkzUc9SkudfADulAy0GscFpS1UY=;
 b=BqBepxz9vMxu6cdU+CLhOGtAEyV3MJHHWCFDS9cQh0ehrfnc0dZ/d6iLfTmnk5sxRd
 1XI0d5RyNphoTpaXWXTrbjcewift3H1Yj6L1g3EpAm7L0YZXhyrLpubRVmVsWiNxUVtz
 ZXaHafkCC/UBX6gu4eUMugjGjr2Rsb5c4bXAnF7u6vimsiC0ZdVpQHFkzK5hwaS4g6Ol
 IVy+Ud8VIpdiSQl1KFhu0eAJNm14lsIlCjnAFHIz7AnAmXr/j2n+xtk7LTOULlE/dgvS
 rfry0Q0oXIXv1eb75MENV5eWrIX/t1okH+cXjw769Zaar9qFN9syQDIfSkizmV6CdrKG
 psQA==
X-Gm-Message-State: AOAM532r0KgDj1iFDEXl0X5ndJXmaDB2VtYEiX/90uOVLYRFpQxnAoXn
 GO9bOQt+LQHeSf4qnQ7I6Qo=
X-Google-Smtp-Source: ABdhPJwfGAWj573Ym9bLjNbW1XJPAOkTfBscn/eL7Q3E3TopOqrf9rFBTpjmiS58agFiCMQf8240ZQ==
X-Received: by 2002:a17:902:c214:: with SMTP id
 20mr4002619pll.138.1598508330107; 
 Wed, 26 Aug 2020 23:05:30 -0700 (PDT)
Received: from localhost ([1.23.143.13])
 by smtp.gmail.com with ESMTPSA id f13sm1218101pfd.215.2020.08.26.23.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 23:05:29 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:35:23 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org, mrinalmni@gmail.com
Message-ID: <20200827060523.6fi34tcrg5xndzuu@mrinalpandey>
MIME-Version: 1.0
Subject: [Linux-kernel-mentees] [PATCH] scripts: Add intended executable
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
Content-Type: multipart/mixed; boundary="===============4733820740886237545=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============4733820740886237545==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yniducff3thbscrp"
Content-Disposition: inline


--yniducff3thbscrp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

commit b72231eb7084 ("scripts: add spdxcheck.py self test") added the file
spdxcheck-test.sh to repository without the executable flag and license
information.

commit eb8305aecb95 ("scripts: Coccinelle script for namespace
dependencies.") added the file nsdeps, commit 313dd1b62921 ("gcc-plugins:
Add the randstruct plugin") added the file gcc-plugins/gen-random-seed.sh
and commit 9b4ade226f74 ("xen: build infrastructure for generating
hypercall depending symbols") added the file xen-hypercalls.sh without the
executable bit.

Set to usual modes for these files and provide the SPDX license for
spdxcheck-test.sh. No functional changes.

Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
---
 scripts/gcc-plugins/gen-random-seed.sh | 0
 scripts/nsdeps                         | 0
 scripts/spdxcheck-test.sh              | 2 +-
 scripts/xen-hypercalls.sh              | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 mode change 100644 =3D> 100755 scripts/gcc-plugins/gen-random-seed.sh
 mode change 100644 =3D> 100755 scripts/nsdeps
 mode change 100644 =3D> 100755 scripts/spdxcheck-test.sh
 mode change 100644 =3D> 100755 scripts/xen-hypercalls.sh

diff --git a/scripts/gcc-plugins/gen-random-seed.sh b/scripts/gcc-plugins/g=
en-random-seed.sh
old mode 100644
new mode 100755
diff --git a/scripts/nsdeps b/scripts/nsdeps
old mode 100644
new mode 100755
diff --git a/scripts/spdxcheck-test.sh b/scripts/spdxcheck-test.sh
old mode 100644
new mode 100755
index cfea6a0d1cc0..758fa645ed99
--- a/scripts/spdxcheck-test.sh
+++ b/scripts/spdxcheck-test.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-
+# SPDX-License-Identifier: GPL-2.0
 for PYTHON in python2 python3; do
 	# run check on a text and a binary file
 	for FILE in Makefile Documentation/logo.gif; do
diff --git a/scripts/xen-hypercalls.sh b/scripts/xen-hypercalls.sh
old mode 100644
new mode 100755
--=20
2.25.1


--yniducff3thbscrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl9HTR0ACgkQxIwpEWwx
hGSdmw/9FiwO34jdPo9tty2XeTf5PfdrAmwrZMBLy2SwudMmNB8ZAq84hTDfiVsn
fW1dPlfKYNY5KjVh0mBsIBeeUUXoBBnZAdYwPAM/gbLImlBzqsNtEUKtGe08Hnu4
I+SFjkzqOy3oDSWvm+NDwrGMGt5WmV0c2k81G3u0P3L4cYnXSp9+HJOs5jpylgY1
ld3UtR2WfOMnn1Gmw27M2SVVKDKfyqRn3XJ44Dj4hgRclSWfeKQQi83Q6JbdmIOn
aGcPqw6HpOTTTF4Sa8QlEN6FjgnTCxAvVaxUM9aP4WHh8eGTnHmQUXYuSX1ElOb+
/+34o6Q2aodEW8L2O/tlm4fbgP4NXdZBEus5E7XpHKXN1by0c01YQQKGp7oZugH4
oRzzKKsVhk8370Mbz3uvOYVB90jqalSxbUNgpplG21rIMft8JHHh7/2AZPiatnzt
ZsP01QyIJemlGO3D43l4m8DC057H1/pX27kVx+QRC7i1zbkydBF41zhgY5LcSz3o
OlqnJzz4+A9RlNbeLrmWSQbKFO4CH24xtlfnWu3VbdgkGO2tqLBUAP5aZtMtRVMh
XvmlKAXciRu9CYemSmojMcPH3h8BEMRtqxRUk6h9zKlfISo9HkGAxdg59/ItxyxY
g5vczJdsLkiecXMLKd/3xUWBJAGTO4NJn+LGODcmOFeyR7Oep8M=
=71vf
-----END PGP SIGNATURE-----

--yniducff3thbscrp--

--===============4733820740886237545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4733820740886237545==--
