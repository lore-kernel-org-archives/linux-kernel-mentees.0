Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACBE2EF64F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 17:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760289623; cv=none; b=Xkuqz38hiR8vQ2TMSbdzRAT26n4sll+09ZTqfOFVr4U1oELk9/PpvRKrRIFPy0U5tvRHxyjeJMSUeGEfl+o1d9eMFsHJ80NGIr8KpvtMfiPc0X3QDdY8g/yXrZYgVHM1kblpDH7W/3tmJDE0eJ08AGmhuTanWSWfT2IySIMx3ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760289623; c=relaxed/simple;
	bh=0Yhqw/WpUTQj+vAuDvTHp3aIUOR0Gj80cWsQtkFzs3M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b6lfXOkumtHV6nyD7mYcZm3Hgd0ds8yZEvJrCX2kiCgDjTPZDO67gtFkX0TUs3cTYopdtf7YutBSxTKfpekbR3iRAbM6tYTaVk2rM/0Uas7gRGgJt9yqcnyjF0VzXyij1xwQWOtK5tjwP7mQ750y6ofxib8e8UBeWvtE5xxbb3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2vx+H1V; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2vx+H1V"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BE2540E17
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 17:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrEEhjlVpRjf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Oct 2025 17:20:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53A7E40E15
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53A7E40E15
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a2vx+H1V
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 53A7E40E15
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 17:20:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 510C14524E;
	Sun, 12 Oct 2025 17:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EBFBC4CEE7;
	Sun, 12 Oct 2025 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760289619;
	bh=0Yhqw/WpUTQj+vAuDvTHp3aIUOR0Gj80cWsQtkFzs3M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a2vx+H1VW3lHb0/EWN4Y+UwNY060kww2kdLP3SWRi4AThtcAwW3CkS6GJCV0SE8aB
	 HgoOetpYACGBrEq1NN0zUl7SF6/hGpXxhUsiVkx7K3rULqc1Mx9Wgq062w3jyKpwfx
	 y6DhyXWdDX50WT4dN4uGXCCxRcYJMJBudHfh4FjIibK1BEKiXhzxntVjZWCxQHOo/5
	 mwS6sTY3jMeBXcNQII5+K2txf46uoeksG4sQcL3tXjNKtml5/gMxiIvB3wZrT63i6C
	 IHR8fs6vXqfM50OW2doCyDqIy264vF3OYtBwJKBauaQyaj44nltJkCuj4upMdOe/XG
	 cVBLCh/rj//Zw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD5A3809A1C;
	Sun, 12 Oct 2025 17:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout
 error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176028960551.1702266.1263953075322899185.git-patchwork-notify@kernel.org>
Date: Sun, 12 Oct 2025 17:20:05 +0000
References: <20251009053009.5427-1-bhanuseshukumar@gmail.com>
In-Reply-To: <20251009053009.5427-1-bhanuseshukumar@gmail.com>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: Thangaraj.S@microchip.com, Rengarajan.S@microchip.com,
 UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 o.rempel@pengutronix.de, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, stable@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu,  9 Oct 2025 11:00:09 +0530 you wrote:
> The function lan78xx_write_raw_eeprom failed to properly propagate EEPROM
> write timeout errors (-ETIMEDOUT). In the timeout  fallthrough path, it first
> attempted to restore the pin configuration for LED outputs and then
> returned only the status of that restore operation, discarding the
> original timeout error saved in ret.
> 
> As a result, callers could mistakenly treat EEPROM write operation as
> successful even though the EEPROM write had actually timed out with no
> or partial data write.
> 
> [...]

Here is the summary with links:
  - net: usb: lan78xx: Fix lost EEPROM write timeout error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
    https://git.kernel.org/netdev/net/c/d5d790ba1558

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


