Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DCB2877CD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 22:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764629606; cv=none; b=YKAuSBO/zFLhVIU5Y1isvscmF1P3jCUJsseuDUl+yc3HZVGirZwIJfyBcuH80ltGgYpPranzJcENjTvD1mkNlBcAGWIKrxZTG7PL/ggk6oCoEguAytMi3lGrYHYwv0WV3SNZu16xGYOqwDbYcUowh4ZMBFKe5N5MRIyta1sHz3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764629606; c=relaxed/simple;
	bh=uw/kkT/ooZbHkkATRRJxoW6D40dh3H41msOhQ8INyqc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=A7Nau1b9hphMZknWWl2o0ME2WSb9GMKHf5Waa10PkSH76yuBq7zIvSSecMJZjhiqNnwRhsUnFA063tAyGBsPtvEwLOCc9TB6GJyyND9GONNQ4eDAm3eYBQxPzQmgHHQAtxdyB7zFICxXcwEtS3V0Z6upIy4BtOStl1J1wOPUVWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Buo8q8P0; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Buo8q8P0"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E237B40F48
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 22:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkFx2sjz_Nit for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Dec 2025 22:53:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25ACF40F19
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25ACF40F19
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Buo8q8P0
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 25ACF40F19
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 22:53:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F68B6018E;
	Mon,  1 Dec 2025 22:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EE9C116C6;
	Mon,  1 Dec 2025 22:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764629602;
	bh=uw/kkT/ooZbHkkATRRJxoW6D40dh3H41msOhQ8INyqc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Buo8q8P0+siSY6ijWh/fl4dmca7pTKDfuyxr77ezN3+avA8/th7rDGARtEJ9Dhgl9
	 Mej6wpcGjPK4pko9h9UEynvFNLFTQVthYXGblJ7e5ChtaLXsb2+6nEwc2030l2ggg+
	 wb6q7qOarZBk16/438yd/DE2gq4jVZNPGIZvLNj+yQkTQLfz+E0KPfSA9EFQnwALk7
	 PwdySp36XcVvezYnn/3OGcDj94xOovD4mJm7ijEax1CX4wZUnVPRVVmmib5PlSg+3e
	 y565MIYFY5kxx/xwDL5n0ysi2W98UoVya9paYlT5jDE0isp0OZX0RXpjtCw9zIjqj6
	 m9Ky+su6DbfWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BA9B381196A;
	Mon,  1 Dec 2025 22:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] team: Add matching error label for failed action
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176462942202.2581992.12765522387772260479.git-patchwork-notify@kernel.org>
Date: Mon, 01 Dec 2025 22:50:22 +0000
References: <20251128072544.223645-1-zlatistiv@gmail.com>
In-Reply-To: <20251128072544.223645-1-zlatistiv@gmail.com>
To: Nikola Z. Ivanov <zlatistiv@gmail.com>
Cc: jiri@resnulli.us, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 28 Nov 2025 09:25:44 +0200 you wrote:
> Follow the "action" - "err_action" pairing of labels
> found across the source code of team net device.
> 
> Currently in team_port_add the err_set_slave_promisc
> label is reused for exiting on error when setting
> allmulti level of the new slave.
> 
> [...]

Here is the summary with links:
  - [net-next] team: Add matching error label for failed action
    https://git.kernel.org/netdev/net-next/c/aee0f01b4f11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


