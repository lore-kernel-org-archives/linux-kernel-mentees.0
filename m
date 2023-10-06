Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411F0E81E1E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Oct 2023 17:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C8742CF0;
	Fri,  6 Oct 2023 17:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93C8742CF0
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WfD9FbXP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxdPmdVxQAGc; Fri,  6 Oct 2023 17:46:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0954341F58;
	Fri,  6 Oct 2023 17:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0954341F58
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5F94C0071;
	Fri,  6 Oct 2023 17:46:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80DDDC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 17:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E13E83BE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 17:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E13E83BE9
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=WfD9FbXP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x1g9h3DZCRS6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 17:46:47 +0000 (UTC)
X-Greylist: delayed 528 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 06 Oct 2023 17:46:47 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04ECA83BD5
Received: from out-203.mta0.migadu.com (out-203.mta0.migadu.com
 [91.218.175.203])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04ECA83BD5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 17:46:46 +0000 (UTC)
Message-ID: <57c35480-983d-2056-1d72-f6e555069b83@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1696613876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qpXKuzg71AgBMcaKo6kzSKg7OXzsFHX5EQqRaIUxIhA=;
 b=WfD9FbXP+XfaMTekiCdxwIA2Ul/LvowsY4QBrZ5BWJNt6IM4YA16uruGqTq54eIe4xeXf6
 pPDH/1uRgfEVVr24mekBmZ544XqEhwaPL+soaK/g99hIBxGcRgu0DCFI6WceegYvhmfhzv
 rtE8yomic9cJM1uYaQGbmi3/EfQMvfM=
Date: Fri, 6 Oct 2023 10:37:44 -0700
MIME-Version: 1.0
Subject: Re: [PATCH bpf v3] net/xdp: fix zero-size allocation warning in
 xskq_create()
Content-Language: en-US
To: Andrew Kanner <andrew.kanner@gmail.com>
References: <20231005193548.515-1-andrew.kanner@gmail.com>
 <7aa47549-5a95-22d7-1d03-ffdd251cec6d@linux.dev>
 <651fb2a8.c20a0220.8d6c3.0fd9@mx.google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <651fb2a8.c20a0220.8d6c3.0fd9@mx.google.com>
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

On 10/6/23 12:09 AM, Andrew Kanner wrote:
> On Thu, Oct 05, 2023 at 06:00:46PM -0700, Martin KaFai Lau wrote:
> [...]
>>> diff --git a/net/xdp/xsk_queue.c b/net/xdp/xsk_queue.c
>>> index f8905400ee07..c7e8bbb12752 100644
>>> --- a/net/xdp/xsk_queue.c
>>> +++ b/net/xdp/xsk_queue.c
>>> @@ -34,6 +34,11 @@ struct xsk_queue *xskq_create(u32 nentries, bool umem_queue)
>>>    	q->ring_mask = nentries - 1;
>>>    	size = xskq_get_ring_size(q, umem_queue);
>>> +	if (unlikely(size == SIZE_MAX)) {
>>
>> What if "size" is SIZE_MAX-1? Would it still overflow the PAGE_ALIGN below?
>>
>>> +		kfree(q);
>>> +		return NULL;
>>> +	}
>>> +
>>>    	size = PAGE_ALIGN(size);
>>>    	q->ring = vmalloc_user(size);
>>
> 
> I asked myself the same question before v1. E.g. thinking about the
> check: (size > SIZE_MAX - PAGE_SIZE + 1)
> 
> But xskq_create() is called after the check for
> !is_power_of_2(entries) in xsk_init_queue(). So I tried the same
> reproducer and divided the (nentries) value by 2 in a loop - it hits
> either SIZE_MAX case or the normal cases without overflow (sometimes
> throwing vmalloc error complaining about size which exceed total pages
> in my arm setup).
> 
> So I can't see a way size will be SIZE_MAX-1, etc. Correct me if I'm
> wrong, please.
> 
> PS: In the output below the first 2 values of (nentries) hit SIZE_MAX

Thanks for the explanation, so iiuc it means it will overflow the struct_size() 
first because of the is_power_of_2(nentries) requirement? Could you help adding 
some comment to explain? Thanks.

> case, the rest hit the normal case, vmalloc_user() is complaining
> about 1 allocation:
> 
> 0x20000000
> 0x10000000
> 0x8000000
> [   41.759195][ T2807] pre PAGE_ALIGN size = 2147483968 (0x80000140), PAGE_SIZE = 4096 (0x1000)
> [   41.759621][ T2807] repro-iter: vmalloc error: size 2147487744, exceeds total pages, mode:0xdc0(GFP_KERNEL|__GFP_ZERO), nodemask=(null),cpuset=/,mems_allowed=0
> [...]
> 0x4000000
> 0x2000000
> 0x1000000
> 0x800000
> 0x400000
> 0x200000
> 0x100000
> 0x80000
> 0x40000
> 0x20000
> 0x10000
> 0x8000
> 0x4000
> 0x2000
> 0x1000
> 0x800
> 0x400
> 0x200
> 0x100
> 0x80
> 0x40
> 0x20
> 0x10
> 0x8
> 0x4
> 0x2
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
