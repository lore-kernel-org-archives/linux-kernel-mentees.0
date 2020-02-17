Return-Path: <SRS0=adXe=4F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06371C34024
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Feb 2020 16:35:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C234A21D7D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Feb 2020 16:35:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="WGZU4isB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C234A21D7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 913E08577A;
	Mon, 17 Feb 2020 16:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIOioRonxHAj; Mon, 17 Feb 2020 16:35:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB0F2855F6;
	Mon, 17 Feb 2020 16:35:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D23A4C08A0;
	Mon, 17 Feb 2020 16:35:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FD99C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 16:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 79BEF84DE1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 16:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ReV1izH0A+Q3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 16:35:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C430F84E8F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 16:35:29 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id p7so16720034qkh.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 08:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/RJwWrZ2M5oJXEFSa9WHJkWIFOQLYkCwM2AiEio3Bq0=;
 b=WGZU4isBp4loe6ivVlz1unS9nb4Z/yQ4B1HizjWYAr92VCRJty9h1m6e6b1rDV9W7O
 q/QzXn6pjRZuu2T9DBYA57POc9oN9hCYd7kmX70MlXDzf5HZtwz6UUK89IlwXf6vWj3C
 cvCrNLu+CrVBzzqu3MsbKDHkaiGXDy6Rbtd3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/RJwWrZ2M5oJXEFSa9WHJkWIFOQLYkCwM2AiEio3Bq0=;
 b=EXLb0H4849Bid9jpWcR2YnB4+zrliaI+tHVvUPko6ea1wmcXkJYjMTfVFJJTV0mFJP
 iBRD1Ebw9hxjCxBPjY/0KF9oalOpmJEPztf0vp4JozUg8KtZB/1DxD1IVKVN/gU+vNid
 Ow/4upTjLp/m+fIPRDcWcQjJD9ESAqgb9B9VtLtiWbzr6WJFfzJXue5uGNQ+BU1QMjpz
 DJDbaGs9M+Cy9Ky84AzRpZ0VysuywkD99atckFYWfNg/kv2rAhqT4RpY6St6GyfYEOxR
 19ie+B24fJAnThVd4ThC4o08FdGe3Z2RnWOPrm8FJCs4xSUqvyhrovaaczcshIcxXT6Q
 OALg==
X-Gm-Message-State: APjAAAXOQJZZx14nwHw+8CA8gK5h259VLmsn+St+TEcSBCWcME54bAeo
 oFIJaleqlGcKoU0hbfE7raBNuQ==
X-Google-Smtp-Source: APXvYqwPYhiOhDj+6h2cTxfM71WONNAkNdlGR1EhF3qH8+8++w34iTMGStn7eBr51SLAE1hz7U31ZA==
X-Received: by 2002:a37:a649:: with SMTP id p70mr15388221qke.497.1581957328223; 
 Mon, 17 Feb 2020 08:35:28 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id h9sm406654qtq.61.2020.02.17.08.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 08:35:27 -0800 (PST)
Date: Mon, 17 Feb 2020 11:35:27 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200217163527.GB145700@google.com>
References: <20200216074636.GB14025@workstation-portable>
 <20200217151246.GS14897@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217151246.GS14897@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RESEND] lockdep: Pass lockdep
	expression to RCU lists
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

On Mon, Feb 17, 2020 at 04:12:46PM +0100, Peter Zijlstra wrote:
> On Sun, Feb 16, 2020 at 01:16:36PM +0530, Amol Grover wrote:
> > Data is traversed using hlist_for_each_entry_rcu outside an
> > RCU read-side critical section but under the protection
> > of either lockdep_lock or with irqs disabled.
> > 
> > Hence, add corresponding lockdep expression to silence false-positive
> > lockdep warnings, and harden RCU lists. Also add macro for
> > corresponding lockdep expression.
> > 
> > Two things to note:
> > - RCU traversals protected under both, irqs disabled and
> > graph lock, have both the checks in the lockdep expression.
> > - RCU traversals under the protection of just disabled irqs
> > don't have a corresponding lockdep expression as it is implicitly
> > checked for.
> > 
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > ---
> >  kernel/locking/lockdep.c | 21 +++++++++++++--------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> > 
> > diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> > index 32282e7112d3..696ad5d4daed 100644
> > --- a/kernel/locking/lockdep.c
> > +++ b/kernel/locking/lockdep.c
> > @@ -85,6 +85,8 @@ module_param(lock_stat, int, 0644);
> >   * code to recurse back into the lockdep code...
> >   */
> >  static arch_spinlock_t lockdep_lock = (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
> > +#define graph_lock_held() \
> > +	arch_spin_is_locked(&lockdep_lock)
> >  static struct task_struct *lockdep_selftest_task_struct;
> >  
> >  static int graph_lock(void)
> > @@ -1009,7 +1011,7 @@ static bool __check_data_structures(void)
> >  	/* Check the chain_key of all lock chains. */
> >  	for (i = 0; i < ARRAY_SIZE(chainhash_table); i++) {
> >  		head = chainhash_table + i;
> > -		hlist_for_each_entry_rcu(chain, head, entry) {
> > +		hlist_for_each_entry_rcu(chain, head, entry, graph_lock_held()) {
> >  			if (!check_lock_chain_key(chain))
> >  				return false;
> >  		}
> 
> URGH.. this patch combines two horribles to create a horrific :/
> 
>  - spin_is_locked() is an abomination
>  - this RCU list stuff is just plain annoying
> 
> I'm tempted to do something like:
> 
> #define STFU (true)
> 
> 	hlist_for_each_entry_rcu(chain, head, entry, STFU) {
> 
> Paul, are we going a little over-board with this stuff? Do we really
> have to annotate all of this?

Could it use hlist_for_each_entry_rcu_notrace() if that's better for this
code? That one does not need the additional condition passed. Though I find
rcu_dereference_raw_nocheck() in that macro a bit odd since it does sparse
checking, where as the rcu_dereference_raw() in hlist_for_each_entry() does
nothing.

And perf can do the same thing if it iss too annoying, like the tracing code
does.

This came up mainly because list_for_each_entry_rcu() does some checking of
it is in a reader section, but it is helpless in its checking when a lock is
held.

thanks,

 - Joel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
