Return-Path: <SRS0=sPDn=3N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722BDC2D0CE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jan 2020 04:29:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46AC32071A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jan 2020 04:29:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sg5itA96"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46AC32071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 07D4720424;
	Fri, 24 Jan 2020 04:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s01x+6fEhrfI; Fri, 24 Jan 2020 04:29:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 75B1220420;
	Fri, 24 Jan 2020 04:29:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D2DEC0176;
	Fri, 24 Jan 2020 04:29:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCC1CC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B0A3520424
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d85-Ojp1ePNU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:29:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 01CF620420
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jan 2020 04:29:05 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id r67so469843pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 20:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W5pF9JS7OfQogiQ+v1H3GtBwMtau9/tHuDv1Q9h5buA=;
 b=Sg5itA96fCucpWFLPztS45UrhdU//Yjb9e3vjuwavSuwIsEFNQVX2ZPToq0NWtjIIC
 HkRfgfgyS11flHWhXXEFQvCg6EbCVYgR2fPisPweEkJA8vBD155pupXWLhqDx3FaxlTO
 9ScXQuVU+BYXGdJENQyKT5QGGLQ+y6rDcOd1OzPbCpt6oEHAFBRn8VTl+mfUrqTLxiM/
 kc1c8wcYMrNIM+own+kkA6QzBGRgNf5ljnLWAUbvPjX2ui0tWZqMORkoORYY0Eyooxrt
 AbI4PxV5886ntusBBmpJyEsQy+HJaYyk9G8qHfEaqHXUUDnXmjGWc1gTQ0z5LW1uQniw
 khHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W5pF9JS7OfQogiQ+v1H3GtBwMtau9/tHuDv1Q9h5buA=;
 b=JheyPFkheUl6lofg/qcEW8MT2CZ1ExJkCa1+vKXpcuoRe7tlgdJN88OWuzeMyHAVIa
 kuYLL9ZmUfvMN2U8X3w0D0Vc/+E5corKISaMWbDmofbdL/oHZHluqzCBcL198uPH62tl
 EadJV4dKnmu1tznjbkvLK4PXhXL3CKEC8QzE0xCqGEvSCpBaARqCOSqWusJ9tI4GrX+w
 IvGWj8boIlWxkyVZOuMKxpb7q8KGpZBfDOw2ABJLB1XZ7Y0LAdYci29bXcruoxEtEWeD
 j3nRvtUqkg53BJs3ca3PLOEFLTxBQynam+zIkwYzazwd1o7ReQQRzJf3Pu/7cCLBKTwl
 o1Qw==
X-Gm-Message-State: APjAAAX+7twECSk8EvHSVEjOt3uh9sW1c27Cy3Evc2x6Sc4BBuO4mxlN
 oUEfbjjPHtLbL8IO5aYfaA==
X-Google-Smtp-Source: APXvYqz1nhFiSAUfCxrhC6VBjKlPGF/48fHdPP+Z2cbhtLQPGcYLYeWWuPogvT4DZKfQfmpTS2XuAg==
X-Received: by 2002:a17:90a:fa88:: with SMTP id
 cu8mr1112275pjb.141.1579840145559; 
 Thu, 23 Jan 2020 20:29:05 -0800 (PST)
Received: from madhuparna-HP-Notebook ([2402:3a80:1ee5:e37b:72:f3a9:f673:9aea])
 by smtp.gmail.com with ESMTPSA id iq22sm4558521pjb.9.2020.01.23.20.28.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jan 2020 20:29:04 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Fri, 24 Jan 2020 09:58:52 +0530
To: "Paul E. McKenney" <paulmck@kernel.org>
Message-ID: <20200124042852.GC23699@madhuparna-HP-Notebook>
References: <20200123145305.10652-1-madhuparnabhowmik10@gmail.com>
 <20200123164108.GQ2935@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123164108.GQ2935@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: juri.lelli@redhat.com, vincent.guittot@linaro.org, peterz@infradead.org,
 oleg@redhat.com, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 madhuparnabhowmik10@gmail.com, mingo@redhat.com, ebiederm@xmission.com,
 joel@joelfernandes.org, christian.brauner@ubuntu.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] sched.h: Annotate sighand_struct
	with __rcu
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

On Thu, Jan 23, 2020 at 08:41:08AM -0800, Paul E. McKenney wrote:
> On Thu, Jan 23, 2020 at 08:23:05PM +0530, madhuparnabhowmik10@gmail.com wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > 
> > This patch fixes the following sparse errors by annotating the
> > sighand_struct with __rcu
> > 
> > kernel/fork.c:1511:9: error: incompatible types in comparison expression
> > kernel/exit.c:100:19: error: incompatible types in comparison expression
> > kernel/signal.c:1370:27: error: incompatible types in comparison expression
> > 
> > This fix introduces the following sparse error in signal.c due to
> > checking the sighand pointer without rcu primitives:
> > 
> > kernel/signal.c:1386:21: error: incompatible types in comparison expression
> > 
> > This new sparse error is also addressed in this patch.
> > 
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > ---
> >  include/linux/sched.h | 2 +-
> >  kernel/signal.c       | 3 ++-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index b511e178a89f..7a351360ad54 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -918,7 +918,7 @@ struct task_struct {
> >  
> >  	/* Signal handlers: */
> >  	struct signal_struct		*signal;
> > -	struct sighand_struct		*sighand;
> > +	struct sighand_struct __rcu		*sighand;
> >  	sigset_t			blocked;
> >  	sigset_t			real_blocked;
> >  	/* Restored if set_restore_sigmask() was used: */
> > diff --git a/kernel/signal.c b/kernel/signal.c
> > index bcd46f547db3..1272def37462 100644
> > --- a/kernel/signal.c
> > +++ b/kernel/signal.c
> > @@ -1383,7 +1383,8 @@ struct sighand_struct *__lock_task_sighand(struct task_struct *tsk,
> >  		 * must see ->sighand == NULL.
> >  		 */
> >  		spin_lock_irqsave(&sighand->siglock, *flags);
> > -		if (likely(sighand == tsk->sighand))
> > +		if (likely(sighand == rcu_dereference_protected(tsk->sighand,
> > +						lockdep_is_held(&sighand->siglock))))
> 
> Given that the return value is never dereferenced, you can use
> rcu_access_pointer(), which may be used outside of an RCU read-side
> critical section, and thus does not need the lockdep_is_held().  So this
> change would save a line of code and would be a bit easier on the eyes.
>
Okay got it! I will send the updated patch soon.

Thank you,
Madhuparna
> 							Thanx, Paul
> 
> >  			break;
> >  		spin_unlock_irqrestore(&sighand->siglock, *flags);
> >  	}
> > -- 
> > 2.17.1
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
