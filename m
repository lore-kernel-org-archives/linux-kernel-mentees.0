Return-Path: <SRS0=ht7Q=CC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD918C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 08:23:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A241020738
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 08:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoRaZRYw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A241020738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E04687747;
	Mon, 24 Aug 2020 08:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWIjGEWhSFc9; Mon, 24 Aug 2020 08:23:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 59A7B87733;
	Mon, 24 Aug 2020 08:23:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BFD2C016F;
	Mon, 24 Aug 2020 08:23:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5296BC0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3AB1B84AAE
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTWWOiWoCTmD
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:23:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1B9DD8499E
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:23:32 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id q1so3821763pjd.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 01:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KH1JPLeSYofGea2j5zMDBRTxe73Vw/zVcmy8TG0CJlE=;
 b=QoRaZRYwPYwGZj2eSW0g8Ujmb86qNlWtguuV9lbXiXpwCog69/jCBGc+Ou/ROoBXRe
 ePNI0ldaYovoGOhnQtZtxiOYZ3ZOoKVJ8eai4IbBf4lDTubJgfdkoEY1xip5CN192gr1
 UZwQkasbidvOg4jkvco0Y0XTNCgv1VaWXNkeiTp4OXY9BMYmLlt5t0CU0HTl0XkmB6Bk
 kL7VuI3FRT3NkIJcKAFprhCasbX4C/VrFkbLGyAiFdeLcJqY125KmaQm1BviHJ8cWiDS
 5PN+pJBuy8zVv3UDb/FEAqJ89de2NogvLnamPe9sucwURKPMCAf5p6Ebbr7fl+7bccij
 0NzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KH1JPLeSYofGea2j5zMDBRTxe73Vw/zVcmy8TG0CJlE=;
 b=jYYaIsDC7ZwQsPKuMeUl0UByFj6Q0eeJN2oCtoevQ0mjjWr56dHvn3ysZkcIXR4ptY
 otT19T5+em/BC0MeqKiIC2j3AUXAnA+aKRBi7eFds05ISzCA+ZMQOtVYB/RWU6p/OJxh
 Mrr9qhxLRV5p5kZ6B3XqL4NH9lDgDlLt/zl4rt/jelPmVkTxLAni7UmBxI3RNF4gCl3E
 JoxrYzX584LMCv+AzmXRR7pNH3azGuxu7Xk1leKhTX/XS0vdccoHwt6GuBrbmV+Oe2Ej
 TNf+XUQYXb11cy7qBwwRrWSOeozeiCYVhogB4hK8yqM2WaJAdVnueSoG1jyYbqBh9f5c
 DbXA==
X-Gm-Message-State: AOAM530GEjcHrFOn1JCPisdI4idHNAK3mqK3wa9jfT6R0jw4g28CunOE
 Plt+Xnd1It7pYj3zKuQaAxE=
X-Google-Smtp-Source: ABdhPJzAoUCDD5J6eYtARYR/6sjDYH4vq3AY4jJAXaJEOoG9o1T+3b9vwcypmDBZ+xsUiJW51cXvrg==
X-Received: by 2002:a17:90b:138d:: with SMTP id
 hr13mr3573085pjb.14.1598257411470; 
 Mon, 24 Aug 2020 01:23:31 -0700 (PDT)
Received: from localhost ([1.23.143.230])
 by smtp.gmail.com with ESMTPSA id h18sm10490819pfo.21.2020.08.24.01.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 01:23:30 -0700 (PDT)
Date: Mon, 24 Aug 2020 13:53:25 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org, mrinalmni@gmail.com
Message-ID: <20200824082325.4prwz56p2ppgfojl@mrinalpandey>
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
 <alpine.DEB.2.21.2008031251410.8346@felia>
 <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
 <alpine.DEB.2.21.2008042131530.4346@felia>
 <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
 <20200820044241.4ivtq5co6cm4aze6@mrinalpandey>
 <alpine.DEB.2.21.2008221014310.12792@felia>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008221014310.12792@felia>
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
Content-Type: multipart/mixed; boundary="===============8261066921181926077=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============8261066921181926077==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7hletjekmrzpgnqz"
Content-Disposition: inline


--7hletjekmrzpgnqz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/08/22 10:24AM, Lukas Bulwahn wrote:
>=20
>=20
> On Thu, 20 Aug 2020, Mrinal Pandey wrote:
>=20
> > On 20/08/09 12:52PM, Mrinal Pandey wrote:
> > > On 20/08/04 09:37PM, Lukas Bulwahn wrote:
> > > >=20
> > > >=20
> > > > On Tue, 4 Aug 2020, Mrinal Pandey wrote:
> > > >=20
> > > > > On 20/08/03 12:59PM, Lukas Bulwahn wrote:
> > > > > >=20
> > > > > >=20
> > > > > > On Mon, 3 Aug 2020, Mrinal Pandey wrote:
> > > > > >=20
> > > > > > > The diff content includes the SPDX licensing information but =
excludes the
> > > > > > > shebang when a change is made to a script file in commit 37f8=
173dd849
> > > > > > > ("locking/atomics: Flip fallbacks and  instrumentation") and =
commit
> > > > > > > 075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add matc=
hall mirror
> > > > > > > test"). In these cases checkpatch issues a false positive war=
ning:
> > > > > > > "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> > > > > > >=20
> > > > > > > Currently, if checkpatch finds a shebang in line 1, it expect=
s the
> > > > > > > license identifier in line 2. However, this doesn't work when=
 a shebang
> > > > > > > isn't found on the line 1.
> > > > > >=20
> > > > > > It does not work when the diff does not contain line 1, but onl=
y line 2,
> > > > > > because then the shebang check for line 1 cannot work.
> > > > > >=20
> > > > > > >=20
> > > > > > > I noticed this false positive, while running checkpatch on th=
e set of
> > > > > > > commits from v5.7 to v5.8-rc1 of the kernel, on the said comm=
its.
> > > > > > > This false positive exists in checkpatch since commit a8da38a=
9cf0e
> > > > > > > ("checkpatch: add test for SPDX-License-Identifier on wrong l=
ine #")
> > > > > > > when the corresponding rule was first added.
> > > > > > >=20
> > > > > > > The alternatives considered to improve this check were lookin=
g the file
> > > > > > > to be a script by either examining the file extension or file=
 permissions.
> > > > > > >
> > > > > >=20
> > > > > > Make this sentence shorter. Try.
> > > > > > =20
> > > > > > > The evaluation on former option resulted in 120 files which h=
ad a shebang
> > > > > > > in the first line but no file extension. This didn't look lik=
e a promising
> > > > > > > result and hence I dropped the idea of using this approach.
> > > > > > >=20
> > > > > > > The evaluation on the latter approach shows that there are 53=
 files in the
> > > > > > > kernel which have an executable bit set but don't have a sheb=
ang in the
> > > > > > > first line.
> > > > > > >=20
> > > > > > > At the first sight on these 53 files, it seems that they eith=
er have a
> > > > > > > wrong file permission set or could be reasonably extended wit=
h a shebang
> > > > > > > and SPDX license information. Thus, further cleanup in the re=
pository
> > > > > > > would make the latter approach to work even more precisely.
> > > > > > >=20
> > > > > > > Hence, I chose to check the file permissions to determine if =
the file is a
> > > > > > > script and notify checkpatch to expect SPDX on second line fo=
r such files.
> > > > > > >
> > > > > >=20
> > > > > > There is no notification here. Think about better wording.
> > > > > > =20
> > > > > > > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > > > > > > ---
> > > > > > >  scripts/checkpatch.pl | 3 +++
> > > > > > >  1 file changed, 3 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > > > > index 4c820607540b..bae1dd824518 100755
> > > > > > > --- a/scripts/checkpatch.pl
> > > > > > > +++ b/scripts/checkpatch.pl
> > > > > > > @@ -3166,6 +3166,9 @@ sub process {
> > > > > > >  		}
> > > > > > > =20
> > > > > > >  # check for using SPDX license tag at beginning of files
> > > > > > > +		if ($line =3D~ /^index\ .*\.\..*\ .*[7531]\d{0,2}$/) {
> > > > > > > +			$checklicenseline =3D 2;
> > > > > > > +		}
> > > > > >=20
> > > > > > That check looks good now.
> > > > > >=20
> > > > > > >  		if ($realline =3D=3D $checklicenseline) {
> > > > > > >  			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
> > > > > > >  				$checklicenseline =3D 2;
> > > > > >=20
> > > > > > This is probably broken now. It should check for shebang in lin=
e 1 and=20
> > > > > > then set checklicenseline to line 2, right?
> > > > >=20
> > > > > Sir,
> > > > >=20
> > > > > Should we remove this check? Earlier when I checked for file exte=
nsion
> > > > > we had 120 cases where this check was also needed but now we have=
 a
> > > > > better heuristic which is going to work for all cases where licen=
se
> > > > > should be on line 2 irrespective of the fact that we know the fir=
st line
> > > > > or not.
> > > > >
> > > >=20
> > > > Are you sure about that? Where is the evaluation that proves your p=
oint?
> > > >=20
> > > > E.g., are all files that contain a shebang really with an executabl=
e flag?
> > > >=20
> > > > Which commands did you run to check this?
> > > > =20
> > > > > If I am missing out on something and we should not be removing th=
is check,
> > > > > then I suggest placing the new heuristics below this block so tha=
t it doesn't
> > > > > interfere with the existing logic.
> > > > >=20
> > > > > Please let me know which path should I go about and then I shall =
resend
> > > > > the patch with the modified commit message.
> > > > >=20
> > > >=20
> > > > Think about the strengths and weaknesses of the potential solutions=
, then=20
> > > > show with some commands (as I did for example, for finding the firs=
t=20
> > > > lines previously) that you can show that it practically makes a=20
> > > > difference and you can numbers on those differences.
> > > >=20
> > > > When you did that, send a new patch.
> > > >=20
> > > > Lukas
> > > >=20
> > > Sir,
> > >=20
> > > I ran the evaluation as:
> > >=20
> > > mrinalpandey@mrinalpandey:~/linux/linux$ cat get_permissions.sh
> > > #!/bin/bash
> > >=20
> > > for file in $(git ls-files)
> > > do
> > >         permissions=3D"$(stat -c "%a %n" $file)"
> > >         echo "$permissions"
> > > done
> > >=20
> > > mrinalpandey@mrinalpandey:~/linux/linux$ sh get_permissions.sh | grep=
 ^[7531] > temp
> > >=20
> > > mrinalpandey@mrinalpandey:~/linux/linux$ cut -d ' ' -f 2 temp > execu=
tables
> > >=20
> > > mrinalpandey@mrinalpandey:~/linux/linux$ cat first_line.sh
> > > #!/bin/bash
> > > file=3D"executables"
> > > while IFS=3D read -r line
> > > do
> > >         firstline=3D`head -n 1 $line`
> > >         printf '%s:%s\n' "$firstline" "$line"
> > > done <"$file"
> > >=20
> > > mrinalpandey@mrinalpandey:~/linux/linux$ cat executables | wc -l
> > > 611
> > >=20
> > > mrinalpandey@mrinalpandey:~/linux/linux$ sh first_line.sh | grep ^#! =
| wc -l
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
> > > 540
> > >=20
> > > We can see that there are 71 files where the executable bit is set but
> > > the first line is not a shebang. These include 13 directories which
> > > throw the error above. Remaining 58 files(earlier the number was 53)
> > > could be cleaned so that this heuristic works better as we saw. So, by
> > > checking only for the executable bit we can say that license should be
> > > on second line, we probably don't need to check for the shebang on li=
ne
> > > 1.
> > > Please let me know if the evaluation makes sense.
> > >
>=20
> This evaluation makes sense to find the cases that should be cleaned up.
>=20
> Either the executable flag is simply set wrongly and should be dropped or=
=20
> it is actually a script and should get a shebang in the beginning.
>=20
> I actually already started cleaning up. See:
>=20
> https://lore.kernel.org/lkml/20200819081808.26796-1-lukas.bulwahn@gmail.c=
om/
>=20
> We can discuss how to continue this cleanup.
>

Sir,

Sure. I would love to discuss that.
Should I send cleanup related patches directly to lkml or do they need to
go through you, Shuah ma'am and mentee list first?

> However, you cannot use this evaluation to say the checking the executabl=
e=20
> bit is enough, simply as from this evaluation, you do not know how many=
=20
> files have a shebang in the first line and are not set with executable=20
> flag. For those files, we expect the SPDX identifier in the second line=
=20
> but your suggested approach would expect it in the first line.
>=20
> So we need an evaluation to find out how many cases of that situation=20
> exist?
>=20
> Then, can we easily fix those as well?

Here is the evaluation I ran to find such cases:

mrinalpandey@mrinalpandey:~/linux/linux$ cat first_lines.sh
#!/bin/bash

for file in $(git ls-files)
do
	permissions=3D"$(stat -c '%a %n' $file)"
	firstline=3D"$(head -n 1 $file)"
	echo "$permissions : $firstline"
done
mrinalpandey@mrinalpandey:~/linux/linux$ sh first_lines.sh | grep ^[642].*#=
! | wc -l
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
82

The last line in these 82 lines is "Binary file (standard input) matches" s=
o we have 81 instances
where we have shebang in the first line but the file is non-executable.

>=20
> This is certainly good investigation and it leads to some cleanup, so let=
=20
> us continue here.
>
Thank you sir.

> Lukas

--7hletjekmrzpgnqz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl9DePgACgkQxIwpEWwx
hGR7/xAAnrASp1QbHprrAKZrxnV8bNIdLV69GbcC0oGLtwnW8CTp+fU1JrHmIFOA
o8Z0F96wbmYRIF1AVNP8ABteFf5xERJZYMAEW0aTV0QYbW0cXjrzSGmL/wGALmce
Am6FTR/td1osIz2PvDqsLdNBirabaStNno7P0oKgo7RqrPc1esS1CYCCDULK4BCW
d4usXWsd9vX450JDXd+tSYp+ZBn85VJbznqaCia+lGUP1hzOx5tl7Re+i/OOAmVX
zAxAc0YXGj6uFTm8/qbtSKijJGAhGaq2Eb41Ef/H7d7uzWhdijkqLTLACC4mr/AM
bSTqpGgObADX5TUT1dStvH2svK0OtgQrfLjxKXuOLWmT6VAk1/df4bM1aW1cvTjc
gXV8i5nls/UN3AnTqywklwN/dQXU+gGTnDOticyXwDjD8Fh5ebL7JDH4IoYJgLAm
ZlZad0gN/mCQV8h+OXyNAdHETh52Dt32XV5wESS+OmbkcIH0dzZxPXbW4wWjOPNR
cy5ub3GazbTEiCudpBZwGLpKPt6eGxvNDbxAT6DxCmv6jp1k1CHjzhM83RNSIQCC
95ya47K3GAc843lKFFfs+uSr04vD5JXB1mx+mrWOD28GsKSHVhxNlFawTzaKqvAa
/cw6KpoiW+trNMcmbn8+BzbkksH2CNQ00eaH36iCR/xcEnRj6DQ=
=nvRD
-----END PGP SIGNATURE-----

--7hletjekmrzpgnqz--

--===============8261066921181926077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8261066921181926077==--
