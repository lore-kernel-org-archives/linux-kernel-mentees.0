Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441C9CCA488
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jun 2022 18:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42447408BA;
	Mon, 27 Jun 2022 18:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42447408BA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VTkRYWDj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uk5cQT9llqTd; Mon, 27 Jun 2022 18:38:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9A314408EA;
	Mon, 27 Jun 2022 18:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A314408EA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65481C0080;
	Mon, 27 Jun 2022 18:38:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62041C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 18:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F0BB83DF7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 18:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F0BB83DF7
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=VTkRYWDj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8aGNCwKRSVJW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 18:38:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9685783DF5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9685783DF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 18:38:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0EED615AD;
 Mon, 27 Jun 2022 18:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B9DC3411D;
 Mon, 27 Jun 2022 18:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656355101;
 bh=tpQhZQHIo3oAgckmaPgCZ4BNKAUK0XRiFuSAp70Cu8c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VTkRYWDjjVYa94ZaBuyuEozvQwpkROiN+nTDgabfp2ZHC/cee2Hx8BHgw1+hytmj6
 sEoo/0DTgdMw35V5KIXKGb/BvgMC6OnHs9LZhmuT/3JTcODy6ENw+XyScjZAatC/oH
 tHRNBiKZmg9p5Du1OBbQnRg5N/QrEB/J+B5w+fpZVtoMNgYhrfpvo4y8V1+/Nn/njU
 uAGEcVETRgXf94TzYpa3HjRdW3Ihx9HJq4Fe2lo4fdGw8rW4rawyvAk/0OCvukW1ZR
 lIvo/+fDZ226OOEky0wzu5BnRo6whDVUE9/X0njAvotepWFidSZWqw75CwqOxc0PEb
 JL7WIM+kIENfg==
Date: Mon, 27 Jun 2022 11:38:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] net: ethernet/nvidia: fix possible condition with no
 effect
Message-ID: <20220627113812.08ae31f0@kernel.org>
In-Reply-To: <Yrg+NZHBNcu3KFXn@lunn.ch>
References: <20220626103539.80283-1-praghadeeshthevendria@gmail.com>
 <Yrg+NZHBNcu3KFXn@lunn.ch>
MIME-Version: 1.0
Cc: praghadeeshtks@zohomail.in, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Praghadeesh T K S <praghadeeshthevendria@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rain River <rain.1986.08.12@gmail.com>,
 Zhu Yanjun <zyjzyj2000@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, "David S.
 Miller" <davem@davemloft.net>
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

On Sun, 26 Jun 2022 13:08:37 +0200 Andrew Lunn wrote:
> On Sun, Jun 26, 2022 at 10:35:39AM +0000, Praghadeesh T K S wrote:
> > Fix Coccinelle bug, removed condition with no effect.  
> 
> This is not a coccinelle bug. If it was, you would be patching
> coccinelle, not the kernel.

I'd say the commit message is better than the commit ;)
Praghadeesh, could you fix Coccinelle to avoid matching:

	if (/* case 1 */) {
		/* BLOCK 1*/
	} else (/* case 2 */ {
		/* BLOCK 2 */
	} else {
		/* default == BLOCK 2 */
	}

Because 99% of the time that construct is intentional.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
