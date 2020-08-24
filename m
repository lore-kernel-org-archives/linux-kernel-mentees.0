Return-Path: <SRS0=ht7Q=CC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4D5C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 08:35:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA5D0206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 08:35:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eISDHKE5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA5D0206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BDD3187D39;
	Mon, 24 Aug 2020 08:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0dB1bJ4BQZWG; Mon, 24 Aug 2020 08:35:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BCA0487D05;
	Mon, 24 Aug 2020 08:35:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFC96C016F;
	Mon, 24 Aug 2020 08:35:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52B27C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 48F4C85D54
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4j31yEOnVxFA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:35:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 347E185D37
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:35:36 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p15so328500pli.6
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 01:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zST6md4BY1yErsFfcS6ZT9I1vSnX47/oenlDs/KAptc=;
 b=eISDHKE5L8NfuS3HzoCgEHN3ZNQmjh1gjeSuSCKKnaGaVjZ5+ySNfwMuz0uHSWIQsE
 eD3d0e4HCuIut2Exx1hCVoX75OFBtRYhWN4LSPdWwWp1nyfjDh5mklwSawI3usv2s9HA
 LTsOq46cfZQgoa5olj9t88HqusIMufTrf5jlpHL8d+KkVmSOn9FyuJg3+47YiAJpiKvF
 6kcZJPon7RjT606B+sHmnoXRK1dMjlUTrEwKwMZHKd4Zy774ZF9ZvxibkaipGyYgK+WJ
 PVD/1mCM1ueXp8aN2Ij93uzilkHCVqtBgU8lTA6bU+WU0XtvePHh/68q8/3uRMSXY+Aw
 GIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zST6md4BY1yErsFfcS6ZT9I1vSnX47/oenlDs/KAptc=;
 b=CzhU+oiAK0She5OkKZ9YwRHf0ID8a8ikk/dqR4jm8DhIzz7NXmRItc2KaRTSRs6Hhd
 5K/XRcNgJIEPJbKlVHBWtKBSXyiKIbdi2bKlehShffQrrdUtNupDKwJ0reB2QFgRwqzy
 Vuj29lOdo6roazxZRLI5UimDYfPHwYHwSQaHytsRlzPwVvGpDNxwSW3W6Zt6ultwrnRj
 shy7rMEZJg/I/PCiNt2YtAcsrqsP+AHXUGdPjlRznEi65kNpmLi9QyjgNA4k46CYI7+G
 JtfwdUvCdZVNoVtO+X/Ybinn9wMzkhXAR34zTXNQSm/OZInMKpreKloqg2IqpXvX81RT
 Gpdw==
X-Gm-Message-State: AOAM5309vxIC4/DZSzaKWhplo6B3z/RR/LqKF1+WLXEIV/J7lhCUni+l
 DVjKUh481s7x8ltlb2PxV18=
X-Google-Smtp-Source: ABdhPJyzPW24eZDCaqg1YUybTHoCtwQ546CRkcCizHK67tQozu97wLBfSb65IZBKOBlDDqGpFwgUtA==
X-Received: by 2002:a17:902:b115:: with SMTP id
 q21mr3026835plr.191.1598258135614; 
 Mon, 24 Aug 2020 01:35:35 -0700 (PDT)
Received: from localhost ([1.23.143.230])
 by smtp.gmail.com with ESMTPSA id s1sm9747931pgh.47.2020.08.24.01.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 01:35:34 -0700 (PDT)
Date: Mon, 24 Aug 2020 14:05:29 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org, mrinalmni@gmail.com
Message-ID: <20200824083529.m7vqwgbr54lvmcwi@mrinalpandey>
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
 <alpine.DEB.2.21.2008031251410.8346@felia>
 <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
 <alpine.DEB.2.21.2008042131530.4346@felia>
 <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
 <20200820044241.4ivtq5co6cm4aze6@mrinalpandey>
 <alpine.DEB.2.21.2008221014310.12792@felia>
 <alpine.DEB.2.21.2008222117460.20211@felia>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008222117460.20211@felia>
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
Content-Type: multipart/mixed; boundary="===============2746806988070840357=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============2746806988070840357==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tbwly6yhjupw2vky"
Content-Disposition: inline


--tbwly6yhjupw2vky
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/08/22 09:25PM, Lukas Bulwahn wrote:
>=20
>=20
> On Sat, 22 Aug 2020, Lukas Bulwahn wrote:
>=20
> >=20
> >=20
> > On Thu, 20 Aug 2020, Mrinal Pandey wrote:
> >=20
> > > On 20/08/09 12:52PM, Mrinal Pandey wrote:
> > > > On 20/08/04 09:37PM, Lukas Bulwahn wrote:
> > > > >=20
> > > > >=20
> > > > > On Tue, 4 Aug 2020, Mrinal Pandey wrote:
> > > > >=20
> > > > > > On 20/08/03 12:59PM, Lukas Bulwahn wrote:
> > > > > > >=20
> > > > > > >=20
> > > > > > > On Mon, 3 Aug 2020, Mrinal Pandey wrote:
> > > > > > >=20
> > > > > > > > The diff content includes the SPDX licensing information bu=
t excludes the
> > > > > > > > shebang when a change is made to a script file in commit 37=
f8173dd849
> > > > > > > > ("locking/atomics: Flip fallbacks and  instrumentation") an=
d commit
> > > > > > > > 075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add ma=
tchall mirror
> > > > > > > > test"). In these cases checkpatch issues a false positive w=
arning:
> > > > > > > > "Misplaced SPDX-License-Identifier tag - use line 1 instead=
".
> > > > > > > >=20
> > > > > > > > Currently, if checkpatch finds a shebang in line 1, it expe=
cts the
> > > > > > > > license identifier in line 2. However, this doesn't work wh=
en a shebang
> > > > > > > > isn't found on the line 1.
> > > > > > >=20
> > > > > > > It does not work when the diff does not contain line 1, but o=
nly line 2,
> > > > > > > because then the shebang check for line 1 cannot work.
> > > > > > >=20
> > > > > > > >=20
> > > > > > > > I noticed this false positive, while running checkpatch on =
the set of
> > > > > > > > commits from v5.7 to v5.8-rc1 of the kernel, on the said co=
mmits.
> > > > > > > > This false positive exists in checkpatch since commit a8da3=
8a9cf0e
> > > > > > > > ("checkpatch: add test for SPDX-License-Identifier on wrong=
 line #")
> > > > > > > > when the corresponding rule was first added.
> > > > > > > >=20
> > > > > > > > The alternatives considered to improve this check were look=
ing the file
> > > > > > > > to be a script by either examining the file extension or fi=
le permissions.
> > > > > > > >
> > > > > > >=20
> > > > > > > Make this sentence shorter. Try.
> > > > > > > =20
> > > > > > > > The evaluation on former option resulted in 120 files which=
 had a shebang
> > > > > > > > in the first line but no file extension. This didn't look l=
ike a promising
> > > > > > > > result and hence I dropped the idea of using this approach.
> > > > > > > >=20
> > > > > > > > The evaluation on the latter approach shows that there are =
53 files in the
> > > > > > > > kernel which have an executable bit set but don't have a sh=
ebang in the
> > > > > > > > first line.
> > > > > > > >=20
> > > > > > > > At the first sight on these 53 files, it seems that they ei=
ther have a
> > > > > > > > wrong file permission set or could be reasonably extended w=
ith a shebang
> > > > > > > > and SPDX license information. Thus, further cleanup in the =
repository
> > > > > > > > would make the latter approach to work even more precisely.
> > > > > > > >=20
> > > > > > > > Hence, I chose to check the file permissions to determine i=
f the file is a
> > > > > > > > script and notify checkpatch to expect SPDX on second line =
for such files.
> > > > > > > >
> > > > > > >=20
> > > > > > > There is no notification here. Think about better wording.
> > > > > > > =20
> > > > > > > > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > > > > > > > ---
> > > > > > > >  scripts/checkpatch.pl | 3 +++
> > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > >=20
> > > > > > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > > > > > index 4c820607540b..bae1dd824518 100755
> > > > > > > > --- a/scripts/checkpatch.pl
> > > > > > > > +++ b/scripts/checkpatch.pl
> > > > > > > > @@ -3166,6 +3166,9 @@ sub process {
> > > > > > > >  		}
> > > > > > > > =20
> > > > > > > >  # check for using SPDX license tag at beginning of files
> > > > > > > > +		if ($line =3D~ /^index\ .*\.\..*\ .*[7531]\d{0,2}$/) {
> > > > > > > > +			$checklicenseline =3D 2;
> > > > > > > > +		}
> > > > > > >=20
> > > > > > > That check looks good now.
> > > > > > >=20
> > > > > > > >  		if ($realline =3D=3D $checklicenseline) {
> > > > > > > >  			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
> > > > > > > >  				$checklicenseline =3D 2;
> > > > > > >=20
> > > > > > > This is probably broken now. It should check for shebang in l=
ine 1 and=20
> > > > > > > then set checklicenseline to line 2, right?
> > > > > >=20
> > > > > > Sir,
> > > > > >=20
> > > > > > Should we remove this check? Earlier when I checked for file ex=
tension
> > > > > > we had 120 cases where this check was also needed but now we ha=
ve a
> > > > > > better heuristic which is going to work for all cases where lic=
ense
> > > > > > should be on line 2 irrespective of the fact that we know the f=
irst line
> > > > > > or not.
> > > > > >
> > > > >=20
> > > > > Are you sure about that? Where is the evaluation that proves your=
 point?
> > > > >=20
> > > > > E.g., are all files that contain a shebang really with an executa=
ble flag?
> > > > >=20
> > > > > Which commands did you run to check this?
> > > > > =20
> > > > > > If I am missing out on something and we should not be removing =
this check,
> > > > > > then I suggest placing the new heuristics below this block so t=
hat it doesn't
> > > > > > interfere with the existing logic.
> > > > > >=20
> > > > > > Please let me know which path should I go about and then I shal=
l resend
> > > > > > the patch with the modified commit message.
> > > > > >=20
> > > > >=20
> > > > > Think about the strengths and weaknesses of the potential solutio=
ns, then=20
> > > > > show with some commands (as I did for example, for finding the fi=
rst=20
> > > > > lines previously) that you can show that it practically makes a=
=20
> > > > > difference and you can numbers on those differences.
> > > > >=20
> > > > > When you did that, send a new patch.
> > > > >=20
> > > > > Lukas
> > > > >=20
> > > > Sir,
> > > >=20
> > > > I ran the evaluation as:
> > > >=20
> > > > mrinalpandey@mrinalpandey:~/linux/linux$ cat get_permissions.sh
> > > > #!/bin/bash
> > > >=20
> > > > for file in $(git ls-files)
> > > > do
> > > >         permissions=3D"$(stat -c "%a %n" $file)"
> > > >         echo "$permissions"
> > > > done
> > > >=20
> > > > mrinalpandey@mrinalpandey:~/linux/linux$ sh get_permissions.sh | gr=
ep ^[7531] > temp
> > > >=20
> > > > mrinalpandey@mrinalpandey:~/linux/linux$ cut -d ' ' -f 2 temp > exe=
cutables
> > > >=20
> > > > mrinalpandey@mrinalpandey:~/linux/linux$ cat first_line.sh
> > > > #!/bin/bash
> > > > file=3D"executables"
> > > > while IFS=3D read -r line
> > > > do
> > > >         firstline=3D`head -n 1 $line`
> > > >         printf '%s:%s\n' "$firstline" "$line"
> > > > done <"$file"
> > > >=20
> > > > mrinalpandey@mrinalpandey:~/linux/linux$ cat executables | wc -l
> > > > 611
> > > >=20
> > > > mrinalpandey@mrinalpandey:~/linux/linux$ sh first_line.sh | grep ^#=
! | wc -l
> > > > head: error reading 'scripts/dtc/include-prefixes/arc': Is a direct=
ory
> > > > head: error reading 'scripts/dtc/include-prefixes/arm': Is a direct=
ory
> > > > head: error reading 'scripts/dtc/include-prefixes/arm64': Is a dire=
ctory
> > > > head: error reading 'scripts/dtc/include-prefixes/c6x': Is a direct=
ory
> > > > head: error reading 'scripts/dtc/include-prefixes/dt-bindings': Is =
a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/h8300': Is a dire=
ctory
> > > > head: error reading 'scripts/dtc/include-prefixes/microblaze': Is a=
 directory
> > > > head: error reading 'scripts/dtc/include-prefixes/mips': Is a direc=
tory
> > > > head: error reading 'scripts/dtc/include-prefixes/nios2': Is a dire=
ctory
> > > > head: error reading 'scripts/dtc/include-prefixes/openrisc': Is a d=
irectory
> > > > head: error reading 'scripts/dtc/include-prefixes/powerpc': Is a di=
rectory
> > > > head: error reading 'scripts/dtc/include-prefixes/sh': Is a directo=
ry
> > > > head: error reading 'scripts/dtc/include-prefixes/xtensa': Is a dir=
ectory
> > > > 540
> > > >=20
> > > > We can see that there are 71 files where the executable bit is set =
but
> > > > the first line is not a shebang. These include 13 directories which
> > > > throw the error above. Remaining 58 files(earlier the number was 53)
> > > > could be cleaned so that this heuristic works better as we saw. So,=
 by
> > > > checking only for the executable bit we can say that license should=
 be
> > > > on second line, we probably don't need to check for the shebang on =
line
> > > > 1.
> > > > Please let me know if the evaluation makes sense.
> > > >
> >=20
> > This evaluation makes sense to find the cases that should be cleaned up.
> >=20
> > Either the executable flag is simply set wrongly and should be dropped =
or=20
> > it is actually a script and should get a shebang in the beginning.
> >=20
> > I actually already started cleaning up. See:
> >=20
> > https://lore.kernel.org/lkml/20200819081808.26796-1-lukas.bulwahn@gmail=
=2Ecom/
> >=20
> > We can discuss how to continue this cleanup.
> >
>=20
> I had another look at the results of your script.
>=20
> Just a minor improvement to that resulting list:
>=20
> I think symbolic links in the repository are always of permission 777, an=
d=20
> I think that is reasonable.
>=20
> So maybe you can filter out the symbolic links in your get_permissions.sh?
>=20
> Then, the list is probably down to a few 20 to 30 cases that should=20
> probably really be cleaned up.
>=20
> Can you share that script and the results? Then, let us start cleaning=20
> up.

Sir,

Here is what I ran:

mrinalpandey@mrinalpandey:~/linux/linux$ cat get_permissions.sh
#!/bin/bash

for file in $(git ls-files)
do
	permissions=3D"$(stat -c '%a %n' $file)"
	details=3D"$(ls -l $file)"
	echo "$permissions $details"
done
mrinalpandey@mrinalpandey:~/linux/linux$ sh get_permissions.sh | grep ^[753=
1] | grep -v "\->" > temp
mrinalpandey@mrinalpandey:~/linux/linux$ cut -d ' ' -f 2 temp > executables
mrinalpandey@mrinalpandey:~/linux/linux$ cat executables | wc -l
574
mrinalpandey@mrinalpandey:~/linux/linux$ cat first_line.sh
#!/bin/bash
file=3D"executables"
while IFS=3D read -r line
do
	firstline=3D`head -n 1 $line`
	printf '%s:%s\n' "$firstline" "$line"
done <"$file"
mrinalpandey@mrinalpandey:~/linux/linux$ sh first_line.sh | grep ^#! | wc -l
539

Hence, there are only 35 cases to be cleaned up.

Thank you.
>=20
> Lukas

--tbwly6yhjupw2vky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl9De8wACgkQxIwpEWwx
hGTeaBAAlYB16OFqXHuIj1O7eW7RGZkemoqsL6cDPA+dvMwJoDeD9pE9HE1W+nnc
SpwiO0s0mF+P44QhXCOpnz+RRAvy1Fmq6smP5+sakCZUGaLSVnw/FU/g8Gr6uQSb
bMY8PmVvrM0VpMoueGIZXMq1oSOWK5EeXjqEDkKiKEGvSFNUT50OOhFVHXImi+uQ
piyXuws/BaNRYuNeD6XtbfVpnShMz62TN1vliU9lQbPwABkiX+JEQXF2ImHZ/MBO
uz+nG70F9KNXZmy2C2fbxdL/PrSRQ0IEHvqiWj66m0B0q5h4+5bZq49u6c5iTB51
tBkwL/zcLwNUB0ZOv+u6ZKCF87hin1R+64dNNEHHB1mi/siirOOlZRqsl66vFEHH
sqmi10ifyXQYAy5JaEaCc6j6UMSsfqftlNSKmAmgbQ0D8unTh0IobKp3YjSs9Lgb
Lj76pvq5yIm/5OaFLL2KuEAjPaV15RM7CeJWWn+RSHK9mp3kwGCa2pkY0FvzYW+a
WYv+Be9xWeCcErbiA56NWAFxs4+Nl4DnEg3iVkdD7KVqz6I+vURYVDdehkmqP1Bm
CZGVTvMYlPrutJEirLEnIpvwIpsdmbZCdKEzTutFENVyIofbgnY6afleZgwksqid
8o+O/G/R790r/5pMJgZlNuYzevhWcPwy/zCZ0WW0pcYkeGlG0M8=
=5/ww
-----END PGP SIGNATURE-----

--tbwly6yhjupw2vky--

--===============2746806988070840357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2746806988070840357==--
