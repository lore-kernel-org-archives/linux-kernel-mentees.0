Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323A7C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Aug 2023 22:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7BCE81FD5;
	Tue,  1 Aug 2023 22:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7BCE81FD5
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q7jZlrsA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27nJ1YxHQ6Xk; Tue,  1 Aug 2023 22:00:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AF6A880B0E;
	Tue,  1 Aug 2023 22:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF6A880B0E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EDB3C0072;
	Tue,  1 Aug 2023 22:00:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB8B8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 22:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94D91417D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 22:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94D91417D7
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=Q7jZlrsA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5B9EhI1_UBFL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 22:00:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF1D84189E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 22:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF1D84189E
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DFD506175A;
 Tue,  1 Aug 2023 22:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB012C43391;
 Tue,  1 Aug 2023 22:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690927226;
 bh=TfTWerrT151QkA9LdcUjyC/O6PsLiVHfw7rM1IQ6jMQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Q7jZlrsAOvLcG8zlqTXiRuz8wEHuiC53UF7AQ4XXdtmBD1YfwpxC8P4JJYAnfqO2m
 vor/Oy9m1cWPiJ7cCbP+H2Hg1KbPLuxyJVC6a9fb0eJMHWZoPf5Dy+DrrVKYxnJAlo
 AH2U572+qg/yKotNzj2NQT4AY3nJjMMy6Z72dc/qu7y+dEOZrZMHi1lsHffamQDWRx
 JxdOo+u+YlTpbiJ7uAZVoD9cfxdiqQPiH6Vp3gAOc9Kc9m7POBWuKn0eh5hk0Y8HjA
 MrDF6Dld5t7X60WnLMVZfUyEUzXBAngKIV5L4ABiRr6zu3FQqVr2ngSoLIKqTxPyUK
 64nlLjduQKr8g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D3C25C691E4; Tue,  1 Aug 2023 22:00:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] net/macmace: Replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169092722585.12287.10967772625799606285.git-patchwork-notify@kernel.org>
Date: Tue, 01 Aug 2023 22:00:25 +0000
References: <20230730231442.15003-1-rauji.raut@gmail.com>
In-Reply-To: <20230730231442.15003-1-rauji.raut@gmail.com>
To: Atul Raut <rauji.raut@gmail.com>
Cc: netdev@vger.kernel.org, avem@davemloft.net, rafal@milecki.pl,
 kuba@kernel.org, pabeni@redhat.com,
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

On Sun, 30 Jul 2023 16:14:42 -0700 you wrote:
> Since zero-length arrays are deprecated, we are replacing
> them with C99 flexible-array members. As a result, instead
> of declaring a zero-length array, use the new
> DECLARE_FLEX_ARRAY() helper macro.
> 
> This fixes warnings such as:
> ./drivers/net/ethernet/apple/macmace.c:80:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> [...]

Here is the summary with links:
  - net/macmace: Replace zero-length array with DECLARE_FLEX_ARRAY() helper
    https://git.kernel.org/netdev/net-next/c/005c9600003e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
