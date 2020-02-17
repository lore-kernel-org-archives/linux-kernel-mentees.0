Return-Path: <SRS0=adXe=4F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311FDC34021
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Feb 2020 18:28:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDC4224656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Feb 2020 18:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORd/0qL1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDC4224656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C83A520458;
	Mon, 17 Feb 2020 18:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxtT10is7nq5; Mon, 17 Feb 2020 18:28:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4D35620009;
	Mon, 17 Feb 2020 18:28:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34E39C08A0;
	Mon, 17 Feb 2020 18:28:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF9D4C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 18:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9974584F5A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 18:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wCjLjPEgPAay
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 18:28:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 09C9384A75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 18:28:32 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0436227BF;
 Mon, 17 Feb 2020 18:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581964111;
 bh=VX6VBdSNbKVS9TKiwcwWl/BkRExmIhlTJuoRPfrgS4A=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=ORd/0qL1SPD3b86/Yo1Efg4x74DS5vMT5gyOhni0O69KZ6QcvIex5QAlyLDF0emPk
 aMPaweMZVVzCNzc/9AQPZuI/l0hsEx9VC/NID5+qqsGYpn4fIyTx3usXI4YekdWEcl
 YjINY2b4jXrvlZV3/RbJSRfRJzh3PVtpMZuR0fCw=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 8A970352273C; Mon, 17 Feb 2020 10:28:31 -0800 (PST)
Date: Mon, 17 Feb 2020 10:28:31 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200217182831.GR2935@paulmck-ThinkPad-P72>
References: <20200216074636.GB14025@workstation-portable>
 <20200217151246.GS14897@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217151246.GS14897@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
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
Reply-To: paulmck@kernel.org
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

Agreed, I would prefer use of lockdep assertions myself.  And yes, I
did try to get rid of spin_is_locked() some time back, but there were
a few use cases that proved stubborn.  :-(

>  - this RCU list stuff is just plain annoying
> 
> I'm tempted to do something like:
> 
> #define STFU (true)
> 
> 	hlist_for_each_entry_rcu(chain, head, entry, STFU) {

Now that is just plain silly.  It is easier to type "true" than "STFU",
satisfying though the latter might feel to you right now.

> Paul, are we going a little over-board with this stuff? Do we really
> have to annotate all of this?

Like rcu_dereference_raw()?  

My goal is to provide infrastructure that allows people to gain the
benefit of automated code review if they so choose.  And a number have
so chosen.  In this case, it is pretty easy to disable the checking by
adding "true" as the last argument, so I am not seeing a real problem.

Just don't come crying to me if doing so ends up hiding a bug.  ;-)

							Thanx, Paul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
