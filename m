Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534F6C71153
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Sep 2023 18:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE000409AA;
	Sun, 10 Sep 2023 18:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE000409AA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MvVSVRjq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ii0PnkWsUZLw; Sun, 10 Sep 2023 18:00:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9DADB409A8;
	Sun, 10 Sep 2023 18:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DADB409A8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 849E3C0039;
	Sun, 10 Sep 2023 18:00:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39EB2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Sep 2023 18:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CE7D81753
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Sep 2023 18:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CE7D81753
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=MvVSVRjq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZUjpGSZFAqnT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Sep 2023 18:00:28 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D50AB81570
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Sep 2023 18:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D50AB81570
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9FA37CE0A89;
 Sun, 10 Sep 2023 18:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBAE2C433C9;
 Sun, 10 Sep 2023 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694368821;
 bh=aB2UE18ifINeruLLLa2U/ieX/8koQ+oI9z8xxKyuIvQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MvVSVRjqFOB3eCa3WcubwQYCaCUPa8zQFD7ptrdEGSvNLrohKfmSPe/ZoqVIpfsza
 JWpKaY2Y0z+Pj+aCXosA6wD2Jvq0w/hcp76ns+3cKuCwl8HMIFsy/t48QvymK0LV4j
 RfIMhUPofSTMLj8+c0JhugcTC6NZsHF5HPclEAeoPLPV8/WCvmJq6cuT8ofOei38iX
 Wogu5cxMObHF2bGyD31jaLAW/e7G8XUnJE3/xL6wIanepGr3H8Ndp9YywQAZd4Ekid
 NuBFJPRx5MF0YtvlMfpkht8e6j54EwLmd0nOZd8QZsZhbfai1OZWiRlzVUS7B7tHhD
 a8Els9WHw2rpg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B0E2EE505B7; Sun, 10 Sep 2023 18:00:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] selftests/net: Improve bind_bhash.sh to accommodate
 predictable network interface names
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169436882172.20878.148707165455399821.git-patchwork-notify@kernel.org>
Date: Sun, 10 Sep 2023 18:00:21 +0000
References: <VI1P193MB0752FDA6D89743CF57FB600599EFA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB0752FDA6D89743CF57FB600599EFA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
To: Juntong Deng <juntong.deng@outlook.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com,
 linux-kselftest@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 shuah@kernel.org, davem@davemloft.net,
 linux-kernel-mentees@lists.linuxfoundation.org
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

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu,  7 Sep 2023 00:26:03 +0800 you wrote:
> Starting with v197, systemd uses predictable interface network names,
> the traditional interface naming scheme (eth0) is deprecated, therefore
> it cannot be assumed that the eth0 interface exists on the host.
> 
> This modification makes the bind_bhash test program run in a separate
> network namespace and no longer needs to consider the name of the
> network interface on the host.
> 
> [...]

Here is the summary with links:
  - selftests/net: Improve bind_bhash.sh to accommodate predictable network interface names
    https://git.kernel.org/netdev/net/c/ced33ca07d8d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
