Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C11182B7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 22:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763676650; cv=none; b=pFAVa8o7vP/QnlHqdf50bXmhCrxrRxpkt5IHP7FD+Xg7o3Y5agdsSVZzZq7NknY7xSeLx26I/65PLf7+Ss7FQKIM3vbRtQjhtNiDztfHhxyt0aRAIeH4j8nsQRG8Io0fghnaogskhlWIdZzLVXwBfHea/g/BLoqpLZG5qYJv0ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763676650; c=relaxed/simple;
	bh=UV6LiF/stAtDrBM8bsyoVwy+mKAbgHEkZVcax6OJDbk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZbgzoHoladhChmtBKBsAn0tULlXeYA99Jl1Qm+hN4X67LVYM/b6ahK0oz0CLvWFEDjDAbb73J8yZefYBolVgGjv/GWwKFNys/prh6fs+Kw3M/OS7QfhPzxlamHzLpIQ7ANBpHNEHhRnydgkD5ACvxA3f4cOwxR3FtnQxfh2+lxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6xBLrry; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6xBLrry"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C47D4083F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 22:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwJKnpncTZTP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Nov 2025 22:10:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4A714083A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4A714083A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F6xBLrry
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B4A714083A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 22:10:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B23260219;
	Thu, 20 Nov 2025 22:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2846C4CEF1;
	Thu, 20 Nov 2025 22:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763676644;
	bh=UV6LiF/stAtDrBM8bsyoVwy+mKAbgHEkZVcax6OJDbk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=F6xBLrryqf9Ccz4b20/oU0JGedxYsEo9c5Sb01t/2XMZFck+onLTCmvIhWgGRhA7w
	 0tApO+VDHGUhPyyS46xMI9M6Yilc2oaj7X4a+bNa8ndjW1BOzIb4+8byFFsxXMKe2P
	 Rd9wYkrvmRGmN4tvzUpDuxxEw53tw0H7a7GRD35RZliNmX+I/Mrx9uJaUZTeQIg9fA
	 lmNtYmtNe9IQPvYWjD8dj9LXY4UvLP3U6ySTetEE1whFV8qcl+/XyUFMFzUg3jjd9k
	 bPNoyY5ER6Yx5/O8/eItHtAmojmbtyVJcXqZwCEE7KzBwm0zozLifqgP4cUaToJxQt
	 +nCPpOlM3Oysw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D4F3A40FFE;
	Thu, 20 Nov 2025 22:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] bpf: Document cfi_stubs and owner fields in struct
 bpf_struct_ops
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176367660986.1804570.2226125940401582306.git-patchwork-notify@kernel.org>
Date: Thu, 20 Nov 2025 22:10:09 +0000
References: <20251120204620.59571-2-nirbhay.lkd@gmail.com>
In-Reply-To: <20251120204620.59571-2-nirbhay.lkd@gmail.com>
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Martin KaFai Lau <martin.lau@kernel.org>:

On Fri, 21 Nov 2025 02:16:21 +0530 you wrote:
> Add missing kernel-doc documentation for the cfi_stubs and owner
> fields in struct bpf_struct_ops to fix the following warnings:
> 
>   Warning: include/linux/bpf.h:1931 struct member 'cfi_stubs' not
>   described in 'bpf_struct_ops'
>   Warning: include/linux/bpf.h:1931 struct member 'owner' not
>   described in 'bpf_struct_ops'
> 
> [...]

Here is the summary with links:
  - [v2] bpf: Document cfi_stubs and owner fields in struct bpf_struct_ops
    https://git.kernel.org/bpf/bpf-next/c/e0940c672ab4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


