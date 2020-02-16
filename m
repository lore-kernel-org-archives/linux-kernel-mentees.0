Return-Path: <SRS0=3/iO=4E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F24C2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 16:17:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 269F820857
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 16:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="zMk1rHpH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 269F820857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F327F86004;
	Sun, 16 Feb 2020 16:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIKljxEY+cVW; Sun, 16 Feb 2020 16:17:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7565F85FC0;
	Sun, 16 Feb 2020 16:17:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69D0DC08A0;
	Sun, 16 Feb 2020 16:17:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9563C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 16:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AED66203E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 16:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g37sETD-8h2h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 16:17:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
 by silver.osuosl.org (Postfix) with ESMTPS id 5CB8320104
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 16:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1581869862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ycDGsIuRvIAvHC8M9jSWoOHJ+C/adZPAoQJAg4MOHh0=;
 b=zMk1rHpHJsElWdVbsSg4ZDZMx5E98D/6dpZl5fZ7/wTxbWc59OHrFcAPUL4dFRogbZ6BVR
 a2bf3WJenvnoXSI5J9ZK/6Ud5A8BUs7+CfYLzru/8x4teDCFj3+iU4/214121/5rIFYCMC
 8hsv797rAa9Y+pWYK8gV6jiuYAOJuZ8=
From: Sven Eckelmann <sven@narfation.org>
To: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Date: Sun, 16 Feb 2020 17:17:36 +0100
Message-ID: <14125758.fD4hS3u3Vl@sven-edge>
In-Reply-To: <20200216155243.GB4542@madhuparna-HP-Notebook>
References: <20200216144718.2841-1-madhuparnabhowmik10@gmail.com>
 <1634394.jP7ydfi60B@sven-edge> <20200216155243.GB4542@madhuparna-HP-Notebook>
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
Content-Type: multipart/mixed; boundary="===============6832775498222064947=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6832775498222064947==
Content-Type: multipart/signed; boundary="nextPart2027361.KDeqtIc2Nz"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2027361.KDeqtIc2Nz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, 16 February 2020 16:52:44 CET Madhuparna Bhowmik wrote:
[...]
> > I understand this part. I was asking how you've identified them. Did you use 
> > any tool for that? coccinelle, sparse, ...
> 
> Not really, I did it manually by inspecting each occurence.

In that case, I don't understand why you didn't convert the occurrences from 
hlist_for_each_entry_rcu to hlist_for_each_entry [1]. Because a manual
inspection should have noticed that there will always be the lock around
these ones.

KInd regards,
	Sven

[1] https://www.kernel.org/doc/html/v5.6-rc1/RCU/whatisRCU.html#analogy-with-reader-writer-locking
--nextPart2027361.KDeqtIc2Nz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl5JayAACgkQXYcKB8Em
e0arqxAAs2BMDdBX1BL6F26UneTAZ8w5R8MOruf6/NJycj1OzwF9X96BeX0cyj4q
Gnryzgqb3/LXfZPWhF2HSLjuPeVjgiJOoF5S+3n9R00k0Oitqo53gFHirNzLqFYu
bJThufWSFbq3agNcYgrjYe15pyOe46r9Vt/aGyjVsvX+f8J/7PRFCTkznhluzo9C
tmLWbM4tbVJu8JDUD3PY/vR9SxPShYqDOlFz45bqmzHb7Dcr2fLYZC/jlbzd5af+
xTNCsjsk2U9pwR+te1MaIqJ6BDrIljis4HXLCdAMuL5ny1QKrNL1Hj/iS9ycxCnh
1lUNi0HGdRtGcpXbRBIiLkykMJMiIZoep+PkP5CND2WELURBBRVrys8xvwDD3mxJ
xdvhXKAkMv2qaJpbGIQWEf/p+UDbXQXr9Xa1UeUOOHjpC8eNm1FYtKKzTL0W74lE
9KSt086kB2Y9pUMAGQWoIDyb1QKTxQV+jzx9YJEL2AzGO0NEwd+d0UJrxXX+qNbF
BKd+EqdAIR/PfAp2pA4PIxAvieu9Z3jCnXkEURkhS19Rgu1G/0iBq6p8abj+CW8a
7OBNe+13SISLc0rMoX/nbH/Pwxq9MlqRJifFr05S77mKEvdNS8tz0KwN/ZVMSfA+
2dDdXfKzPo3BGnfSOtj7G1wgUMBWOFXVLnFytQEyYXMdlWC47Ks=
=70Ud
-----END PGP SIGNATURE-----

--nextPart2027361.KDeqtIc2Nz--




--===============6832775498222064947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6832775498222064947==--



