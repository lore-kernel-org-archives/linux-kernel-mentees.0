Return-Path: <SRS0=BMuY=36=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE4AC352A4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 09:36:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 124E22080C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 09:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OVaJfwr6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 124E22080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F18F52001A;
	Mon, 10 Feb 2020 09:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-WQZKprKoPD; Mon, 10 Feb 2020 09:36:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 523E020018;
	Mon, 10 Feb 2020 09:36:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38940C1796;
	Mon, 10 Feb 2020 09:36:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92D9BC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 09:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7C01C2001A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 09:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-bQ-cv205mM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 09:36:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id CBA3E20018
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 09:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KWSALxgD8DPKs4l9QdTGtfSb74FtrWq0gjEnbifVqg8=; b=OVaJfwr6gYS4lvSTolSKQURRnZ
 bsUfpKOQXpyjcfuQ+GklUxLM+XPufwIZMez5WA9oXfzNCviUFc3Eci9Z6RbdboErXvezS5DW47NrS
 h87x6BwSNYCSd7QS0SqVwk9mmQNNOwYqkeSdjJq2f0ay0q68Mw3Qm6H9hCIbux1Jwmh1nUDzXhAQ3
 xf/TJEl+vBfQqP4JZCQkQxgcOU9y45+lDSkmGZGMbZj5oPNk0xBO99OacaScB7EqDQKeMUef8bfDi
 7m957y9dq4zemVJNKh7uGaRVTVd4sl0BILUhr5oKPsr0h+VeGr1vnUyB9FcfFkC+IJ7mCa+xxx3Mx
 HAFZmGnQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j15UQ-0002wT-4b; Mon, 10 Feb 2020 09:36:26 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DB5E73012D8;
 Mon, 10 Feb 2020 10:34:35 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 15C602B1D5567; Mon, 10 Feb 2020 10:36:24 +0100 (CET)
Date: Mon, 10 Feb 2020 10:36:24 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200210093624.GB14879@hirez.programming.kicks-ass.net>
References: <20200208144648.18833-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208144648.18833-1-frextrite@gmail.com>
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

On Sat, Feb 08, 2020 at 08:16:49PM +0530, Amol Grover wrote:
> parent_ctx is used under RCU context in kernel/events/core.c,
> tell sparse about it aswell.
> 
> Fixes the following instances of sparse error:
> kernel/events/core.c:3221:18: error: incompatible types in comparison
> kernel/events/core.c:3222:23: error: incompatible types in comparison
> 
> This introduces the following two sparse errors:
> kernel/events/core.c:3117:18: error: incompatible types in comparison
> kernel/events/core.c:3121:30: error: incompatible types in comparison
> 
> Hence, use rcu_dereference() to access parent_ctx and silence
> the newly introduced errors.
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  include/linux/perf_event.h |  2 +-
>  kernel/events/core.c       | 11 ++++++++---
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 6d4c22aee384..e18a7bdc6f98 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -810,7 +810,7 @@ struct perf_event_context {
>  	 * These fields let us detect when two contexts have both
>  	 * been cloned (inherited) from a common ancestor.
>  	 */
> -	struct perf_event_context	*parent_ctx;
> +	struct perf_event_context __rcu	*parent_ctx;
>  	u64				parent_gen;
>  	u64				generation;
>  	int				pin_count;
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 2173c23c25b4..2a8c5670b254 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -3106,26 +3106,31 @@ static void ctx_sched_out(struct perf_event_context *ctx,
>  static int context_equiv(struct perf_event_context *ctx1,
>  			 struct perf_event_context *ctx2)
>  {
> +	struct perf_event_context *parent_ctx1, *parent_ctx2;
> +
>  	lockdep_assert_held(&ctx1->lock);
>  	lockdep_assert_held(&ctx2->lock);
>  
> +	parent_ctx1 = rcu_dereference(ctx1->parent_ctx);
> +	parent_ctx2 = rcu_dereference(ctx2->parent_ctx);

Bah.

Why are you  fixing all this sparse crap and making the code worse?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
