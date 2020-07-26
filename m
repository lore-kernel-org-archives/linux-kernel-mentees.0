Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8752EC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 14:04:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E539206E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 14:04:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJnS9kI8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E539206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F30A020796;
	Sun, 26 Jul 2020 14:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5KZ8CryuEauQ; Sun, 26 Jul 2020 14:04:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AFFBF2011A;
	Sun, 26 Jul 2020 14:04:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9703CC004F;
	Sun, 26 Jul 2020 14:04:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EB92C004D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 14:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 77EC48843A
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 14:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KSsCQ41i2sIT
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 14:04:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8991A88427
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 14:04:19 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x72so7702963pfc.6
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 07:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sMRfmHQuEerC+NbxG2qMxU5yCi01IigWDjlVhLjjUJo=;
 b=IJnS9kI8DutoBYEnt+cKJyO7X0saF9R6QuVIbv+qCZnkbIwUgk7hW5ITI+iAW1nXTq
 fn/sFCk6Zs1+oHLR8eeRoB9C3klG4BBg0AmGXw2umBts9+btZeVDSFRcqIhHOXC+HbfP
 /oZ7DNkw7wNFr7yOhfv4+D2Sn1/vP3N98qiGJ7SSDDOHCe4UuDV0HTO5KqsqmQ1rkYk7
 13rXI+e6wpfyThC245yjKjf0b659fof3Z/Y99mswMXuHN3yPPdNRb1bJckj0/4XVcANR
 AuHBnPsrbQDZnL+9157wPtibPei4CHRR3AsgAiZLXrBJYEytwoOtjzZfZ3OaTe0lBhnq
 Swog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sMRfmHQuEerC+NbxG2qMxU5yCi01IigWDjlVhLjjUJo=;
 b=DuS5vKdgdsgkSqbDeM/ixmqhJpYUvjgoRToK2qz08Ongo7q0awn57R90yfHwCaStOC
 sNH2H61uh/rAIcfGPduwXeoG1Zs88VwgMyOQA7wXWgr9OcskblsCgCEAVNfKBQIB4ajp
 9PejX6qzAgBGc+PZIEGqx6XYdLNOEpyeH9hxg/ckk9YuChkMlDQ4Z2JXMtjg9GTtbgUb
 +eHsggH0bsVCUHxYBzcYPDT5s0Wnlym6Baeu1cV/iQofCbRSJpgtLb3+03PSe2WHGHW4
 IP6owFUGayw6bV3MLc35zIcYdhnn7aEY1hU0spZPn/svKL7qW4GlIZa6MZBXCkouCFn5
 i4vw==
X-Gm-Message-State: AOAM530G6MfIO5YCkxnp+OzqstOgVsn0fi0Tkd0JJ8sU4e3iMiE686d6
 qmpl/hT2Vam90tB5QQB3lLk=
X-Google-Smtp-Source: ABdhPJySNlB7D9LgBcayMoKqeLAQPqrEFaZAKmzOI3UYGAWeIMVj/rGtxelCtCuQ8ErOM2UGyYLy7A==
X-Received: by 2002:a63:af01:: with SMTP id w1mr16285450pge.23.1595772258966; 
 Sun, 26 Jul 2020 07:04:18 -0700 (PDT)
Received: from localhost ([1.23.143.121])
 by smtp.gmail.com with ESMTPSA id b185sm11362593pfa.148.2020.07.26.07.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 07:04:18 -0700 (PDT)
Date: Sun, 26 Jul 2020 19:34:12 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200726140412.u5uyd73kwtxebs2y@mrinalpandey>
References: <20200725111847.pnt2a36ndd5lbqre@mrinalpandey>
 <alpine.DEB.2.21.2007260759440.7525@felia>
 <CAD1=X6kUzJNwdkRoZi01yYVAw7SskgALpTkRGmNLLxWxxjMzFQ@mail.gmail.com>
 <alpine.DEB.2.21.2007261302320.6195@felia>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007261302320.6195@felia>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix SPDX license
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
Content-Type: multipart/mixed; boundary="===============4265184048269174373=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============4265184048269174373==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iywkt7q5pjpapkjz"
Content-Disposition: inline


--iywkt7q5pjpapkjz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/07/26 01:09PM, Lukas Bulwahn wrote:
>=20
>=20
> On Sun, 26 Jul 2020, Mrinal Pandey wrote:
>=20
> >=20
> >=20
> > On Sun, Jul 26, 2020 at 11:43 AM Lukas Bulwahn <lukas.bulwahn@gmail.com=
> wrote:
> >=20
> >=20
> >       On Sat, 25 Jul 2020, Mrinal Pandey wrote:
> >=20
> >       > In all the script files(except yaml), SPDX license identifier i=
s expected
> >=20
> >       Why do believe a yaml file is a script file? Where did you read t=
hat?
> >=20
> >       To me, this reads like:
> >=20
> >       All fish(except zebras) live in water...
> >=20
> >       I think you can just drop that note on yaml.
> >=20
> >       > on the second line, the first line being the shebang. Sometimes=
, the
> >       > diff content includes the SPDX licensing information but exclud=
es the
> >       > shebang when a commit is made to a script file.
> >       >
> >=20
> >       You can be more explicit here. Sometimes? You can exactly say whe=
n and how
> >       that happens.
> >=20
> >       > This can be seen in the commits like commit 37f8173dd849 ("lock=
ing/atomics:
> >       > Flip fallbacks and instrumentation") and commit 075c8aa79d54 ("=
selftests:
> >       > forwarding: tc_actions.sh: add matchall mirror test"). In these=
 cases
> >       > checkpatch issues a false positive warning:
> >       > "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> >       >
> >       > I noticed this false positive, while running checkpatch on the =
set of
> >       > commits from v5.7 to v5.8-rc1 of the kernel, on the said commit=
s.
> >       > This false positive exists in checkpatch since commit a8da38a9c=
f0e
> >       > ("checkpatch: add test for SPDX-License-Identifier on wrong lin=
e #")
> >       > when the corresponding rule was first added.
> >       >
> >       > The existing logic looks for a shebang in the patch/file being =
checked
> >       > and if a shebang is encountered it directs checkpatch to expect
> >       > license on the second line by setting `$checklicenseline` to `2=
`.
> >       >
> >=20
> >       You can drop those `quotes` around variable names and numbers.
> >=20
> >       This can be written shorter:
> >       Currently, if checkpatch find a shebang in line 1, it expects the
> >       license identifier in line 2 instead of line 1.
> >=20
> >       > However, this approach doesn't work when we don't have a sheban=
g in the
> >       > patch and `$checklicensline` continues to be `1` in this case l=
eading to
> >       > the unnecessary warning.
> >       >
> >=20
> >       However, this only works when both line 1 and 2 are part of the p=
atch.
> >=20
> >       > Fix this by setting `$checklicenseline` to `2` by checking if t=
he patch
> >       > comes from a script for the cases when the shebang doesn't appe=
ar in the
> >       > patch.
> >       >
> >=20
> >       You are not really fixing it. You are improving the heuristics.
> >=20
> >       So:
> >=20
> >       Reduce the false warnings for such patches on scripts, by checkin=
g file
> >       extension.
> >=20
> >       Alternatively, you could actually also check the file permissions=
 of the
> >       file.
> >=20
>=20
> First, please fix your email client. It is broken. If you want to work in=
=20
> the kernel community, your email client needs to work as defined in the=
=20
> kernel documentation.
>=20
> Read the kernel documentation on email clients and fix your client.

Sir,

I apologize if this has been causing trouble lately.
I have been using neomutt for sending patches and Gmail for conversation.
Could you please let me know once the issues you have seen with my mailing
client so that I can address them?
>=20
> >=20
> > There are 577 executable files in the kernel, out of which 53 don't hav=
e a shebang in the first line.
> >=20
> > Moreover, in these 53 files, 8 should have definitely had it as they ar=
e .py or .sh files.
>=20
> How about fixing those eight?

Okay, I would send patches to fix this.

>=20
> > The other files are .dts, .dtsi, .S, .h, .c files, scripts/atomic/atomi=
cs.tbl file, Documentation/Changes file
>=20
> It seems wrong that those have an executable flag in the first place.
>=20
> That could be fixed as well.

Is there anything I can do to fix this?
>=20
> > and all the files
> > inside scripts/atomic/fallbacks that are without extension.
> > If I am correct none of these should have a shebang but I am not very s=
ure about files inside scripts/atomic/fallbacks.
> >=20
>=20
> Probably that whole atomics stuff needs some documentation and cleanup.

It would be great if we could do this.

Thank you.
>=20
> > If we check for file extension we warn wrongly for 120 files iff sheban=
g doesn't appear in the patch but if we check for
> > permissions we would warn wrongly for 53 files. I think this is better =
than checking for extension.
> > Should we use this heuristic in the new patch I send?
> >
>=20
> Yes, go ahead a rework your patch.
>=20
>=20
> Lukas
> =20
> > Thank you.
> >=20
> >=20
> >       Improve the patch; if it looks good then, it could be suitable fo=
r the
> >       larger discussion on lkml.
> >=20
> >=20
> >       Lukas
> >=20
> >       > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> >       > ---
> >       >=A0 scripts/checkpatch.pl | 2 +-
> >       >=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >       >
> >       > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >       > index 4c820607540b..80dfa83ed0fb 100755
> >       > --- a/scripts/checkpatch.pl
> >       > +++ b/scripts/checkpatch.pl
> >       > @@ -3167,7 +3167,7 @@ sub process {
> >       >=A0
> >       >=A0 # check for using SPDX license tag at beginning of files
> >       >=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ($realline =3D=3D $checklicens=
eline) {
> >       > -=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ($rawline =3D~ /=
^[ \+]\s*\#\!\s*\//) {
> >       > +=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ($rawline =3D~ /=
^[ \+]\s*\#\!\s*\// || $realfile =3D~ /.*\.\(py\|sh\|pl\|awk\|tc\)/) {
> >       >=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$=
checklicenseline =3D 2;
> >       >=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} elsif ($rawline=
 =3D~ /^\+/) {
> >       >=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0m=
y $comment =3D "";
> >       > --
> >       > 2.25.1
> >       >
> >       >
> >=20
> >=20
> >=20


--iywkt7q5pjpapkjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8djVUACgkQxIwpEWwx
hGQ0vxAAiznQMItVO2/08po/cSQDXlnnEITAcFQPyDTqJxLVHxEg/GKg2seGD3oH
aujCA449nZWKIMy0PCfbu9NLQviUP/VvemD89TQkShruod6Fl048KQt4rgxnLCD1
vTK6ESIhRx+qKfRNNzBnQYKZGQ/CBxVpRirCWVkvZvm8Czy40CgHw4lCkEFGbWSZ
TORovCi95fRdDBZAFw2hwJg2lg6ord8SG9Ol2HanxCYaJEUMLz/O02tdFVaEcvZq
LO/ZAEFEi25cQNdn6l3Cx3VmIqawxptw5ChRZDaXBXrJy+E3r9+Z1DXgx7au8LaN
SJqsdOVNTA44BLeyv+0l3pYKQmCTe48uaJcdhq1lnW8O5PpTfOPEpVnmIuOwfdn5
QkM0AOQ1XRAeFV77UWQMLsfL2z7P9TuUlDmPqxlklJOGjMQ/WvV2W6dF7Oh6XHPc
62wh62qCyt9TlxmS9ArFwsCyepirp6BqVoSlLjK0rc4NNm49fIYZwpaLZc+xsD9Y
4mDPF/CAhNSUoUtaz9qKV73j07DmBHmJ9X1Gk0l4umQt3YgBUHhqYUXZU9zayOtB
r+5UgouZdQep1pnrcRVL4k1DNzHDbZp5wbpT+ovc7ln2EomxnDpyWXMjsqSJ3a4f
d5xuIrCfCS9FBnsUM7zVq9FTj1KvFhQ2Zjm1i3pStBE7cWX2B9o=
=AB9p
-----END PGP SIGNATURE-----

--iywkt7q5pjpapkjz--

--===============4265184048269174373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4265184048269174373==--
