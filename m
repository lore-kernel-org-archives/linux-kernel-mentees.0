Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8269730C359
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 03:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764126042; cv=none; b=qAe7WroL4sE/LarMpTcLCPnJf2VZseQQ2O8m2psKTm7t0fVpyyC2pCqHYeOcmQ4Wz2JVVFhPSfli7dzTW+fi3FnYBnd18gdT4HM7EYYNqQxLmBKevZHZ6Vu0TtlXY0WA21g2Xf5qj+I5O4gjl0fXMnyr6psmWzS1wWoIAKtHFTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764126042; c=relaxed/simple;
	bh=so6/0hADVphgyY3Xzb6VCo5Vw9FFc2ZLjPJWCawckNY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lKyFCKNJQPFeM/oBxWiVdvyIoUjcC6jdMFxryJHqTHTG1HviD857CMgl1fSqlYdZQOP6Hkp0IJVgOLq6tIWlybrpDCwvGUNkeinIdgF6aL7awiloclkRMi5jMMOi2wJ6FvWeKUmD1uUE9KdjCPh98u86RaUmA3DtKzcBARdzHm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHKbll8/; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHKbll8/"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0014240308
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 03:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3lTTNVe3ML8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Nov 2025 03:00:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41030400B1
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41030400B1
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RHKbll8/
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 41030400B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 03:00:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2ED6B43585;
	Wed, 26 Nov 2025 03:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08787C4CEF1;
	Wed, 26 Nov 2025 03:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764126039;
	bh=so6/0hADVphgyY3Xzb6VCo5Vw9FFc2ZLjPJWCawckNY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RHKbll8/WdS3FTgzIW71YUvh4EHuGnHRPPbEH71fVunlz5YhCCCZMf6/nlc9hFGF6
	 IVnT6LbctrAKk4ROK6LvmwRjh+Ipj/ZQyu/0ZHOPt5k2SEPuQvHJ4Df3E6Uwkajm32
	 sx7aFES2m/f0ZRGLQ96pPu10eOtKJD/3CxzZfdbWRWDvBRyYcrDawLZJUM0j1yevkb
	 2iK34i3eHd/NwKGbDCWgXnBT5WJNLbSpQfLl8oYOr6Tqbfrw5svpkMsvI1heYCBwVo
	 +i7X2gQxigC1J+SP62iE5Z+8Yrx5fQlOwCokxcsL4jc0+L3lVROhLW2WMphjBT/HKZ
	 qW5GaI5/peH/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71ACA380AAE9;
	Wed, 26 Nov 2025 03:00:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4] team: Move team device type change at the end of
  team_port_add
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176412600124.975105.14229748246152064964.git-patchwork-notify@kernel.org>
Date: Wed, 26 Nov 2025 03:00:01 +0000
References: <20251122002027.695151-1-zlatistiv@gmail.com>
In-Reply-To: <20251122002027.695151-1-zlatistiv@gmail.com>
To: Nikola Z. Ivanov <zlatistiv@gmail.com>
Cc: jiri@resnulli.us, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 22 Nov 2025 02:20:27 +0200 you wrote:
> Attempting to add a port device that is already up will expectedly fail,
> but not before modifying the team device header_ops.
> 
> In the case of the syzbot reproducer the gre0 device is
> already in state UP when it attempts to add it as a
> port device of team0, this fails but before that
> header_ops->create of team0 is changed from eth_header to ipgre_header
> in the call to team_dev_type_check_change.
> 
> [...]

Here is the summary with links:
  - [net,v4] team: Move team device type change at the end of team_port_add
    https://git.kernel.org/netdev/net/c/0ae9cfc454ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


