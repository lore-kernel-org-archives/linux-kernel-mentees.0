Return-Path: <SRS0=GVOk=4J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D78C35656
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 16:27:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5F2424650
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 16:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V49ASkJ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5F2424650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 91F9322170;
	Fri, 21 Feb 2020 16:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BrmZSZu2SUiU; Fri, 21 Feb 2020 16:27:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0F527220EC;
	Fri, 21 Feb 2020 16:27:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAC4AC07FE;
	Fri, 21 Feb 2020 16:27:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE517C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 16:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AD10186451
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 16:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ML7yCZBkCAQl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 16:26:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4A7F9860AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 16:26:58 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id gv17so971655pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 08:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yAiMcPC8Fsdh3sF/o6bSGnkKQ3Dm47KWIMRyu7ofJ5A=;
 b=V49ASkJ+RyKiTpOQYTvgubqkotfVDwDU7UL+/N/g32CniyMwH3T4QowQc449sGC7+1
 VQ3V4Oo2ThQ/6dfjndNgZvhFQScyYw32BkolMuZiziwg6BwTU16kt0rG5+taJ12oHxDY
 8t19kXJuIKEhuzjkx3djfELiYCAYfoBwKC0CQ7qQ+yOtaBuxk+E4iD5K5oTvv2wbCLaL
 shq37+h+AG/s4gJxHOd+gWbL8cLDGkZXoJtBiJxuVQE5S9L0+aP5+adnA/+3E35LEcI1
 smTgNhnSWMFCIQ0WRXi4xYVMRov+K3osVzVWe7M05zE1N1IEZz/MLPTM6ikkp3yOGZFn
 LE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yAiMcPC8Fsdh3sF/o6bSGnkKQ3Dm47KWIMRyu7ofJ5A=;
 b=h8oZsrtcrWzORUbQSrlBzOGyNnZHciiYmgeYsY1r5tXxUTQY8zrVuIIrKkSFlGUViv
 olSUGICCTUxioEcc6V7JRDQGr18AnyJJnwby6esfHfNvWQNmOKGmGB+eD/+61fZC78pK
 kBzLqaEr8dpmvin+ghTDYJ8nHIOdCJhrmPnlphmXm4rINbSpRvtA4LISRlCWAXC/Xt+a
 fZzsRIV6yKZlc1Tlt8MfdfKfUraaLR36vlg14Sz6xwZ+obacadJdzcsVNyjOMUonrHmP
 2A37FoaKbJE8iV7TfW2siwf3yQ9T4YYh4Lw3OfSVRz4COMQHRUiYeTwlcxt3Iita+iAF
 38cQ==
X-Gm-Message-State: APjAAAUBG5WwoDGQ7uqmhWyNEeh1ZMY9fVidXlQWHRLAbOLD4xxFFYx4
 EgiNb7jaZn/wG9om9/2FpA==
X-Google-Smtp-Source: APXvYqy6cPZ/Deoo2WCfAKDgesbS0VH8ghs5Q6eG52JEhqfDqVaOB3BBP8C8Don0YjxornSvQzSDIQ==
X-Received: by 2002:a17:90a:9b88:: with SMTP id
 g8mr4025235pjp.72.1582302417855; 
 Fri, 21 Feb 2020 08:26:57 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in ([112.79.48.60])
 by smtp.gmail.com with ESMTPSA id r8sm3031402pjo.22.2020.02.21.08.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 08:26:56 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org
Date: Fri, 21 Feb 2020 21:54:47 +0530
Message-Id: <20200221162447.23998-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] ipv6: xfrm6_tunnel.c: Use built-in
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

hlist_for_each_entry_rcu() has built-in RCU and lock checking.

Pass cond argument to list_for_each_entry_rcu() to silence
false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/ipv6/xfrm6_tunnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/xfrm6_tunnel.c b/net/ipv6/xfrm6_tunnel.c
index e11bdb0aaa15..25b7ebda2fab 100644
--- a/net/ipv6/xfrm6_tunnel.c
+++ b/net/ipv6/xfrm6_tunnel.c
@@ -78,7 +78,7 @@ static struct xfrm6_tunnel_spi *__xfrm6_tunnel_spi_lookup(struct net *net, const
 
 	hlist_for_each_entry_rcu(x6spi,
 			     &xfrm6_tn->spi_byaddr[xfrm6_tunnel_spi_hash_byaddr(saddr)],
-			     list_byaddr) {
+			     list_byaddr, lockdep_is_held(&xfrm6_tunnel_spi_lock)) {
 		if (xfrm6_addr_equal(&x6spi->addr, saddr))
 			return x6spi;
 	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
