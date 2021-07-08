Return-Path: <SRS0=J1f0=MA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A7CC07E96
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Jul 2021 17:06:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E094616EA
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Jul 2021 17:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E094616EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E27DA401C9;
	Thu,  8 Jul 2021 17:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qc9SzyEtkUQH; Thu,  8 Jul 2021 17:06:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9D7CA400D8;
	Thu,  8 Jul 2021 17:06:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86D16C0010;
	Thu,  8 Jul 2021 17:06:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A8AEC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 17:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57494415E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 17:06:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFhDqm-7zhFL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 17:06:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CA55415BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3fx3PknPwALzsgoH1BEN/LFvMNGd9Ult799sX+NQQtw=; b=ewNur+WRDTeCU1XmdHtflzT0wV
 BqTeEy3EhFKg1dnvnfooIBavr8RUDn3TLbL5etUV5VednLO7QODNyRteMI/Wp16CEHxARoWJHVKLe
 UQI3+ESuZjRuSlIbD5X+Aeyr4E9PTs2coRXnevJ/t1+VyNMGH30nMW4i0I+80SEOBQ3Q4s9FXRZA1
 h63kI1ofm68YL5xyjTUoyz6O9Dh5LTmmU6hinmg1sOffSJ6Kof1upMqfAnYlgrqVKbUsZ4nNoGlZM
 n8WK9px4nrQ+IIcYEp2s0ebhvZF6lqE+B3DlrPM7od9jcIxvkSLd0ii0yOvqGcfTor4RqEU8xBTvS
 oMLe0knQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1m1XSq-00DfW0-R8; Thu, 08 Jul 2021 17:05:31 +0000
Date: Thu, 8 Jul 2021 18:05:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Rafael Aquini <aquini@redhat.com>
Subject: Re: [PATCH] mm/page_alloc: Avoid page allocator recursion with
 pagesets.lock held
Message-ID: <YOcwWBJw4uZH8X3f@casper.infradead.org>
References: <20210708081434.GV3840@techsingularity.net>
 <YOb5OrkqjWu4TODN@optiplex-fbsd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YOb5OrkqjWu4TODN@optiplex-fbsd>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+127fd7828d6eeb611703@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, Zqiang <qiang.zhang@windriver.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
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

On Thu, Jul 08, 2021 at 09:10:18AM -0400, Rafael Aquini wrote:
> > There are a number of ways it could be fixed. The page owner code could
> > be audited to strip GFP flags that allow sleeping but it'll impair the
> > functionality of PAGE_OWNER if allocations fail. The bulk allocator
> > could add a special case to release/reacquire the lock for prep_new_page
> > and lookup PCP after the lock is reacquired at the cost of performance.
> > The patches requiring prep could be tracked using the least significant

If we're nitpicking changelogs, then s/patches/pages/

> > bit and looping through the array although it is more complicated for
> > the list interface. The options are relatively complex and the second
> > one still incurs a performance penalty when PAGE_OWNER is active so this
> > patch takes the simple approach -- disable bulk allocation of PAGE_OWNER is
>                                                             ^^^^
> Minor nit: s/of/if
> 
> > active. The caller will be forced to allocate one page at a time incurring
> > a performance penalty but PAGE_OWNER is already a performance penalty.

The thought occurs that all pages allocated this way will have the same
stack.  Someone suitably motivated could:

 - Refcount the stacks managed by page_owner
 - Generate the stack in the caller of alloc_bulk
 - Pass the stack in to a new __set_page_owner()

That's a lot of work; I'm not going to do it, and I don't think Mel
should either.  But if someone's looking for something to do ...
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
