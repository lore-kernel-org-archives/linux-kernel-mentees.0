Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1466C215020
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 15:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730994025; cv=none; b=BCkPVi85N3Xoe66+5rXaIvPSlzg9cZrhKAJrPt5/dtk5fgrD3ZNNsFyYv/DHA6FTHnWcl3PxkcJce73fjqnxMTjGQW7ZPz0f+xLqVP5lyI28zOLQPuLc/76J8u7B4iDEuJoebNqkKx7BFv5myrQf1GQ9v6Qwc+B7mPIYOHwCaC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730994025; c=relaxed/simple;
	bh=99mRawCrYiyprXONM9QgUaVEZFk1e6ntZv9bAFDjUBA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=r003JEtehrjyCyZfayTomwBoJLibXwnR+ZW6GAP4g5s2MjXkpNAcbL6NLzHWufORlyvM3DWYiLLcccfTB4d/VwlDSd35E9jBz5pWZfiPlrWB2RWclx5aYdlqFsBINfrortYqcgzf83Vn5mkY5bx22NJmEJkZUdLVQqytinV4L0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXqnWT70; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXqnWT70"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A022561114
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 15:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nu4nySnJmFR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 15:40:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E60C60BB0
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E60C60BB0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WXqnWT70
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9E60C60BB0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 15:40:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71FD35C54F5;
	Thu,  7 Nov 2024 15:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A2FC4CECC;
	Thu,  7 Nov 2024 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730994020;
	bh=99mRawCrYiyprXONM9QgUaVEZFk1e6ntZv9bAFDjUBA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WXqnWT70L0uCsEMEDK0W4BHqJtQFvcQOJlDNjWU4nZ2yiaoHXoGT6jULrpZoLXDpZ
	 xQDxiRHnIv265cNFOrWyYVbUfRHoA7ubXSwOGT1dwby2BJZUnkpM8rowKrOfl6ywdj
	 PKJWjcRdcLN/XCOcss+aZvp6dO5GAhgUvuFzat3S0NHeViZsFGIht2fDaDpEi8IeGG
	 oUdTtS/jQ4vQSo1sbDsJbdSd41HCboKC3HGbyDM/mn37r2G6G9H7o9nN3wugYQc2F3
	 +VsupFAUlMbOBIFNIHS1bKRWGVuPxjFI8d90RNmB6HznQQNauTrwY9BcvsVGtmPc74
	 g8oL3FtWgeMMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34BA63809A80;
	Thu,  7 Nov 2024 15:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/1] BPF verifier documentation cleanup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173099403000.2004583.8555324576230265420.git-patchwork-notify@kernel.org>
Date: Thu, 07 Nov 2024 15:40:30 +0000
References: <20241107063708.106340-1-xandfury@gmail.com>
In-Reply-To: <20241107063708.106340-1-xandfury@gmail.com>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, bpf@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, corbet@lwn.net

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Wed,  6 Nov 2024 23:37:07 -0700 you wrote:
> Hi everyone,
> 
> I am interested in contributing to the BPF subsystem, starting with
> documentation cleanup. The patch removes trailing whitespace from the
> verifier documentation to maintain consistent formatting.
> 
> I have tested this patch with scripts/checkpatch.pl and it reports no
> issues.
> 
> [...]

Here is the summary with links:
  - [1/1] docs: bpf: verifier: remove trailing whitespace
    https://git.kernel.org/bpf/bpf-next/c/342f751e15c3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


