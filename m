Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3394C34B402
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763462445; cv=none; b=MP6C6jHW98Tr3nj/N4jHe94oyBLZsVDf3hO+RkoE30Gcr9GPJC9rYBlb8IO8m1UKLJV0gDw6sMY+tF5Ee8ZR7FoEWNtli5KBqd78mp2uOph1kRpOm7zlZ9Yc6LbCFiXufj9Vin1yxI+1vfYWEfvYUo0H92vrZN6geralWr/Ng5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763462445; c=relaxed/simple;
	bh=ugqbmJDGiYF6qRacwGL2VG/L3gey8JKa5v8pcJ3Sxxo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UVm3QI7ml99+LYSFZbsYPQPXtWbj8gQISlZubo59Un+bED8GRFFLgo0f8MCo5xxUqi3WAjuN/i56GXkPzNmxAPDup9m1BX2cdwGBNoH7LBCdWR3NXRYlT/WaZNyRtVZzaC/Zwu8dGkRrltzpSIIo1USTJnYgI+Ll0IoIWjhSXYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQb2bSsh; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQb2bSsh"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B85A36086D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 10:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2Ty8PI0VPqb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Nov 2025 10:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E60DD60869
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E60DD60869
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NQb2bSsh
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E60DD60869
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 10:40:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 572406015F;
	Tue, 18 Nov 2025 10:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC125C2BC86;
	Tue, 18 Nov 2025 10:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763462441;
	bh=ugqbmJDGiYF6qRacwGL2VG/L3gey8JKa5v8pcJ3Sxxo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NQb2bSshKGfpCak868DBiZaJiLe/ORQ+XSX1TTEK0qfVn1yShkNTq3rEA1eUssnC/
	 SU1b80JGmWPsBC8ootAEDeDz5+BtXCb/c/T2auobH6U0eBrWKojFAu4td7F4DDSI7i
	 eOhpATndmJ/JAWNYj/xRSPxOUqi2s1eeudBuMcK1vg9+Dv9GC59QcIbce1NwARArEu
	 kEui6q+URzTBjXyv/iV1ofYPA23+O+wjpNTNOevXnWIAAJPEJ+d5lV4h2vckpJJ/B6
	 Htf813wA2L6E4rSC4AwHfO79i3BJE7OeCsv/bnpzvEvtIVN2m1VJynF73wD005x8F4
	 hsOmYX+e+Qk7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710033809A84;
	Tue, 18 Nov 2025 10:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6] selftests: af_unix: Add tests for ECONNRESET and EOF
 semantics
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176346240626.4087956.15974083962638207959.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 10:40:06 +0000
References: <20251113112802.44657-1-adelodunolaoluwa@yahoo.com>
In-Reply-To: <20251113112802.44657-1-adelodunolaoluwa@yahoo.com>
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, kuniyu@google.com,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 13 Nov 2025 12:28:02 +0100 you wrote:
> Add selftests to verify and document Linux’s intended behaviour for
> UNIX domain sockets (SOCK_STREAM and SOCK_DGRAM) when a peer closes.
> The tests verify that:
> 
>  1. SOCK_STREAM returns EOF when the peer closes normally.
>  2. SOCK_STREAM returns ECONNRESET if the peer closes with unread data.
>  3. SOCK_SEQPACKET returns EOF when the peer closes normally.
>  4. SOCK_SEQPACKET returns ECONNRESET if the peer closes with unread data.
>  5. SOCK_DGRAM does not return ECONNRESET when the peer closes.
> 
> [...]

Here is the summary with links:
  - [v6] selftests: af_unix: Add tests for ECONNRESET and EOF semantics
    https://git.kernel.org/netdev/net-next/c/45a1cd8346ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


