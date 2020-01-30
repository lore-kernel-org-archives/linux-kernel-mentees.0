Return-Path: <SRS0=9uDz=3T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5953CC33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 10:15:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B534206D5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 10:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPM3H68r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B534206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 09DAF86493;
	Thu, 30 Jan 2020 10:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksUMDRAUJElk; Thu, 30 Jan 2020 10:15:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9080186481;
	Thu, 30 Jan 2020 10:15:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BA35C1796;
	Thu, 30 Jan 2020 10:15:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91F28C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 10:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7C891876D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 10:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Qpz+PmIGhlc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 10:14:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9FEA4876CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 10:14:58 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y5so1233741pfb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 02:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=s3YyPLg09Gie8I9immsDwus8bgq4e1f49zZn8bTQ76E=;
 b=CPM3H68rFC7wby/Uyc1WbUYqMfObo7808jXDwUGqEOWfDNkV26QcnGYbtC8yimVHbM
 bHY4PaZGYDcoTmZkioEdFruVwOdGGSKwM4A81Vlx3OqMmOu8IKE1fPZAD50wbz9e0VXn
 u43Z6b9vlsJxnqG3SAZUpVm2PB0NuKdzorxecc7xVXbklK7SHJ4IvzIskIB3kttcdLWa
 LoakCpaPAIM94pjhnwpWo4w5HXz5BU8Fty7aoRFuSCc/Zxgu18oEk/8gDHXBkLI4pW4U
 RMp3JbpWhwySqVXF5MD/ebm22HTHphRQMdzC6ybI3p54geDmLuvR4cKWixCX6u1GfReG
 YfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s3YyPLg09Gie8I9immsDwus8bgq4e1f49zZn8bTQ76E=;
 b=PPz9McWJUFcBcoexlpnlrW4/i8RvToezt46cSPUIVg7A8jTjPZAG0J5AIE4b2QGt9v
 otT3yqJyMtjLzPZgfmQCt6Y1o1GSGe064CB7ZrGO268MvoPawxCKhQDCHUml04KLYcSm
 DUUG6f6AT/U0ehZTwnligSJh2Y2CF/8ytECryzHLty2jkPxihsowiiRjy/AMgvcWil/8
 eib0iDyfFfCEuO1bqIy9/D45fKFOlOwIoTQHS35daccgGq0rcaJHvK+KKZLqngL18zjp
 ANqJyjkVNCV8ovWU1J+6OzTf2lhHYC7khfnmOgIKGolLAnX/PEZQzKhO/V9P6xb7LJdg
 l4vQ==
X-Gm-Message-State: APjAAAWlLUlrd5h4vXet7A2/5ryycZCbFZBDH3rCdfntNIRs+pjVk2mq
 wRTpZR39pTSvfs0LHMDT6IQ=
X-Google-Smtp-Source: APXvYqxis/JJsI65268X2naMGjElymHqNg6Gw3dHiPsMlR6PQdIgWlqMJMTGFKBPssP1EuuNHieyUw==
X-Received: by 2002:aa7:9f47:: with SMTP id h7mr4080251pfr.13.1580379298187;
 Thu, 30 Jan 2020 02:14:58 -0800 (PST)
Received: from workstation-portable ([103.211.17.117])
 by smtp.gmail.com with ESMTPSA id e16sm5681485pgk.77.2020.01.30.02.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 02:14:57 -0800 (PST)
Date: Thu, 30 Jan 2020 15:44:51 +0530
From: Amol Grover <frextrite@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200130101451.GA11015@workstation-portable>
References: <20200129160813.14263-1-frextrite@gmail.com>
 <20200129160813.14263-2-frextrite@gmail.com>
 <20200129221909.GA74354@google.com>
 <20200130082321.GX14879@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130082321.GX14879@hirez.programming.kicks-ass.net>
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

On Thu, Jan 30, 2020 at 09:23:21AM +0100, Peter Zijlstra wrote:
> On Wed, Jan 29, 2020 at 05:19:09PM -0500, Joel Fernandes wrote:
> > On Wed, Jan 29, 2020 at 09:38:13PM +0530, Amol Grover wrote:
> > > callchain_cpus_entries is annotated as an RCU pointer.
> > > Hence rcu_dereference_protected or similar RCU API is
> > > required to dereference the pointer.
> > > 
> > > This fixes the following sparse warning
> > > kernel/events/callchain.c:65:17: warning: incorrect type in assignment
> 
> Seems silly to have this two patches; the first introduces the second
> issue, might as well fix it all in one go.
> 

Got it. I'll combine them into a single patch and re-send.

> Also look at the output of:
> 
>   git log --oneline kernel/events/
> 
> and then at your $subject.
> 
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > >  kernel/events/callchain.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
> > > index f91e1f41d25d..a672d02a1b3a 100644
> > > --- a/kernel/events/callchain.c
> > > +++ b/kernel/events/callchain.c
> > > @@ -62,7 +62,8 @@ static void release_callchain_buffers(void)
> > >  {
> > >  	struct callchain_cpus_entries *entries;
> > >  
> > > -	entries = callchain_cpus_entries;
> > > +	entries = rcu_dereference_protected(callchain_cpus_entries,
> > > +					    lockdep_is_held(&callchain_mutex));
> > 
> > 
> > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> Do we really need that smp_read_barrier_depends() here? Then again, I
> don't suppose this is a fast path.
> 

rcu_dereference_protected is actually a lightweight API and IIRC it
omits the READ_ONCE() and hence the memory barriers.

Thanks
Amol

> IIRC even Alpha got the dependent write ordering right.
> 
> > >  	RCU_INIT_POINTER(callchain_cpus_entries, NULL);
> > >  	call_rcu(&entries->rcu_head, release_callchain_buffers_rcu);
> > >  }
> > > -- 
> > > 2.24.1
> > > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
