Return-Path: <SRS0=BMuY=36=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428B7C352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 13:35:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D5620863
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 13:35:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AJMpgVkV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09D5620863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BA3B18567A;
	Mon, 10 Feb 2020 13:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NoCdq96xOx4Y; Mon, 10 Feb 2020 13:35:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 450AC82713;
	Mon, 10 Feb 2020 13:35:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C004C1796;
	Mon, 10 Feb 2020 13:35:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6979FC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 13:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 563E485022
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 13:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrMhv1m0tutU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 13:35:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9C63E82713
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GPPTGGCsRaytIz1LpgQIb2TA2p+fTyCYKNF1pAC5bG4=; b=AJMpgVkVmCduDmkUDkFI4Q6Ve0
 n861FSp5OdNAlagaT4f/pBQ26Pe4rHAfaU62EOxUI72Um/BdtZGXQFjqHcJoR36KiUQrvnnNzcqPl
 9jYruYDZBmad2L3X/R5ClNIUQO32OCiiA8QXAQGGInaeH8dhHlnQxDV8uzaHdVO+YxFAdN9fkJeru
 VwoepytTdDPFdNWgUQ7nA+3aUyNHnUSPnn+F0XY7KoX25L+/HpcNN0ajmyl+mxNZMWNtyDu+JMrvw
 ZT+VnylQiEBuaUyx3oh11pgOfCOy5o+qJYwJNbgRiSuWZk5rb9vtFDbJRsxpoXj3UEE44Qq7mKXn9
 qAHA2ycQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j19DI-0006c3-NL; Mon, 10 Feb 2020 13:35:00 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C56B630066E;
 Mon, 10 Feb 2020 14:33:10 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0CA2829C83CBE; Mon, 10 Feb 2020 14:34:59 +0100 (CET)
Date: Mon, 10 Feb 2020 14:34:59 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200210133459.GJ14897@hirez.programming.kicks-ass.net>
References: <20200208144648.18833-1-frextrite@gmail.com>
 <20200210093624.GB14879@hirez.programming.kicks-ass.net>
 <20200210125948.GA16485@workstation-portable>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210125948.GA16485@workstation-portable>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] events: Annotate parent_ctx with
	__rcu
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

On Mon, Feb 10, 2020 at 06:29:48PM +0530, Amol Grover wrote:
> On Mon, Feb 10, 2020 at 10:36:24AM +0100, Peter Zijlstra wrote:
> > On Sat, Feb 08, 2020 at 08:16:49PM +0530, Amol Grover wrote:

> > > @@ -3106,26 +3106,31 @@ static void ctx_sched_out(struct perf_event_context *ctx,
> > >  static int context_equiv(struct perf_event_context *ctx1,
> > >  			 struct perf_event_context *ctx2)
> > >  {
> > > +	struct perf_event_context *parent_ctx1, *parent_ctx2;
> > > +
> > >  	lockdep_assert_held(&ctx1->lock);
> > >  	lockdep_assert_held(&ctx2->lock);
> > >  
> > > +	parent_ctx1 = rcu_dereference(ctx1->parent_ctx);
> > > +	parent_ctx2 = rcu_dereference(ctx2->parent_ctx);
> > 
> > Bah.
> > 
> > Why are you  fixing all this sparse crap and making the code worse?
> 
> Hi Peter,
> 
> Sparse is quite noisy and we need to eliminate false-positives, right?

Dunno, I've been happy just ignoring it all.

> __rcu will tell the developer, this pointer could change and he needs to
> take the required steps to make sure the code doesn't break.

I know what it does; what I don't know is why you need to make the code
worse. In paricular, __rcu doesn't mandate rcu_dereference(), esp. not
when you're actually holding the write side lock.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
