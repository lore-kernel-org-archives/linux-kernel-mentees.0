Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2778C29BDA5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 01:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761700853; cv=none; b=qg9vL/F6n8DiGD41cKXrWxSbnsoJmYJ/FntrofB9P7sHoW02WCN1C/Y5S6UuKf9FDF8NFWpPdy+sW2Cyadov2CXX2eWx/6WnUrWI2kRWaibrP6TjHhtrEDO1kxZ7+1C3h3eaCzUP3BYgpYG2t8cr42QUJm01AqL8uGhbMXcjIO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761700853; c=relaxed/simple;
	bh=9ZqcnB1WevY+HG627LutBAc/aEokx5VVBtFlplNEhs4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PYJ+Bg1U9TeehIYDU5ShfrTeAOK8E4404m2M6lT+OBQugK2NJV7Jheoho1dpGwwZqP26XqUCC/1FxN/PXX76OSAz7UmxSzDmCfo5gW+kxJoev/aPIiYz0e0p12A0cX4rdWr+SDpvOhyWYxQhxz6v1hwKKVwnKPkmBlS8G+eyCpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xqo+0IiB; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xqo+0IiB"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2DC960D70
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 01:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0cpQJq8fVX2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Oct 2025 01:20:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E992560D6F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E992560D6F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xqo+0IiB
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E992560D6F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 01:20:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9E6560535;
	Wed, 29 Oct 2025 01:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641F2C4CEE7;
	Wed, 29 Oct 2025 01:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761700848;
	bh=9ZqcnB1WevY+HG627LutBAc/aEokx5VVBtFlplNEhs4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Xqo+0IiBUU7IjRPzGNI6BH3v8bNqA78jY4v/BFedgyZR8bgIjalo7ZvH3GOXyZTdk
	 y+YT1idiOMdcxKL2GPO3U8eCukv4hd+gAvFCSL2cZ47FpZNLcNe0fu+4ryOBCchl2x
	 0533y29arDaj4OQAA849YabkxowKMNGNkKUypatYX5lJgqkD/qx/0HJJGOradG83WS
	 J3CzWdrpwRT+V+s2Vc4EUMpJu9+mmYkhWNWItKi7AQm98OCf5HKIdWdKnDEjfKACnl
	 TpPcpd2ySPDiu0EesE0/faODDUPnW90WA2jxLvFjHo1b8mZ7v4QjsCdvAhU4c04VSq
	 cAOJlvvKrCPbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CF439FEB6D;
	Wed, 29 Oct 2025 01:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: tcp_lp: fix kernel-doc warnings and update outdated
 reference links
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176170082599.2452213.4489623733769266836.git-patchwork-notify@kernel.org>
Date: Wed, 29 Oct 2025 01:20:25 +0000
References: <20251025-net_ipv4_tcp_lp_c-v1-1-058cc221499e@gmail.com>
In-Reply-To: <20251025-net_ipv4_tcp_lp_c-v1-1-058cc221499e@gmail.com>
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, hswong3i@gmail.com, hlhung3i@gmail.com, khalid@kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 25 Oct 2025 17:35:18 +0530 you wrote:
> Fix kernel-doc warnings in tcp_lp.c by adding missing parameter
> descriptions for tcp_lp_cong_avoid() and tcp_lp_pkts_acked() when
> building with W=1.
> 
> Also replace invalid URLs in the file header comment with the currently
> valid links to the TCP-LP paper and implementation page.
> 
> [...]

Here is the summary with links:
  - net: tcp_lp: fix kernel-doc warnings and update outdated reference links
    https://git.kernel.org/netdev/net-next/c/5c00da851c31

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


