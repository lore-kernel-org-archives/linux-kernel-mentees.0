Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB942DEA74
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759775425; cv=none; b=ZRKnrAhI+Qww85lMmsZLGpI/cFvCX2+UHp0bnbzdtaPJeQrsG2tR8jfbKBtXhMYyb0nJesfGnvfnqTf7HeZxLso8c+ersEy3LYwXoMdA/CYqCGnx0xUQQNUnPSxmlHDb20yE8PtyFpn4chabDacj7tvQsqYbtSm8KJYlesXwfyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759775425; c=relaxed/simple;
	bh=1/3yS3/3heLRUNhz94bbjCBzVJbQ8bv7upwAIwiOxME=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gxtdKKGFCem6NkTUprjAxiaoJTssNXoDQY7EKfZDw0X8gDer/3itpSceun2fl5SJ0+7wBWSSYr9KI6YCDSuWgxo0USor2DNVvvoOwv4JLzORQar1dY6LOHmjSlnJ2QU2rsUBXtJCfoprNTYyZ2J1Zp17GVAIq5ux9avbJlm1Hiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkRG9E6x; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkRG9E6x"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D382411C4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 18:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3bInaZhRLiH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Oct 2025 18:30:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C35540DE9
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C35540DE9
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VkRG9E6x
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4C35540DE9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 18:30:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D1CC60615;
	Mon,  6 Oct 2025 18:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05B8C4CEF5;
	Mon,  6 Oct 2025 18:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759775420;
	bh=1/3yS3/3heLRUNhz94bbjCBzVJbQ8bv7upwAIwiOxME=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VkRG9E6xLvC1LBBJve55X0FAoV4o0rcgNn+IfAmeZtQZhoFJNqvfmPQQYnk0TF52t
	 VwXb316kbOOzB7gdwf+LRfd9GEREJOuq6/hWZAEwVkz0X0yjiooQTKtkqoLBaMJ6G9
	 XwXkih5bkFyzTR2kb18Vqy4Ub6FM5h1ZUAc2ZkEmWjYNl/Mvzn4WTOiUN73CtHSojv
	 UIoVSEGUZWscWY/7NV1tgB8Qc5WJRlbNnGlWSgjAiVtVyWGKQNo16mKDGfiBZFMRE1
	 VIj5xDlhiWVqIEc027McA3DzS9IRN+eAD8xZz6V0fpTG1budjRUWmkus1YfjZulI+t
	 SPDoKILw6ceOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE03039D0C1A;
	Mon,  6 Oct 2025 18:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: fsl_pq_mdio: Fix device node reference leak in
 fsl_pq_mdio_probe
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175977541050.1511446.8119337213640574445.git-patchwork-notify@kernel.org>
Date: Mon, 06 Oct 2025 18:30:10 +0000
References: <20251002174617.960521-1-karanja99erick@gmail.com>
In-Reply-To: <20251002174617.960521-1-karanja99erick@gmail.com>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, david.hunter.linux@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  2 Oct 2025 20:46:17 +0300 you wrote:
> Add missing of_node_put call to release device node tbi obtained
> via for_each_child_of_node.
> 
> Fixes: afae5ad78b342 ("net/fsl_pq_mdio: streamline probing of MDIO nodes")
> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> 
> [...]

Here is the summary with links:
  - net: fsl_pq_mdio: Fix device node reference leak in fsl_pq_mdio_probe
    https://git.kernel.org/netdev/net/c/521405cb54cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


