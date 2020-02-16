Return-Path: <SRS0=3/iO=4E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0924C2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 15:36:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B661820857
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 15:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="B62hACUi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B661820857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 931BB84C3C;
	Sun, 16 Feb 2020 15:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ThFspmpMGqT; Sun, 16 Feb 2020 15:36:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C1A384CCE;
	Sun, 16 Feb 2020 15:36:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 278D0C07FF;
	Sun, 16 Feb 2020 15:36:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CE7DC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 65E0284CCE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idXBecWYpqW5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:35:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2B2E984C3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1581867357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ERM3RGanh1fJgg7kpnX8A1AoqKzN5Z7w2qMVfhCXT1I=;
 b=B62hACUiCwcx0eJVymY+ugJzprPBeXkRoSzSZAHbzM4bleKfk4DDX6TUntzaHJKanWzBnk
 D1HxNnRqj64HXoh1XTy5wSRdUXKwpTmMgvcCNaEqpOK8iku8iNtg6+e3jxpjxeka9e2G/H
 Sk6wU7zF21xY4t1PKhmMROuotTo+VII=
From: Sven Eckelmann <sven@narfation.org>
To: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Date: Sun, 16 Feb 2020 16:35:54 +0100
Message-ID: <1634394.jP7ydfi60B@sven-edge>
In-Reply-To: <20200216153324.GA4542@madhuparna-HP-Notebook>
References: <20200216144718.2841-1-madhuparnabhowmik10@gmail.com>
 <3655191.udZcvKk8tv@sven-edge> <20200216153324.GA4542@madhuparna-HP-Notebook>
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
Content-Type: multipart/mixed; boundary="===============0073131788949402043=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0073131788949402043==
Content-Type: multipart/signed; boundary="nextPart2119546.QtC4LbVagd"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2119546.QtC4LbVagd
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, 16 February 2020 16:33:24 CET Madhuparna Bhowmik wrote:
[...]
> > Can you tell us how you've identified these four hlist_for_each_entry_rcu?
>
> The other hlist_for_each_entry_rcu() are used under the protection of
> rcu_read_lock(). We only need to pass the cond when
> hlist_for_each_entry_rcu() is used under a
> different lock (not under rcu_red_lock()) because according to the current scheme a lockdep splat
> is generated when hlist_for_each_entry_rcu() is used outside of
> rcu_read_lock() or the lockdep condition (the cond argument) evaluates
> to false. So, we need to pass this cond when it is used under the
> protection of spinlock or mutex etc. and not required if rcu_read_lock()
> is used.

I understand this part. I was asking how you've identified them. Did you use 
any tool for that? coccinelle, sparse, ...

Kind regards,
	Sven

--nextPart2119546.QtC4LbVagd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl5JYVoACgkQXYcKB8Em
e0ZuPRAAmCB3qGjKpbrldhlDz7BJwE/RY7I7K2zMd0bsx9IV/WmU0fmsplSNNf9m
m7LaBD/F+4BxSBvaPlE19OXOTLurtetpsL9J7/RgP67jl9SBGglvTwNUtx45PoNZ
QTteXCARAK9DpzpYJzMZjeplDkJ0kH7OmTFlDypKNxFyRH+29ePII0TADeYfRo/7
B9TYrS/sT/idL15gm1KimGNbwjUpr+9KlBg6ASs2HlhhX/dI5Ah2Cpt9xZYD4FZ+
IF5AsS+s0wEln3Yycd4xyHEHUoYrP+MjF9k7MR+o7EalZD3/2LDUUPGy8akkkZ36
xOgDyfVVOWQ6Ew6r1fl5Tty4pz3Kkt7HewRsOkPUkJrX6JvxGoq+FlxEJwDv0oL7
fLsCl/A3otfLCqxGTlZaIKOJmBg1t/eeFGHx6c31yza6HxgH3X8uQ7i6RtRy7Vac
FNciX8lPZjqjldm3rRpVweopBB/11v72mZRsV/L50tx1piVfQtmYvtseSXPvyTfS
mQufCXGXdZ0UI6rVda9bzzO7Yi1c+I2sczMw5YA7mDrAeEWldVBT/mcJsoRTz4dh
uWGnh+fUbD5GFOSnkctXZkN4BVN75ZGztTfcsDdOF9Aa+JOq6mrljeSPsAgKxuly
DhbSVonE5CHUVgCD/4Mv8phrEbKRIBPbFFZjlmQ9fKz6cT+Rz/s=
=AU3U
-----END PGP SIGNATURE-----

--nextPart2119546.QtC4LbVagd--




--===============0073131788949402043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0073131788949402043==--



