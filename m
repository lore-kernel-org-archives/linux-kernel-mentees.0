Return-Path: <SRS0=9uDz=3T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B40C35240
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 08:23:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB2182253D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 08:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FOXXeizH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB2182253D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9BC25226B0;
	Thu, 30 Jan 2020 08:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PM80X2nDD4rG; Thu, 30 Jan 2020 08:23:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DD92A2268C;
	Thu, 30 Jan 2020 08:23:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C36F2C0178;
	Thu, 30 Jan 2020 08:23:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDD47C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 08:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D303888395
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 08:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuJ8AmDi5My4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 08:23:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 520248608F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 08:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MxbBT5cVT9PZ+R6Kb9xK5pFl3peGklWMMshROVhFqH4=; b=FOXXeizHC/8VqDRI9+L1FOBRm
 d2yG+jmwveMzeAGz4CIr5E49pumHPYsqyUryz55rGHUssAQeFacCSPNW9Kqsa8+NBIz08TpIhXNBr
 lvatJE9+cbp9a64izEz5oZdqI0ZPf3a7h8wqflYqMlx1Adb/qru+boGUNc1TmJ6AczeSg1k+PVJoh
 8mZ2ZPpjArkO6d5LPWY/r6EjcDeyrMd9QemPEaiXjQV4gygDPaM0v6wl+Q9Hf2o4GYLfCv4yX8CTZ
 uqgnzJSxpOYGeTWSfXQF9o5oAiToszoC44oOgi/zaw6215hR6tRabxD57+h28SeBE6KQNlYHwK2Ps
 tvLLJPvUQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ix56i-0004Rc-3w; Thu, 30 Jan 2020 08:23:24 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DBCB0300E0C;
 Thu, 30 Jan 2020 09:21:38 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0426A2B7334D3; Thu, 30 Jan 2020 09:23:21 +0100 (CET)
Date: Thu, 30 Jan 2020 09:23:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Joel Fernandes <joel@joelfernandes.org>
Message-ID: <20200130082321.GX14879@hirez.programming.kicks-ass.net>
References: <20200129160813.14263-1-frextrite@gmail.com>
 <20200129160813.14263-2-frextrite@gmail.com>
 <20200129221909.GA74354@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129221909.GA74354@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>
Subject: Re: [Linux-kernel-mentees] [PATCH 2/2] events: callchain: Use RCU
	API to access RCU pointer
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

On Wed, Jan 29, 2020 at 05:19:09PM -0500, Joel Fernandes wrote:
> On Wed, Jan 29, 2020 at 09:38:13PM +0530, Amol Grover wrote:
> > callchain_cpus_entries is annotated as an RCU pointer.
> > Hence rcu_dereference_protected or similar RCU API is
> > required to dereference the pointer.
> > 
> > This fixes the following sparse warning
> > kernel/events/callchain.c:65:17: warning: incorrect type in assignment

Seems silly to have this two patches; the first introduces the second
issue, might as well fix it all in one go.

Also look at the output of:

  git log --oneline kernel/events/

and then at your $subject.

> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > ---
> >  kernel/events/callchain.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
> > index f91e1f41d25d..a672d02a1b3a 100644
> > --- a/kernel/events/callchain.c
> > +++ b/kernel/events/callchain.c
> > @@ -62,7 +62,8 @@ static void release_callchain_buffers(void)
> >  {
> >  	struct callchain_cpus_entries *entries;
> >  
> > -	entries = callchain_cpus_entries;
> > +	entries = rcu_dereference_protected(callchain_cpus_entries,
> > +					    lockdep_is_held(&callchain_mutex));
> 
> 
> Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

Do we really need that smp_read_barrier_depends() here? Then again, I
don't suppose this is a fast path.

IIRC even Alpha got the dependent write ordering right.

> >  	RCU_INIT_POINTER(callchain_cpus_entries, NULL);
> >  	call_rcu(&entries->rcu_head, release_callchain_buffers_rcu);
> >  }
> > -- 
> > 2.24.1
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
