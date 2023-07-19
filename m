Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A05EB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Jul 2023 00:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED9A360C23;
	Wed, 19 Jul 2023 00:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED9A360C23
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uVTdgyI5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KXPrJqE4tzTI; Wed, 19 Jul 2023 00:50:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EF3B560BB5;
	Wed, 19 Jul 2023 00:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF3B560BB5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC684C0072;
	Wed, 19 Jul 2023 00:50:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89A73C0072
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jul 2023 00:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55CB5818C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jul 2023 00:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55CB5818C2
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=uVTdgyI5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sp5F7oWh0YM6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jul 2023 00:50:21 +0000 (UTC)
X-Greylist: delayed 1196 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 19 Jul 2023 00:50:21 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 848D3818A1
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 848D3818A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jul 2023 00:50:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5ACD615E9;
 Wed, 19 Jul 2023 00:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AC50C4166B;
 Wed, 19 Jul 2023 00:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689727820;
 bh=gomJX7WZdIUn68JJd90qXrXndp2wVZptSNcutFvLGKs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uVTdgyI5kMXIHt3XZ5QWbBsfkCUbUvfcohqCsRY6YVU47cLpcONHkbTF/zuXGezNH
 TGEVSgEefb7zRCbUkhwPiwxajL5rAI+pwRr87n4Q0ZdUd6GDvDJFe/ZHvoRJ0q0sXS
 kT5xyBe/doy3VevxJOdcXGxWXlT1TymE4a8r0Gp8X9q8LRpa+vMigCHaRpAjy6oS55
 opHckKe3sa8vI3+OX1OqHXCJZalUYtKZsyzTmOnHtLcfAJJFCdTlINXC18UiegyJZ4
 Qrz9uwebFi+PBiM/e73C1WZJll34/cG/W0AStfU0mBOoUWRiCpxvwR9qoGV5YHHNCm
 FRgKJEQto1elw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0C364C64458; Wed, 19 Jul 2023 00:50:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] selftests/net: replace manual array size calc with
 ARRAYSIZE macro.
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168972782004.15840.17484255346823026.git-patchwork-notify@kernel.org>
Date: Wed, 19 Jul 2023 00:50:20 +0000
References: <20230716184349.2124858-1-mahmoudmatook.mm@gmail.com>
In-Reply-To: <20230716184349.2124858-1-mahmoudmatook.mm@gmail.com>
To: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 16 Jul 2023 22:43:49 +0400 you wrote:
> fixes coccinelle WARNING: Use ARRAY_SIZE
> 
> Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
> ---
> changelog since v3:
>  - move changelog outside commit message.
> 
> [...]

Here is the summary with links:
  - [v4] selftests/net: replace manual array size calc with ARRAYSIZE macro.
    https://git.kernel.org/netdev/net-next/c/3645c71b582b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
