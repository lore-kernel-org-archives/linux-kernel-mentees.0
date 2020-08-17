Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6033FC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 02:07:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1826E2078A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 02:07:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Y5P7UBdU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1826E2078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C0D102051D;
	Mon, 17 Aug 2020 02:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxtmvyFJAls0; Mon, 17 Aug 2020 02:07:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9655120507;
	Mon, 17 Aug 2020 02:07:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A7E3C088B;
	Mon, 17 Aug 2020 02:07:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16ED7C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 02:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F37CF87896
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 02:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bP-QbD4ZaLvd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 02:07:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B02238780A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 02:07:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BVHVt2tgsz9sTK;
 Mon, 17 Aug 2020 12:07:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1597630055;
 bh=NUVL7wCS3C8AjNkO2+T076Su0229oneQ8GpXoq1sVvU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y5P7UBdUOrLfq15c3+yrX4hNJWlKwBdrKEbO8tlxw0ZVi2cZFHtIr+yJ4e8YPwmzR
 g46Pt4KUM4u7jB+Mv9FqHIDw1vwRlBY7kasTmjYHk0L5KQRHDJz/qG1FQh+pDLwZ6D
 W6aVMYc/yWy9CLPsDlep0dlgdut718OAA4BgbZqLhKZ3y/CNVKrH0/hZ/nxdGf/v25
 qBIJqNXV+/Y254JsnPQD0UU8KReuWTA5iQ4icYxTxEsyWRrtleh0QpEVOFpDKdUnG3
 H2IIqDFGIVPF8tlY6sUHJFalhjnD3/cImvI4GJNx2bwyDYu9tPq4IoXediWbO4L4y1
 N97kpC0IJMJJQ==
Date: Mon, 17 Aug 2020 12:07:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Amol Grover <frextrite@gmail.com>, James Morris <jmorris@namei.org>
Message-ID: <20200817120731.218e1bc5@canb.auug.org.au>
In-Reply-To: <20200608041734.GA10911@mail.hallyn.com>
References: <20200406105950.GA2285@workstation-kernel-dev>
 <20200607062340.7be7e8d5@canb.auug.org.au>
 <20200607190840.GG4455@paulmck-ThinkPad-P72>
 <20200608041734.GA10911@mail.hallyn.com>
MIME-Version: 1.0
Cc: "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 linux-security-module@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [Linux-kernel-mentees] [PATCH RESEND] device_cgroup: Fix RCU
	list debugging warning
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
Content-Type: multipart/mixed; boundary="===============0225572120343982759=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0225572120343982759==
Content-Type: multipart/signed; boundary="Sig_//6LbZg5fP0ZKmOnWMaIHeAu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//6LbZg5fP0ZKmOnWMaIHeAu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, 7 Jun 2020 23:17:34 -0500 "Serge E. Hallyn" <serge@hallyn.com> wrot=
e:
> On Sun, Jun 07, 2020 at 12:08:40PM -0700, Paul E. McKenney wrote:
> > On Sun, Jun 07, 2020 at 06:23:40AM +1000, Stephen Rothwell wrote: =20
> > >=20
> > > On Mon, 6 Apr 2020 16:29:50 +0530 Amol Grover <frextrite@gmail.com> w=
rote: =20
> > > >
> > > > exceptions may be traversed using list_for_each_entry_rcu()
> > > > outside of an RCU read side critical section BUT under the
> > > > protection of decgroup_mutex. Hence add the corresponding
> > > > lockdep expression to fix the following false-positive
> > > > warning:
> > > >=20
> > > > [    2.304417] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > [    2.304418] WARNING: suspicious RCU usage
> > > > [    2.304420] 5.5.4-stable #17 Tainted: G            E
> > > > [    2.304422] -----------------------------
> > > > [    2.304424] security/device_cgroup.c:355 RCU-list traversed in n=
on-reader section!!
> > > >=20
> > > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > > ---
> > > >  security/device_cgroup.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/security/device_cgroup.c b/security/device_cgroup.c
> > > > index 7d0f8f7431ff..b7da9e0970d9 100644
> > > > --- a/security/device_cgroup.c
> > > > +++ b/security/device_cgroup.c
> > > > @@ -352,7 +352,8 @@ static bool match_exception_partial(struct list=
_head *exceptions, short type,
> > > >  {
> > > >  	struct dev_exception_item *ex;
> > > > =20
> > > > -	list_for_each_entry_rcu(ex, exceptions, list) {
> > > > +	list_for_each_entry_rcu(ex, exceptions, list,
> > > > +				lockdep_is_held(&devcgroup_mutex)) {
> > > >  		if ((type & DEVCG_DEV_BLOCK) && !(ex->type & DEVCG_DEV_BLOCK))
> > > >  			continue;
> > > >  		if ((type & DEVCG_DEV_CHAR) && !(ex->type & DEVCG_DEV_CHAR))
> > >=20
> > > I have been carrying the above patch in linux-next for some time now.
> > > I have been carrying it because it fixes problems for syzbot (see the
> > > third warning in
> > > https://lore.kernel.org/linux-next/CACT4Y+YnjK+kq0pfb5fe-q1bqe2T1jq_m=
vKHf--Z80Z3wkyK1Q@mail.gmail.com/).
> > > Is there some reason it has not been applied to some tree? =20
> >=20
> > The RCU changes on which this patch depends have long since made it to
> > mainline, so it can go up any tree.  I can take it if no one else will,
> > but it might be better going in via the security tree.
>=20
> James, do you mind pulling it in?

I am still carrying this patch.  Has it been superceded, or is it still
necessary?

--=20
Cheers,
Stephen Rothwell

--Sig_//6LbZg5fP0ZKmOnWMaIHeAu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl855mMACgkQAVBC80lX
0Gz3+Qf7B8fFdkNeo/Cqcxhz3GWuAnNd4IeG9m8dsl67F77sOJ7U8WNnX95ZsmAw
TWCTwMDVm07rUAoqBu6uz3GxgpYTpP8lM/j4Q37kSuR3xVb6spXMyIM4J3hHC2Tz
J9pHZyBomsYrRdcAMIY2WumPPo2euve4S1MesruCJLvcA7kRrgsO3VMtPMdY72LC
5xFffg3NVRvkrJb4njqABLk9SgQObnMzBQdXYpKEy3b2XTGtQHb0T8JMc101xrnA
PxlA2JQP2T7h/HEDuK4+Nm2PbeNonAviErZjnTvRpAP6krQ9YM0wdxPVmfaFjoa3
5X0NEOx5ikRI+XktkfuPmLUeiAzmYQ==
=Nz8C
-----END PGP SIGNATURE-----

--Sig_//6LbZg5fP0ZKmOnWMaIHeAu--

--===============0225572120343982759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0225572120343982759==--
