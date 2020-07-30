Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C378DC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 07:33:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9824C20809
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 07:33:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFk0pQ//"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9824C20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5FC58869A5;
	Thu, 30 Jul 2020 07:33:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5DdfDJVuMme; Thu, 30 Jul 2020 07:33:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A3C9D869A9;
	Thu, 30 Jul 2020 07:33:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 955ABC004F;
	Thu, 30 Jul 2020 07:33:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9E28C004D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 07:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B501222B25
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 07:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UUEhO8ywU-EG
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 07:33:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 96BF520555
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 07:33:56 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t6so16067659pgq.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 00:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=iZP4FKGYGi7tGZZFAn3beTwCBqIlp76nqKUMNK4bZnY=;
 b=sFk0pQ//GWp1rk4uTBA0sB1Bu1ZYTPCVeLqxuvl/2NiNnF8Mun7iYZCISj/Xmp6sCo
 lQF2+XZUGN2Z2l6d8aYMQblFtWtS+wc0hw5sKqhM4tefDAOBgOL03j70tUc1PRO/Y3rb
 EqUOEtgaO2QxLjmH5Hwh3pV8/MyiFkar+dtKvlJICrz0xEYjIaTzRaWUO/dYtX2kg0IK
 pspAKKD/SdV/K9FWBa2BJA60RppaT9zeUSITj/M5wP5hvQBq93uD8hzlsNLp7PYTWeFK
 4w2PSvupDnlNRCYnDH4yUuFndm3d7PhNmkeqMvSujvTl1COoAyjSX0lhwA9eZ80R3Qhq
 rRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=iZP4FKGYGi7tGZZFAn3beTwCBqIlp76nqKUMNK4bZnY=;
 b=O4lJKi4cEPbua/+DBlrsacXrFJS7cxL1ZSvhSrEC7/O+1u8ZOUfuMhaSAjNdkfAkkl
 vLegYwdJir/HP0GpJsDYsNwWcJWpxiPquM+NvUjoQ+FfMVo1nKj44XI7cswsj4h+d2LI
 06UmlYmJVIw2o1bclSqmak4mCtStIKhZplkkXz9EBH9v95eAEkUA+LeK+Nv92cY814oj
 V5m5SwMDvxYeMuR6WB5Epjcd0OTBbvznZ6QMEdfr6R+1Ir806EdkTMDtAvBW7amNFcfg
 DR2twenIxwLR+DGLpSjRG3isb3LFLxxo9VeSIxsRIy/ShpHIa3V0b0DSrcc3s3M/tTRb
 +JZg==
X-Gm-Message-State: AOAM531Uemg2ptq52I84Ofne4b+DFA/vz5M/HBKVWUU/H9gdHBpaKUFe
 +P4q+qn+bu9V/m+Gi+S0SUI=
X-Google-Smtp-Source: ABdhPJwMZin0RNc581Cet0AVPJYr/UUBrm+2yNU8DrvaN8L9MohxaCG9xiui0sperDYWMwXWdGW5jA==
X-Received: by 2002:a65:62c9:: with SMTP id m9mr4858189pgv.171.1596094436132; 
 Thu, 30 Jul 2020 00:33:56 -0700 (PDT)
Received: from localhost ([1.23.142.183])
 by smtp.gmail.com with ESMTPSA id z9sm5134489pgh.94.2020.07.30.00.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 00:33:55 -0700 (PDT)
Date: Thu, 30 Jul 2020 13:03:51 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200730073351.xw42cgj7v6g7nxbf@mrinalpandey>
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
Content-Type: multipart/mixed; boundary="===============3936390091005359661=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============3936390091005359661==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jk6pfe376xe7s2xp"
Content-Disposition: inline


--jk6pfe376xe7s2xp
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

Improve this by ensuring the patch to have originated from a script by
checking the extension. However, there are 120 files in the kernel source
that do not have an extension but have a shebang in line 1.

An alternate approach is to check for permissions of the file. There are
53 files in kernel source that have executable flag set but don't have a
shebang in the first line. These files could be patched suitably so that
they don't issue false warnings. Hence, choose this approach.

Reduce SPDX license false warnings on patches by checking the permissions
on the file.

Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4c820607540b..c55595113499 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2368,6 +2368,7 @@ sub process {
=20
 	# Trace the real file/line as we go.
 	my $realfile =3D '';
+	my $realfile_perms =3D '';
 	my $realline =3D 0;
 	my $realcnt =3D 0;
 	my $here =3D '';
@@ -2555,11 +2556,13 @@ sub process {
 		if ($line =3D~ /^diff --git.*?(\S+)$/) {
 			$realfile =3D $1;
 			$realfile =3D~ s@^([^/]*)/@@ if (!$file);
+			$realfile_perms =3D `stat -c "%a" $realfile`;
 			$in_commit_log =3D 0;
 			$found_file =3D 1;
 		} elsif ($line =3D~ /^\+\+\+\s+(\S+)/) {
 			$realfile =3D $1;
 			$realfile =3D~ s@^([^/]*)/@@ if (!$file);
+			$realfile_perms =3D `stat -c "%a" $realfile`;
 			$in_commit_log =3D 0;
=20
 			$p1_prefix =3D $1;
@@ -3166,6 +3169,9 @@ sub process {
 		}
=20
 # check for using SPDX license tag at beginning of files
+		if ($realfile_perms =3D~ /[7531]\d{0,2}/) {
+			$checklicenseline =3D 2;
+		}
 		if ($realline =3D=3D $checklicenseline) {
 			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
 				$checklicenseline =3D 2;
--=20
2.25.1


--jk6pfe376xe7s2xp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8id98ACgkQxIwpEWwx
hGQ8Lw//eGH1dBJnP+Q+rHYnsuU1MpZkDtzHm+hVM+xsYHl/ZKgy4EFgDH3XKuni
INOV3cXjgt0JQ2mhQbxMuB7Z7SMRrfcmJ2kVF5p3UGFKCqhTTXFknxAXI01nI8rA
haI6R5lE4mx0frDJIwmFUGPKXIopPgSVV9WHPU7z4+G1bp4ouc7P9fK5Z96K7U2l
xnbAWhX1fD0jqmhdqi96+QIwH7FfFmsYTN50Da08dsjD66H7AgPcUTmVzIQRcVLl
FnCzwfAnzms7ifMBN4Lh4tHqVuPiVGqVktYDh1T87+03sd47LxSf54Lts9FMo9Qh
VC9G1wtejPB20C14bYS+UNpHe6XHYuRv+Z40vAuC5lMnCnz4s26CwEExwD2mW3oe
MQ0hD58xFeZnzgSnSbMm2ljI0tQVT25X3tdzZAqLMNkkcE7XPA5CVJaBBTemDeCE
8wAbncGfpc9nseBVERd5izzEoQyj9d+SouomHxYPK6kaEHjh7ILcqZqBLh1mnVXt
6lXOAc1shOrZ7w4jGDdrUpsoaD7VEz0Tk42WdA+SGJWbZmsuF48rhBGRzA5n2/Ma
ITKbM90q9vydqfDN2+kWD2m5RaXMoM7sdpZ6+WK6m9bI0X0enT7n0J8CcQVyoihe
G2/E38MXOnqCe/ZfoTc5j1wu3GnDgdvYBm+TOMIPr72kg/RH43M=
=MRVA
-----END PGP SIGNATURE-----

--jk6pfe376xe7s2xp--

--===============3936390091005359661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3936390091005359661==--
