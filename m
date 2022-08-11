Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E0DC19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Aug 2022 05:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BCA5417FA;
	Thu, 11 Aug 2022 05:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BCA5417FA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UXt6euGk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-GhMi8TDA_n; Thu, 11 Aug 2022 05:30:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D317A417E3;
	Thu, 11 Aug 2022 05:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D317A417E3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0FDFC0032;
	Thu, 11 Aug 2022 05:30:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65226C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Aug 2022 05:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3991B82D12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Aug 2022 05:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3991B82D12
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=UXt6euGk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1AZdzKswSiMp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Aug 2022 05:30:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EE8E82CFD
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EE8E82CFD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Aug 2022 05:30:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E13061360;
 Thu, 11 Aug 2022 05:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88263C433D7;
 Thu, 11 Aug 2022 05:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660195816;
 bh=EPkGtej6QWMX1FFY3687EVfa44VtrwczjURVrhNWWx0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=UXt6euGkfTwAQYt+UQPnRFYsnwhfzRp4nO2CCktvajntIKC0OI8+k40iK2kSe36uO
 8gUHUbNmdX35KrzpXV7yjZO2+vu0fIGZd5kG5FDu5h40UQAjCJm5mWEmiGmfySY+C5
 GeZ00yLo0iks5xt7nYOJbc4FyvbWzQPYSnIeIvdWprKRkT96a+o4kO5QUA7b4GVk3j
 hxVMvOvA5CzyUvxxge4SDewH5Kd1kEdKKSaQ/NdVeeciToTr7nZlZCpOXoL8G0wtiw
 sVUFNRrr1UdtcFx2XCFn1h42Jubbc0L3MifyzDwb/qTWwWSRBEXF3lknxdz7/IlJo9
 ucSh0w54h1Bpg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6D9FBC43143; Thu, 11 Aug 2022 05:30:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net v5 0/2] net: enhancements to sk_user_data field
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166019581644.16509.4729586700211293087.git-patchwork-notify@kernel.org>
Date: Thu, 11 Aug 2022 05:30:16 +0000
References: <cover.1659676823.git.yin31149@gmail.com>
In-Reply-To: <cover.1659676823.git.yin31149@gmail.com>
To: Hawkins Jiawei <yin31149@gmail.com>
Cc: syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com, paskripkin@gmail.com,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

This series was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  5 Aug 2022 15:36:48 +0800 you wrote:
> This patchset fixes refcount bug by adding SK_USER_DATA_PSOCK flag bit in
> sk_user_data field. The bug cause following info:
> 
> WARNING: CPU: 1 PID: 3605 at lib/refcount.c:19 refcount_warn_saturate+0xf4/0x1e0 lib/refcount.c:19
> Modules linked in:
> CPU: 1 PID: 3605 Comm: syz-executor208 Not tainted 5.18.0-syzkaller-03023-g7e062cda7d90 #0
>  <TASK>
>  __refcount_add_not_zero include/linux/refcount.h:163 [inline]
>  __refcount_inc_not_zero include/linux/refcount.h:227 [inline]
>  refcount_inc_not_zero include/linux/refcount.h:245 [inline]
>  sk_psock_get+0x3bc/0x410 include/linux/skmsg.h:439
>  tls_data_ready+0x6d/0x1b0 net/tls/tls_sw.c:2091
>  tcp_data_ready+0x106/0x520 net/ipv4/tcp_input.c:4983
>  tcp_data_queue+0x25f2/0x4c90 net/ipv4/tcp_input.c:5057
>  tcp_rcv_state_process+0x1774/0x4e80 net/ipv4/tcp_input.c:6659
>  tcp_v4_do_rcv+0x339/0x980 net/ipv4/tcp_ipv4.c:1682
>  sk_backlog_rcv include/net/sock.h:1061 [inline]
>  __release_sock+0x134/0x3b0 net/core/sock.c:2849
>  release_sock+0x54/0x1b0 net/core/sock.c:3404
>  inet_shutdown+0x1e0/0x430 net/ipv4/af_inet.c:909
>  __sys_shutdown_sock net/socket.c:2331 [inline]
>  __sys_shutdown_sock net/socket.c:2325 [inline]
>  __sys_shutdown+0xf1/0x1b0 net/socket.c:2343
>  __do_sys_shutdown net/socket.c:2351 [inline]
>  __se_sys_shutdown net/socket.c:2349 [inline]
>  __x64_sys_shutdown+0x50/0x70 net/socket.c:2349
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x46/0xb0
>  </TASK>
> 
> [...]

Here is the summary with links:
  - [net,v5,1/2] net: fix refcount bug in sk_psock_get (2)
    https://git.kernel.org/netdev/net/c/2a0133723f9e
  - [net,v5,2/2] net: refactor bpf_sk_reuseport_detach()
    https://git.kernel.org/netdev/net/c/cf8c1e967224

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
