Return-Path: <SRS0=J1f0=MA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49B5C07E9B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Jul 2021 01:48:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7406861C5B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Jul 2021 01:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7406861C5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C49782F19;
	Thu,  8 Jul 2021 01:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAG4VOYYjV8f; Thu,  8 Jul 2021 01:48:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 47A8682C18;
	Thu,  8 Jul 2021 01:48:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BCA8C001A;
	Thu,  8 Jul 2021 01:48:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E62A3C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 01:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF03C401FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 01:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2357ny2ynHBZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 01:48:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEDD5400EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 01:48:35 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso2792447pjp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 07 Jul 2021 18:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AeCyKvKQjgmbacxYTAcqC8M+hyMuT56UzWGesj9goYg=;
 b=siCDe7rwb2ksD6+7NOE34Ocen/HSi/o1yJ7IAZzHsyweZpBFrCGImKGVxejhS1n8MI
 kqwQhzBo9C7tcww+xSojdDNMcmC0k1socuPX8ytj+nAIQAPg52mv6Mw+IFQL0/D6BAky
 MzhNJwvP8j+nyJafuNSYnXxp3ti9QEpf0twpgad9tQpn8qgi8SXslClYCl++qLV/DUlV
 G/ps+yrBzYxqWs1TVSpMZ/zMlei4q4otMoHT9eww9n3Qo4viqWa3kkOrCrocEaalwZ3v
 dcIJtp3uPJuq8APM3qJ6+tQ+RT2lheabEfMUaMPxWONa7ZAJBCe9zARYTCWaYdvWBxO/
 3SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AeCyKvKQjgmbacxYTAcqC8M+hyMuT56UzWGesj9goYg=;
 b=WuljjIHVixcTkozr/5Jn/JznvcwBNMv+dW4rYyAU68NeLrI7OIj7ThEOxCFFzCIser
 QODIDgHNOLXJ7/imZCw6jAPgAzLVBXcn9FkIeaMTCbvix5HaZkhuXgjM+wO6zN0rBXz1
 CdklJUmakr//ioBTvMEygUNt+3l0+xqQzpfAGupqTLENNgvB5sllL4P9Ow4QQfIlfWJz
 yHe+s1A2Pl5vxxfKDA/ZW62866hlEYv6bwHD3bl9JrlyfYy7DcMjecmyR3G3UMPDsptJ
 LNWZDcLpQCfq1T/XE2nakGeUN0juLZuAZDO97y+hRPQMHu4j5iq0/sG4N7pbJO6TzeQC
 WY9w==
X-Gm-Message-State: AOAM533BnaX4hILPrIp25p8JoF1D8ZrJEaFLBk2pLzVUEP2hhXg9j2b2
 kjGBXpeXlNyOWp4L6YM+cAM=
X-Google-Smtp-Source: ABdhPJzI5BPhJfGVIvS5ui2RLQoxj/N7aDPdHcN6muKl2SFYbNtxFaz9hUUf4LC/1my2BpehQLQUXA==
X-Received: by 2002:a17:902:b7c5:b029:128:e537:52f7 with SMTP id
 v5-20020a170902b7c5b0290128e53752f7mr23815836plz.59.1625708915349; 
 Wed, 07 Jul 2021 18:48:35 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id y1sm498995pfe.72.2021.07.07.18.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 18:48:34 -0700 (PDT)
Subject: Re: [PATCH] mm/page_alloc: avoid deadlocks for &pagesets.lock
To: Mel Gorman <mgorman@techsingularity.net>
References: <20210707111245.625374-1-desmondcheongzx@gmail.com>
 <20210707122530.GU3840@techsingularity.net>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <b97a32b7-8b63-9f34-395c-bf902aa8a6d2@gmail.com>
Date: Thu, 8 Jul 2021 09:48:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707122530.GU3840@techsingularity.net>
Content-Language: en-US
Cc: syzbot+127fd7828d6eeb611703@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, Zqiang <qiang.zhang@windriver.com>,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 7/7/21 8:25 pm, Mel Gorman wrote:
> On Wed, Jul 07, 2021 at 07:12:45PM +0800, Desmond Cheong Zhi Xi wrote:
>> Syzbot reports a number of potential deadlocks for &pagesets.lock. It
>> seems that this new lock is being used as both an inner and outer
>> lock, which makes it prone to creating circular dependencies.
>>
>> For example, one such call trace goes as follows:
>>    __alloc_pages_bulk()
>>      local_lock_irqsave(&pagesets.lock, flags) <---- outer lock here
>>      prep_new_page():
>>        post_alloc_hook():
>>          set_page_owner():
>>            __set_page_owner():
>>              save_stack():
>>                stack_depot_save():
>>                  alloc_pages():
>>                    alloc_page_interleave():
>>                      __alloc_pages():
>>                        get_page_from_freelist():
>>                          rm_queue():
>>                            rm_queue_pcplist():
>>                              local_lock_irqsave(&pagesets.lock, flags);
>>                              *** DEADLOCK ***
>>
>> The common culprit for the lockdep splats seems to be the call to
>> local_lock_irqsave(&pagesets.lock, flags) inside
>> __alloc_pages_bulk(). &pagesets.lock becomes an outer lock if it's
>> held during the call to prep_new_page().
>>
>> As the local lock is used to protect the PCP structure, we adjust the
>> locking in __alloc_pages_bulk so that only the necessary structures
>> are protected.
>>
>> Fixes: dbbee9d5cd83 ("mm/page_alloc: convert per-cpu list protection to local_lock")
>> Reported-and-tested-by: syzbot+127fd7828d6eeb611703@syzkaller.appspotmail.com
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> 
> Hi Desmond,
> 
> Thanks for the report. Unfortunately, this patch incurs a performance
> penalty for the bulk allocator even if PAGE_OWNER is disabled. Can you
> try the following as an alternative please? It passed a build and boot
> test but I didn't try triggering the actual bug.
> 

Hi Mel,

Thanks for the feedback, I hadn't thought of the performance penalty. I 
think you're right that if the recursive call to __set_page_owner is 
avoided, then that also avoids creating the circular lock hierarchy.

Your proposed patch passed the Syzbot repro test:

Reported-and-tested-by: 
syzbot+127fd7828d6eeb611703@syzkaller.appspotmail.com

Best wishes,
Desmond

> --8<--
> mm/page_alloc: Avoid page allocator recursion with pagesets.lock held
> 
> Syzbot is reporting potential deadlocks due to pagesets.lock when
> PAGE_OWNER is enabled. One example from Desmond Cheong Zhi Xi is
> as follows
> 
>    __alloc_pages_bulk()
>      local_lock_irqsave(&pagesets.lock, flags) <---- outer lock here
>      prep_new_page():
>        post_alloc_hook():
>          set_page_owner():
>            __set_page_owner():
>              save_stack():
>                stack_depot_save():
>                  alloc_pages():
>                    alloc_page_interleave():
>                      __alloc_pages():
>                        get_page_from_freelist():
>                          rm_queue():
>                            rm_queue_pcplist():
>                              local_lock_irqsave(&pagesets.lock, flags);
>                              *** DEADLOCK ***
> 
> Zhang, Qiang also reported
> 
>    BUG: sleeping function called from invalid context at mm/page_alloc.c:5179
>    in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
>    .....
>    __dump_stack lib/dump_stack.c:79 [inline]
>    dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:96
>    ___might_sleep.cold+0x1f1/0x237 kernel/sched/core.c:9153
>    prepare_alloc_pages+0x3da/0x580 mm/page_alloc.c:5179
>    __alloc_pages+0x12f/0x500 mm/page_alloc.c:5375
>    alloc_page_interleave+0x1e/0x200 mm/mempolicy.c:2147
>    alloc_pages+0x238/0x2a0 mm/mempolicy.c:2270
>    stack_depot_save+0x39d/0x4e0 lib/stackdepot.c:303
>    save_stack+0x15e/0x1e0 mm/page_owner.c:120
>    __set_page_owner+0x50/0x290 mm/page_owner.c:181
>    prep_new_page mm/page_alloc.c:2445 [inline]
>    __alloc_pages_bulk+0x8b9/0x1870 mm/page_alloc.c:5313
>    alloc_pages_bulk_array_node include/linux/gfp.h:557 [inline]
>    vm_area_alloc_pages mm/vmalloc.c:2775 [inline]
>    __vmalloc_area_node mm/vmalloc.c:2845 [inline]
>    __vmalloc_node_range+0x39d/0x960 mm/vmalloc.c:2947
>    __vmalloc_node mm/vmalloc.c:2996 [inline]
>    vzalloc+0x67/0x80 mm/vmalloc.c:3066
> 
> There are a number of ways it could be fixed. The page owner code could
> be audited to strip GFP flags that allow sleeping but it'll impair the
> functionality of PAGE_OWNER if allocations fail. The bulk allocator
> could add a special case to release/reacquire the lock for prep_new_page
> and lookup PCP after the lock is reacquired at the cost of performance.
> Both options are relatively complex and the second one still incurs a
> performance penalty when PAGE_OWNER is active so this patch takes the
> simple approach -- disable bulk allocation of PAGE_OWNER is active. The
> caller will be forced to allocate one page at a time incurring a
> performance penalty but PAGE_OWNER is already a performance penalty.
> 
> Fixes: dbbee9d5cd83 ("mm/page_alloc: convert per-cpu list protection to local_lock")
> Reported-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> Reported-by: "Zhang, Qiang" <Qiang.Zhang@windriver.com>
> Reported-by: syzbot+127fd7828d6eeb611703@syzkaller.appspotmail.com
> Signed-off-by: Mel Gorman <mgorman@techsingularity.net>
> ---
>   mm/page_alloc.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 3b97e17806be..6ef86f338151 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -5239,6 +5239,18 @@ unsigned long __alloc_pages_bulk(gfp_t gfp, int preferred_nid,
>   	if (nr_pages - nr_populated == 1)
>   		goto failed;
>   
> +#ifdef CONFIG_PAGE_OWNER
> +	/*
> +	 * PAGE_OWNER may recurse into the allocator to allocate space to
> +	 * save the stack with pagesets.lock held. Releasing/reacquiring
> +	 * removes much of the performance benefit of bulk allocation so
> +	 * force the caller to allocate one page at a time as it'll have
> +	 * similar performance to added complexity to the bulk allocator.
> +	 */
> +	if (static_branch_unlikely(&page_owner_inited))
> +		goto failed;
> +#endif
> +
>   	/* May set ALLOC_NOFRAGMENT, fragmentation will return 1 page. */
>   	gfp &= gfp_allowed_mask;
>   	alloc_gfp = gfp;
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
