Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9592FC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 09:24:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD602177B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 09:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nps0Q3QE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DD602177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4873A84C19;
	Thu, 27 Aug 2020 09:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmfwL_xxTWun; Thu, 27 Aug 2020 09:24:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D357F8499E;
	Thu, 27 Aug 2020 09:24:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC314C016F;
	Thu, 27 Aug 2020 09:24:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8AA9C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A911A20505
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tAcpq1NpGGwr
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:24:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id C97D3204F2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:24:16 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id p37so2941709pgl.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 02:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=LKDlLMP9o2eEBH2C9x6MfpYAdPfjU1Lhdny/aQSn3mQ=;
 b=nps0Q3QE2BQWBse5vZkI+sdXMY2D/c8G5TGbzNAIOQra2MtG1iokjOZi7I6baSrlIV
 EgveQc89VgkQKqnNpSwL/Vq1HuuSoW4KD6yNV/RHFvYMeKf9fLBI9na6c/SLjM8P2NVT
 /ccSZKOHAc4TlTWqLSfnGLDWv0uRpigAm8a4Ri39nI4m9sPBQvR+lTxYixIIuxA7I77N
 BfNtKWHDiFGfE2IVyQHWKV2qt1wcuaIn9NwD+am9/UY7tqaTt4U6qDmXLPeJybvgcyfy
 xVJF91TZRLhfuP6JUuFF9UnD/8fVQYBlaicTFUIUWHoifJQ3tKodh7orhvTcVGaUetCx
 FZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=LKDlLMP9o2eEBH2C9x6MfpYAdPfjU1Lhdny/aQSn3mQ=;
 b=TUnkvD07AX6KySPgHRLKQDNVr8nYyo3IaYqYagCsOzIJ6+fqdx5F42Wav3APISD4qw
 6CF3cpw7AHb0Z4MhpOaCpHbvO4SbOjxL7qpI1uyWMUVELYS+UfNvTdYEhqMNVnEn2yjL
 8RDAsbmZ2np4iwMfNwR10mQ/AQzIWtA6QedpsSyIntgqjHb1LWAjEC41ZBUe7lTqc4QI
 RqiwPvLEGnkPqhPbcJ5YLJZYqY+BHdZRLtBiuRTXJ9wvBo/HL3XfqB1Wk8FCw6S1PUrc
 M1xAGZgFc9tPdPmQg9Hoo+VMvkUIlY+SrtEksArD9ylgTS5NILOmRmWYlcoLDbJPGuck
 1QJw==
X-Gm-Message-State: AOAM533abN2a3K0kVsk7xgp+vSc79y7aOTKg9QJefpDSaSOE5OcqkDIW
 rXNuvOqYcqWdoSbL4h+rnKE=
X-Google-Smtp-Source: ABdhPJyJnn+Y0xkU7A6fORQ70ufnhZfpwvrdE3TVhKTWjAN8yS0FY5rJRek4AruTHw2j7KaURP9ejw==
X-Received: by 2002:a62:7d4c:: with SMTP id y73mr12907266pfc.137.1598520256334; 
 Thu, 27 Aug 2020 02:24:16 -0700 (PDT)
Received: from localhost ([1.23.143.13])
 by smtp.gmail.com with ESMTPSA id t12sm1542334pjv.55.2020.08.27.02.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 02:24:15 -0700 (PDT)
Date: Thu, 27 Aug 2020 14:54:05 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: skhan@linuxfoundation.org, Linux-kernel-mentees@lists.linuxfoundation.org,
 lukas.bulwahn@gmail.com, keescook@chromium.org, re.emese@gmail.com,
 maennich@google.com, tglx@linutronix.de, gregkh@linuxfoundation.org,
 akpm@linux-foundation.org, kernel-hardening@lists.openwall.com,
 linux-kernel@vger.kernel.org, linux-spdx@vger.kernel.org,
 mrinalmni@gmail.com
Message-ID: <20200827092405.b6hymjxufn2nvgml@mrinalpandey>
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
Content-Type: multipart/mixed; boundary="===============8789772523923717887=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============8789772523923717887==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7psxwnjzxvwj4cgh"
Content-Disposition: inline


--7psxwnjzxvwj4cgh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

commit b72231eb7084 ("scripts: add spdxcheck.py self test") added the file
spdxcheck-test.sh to the repository without the executable flag and license
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
applies cleanly on next-20200827

Kees, Matthias, Thomas, please ack this patch.

Andrew, please pick this minor non-urgent cleanup patch once the
mainainers ack.

 scripts/gcc-plugins/gen-random-seed.sh | 0
 scripts/nsdeps                         | 0
 scripts/spdxcheck-test.sh              | 1 +
 scripts/xen-hypercalls.sh              | 0
 4 files changed, 1 insertion(+)
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
index cfea6a0d1cc0..e2902520a081
--- a/scripts/spdxcheck-test.sh
+++ b/scripts/spdxcheck-test.sh
@@ -1,4 +1,5 @@
 #!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
=20
 for PYTHON in python2 python3; do
 	# run check on a text and a binary file
diff --git a/scripts/xen-hypercalls.sh b/scripts/xen-hypercalls.sh
old mode 100644
new mode 100755
--=20
2.25.1


--7psxwnjzxvwj4cgh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl9He60ACgkQxIwpEWwx
hGQO/BAAirslyT/RyRsBnm80OnJYSZ0oaAjsSp0sC0LHZawGPPnCbrZRjS/6FQBe
kKJjI/Y7z7Hi38d2morG9nKhvcjGonI3vxSysJK4/LSD2FvS9FcKJkfHYsf5HPOj
BNqRNvN+CGvUtV6EEBvMoRafI5xAqXinpglR7yd094qv/SzNTL60QtMXVCNiKaph
5kemWnjMmlJQDJVxsK0qVSN5yfGhwt92DUHYBdabPgBMLPADdk0BKo/FHCV4vO5J
8Cz4fGZmO3p3trX5bPTXMMVbhRC2IPHHK+bscQZ3rPAHRSfccTdmN4tP32dQjXiZ
0Dq+QNuTSxtsTdAVXFUCy55CtFGVEl4GXkPZHaWX/jRqpqcvmY4Ih5TgX25MS8gB
+hlVbQ+YQraZRezEdYzt53Orkwlq+8j/I2UvKBs5sBRYMiCnz3DVj1BgKheCL8vI
id5nUpqSCRQau8UWRZgdTFzZiIrs9JZq1qzT1v8U3XVQGRb6XtQWoewYlnP431YA
1sIbVErQKgp+Hrtjdmj/I4shV2Poq1ppu1bpBorMBuZdcId8t6FSqipAi+UaNpm3
lMZ7w0z/TmzAEMCkXlrzh9THaCzbrhclf2cte0IvVvb8NYc+NajOPhVVgUObpFnL
yRODk3RXJK+fDf5fKPnSrHmbBlItBXnncrv32bV2lW+/jc3POSs=
=5uhu
-----END PGP SIGNATURE-----

--7psxwnjzxvwj4cgh--

--===============8789772523923717887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8789772523923717887==--
