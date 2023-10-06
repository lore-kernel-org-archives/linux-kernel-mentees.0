Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B10AE92FD1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Oct 2023 01:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D07D540BFB;
	Fri,  6 Oct 2023 01:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D07D540BFB
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hwGL3kkX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycmqySuuv_KX; Fri,  6 Oct 2023 01:06:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9EDBD40649;
	Fri,  6 Oct 2023 01:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EDBD40649
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75DA4C0071;
	Fri,  6 Oct 2023 01:06:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27847C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 01:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDF7541E31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 01:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDF7541E31
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=hwGL3kkX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2Ti9qITgaZr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 01:06:32 +0000 (UTC)
X-Greylist: delayed 332 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 06 Oct 2023 01:06:32 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 835EB41E2F
Received: from out-194.mta1.migadu.com (out-194.mta1.migadu.com
 [95.215.58.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 835EB41E2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 01:06:32 +0000 (UTC)
Message-ID: <7aa47549-5a95-22d7-1d03-ffdd251cec6d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1696554056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3uFabqeCC0ZaRLQsefD4hwIIguPVcY2YJuzj553oCas=;
 b=hwGL3kkX/wvNGM5EF592wWTbKt6DKNsaYezKHyVPJEY0O2hUwc/F/BRLiId2/qWzJT6N/C
 w8z+e8XnmevSY9uBv9ZZmir7GByWW/08ch2uBW/6wNFE30BD6sjQg4YmS6uzWUUjeL6uYk
 Id9AS6BVmiIk5Y3DZ8yXK9BHwqB6CAg=
Date: Thu, 5 Oct 2023 18:00:46 -0700
MIME-Version: 1.0
Subject: Re: [PATCH bpf v3] net/xdp: fix zero-size allocation warning in
 xskq_create()
Content-Language: en-US
To: Andrew Kanner <andrew.kanner@gmail.com>
References: <20231005193548.515-1-andrew.kanner@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <20231005193548.515-1-andrew.kanner@gmail.com>
X-Migadu-Flow: FLOW_OUT
Cc: xuanzhuo@linux.alibaba.com, daniel@iogearbox.net,
 maciej.fijalkowski@intel.com, hawk@kernel.org, edumazet@google.com,
 aleksander.lobakin@intel.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net,
 syzbot+b132693e925cbbd89e26@syzkaller.appspotmail.com, bjorn@kernel.org,
 ast@kernel.org, jonathan.lemon@gmail.com, kuba@kernel.org, bpf@vger.kernel.org,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+fae676d3cf469331fc89@syzkaller.appspotmail.com,
 magnus.karlsson@intel.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 10/5/23 12:35 PM, Andrew Kanner wrote:
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

Please ignore the pw-bot email. A question just came to my mind after applying.

> diff --git a/net/xdp/xsk_queue.c b/net/xdp/xsk_queue.c
> index f8905400ee07..c7e8bbb12752 100644
> --- a/net/xdp/xsk_queue.c
> +++ b/net/xdp/xsk_queue.c
> @@ -34,6 +34,11 @@ struct xsk_queue *xskq_create(u32 nentries, bool umem_queue)
>   	q->ring_mask = nentries - 1;
>   
>   	size = xskq_get_ring_size(q, umem_queue);
> +	if (unlikely(size == SIZE_MAX)) {

What if "size" is SIZE_MAX-1? Would it still overflow the PAGE_ALIGN below?

> +		kfree(q);
> +		return NULL;
> +	}
> +
>   	size = PAGE_ALIGN(size);
>   
>   	q->ring = vmalloc_user(size);

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
