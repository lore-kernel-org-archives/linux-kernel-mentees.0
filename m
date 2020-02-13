Return-Path: <SRS0=i9XN=4B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15105C3B188
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Feb 2020 06:44:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3EBD2467C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Feb 2020 06:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOt+CKba"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3EBD2467C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82000834BE;
	Thu, 13 Feb 2020 06:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QG-awRNObXSu; Thu, 13 Feb 2020 06:44:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 685AB83456;
	Thu, 13 Feb 2020 06:44:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BFDCC1D88;
	Thu, 13 Feb 2020 06:44:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50290C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 06:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1115480ECA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 06:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Y680meRsbkA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 06:44:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7928780AE0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 06:44:25 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id r67so1955398pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 22:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PTjJW5WkW3WINmBSd47NRsGrdkm7l3mFig0Vv87JoHI=;
 b=fOt+CKbaa0hK1SD+Dy3Gz8bkHD+cshmpLIT8v+VWyrtWI20L8EU2KYeZeIS4rt8NC4
 v2C0B1s63ubGJUhO1XnAezBRS6Bl3gqUaQx0jhQPDFgUwsj4WU+jb9De89x8LVVkxCVh
 kQYGq2caYpKvRl3s2Uaouw5RUk2UcZxWhfKRF+uI/UB9sRroBDPHW/AsaxXuIkXp+y1x
 4xDnPRcWpYRdZZQDtjN029HZpLQZR8kVwn3EHkJbDxcIp5IuRUxkYaOUZ9xtTg7d9zwV
 qb6+D2jEIHi2q9SIpVRpEc2ZDU5OgD+SdH6c+9PGs+FAMKDFVED6KmP1wxX1lPk6YlqG
 2hJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PTjJW5WkW3WINmBSd47NRsGrdkm7l3mFig0Vv87JoHI=;
 b=nlwnu/99JpJtqNS+0Qnftqxm4CzNhZOXzcYpXt+AM/QQGE6WqCHfZ6PmdkNDTXzktN
 1UdkwS0SOPAWbrNME/LN3HMhh+uOmBZhtouFrJH+tCn0Fmp6cpLASU47ASdFiyBTeCl0
 fXLhxo/s05D6R9EhFJkjIDSnhqIIL60A0vompSlLGMKcF5vriuCvpVs0zO1Oss+kO+3Z
 MW25jA8VfCEcvVcI7/obWw2PDHHxd6ZR0IfWUN8h4zwJNPYy4lzMQT1zTLj9BYSh+IN8
 acjdfqTbRq9yKS6g8hbHpQqodV1SXM37LfemCNIQlJA8AR3jhOWrb+4kKJXCeW9r2vX0
 0fiQ==
X-Gm-Message-State: APjAAAVS48q0fNa2EMtTRvrLl5qC1qFdKq/QC/C13XUkpFT7jzauaf9P
 gLXD1ETY5npTDn9QZcJ5Tlk=
X-Google-Smtp-Source: APXvYqwNMnGMEqnUw+BD3d356YdrBTWxcZDVrpMEjClwMVJdXshDYsdlX3TJyZLVvbTGGXZqEsja7Q==
X-Received: by 2002:a17:90a:17c2:: with SMTP id
 q60mr3225606pja.111.1581576264849; 
 Wed, 12 Feb 2020 22:44:24 -0800 (PST)
Received: from workstation-portable ([103.211.17.23])
 by smtp.gmail.com with ESMTPSA id x4sm1412685pff.143.2020.02.12.22.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 22:44:24 -0800 (PST)
Date: Thu, 13 Feb 2020 12:14:18 +0530
From: Amol Grover <frextrite@gmail.com>
To: Joel Fernandes <joel@joelfernandes.org>
Message-ID: <20200213064418.GA26550@workstation-portable>
References: <20200208144648.18833-1-frextrite@gmail.com>
 <20200210093624.GB14879@hirez.programming.kicks-ass.net>
 <20200210125948.GA16485@workstation-portable>
 <20200210133459.GJ14897@hirez.programming.kicks-ass.net>
 <20200210164727.GA22283@workstation-portable>
 <20200210170831.GB246160@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210170831.GB246160@google.com>
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

On Mon, Feb 10, 2020 at 12:08:31PM -0500, Joel Fernandes wrote:
> On Mon, Feb 10, 2020 at 10:17:27PM +0530, Amol Grover wrote:
> > On Mon, Feb 10, 2020 at 02:34:59PM +0100, Peter Zijlstra wrote:
> > > On Mon, Feb 10, 2020 at 06:29:48PM +0530, Amol Grover wrote:
> > > > On Mon, Feb 10, 2020 at 10:36:24AM +0100, Peter Zijlstra wrote:
> > > > > On Sat, Feb 08, 2020 at 08:16:49PM +0530, Amol Grover wrote:
> > > 
> > > > > > @@ -3106,26 +3106,31 @@ static void ctx_sched_out(struct perf_event_context *ctx,
> > > > > >  static int context_equiv(struct perf_event_context *ctx1,
> > > > > >  			 struct perf_event_context *ctx2)
> > > > > >  {
> > > > > > +	struct perf_event_context *parent_ctx1, *parent_ctx2;
> > > > > > +
> > > > > >  	lockdep_assert_held(&ctx1->lock);
> > > > > >  	lockdep_assert_held(&ctx2->lock);
> > > > > >  
> > > > > > +	parent_ctx1 = rcu_dereference(ctx1->parent_ctx);
> > > > > > +	parent_ctx2 = rcu_dereference(ctx2->parent_ctx);
> 
> You can probably remove the earlier lockdep_assert_held(s) if you're going to
> use rcu_dereference_protected() here, since that would do the checking anyway.
> 

Ah yes, I was thinking this aswell.

> > > > > 
> > > > > Bah.
> > > > > 
> > > > > Why are you  fixing all this sparse crap and making the code worse?
> > > > 
> > > > Hi Peter,
> > > > 
> > > > Sparse is quite noisy and we need to eliminate false-positives, right?
> > > 
> > > Dunno, I've been happy just ignoring it all.
> 
> FWIW some of the sparse fixes Amol made recently did uncover so existing
> "bugs" :) (Not in perf but other code).
> 
> > > > __rcu will tell the developer, this pointer could change and he needs to
> > > > take the required steps to make sure the code doesn't break.
> > > 
> > > I know what it does; what I don't know is why you need to make the code
> > > worse. In paricular, __rcu doesn't mandate rcu_dereference(), esp. not
> > > when you're actually holding the write side lock.
> > 
> > I might've misinterpreted the code. How does replacing rcu_dereference()
> > with
> > parent_ctx1 = rcu_dereference_protected(ctx1->parent_ctx,
> > 					lockdep_is_held(&ctx1->lock));
> > sound?
> 
> FWIW, some maintainers do hate calling RCU APIs when write side lock is held.
> Evidently it does make the code readability a bit worse and I can see Peter's
> point of view because the existing code is correct. I leave it to you guys to
> decide how you want to handle it.
> 

In that case, I think the code is fine as it is. Thank you for the review both!

Thanks
Amol

> thanks!
> 
>  - Joel
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
