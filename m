Return-Path: <SRS0=QLdQ=3E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC8EC33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 12:37:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 935662467A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 12:37:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rz2nORF/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 935662467A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6A7E686322;
	Wed, 15 Jan 2020 12:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f94470kgQj4J; Wed, 15 Jan 2020 12:37:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D707862F4;
	Wed, 15 Jan 2020 12:37:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53DBBC1D82;
	Wed, 15 Jan 2020 12:37:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B3F7C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 12:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 43C2E862F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 12:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tl9jBNQqYulN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 12:37:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B221186322
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 12:37:00 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id p27so6792949pli.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 04:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LPZeah86TqCcRk0IQLjv+gJuPiExmkzZ76B4+3CP1fo=;
 b=rz2nORF/wWhRxDGpNQKA3o/R+ur66SU7obM3WNaciNLBm+vxJ12EtmCZz8nye/r1tr
 LOSO/teMaMj8OHxTh1OrDUtR4qcrbs+OsPjUrbHVTdhCNlXtGdMu7AeEHJomONp1HaB/
 EjJXvD3w1/zyaqWtVH+NyrAviNpqbM6cdWcq/tQ3LgOKMoc3YYMvP6C+i8bGeJCCZq3R
 LHmMVlBWKIGxdcm0sFOWd4aHOuuyD/GbChW0S5Lv+CCglZ0omL4cbODUCVf7UJaGcmlL
 7uhijTXEp722dqt8DWPyua00yqR5g5pdt+zk8LtntKNLKmIPQNhH3YEtXtyRhsZhCtoq
 8Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LPZeah86TqCcRk0IQLjv+gJuPiExmkzZ76B4+3CP1fo=;
 b=IGbp1lSz/6bj/8Sg0IZVypWuDKGTIZdCwKfinvy9rFvHnqTXn+Ee2TDOBH/Ar3NghR
 twIRM+vYloiSU/9rKwGuGG8vP13pUEp/XMaKF6TjBZxp2U57Smrh2ZCa6NezrTo8bIpV
 948/lKcdZ3J2Hhil8hhb8U24HNnxL3FHIDbYmwj3pHHhpCyGCR/FKRXl13uS7yVGLzsw
 aYypDZT9moSlUoW4qWJ8KFgYLAMNsM4ajE7yEyoN6gSatVbcFxyt7Xrgt142AYFL1VJY
 Azk+kaLJkNPsNqOJt/Fl7G2FHBqGyT74z1euiqOuwS7cK8hv1/OOk3oVldWYXntA6GFN
 MlTg==
X-Gm-Message-State: APjAAAVQ79awNln1MaaCS8Sz5LMOY1wbzUf5AhX1Kza2352w26J6N6bn
 xG5Hz7n4RVnmpmqu3L2T4eo=
X-Google-Smtp-Source: APXvYqwQQ/ccGqz5owH2D1Enl9uEjWkvdD63LkprvHZ+ofWiqwF6510duTXNlytXPOBaFzcpmDv1ew==
X-Received: by 2002:a17:90a:7781:: with SMTP id
 v1mr19909377pjk.108.1579091820098; 
 Wed, 15 Jan 2020 04:37:00 -0800 (PST)
Received: from workstation-portable ([103.211.17.106])
 by smtp.gmail.com with ESMTPSA id a15sm22284575pfh.169.2020.01.15.04.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 04:36:59 -0800 (PST)
Date: Wed, 15 Jan 2020 18:06:53 +0530
From: Amol Grover <frextrite@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Message-ID: <20200115123653.GA20601@workstation-portable>
References: <20200110164709.26741-1-frextrite@gmail.com>
 <202001121358.YVbD4V9l%lkp@intel.com>
 <20200114030030.GB2559@workstation-portable>
 <20200114175828.GR2935@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114175828.GR2935@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Corey Minyard <minyard@acm.org>, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 openipmi-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] drivers: char: ipmi:
 ipmi_msghandler: Pass lockdep expression to RCU lists
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

On Tue, Jan 14, 2020 at 09:58:28AM -0800, Paul E. McKenney wrote:
> On Tue, Jan 14, 2020 at 08:30:30AM +0530, Amol Grover wrote:
> > On Sun, Jan 12, 2020 at 01:25:58PM +0800, kbuild test robot wrote:
> > > Hi Amol,
> > > 
> > > Thank you for the patch! Perhaps something to improve:
> > > 
> > > [auto build test WARNING on char-misc/char-misc-testing]
> > > [also build test WARNING on ipmi/for-next arm-soc/for-next v5.5-rc5]
> > > [if your patch is applied to the wrong git tree, please drop us a note to help
> > > improve the system. BTW, we also suggest to use '--base' option to specify the
> > > base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> > > 
> > > url:    https://github.com/0day-ci/linux/commits/Amol-Grover/drivers-char-ipmi-ipmi_msghandler-Pass-lockdep-expression-to-RCU-lists/20200111-081002
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git 16bb7abc4a6b9defffa294e4dc28383e62a1dbcf
> > > config: x86_64-randconfig-a003-20200109 (attached as .config)
> > > compiler: gcc-5 (Ubuntu 5.5.0-12ubuntu1) 5.5.0 20171010
> > > reproduce:
> > >         # save the attached .config to linux build tree
> > >         make ARCH=x86_64 
> > > 
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > >    In file included from include/linux/export.h:43:0,
> > >                     from include/linux/linkage.h:7,
> > >                     from include/linux/kernel.h:8,
> > >                     from include/linux/list.h:9,
> > >                     from include/linux/module.h:12,
> > >                     from drivers/char/ipmi/ipmi_msghandler.c:17:
> > >    drivers/char/ipmi/ipmi_msghandler.c: In function 'find_cmd_rcvr':
> > >    include/linux/rculist.h:53:25: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
> > >      RCU_LOCKDEP_WARN(!cond && !rcu_read_lock_any_held(),  \
> > >                             ^
> > 
> > As mentioned above, RCU_LOCKDEP_WARN macro is called from
> > __list_check_rcu with 2 parameters
> > 
> > 1. !cond && !rcu_read_lock_any_held()
> > 2. The message to display incase there is a lockdep warning.
> > 
> > 
> > However, if I pass the lockdep checking condition as:
> > 
> > list_for_each_entry_rcu(ptr, list, head, lockdep_is_held(&some_lock) || rcu_read_lock_held())
> 
> Right, given the _rcu() suffix on the command, the rcu_read_lock_held()
> is implied.
> 
> > this trickles down to __list_check_rcu and then finally to
> > RCU_LOCKDEP_WARN as (here cond is `lockdep_is_held(&some_lock) || rcu_read_lock_held()`):
> > 
> > RCU_LOCKDEP_WARN(!lockdep_is_held(&some_lock) || rcu_read_lock_held() && !rcu_read_lock_any_held())
> > 
> > which according to operator precedence (I hopefully got them right)
> > would always evaluate to true if we are in an RCU read-side critical
> > section (without a lock), and hence, result in a false-positive lockdep
> > warning.
> 
> It looks that way to me.  But why not actually try it out?  After all,
> only the running system knows for sure.  And there might be some trick
> that we are both missing.
> 

I just tested this, here are the results:

Case 1: Using`lockdep_is_held() || rcu_read_lock_held()`

lock	RCU RSCS		Splat?	Actual
Y	Y			N	N
Y	N			N	N
N	Y			Y	N <=
N	N			Y	Y

Similar for
Case 2: Using `rcu_read_lock_held() || lockdep_is_held()`

Case 3: Consider 2 locks (outside rcu_read_lock())
`lockdep_is_held(lock1) || lockdep_is_held(lock2)`

lock1	lock2			Splat?	Actual
Y	Y			N*	N
Y	N			N	N
N	Y			Y	N <=
N	N			Y	Y

This too proves the hypothesis (I'd like to call that).


*However, this shows an interesting result. When both lock1 and lock2
are held, according to the hypothesis, a splat should've occured, since
the check condition (albeit faulty atm) would be:

`!lockdep_is_held(lock1) || lockdep_is_held(lock2) && !rcu_read_lock_any_held()`
=> `!T || T && !F`
=> `F || T && T`
=> `F || T`
=> `T`
However, there was no splat. Which led me to investigate further and I
found out:
1. `rcu_read_lock_any_held()` always returns 1 even if it is outside RCU
read-side CS.
2. `rcu_read_lock_held()` seems OK, returns 1 when inside and 0 when
outside

The kernel is compiled with
PROVE_RCU=y
PROVE_RCU_LIST=y

Any thoughts on this? Is this intended? And should I send-in the patch
for the first problem?

Thanks
Amol

> > This could be easily solved by putting `cond` inside brackets as it is
> > correctly done in RCU_LOCKDEP_WARN macro but not in __list_check_rcu
> > macro. Is that so, or did I miss something?
> 
> Again, that looks correct to me, but please check.
> 
> > Secondly, since there is already a condition that checks for RCU
> > read-side critical section, the extra `rcu_read_lock_held()` we supply
> > is sort of redundant and can be skipped right?
> 
> Yes, the general rule is that if the primitives ends with _rcu(), any
> lockdep condition will be in addition to rcu_read_lock_any_held().
> So you should not need to pass RCU read-side lockdep expressions to 
> primitives whose names end in _rcu..
> 
> 							Thanx, Paul
> 
> > Thanks
> > Amol
> > 
> > >    include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
> > >     #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
> > >                                                        ^
> > > >> include/linux/rcupdate.h:263:3: note: in expansion of macro 'if'
> > >       if (debug_lockdep_rcu_enabled() && !__warned && (c)) { \
> > >       ^
> > > >> include/linux/rculist.h:53:2: note: in expansion of macro 'RCU_LOCKDEP_WARN'
> > >      RCU_LOCKDEP_WARN(!cond && !rcu_read_lock_any_held(),  \
> > >      ^
> > >    include/linux/rculist.h:371:7: note: in expansion of macro '__list_check_rcu'
> > >      for (__list_check_rcu(dummy, ## cond, 0),   \
> > >           ^
> > >    drivers/char/ipmi/ipmi_msghandler.c:1607:2: note: in expansion of macro 'list_for_each_entry_rcu'
> > >      list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
> > >      ^
> > >    include/linux/rculist.h:53:25: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
> > >      RCU_LOCKDEP_WARN(!cond && !rcu_read_lock_any_held(),  \
> > >                             ^
> > >    include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
> > >     #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
> > >                                                                 ^
> > > >> include/linux/rcupdate.h:263:3: note: in expansion of macro 'if'
> > >       if (debug_lockdep_rcu_enabled() && !__warned && (c)) { \
> > >       ^
> > > >> include/linux/rculist.h:53:2: note: in expansion of macro 'RCU_LOCKDEP_WARN'
> > >      RCU_LOCKDEP_WARN(!cond && !rcu_read_lock_any_held(),  \
> > >      ^
> > >    include/linux/rculist.h:371:7: note: in expansion of macro '__list_check_rcu'
> > >      for (__list_check_rcu(dummy, ## cond, 0),   \
> > >           ^
> > >    drivers/char/ipmi/ipmi_msghandler.c:1607:2: note: in expansion of macro 'list_for_each_entry_rcu'
> > >      list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
> > >      ^
> > >    include/linux/rculist.h:53:25: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
> > >      RCU_LOCKDEP_WARN(!cond && !rcu_read_lock_any_held(),  \
> > >                             ^
> > >    include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
> > >      (cond) ?     \
> > >       ^
> > >    include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
> > >     #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
> > >                                ^
> > > >> include/linux/rcupdate.h:263:3: note: in expansion of macro 'if'
> > >       if (debug_lockdep_rcu_enabled() && !__warned && (c)) { \
> > >       ^
> > > >> include/linux/rculist.h:53:2: note: in expansion of macro 'RCU_LOCKDEP_WARN'
> > >      RCU_LOCKDEP_WARN(!cond && !rcu_read_lock_any_held(),  \
> > >      ^
> > >    include/linux/rculist.h:371:7: note: in expansion of macro '__list_check_rcu'
> > >      for (__list_check_rcu(dummy, ## cond, 0),   \
> > >           ^
> > >    drivers/char/ipmi/ipmi_msghandler.c:1607:2: note: in expansion of macro 'list_for_each_entry_rcu'
> > >      list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
> > >      ^
> > > 
> > > vim +/if +263 include/linux/rcupdate.h
> > > 
> > > 632ee200130899 Paul E. McKenney 2010-02-22  254  
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  255  /**
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  256   * RCU_LOCKDEP_WARN - emit lockdep splat if specified condition is met
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  257   * @c: condition to check
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  258   * @s: informative message
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  259   */
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  260  #define RCU_LOCKDEP_WARN(c, s)						\
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  261  	do {								\
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  262  		static bool __section(.data.unlikely) __warned;		\
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18 @263  		if (debug_lockdep_rcu_enabled() && !__warned && (c)) {	\
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  264  			__warned = true;				\
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  265  			lockdep_rcu_suspicious(__FILE__, __LINE__, s);	\
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  266  		}							\
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  267  	} while (0)
> > > f78f5b90c4ffa5 Paul E. McKenney 2015-06-18  268  
> > > 
> > > :::::: The code at line 263 was first introduced by commit
> > > :::::: f78f5b90c4ffa559e400c3919a02236101f29f3f rcu: Rename rcu_lockdep_assert() to RCU_LOCKDEP_WARN()
> > > 
> > > :::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > > :::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > > 
> > > ---
> > > 0-DAY kernel test infrastructure                 Open Source Technology Center
> > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
> > 
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
