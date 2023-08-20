Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27FEEE49A4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Aug 2023 18:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B95380A6D;
	Sun, 20 Aug 2023 18:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B95380A6D
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kXp8N2pS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qc9akgiSxQzG; Sun, 20 Aug 2023 18:13:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6D95480A75;
	Sun, 20 Aug 2023 18:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D95480A75
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E668C0039;
	Sun, 20 Aug 2023 18:13:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6458EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 18:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E4104034A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 18:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E4104034A
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=kXp8N2pS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRO_dNNhbr6Q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 18:13:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59B2D4032D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Aug 2023 18:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59B2D4032D
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8097C61C52;
 Sun, 20 Aug 2023 18:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8F47C433C9;
 Sun, 20 Aug 2023 18:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692555205;
 bh=/kpJeZbH3cX6qT2GDtIuHy2iJvRa2GYhxoTx6CJOFFI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kXp8N2pS3j1Rb+VfljKd5QPj9dtcUAVoSDyX8WpiLtnSv1WfKXk/pxlvwrrxPNKE0
 RdPTNqZfetiHBrctAspxP8A3DeG2hNy24+GhnC9OLmJmtL/CGTTgYgwx0TDNgVYbgu
 47d8Qv7cuehiveyQEh0KfBf1IYgAcLpDghX+aB1cTQQUiFWIZRcHoAtxiIp5cichLv
 o9bZQZSRsuOMgMmtYMxrXEbdrbzBAFypjNfn4ujqTpdGP7EhB5yVz7PL7P4whhMS4p
 GqAvEjlrtFEGBfOP+Tsbq2QkAjewtUVL+BNOkmADfvSfpK6RS3JjXQ6PZt9KXrLTu7
 OyxF3113TiuYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C1084E26D32; Sun, 20 Aug 2023 18:13:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] selftests/net: Add log.txt and tools to .gitignore
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169255520578.4244.2265053947731100162.git-patchwork-notify@kernel.org>
Date: Sun, 20 Aug 2023 18:13:25 +0000
References: <20230818173702.216265-1-tuananhlfc@gmail.com>
In-Reply-To: <20230818173702.216265-1-tuananhlfc@gmail.com>
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Cc: netdev@vger.kernel.org, edumazet@google.com,
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

On Sat, 19 Aug 2023 00:37:02 +0700 you wrote:
> Update .gitignore to untrack tools directory and log.txt. "tools" is
> generated in "selftests/net/Makefile" and log.txt is generated in
> "selftests/net/gro.sh" when executing run_all_tests.
> 
> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
> ---
>  tools/testing/selftests/net/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - [v1] selftests/net: Add log.txt and tools to .gitignore
    https://git.kernel.org/netdev/net/c/144e22e7569a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
