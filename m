Return-Path: <SRS0=EZza=B6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81971C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 Aug 2020 22:38:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0628820674
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 Aug 2020 22:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="twbOspkk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0628820674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB8A08851E;
	Thu, 20 Aug 2020 22:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVvSzZw07lEM; Thu, 20 Aug 2020 22:38:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 827FB86FAF;
	Thu, 20 Aug 2020 22:38:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DB1EC0889;
	Thu, 20 Aug 2020 22:38:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0550C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 22:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CC6B684C29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 22:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sfKfXVevWEqS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 22:38:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9F00684AD2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 22:38:47 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BXfh26lXPz9sPB;
 Fri, 21 Aug 2020 08:38:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1597963123;
 bh=F1zcYsdZEtWVf/zph6DxdSSfdnjlkS+N4xOJss6GUmU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=twbOspkkBIkYtrG22l8cHZJMJ874DskZKQSqUK/BojIL90zIYlRaszfuWRwzfeyK9
 HvAP/5WyOgFxt8eEsZrsc1+YPGInbkR5J68Rf8oLW52dh6rMauQpPwmUyAwmNWFyZX
 iLmgngRaeYPOMYGLkKSLxCKcXfsKrpYHinTUIMSA/pEtoMOH2z/jL5W6DZadhAP5hn
 ufpw1rO/nlW2VbIZDXV32TLdVwGe5lJsKlnG+MugFuPMgA0SmUC9WUBKaqdN2n8k/M
 ane0XFbh+mu6rDjRT0iAW3xk+j427833EGIWtWdEcDObxxVOvdQaW41EwchCp4oZci
 lvytoweLXSwBw==
Date: Fri, 21 Aug 2020 08:38:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: James Morris <jmorris@namei.org>
Message-ID: <20200821083841.2ff9e0c3@canb.auug.org.au>
In-Reply-To: <alpine.LRH.2.21.2008210427590.29407@namei.org>
References: <20200406105950.GA2285@workstation-kernel-dev>
 <20200607062340.7be7e8d5@canb.auug.org.au>
 <20200607190840.GG4455@paulmck-ThinkPad-P72>
 <20200608041734.GA10911@mail.hallyn.com>
 <20200817120731.218e1bc5@canb.auug.org.au>
 <alpine.LRH.2.21.2008210427590.29407@namei.org>
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
Content-Type: multipart/mixed; boundary="===============6534442601722347916=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6534442601722347916==
Content-Type: multipart/signed; boundary="Sig_/a_eM9dyE5z92OcSM1Vl5uSN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/a_eM9dyE5z92OcSM1Vl5uSN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

On Fri, 21 Aug 2020 04:28:34 +1000 (AEST) James Morris <jmorris@namei.org> =
wrote:
>
> On Mon, 17 Aug 2020, Stephen Rothwell wrote:
>=20
> > > > mainline, so it can go up any tree.  I can take it if no one else w=
ill,
> > > > but it might be better going in via the security tree. =20
> > >=20
> > > James, do you mind pulling it in? =20
> >=20
> > I am still carrying this patch.  Has it been superceded, or is it still
> > necessary? =20
>=20
> It appears to be necessary.
>=20
> Applied to
> git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git =
fixes-v5.9

Thanks, I have dropped my copy.

--=20
Cheers,
Stephen Rothwell

--Sig_/a_eM9dyE5z92OcSM1Vl5uSN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8++3EACgkQAVBC80lX
0GyaTAf+IaxI9JhgNTkeBKSvhvhEo7K22MCpbRAH+wHik1W7k/hlpLkHMBuHfkIZ
NlRQFvJkPc950k5rSeWxE0+/53XCK2lnnp7tThfD0Xh8YyOk6kXX+kNhzfNAHFSn
a66Fm7lsC8jtjicjGx9QN//v/ZsEn96vQsCECZ60Hll9iIG4tMOEqD4wdoHNVshH
GyzzvPYAw0SLakK06GC0v8Xxsk8587SeGaTYG0SDyo1Fx955poQqfeMbwIWNXP4K
Qt7QI4yKli5iDBLmWeQnhVpEiZea5p1oUfttOBp10zlhcWXm8ewZKzk6zG/0+lXu
+v5s3BQf4z2bdOg4hsz18vLQ7f7BeQ==
=gRVV
-----END PGP SIGNATURE-----

--Sig_/a_eM9dyE5z92OcSM1Vl5uSN--

--===============6534442601722347916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6534442601722347916==--
