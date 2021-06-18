Return-Path: <SRS0=f3wf=LM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29461C48BDF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 20:10:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD66613F0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 20:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD66613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A7564029B;
	Fri, 18 Jun 2021 20:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfEtKL25kdqu; Fri, 18 Jun 2021 20:10:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6E318401EE;
	Fri, 18 Jun 2021 20:10:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42B0FC000D;
	Fri, 18 Jun 2021 20:10:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81562C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 20:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C2DC60716
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 20:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZOOqv_VCqm0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 20:10:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA8A5606C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 20:10:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5CC44613C2;
 Fri, 18 Jun 2021 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624047004;
 bh=fQ7TmNp/wbrGhCgwdpBrWfCZOYK2Tt4Wai0IcqJ4Qj0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=YUsIeym9SWlurM5obUS3jSEf0NX9gTNnyyug0Kt/UYLbwGA56p2wGJzUe3TqqQ4Nd
 JK5oNEXQh7yhQgkALIfB2u8bpknWsa51VFbGwBzlcEdm9M0TaBGRQKMiOoZVI9EaPc
 OlThjvUbz4Wt4rqPRKgxnAyUxcs73ARyoMarDP+/7VytMAb9Fic0tZ3RuMUQX1v8oX
 fLoodk/YEOG1TQaPAP1Pws3AJNUW7iKKAK+UhMA0Amn2fkH20UadH9uFMLjmpscYAz
 LeFX800FwOi1D5pvHRCuEZ1AymdFas74TnU9Fk1zlsiOHEa5IvsNBuwNGJwshSt0OK
 9jsqS9jh1yPTw==
MIME-Version: 1.0
Subject: Re: [PATCH] net: ethernet: fix potential use-after-free in
 ec_bhf_remove
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162404700432.5742.11129336023473199529.git-patchwork-notify@kernel.org>
Date: Fri, 18 Jun 2021 20:10:04 +0000
References: <20210618134902.9793-1-paskripkin@gmail.com>
In-Reply-To: <20210618134902.9793-1-paskripkin@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, reksio@newterm.pl,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
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

On Fri, 18 Jun 2021 16:49:02 +0300 you wrote:
> static void ec_bhf_remove(struct pci_dev *dev)
> {
> ...
> 	struct ec_bhf_priv *priv = netdev_priv(net_dev);
> 
> 	unregister_netdev(net_dev);
> 	free_netdev(net_dev);
> 
> [...]

Here is the summary with links:
  - net: ethernet: fix potential use-after-free in ec_bhf_remove
    https://git.kernel.org/netdev/net/c/9cca0c2d7014

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
