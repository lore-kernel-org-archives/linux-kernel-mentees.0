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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B59C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 08:07:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03A8C2065E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 08:07:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfXncwNJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03A8C2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6755885608;
	Mon,  3 Aug 2020 08:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OaG8Rqs0mtkt; Mon,  3 Aug 2020 08:07:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C9647857CE;
	Mon,  3 Aug 2020 08:07:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B24C7C0051;
	Mon,  3 Aug 2020 08:07:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24B81C004C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 08:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0DEE9857CE
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 08:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id terJfbcr6rLb
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 08:07:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C06A185608
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 08:07:13 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id c10so6222425pjn.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 03 Aug 2020 01:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ra1B0hY4SS7IUowgMWazcON1EWgstb/gKq54HFv3VyA=;
 b=dfXncwNJdVp2t7hU/II7bJQkajlxLp8l7hJApcCx0oDth3Zi0pyQYRBF0d4meeTSsi
 KftKrD9jHoca4tmbCEeZIPwNwHpmb9ikcKQJXTsDOGDTt/HQOhyshJBrjjaBv6tzJOWV
 PR5Q4pF5mjHrkcBYkaaYWbIum1JhHZUfLviV29gzkogYJ5CvMIiEG5N2it9f5JVQ5Ae+
 zJn6bTYximZX9uR4wlQZZYle1CsqjM/aKC8EBecc7AMWdsGANqAxIF7hA/pupikqt43v
 jjmTGvbxewK/90wA73TW49YVj5tztO6K0DqhhJ7/qiuxF34pLVSAvGsiwY4XCJhcpIta
 UnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ra1B0hY4SS7IUowgMWazcON1EWgstb/gKq54HFv3VyA=;
 b=mPbM4DGFaiHkWvAtZJaz3J92rvHf4/jzJCygPivzX0MLgJ5/tRTltzLUtIyG1/zqHN
 YtylRmy5/08Cr0KJKPlDGHbVYd9e/Pq3kaPKAQagyIe67KFe5pWX1yYAhEjDgCi6AB6q
 IYQTICwLnCsPxyFq3LsRhf6HhGRUB2StY+HnR5u/EseBknYf4sTHzbxJhQN96y/+10z8
 csDnTd86GMhozUw+JJGRoz/ou5EpNOAfHQkVxFS2cQ0kmQdC1UjuAxm7v/EAakqGvz+2
 48dYZr6R239zyYaE2GfsvqzExnkm7/JMcCQj5qTrPL1bqpVxu4Zy6YMjLAE6c6KjJy+l
 pOuw==
X-Gm-Message-State: AOAM530bv7oOnWLQd/vfJFxDUeyzsBLpkWZyXRN2rnws9r1TQlHnjQYZ
 WkJ1nOSW2jz/2/0UnkZz83E=
X-Google-Smtp-Source: ABdhPJw7WPrBV5U2XSV7z9HoTVeqmDCnijTrtq/1m2TQSBTVsA1NuQSP0uKAb568hGCCBFJSWN8gTQ==
X-Received: by 2002:a17:90a:6482:: with SMTP id
 h2mr16814540pjj.47.1596442033287; 
 Mon, 03 Aug 2020 01:07:13 -0700 (PDT)
Received: from localhost ([1.22.41.153])
 by smtp.gmail.com with ESMTPSA id r77sm19872570pfc.193.2020.08.03.01.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 01:07:12 -0700 (PDT)
Date: Mon, 3 Aug 2020 13:37:08 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Message-ID: <20200803080708.2flvswxt3ivnynfq@mrinalpandey>
References: <20200730073351.xw42cgj7v6g7nxbf@mrinalpandey>
 <alpine.DEB.2.21.2008010740100.18967@felia>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008010740100.18967@felia>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Improve SPDX license
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
Content-Type: multipart/mixed; boundary="===============3586293843238497320=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============3586293843238497320==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kvjegdzu5h5zhixz"
Content-Disposition: inline


--kvjegdzu5h5zhixz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/08/01 08:04AM, Lukas Bulwahn wrote:
>=20
>=20
> On Thu, 30 Jul 2020, Mrinal Pandey wrote:
>=20
> > In all the script files, SPDX license identifier is expected on the sec=
ond
> > line, the first line being the shebang.
> >=20
> > The diff content includes the SPDX licensing information but excludes t=
he
> > shebang when a change is made to a script file in commit 37f8173dd849
> > ("locking/atomics: Flip fallbacks and  instrumentation") and commit
> > 075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add matchall mirror
> > test"). In these cases checkpatch issues a false positive warning:
> > "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> >=20
> > I noticed this false positive, while running checkpatch on the set of
> > commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
> > This false positive exists in checkpatch since commit a8da38a9cf0e
> > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> > when the corresponding rule was first added.
> >=20
> > Currently, if checkpatch finds a shebang in line 1, it expects the
> > license identifier in line 2. However, this doesn't work when a shebang
> > isn't found on the line 1.
> >
> ----
> > Improve this by ensuring the patch to have originated from a script by
> > checking the extension. However, there are 120 files in the kernel sour=
ce
> > that do not have an extension but have a shebang in line 1.
> >
>=20
> Well, you are not doing that anymore. So the commit message is wrong.
>=20
> Maybe, you simply say:
>=20
>   - what is the problem?
>   - what are the alternatives considered?
>   - what did you evaluate on these two alternatives?
>   - why did you decide the one you chose?
>=20
> If you structure it that way, it is easier to follow your thoughts.
>=20
> > An alternate approach is to check for permissions of the file. There are
> > 53 files in kernel source that have executable flag set but don't have a
> > shebang in the first line. These files could be patched suitably so that
> > they don't issue false warnings. Hence, choose this approach.
> >
>=20
> I would not mention the potential follow-up work in this commit.
> You can say that:
>=20
> At first sight on these 53 files, it seems that these files have a wrong=
=20
> file permission set or could be reasonably extended with a shebang and=20
> license information.
> Hence, further clean-up in the repository would make this heuristics work=
=20
> even more precisely.
>=20
> > Reduce SPDX license false warnings on patches by checking the permissio=
ns
> > on the file.
> >=20
> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 4c820607540b..c55595113499 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2368,6 +2368,7 @@ sub process {
> > =20
> >  	# Trace the real file/line as we go.
> >  	my $realfile =3D '';
> > +	my $realfile_perms =3D '';
> >  	my $realline =3D 0;
> >  	my $realcnt =3D 0;
> >  	my $here =3D '';
> > @@ -2555,11 +2556,13 @@ sub process {
> >  		if ($line =3D~ /^diff --git.*?(\S+)$/) {
> >  			$realfile =3D $1;
> >  			$realfile =3D~ s@^([^/]*)/@@ if (!$file);
> > +			$realfile_perms =3D `stat -c "%a" $realfile`;
>=20
> Again, this is totally wrong!
>=20
> We already noted that you can only use the information provided in the=20
> patch file.
>=20
> Is that information on file permissions provided with a patch?
> Where is it provided? Find out and then parse that information.

Sir,

I tried to improve the patch and the commit message. Please let me know
if I can further improve on it.
>=20
> >  			$in_commit_log =3D 0;
> >  			$found_file =3D 1;
> >  		} elsif ($line =3D~ /^\+\+\+\s+(\S+)/) {
> >  			$realfile =3D $1;
> >  			$realfile =3D~ s@^([^/]*)/@@ if (!$file);
> > +			$realfile_perms =3D `stat -c "%a" $realfile`;
> >  			$in_commit_log =3D 0;
> > =20
> >  			$p1_prefix =3D $1;
> > @@ -3166,6 +3169,9 @@ sub process {
> >  		}
> > =20
> >  # check for using SPDX license tag at beginning of files
> > +		if ($realfile_perms =3D~ /[7531]\d{0,2}/) {
> > +			$checklicenseline =3D 2;
> > +		}
>=20
> That check looks good. I assume you copied this expression from another=
=20
> place in checkpatch.pl.

Yes, I copied this check from line 2649 in checkpatch.pl.
>=20
>=20
> >  		if ($realline =3D=3D $checklicenseline) {
> >  			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
> >  				$checklicenseline =3D 2;
> > --=20
> > 2.25.1
> >=20
> >=20

--kvjegdzu5h5zhixz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8nxawACgkQxIwpEWwx
hGSIIQ//SJOyZbiKZ0yEM/Gk1VT7bwDk+khVXbXNjfYrdrtMB6CDoPYqEw1+zi0M
/aOJmogcW9/k0MuJSevh/BPr2XaJ2HQNIhz7yvmfLlEewQh32UraprO74AG8sF92
4pW3LTi9q5XZ5+C+cJS6HFUGAkgvQWV8HvtzJngMdpvpGI10xTvy0lcT+wo7LOFk
ei+3sc7ptXyoJmFQtmxQYWD1+V1h4lLHyEiJ2P4zRDdHGoIqXtlbssTW7bCORkMD
jZ9Jrc1wvuffCkXcqlD8ML/IXLYMvSvO/8QFhO2fmCt64HqrMp4QJG5FVCskiD3M
WjbRVFu1cCmjcWI8b8cbBWV7a1F4EevlHvm+kYsxfPSEwLrT/5V/DbhCzqVkHfJg
NQ79xY59x2P/Fk+OAltYkMxbDM2SitSpyOgUMIU4HU3gNFWq+PlByxbsCSzKFFNZ
0+MPl+W2o1veN5ZfCqfQBM0iMo7TEh3l7Lt1VzCsz/f3HO6N4h1BVqIAq/xblPKN
4fIGDB0D2ljVoAevqc6BH1XoOtPy/IQtguoQI5+vB9a2PDmfRX5UO28ya8dri9Jl
fQLLI/PjIMvKREQoHH7XH9837+oGttDGEZFLFCY/IqYefIN5XEPxKQ1BY9wYatrD
JxUh0K5IEASBKjPjoIuDYXXEzNSpiiZ4/b7bR3TUzFSx9NiUBtc=
=X32n
-----END PGP SIGNATURE-----

--kvjegdzu5h5zhixz--

--===============3586293843238497320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3586293843238497320==--
