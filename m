Return-Path: <SRS0=BMuY=36=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D51FC352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 17:16:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D2120715
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 17:16:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="jL687RAj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60D2120715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 35F84203EC;
	Mon, 10 Feb 2020 17:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HP7POGD71Tww; Mon, 10 Feb 2020 17:16:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6CB54203AB;
	Mon, 10 Feb 2020 17:16:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 599C2C1796;
	Mon, 10 Feb 2020 17:16:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B38A2C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 17:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A228285187
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 17:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4FQBdES5w7E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 17:16:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 291A98517E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 17:16:53 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id j15so4231041pgm.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 09:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GRCpHDtsJ67okeGwIgvsSL9BK++UHh+4kCyjcA9A5ko=;
 b=jL687RAj+iaak76ia5BKrsjyleZ1AAx1iBnkuLt78MsrLOJrzMy4Tp/apdLbl5u/Ue
 z3M0jAHM6lzdCdKUMwwux1yN4cR0lDtY6RmTTmmCO+g+M+XapAiVjSWdKMwO6UTq4qg0
 2stXVsIUZ6fn45H16Y/WnaeBPXm3xzJgQHwIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GRCpHDtsJ67okeGwIgvsSL9BK++UHh+4kCyjcA9A5ko=;
 b=DJfsaTE0Zf37Rnx6jR/00JAx9e5f32NEeyJ2u8ZaAEISx1jbWuT+cbFh5oZ007R51M
 JAoCqFY0KQuK7eVbM/e5v+ZNVbWq9gZ6UmY3EU3/MJx9zDFE44MpaWe3GJD+es3Iq0im
 t/hLRQWwQzcip2qzXQtahi1QOq/dr4FdXS2e09EweqqAQhHDuXnFUXFu+dcF6YTfmj0f
 Lh8loRPcCf8NW3bu6cy7hiL8wJXXJlNNbd3wWegpQWy43ZEC5D7IyJ0K2hl7xOwda7uy
 QroNgpuueuXnki7XA7af+Ai7UGCBn5Um6G3NbrQWfIWBy5PROCucKHPeR5W9T63e3WIi
 o3nQ==
X-Gm-Message-State: APjAAAWxWB+82pGFrEbTW0qHmaBQUbH31DFG5Knj2QwM+meMqZq7BCQN
 2fDwkb0JZjxKLUgyzDEVyH4xhq72RlI=
X-Google-Smtp-Source: APXvYqyAsa/Yuaz4Sthqxvxv0EOkdXiR67YD1PrHVZecispmb2P7AFBrE1WFe68M8DbMUKHQdWxUdQ==
X-Received: by 2002:ad4:4e24:: with SMTP id dm4mr10644914qvb.170.1581354513305; 
 Mon, 10 Feb 2020 09:08:33 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id o55sm497974qtf.46.2020.02.10.09.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 09:08:31 -0800 (PST)
Date: Mon, 10 Feb 2020 12:08:31 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200210170831.GB246160@google.com>
References: <20200208144648.18833-1-frextrite@gmail.com>
 <20200210093624.GB14879@hirez.programming.kicks-ass.net>
 <20200210125948.GA16485@workstation-portable>
 <20200210133459.GJ14897@hirez.programming.kicks-ass.net>
 <20200210164727.GA22283@workstation-portable>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210164727.GA22283@workstation-portable>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Jiri Olsa <jolsa@redhat.com>
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

On Mon, Feb 10, 2020 at 10:17:27PM +0530, Amol Grover wrote:
> On Mon, Feb 10, 2020 at 02:34:59PM +0100, Peter Zijlstra wrote:
> > On Mon, Feb 10, 2020 at 06:29:48PM +0530, Amol Grover wrote:
> > > On Mon, Feb 10, 2020 at 10:36:24AM +0100, Peter Zijlstra wrote:
> > > > On Sat, Feb 08, 2020 at 08:16:49PM +0530, Amol Grover wrote:
> > 
> > > > > @@ -3106,26 +3106,31 @@ static void ctx_sched_out(struct perf_event_context *ctx,
> > > > >  static int context_equiv(struct perf_event_context *ctx1,
> > > > >  			 struct perf_event_context *ctx2)
> > > > >  {
> > > > > +	struct perf_event_context *parent_ctx1, *parent_ctx2;
> > > > > +
> > > > >  	lockdep_assert_held(&ctx1->lock);
> > > > >  	lockdep_assert_held(&ctx2->lock);
> > > > >  
> > > > > +	parent_ctx1 = rcu_dereference(ctx1->parent_ctx);
> > > > > +	parent_ctx2 = rcu_dereference(ctx2->parent_ctx);

You can probably remove the earlier lockdep_assert_held(s) if you're going to
use rcu_dereference_protected() here, since that would do the checking anyway.

> > > > 
> > > > Bah.
> > > > 
> > > > Why are you  fixing all this sparse crap and making the code worse?
> > > 
> > > Hi Peter,
> > > 
> > > Sparse is quite noisy and we need to eliminate false-positives, right?
> > 
> > Dunno, I've been happy just ignoring it all.

FWIW some of the sparse fixes Amol made recently did uncover so existing
"bugs" :) (Not in perf but other code).

> > > __rcu will tell the developer, this pointer could change and he needs to
> > > take the required steps to make sure the code doesn't break.
> > 
> > I know what it does; what I don't know is why you need to make the code
> > worse. In paricular, __rcu doesn't mandate rcu_dereference(), esp. not
> > when you're actually holding the write side lock.
> 
> I might've misinterpreted the code. How does replacing rcu_dereference()
> with
> parent_ctx1 = rcu_dereference_protected(ctx1->parent_ctx,
> 					lockdep_is_held(&ctx1->lock));
> sound?

FWIW, some maintainers do hate calling RCU APIs when write side lock is held.
Evidently it does make the code readability a bit worse and I can see Peter's
point of view because the existing code is correct. I leave it to you guys to
decide how you want to handle it.

thanks!

 - Joel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
