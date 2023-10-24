Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A535C25B47
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Oct 2023 21:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB3A040AA6;
	Tue, 24 Oct 2023 21:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB3A040AA6
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iQe7s8kc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZFGKaEk6Yqg; Tue, 24 Oct 2023 21:00:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4BCEF4016B;
	Tue, 24 Oct 2023 21:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BCEF4016B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 250F3C0039;
	Tue, 24 Oct 2023 21:00:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC3EFC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 21:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83D9570666
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 21:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83D9570666
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=iQe7s8kc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YN6n73oE3cEi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 21:00:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B09D70662
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 21:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B09D70662
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 902F26131A;
 Tue, 24 Oct 2023 21:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3334DC433C7;
 Tue, 24 Oct 2023 21:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698181225;
 bh=XbwDDDHUb0TA4KMbid2Sc5GNAmeqnpv06E3h35HAe2Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=iQe7s8kcbk8ZcKnDqSaIOceVTtM1SeTE6Uaa02iRv2eigyxoTvCbpSD7n6ua42ToO
 oBwV129sirJDu3F0qx3jEhYJiuzRw8qEkfzEIx2b9w8uNluycdGIW1DQJpID1aQyah
 u/b1VLGfbY13zgc5ase9/xd5AKdPQsUulDyzLcXbAZcc6MwFILXT+KHo9qa7eFbPk7
 QqfZKRheWk0KIa+iyXP/S7/Oj8W3lPJHyapuL97z7nsqgkHdKtD3ujbpcwRBngYPfg
 AjOZ+zzpoVCbyGHvvqXk9TbKjxrslq4AcLrfwv6OQ4jinwGMZPVexB2xGcDnpT2B1R
 whlmqJsfBeFow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0ECADC3959F; Tue, 24 Oct 2023 21:00:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] selftests:net change ifconfig with ip command
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169818122505.23262.9878970940813907976.git-patchwork-notify@kernel.org>
Date: Tue, 24 Oct 2023 21:00:25 +0000
References: <20231023123422.2895-1-swarupkotikalapudi@gmail.com>
In-Reply-To: <20231023123422.2895-1-swarupkotikalapudi@gmail.com>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Cc: jiri@resnulli.us, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 edumazet@google.com, linux-kselftest@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, davem@davemloft.net,
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 23 Oct 2023 18:04:22 +0530 you wrote:
> Change ifconfig with ip command,
> on a system where ifconfig is
> not used this script will not
> work correcly.
> 
> Test result with this patchset:
> 
> [...]

Here is the summary with links:
  - [v2] selftests:net change ifconfig with ip command
    https://git.kernel.org/netdev/net-next/c/37a38e439d4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
