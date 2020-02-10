Return-Path: <SRS0=BMuY=36=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7D6C352A5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 12:59:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E90AD20708
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 12:59:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShIXuYRh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E90AD20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B504281B8A;
	Mon, 10 Feb 2020 12:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXLTZNIDKV1R; Mon, 10 Feb 2020 12:59:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 313FD81DE9;
	Mon, 10 Feb 2020 12:59:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19F64C07FE;
	Mon, 10 Feb 2020 12:59:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D641C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 12:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1403C86DA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 12:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5sKlwvPsPx5H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 12:59:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8014686D92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 12:59:56 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s1so3672339pfh.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 04:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y0lLKcIRcrKBMjOb2t3dxuaz/hreV2rj4w3yWI5N9yg=;
 b=ShIXuYRhJDp0KzLzF6UZgMsniFpEjmFjc61ljrmLMLTsjcl0HWTyMdFVPpbE+DPf/3
 Zi/mg0ie+/dS9yy/39sLKz52WRV9E1CFI6L7ldSw4Vmst5iRVq/Ydqf3NYw2TF2cxjHL
 /j2DZNJBe2+MQRlC9yBlwF2/HEUz/BXB+rVuJKItBpjjV31vkqa4QgJGA/HzEryusoJz
 +uzigk7tPzocPlnwtJifPJJ8RZeaALg3Eh/WGiQ+U4LCx2lRjXp6ruH5YKAYH7LAM9TR
 3S94DwDVd6T+IPzBoA31PGOOBqcy2UQ04iZ9Jv6Q2kEzdzqOtKB5x4XC76XWbS4HCtq4
 YuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y0lLKcIRcrKBMjOb2t3dxuaz/hreV2rj4w3yWI5N9yg=;
 b=XJ5RFR6yATB0o8jfjEyTSjcAFZtvPL8VMT5g6xqbT4Qx4DArkSnRCsmfkJwt4f4h/e
 5Hh8yj7txoLG9n4LkIpIROq9v9K7pJeW/pgYQ5YBR2gCQpYlUP6xNzPqVgPUoFleV/ZA
 25bMw3fyGOUCR+7j/IB5AWzj78z+lbrMkLhgWCWxb69chfWzvFYvsocLB6eu1dABJ570
 ssDWS2krfzXNIdgKZAauMqZo3vZcwHvuJQ/RciNS3y5aT6NQWiCYMbAQs9UbGf7TUIUe
 tVtVnN9y2Jjcx34OK1k8abAzBeKryFNToBui4piXWz5wevPbmjzFWY5rUIy3x0/sUsre
 InKA==
X-Gm-Message-State: APjAAAVQcV+hNV2vyQshMQ3e6CuGRwH0FbLmkSCC7g7ztbHAFPZwa61K
 sMRYJaNdL2pv33NKCrizTpA=
X-Google-Smtp-Source: APXvYqz4vzr5UgDqPluKWTZ8VLa/KFqXFz0dLU85nHG63YroIBTbumvq+jFBGBxdER0F04KDELp1mg==
X-Received: by 2002:a63:3688:: with SMTP id d130mr1568945pga.422.1581339595955; 
 Mon, 10 Feb 2020 04:59:55 -0800 (PST)
Received: from workstation-portable ([146.196.37.217])
 by smtp.gmail.com with ESMTPSA id w8sm455068pfj.20.2020.02.10.04.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 04:59:55 -0800 (PST)
Date: Mon, 10 Feb 2020 18:29:48 +0530
From: Amol Grover <frextrite@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200210125948.GA16485@workstation-portable>
References: <20200208144648.18833-1-frextrite@gmail.com>
 <20200210093624.GB14879@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210093624.GB14879@hirez.programming.kicks-ass.net>
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

On Mon, Feb 10, 2020 at 10:36:24AM +0100, Peter Zijlstra wrote:
> On Sat, Feb 08, 2020 at 08:16:49PM +0530, Amol Grover wrote:
> > parent_ctx is used under RCU context in kernel/events/core.c,
> > tell sparse about it aswell.
> > 
> > Fixes the following instances of sparse error:
> > kernel/events/core.c:3221:18: error: incompatible types in comparison
> > kernel/events/core.c:3222:23: error: incompatible types in comparison
> > 
> > This introduces the following two sparse errors:
> > kernel/events/core.c:3117:18: error: incompatible types in comparison
> > kernel/events/core.c:3121:30: error: incompatible types in comparison
> > 
> > Hence, use rcu_dereference() to access parent_ctx and silence
> > the newly introduced errors.
> > 
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > ---
> >  include/linux/perf_event.h |  2 +-
> >  kernel/events/core.c       | 11 ++++++++---
> >  2 files changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> > index 6d4c22aee384..e18a7bdc6f98 100644
> > --- a/include/linux/perf_event.h
> > +++ b/include/linux/perf_event.h
> > @@ -810,7 +810,7 @@ struct perf_event_context {
> >  	 * These fields let us detect when two contexts have both
> >  	 * been cloned (inherited) from a common ancestor.
> >  	 */
> > -	struct perf_event_context	*parent_ctx;
> > +	struct perf_event_context __rcu	*parent_ctx;
> >  	u64				parent_gen;
> >  	u64				generation;
> >  	int				pin_count;
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index 2173c23c25b4..2a8c5670b254 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -3106,26 +3106,31 @@ static void ctx_sched_out(struct perf_event_context *ctx,
> >  static int context_equiv(struct perf_event_context *ctx1,
> >  			 struct perf_event_context *ctx2)
> >  {
> > +	struct perf_event_context *parent_ctx1, *parent_ctx2;
> > +
> >  	lockdep_assert_held(&ctx1->lock);
> >  	lockdep_assert_held(&ctx2->lock);
> >  
> > +	parent_ctx1 = rcu_dereference(ctx1->parent_ctx);
> > +	parent_ctx2 = rcu_dereference(ctx2->parent_ctx);
> 
> Bah.
> 
> Why are you  fixing all this sparse crap and making the code worse?

Hi Peter,

Sparse is quite noisy and we need to eliminate false-positives, right?
__rcu will tell the developer, this pointer could change and he needs to
take the required steps to make sure the code doesn't break.

Thanks
Amol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
