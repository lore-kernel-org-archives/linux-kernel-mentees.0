Return-Path: <SRS0=EZza=B6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A26C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 Aug 2020 04:42:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ADB520786
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 Aug 2020 04:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+XKgmaz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ADB520786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D2194220CA;
	Thu, 20 Aug 2020 04:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbbzwXNiCtKq; Thu, 20 Aug 2020 04:42:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8A71020363;
	Thu, 20 Aug 2020 04:42:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BDA4C0889;
	Thu, 20 Aug 2020 04:42:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 262AAC0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 04:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1961A8824B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 04:42:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pesqh65b8lBX
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 04:42:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 23A7A8823F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 04:42:54 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 128so570443pgd.5
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ie2J3xKIXw1YbIiE53RvRUcNqheUhZeLd5inNi69yLo=;
 b=g+XKgmaz9r+o87v4KXmpx02wbHb3X1xhAcFFO9Y4xHMK11eSExS/x1qR4zGqNhiE1f
 6RwV/5RZQUXoRKjjnCLFkQEmD7DLdxiXMDiQXOgcFj0eRNA4FKAMxqxHNz5GrK0TEa0C
 YnKpjffvGrHvZP+n6pg3VjloBzBoHgJlqrCuGHj6J/7lM/Z+aAonI9L22f8a6H7PliiS
 dmgpxuM37U8qugNI1mnFAlC5ZHIoxIeAgkTR7WHfqUFS/2QKrXkY5Vxis/mflaOoHxZc
 kEQXkmXO32Di7pa334MHQdVoy5GkGQBUorWwVHp1OOuXHO/DfGvxsH/RAXo8Njin6IJe
 GRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ie2J3xKIXw1YbIiE53RvRUcNqheUhZeLd5inNi69yLo=;
 b=GkqQeMnJG1zQuwxkwLBvJXoNMYYYVvnb8wgwEHmzZBg351DeKT1cYeIuiKl2YZ4Fpx
 H6Ftrv6H/AiwXsy+eQlMIySYvqaZ//khXphN+0oumkaOiCirZFFMACCX9HM+GvXZ1p8I
 e4PBmEMLATiJSKfZ+tzWcrNoxzZDnQLrpAguuEmC//687WHUkN0AkwkopPzVM+d+L3OF
 UuN+AUcXt7LCLgJOd7tcj9p6uWgUItWT3uNzK/hA8YxmiAYrdvSjHNUFnRP6xxlDVGxS
 GlvC4X8Tcr3V7IE4LprQX3zQ3mgL5sXoRrtnfT49MJVtEgnxrtrDE6j4InN5fLmDXjEV
 l+bw==
X-Gm-Message-State: AOAM530KbvCpdKFODcH7wGnnCVP+bpucYjZC3d+DA6/45R9yvRAmVwFp
 s0JcRDRAd83Xs33LjXbSJzE=
X-Google-Smtp-Source: ABdhPJyQiVZkX1RoNH3O/3Hv+hE1zZLRuozdea2wvZuN4Ncl4HQIJM0h6YYn25jJtuXykRTD4qHZtw==
X-Received: by 2002:a65:669a:: with SMTP id b26mr1202143pgw.418.1597898573597; 
 Wed, 19 Aug 2020 21:42:53 -0700 (PDT)
Received: from localhost ([1.23.143.142])
 by smtp.gmail.com with ESMTPSA id z15sm721723pjz.12.2020.08.19.21.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 21:42:45 -0700 (PDT)
Date: Thu, 20 Aug 2020 10:12:41 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200820044241.4ivtq5co6cm4aze6@mrinalpandey>
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
 <alpine.DEB.2.21.2008031251410.8346@felia>
 <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
 <alpine.DEB.2.21.2008042131530.4346@felia>
 <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
MIME-Version: 1.0
In-Reply-To: <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
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
Content-Type: multipart/mixed; boundary="===============9190609661098215002=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============9190609661098215002==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b6hqnyumfruolzg6"
Content-Disposition: inline


--b6hqnyumfruolzg6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/08/09 12:52PM, Mrinal Pandey wrote:
> On 20/08/04 09:37PM, Lukas Bulwahn wrote:
> >=20
> >=20
> > On Tue, 4 Aug 2020, Mrinal Pandey wrote:
> >=20
> > > On 20/08/03 12:59PM, Lukas Bulwahn wrote:
> > > >=20
> > > >=20
> > > > On Mon, 3 Aug 2020, Mrinal Pandey wrote:
> > > >=20
> > > > > The diff content includes the SPDX licensing information but excl=
udes the
> > > > > shebang when a change is made to a script file in commit 37f8173d=
d849
> > > > > ("locking/atomics: Flip fallbacks and  instrumentation") and comm=
it
> > > > > 075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add matchall=
 mirror
> > > > > test"). In these cases checkpatch issues a false positive warning:
> > > > > "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> > > > >=20
> > > > > Currently, if checkpatch finds a shebang in line 1, it expects the
> > > > > license identifier in line 2. However, this doesn't work when a s=
hebang
> > > > > isn't found on the line 1.
> > > >=20
> > > > It does not work when the diff does not contain line 1, but only li=
ne 2,
> > > > because then the shebang check for line 1 cannot work.
> > > >=20
> > > > >=20
> > > > > I noticed this false positive, while running checkpatch on the se=
t of
> > > > > commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
> > > > > This false positive exists in checkpatch since commit a8da38a9cf0e
> > > > > ("checkpatch: add test for SPDX-License-Identifier on wrong line =
#")
> > > > > when the corresponding rule was first added.
> > > > >=20
> > > > > The alternatives considered to improve this check were looking th=
e file
> > > > > to be a script by either examining the file extension or file per=
missions.
> > > > >
> > > >=20
> > > > Make this sentence shorter. Try.
> > > > =20
> > > > > The evaluation on former option resulted in 120 files which had a=
 shebang
> > > > > in the first line but no file extension. This didn't look like a =
promising
> > > > > result and hence I dropped the idea of using this approach.
> > > > >=20
> > > > > The evaluation on the latter approach shows that there are 53 fil=
es in the
> > > > > kernel which have an executable bit set but don't have a shebang =
in the
> > > > > first line.
> > > > >=20
> > > > > At the first sight on these 53 files, it seems that they either h=
ave a
> > > > > wrong file permission set or could be reasonably extended with a =
shebang
> > > > > and SPDX license information. Thus, further cleanup in the reposi=
tory
> > > > > would make the latter approach to work even more precisely.
> > > > >=20
> > > > > Hence, I chose to check the file permissions to determine if the =
file is a
> > > > > script and notify checkpatch to expect SPDX on second line for su=
ch files.
> > > > >
> > > >=20
> > > > There is no notification here. Think about better wording.
> > > > =20
> > > > > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > > > > ---
> > > > >  scripts/checkpatch.pl | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >=20
> > > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > > index 4c820607540b..bae1dd824518 100755
> > > > > --- a/scripts/checkpatch.pl
> > > > > +++ b/scripts/checkpatch.pl
> > > > > @@ -3166,6 +3166,9 @@ sub process {
> > > > >  		}
> > > > > =20
> > > > >  # check for using SPDX license tag at beginning of files
> > > > > +		if ($line =3D~ /^index\ .*\.\..*\ .*[7531]\d{0,2}$/) {
> > > > > +			$checklicenseline =3D 2;
> > > > > +		}
> > > >=20
> > > > That check looks good now.
> > > >=20
> > > > >  		if ($realline =3D=3D $checklicenseline) {
> > > > >  			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
> > > > >  				$checklicenseline =3D 2;
> > > >=20
> > > > This is probably broken now. It should check for shebang in line 1 =
and=20
> > > > then set checklicenseline to line 2, right?
> > >=20
> > > Sir,
> > >=20
> > > Should we remove this check? Earlier when I checked for file extension
> > > we had 120 cases where this check was also needed but now we have a
> > > better heuristic which is going to work for all cases where license
> > > should be on line 2 irrespective of the fact that we know the first l=
ine
> > > or not.
> > >
> >=20
> > Are you sure about that? Where is the evaluation that proves your point?
> >=20
> > E.g., are all files that contain a shebang really with an executable fl=
ag?
> >=20
> > Which commands did you run to check this?
> > =20
> > > If I am missing out on something and we should not be removing this c=
heck,
> > > then I suggest placing the new heuristics below this block so that it=
 doesn't
> > > interfere with the existing logic.
> > >=20
> > > Please let me know which path should I go about and then I shall rese=
nd
> > > the patch with the modified commit message.
> > >=20
> >=20
> > Think about the strengths and weaknesses of the potential solutions, th=
en=20
> > show with some commands (as I did for example, for finding the first=20
> > lines previously) that you can show that it practically makes a=20
> > difference and you can numbers on those differences.
> >=20
> > When you did that, send a new patch.
> >=20
> > Lukas
> >=20
> Sir,
>=20
> I ran the evaluation as:
>=20
> mrinalpandey@mrinalpandey:~/linux/linux$ cat get_permissions.sh
> #!/bin/bash
>=20
> for file in $(git ls-files)
> do
>         permissions=3D"$(stat -c "%a %n" $file)"
>         echo "$permissions"
> done
>=20
> mrinalpandey@mrinalpandey:~/linux/linux$ sh get_permissions.sh | grep ^[7=
531] > temp
>=20
> mrinalpandey@mrinalpandey:~/linux/linux$ cut -d ' ' -f 2 temp > executabl=
es
>=20
> mrinalpandey@mrinalpandey:~/linux/linux$ cat first_line.sh
> #!/bin/bash
> file=3D"executables"
> while IFS=3D read -r line
> do
>         firstline=3D`head -n 1 $line`
>         printf '%s:%s\n' "$firstline" "$line"
> done <"$file"
>=20
> mrinalpandey@mrinalpandey:~/linux/linux$ cat executables | wc -l
> 611
>=20
> mrinalpandey@mrinalpandey:~/linux/linux$ sh first_line.sh | grep ^#! | wc=
 -l
> head: error reading 'scripts/dtc/include-prefixes/arc': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/arm': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/arm64': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/c6x': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/dt-bindings': Is a dire=
ctory
> head: error reading 'scripts/dtc/include-prefixes/h8300': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/microblaze': Is a direc=
tory
> head: error reading 'scripts/dtc/include-prefixes/mips': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/nios2': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/openrisc': Is a directo=
ry
> head: error reading 'scripts/dtc/include-prefixes/powerpc': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/sh': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/xtensa': Is a directory
> 540
>=20
> We can see that there are 71 files where the executable bit is set but
> the first line is not a shebang. These include 13 directories which
> throw the error above. Remaining 58 files(earlier the number was 53)
> could be cleaned so that this heuristic works better as we saw. So, by
> checking only for the executable bit we can say that license should be
> on second line, we probably don't need to check for the shebang on line
> 1.
> Please let me know if the evaluation makes sense.
>=20
Sir,

Did you get the time to see this evaluation? Your comments would help me
to proceed with this particular patch.
Please let me know about this as time permits.

Thank you.

> Thank you.
>=20
> > > Thank you. > >=20
> > > > > --=20
> > > > > 2.25.1
> > > > >=20
> > > > >=20
> > >=20



--b6hqnyumfruolzg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl89/zwACgkQxIwpEWwx
hGSlFg//QOora8PYPpqBbOhNhIHWlYnou6C934U0qAYerUOXhZI/DwYLY9ac0zTJ
qXd/Ij7XvA27ZXqvV+upHgN6DfVicbaXfeBudUDiUNnJNeKZYE+1E9JraX3l9L+7
EAkn/aW+ZaTUoXm/Q71lhi8nZOutZ0h5Mc3KfwRHJj/I2Q6o3811KyoH9lUd5dPo
ELPMwBTbCBTC/hZp02Dd3hp0IVBwtamexRHU73CgY84qeZGyF5Q+RmhFDa3ylXkP
6Z8aQ/YfYOjnKJh1vBmCZ8bsgSQyeMgsx5pTEleY7uBj7dPxGvjP0LqsNn0m4UOL
Cz2LgSQb70GBQZL1PoqChaz9YLSoo9K2wF5Pr/L0oKF0eeTczEu/4WRTVlDJN965
hb3eFr+wjlmV5w7m+g6pw/kNsZv8Kp4AwElITG4c+A8qEIwblb01FZazZNKRZYOQ
yNrU/dZdg/Z+GFyxfCrNSZeWKCH9d8EaZ/WdNdbTfm0NKvWR3e67UrEa31YeVAWE
0vIX66uFTkG6P95iSIwZBfq1RSgMyxIVB6ImGXXt2zqLsstf7Ytl+czfeZV+M6DC
+rFZV4e/zPItrJ/zC024wg3Baep+fsnbdai7UF/X9LyW4WhjaZrTxgN83S4fxx4+
KnG9CReV3nmVLWQ8K8C11sIui3tJNDbtgOe6ahoNslHVUA6wkAk=
=W3zO
-----END PGP SIGNATURE-----

--b6hqnyumfruolzg6--

--===============9190609661098215002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============9190609661098215002==--
