Return-Path: <SRS0=eSSj=BT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B626C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Aug 2020 07:22:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4FC1206C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Aug 2020 07:22:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqc31U3C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4FC1206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8299186EA2;
	Sun,  9 Aug 2020 07:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YOb32EuqGCjV; Sun,  9 Aug 2020 07:22:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BCED186B82;
	Sun,  9 Aug 2020 07:22:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A21B6C0733;
	Sun,  9 Aug 2020 07:22:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A01FC0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 07:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E5C5E885DC
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 07:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCrnsmhHCV3O
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 07:22:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A5002885C4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 07:22:46 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id m71so3083970pfd.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Aug 2020 00:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CHPlNdI/E01BcfToatci2RN9FjoJ/HLTa14vGCTBEr0=;
 b=qqc31U3CIRc5bLCje2dlfhTN0nb3C7+ZJqPMvclvkg/g8AVqIx538ErHih5o+n1Br/
 JAHreuWN3w//2y0HGz290z4xfODyCciUhfJcT5rCzdjADfUVqhFERBtyJq/5phDJ5kRE
 D0u2uJ/cY4pjvHBzVMoJXL8Df/yO76VapHeoWoTS0yv33C5K92/FDPyebzBvaApWs2mR
 60SP1QliV30cuOzxzGcEcRu8/God/i07L6dMowxDPDfQJJOhwIGNdVGaGClrMWtFmM9Q
 in7kLhaFJLuz5RINv1zYy1tb2wttF+nBTykiYLH9QCDxpgQTkQOW85luH047Hk924L3U
 KKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CHPlNdI/E01BcfToatci2RN9FjoJ/HLTa14vGCTBEr0=;
 b=ud5Nw8SNKXdXBhdptWgyzVpA25f8rAOCmXwnGbZoR0+u2+B0OvMvS2Ujzf60S4cuLg
 Kv3nq/7LgROdKbm2VIzC+8pq8QlpBNyfL/fkxKgz8mn32TQZbf586Eh9Xj1FEmJzA000
 nsQXXijACeOJAy1TuBdZ7k7z0qP/MvnJ82n5FRohYKpBuUuquIU3Mis3fYiMuPU2CO+t
 hYE9zMF6gkH5f/PtNf3XjZl/oWk5NzMuDB6WLfGF69TBzTLAvM4zUAsJvTVHuezA2cWz
 SxsHhXFHZAhvMclbKydPXT4PN7bN5LXytvFs6MoHdds+kcWGURXAdwkZn1hP9rdE6yOJ
 6a3A==
X-Gm-Message-State: AOAM530FdbfmwXpzzTaKyN3nMy5lDjFsHEjTT+rA0kho+4t1iwK8dYvj
 oAoLy+2If/M20pqZ13Gtv3E=
X-Google-Smtp-Source: ABdhPJziGukkTsz7rpUwRSKyXLjfatdsY05hsd5LtMrLEKFKj5bTStAMKsZe8pax3uM/mKscDVEIHQ==
X-Received: by 2002:a63:1104:: with SMTP id g4mr17403418pgl.369.1596957766070; 
 Sun, 09 Aug 2020 00:22:46 -0700 (PDT)
Received: from localhost ([1.23.142.111])
 by smtp.gmail.com with ESMTPSA id c4sm16404544pfo.163.2020.08.09.00.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 00:22:45 -0700 (PDT)
Date: Sun, 9 Aug 2020 12:52:40 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
 <alpine.DEB.2.21.2008031251410.8346@felia>
 <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
 <alpine.DEB.2.21.2008042131530.4346@felia>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008042131530.4346@felia>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Improve SPDX license
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
Content-Type: multipart/mixed; boundary="===============4604598352172059561=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============4604598352172059561==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g2md25zisyc4hj5l"
Content-Disposition: inline


--g2md25zisyc4hj5l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/08/04 09:37PM, Lukas Bulwahn wrote:
>=20
>=20
> On Tue, 4 Aug 2020, Mrinal Pandey wrote:
>=20
> > On 20/08/03 12:59PM, Lukas Bulwahn wrote:
> > >=20
> > >=20
> > > On Mon, 3 Aug 2020, Mrinal Pandey wrote:
> > >=20
> > > > The diff content includes the SPDX licensing information but exclud=
es the
> > > > shebang when a change is made to a script file in commit 37f8173dd8=
49
> > > > ("locking/atomics: Flip fallbacks and  instrumentation") and commit
> > > > 075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add matchall m=
irror
> > > > test"). In these cases checkpatch issues a false positive warning:
> > > > "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> > > >=20
> > > > Currently, if checkpatch finds a shebang in line 1, it expects the
> > > > license identifier in line 2. However, this doesn't work when a she=
bang
> > > > isn't found on the line 1.
> > >=20
> > > It does not work when the diff does not contain line 1, but only line=
 2,
> > > because then the shebang check for line 1 cannot work.
> > >=20
> > > >=20
> > > > I noticed this false positive, while running checkpatch on the set =
of
> > > > commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
> > > > This false positive exists in checkpatch since commit a8da38a9cf0e
> > > > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> > > > when the corresponding rule was first added.
> > > >=20
> > > > The alternatives considered to improve this check were looking the =
file
> > > > to be a script by either examining the file extension or file permi=
ssions.
> > > >
> > >=20
> > > Make this sentence shorter. Try.
> > > =20
> > > > The evaluation on former option resulted in 120 files which had a s=
hebang
> > > > in the first line but no file extension. This didn't look like a pr=
omising
> > > > result and hence I dropped the idea of using this approach.
> > > >=20
> > > > The evaluation on the latter approach shows that there are 53 files=
 in the
> > > > kernel which have an executable bit set but don't have a shebang in=
 the
> > > > first line.
> > > >=20
> > > > At the first sight on these 53 files, it seems that they either hav=
e a
> > > > wrong file permission set or could be reasonably extended with a sh=
ebang
> > > > and SPDX license information. Thus, further cleanup in the reposito=
ry
> > > > would make the latter approach to work even more precisely.
> > > >=20
> > > > Hence, I chose to check the file permissions to determine if the fi=
le is a
> > > > script and notify checkpatch to expect SPDX on second line for such=
 files.
> > > >
> > >=20
> > > There is no notification here. Think about better wording.
> > > =20
> > > > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > > > ---
> > > >  scripts/checkpatch.pl | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >=20
> > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > index 4c820607540b..bae1dd824518 100755
> > > > --- a/scripts/checkpatch.pl
> > > > +++ b/scripts/checkpatch.pl
> > > > @@ -3166,6 +3166,9 @@ sub process {
> > > >  		}
> > > > =20
> > > >  # check for using SPDX license tag at beginning of files
> > > > +		if ($line =3D~ /^index\ .*\.\..*\ .*[7531]\d{0,2}$/) {
> > > > +			$checklicenseline =3D 2;
> > > > +		}
> > >=20
> > > That check looks good now.
> > >=20
> > > >  		if ($realline =3D=3D $checklicenseline) {
> > > >  			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
> > > >  				$checklicenseline =3D 2;
> > >=20
> > > This is probably broken now. It should check for shebang in line 1 an=
d=20
> > > then set checklicenseline to line 2, right?
> >=20
> > Sir,
> >=20
> > Should we remove this check? Earlier when I checked for file extension
> > we had 120 cases where this check was also needed but now we have a
> > better heuristic which is going to work for all cases where license
> > should be on line 2 irrespective of the fact that we know the first line
> > or not.
> >
>=20
> Are you sure about that? Where is the evaluation that proves your point?
>=20
> E.g., are all files that contain a shebang really with an executable flag?
>=20
> Which commands did you run to check this?
> =20
> > If I am missing out on something and we should not be removing this che=
ck,
> > then I suggest placing the new heuristics below this block so that it d=
oesn't
> > interfere with the existing logic.
> >=20
> > Please let me know which path should I go about and then I shall resend
> > the patch with the modified commit message.
> >=20
>=20
> Think about the strengths and weaknesses of the potential solutions, then=
=20
> show with some commands (as I did for example, for finding the first=20
> lines previously) that you can show that it practically makes a=20
> difference and you can numbers on those differences.
>=20
> When you did that, send a new patch.
>=20
> Lukas
>=20
Sir,

I ran the evaluation as:

mrinalpandey@mrinalpandey:~/linux/linux$ cat get_permissions.sh
#!/bin/bash

for file in $(git ls-files)
do
        permissions=3D"$(stat -c "%a %n" $file)"
        echo "$permissions"
done

mrinalpandey@mrinalpandey:~/linux/linux$ sh get_permissions.sh | grep ^[753=
1] > temp

mrinalpandey@mrinalpandey:~/linux/linux$ cut -d ' ' -f 2 temp > executables

mrinalpandey@mrinalpandey:~/linux/linux$ cat first_line.sh
#!/bin/bash
file=3D"executables"
while IFS=3D read -r line
do
        firstline=3D`head -n 1 $line`
        printf '%s:%s\n' "$firstline" "$line"
done <"$file"

mrinalpandey@mrinalpandey:~/linux/linux$ cat executables | wc -l
611

mrinalpandey@mrinalpandey:~/linux/linux$ sh first_line.sh | grep ^#! | wc -l
head: error reading 'scripts/dtc/include-prefixes/arc': Is a directory
head: error reading 'scripts/dtc/include-prefixes/arm': Is a directory
head: error reading 'scripts/dtc/include-prefixes/arm64': Is a directory
head: error reading 'scripts/dtc/include-prefixes/c6x': Is a directory
head: error reading 'scripts/dtc/include-prefixes/dt-bindings': Is a direct=
ory
head: error reading 'scripts/dtc/include-prefixes/h8300': Is a directory
head: error reading 'scripts/dtc/include-prefixes/microblaze': Is a directo=
ry
head: error reading 'scripts/dtc/include-prefixes/mips': Is a directory
head: error reading 'scripts/dtc/include-prefixes/nios2': Is a directory
head: error reading 'scripts/dtc/include-prefixes/openrisc': Is a directory
head: error reading 'scripts/dtc/include-prefixes/powerpc': Is a directory
head: error reading 'scripts/dtc/include-prefixes/sh': Is a directory
head: error reading 'scripts/dtc/include-prefixes/xtensa': Is a directory
540

We can see that there are 71 files where the executable bit is set but
the first line is not a shebang. These include 13 directories which
throw the error above. Remaining 58 files(earlier the number was 53)
could be cleaned so that this heuristic works better as we saw. So, by
checking only for the executable bit we can say that license should be
on second line, we probably don't need to check for the shebang on line
1.
Please let me know if the evaluation makes sense.

Thank you.

> > Thank you. > >=20
> > > > --=20
> > > > 2.25.1
> > > >=20
> > > >=20
> >=20

--g2md25zisyc4hj5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8vpDoACgkQxIwpEWwx
hGSHthAA0Ei9VS5S9RGLUz3gP+VmqZikGNMes5QsR7iT6zwKMdqrWXn4Gh6OgBHO
BbFPAiJVXt0MTPvFc96KoGDSUfk56Aa5NwH2jUSAKu2trH9fiOvdXhWWqe3pqvar
wMNH4OdTlxD3G280VPB2Lr8PK6jAIFLqVAEpI1n8i35UTgNMi7yOLzB+OIjn7E5c
8hL3kjr59KRjRAPCmml6Ow4v3dx1zYVoJcLfzr0S6GbL94ryp++435XkbvB03bSe
dmtJO8uJA9pkNFyTAqieS/jbN4hyL8b2vKESSK9RZI2iX5ZAhuT2LBd60ivvYc43
G+RVLklYwRQtImAyXUCEE5QAHLk3NNhGv1UPRuNptkan5K9KZOWG5U8ZSFFMKmdJ
Yw3WppYl6x3r+DU6CJJC/jcu8ceOqwlfEzayBVdZhMCKnmPYWjrvcv+Fh52dVbb1
QUdRHDRHxbl8zEaVmTUBSBWmP8v/E9ErlLVKSk7aBSCqYWj/zxHIzvzE4fc9bCzS
sKTLlWKrGqJWZzbhI5VmHLTS01cjlvMHUUddZ9wJ/2rM+jEbUrqbN6mvu2suRm0N
r/ZtHgSiHzH5Hxhy0RcjTHEKtLjYKD+VGVJiGB0SWLLE3fUEi2PUupyu52cFwOA1
69YI4fUgsk9jqHbtMWXUV7GJrUzHYmOU+azOa8UulAvIFpPolZ8=
=Qq7Q
-----END PGP SIGNATURE-----

--g2md25zisyc4hj5l--

--===============4604598352172059561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4604598352172059561==--
