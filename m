Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F275D331A4B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 27 Nov 2025 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244328; cv=none; b=P8xv/yxQOfjBNydtf9VkjmKmxTGKAcwlswOgBQog4O98GoxfQkCilIshGom8xZVCmqsrhSe4sLgav2RQ1q3Pl+ebId3bI59P7fMh6kmepBY3wMp1+35S79D3col/jwhlVhlIPMnmBXENq7Jn0daPAMqojnv/WjhC3Gp3Wlx+TF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244328; c=relaxed/simple;
	bh=vXMAPEVvuqkmNZC1/QV8tfrfTIWyuSpb49vHXINrQ90=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EXFTTJCaMRakrS/mpeYZlSNpGbcDUIF6EXJjnZ+1puDefihApmZ1r18iXpI4n3qH3Ux1fpc1+qUmJXJtSM0wJ59KP+5ne8u+BvJY2Esyn87FK9MxMixjDCiXg5lH6jawEGuokREYGMKV2sOOXc5auy5tP/GG9DO6IweerL/lOx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAUgLSfU; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAUgLSfU"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8502260B9D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 27 Nov 2025 11:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LeKlgThgrtnn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Nov 2025 11:52:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC1E260B5C
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC1E260B5C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iAUgLSfU
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BC1E260B5C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 27 Nov 2025 11:52:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EAB1D40375;
	Thu, 27 Nov 2025 11:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22C1C4CEF8;
	Thu, 27 Nov 2025 11:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764244324;
	bh=vXMAPEVvuqkmNZC1/QV8tfrfTIWyuSpb49vHXINrQ90=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iAUgLSfUY3cNdJ/lT8f6NFrNMIESS5uRK+gHgrsOa8ABQMJM2Pq4+JhUD3tUxtR8B
	 a9ck5u/IGTN4PbljvRT1s59ncfU+mNuNdoDU4lZ08eSLzAvzGKcT6g8xuA3JWmdDIF
	 q3m32k3tdSERBBGLGKUW+9jSxGccWSXYK2eigKxA+PgXc7B4EF41RKFMY2kjyzesbf
	 zV6mf0j3oDs0F7vgyK/KUvV1jZw/Y4liLLqkk69UpZZq9YEW71efF4BwESsj+boqrd
	 7/7cGY5n94WTp8kGxp2xmmwHfIzkl6+QQzSlrLJhqZWuASjYuRoFjoC0LppMXQPyaY
	 LDXBBCVIFI3Eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D93380CFE0;
	Thu, 27 Nov 2025 11:51:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: af_unix: remove unused stdlib.h
 include
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176424428626.2543014.2747107697046734578.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 11:51:26 +0000
References: <20251125113648.25903-1-adelodunolaoluwa@yahoo.com>
In-Reply-To: <20251125113648.25903-1-adelodunolaoluwa@yahoo.com>
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Cc: kuniyu@google.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 oe-kbuild-all@lists.linux.dev, lkp@intel.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 25 Nov 2025 12:36:48 +0100 you wrote:
> The unix_connreset.c test included <stdlib.h>, but no symbol from that
> header is used. This causes a fatal build error under certain
> linux-next configurations where stdlib.h is not available.
> 
> Remove the unused include to fix the build.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202511221800.hcgCKvVa-lkp@intel.com/
> Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: af_unix: remove unused stdlib.h include
    https://git.kernel.org/netdev/net-next/c/5c9c1e78de1e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


