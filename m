Return-Path: <SRS0=9uDz=3T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC0DC2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 13:33:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7133F2063A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 13:33:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kV/vA7M3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7133F2063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3F6D6877E3;
	Thu, 30 Jan 2020 13:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDCpfKU6MBUt; Thu, 30 Jan 2020 13:33:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8F3CB87697;
	Thu, 30 Jan 2020 13:33:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75723C0178;
	Thu, 30 Jan 2020 13:33:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7A2CC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 13:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AE7DB88355
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 13:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZcBw7K+zT-4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 13:33:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1D8DD8834D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0IrD+2Cqd6pTqVBOmkUhWueH8hwhXeAEBdAFin7xf14=; b=kV/vA7M3cXkS/0OU/mQ8HtZpi
 meJlra5xXbFWq7LLPR6gkFU3F1gLSsHUANg6Ond0+b4QhQZyxqEGAFXMYWbejI6JQfzyeUCLzwY6N
 99qPtTN+NR1TSyhiC98uJjMuvYiSS/p05+qA4ju6GlwJKh6Z/UGCoKxckKsDT5aOBZhVF6gBzNEs7
 RDLFxWd5cb/8HgQyqxKFZp5JGlUMRlywsSyfR4ea9MVWZCzVd/04RilXmqQrhrJQz9swz97vBrwex
 JLrJJQis46zdRMswFFqS/579Mb3n0ajDoJQCZTCuw4M9G152kSzeF34yd82z8yk2PVfzDASwf8jM0
 2eJcxn16Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ix9wC-0003qO-2x; Thu, 30 Jan 2020 13:32:52 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 627343053FB;
 Thu, 30 Jan 2020 14:31:05 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 9F4102B2800FE; Thu, 30 Jan 2020 14:32:48 +0100 (CET)
Date: Thu, 30 Jan 2020 14:32:48 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200130133248.GW14914@hirez.programming.kicks-ass.net>
References: <20200129160813.14263-1-frextrite@gmail.com>
 <20200129160813.14263-2-frextrite@gmail.com>
 <20200129221909.GA74354@google.com>
 <20200130082321.GX14879@hirez.programming.kicks-ass.net>
 <20200130101451.GA11015@workstation-portable>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130101451.GA11015@workstation-portable>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Joel Fernandes <joel@joelfernandes.org>, Namhyung Kim <namhyung@kernel.org>,
 Jiri Olsa <jolsa@redhat.com>
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

On Thu, Jan 30, 2020 at 03:44:51PM +0530, Amol Grover wrote:
> > > > diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
> > > > index f91e1f41d25d..a672d02a1b3a 100644
> > > > --- a/kernel/events/callchain.c
> > > > +++ b/kernel/events/callchain.c
> > > > @@ -62,7 +62,8 @@ static void release_callchain_buffers(void)
> > > >  {
> > > >  	struct callchain_cpus_entries *entries;
> > > >  
> > > > -	entries = callchain_cpus_entries;
> > > > +	entries = rcu_dereference_protected(callchain_cpus_entries,
> > > > +					    lockdep_is_held(&callchain_mutex));
> > > 
> > > 
> > > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > 
> > Do we really need that smp_read_barrier_depends() here? Then again, I
> > don't suppose this is a fast path.
> > 
> 
> rcu_dereference_protected is actually a lightweight API and IIRC it
> omits the READ_ONCE() and hence the memory barriers.

Oh argh, indeed. I suppose I should've had more tea this morning.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
