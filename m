Return-Path: <SRS0=1dzN=BN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2E9C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 07:58:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3D3F2072A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 07:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfOpuZeX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3D3F2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38DBF87A77;
	Mon,  3 Aug 2020 07:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wQsWxoMoUTG0; Mon,  3 Aug 2020 07:58:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5C65787A72;
	Mon,  3 Aug 2020 07:58:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42B53C0051;
	Mon,  3 Aug 2020 07:58:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 355F5C004C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 07:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1CCB2866F0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 07:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NX0AqnP9w6R4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 07:58:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 85B928636A
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 07:58:46 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g19so7729805plq.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 03 Aug 2020 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=nynX1s9esBjgIYPfwyqsyWxC2pTLspQ7JY+YkddRBvM=;
 b=GfOpuZeXdnCvlOm5DyWiPBTsjKPWv30oODR9wAMw5wW4LjGePrp5zMbqKHr+L4Vdgw
 Gl4R8rJOki3ZGwZWTVVo+6MLcrpU7p4XDj7EZJ9+okqSDgD4CtMubiRWOsrMJIqWkuIT
 azLqpr7LVZmEcu8DZnHRrHrdqXl/oY9A2n+ypoTSIukQl605DKV/5RgSJXoXPOSGdBP0
 cdb+dHIwhuZKWLOEUQYnA9NkYogJFRv4gP73jfQcLOeBuAXqf040ERKiG5xa+1Hpm3YD
 qeKbFyNUnI+GCBsNOgUmkmaGfzcR44eKwPSWYZVIoJhkX7ApF7l8HHie8dkVR6eSwXt2
 aq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=nynX1s9esBjgIYPfwyqsyWxC2pTLspQ7JY+YkddRBvM=;
 b=kljVeFyNXTcUvi/nAK555Wmd9VSrpk3G7KMNnwZuoI6UqRtL5oxCX5DwU3597BHPt/
 8O7d972UrHt+mz23XKvfKibwXMr8tNtuYfFQpjgg2pe5j7BOw7Twt+MUPf/Hm7iFdJ3n
 3rzP6x3IS30BiJhPzNLfRcE7Wto3bqUYhqou1sFyn3N0STxkoM6yXs6UpiajhLm6+F2t
 XdSeBhIWkRjLs5JN3Gy9iN7EHAwB6chgpfXOvQVye0ywH9SZl4rsSJza1FQvsXDipdLx
 oJtIvhw8WQa7+ZB3PtyiTUC3wjONtklaKCYPOZjeCqNJz6x8rZaB3SiiHi2LPxzlpTr2
 yWLA==
X-Gm-Message-State: AOAM5303YN+hWH4/XNSBcMWOy7iMAdvxznz/rwvF7ZWlmxVVA3PaUwZ+
 2/yhFfUUgvD12u3EI4AlLxg=
X-Google-Smtp-Source: ABdhPJzPaxkeAKKfFancDQntRDYHA10/ulDp+1Kv3OYj5hIJHfGh/xPvWEPflPWaOQSWgNZQCJ9kjQ==
X-Received: by 2002:a17:90a:4fa3:: with SMTP id
 q32mr8551490pjh.142.1596441526006; 
 Mon, 03 Aug 2020 00:58:46 -0700 (PDT)
Received: from localhost ([1.22.41.153])
 by smtp.gmail.com with ESMTPSA id u66sm18985881pfb.191.2020.08.03.00.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 00:58:45 -0700 (PDT)
Date: Mon, 3 Aug 2020 13:28:41 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org, mrinalmni@gmail.com
Message-ID: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
MIME-Version: 1.0
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: Improve SPDX license
 identifier check for script files
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
Content-Type: multipart/mixed; boundary="===============8433840787865344730=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============8433840787865344730==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="juqvci6zrjjdwtpc"
Content-Disposition: inline


--juqvci6zrjjdwtpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The diff content includes the SPDX licensing information but excludes the
shebang when a change is made to a script file in commit 37f8173dd849
("locking/atomics: Flip fallbacks and  instrumentation") and commit
075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add matchall mirror
test"). In these cases checkpatch issues a false positive warning:
"Misplaced SPDX-License-Identifier tag - use line 1 instead".

Currently, if checkpatch finds a shebang in line 1, it expects the
license identifier in line 2. However, this doesn't work when a shebang
isn't found on the line 1.

I noticed this false positive, while running checkpatch on the set of
commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
This false positive exists in checkpatch since commit a8da38a9cf0e
("checkpatch: add test for SPDX-License-Identifier on wrong line #")
when the corresponding rule was first added.

The alternatives considered to improve this check were looking the file
to be a script by either examining the file extension or file permissions.

The evaluation on former option resulted in 120 files which had a shebang
in the first line but no file extension. This didn't look like a promising
result and hence I dropped the idea of using this approach.

The evaluation on the latter approach shows that there are 53 files in the
kernel which have an executable bit set but don't have a shebang in the
first line.

At the first sight on these 53 files, it seems that they either have a
wrong file permission set or could be reasonably extended with a shebang
and SPDX license information. Thus, further cleanup in the repository
would make the latter approach to work even more precisely.

Hence, I chose to check the file permissions to determine if the file is a
script and notify checkpatch to expect SPDX on second line for such files.

Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
---
 scripts/checkpatch.pl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4c820607540b..bae1dd824518 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3166,6 +3166,9 @@ sub process {
 		}
=20
 # check for using SPDX license tag at beginning of files
+		if ($line =3D~ /^index\ .*\.\..*\ .*[7531]\d{0,2}$/) {
+			$checklicenseline =3D 2;
+		}
 		if ($realline =3D=3D $checklicenseline) {
 			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
 				$checklicenseline =3D 2;
--=20
2.25.1


--juqvci6zrjjdwtpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8nw6kACgkQxIwpEWwx
hGQrzRAAhitgOnwZTdgV+S38M3fD6/zX+TjdVqM6AT0aRPJqnBasaaCXjCmVXIuo
FaTa+Sr1pNN3v8TmFcWqX7+PRmxggocZM50k7jtohS1f6b58M8k2wLNQnMqUTZ2F
AZKZDxyGOj705J9dzKOny/7kGxjOP0AI5D3qnMlYgSrgNMuHtRJtP6T1KdweTECR
MP4neliAVDYHy9flZxo17G/Tp0F5TOkSarxuPhfe5KDZ9PI+E474eaxD/ykbmUQs
SmJVguchCBS3ncHAt3qyyUmpsHwh2by3odCk2alC0EOXHekYylk2c4qCNzvzjxuY
8158LIvAK48H8M8rV8Jkbw6t/6EftLt0kKEZq1PXc2V2zUyJHK+/KhAKSeEw0as7
GWqgLyj0Hj3tF/CR6Pu0BxiAaijOhMrPr/sySEQIrlDx+GBELQTm2ks4l144p+gN
pMbEUa95Xtyw3jExr4M3vVMv5AzQeiGWmwPVkG9OrO1h/JhAzgfhGs65kIjr7fsz
0ZkNltE6s2kyBzGVTpRfhczmXq981Md5tWm5ZdChzVSM7WIc4rf985kUl6Or3SUm
/mxvDJerw7mUurVU2E7RBLh+hRZxDcUHCldGRvep5oaKDifeuXW7j4Rr8qFwDAIF
B3tkERBuRCGFS93i6gx77A2W7eaT2XhVTVgKSNLBD7hiduwDgnc=
=UqUE
-----END PGP SIGNATURE-----

--juqvci6zrjjdwtpc--

--===============8433840787865344730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8433840787865344730==--
