Return-Path: <SRS0=xAfA=LN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320F7C49EA2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Jun 2021 19:30:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2549611CC
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Jun 2021 19:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2549611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F95D40412;
	Sat, 19 Jun 2021 19:30:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMxUON36IJvK; Sat, 19 Jun 2021 19:30:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 677EE403E6;
	Sat, 19 Jun 2021 19:30:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B5B1C0010;
	Sat, 19 Jun 2021 19:30:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 415BEC000C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Jun 2021 19:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 221E640240
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Jun 2021 19:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JR6s-nrZr9NN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Jun 2021 19:30:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42FFD401FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Jun 2021 19:30:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A0C4F60E08;
 Sat, 19 Jun 2021 19:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624131003;
 bh=44te2zktC7sJxqYNg9H5C4Bd+o+5Z9lbhNTfooBw+Wk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=dGzTNs3uJz1bMe6hKu7IEQmuo21jG+Tx6uICFz6qmHKxUDlpQ8f4wUvkBvjejjjr/
 hQ+/N1ghw6y4/XMOc0LyS2yQDatTVqRhoVouliTCt5FE1NwSsNFONscQa5FaCnXSf7
 E7B1u5WVEhN8k/FX8BdxviDFLFBVpWQzRptXi+R++eBsfPeHX5IylTjO1O9+qKQosH
 uiTobH+FV5Cz1wWJz4t9RQjZp1a/MEwMvF/ATKrVR63SI9Q2AzDfZGQfGWa4ucepTu
 9ASWQ1owsOuPpflQlt0gRxEa65WUp+ONcKR9l6SSmJSBKrNISoIDntiXficH288dxZ
 6nKqKmm3UoR4w==
MIME-Version: 1.0
Subject: Re: [PATCH] net: ethernet: aeroflex: fix UAF in greth_of_remove
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162413100358.3389.13847175679674551696.git-patchwork-notify@kernel.org>
Date: Sat, 19 Jun 2021 19:30:03 +0000
References: <20210618145731.32194-1-paskripkin@gmail.com>
In-Reply-To: <20210618145731.32194-1-paskripkin@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: andreas@gaisler.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, kristoffer@gaisler.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri, 18 Jun 2021 17:57:31 +0300 you wrote:
> static int greth_of_remove(struct platform_device *of_dev)
> {
> ...
> 	struct greth_private *greth = netdev_priv(ndev);
> ...
> 	unregister_netdev(ndev);
> 	free_netdev(ndev);
> 
> [...]

Here is the summary with links:
  - net: ethernet: aeroflex: fix UAF in greth_of_remove
    https://git.kernel.org/netdev/net/c/e3a5de6d81d8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
