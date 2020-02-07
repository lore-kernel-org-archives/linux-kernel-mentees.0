Return-Path: <SRS0=QXRK=33=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EA1C2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 15:04:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B90521775
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 15:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzBzif0c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B90521775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D602A84961;
	Fri,  7 Feb 2020 15:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_ND9JLvfkcP; Fri,  7 Feb 2020 15:04:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 51422847C3;
	Fri,  7 Feb 2020 15:04:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B5BCC1D81;
	Fri,  7 Feb 2020 15:04:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E61C8C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 15:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CFBEC87DD4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 15:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3wAb0ROMare6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 15:04:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1C61287D6A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 15:04:38 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g6so1106180plp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 07 Feb 2020 07:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NWcReeVPxFQUsyqNOiabJmMKrw4xIyAeqiGyEJARbUw=;
 b=FzBzif0c26bz63UUbza8ankdHil2hoE1+L2oOv4PvnYpcGJZBmj1XnWrOa/YsgbHky
 urQ2lx7mDS+gdjJBVEhUhk35XKRKREii4xy2pUgBm9QFkvbsxFdwHOsY84AaFbbNGTbM
 cvnilZjaaJusu0v3hataDjbF3cZehHbaOAgkguz87KDgJ0aYM6oFil3aToDUhC0Z0mZE
 zn4+vTs6gRwGKxJEFufufJG3wLpERyMZlz2LHFuKr3iy9/LRj+P9McRv4Qu5iqYJUuwX
 ZgmZhvdya27sBFDHkog0hUGz0cDKSStY5iO/T55dSVtCc/XKEX5OwVjzUKMkFK2/E742
 l4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NWcReeVPxFQUsyqNOiabJmMKrw4xIyAeqiGyEJARbUw=;
 b=fbr1SO0HuRcIsUNEDoq402+HlZyTIs3Wgc3Z/X5fBPHsA6dYHKboTi8blosqHgTUhZ
 X5/3gJiw+FdqDPvLoJ99OMA12/Vg2mcTgNUkX5ZU4Nnd06EdScGqC9+luv1a5G5o+vSm
 kMBb2N1og69Xh/zurp9yf6Y5iP9x+7dO5W6BSX7Py8OzBo1dgcSktZ5kmivvLlEFHN3H
 6LHsgRsbjjGwDTxKTZ3b7QTI5w7Fq7bA2n4N4NgPcP0Do0l2deedrF00M+geTO04/k2R
 TgzSJ+FYjXXWf9NGe8BaKuUcC9YKmnbTxgSsbAZ6ErqbQtaaroig5gie6ZJ5TxWbl2QP
 KXvA==
X-Gm-Message-State: APjAAAUVc58/cf3+2VzojAVDA4iIQupiHX2uOQVDXVzU0txVBTaOG5v3
 l6aEmS2KPGdVR7FwOxWSsA==
X-Google-Smtp-Source: APXvYqwzX14uufAqEZBirHu92TvsJsk83E8+wKo4PvXEvtrFhwAdhikFaRShClMnmXjRIsRlSY/cbw==
X-Received: by 2002:a17:90a:200d:: with SMTP id
 n13mr4526087pjc.16.1581087877563; 
 Fri, 07 Feb 2020 07:04:37 -0800 (PST)
Received: from madhuparna-HP-Notebook
 ([2402:3a80:545:29e1:fc5b:5bfd:1ab4:4848])
 by smtp.gmail.com with ESMTPSA id y16sm3386521pgf.41.2020.02.07.07.04.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Feb 2020 07:04:36 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Fri, 7 Feb 2020 20:34:29 +0530
To: Joel Fernandes <joel@joelfernandes.org>
Message-ID: <20200207150429.GB10751@madhuparna-HP-Notebook>
References: <20200205172437.10113-1-madhuparnabhowmik10@gmail.com>
 <87wo90myhj.fsf@x220.int.ebiederm.org>
 <20200206110051.GA4531@madhuparna-HP-Notebook>
 <20200206202511.GC36876@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206202511.GC36876@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: paulmck@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 oleg@redhat.com, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, ebiederm@xmission.com,
 tj@kernel.org, christian.brauner@ubuntu.com,
 "Eric W. Biederman" <ebiederm@gmail.com>, guro@fb.com
Subject: Re: [Linux-kernel-mentees] [PATCH] signal.c: Fix sparse warnings
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

On Thu, Feb 06, 2020 at 03:25:11PM -0500, Joel Fernandes wrote:
> On Thu, Feb 06, 2020 at 04:30:51PM +0530, Madhuparna Bhowmik wrote:
> > On Wed, Feb 05, 2020 at 04:59:52PM -0600, Eric W. Biederman wrote:
> > > madhuparnabhowmik10@gmail.com writes:
> > > 
> > > > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > > >
> > > > This patch fixes the following two sparse warnings caused due to
> > > > accessing RCU protected pointer tsk->parent without rcu primitives.
> > > >
> > > > kernel/signal.c:1948:65: warning: incorrect type in argument 1 (different address spaces)
> > > > kernel/signal.c:1948:65:    expected struct task_struct *tsk
> > > > kernel/signal.c:1948:65:    got struct task_struct [noderef] <asn:4> *parent
> > > > kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
> > > > kernel/signal.c:1949:40:    expected void const volatile *p
> > > > kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
> > > > kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
> > > > kernel/signal.c:1949:40:    expected void const volatile *p
> > > > kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
> > > >
> > > > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > > > ---
> > > >  kernel/signal.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/kernel/signal.c b/kernel/signal.c
> > > > index 9ad8dea93dbb..8227058ea8c4 100644
> > > > --- a/kernel/signal.c
> > > > +++ b/kernel/signal.c
> > > > @@ -1945,8 +1945,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
> > > >  	 * correct to rely on this
> > > >  	 */
> > > >  	rcu_read_lock();
> > > > -	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(tsk->parent));
> > > > -	info.si_uid = from_kuid_munged(task_cred_xxx(tsk->parent, user_ns),
> > > > +	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(rcu_dereference(tsk->parent)));
> > > > +	info.si_uid = from_kuid_munged(task_cred_xxx(rcu_dereference(tsk->parent), user_ns),
> > > >  				       task_uid(tsk));
> > > >  	rcu_read_unlock();
> > > 
> > > 
> > > Still wrong because that access fundamentally depends upon the
> > > task_list_lock no the rcu_read_lock.  Things need to be consistent for
> > > longer than the rcu_read_lock is held.
> > >
> > Okay, then how about something like rcu_dereference_protected(tsk->parent, lockdep_is_held(&tasklist_lock))?
> > Let me know if this looks fine to you.
> 
> But then there are several other ->parent accesses in the function. What
> about something like the following? It removes the confusion Eric is
> referring to and fixes the sparse errors you mentioned. Thoughts?
>
Yes, I agree this should remove the confusion.

Thank you,
Madhuparna

> ---8<-----------------------
> 
> diff --git a/kernel/signal.c b/kernel/signal.c
> index bcd46f547db39..92f0b7bf70bf3 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1909,6 +1909,7 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
>  	struct sighand_struct *psig;
>  	bool autoreap = false;
>  	u64 utime, stime;
> +	struct task_struct *tsk_parent;
>  
>  	BUG_ON(sig == -1);
>  
> @@ -1918,6 +1919,9 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
>  	BUG_ON(!tsk->ptrace &&
>  	       (tsk->group_leader != tsk || !thread_group_empty(tsk)));
>  
> +	tsk_parent = rcu_dereference_protected(tsk->parent,
> +					   lockdep_is_held(&tasklist_lock));
> +
>  	/* Wake up all pidfd waiters */
>  	do_notify_pidfd(tsk);
>  
> @@ -1926,7 +1930,7 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
>  		 * This is only possible if parent == real_parent.
>  		 * Check if it has changed security domain.
>  		 */
> -		if (tsk->parent_exec_id != tsk->parent->self_exec_id)
> +		if (tsk->parent_exec_id != tsk_parent->self_exec_id)
>  			sig = SIGCHLD;
>  	}
>  
> @@ -1945,8 +1949,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
>  	 * correct to rely on this
>  	 */
>  	rcu_read_lock();
> -	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(tsk->parent));
> -	info.si_uid = from_kuid_munged(task_cred_xxx(tsk->parent, user_ns),
> +	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(tsk_parent));
> +	info.si_uid = from_kuid_munged(task_cred_xxx(tsk_parent, user_ns),
>  				       task_uid(tsk));
>  	rcu_read_unlock();
>  
> @@ -1964,7 +1968,7 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
>  		info.si_status = tsk->exit_code >> 8;
>  	}
>  
> -	psig = tsk->parent->sighand;
> +	psig = tsk_parent->sighand;
>  	spin_lock_irqsave(&psig->siglock, flags);
>  	if (!tsk->ptrace && sig == SIGCHLD &&
>  	    (psig->action[SIGCHLD-1].sa.sa_handler == SIG_IGN ||
> @@ -1989,8 +1993,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
>  			sig = 0;
>  	}
>  	if (valid_signal(sig) && sig)
> -		__group_send_sig_info(sig, &info, tsk->parent);
> -	__wake_up_parent(tsk, tsk->parent);
> +		__group_send_sig_info(sig, &info, tsk_parent);
> +	__wake_up_parent(tsk, tsk_parent);
>  	spin_unlock_irqrestore(&psig->siglock, flags);
>  
>  	return autoreap;
> -- 
> 2.25.0.341.g760bfbb309-goog
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
