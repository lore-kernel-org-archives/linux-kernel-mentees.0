Return-Path: <SRS0=i5R+=L7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBDDC07E9E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 11:13:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB07F61C88
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 11:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB07F61C88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93AE4836A5;
	Wed,  7 Jul 2021 11:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBfbNHgHa6Zw; Wed,  7 Jul 2021 11:13:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7A35683578;
	Wed,  7 Jul 2021 11:13:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55200C001A;
	Wed,  7 Jul 2021 11:13:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 378C6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 11:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2711483578
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 11:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rctC0ScgtvNW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 11:13:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87D6683396
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 11:13:36 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id f5so1872264pgv.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 07 Jul 2021 04:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZdzfnR4j5eQS/lxbgzCM8QfZTWzUyhCC6sdEedhtEac=;
 b=l5qvT9pK4sLGvXuFFcV6Xw0M5gy0owqlmoKq5yUKAd6+LmwxFt8cfQYuxsKzbXGTdf
 f836Fm5gfNv1ml0LuQ1yH3ewcDtCD2w2tqm1QNX1iUGsjXm7KC5dK/wHq0c1mX4AmXXM
 TldtoS2fNCFNgY+rVrVTB3Z74ZZUnKHAb2q2465brs3iENz8716C5cBrNYN7VJUQNirK
 aBJdEcaTydHg5fqSeVLCfQSLy1hEztU2idlcRwzTfieccA/qk/Lqr3ZGLJgfdsc9L7zQ
 d63pu8Ae5moDd04el4WrVyrMa8v70EdVKsLR26jLvOFSCJ2lRuGeO8iyMNkj2QxJinz7
 yIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZdzfnR4j5eQS/lxbgzCM8QfZTWzUyhCC6sdEedhtEac=;
 b=KUTEW6g1DWkxcXGeB78BvKcnrhmpnRmt7gqXORb6/MRfn9ae296xIW7x/cM3PVJQOl
 023BMjLg///xP+yP1Sr3MaI9EpGsXykhY/51084P7gzj/6Cmz0pGZ+U/Zi65/o+9DMPK
 Tsb9oj/k0+VH8nogost0OsOMyosXBO/LXQAgJa2Uj10nzToVhhMFRK1ebaisbXrXP5LC
 4rsFbwj7x5UTY0xHOOjWfrqvjsMJLuKxucyJDclNDa2l/Sb5CUKOogBInWREjEjAzXmB
 RotAX+hk26GswB7C51Uzsx4Dy0ocp8A+C8LO8XwwEgyBcOHFpwucBlnyBJ4BNUQ2hZx1
 B0oQ==
X-Gm-Message-State: AOAM530Lb3Dh02QHDkHO1JkhMlfp9C20ABftr7agAdWr/QyETdPozkF5
 34N86JiblcePwoicJPADW7M=
X-Google-Smtp-Source: ABdhPJxBfBQ8Wo2ahM2ctn4u10fcGSESS6ZBw/A8VV8R4TJQJBRDdFLtmUkeJFchBFHaUWGBBSd6Gg==
X-Received: by 2002:a63:4201:: with SMTP id p1mr25888381pga.386.1625656415995; 
 Wed, 07 Jul 2021 04:13:35 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id k189sm18896577pgk.14.2021.07.07.04.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 04:13:35 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: akpm@linux-foundation.org,
	mgorman@techsingularity.net
Subject: [PATCH] mm/page_alloc: avoid deadlocks for &pagesets.lock
Date: Wed,  7 Jul 2021 19:12:45 +0800
Message-Id: <20210707111245.625374-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzbot+127fd7828d6eeb611703@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
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

Syzbot reports a number of potential deadlocks for &pagesets.lock. It
seems that this new lock is being used as both an inner and outer
lock, which makes it prone to creating circular dependencies.

For example, one such call trace goes as follows:
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

The common culprit for the lockdep splats seems to be the call to
local_lock_irqsave(&pagesets.lock, flags) inside
__alloc_pages_bulk(). &pagesets.lock becomes an outer lock if it's
held during the call to prep_new_page().

As the local lock is used to protect the PCP structure, we adjust the
locking in __alloc_pages_bulk so that only the necessary structures
are protected.

Fixes: dbbee9d5cd83 ("mm/page_alloc: convert per-cpu list protection to local_lock")
Reported-and-tested-by: syzbot+127fd7828d6eeb611703@syzkaller.appspotmail.com
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 mm/page_alloc.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0817d88383d5..0e005b1a60e3 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5288,10 +5288,6 @@ unsigned long __alloc_pages_bulk(gfp_t gfp, int preferred_nid,
 		goto failed;
 
 	/* Attempt the batch allocation */
-	local_lock_irqsave(&pagesets.lock, flags);
-	pcp = this_cpu_ptr(zone->per_cpu_pageset);
-	pcp_list = &pcp->lists[order_to_pindex(ac.migratetype, 0)];
-
 	while (nr_populated < nr_pages) {
 
 		/* Skip existing pages */
@@ -5300,12 +5296,16 @@ unsigned long __alloc_pages_bulk(gfp_t gfp, int preferred_nid,
 			continue;
 		}
 
+		local_lock_irqsave(&pagesets.lock, flags);
+		pcp = this_cpu_ptr(zone->per_cpu_pageset);
+		pcp_list = &pcp->lists[order_to_pindex(ac.migratetype, 0)];
 		page = __rmqueue_pcplist(zone, 0, ac.migratetype, alloc_flags,
 								pcp, pcp_list);
+		local_unlock_irqrestore(&pagesets.lock, flags);
 		if (unlikely(!page)) {
 			/* Try and get at least one page */
 			if (!nr_populated)
-				goto failed_irq;
+				goto failed;
 			break;
 		}
 		nr_account++;
@@ -5318,16 +5318,11 @@ unsigned long __alloc_pages_bulk(gfp_t gfp, int preferred_nid,
 		nr_populated++;
 	}
 
-	local_unlock_irqrestore(&pagesets.lock, flags);
-
 	__count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
 	zone_statistics(ac.preferred_zoneref->zone, zone, nr_account);
 
 	return nr_populated;
 
-failed_irq:
-	local_unlock_irqrestore(&pagesets.lock, flags);
-
 failed:
 	page = __alloc_pages(gfp, 0, preferred_nid, nodemask);
 	if (page) {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
