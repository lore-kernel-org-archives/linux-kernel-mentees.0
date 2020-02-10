Return-Path: <SRS0=BMuY=36=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161E8C352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 16:47:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C8220733
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 16:47:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEL5T7by"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2C8220733
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 892F820027;
	Mon, 10 Feb 2020 16:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fIoDWuCkDBqz; Mon, 10 Feb 2020 16:47:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 976A3203B1;
	Mon, 10 Feb 2020 16:47:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B94EC07FE;
	Mon, 10 Feb 2020 16:47:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67778C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 16:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 51AFE86D78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 16:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ez7QZvL4pmCh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 16:47:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C0FB886D73
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 16:47:35 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 84so3969314pfy.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 08:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6S/qqrclbzsgs+sboOiImcegGzXap9XdkgMRDQlBr0w=;
 b=CEL5T7byT9BaT02dREx1V+S0eeFRn9TfwoKS+xj2egQaOoxDOCNLNTbepLyeZqiEQg
 UD1h4wCf1FK5AeCh1nGewFw66oN167hpDJFS81zR4YpaBtOw3J6j9RBiKNiRCWancRhI
 nwV56OZ1kV0DaZn5x0Y3prLUuDg0/CyHbxN70InK7kBZP4INT3bZ22p3jhorq7Q1KUDE
 zNAwtibtZc/jfZRTC6sWtYWvcsQZiLlM1y3VwQ/s3uCq9d/i9duHzpcuAnyjyW9inDSf
 TYyZ827FqwUMBv6o+qRPUOoGq9LvtAcYNiws2EjhdKry+Pcvr10qXtoKPhYWynAQmPoO
 9rfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6S/qqrclbzsgs+sboOiImcegGzXap9XdkgMRDQlBr0w=;
 b=Imba3yxcvT5L3nd+dCDQfnAIL838p2gEQtYsYGjKkoJRxO0y+KBhiM9rBzXfZkopAn
 ZeVf1D3UncbewU2DAnAevpSrzzPhk/1AvXP6DhZXQ+9VEOKWQQ9GLv6d/YILNrhjz7mD
 0ZhRtdqD56v1uuOfKSSQsysUhTLq9RRxWvuU6LNOAbxUh8mFQB7AA0jYNI2oiwq7oc/y
 rFSJ3Xx6y6YtbkX1k/1tJ8F8z/H8JxUhQbHPqqIoMYDf9UdeMFt2pfpXqRG71tJpf3QJ
 lWs9C2lWtRHtv29dP+F9V2kc6hnx9N6o0MatpuRWUEejhmxAP5vU4vKiaoX2qhAVElou
 XufA==
X-Gm-Message-State: APjAAAWuD3I4misxJdMeN4y52B0Xb88xs+iRYTKwRaqIDdVLr5LMfpf4
 9j2DR+qRWQUhGlWL4+LrS40=
X-Google-Smtp-Source: APXvYqxbcN6fFslsYQuBRd4tNcD50yrE5z+6+8KiffGz+ob3i0+3oDP2xswGxnS14o+RQ737VKX7OQ==
X-Received: by 2002:a63:2c0e:: with SMTP id s14mr2616909pgs.349.1581353255317; 
 Mon, 10 Feb 2020 08:47:35 -0800 (PST)
Received: from workstation-portable ([146.196.37.217])
 by smtp.gmail.com with ESMTPSA id e2sm773029pjs.25.2020.02.10.08.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 08:47:34 -0800 (PST)
Date: Mon, 10 Feb 2020 22:17:27 +0530
From: Amol Grover <frextrite@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200210164727.GA22283@workstation-portable>
References: <20200208144648.18833-1-frextrite@gmail.com>
 <20200210093624.GB14879@hirez.programming.kicks-ass.net>
 <20200210125948.GA16485@workstation-portable>
 <20200210133459.GJ14897@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210133459.GJ14897@hirez.programming.kicks-ass.net>
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

On Mon, Feb 10, 2020 at 02:34:59PM +0100, Peter Zijlstra wrote:
> On Mon, Feb 10, 2020 at 06:29:48PM +0530, Amol Grover wrote:
> > On Mon, Feb 10, 2020 at 10:36:24AM +0100, Peter Zijlstra wrote:
> > > On Sat, Feb 08, 2020 at 08:16:49PM +0530, Amol Grover wrote:
> 
> > > > @@ -3106,26 +3106,31 @@ static void ctx_sched_out(struct perf_event_context *ctx,
> > > >  static int context_equiv(struct perf_event_context *ctx1,
> > > >  			 struct perf_event_context *ctx2)
> > > >  {
> > > > +	struct perf_event_context *parent_ctx1, *parent_ctx2;
> > > > +
> > > >  	lockdep_assert_held(&ctx1->lock);
> > > >  	lockdep_assert_held(&ctx2->lock);
> > > >  
> > > > +	parent_ctx1 = rcu_dereference(ctx1->parent_ctx);
> > > > +	parent_ctx2 = rcu_dereference(ctx2->parent_ctx);
> > > 
> > > Bah.
> > > 
> > > Why are you  fixing all this sparse crap and making the code worse?
> > 
> > Hi Peter,
> > 
> > Sparse is quite noisy and we need to eliminate false-positives, right?
> 
> Dunno, I've been happy just ignoring it all.
> 
> > __rcu will tell the developer, this pointer could change and he needs to
> > take the required steps to make sure the code doesn't break.
> 
> I know what it does; what I don't know is why you need to make the code
> worse. In paricular, __rcu doesn't mandate rcu_dereference(), esp. not
> when you're actually holding the write side lock.

I might've misinterpreted the code. How does replacing rcu_dereference()
with
parent_ctx1 = rcu_dereference_protected(ctx1->parent_ctx,
					lockdep_is_held(&ctx1->lock));
sound?

Thanks
Amol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
