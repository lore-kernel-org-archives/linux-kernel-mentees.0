Return-Path: <SRS0=W7xB=CP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C47C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Sep 2020 04:27:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FBEC20757
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Sep 2020 04:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dybQv1ZM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FBEC20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C43AA87414;
	Sun,  6 Sep 2020 04:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W+4MEquHXMmF; Sun,  6 Sep 2020 04:27:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC965873A4;
	Sun,  6 Sep 2020 04:27:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAB41C0052;
	Sun,  6 Sep 2020 04:27:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA2D5C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Sep 2020 04:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D296187414
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Sep 2020 04:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pR23O9Hr2lqH
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Sep 2020 04:27:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4AF46873A4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Sep 2020 04:27:32 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 17so6807062pfw.9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 05 Sep 2020 21:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8shsnvDXis6+7ZUbes6+2PtGGUKwjpz8OIwC0oOp5Lk=;
 b=dybQv1ZMlQbbEeqw7X/KM0J/krJg+KzWmUyC8v+TfemMeTYMsTWcWuvVh0vIlApYlv
 hYsl2qIP1u3oxgf2jz6VVrLdZ3xBhhjOy+ISKWWcylqJ2zi75whBGygCzKosmDooTLKk
 1bTCIl2gvEarB2trhr7KYNK+wgINBCpu29N37In8ZChRhi6LwDJflMmsXWMfME6mo4JN
 4Ybs2Ba/7RqEPlY1en1BWcBDZRbRKYZ08iaLmyPgEwn3Eynk8bRVw6j5O24YuT6i9bGL
 bSzxnlml+mgmFUzWUOx9AJjj8BptHLMIn4bpYx/P7XDjWnLo5unonCgcYYmiGlx+++Ew
 1xFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8shsnvDXis6+7ZUbes6+2PtGGUKwjpz8OIwC0oOp5Lk=;
 b=mzyRuUH1QiF078XzLJF5thE8o6/pQZkZa6TGsbrypsft9G/iGcnCnrZhGkszE5TvIM
 L7IwVfjrWWHSx2psn3qDz0hvyXOP2f2StI8N0x/SYXkTQvWgcZTPaVFb/Pm/vD+9PMG4
 5UAt70WYIF8NfyURuUXm4UppFMakxYLgTAgnwivNqHbwdSiNTXRU6f46u1yRo9MuH9UQ
 fubRrm1T6OxSPIVa+z0Qde4humskz0WkaxlF8jwl2FeFdNac4tRyF4FS/aW+1YVWojll
 i8KUnzmpdeczKQGTm/G6KgzggZ/IO5WgDoH1llobBaLdYM+WngU6p0Ew4D6lUu8z1gwY
 iAxQ==
X-Gm-Message-State: AOAM530oF2MfsNc6jAb8bNWLv6HgNGDxlJH5GXCpY9aFnB//ctUC+VPF
 xpJM+vvJTKIlKctxRzSMPkCGhhgwJok0Mg==
X-Google-Smtp-Source: ABdhPJzC/J6U/4ew58tO982LDokDBcJGwx+h4vr2Zbth6tl1MxPhT4Lfx+nwu/RRBUZp7UojS3lZdw==
X-Received: by 2002:a63:50c:: with SMTP id 12mr12636010pgf.173.1599366451439; 
 Sat, 05 Sep 2020 21:27:31 -0700 (PDT)
Received: from localhost ([1.22.41.54])
 by smtp.gmail.com with ESMTPSA id c1sm10810082pfi.136.2020.09.05.21.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 21:27:30 -0700 (PDT)
Date: Sun, 6 Sep 2020 09:57:24 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org, mrinalmni@gmail.com
Message-ID: <20200906042724.p6gbirsugnvslmh7@mrinalpandey>
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
 <alpine.DEB.2.21.2008031251410.8346@felia>
 <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
 <alpine.DEB.2.21.2008042131530.4346@felia>
 <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
 <20200820044241.4ivtq5co6cm4aze6@mrinalpandey>
 <alpine.DEB.2.21.2008221014310.12792@felia>
 <20200824082325.4prwz56p2ppgfojl@mrinalpandey>
 <alpine.DEB.2.21.2008241052310.2932@felia>
 <20200825045358.hygtrkm6qxyiwjft@mrinalpandey>
MIME-Version: 1.0
In-Reply-To: <20200825045358.hygtrkm6qxyiwjft@mrinalpandey>
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
Content-Type: multipart/mixed; boundary="===============8435797598156364567=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============8435797598156364567==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5cbt5yspfxa5u7qf"
Content-Disposition: inline


--5cbt5yspfxa5u7qf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/08/25 10:23AM, Mrinal Pandey wrote:
> On 20/08/24 10:54AM, Lukas Bulwahn wrote:
> >=20
> >=20
> > On Mon, 24 Aug 2020, Mrinal Pandey wrote:
> >=20
> > > On 20/08/22 10:24AM, Lukas Bulwahn wrote:
> > > >=20
> > > >=20
> > > > On Thu, 20 Aug 2020, Mrinal Pandey wrote:
> > > >=20
> > > > > On 20/08/09 12:52PM, Mrinal Pandey wrote:
> > > > > > On 20/08/04 09:37PM, Lukas Bulwahn wrote:
> > > > > > >=20
> > > > > > >=20
> > > > > > > On Tue, 4 Aug 2020, Mrinal Pandey wrote:
> > > > > > >=20
> > > > > > > > On 20/08/03 12:59PM, Lukas Bulwahn wrote:
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > On Mon, 3 Aug 2020, Mrinal Pandey wrote:
> > > > > > > > >=20
> > > > > > > > > > The diff content includes the SPDX licensing informatio=
n but excludes the
> > > > > > > > > > shebang when a change is made to a script file in commi=
t 37f8173dd849
> > > > > > > > > > ("locking/atomics: Flip fallbacks and  instrumentation"=
) and commit
> > > > > > > > > > 075c8aa79d54 ("selftests: forwarding: tc_actions.sh: ad=
d matchall mirror
> > > > > > > > > > test"). In these cases checkpatch issues a false positi=
ve warning:
> > > > > > > > > > "Misplaced SPDX-License-Identifier tag - use line 1 ins=
tead".
> > > > > > > > > >=20
> > > > > > > > > > Currently, if checkpatch finds a shebang in line 1, it =
expects the
> > > > > > > > > > license identifier in line 2. However, this doesn't wor=
k when a shebang
> > > > > > > > > > isn't found on the line 1.
> > > > > > > > >=20
> > > > > > > > > It does not work when the diff does not contain line 1, b=
ut only line 2,
> > > > > > > > > because then the shebang check for line 1 cannot work.
> > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > I noticed this false positive, while running checkpatch=
 on the set of
> > > > > > > > > > commits from v5.7 to v5.8-rc1 of the kernel, on the sai=
d commits.
> > > > > > > > > > This false positive exists in checkpatch since commit a=
8da38a9cf0e
> > > > > > > > > > ("checkpatch: add test for SPDX-License-Identifier on w=
rong line #")
> > > > > > > > > > when the corresponding rule was first added.
> > > > > > > > > >=20
> > > > > > > > > > The alternatives considered to improve this check were =
looking the file
> > > > > > > > > > to be a script by either examining the file extension o=
r file permissions.
> > > > > > > > > >
> > > > > > > > >=20
> > > > > > > > > Make this sentence shorter. Try.
> > > > > > > > > =20
> > > > > > > > > > The evaluation on former option resulted in 120 files w=
hich had a shebang
> > > > > > > > > > in the first line but no file extension. This didn't lo=
ok like a promising
> > > > > > > > > > result and hence I dropped the idea of using this appro=
ach.
> > > > > > > > > >=20
> > > > > > > > > > The evaluation on the latter approach shows that there =
are 53 files in the
> > > > > > > > > > kernel which have an executable bit set but don't have =
a shebang in the
> > > > > > > > > > first line.
> > > > > > > > > >=20
> > > > > > > > > > At the first sight on these 53 files, it seems that the=
y either have a
> > > > > > > > > > wrong file permission set or could be reasonably extend=
ed with a shebang
> > > > > > > > > > and SPDX license information. Thus, further cleanup in =
the repository
> > > > > > > > > > would make the latter approach to work even more precis=
ely.
> > > > > > > > > >=20
> > > > > > > > > > Hence, I chose to check the file permissions to determi=
ne if the file is a
> > > > > > > > > > script and notify checkpatch to expect SPDX on second l=
ine for such files.
> > > > > > > > > >
> > > > > > > > >=20
> > > > > > > > > There is no notification here. Think about better wording.
> > > > > > > > > =20
> > > > > > > > > > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > > > > > > > > > ---
> > > > > > > > > >  scripts/checkpatch.pl | 3 +++
> > > > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > > > >=20
> > > > > > > > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch=
=2Epl
> > > > > > > > > > index 4c820607540b..bae1dd824518 100755
> > > > > > > > > > --- a/scripts/checkpatch.pl
> > > > > > > > > > +++ b/scripts/checkpatch.pl
> > > > > > > > > > @@ -3166,6 +3166,9 @@ sub process {
> > > > > > > > > >  		}
> > > > > > > > > > =20
> > > > > > > > > >  # check for using SPDX license tag at beginning of fil=
es
> > > > > > > > > > +		if ($line =3D~ /^index\ .*\.\..*\ .*[7531]\d{0,2}$/)=
 {
> > > > > > > > > > +			$checklicenseline =3D 2;
> > > > > > > > > > +		}
> > > > > > > > >=20
> > > > > > > > > That check looks good now.
> > > > > > > > >=20
> > > > > > > > > >  		if ($realline =3D=3D $checklicenseline) {
> > > > > > > > > >  			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
> > > > > > > > > >  				$checklicenseline =3D 2;
> > > > > > > > >=20
> > > > > > > > > This is probably broken now. It should check for shebang =
in line 1 and=20
> > > > > > > > > then set checklicenseline to line 2, right?
> > > > > > > >=20
> > > > > > > > Sir,
> > > > > > > >=20
> > > > > > > > Should we remove this check? Earlier when I checked for fil=
e extension
> > > > > > > > we had 120 cases where this check was also needed but now w=
e have a
> > > > > > > > better heuristic which is going to work for all cases where=
 license
> > > > > > > > should be on line 2 irrespective of the fact that we know t=
he first line
> > > > > > > > or not.
> > > > > > > >
> > > > > > >=20
> > > > > > > Are you sure about that? Where is the evaluation that proves =
your point?
> > > > > > >=20
> > > > > > > E.g., are all files that contain a shebang really with an exe=
cutable flag?
> > > > > > >=20
> > > > > > > Which commands did you run to check this?
> > > > > > > =20
> > > > > > > > If I am missing out on something and we should not be remov=
ing this check,
> > > > > > > > then I suggest placing the new heuristics below this block =
so that it doesn't
> > > > > > > > interfere with the existing logic.
> > > > > > > >=20
> > > > > > > > Please let me know which path should I go about and then I =
shall resend
> > > > > > > > the patch with the modified commit message.
> > > > > > > >=20
> > > > > > >=20
> > > > > > > Think about the strengths and weaknesses of the potential sol=
utions, then=20
> > > > > > > show with some commands (as I did for example, for finding th=
e first=20
> > > > > > > lines previously) that you can show that it practically makes=
 a=20
> > > > > > > difference and you can numbers on those differences.
> > > > > > >=20
> > > > > > > When you did that, send a new patch.
> > > > > > >=20
> > > > > > > Lukas
> > > > > > >=20
> > > > > > Sir,
> > > > > >=20
> > > > > > I ran the evaluation as:
> > > > > >=20
> > > > > > mrinalpandey@mrinalpandey:~/linux/linux$ cat get_permissions.sh
> > > > > > #!/bin/bash
> > > > > >=20
> > > > > > for file in $(git ls-files)
> > > > > > do
> > > > > >         permissions=3D"$(stat -c "%a %n" $file)"
> > > > > >         echo "$permissions"
> > > > > > done
> > > > > >=20
> > > > > > mrinalpandey@mrinalpandey:~/linux/linux$ sh get_permissions.sh =
| grep ^[7531] > temp
> > > > > >=20
> > > > > > mrinalpandey@mrinalpandey:~/linux/linux$ cut -d ' ' -f 2 temp >=
 executables
> > > > > >=20
> > > > > > mrinalpandey@mrinalpandey:~/linux/linux$ cat first_line.sh
> > > > > > #!/bin/bash
> > > > > > file=3D"executables"
> > > > > > while IFS=3D read -r line
> > > > > > do
> > > > > >         firstline=3D`head -n 1 $line`
> > > > > >         printf '%s:%s\n' "$firstline" "$line"
> > > > > > done <"$file"
> > > > > >=20
> > > > > > mrinalpandey@mrinalpandey:~/linux/linux$ cat executables | wc -l
> > > > > > 611
> > > > > >=20
> > > > > > mrinalpandey@mrinalpandey:~/linux/linux$ sh first_line.sh | gre=
p ^#! | wc -l
> > > > > > head: error reading 'scripts/dtc/include-prefixes/arc': Is a di=
rectory
> > > > > > head: error reading 'scripts/dtc/include-prefixes/arm': Is a di=
rectory
> > > > > > head: error reading 'scripts/dtc/include-prefixes/arm64': Is a =
directory
> > > > > > head: error reading 'scripts/dtc/include-prefixes/c6x': Is a di=
rectory
> > > > > > head: error reading 'scripts/dtc/include-prefixes/dt-bindings':=
 Is a directory
> > > > > > head: error reading 'scripts/dtc/include-prefixes/h8300': Is a =
directory
> > > > > > head: error reading 'scripts/dtc/include-prefixes/microblaze': =
Is a directory
> > > > > > head: error reading 'scripts/dtc/include-prefixes/mips': Is a d=
irectory
> > > > > > head: error reading 'scripts/dtc/include-prefixes/nios2': Is a =
directory
> > > > > > head: error reading 'scripts/dtc/include-prefixes/openrisc': Is=
 a directory
> > > > > > head: error reading 'scripts/dtc/include-prefixes/powerpc': Is =
a directory
> > > > > > head: error reading 'scripts/dtc/include-prefixes/sh': Is a dir=
ectory
> > > > > > head: error reading 'scripts/dtc/include-prefixes/xtensa': Is a=
 directory
> > > > > > 540
> > > > > >=20
> > > > > > We can see that there are 71 files where the executable bit is =
set but
> > > > > > the first line is not a shebang. These include 13 directories w=
hich
> > > > > > throw the error above. Remaining 58 files(earlier the number wa=
s 53)
> > > > > > could be cleaned so that this heuristic works better as we saw.=
 So, by
> > > > > > checking only for the executable bit we can say that license sh=
ould be
> > > > > > on second line, we probably don't need to check for the shebang=
 on line
> > > > > > 1.
> > > > > > Please let me know if the evaluation makes sense.
> > > > > >
> > > >=20
> > > > This evaluation makes sense to find the cases that should be cleane=
d up.
> > > >=20
> > > > Either the executable flag is simply set wrongly and should be drop=
ped or=20
> > > > it is actually a script and should get a shebang in the beginning.
> > > >=20
> > > > I actually already started cleaning up. See:
> > > >=20
> > > > https://lore.kernel.org/lkml/20200819081808.26796-1-lukas.bulwahn@g=
mail.com/
> > > >=20
> > > > We can discuss how to continue this cleanup.
> > > >
> > >=20
> > > Sir,
> > >=20
> > > Sure. I would love to discuss that.
> > > Should I send cleanup related patches directly to lkml or do they nee=
d to
> > > go through you, Shuah ma'am and mentee list first?
> > >=20
> > > > However, you cannot use this evaluation to say the checking the exe=
cutable=20
> > > > bit is enough, simply as from this evaluation, you do not know how =
many=20
> > > > files have a shebang in the first line and are not set with executa=
ble=20
> > > > flag. For those files, we expect the SPDX identifier in the second =
line=20
> > > > but your suggested approach would expect it in the first line.
> > > >=20
> > > > So we need an evaluation to find out how many cases of that situati=
on=20
> > > > exist?
> > > >=20
> > > > Then, can we easily fix those as well?
> > >=20
> > > Here is the evaluation I ran to find such cases:
> > >=20
> > > mrinalpandey@mrinalpandey:~/linux/linux$ cat first_lines.sh
> > > #!/bin/bash
> > >=20
> > > for file in $(git ls-files)
> > > do
> > > 	permissions=3D"$(stat -c '%a %n' $file)"
> > > 	firstline=3D"$(head -n 1 $file)"
> > > 	echo "$permissions : $firstline"
> > > done
> > > mrinalpandey@mrinalpandey:~/linux/linux$ sh first_lines.sh | grep ^[6=
42].*#! | wc -l
> > > head: error reading 'scripts/dtc/include-prefixes/arc': Is a directory
> > > head: error reading 'scripts/dtc/include-prefixes/arm': Is a directory
> > > head: error reading 'scripts/dtc/include-prefixes/arm64': Is a direct=
ory
> > > head: error reading 'scripts/dtc/include-prefixes/c6x': Is a directory
> > > head: error reading 'scripts/dtc/include-prefixes/dt-bindings': Is a =
directory
> > > head: error reading 'scripts/dtc/include-prefixes/h8300': Is a direct=
ory
> > > head: error reading 'scripts/dtc/include-prefixes/microblaze': Is a d=
irectory
> > > head: error reading 'scripts/dtc/include-prefixes/mips': Is a directo=
ry
> > > head: error reading 'scripts/dtc/include-prefixes/nios2': Is a direct=
ory
> > > head: error reading 'scripts/dtc/include-prefixes/openrisc': Is a dir=
ectory
> > > head: error reading 'scripts/dtc/include-prefixes/powerpc': Is a dire=
ctory
> > > head: error reading 'scripts/dtc/include-prefixes/sh': Is a directory
> > > head: error reading 'scripts/dtc/include-prefixes/xtensa': Is a direc=
tory
> > > 82
> > >=20
> > > The last line in these 82 lines is "Binary file (standard input) matc=
hes" so we have 81 instances
> > > where we have shebang in the first line but the file is non-executabl=
e.
> > >
> >=20
> > How about removing the symbolic link files and then sharing that list?
>=20
> Sir,
>=20
> I couldn't find any symbolic links in these 81 files. The list is
> attached herewith.
> The list is in the format:
> <permissions> <file-name> : <first-line>
>=20
> Thank you.
> >=20
> > Lukas

> 664 Documentation/admin-guide/aoe/autoload.sh : #!/bin/sh
> 664 Documentation/admin-guide/aoe/status.sh : #! /bin/sh
> 664 Documentation/arm64/kasan-offsets.sh : #!/bin/sh
> 664 Documentation/firmware_class/hotplug-script : #!/bin/sh
> 664 Documentation/networking/device_drivers/atm/cxacru-cf.py : #!/usr/bin=
/env python
> 664 Documentation/s390/config3270.sh : #!/bin/sh
> 664 Documentation/sphinx/parallel-wrapper.sh : #!/bin/sh
> 664 Documentation/trace/postprocess/decode_msr.py : #!/usr/bin/python
> 664 Documentation/trace/postprocess/trace-pagealloc-postprocess.pl : #!/u=
sr/bin/perl
> 664 Documentation/trace/postprocess/trace-vmscan-postprocess.pl : #!/usr/=
bin/perl
> 664 arch/alpha/kernel/syscalls/syscallhdr.sh : #!/bin/sh
> 664 arch/alpha/kernel/syscalls/syscalltbl.sh : #!/bin/sh
> 664 arch/arm/boot/install.sh : #!/bin/sh
> 664 arch/arm/crypto/poly1305-armv4.pl : #!/usr/bin/env perl
> 664 arch/arm/crypto/sha256-armv4.pl : #!/usr/bin/env perl
> 664 arch/arm/crypto/sha512-armv4.pl : #!/usr/bin/env perl
> 664 arch/arm/tools/gen-mach-types : #!/bin/awk
> 664 arch/arm/tools/syscallhdr.sh : #!/bin/sh
> 664 arch/arm/tools/syscallnr.sh : #!/bin/sh
> 664 arch/arm/tools/syscalltbl.sh : #!/bin/sh
> 664 arch/arm64/boot/install.sh : #!/bin/sh
> 664 arch/arm64/crypto/poly1305-armv8.pl : #!/usr/bin/env perl
> 664 arch/arm64/crypto/sha512-armv8.pl : #! /usr/bin/env perl
> 664 arch/ia64/install.sh : #!/bin/sh
> 664 arch/ia64/kernel/syscalls/syscallhdr.sh : #!/bin/sh
> 664 arch/ia64/kernel/syscalls/syscalltbl.sh : #!/bin/sh
> 664 arch/ia64/scripts/unwcheck.py : #!/usr/bin/python
> 664 arch/m68k/install.sh : #!/bin/sh
> 664 arch/m68k/kernel/syscalls/syscallhdr.sh : #!/bin/sh
> 664 arch/m68k/kernel/syscalls/syscalltbl.sh : #!/bin/sh
> 664 arch/microblaze/kernel/syscalls/syscallhdr.sh : #!/bin/sh
> 664 arch/microblaze/kernel/syscalls/syscalltbl.sh : #!/bin/sh
> 664 arch/mips/crypto/poly1305-mips.pl : #!/usr/bin/env perl
> 664 arch/mips/kernel/syscalls/syscallhdr.sh : #!/bin/sh
> 664 arch/mips/kernel/syscalls/syscallnr.sh : #!/bin/sh
> 664 arch/mips/kernel/syscalls/syscalltbl.sh : #!/bin/sh
> 664 arch/nios2/boot/install.sh : #!/bin/sh
> 664 arch/parisc/boot/install.sh : #!/bin/sh
> 664 arch/parisc/install.sh : #!/bin/sh
> 664 arch/parisc/kernel/syscalls/syscallhdr.sh : #!/bin/sh
> 664 arch/parisc/kernel/syscalls/syscalltbl.sh : #!/bin/sh
> 664 arch/parisc/nm : #!/bin/sh
> 664 arch/powerpc/boot/install.sh : #!/bin/sh
> 664 arch/powerpc/kernel/prom_init_check.sh : #!/bin/sh
> 664 arch/powerpc/kernel/syscalls/syscallhdr.sh : #!/bin/sh
> 664 arch/powerpc/kernel/syscalls/syscalltbl.sh : #!/bin/sh
> 664 arch/powerpc/kernel/systbl_chk.sh : #!/bin/sh
> 664 arch/riscv/boot/install.sh : #!/bin/sh
> 664 arch/s390/boot/install.sh : #!/bin/sh
> 664 arch/sh/boot/compressed/install.sh : #!/bin/sh
> 664 arch/sh/kernel/syscalls/syscallhdr.sh : #!/bin/sh
> 664 arch/sh/kernel/syscalls/syscalltbl.sh : #!/bin/sh
> 664 arch/sh/tools/gen-mach-types : #!/bin/awk
> 664 arch/sparc/boot/install.sh : #!/bin/sh
> 664 arch/sparc/kernel/syscalls/syscallhdr.sh : #!/bin/sh
> 664 arch/sparc/kernel/syscalls/syscalltbl.sh : #!/bin/sh
> 664 arch/sparc/vdso/checkundef.sh : #!/bin/sh
> 664 arch/x86/boot/genimage.sh : #!/bin/sh
> 664 arch/x86/boot/install.sh : #!/bin/sh
> 664 arch/x86/crypto/poly1305-x86_64-cryptogams.pl : #!/usr/bin/env perl
> 664 arch/x86/entry/syscalls/syscallhdr.sh : #!/bin/sh
> 664 arch/x86/entry/syscalls/syscalltbl.sh : #!/bin/bash
> 664 arch/x86/kernel/cpu/mkcapflags.sh : #!/bin/sh
> 664 arch/x86/tools/gen-insn-attr-x86.awk : #!/bin/awk -f
> 664 arch/x86/tools/objdump_reformat.awk : #!/bin/awk -f
> 664 arch/x86/um/vdso/checkundef.sh : #!/bin/sh
> 664 arch/xtensa/kernel/syscalls/syscallhdr.sh : #!/bin/sh
> 664 arch/xtensa/kernel/syscalls/syscalltbl.sh : #!/bin/sh
> 664 drivers/block/paride/mkd : #!/bin/bash
> 664 drivers/crypto/vmx/aesp8-ppc.pl : #! /usr/bin/env perl
> 664 drivers/crypto/vmx/ghashp8-ppc.pl : #!/usr/bin/env perl
> 664 drivers/crypto/vmx/ppc-xlate.pl : #!/usr/bin/env perl
> 664 drivers/scsi/script_asm.pl : #!/usr/bin/perl -s
> 664 drivers/usb/serial/ezusb_convert.pl : #! /usr/bin/perl -w
> 664 samples/bpf/lwt_len_hist.sh : #!/bin/bash
> 664 samples/bpf/test_lwt_bpf.sh : #!/bin/bash
> 664 scripts/atomic/gen-atomics.sh : #!/bin/sh
> 664 scripts/gcc-plugins/gen-random-seed.sh : #!/bin/sh
> 664 scripts/nsdeps : #!/bin/sh
> 664 scripts/spdxcheck-test.sh : #!/bin/sh
> 664 scripts/xen-hypercalls.sh : #!/bin/sh

Sir,

I was wondering how should I go about the original patch? Should I keep
both the checks or just the executable one and let be the patch as it is
as further cleanup can lead to better performance as we have already
seen with the evaluations.

Also, I have completed all the tasks related to this project on Community
Bridge's site. What are the next steps of mentorship? By when can I
expect the results sir/ma'am?

Thank you.

--5cbt5yspfxa5u7qf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl9UZScACgkQxIwpEWwx
hGTSWxAAptaCxQ6Q525t5uoiDfCoDSOWlvZGf0a38KD2Elvd0wfe6GXn/1rZoUVr
8laSbdyIXnW05Sp83+BWPf4w3Oi9SSQe721V3PZt3FtukRNxYkr6YiMzQ69rZ1Xa
g4qO0oWPo1e+1fFkTF71lTeuXBiTdH467OrNP3VgDBfjoj0cFADIYX1/9OTFQank
QIHVfJQVPHwkqQedjdILT6fSKbq2erl0MNUlGaZhCGagsP+87/mvsIr3BmkB48nK
r9k5b8RJBvM1Kv+oLEru7ZTLU+c3rvaHAD1qiVK8UL6uari4MbHEtGMjVrQ5PTTl
869LbgLduesG5e0OKUcLRuJHtW/KPwkOUQmNe89pPydTBwdea1mtKeQaAoDReizG
qWUY4xiHFRaIRSli9RS3bnRhwvzfJsLKp7nrppJu6suGSeXT6++g3Zzxx8AmeKJO
kMksbM0shTOeU1BPxNliPgN9CR3Z3Mp3ahj4lKmSbqvudj9EoisQ9AbOTrv4LPN/
0IpKtTQjDXA+CfY8uEyah3znavwGL7s6lx39kumwytoEBXh8qvERGoRlvKk3linm
h2eZ6KC+0W996T9z/sRZZNc2mc0pnN/I6RwA7mYXmmstvMiuAvCzkL3B/mtFS/x6
9eMpPjZd4/LlUiL98YmdP2X1jvvp1W5FUXPGBafrBBVGfzOLgEk=
=mFL0
-----END PGP SIGNATURE-----

--5cbt5yspfxa5u7qf--

--===============8435797598156364567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8435797598156364567==--
