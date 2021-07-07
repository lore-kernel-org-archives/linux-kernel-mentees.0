Return-Path: <SRS0=i5R+=L7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6F4C07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 12:32:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C62AF61CA8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 12:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C62AF61CA8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BFE940282;
	Wed,  7 Jul 2021 12:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qt3RmwZlRHKD; Wed,  7 Jul 2021 12:32:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 95C2440107;
	Wed,  7 Jul 2021 12:32:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BF8BC0010;
	Wed,  7 Jul 2021 12:32:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D4C1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 12:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFEAA4041A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 12:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RB7iCfvGSogw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 12:31:59 +0000 (UTC)
X-Greylist: delayed 00:06:24 by SQLgrey-1.8.0
Received: from outbound-smtp16.blacknight.com (outbound-smtp16.blacknight.com
 [46.22.139.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A2E0403A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 12:31:59 +0000 (UTC)
Received: from mail.blacknight.com (pemlinmail05.blacknight.ie [81.17.254.26])
 by outbound-smtp16.blacknight.com (Postfix) with ESMTPS id
 210301C4580 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 13:25:32 +0100 (IST)
Received: (qmail 16988 invoked from network); 7 Jul 2021 12:25:31 -0000
Received: from unknown (HELO techsingularity.net)
 (mgorman@techsingularity.net@[84.203.17.255])
 by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated);
 7 Jul 2021 12:25:31 -0000
Date: Wed, 7 Jul 2021 13:25:30 +0100
From: Mel Gorman <mgorman@techsingularity.net>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH] mm/page_alloc: avoid deadlocks for &pagesets.lock
Message-ID: <20210707122530.GU3840@techsingularity.net>
References: <20210707111245.625374-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210707111245.625374-1-desmondcheongzx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Jul 07, 2021 at 07:12:45PM +0800, Desmond Cheong Zhi Xi wrote:
> Syzbot reports a number of potential deadlocks for &pagesets.lock. It
> seems that this new lock is being used as both an inner and outer
> lock, which makes it prone to creating circular dependencies.
> 
> For example, one such call trace goes as follows:
>   __alloc_pages_bulk()
>     local_lock_irqsave(&pagesets.lock, flags) <---- outer lock here
>     prep_new_page():
>       post_alloc_hook():
>         set_page_owner():
>           __set_page_owner():
>             save_stack():
>               stack_depot_save():
>                 alloc_pages():
>                   alloc_page_interleave():
>                     __alloc_pages():
>                       get_page_from_freelist():
>                         rm_queue():
>                           rm_queue_pcplist():
>                             local_lock_irqsave(&pagesets.lock, flags);
>                             *** DEADLOCK ***
> 
> The common culprit for the lockdep splats seems to be the call to
> local_lock_irqsave(&pagesets.lock, flags) inside
> __alloc_pages_bulk(). &pagesets.lock becomes an outer lock if it's
> held during the call to prep_new_page().
> 
> As the local lock is used to protect the PCP structure, we adjust the
> locking in __alloc_pages_bulk so that only the necessary structures
> are protected.
> 
> Fixes: dbbee9d5cd83 ("mm/page_alloc: convert per-cpu list protection to local_lock")
> Reported-and-tested-by: syzbot+127fd7828d6eeb611703@syzkaller.appspotmail.com
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Hi Desmond,

Thanks for the report. Unfortunately, this patch incurs a performance
penalty for the bulk allocator even if PAGE_OWNER is disabled. Can you
try the following as an alternative please? It passed a build and boot
test but I didn't try triggering the actual bug.

--8<--
mm/page_alloc: Avoid page allocator recursion with pagesets.lock held

Syzbot is reporting potential deadlocks due to pagesets.lock when
PAGE_OWNER is enabled. One example from Desmond Cheong Zhi Xi is
as follows

  __alloc_pages_bulk()
    local_lock_irqsave(&pagesets.lock, flags) <---- outer lock here
    prep_new_page():
      post_alloc_hook():
        set_page_owner():
          __set_page_owner():
            save_stack():
              stack_depot_save():
                alloc_pages():
                  alloc_page_interleave():
                    __alloc_pages():
                      get_page_from_freelist():
                        rm_queue():
                          rm_queue_pcplist():
                            local_lock_irqsave(&pagesets.lock, flags);
                            *** DEADLOCK ***

Zhang, Qiang also reported

  BUG: sleeping function called from invalid context at mm/page_alloc.c:5179
  in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
  .....
  __dump_stack lib/dump_stack.c:79 [inline]
  dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:96
  ___might_sleep.cold+0x1f1/0x237 kernel/sched/core.c:9153
  prepare_alloc_pages+0x3da/0x580 mm/page_alloc.c:5179
  __alloc_pages+0x12f/0x500 mm/page_alloc.c:5375
  alloc_page_interleave+0x1e/0x200 mm/mempolicy.c:2147
  alloc_pages+0x238/0x2a0 mm/mempolicy.c:2270
  stack_depot_save+0x39d/0x4e0 lib/stackdepot.c:303
  save_stack+0x15e/0x1e0 mm/page_owner.c:120
  __set_page_owner+0x50/0x290 mm/page_owner.c:181
  prep_new_page mm/page_alloc.c:2445 [inline]
  __alloc_pages_bulk+0x8b9/0x1870 mm/page_alloc.c:5313
  alloc_pages_bulk_array_node include/linux/gfp.h:557 [inline]
  vm_area_alloc_pages mm/vmalloc.c:2775 [inline]
  __vmalloc_area_node mm/vmalloc.c:2845 [inline]
  __vmalloc_node_range+0x39d/0x960 mm/vmalloc.c:2947
  __vmalloc_node mm/vmalloc.c:2996 [inline]
  vzalloc+0x67/0x80 mm/vmalloc.c:3066

There are a number of ways it could be fixed. The page owner code could
be audited to strip GFP flags that allow sleeping but it'll impair the
functionality of PAGE_OWNER if allocations fail. The bulk allocator
could add a special case to release/reacquire the lock for prep_new_page
and lookup PCP after the lock is reacquired at the cost of performance.
Both options are relatively complex and the second one still incurs a
performance penalty when PAGE_OWNER is active so this patch takes the
simple approach -- disable bulk allocation of PAGE_OWNER is active. The
caller will be forced to allocate one page at a time incurring a
performance penalty but PAGE_OWNER is already a performance penalty.

Fixes: dbbee9d5cd83 ("mm/page_alloc: convert per-cpu list protection to local_lock")
Reported-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reported-by: "Zhang, Qiang" <Qiang.Zhang@windriver.com>
Reported-by: syzbot+127fd7828d6eeb611703@syzkaller.appspotmail.com
Signed-off-by: Mel Gorman <mgorman@techsingularity.net>
---
 mm/page_alloc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 3b97e17806be..6ef86f338151 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5239,6 +5239,18 @@ unsigned long __alloc_pages_bulk(gfp_t gfp, int preferred_nid,
 	if (nr_pages - nr_populated == 1)
 		goto failed;
 
+#ifdef CONFIG_PAGE_OWNER
+	/*
+	 * PAGE_OWNER may recurse into the allocator to allocate space to
+	 * save the stack with pagesets.lock held. Releasing/reacquiring
+	 * removes much of the performance benefit of bulk allocation so
+	 * force the caller to allocate one page at a time as it'll have
+	 * similar performance to added complexity to the bulk allocator.
+	 */
+	if (static_branch_unlikely(&page_owner_inited))
+		goto failed;
+#endif
+
 	/* May set ALLOC_NOFRAGMENT, fragmentation will return 1 page. */
 	gfp &= gfp_allowed_mask;
 	alloc_gfp = gfp;
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
