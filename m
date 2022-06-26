Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE101C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jun 2022 11:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C66A83EE8;
	Sun, 26 Jun 2022 11:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C66A83EE8
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=EP4bnODZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6SYsnU22_5o; Sun, 26 Jun 2022 11:08:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5FB2483EB0;
	Sun, 26 Jun 2022 11:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FB2483EB0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3524FC0032;
	Sun, 26 Jun 2022 11:08:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26300C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jun 2022 11:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6AE3418CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jun 2022 11:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6AE3418CF
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch
 header.a=rsa-sha256 header.s=20171124 header.b=EP4bnODZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DegTUZ3fKbIK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jun 2022 11:08:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16C7B4177E
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16C7B4177E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jun 2022 11:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=vKlqoyPKnKslJ3wEQV5XgtBsGKT7Vr7TM/ONNoU26hs=; b=EP4bnODZX7LCzr5lCEmixTYieF
 l5C7rTx7H45kcVY+a0ztUc+QVg9w21CGmdESZvJfkJhJD6Dulky2d5wGGDP//NEziZmwqSabEEaRl
 wskpkWRfQ0/fTaQIXyVlWEAToM0FWs7ycXPXIZh+wmHJbiRzya0ub39zRKbMyq011EL4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1o5Q85-008Hrf-7X; Sun, 26 Jun 2022 13:08:37 +0200
Date: Sun, 26 Jun 2022 13:08:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
Subject: Re: [PATCH] net: ethernet/nvidia: fix possible condition with no
 effect
Message-ID: <Yrg+NZHBNcu3KFXn@lunn.ch>
References: <20220626103539.80283-1-praghadeeshthevendria@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220626103539.80283-1-praghadeeshthevendria@gmail.com>
Cc: praghadeeshtks@zohomail.in, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rain River <rain.1986.08.12@gmail.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, Jun 26, 2022 at 10:35:39AM +0000, Praghadeesh T K S wrote:
> Fix Coccinelle bug, removed condition with no effect.

This is not a coccinelle bug. If it was, you would be patching
coccinelle, not the kernel.

> Signed-off-by: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
> ---
>  drivers/net/ethernet/nvidia/forcedeth.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/nvidia/forcedeth.c b/drivers/net/ethernet/nvidia/forcedeth.c
> index 5116bad..8e49cfa 100644
> --- a/drivers/net/ethernet/nvidia/forcedeth.c
> +++ b/drivers/net/ethernet/nvidia/forcedeth.c
> @@ -3471,9 +3471,6 @@ static int nv_update_linkspeed(struct net_device *dev)
>  	} else if (adv_lpa & LPA_10FULL) {
>  		newls = NVREG_LINKSPEED_FORCE|NVREG_LINKSPEED_10;
>  		newdup = 1;
> -	} else if (adv_lpa & LPA_10HALF) {
> -		newls = NVREG_LINKSPEED_FORCE|NVREG_LINKSPEED_10;
> -		newdup = 0;
>  	} else {
>  		newls = NVREG_LINKSPEED_FORCE|NVREG_LINKSPEED_10;
>  		newdup = 0;

Please google this, see the past discussion about why this code is
there.

	Andrew
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
