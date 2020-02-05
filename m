Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E099C352A1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 13:11:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB690217BA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 13:11:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFln09Vk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB690217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A25A9204CA;
	Wed,  5 Feb 2020 13:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AamMUWeO+7O4; Wed,  5 Feb 2020 13:11:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EEB87203D0;
	Wed,  5 Feb 2020 13:11:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1D64C0175;
	Wed,  5 Feb 2020 13:11:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 234AEC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1F2B983597
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTOOw8u1IMBy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:11:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9DFE3822F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:11:10 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D3B62082E;
 Wed,  5 Feb 2020 13:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580908270;
 bh=wSPjyDZaJd4iYDsHDvfTkbCVhxFTYWZXqFiynFRgSqQ=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=lFln09VkBtkKNCzjna0O6RjF4HXeY041b+M9cjd6Gg+nM1BDA5etdYv1mR98VGfJD
 19dJOGyubTzNLTYO1TgPFs91g8c6SzX04APp359/ins/jR3jaif5VhBt3i8xwTGY3g
 EUEm4yg8Z6LWtBrnQ8/8skmEGJgZSklG5+b1A6AU=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 3EDCC352270F; Wed,  5 Feb 2020 05:11:10 -0800 (PST)
Date: Wed, 5 Feb 2020 05:11:10 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20200205131110.GT2935@paulmck-ThinkPad-P72>
References: <20200201072703.17330-1-frextrite@gmail.com>
 <20200203163301.GB85781@google.com>
 <20200204200116.479f0c60@oasis.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204200116.479f0c60@oasis.local.home>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] tracing: Annotate
	ftrace_graph_hash pointer with __rcu
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Feb 04, 2020 at 08:01:16PM -0500, Steven Rostedt wrote:
> On Mon, 3 Feb 2020 11:33:01 -0500
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> 
> > > --- a/kernel/trace/trace.h
> > > +++ b/kernel/trace/trace.h
> > > @@ -950,22 +950,25 @@ extern void __trace_graph_return(struct trace_array *tr,
> > >  				 unsigned long flags, int pc);
> > >  
> > >  #ifdef CONFIG_DYNAMIC_FTRACE
> > > -extern struct ftrace_hash *ftrace_graph_hash;
> > > +extern struct ftrace_hash __rcu *ftrace_graph_hash;
> > >  extern struct ftrace_hash *ftrace_graph_notrace_hash;
> > >  
> > >  static inline int ftrace_graph_addr(struct ftrace_graph_ent *trace)
> > >  {
> > >  	unsigned long addr = trace->func;
> > >  	int ret = 0;
> > > +	struct ftrace_hash *hash;
> > >  
> > >  	preempt_disable_notrace();
> > >  
> > > -	if (ftrace_hash_empty(ftrace_graph_hash)) {
> > > +	hash = rcu_dereference_protected(ftrace_graph_hash, !preemptible());  
> > 
> > I think you can use rcu_dereference_sched() here? That way no need to pass
> > !preemptible.
> > 
> > A preempt-disabled section is an RCU "sched flavor" section. Flavors are
> > consolidated in the backend, but in the front end the dereference API still
> > do have flavors.
> 
> Unfortunately, doing it with rcu_dereference_sched() causes a lockdep
> splat :-P. This is because ftrace can execute when rcu is not
> "watching" and that will trigger a lockdep error. That means, this
> origin patch *is* correct. I'm re-applying this one.

I strongly recommend a comment stating why disabling preemption prevents
ftrace_graph_hash from going away.  I see the synchronize_rcu() after
the rcu_assign_pointer() in ftrace_graph_release(), but I don't see
anything that waits on CPUs that RCU is not watching.

Of course, event tracing -makes- RCU watch when needed, but if that
was set up, then lockdep would not have complained.

So what am I missing?

							Thanx, Paul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
