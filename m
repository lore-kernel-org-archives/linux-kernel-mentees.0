Return-Path: <SRS0=ILBb=BO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D46C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 15:56:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 679DE208A9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 15:56:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKW8OhVk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 679DE208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2123084FA4;
	Tue,  4 Aug 2020 15:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vpcz9-lYBEd; Tue,  4 Aug 2020 15:56:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3D06F84F27;
	Tue,  4 Aug 2020 15:56:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 221FDC0050;
	Tue,  4 Aug 2020 15:56:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93157C004C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 15:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 81A238610E
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 15:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYbW6ktziUnl
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 15:56:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CF4E386108
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 15:56:45 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 17so220342pfw.9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Aug 2020 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eRdipcPz3HlwV+R/LfBjdGdCeB0VM3WbPE45efmJt+E=;
 b=EKW8OhVkEE+DMqrYxEjDqKZyVxmtynTVB9miBp81Sk6vs1xEIh4DTPBLVd5KqQth28
 UPJ89DV2bDleoe3wbbTQOy5sjT3QcwUq6O0ioi8rbbYVee5y7C1Vx+sCo3FMbTineroG
 aeRpOn25KGJdRKjKzjzI6J84QNioebc92VqoifHB1JA815ILZ61+33NWfbEWeLAcMDE2
 m2Fv7KpzKovNZ0V9bs+U5x7gCFfCtZmHLzLAqAxeAYK2AE6utZZL3L8l6fV6UqiKaOeR
 8sS2s3kI0pJV9USnIc67hyLZhfyK2gakMeIKVCp6xXGl2GnOkfCEmWrNABw852rqeqYC
 IBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eRdipcPz3HlwV+R/LfBjdGdCeB0VM3WbPE45efmJt+E=;
 b=ss1L2Z4IK2o4ozbUvs/HZWXYzcZjXg2ywgdTwrHjlr4iEg9+uvgl8AaPx3BLG4RbUG
 aGjiUAnvYE+auiMPELiNhyyLneXpJ0yjjyYo9O21b+c1sKqfJQ2QEB7nbHdaOF3GH3z3
 xkxgYholZ7xymFxrGW335Ozs60CJJgKrpejlE0X8FiJ6LuggZ1iadi1W4hte73o/Vv6m
 Tj9iDiE68mFDwWKcauGW3ujo8aMhF/X7RmHsQDu6fcWGccm5YtMX9xDY8jXDn2bwAmz9
 b+PuW3eY52c0ZB9sxJiE8q0ksrTFyPnGuoOr3o1L/NoOY31LLc/9xNWS1W6zG6uDRhvL
 VwPg==
X-Gm-Message-State: AOAM530qCoWfATgPqJfTv3JtjMyS/b/a37qRKPwaaquF1bJcLVuCONvp
 6RRUmTvNwEHJ2dNjNudqIb8=
X-Google-Smtp-Source: ABdhPJyagQAk+4MlprJP3ipax2oHYtqbNdwU0kxs0YiU91qw8pLv9Z+iSnRpoXbNNlfN/AI+/Ndx/Q==
X-Received: by 2002:a63:2324:: with SMTP id j36mr20169066pgj.221.1596556605324; 
 Tue, 04 Aug 2020 08:56:45 -0700 (PDT)
Received: from localhost ([203.90.99.21])
 by smtp.gmail.com with ESMTPSA id t10sm2885296pgp.15.2020.08.04.08.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 08:56:44 -0700 (PDT)
Date: Tue, 4 Aug 2020 21:26:40 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
 <alpine.DEB.2.21.2008031251410.8346@felia>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008031251410.8346@felia>
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
Content-Type: multipart/mixed; boundary="===============6008589835366872376=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============6008589835366872376==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q36ujxdczindw6nz"
Content-Disposition: inline


--q36ujxdczindw6nz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/08/03 12:59PM, Lukas Bulwahn wrote:
>=20
>=20
> On Mon, 3 Aug 2020, Mrinal Pandey wrote:
>=20
> > The diff content includes the SPDX licensing information but excludes t=
he
> > shebang when a change is made to a script file in commit 37f8173dd849
> > ("locking/atomics: Flip fallbacks and  instrumentation") and commit
> > 075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add matchall mirror
> > test"). In these cases checkpatch issues a false positive warning:
> > "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> >=20
> > Currently, if checkpatch finds a shebang in line 1, it expects the
> > license identifier in line 2. However, this doesn't work when a shebang
> > isn't found on the line 1.
>=20
> It does not work when the diff does not contain line 1, but only line 2,
> because then the shebang check for line 1 cannot work.
>=20
> >=20
> > I noticed this false positive, while running checkpatch on the set of
> > commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
> > This false positive exists in checkpatch since commit a8da38a9cf0e
> > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> > when the corresponding rule was first added.
> >=20
> > The alternatives considered to improve this check were looking the file
> > to be a script by either examining the file extension or file permissio=
ns.
> >
>=20
> Make this sentence shorter. Try.
> =20
> > The evaluation on former option resulted in 120 files which had a sheba=
ng
> > in the first line but no file extension. This didn't look like a promis=
ing
> > result and hence I dropped the idea of using this approach.
> >=20
> > The evaluation on the latter approach shows that there are 53 files in =
the
> > kernel which have an executable bit set but don't have a shebang in the
> > first line.
> >=20
> > At the first sight on these 53 files, it seems that they either have a
> > wrong file permission set or could be reasonably extended with a shebang
> > and SPDX license information. Thus, further cleanup in the repository
> > would make the latter approach to work even more precisely.
> >=20
> > Hence, I chose to check the file permissions to determine if the file i=
s a
> > script and notify checkpatch to expect SPDX on second line for such fil=
es.
> >
>=20
> There is no notification here. Think about better wording.
> =20
> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 4c820607540b..bae1dd824518 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3166,6 +3166,9 @@ sub process {
> >  		}
> > =20
> >  # check for using SPDX license tag at beginning of files
> > +		if ($line =3D~ /^index\ .*\.\..*\ .*[7531]\d{0,2}$/) {
> > +			$checklicenseline =3D 2;
> > +		}
>=20
> That check looks good now.
>=20
> >  		if ($realline =3D=3D $checklicenseline) {
> >  			if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {
> >  				$checklicenseline =3D 2;
>=20
> This is probably broken now. It should check for shebang in line 1 and=20
> then set checklicenseline to line 2, right?

Sir,

Should we remove this check? Earlier when I checked for file extension
we had 120 cases where this check was also needed but now we have a
better heuristic which is going to work for all cases where license
should be on line 2 irrespective of the fact that we know the first line
or not.

If I am missing out on something and we should not be removing this check,
then I suggest placing the new heuristics below this block so that it doesn=
't
interfere with the existing logic.

Please let me know which path should I go about and then I shall resend
the patch with the modified commit message.

Thank you.
>=20
> > --=20
> > 2.25.1
> >=20
> >=20

--q36ujxdczindw6nz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8phTEACgkQxIwpEWwx
hGTwIw/+IhDiq5Qqtga89yGpe7wrHdRhn6hyXnQdKJs+EcEB8kYONkTcV0xtmhEk
OsQCEZ5Om+gS8SZS5QpGITUSN8SJwb1w1VSWTwCyzbB3hNHhSLFZ8HKzS2Npx4XC
sN7aE2laeFfdIBV7E4G5wDMIJzifJOhFj+3BZRo7okCkylaMFM+MAxFasY2jSPkZ
B66TAQXUUvrv9gJZG9dF0NRFXBeTIWX2EZAh2otCiFqh0lBz1gUCV5h9lFCWrHoN
HH0uuQDPszcGRv24K6Jv5478NuIQzQXAfRvUFkA9SHoPF/MfyY/Zp0TV6PV+x6I5
zjpd8hRErKUBgCqbnezCHX9MRf6JsnZA/l3f1B7oHAyMPt1JYsxdxtCalI1ZLDVe
moM42wEYDGA+QqrOEA/n7JVCAK5kPyKRxduvqpIkGJKB9nPimjMmERVbUeyG/Dor
H9E6wJLTKR6GrhjSltyHxlBPBvQeRJbcuqv7GiTxR2vZkKzVJRbSgLQqdn4k0Z15
BRveL+qCs7RK/JgVwxkCBTrRgA8TXxa9PF7o6hXeaZ4PMsysxD2CbiMbBwLttsd8
ReYgQYtvew2kXbJbKNUFkhV79UMm7BUIdkBMZo4+qyguKGKmIGj4tRE2VRFnhfiV
e72oOnGdocgSzcJJUlwbSbsuApy03rh+pnw/G4vfwlu4bbQnou8=
=MNVe
-----END PGP SIGNATURE-----

--q36ujxdczindw6nz--

--===============6008589835366872376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6008589835366872376==--
