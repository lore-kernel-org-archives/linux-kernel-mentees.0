Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D89E936EC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Oct 2023 23:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D88282B1E;
	Wed,  4 Oct 2023 23:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D88282B1E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.a=rsa-sha256 header.s=default2302 header.b=gcc5n7j+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6f9FNsx4sx6O; Wed,  4 Oct 2023 23:13:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 027A382B08;
	Wed,  4 Oct 2023 23:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 027A382B08
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D31EFC0071;
	Wed,  4 Oct 2023 23:13:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0AD66C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 23:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E14C7404A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 23:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E14C7404A6
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net
 header.a=rsa-sha256 header.s=default2302 header.b=gcc5n7j+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSfOizkn40ny
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 23:13:24 +0000 (UTC)
X-Greylist: delayed 1418 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 04 Oct 2023 23:13:24 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29CF140298
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29CF140298
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 23:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=vWfPBmVLeQXvNBaHWwvs1Vm71L3cF8pziV6NRFnEObE=; b=gcc5n7j+Yv+2SUrlKRcu6xvT+w
 zwEaP4tXzG3Afc7t9d1u/W/fwVD8Ultjk1EF87hBBruppP4bAeil+GlOYsalD/j5eB3d5MgReC0CI
 ZJv7w7k1ZeTsSJWuRlgYAooBjwK388v6IndPZhSgbx5RLEMIsm1M3Dn+oRUEwPcecw/l3vUIr6umv
 4wu1VfqblEgnqC3QSEQZUyLuJm7/8sfqQQyrKtAD/og2eiQMBNPrPD4GtqFxUmePjiWsCZQfR6jUz
 VTE1ePaX/a7fuzOTg+DfyBry3M+3QPPasnqM+HxXj8HKG75nNKSGlX1xP5ZVpUDkFYSqXBzlP3qb0
 pm5PY9fQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <daniel@iogearbox.net>)
 id 1qoAgG-000AyU-Hq; Thu, 05 Oct 2023 00:49:24 +0200
Received: from [85.1.206.226] (helo=linux.home)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1qoAgF-000Dwl-Su; Thu, 05 Oct 2023 00:49:23 +0200
Subject: Re: [PATCH net-next v2] net/xdp: fix zero-size allocation warning in
 xskq_create()
To: Andrew Kanner <andrew.kanner@gmail.com>, bjorn@kernel.org,
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
 jonathan.lemon@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, aleksander.lobakin@intel.com,
 xuanzhuo@linux.alibaba.com, ast@kernel.org, hawk@kernel.org,
 john.fastabend@gmail.com
References: <20231002222939.1519-1-andrew.kanner@gmail.com>
Message-ID: <2f5abbf8-8d50-3deb-19cd-9bfd654e1ceb@iogearbox.net>
Date: Thu, 5 Oct 2023 00:49:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20231002222939.1519-1-andrew.kanner@gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27051/Wed Oct  4 09:39:04 2023)
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
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
From: Daniel Borkmann via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Daniel Borkmann <daniel@iogearbox.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 10/3/23 12:29 AM, Andrew Kanner wrote:
> Syzkaller reported the following issue:
>   ------------[ cut here ]------------
>   WARNING: CPU: 0 PID: 2807 at mm/vmalloc.c:3247 __vmalloc_node_range (mm/vmalloc.c:3361)
>   Modules linked in:
>   CPU: 0 PID: 2807 Comm: repro Not tainted 6.6.0-rc2+ #12
>   Hardware name: Generic DT based system
>   unwind_backtrace from show_stack (arch/arm/kernel/traps.c:258)
>   show_stack from dump_stack_lvl (lib/dump_stack.c:107 (discriminator 1))
>   dump_stack_lvl from __warn (kernel/panic.c:633 kernel/panic.c:680)
>   __warn from warn_slowpath_fmt (./include/linux/context_tracking.h:153 kernel/panic.c:700)
>   warn_slowpath_fmt from __vmalloc_node_range (mm/vmalloc.c:3361 (discriminator 3))
>   __vmalloc_node_range from vmalloc_user (mm/vmalloc.c:3478)
>   vmalloc_user from xskq_create (net/xdp/xsk_queue.c:40)
>   xskq_create from xsk_setsockopt (net/xdp/xsk.c:953 net/xdp/xsk.c:1286)
>   xsk_setsockopt from __sys_setsockopt (net/socket.c:2308)
>   __sys_setsockopt from ret_fast_syscall (arch/arm/kernel/entry-common.S:68)
> 
> xskq_get_ring_size() uses struct_size() macro to safely calculate the
> size of struct xsk_queue and q->nentries of desc members. But the
> syzkaller repro was able to set q->nentries with the value initially
> taken from copy_from_sockptr() high enough to return SIZE_MAX by
> struct_size(). The next PAGE_ALIGN(size) is such case will overflow
> the size_t value and set it to 0. This will trigger WARN_ON_ONCE in
> vmalloc_user() -> __vmalloc_node_range().
> 
> The issue is reproducible on 32-bit arm kernel.
> 
> Reported-and-tested-by: syzbot+fae676d3cf469331fc89@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/000000000000c84b4705fb31741e@google.com/T/
> Link: https://syzkaller.appspot.com/bug?extid=fae676d3cf469331fc89
> Fixes: 9f78bf330a66 ("xsk: support use vaddr as ring")
> Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>

I guess also:

Reported-by: syzbot+b132693e925cbbd89e26@syzkaller.appspotmail.com

Moreover, this fix is needed in bpf/net tree (as opposed to *-next tree), right?

>   net/xdp/xsk_queue.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/net/xdp/xsk_queue.c b/net/xdp/xsk_queue.c
> index f8905400ee07..b03d1bfb6978 100644
> --- a/net/xdp/xsk_queue.c
> +++ b/net/xdp/xsk_queue.c
> @@ -34,6 +34,9 @@ struct xsk_queue *xskq_create(u32 nentries, bool umem_queue)
>   	q->ring_mask = nentries - 1;
>   
>   	size = xskq_get_ring_size(q, umem_queue);
> +	if (unlikely(size == SIZE_MAX))
> +		return NULL;

Doesn't this leak q here ?

>   	size = PAGE_ALIGN(size);
>   
>   	q->ring = vmalloc_user(size);
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
