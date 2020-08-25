Return-Path: <SRS0=1t6x=CD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A36FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 04:56:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C8F02072D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 04:56:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHZypuUr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C8F02072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DDB8D87C16;
	Tue, 25 Aug 2020 04:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLjqqx0Rt3rw; Tue, 25 Aug 2020 04:56:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A479088076;
	Tue, 25 Aug 2020 04:56:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8597BC016F;
	Tue, 25 Aug 2020 04:56:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FC5FC0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 04:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 28F91861C9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 04:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZGJzQIevu3v
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 04:56:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C42B0861AA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 04:56:13 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id g6so600362pjl.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 21:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7GR58lDwkVUCVlhyXe17QIRQge0yp3Ke9vbNkDnsEBA=;
 b=BHZypuUrFFUXWLGQpqhdNtbSblDbo+dGQN3cJbEtVBjGuLJ5IJMxR3BofSc+JNQXGT
 lrf6o84TgWMvfl1Dvs5BHVunP8/9wMauDxECVGH/GkBGN8/hrl72iqunYedokz3CrwwM
 YAylyxKfFet5J7Y7zQe/nQoZoJbxWcERgBX3MKpPBB865AQRDxUyEV9BgEB1y4sgUnQf
 M33JBUjESRX/jMRz9WDeOguOr0RTB4/esUXrPyIshhBT+zuyv5vK2+rxcsLnGSTNWQvk
 g3j0W9kr6rI8aM/LaVwHCM+uQti+xtesIeiTQcHZROa3sRaEBfOKcPkfCMwvec5NxSg4
 jFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7GR58lDwkVUCVlhyXe17QIRQge0yp3Ke9vbNkDnsEBA=;
 b=cB2Dy6SgkXM9ZJZJo0msFK2h7Vb73FUfIbDZoMxtHtmkwCuLCdECcN5f0doKTuAVXh
 WKOLnT/opzxfYNydRBb5Tk7N/6eb0OB9XF3/V7Wv0he6O2ROGujExmhUVmLDJ0yEzeEO
 dMov7ovfx0TaFyB/oJvr5SD9Sgga2RWDNYcLM388qSN38iJj1Wt4OqUIzz1POw24brnx
 PKTe9hzTPxyXt7Ez/QP9XcwFfzGTgDOVma7t7rF7KKe/jiR8z0ouAkVZWwApcfenrHeL
 gnnUplKDaXtTP7UdGkONkqZqeUDenTUsJzM5dWJcH+ho0T6+fjO3i8VMxFnpzPuMUfcO
 DEEA==
X-Gm-Message-State: AOAM533lBzt5sBptWNr+J6UBAimOsZ3gahgOk82ftmlTX3urMYiavmLU
 8o1k2Ppgk2r3VfZcdc8vkg4=
X-Google-Smtp-Source: ABdhPJyKeXoJrdQKnXfxeeukQ97zjn4HD9tdhPMKehloA+uuTxgtANvElX1hwv8xbUQXL/oHADFG4w==
X-Received: by 2002:a17:90a:fe0e:: with SMTP id
 ck14mr128654pjb.218.1598331373113; 
 Mon, 24 Aug 2020 21:56:13 -0700 (PDT)
Received: from localhost ([203.90.99.164])
 by smtp.gmail.com with ESMTPSA id 131sm11719168pgh.67.2020.08.24.21.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 21:56:12 -0700 (PDT)
Date: Tue, 25 Aug 2020 10:26:08 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, mrinalmni@gmail.com
Message-ID: <20200825045608.t52hx3qc5gg2dvuh@mrinalpandey>
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
 <alpine.DEB.2.21.2008031251410.8346@felia>
 <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
 <alpine.DEB.2.21.2008042131530.4346@felia>
 <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
 <20200820044241.4ivtq5co6cm4aze6@mrinalpandey>
 <alpine.DEB.2.21.2008221014310.12792@felia>
 <alpine.DEB.2.21.2008222117460.20211@felia>
 <20200824083529.m7vqwgbr54lvmcwi@mrinalpandey>
 <alpine.DEB.2.21.2008241054470.2932@felia>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008241054470.2932@felia>
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
Content-Type: multipart/mixed; boundary="===============5003130693956120165=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============5003130693956120165==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lf6nr2htq7lapfeo"
Content-Disposition: inline


--lf6nr2htq7lapfeo
Content-Type: multipart/mixed; boundary="47bskytv4a7ruuaa"
Content-Disposition: inline


--47bskytv4a7ruuaa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/08/24 10:56AM, Lukas Bulwahn wrote:
>=20
>=20
> On Mon, 24 Aug 2020, Mrinal Pandey wrote:
>=20
> > On 20/08/22 09:25PM, Lukas Bulwahn wrote:
> > >=20
> > >=20
> > > On Sat, 22 Aug 2020, Lukas Bulwahn wrote:
> > >=20
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
> > > I had another look at the results of your script.
> > >=20
> > > Just a minor improvement to that resulting list:
> > >=20
> > > I think symbolic links in the repository are always of permission 777=
, and=20
> > > I think that is reasonable.
> > >=20
> > > So maybe you can filter out the symbolic links in your get_permission=
s.sh?
> > >=20
> > > Then, the list is probably down to a few 20 to 30 cases that should=
=20
> > > probably really be cleaned up.
> > >=20
> > > Can you share that script and the results? Then, let us start cleanin=
g=20
> > > up.
> >=20
> > Sir,
> >=20
> > Here is what I ran:
> >=20
> > mrinalpandey@mrinalpandey:~/linux/linux$ cat get_permissions.sh
> > #!/bin/bash
> >=20
> > for file in $(git ls-files)
> > do
> > 	permissions=3D"$(stat -c '%a %n' $file)"
> > 	details=3D"$(ls -l $file)"
> > 	echo "$permissions $details"
> > done
> > mrinalpandey@mrinalpandey:~/linux/linux$ sh get_permissions.sh | grep ^=
[7531] | grep -v "\->" > temp
> > mrinalpandey@mrinalpandey:~/linux/linux$ cut -d ' ' -f 2 temp > executa=
bles
> > mrinalpandey@mrinalpandey:~/linux/linux$ cat executables | wc -l
> > 574
> > mrinalpandey@mrinalpandey:~/linux/linux$ cat first_line.sh
> > #!/bin/bash
> > file=3D"executables"
> > while IFS=3D read -r line
> > do
> > 	firstline=3D`head -n 1 $line`
> > 	printf '%s:%s\n' "$firstline" "$line"
> > done <"$file"
> > mrinalpandey@mrinalpandey:~/linux/linux$ sh first_line.sh | grep ^#! | =
wc -l
> > 539
> >=20
> > Hence, there are only 35 cases to be cleaned up.
> >
>=20
> Can you share those 35 cases you identified?
>=20
> Then, we can discuss the individual changes for those 35 cases.

Sir,

The list is attached herewith and is in the format:
<first-line> : <file-name>

Thank you.
>=20
> Lukas

--47bskytv4a7ruuaa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename=tobecleaned
Content-Transfer-Encoding: quoted-printable

# : Documentation/features/list-arch.sh
# : Documentation/features/scripts/features-refresh.sh
# Copyright =A9 2016 IBM Corporation : arch/powerpc/tools/unrel_branch_chec=
k.sh
/* : drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c
/* : drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
#ifndef _dcn_3_0_0_OFFSET_HEADER : drivers/gpu/drm/amd/include/asic_reg/dcn=
/dcn_3_0_0_offset.h
#ifndef _dcn_3_0_0_SH_MASK_HEADER : drivers/gpu/drm/amd/include/asic_reg/dc=
n/dcn_3_0_0_sh_mask.h
#ifndef _dpcs_3_0_0_OFFSET_HEADER : drivers/gpu/drm/amd/include/asic_reg/dc=
n/dpcs_3_0_0_offset.h
#ifndef _dpcs_3_0_0_SH_MASK_HEADER : drivers/gpu/drm/amd/include/asic_reg/d=
cn/dpcs_3_0_0_sh_mask.h
# name	meta	args... : scripts/atomic/atomics.tbl
cat <<EOF : scripts/atomic/fallbacks/acquire
cat <<EOF : scripts/atomic/fallbacks/add_negative
cat << EOF : scripts/atomic/fallbacks/add_unless
cat <<EOF : scripts/atomic/fallbacks/andnot
cat <<EOF : scripts/atomic/fallbacks/dec
cat <<EOF : scripts/atomic/fallbacks/dec_and_test
cat <<EOF : scripts/atomic/fallbacks/dec_if_positive
cat <<EOF : scripts/atomic/fallbacks/dec_unless_positive
cat <<EOF : scripts/atomic/fallbacks/fence
cat << EOF : scripts/atomic/fallbacks/fetch_add_unless
cat <<EOF : scripts/atomic/fallbacks/inc
cat <<EOF : scripts/atomic/fallbacks/inc_and_test
cat <<EOF : scripts/atomic/fallbacks/inc_not_zero
cat <<EOF : scripts/atomic/fallbacks/inc_unless_negative
cat <<EOF : scripts/atomic/fallbacks/read_acquire
cat <<EOF : scripts/atomic/fallbacks/release
cat <<EOF : scripts/atomic/fallbacks/set_release
cat <<EOF : scripts/atomic/fallbacks/sub_and_test
cat <<EOF : scripts/atomic/fallbacks/try_cmpxchg
# EventClass.py : tools/perf/scripts/python/Perf-Trace-Util/lib/Perf/Trace/=
EventClass.py
# flamegraph.py - create flame graphs from perf samples : tools/perf/script=
s/python/flamegraph.py
# Monitor the system for dropped packets and proudce a report of drop locat=
ions and counts : tools/perf/scripts/python/net_dropmonitor.py
# stackcollapse.py - format perf samples with one line per distinct call st=
ack : tools/perf/scripts/python/stackcollapse.py
 : tools/testing/selftests/gpio/gpio-mockup-sysfs.sh
# SPDX-License-Identifier: GPL-2.0 : tools/testing/selftests/net/forwarding=
/sch_red.sh

--47bskytv4a7ruuaa--

--lf6nr2htq7lapfeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl9EmecACgkQxIwpEWwx
hGSO9g/+I27/EYrKcOWVmU9AwKvkVkoISQvj+ThCxCX0zQMLCwWwG4d15j5GiHfD
9Henhcx+fhCkexBB6w65Vb/6FLEM5PEdRrDOZ0WJl+YR6J2IHxnSmBX51qYBhV7n
fSf6kT++Y3IXm57DssX6FZtY/rr9tbb5VMGFOH8fRsASmqLtpblQUd/Kx5UCnSKA
wdzGLAZdM7tUGcnbiHIJcsDI+YdiLg4Eznv/7sbLS7pFw1q0z6chUpMYnIwepAZS
iwZpL6abbCzAIJfDu/C9c34qsRCaMeDcF2b9zsyB/xq1IeWSROgmInsc1gasq8hQ
YD/DV4VXr0TfQyid4x5dIMjKCgmR0EfZroMOHI+4NT2CHJmXW7lRxgxrNqBYdB8l
siiCQ2d/vhQRuhIAje1rS8Lk/dg8V83XAO028Q0jujyB0YooHw2ykqqHAS3Pw9qC
BUWQpWzmx9xPRH91qu/5rPKZ6vNu6L/yggG31FKkXAqob7YDQFpjgsySTX2U60F9
srMlim/fE7gaD9ftMkjg1wzuSQByO8v0FZStXdZHwawCfSLno0PVfz/gfxb8rIqU
0q5citlnprzmqEmEV6OtkekWP6b6jtL4urtno0Qtp4k2DCdyxhzA7bIxBaevB4g0
HyZ0qfP5dSsDyMNwGjAxU1Hu4tnY19zsEaZpb+3Ef2JrzVqNArE=
=DgpB
-----END PGP SIGNATURE-----

--lf6nr2htq7lapfeo--

--===============5003130693956120165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5003130693956120165==--
