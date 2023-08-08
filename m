Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6FBEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Aug 2023 02:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1B0B81E4A;
	Tue,  8 Aug 2023 02:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1B0B81E4A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R4+Ff2oW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zM3_wmR1ilLc; Tue,  8 Aug 2023 02:20:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 66551817EB;
	Tue,  8 Aug 2023 02:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66551817EB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 409CBC0071;
	Tue,  8 Aug 2023 02:20:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AF41C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 02:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DFAF81C38
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 02:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DFAF81C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkAnxmd8MGwX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 02:20:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E98AB817EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 02:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E98AB817EB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D88F6237D;
 Tue,  8 Aug 2023 02:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 886B7C433C9;
 Tue,  8 Aug 2023 02:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691461221;
 bh=kIyAQMukGXX9hkfOIlUbx01Y94cwkm21Uaczx4ozoPo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=R4+Ff2oWweI6Pxzul5oURhFvP7LdJM1JFZBYoGuJL+we1MR4sM+t+WlNoG+wW2ZPw
 9SLsUtp4Jj+ZnHDT1LNtt3nud3r5ifP8IcUaHQwODJSzb0qIY9tFMSXmU4ZFmgyI5g
 ke2yztGbfb2aJglQPCwUB71T1bbUcO5PN05NZVX98wykp/Ovkx39SyKhdNCQSWJlga
 E1JOrcuBeMZjwmfFaPKxhLcY4dCTGrHTHMxArIY6PqE1+QKs1WA6RqIocVEiAZCS9T
 rZPlqmkaUEZRJ9eMI4nA+jblkgXqCTyoHGcL3uYb0MNB2gab1M4Sz4+3IYwJ2Ys1t/
 x1f4XgwtO8WJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6DBA3E505D4; Tue,  8 Aug 2023 02:20:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next v5 1/2] drivers: net: prevent tun_build_skb() to
 exceed the packet size limit
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169146122144.9822.6352423513613934358.git-patchwork-notify@kernel.org>
Date: Tue, 08 Aug 2023 02:20:21 +0000
References: <20230803185947.2379988-1-andrew.kanner@gmail.com>
In-Reply-To: <20230803185947.2379988-1-andrew.kanner@gmail.com>
To: Andrew Kanner <andrew.kanner@gmail.com>
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com, hawk@kernel.org,
 netdev@vger.kernel.org, jasowang@redhat.com, john.fastabend@gmail.com,
 linux-kernel@vger.kernel.org, jbrouer@redhat.com, edumazet@google.com,
 dsahern@gmail.com, kuba@kernel.org, pabeni@redhat.com,
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  3 Aug 2023 20:59:48 +0200 you wrote:
> Using the syzkaller repro with reduced packet size it was discovered
> that XDP_PACKET_HEADROOM is not checked in tun_can_build_skb(),
> although pad may be incremented in tun_build_skb(). This may end up
> with exceeding the PAGE_SIZE limit in tun_build_skb().
> 
> Jason Wang <jasowang@redhat.com> proposed to count XDP_PACKET_HEADROOM
> always (e.g. without rcu_access_pointer(tun->xdp_prog)) in
> tun_can_build_skb() since there's a window during which XDP program
> might be attached between tun_can_build_skb() and tun_build_skb().
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/2] drivers: net: prevent tun_build_skb() to exceed the packet size limit
    https://git.kernel.org/netdev/net/c/59eeb2329405
  - [net-next,v5,2/2] net: core: remove unnecessary frame_sz check in bpf_xdp_adjust_tail()
    https://git.kernel.org/netdev/net/c/d14eea09edf4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
