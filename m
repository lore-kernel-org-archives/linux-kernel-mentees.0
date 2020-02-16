Return-Path: <SRS0=3/iO=4E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B0EC2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 15:32:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FCDF20857
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 15:32:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="HW6kDIwY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FCDF20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2BE838589A;
	Sun, 16 Feb 2020 15:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IjevFYOEZkgw; Sun, 16 Feb 2020 15:32:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AFACD85735;
	Sun, 16 Feb 2020 15:32:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92F56C07FF;
	Sun, 16 Feb 2020 15:32:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B00DEC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A1BA987702
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gu8FpjCyw75M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:32:36 +0000 (UTC)
X-Greylist: delayed 00:09:38 by SQLgrey-1.7.6
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3265A875C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1581866575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cpdOcA58injpURGtSPsNzFe0grHOYuzlAQi9FRcp3jo=;
 b=HW6kDIwYOmPotOs48kEhWYO6IC8mZ4g7oYDcPbeZ5p5A78FImbNhEKtyOqVoKz4Fz+zSaj
 F4i1vN0uJyypV2ECTLzN7RO4t2SSlFVaib0Ksp6iNROmpNDeGMOlRjbRKWfuSVck4cU0xg
 aTlFELlnV5CmO2IQlr1kvQ83MYofsQ8=
From: Sven Eckelmann <sven@narfation.org>
To: madhuparnabhowmik10@gmail.com
Date: Sun, 16 Feb 2020 16:22:51 +0100
Message-ID: <3655191.udZcvKk8tv@sven-edge>
In-Reply-To: <20200216144718.2841-1-madhuparnabhowmik10@gmail.com>
References: <20200216144718.2841-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Cc: mareklindner@neomailbox.ch, sw@simonwunderlich.de, netdev@vger.kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org, a@unstable.cc, linux-kernel@vger.kernel.org,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: batman-adv: Use built-in
	RCU list checking
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
Content-Type: multipart/mixed; boundary="===============3905028233848254146=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3905028233848254146==
Content-Type: multipart/signed; boundary="nextPart4752270.j9do8LSKhE"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4752270.j9do8LSKhE
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, 16 February 2020 15:47:18 CET madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> hlist_for_each_entry_rcu() has built-in RCU and lock checking.
> 
> Pass cond argument to hlist_for_each_entry_rcu() to silence
> false lockdep warnings when CONFIG_PROVE_RCU_LIST is enabled
> by default.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> ---
>  net/batman-adv/translation-table.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Added with alignment and line length codingstyle fixes [1].

Can you tell us how you've identified these four hlist_for_each_entry_rcu?

Thanks,
	Sven

[1] https://git.open-mesh.org/linux-merge.git/commit/967709ec53a07d1bccbc3716f7e979d3103bd7c5

--nextPart4752270.j9do8LSKhE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl5JXksACgkQXYcKB8Em
e0ZGNBAAxAZydcMX765z0LHHxzM2VVRThEsnS17DaDQDU7oTIinL6xe83lBPbQuh
zQDyZUlFlz5UDRbHnq2w/UMmq/haEXfp47se+S4GOsg7M4R38P8XC97XC1BlTOGu
oXyJjOp2d3G3awn6GD4G1P8AVCkVc8gVp6pDFNFy7OVfJwXvYbMaCtH8xXhS2pcK
c3oO+roFvXtBMCb44e8lc0xHRrBUiTBBIKoLcJSbPUmDRSOg70Rojk5AmiMIZ7Ts
UbNC1faFYh2HJlc+b/b7jDx69eopdxRMQOxZeypmDtu3HnJTQEK/5b/gB00Ajs4e
RDJyOimN1ri/2DI5hMWpJyYts/uutSDHDwRwXytVsoUS3vMVE17LWTn/mTBu5m2n
qodGmZbrbLKM2aMYU9b5aCtJlAoZ5osEd3UbL0zDE0TZG+x8orzffsQagMaihcez
Ybny70xUDlZgGBzTCuCGNhBN7CkREdHiBUNg+Ff02xx5uQTvpN9Pxgo4g+bXXlPs
rDspCwY+EC+KWURxdnVPO4x5tSRmzq4gKvL0dMBeiz06m+u1zK+DCQ0lodV76bY1
ILPm/EwMGiMdO8h5IlwJh5w7T+Kgl+PnT8vwRLXFjfgpYf24D3ihw/1uDLGk7t4Q
W1mipeOUSdpfDYNF8mTqJ48vhSlJf0zICr9iY0p+hmwAnPcCEfA=
=2x+h
-----END PGP SIGNATURE-----

--nextPart4752270.j9do8LSKhE--




--===============3905028233848254146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3905028233848254146==--



