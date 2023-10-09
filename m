Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185E3E95A95
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Oct 2023 14:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94BB58141B;
	Mon,  9 Oct 2023 14:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94BB58141B
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XV8vwGnW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wnmvtgu8eGeF; Mon,  9 Oct 2023 14:20:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5CF4881418;
	Mon,  9 Oct 2023 14:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CF4881418
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36CB8C0071;
	Mon,  9 Oct 2023 14:20:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF11CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 14:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97FD281418
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 14:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97FD281418
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJQV1_TLD1UX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 14:20:26 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9614981404
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 14:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9614981404
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8C405B81243;
 Mon,  9 Oct 2023 14:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7763C433D9;
 Mon,  9 Oct 2023 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696861223;
 bh=16U5YsvVXq5mHf2wc80nLuyb9WsMzTKLY8C5x5/BRsc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XV8vwGnW65YlZ2bz5W61tx/7iEkczeYNyZKLTADVKLZOfKmF14tNjl/Nxmkl+6qMf
 RG/L8mvRT3gY+4U0DlmjCTqaZbuKuOco3apnnPYd6T41znvviBN74Zc0Iuds37h8pZ
 Y5/xI43Zz28WYSytkNpJ7+iEXg1oJqPkzAbR6z9Jd1RLanFzGQT0BQjUWuiwUZKhu5
 aEE6vylKr3rb/2LyslogVUKhQQ48O90uB7min8T++dn0CJ4r9Bh15p8Jdyyvh6Ux/L
 5RgG4tUTLDNxn/8cIdtP2DANSnxr4WtX1wOfnCkpxkQUx9Xsv+FsrMME+oJ12XL77L
 LGRUHMowAaeBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9031EE0009B; Mon,  9 Oct 2023 14:20:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf v4] net/xdp: fix zero-size allocation warning in
 xskq_create()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169686122358.13891.1040766174680237802.git-patchwork-notify@kernel.org>
Date: Mon, 09 Oct 2023 14:20:23 +0000
References: <20231007075148.1759-1-andrew.kanner@gmail.com>
In-Reply-To: <20231007075148.1759-1-andrew.kanner@gmail.com>
To: Andrew Kanner <andrew.kanner@gmail.com>
Cc: xuanzhuo@linux.alibaba.com, maciej.fijalkowski@intel.com, hawk@kernel.org,
 daniel@iogearbox.net, syzbot+b132693e925cbbd89e26@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, john.fastabend@gmail.com,
 edumazet@google.com, ast@kernel.org, aleksander.lobakin@intel.com,
 bjorn@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathan.lemon@gmail.com, kuba@kernel.org, bpf@vger.kernel.org,
 pabeni@redhat.com, martin.lau@linux.dev, davem@davemloft.net,
 magnus.karlsson@intel.com,
 syzbot+fae676d3cf469331fc89@syzkaller.appspotmail.com
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hello:

This patch was applied to bpf/bpf.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Sat,  7 Oct 2023 10:51:49 +0300 you wrote:
> Syzkaller reported the following issue:
>  ------------[ cut here ]------------
>  WARNING: CPU: 0 PID: 2807 at mm/vmalloc.c:3247 __vmalloc_node_range (mm/vmalloc.c:3361)
>  Modules linked in:
>  CPU: 0 PID: 2807 Comm: repro Not tainted 6.6.0-rc2+ #12
>  Hardware name: Generic DT based system
>  unwind_backtrace from show_stack (arch/arm/kernel/traps.c:258)
>  show_stack from dump_stack_lvl (lib/dump_stack.c:107 (discriminator 1))
>  dump_stack_lvl from __warn (kernel/panic.c:633 kernel/panic.c:680)
>  __warn from warn_slowpath_fmt (./include/linux/context_tracking.h:153 kernel/panic.c:700)
>  warn_slowpath_fmt from __vmalloc_node_range (mm/vmalloc.c:3361 (discriminator 3))
>  __vmalloc_node_range from vmalloc_user (mm/vmalloc.c:3478)
>  vmalloc_user from xskq_create (net/xdp/xsk_queue.c:40)
>  xskq_create from xsk_setsockopt (net/xdp/xsk.c:953 net/xdp/xsk.c:1286)
>  xsk_setsockopt from __sys_setsockopt (net/socket.c:2308)
>  __sys_setsockopt from ret_fast_syscall (arch/arm/kernel/entry-common.S:68)
> 
> [...]

Here is the summary with links:
  - [bpf,v4] net/xdp: fix zero-size allocation warning in xskq_create()
    https://git.kernel.org/bpf/bpf/c/a12bbb3cccf0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
