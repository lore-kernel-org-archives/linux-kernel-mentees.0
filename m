Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA98D3A28E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 19:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8UeBQHa"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2701942420
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 19:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2701942420
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T8UeBQHa
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sFOwA6wODbn2
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 10 Nov 2023 19:12:29 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 86C5C4241A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 19:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86C5C4241A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 835C0CE1724;
	Fri, 10 Nov 2023 19:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBA9C433C7;
	Fri, 10 Nov 2023 19:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699643544;
	bh=IDkJf9q/qJFiQ7tkUVGvravDFMJPMy5QQpsSAsjYTNc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T8UeBQHaCQwHes7sv1XY8YK0kaIOgq3TLAflaNs33FHhx53cKPFv9YbTCaLkMgM58
	 Yul3LTQSzhK4A7lXCWHmy3dP4vljIjIXnT/16XJwwefFKxJsBE+u+auaenycQi8HRz
	 65qVGY3vZIC1rtVWDO7oagtYjCR7Ueir60ZdaPuXHlex3OwPpN0ZMJLNq0cJIssIwc
	 ON+jYNqR57YWBlLA+ZSI3ddi3JPbsaCYSBtVcClHB0/UjjD+I6+Mc1t52SGjQpzFNW
	 rpqz6ChRBUITHhE6se6UBFO9tf2pli7l8CWhMcEQNIQwbMKsvRXAmOTuVodsfCb6l7
	 IRAwqF6RIrQcg==
Date: Fri, 10 Nov 2023 11:12:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Dipendra Khadka <kdipendra88@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+44c2416196b7c607f226@syzkaller.appspotmail.com, Stanislav Fomichev
 <sdf@fomichev.me>
Subject: Re: [PATCH v2] Fixes the null pointer deferences in nsim_bpf
Message-ID: <20231110111223.692adbd7@kernel.org>
In-Reply-To: <20231110111823.2775-1-kdipendra88@gmail.com>
References: <20231110084425.2123-1-kdipendra88@gmail.com>
	<20231110111823.2775-1-kdipendra88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Nov 2023 11:18:23 +0000 Dipendra Khadka wrote:
> Syzkaller found a null pointer dereference in nsim_bpf
> originating from the lack of a null check for state.
> 
> This patch fixes the issue by adding a check for state
> in two functions nsim_prog_set_loaded() and nsim_setup_prog_hw_checks()
> 
> Reported-by: syzbot+44c2416196b7c607f226@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com./bug?extid=44c2416196b7c607f226
> Fixes: 31d3ad832948 ("netdevsim: add bpf offload support")

Don't think so. It's probably due to Stan's extensions / reuse of 
the offload infra.

Please put more effort into figuring out when and why this started
happening. Describe your findings in the commit message.

Current patch looks too much like a bandaid.

Before you repost read:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
-- 
pw-bot: cr
pv-bot: syz
pv-bot: 24h
