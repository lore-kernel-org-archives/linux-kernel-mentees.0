Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2CDC32771
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 00:01:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F71B24125
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 00:01:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3m2tFnN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F71B24125
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EA0EE85DFF;
	Tue, 21 Jan 2020 00:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EBSpB6lQI_c5; Tue, 21 Jan 2020 00:01:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0249C85DF8;
	Tue, 21 Jan 2020 00:01:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD9D1C0176;
	Tue, 21 Jan 2020 00:01:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 877DFC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 00:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6DEA386072
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 00:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iT3U5YE1L6kO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 00:00:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1D3C283883
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 00:00:59 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB61C22527;
 Tue, 21 Jan 2020 00:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579564858;
 bh=TL8+hTSU7hnDRNLe87x5EES6PdrZ165vhPZ0MkxtH7w=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=B3m2tFnN8sclNa990iPCP6BKZEo+QP6mX6mcW1I8tZxdj1fuV0nFEY4IGCTWjV3WJ
 OlaaNeX6URKcr3F3H/xx1O3IDKWUOnrL3OiXV3mGJpCRmB3PqBoLj26KCVnEQjdPRq
 A9A+97FTG+oG/guc93qspT2KDwGDNUH/DQ/BQ1cs=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 9C7DF3522745; Mon, 20 Jan 2020 16:00:58 -0800 (PST)
Date: Mon, 20 Jan 2020 16:00:58 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Joel Fernandes <joel@joelfernandes.org>
Message-ID: <20200121000058.GI2935@paulmck-ThinkPad-P72>
References: <20200118165417.12325-1-frextrite@gmail.com>
 <20200119021425.GH244899@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200119021425.GH244899@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] rculist: Add brackets around
 cond argument in __list_check_rcu macro
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

On Sat, Jan 18, 2020 at 09:14:25PM -0500, Joel Fernandes wrote:
> On Sat, Jan 18, 2020 at 10:24:18PM +0530, Amol Grover wrote:
> > Passing a complex lockdep condition to __list_check_rcu results
> > in false positive lockdep splat due to incorrect expression
> > evaluation.
> > 
> > For example, a lockdep check condition `cond1 || cond2` is
> > evaluated as `!cond1 || cond2 && !rcu_read_lock_any_held()`
> > which, according to operator precedence, evaluates to
> > `!cond1 || (cond2 && !rcu_read_lock_any_held())`.
> > This would result in a lockdep splat when cond1 is false
> > and cond2 is true which is logically incorrect.
> > 
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> 
> Good catch!
> 
> Acked-by: Joel Fernandes (Google) <joel@joelfernandes.org>

Queued for v5.7, thank you both!

							Thanx, Paul

> thanks,
> 
>  - Joel
> 
> 
> > ---
> >  include/linux/rculist.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/rculist.h b/include/linux/rculist.h
> > index 4158b7212936..dce491f0b354 100644
> > --- a/include/linux/rculist.h
> > +++ b/include/linux/rculist.h
> > @@ -50,9 +50,9 @@ static inline void INIT_LIST_HEAD_RCU(struct list_head *list)
> >  #define __list_check_rcu(dummy, cond, extra...)				\
> >  	({								\
> >  	check_arg_count_one(extra);					\
> > -	RCU_LOCKDEP_WARN(!cond && !rcu_read_lock_any_held(),		\
> > +	RCU_LOCKDEP_WARN(!(cond) && !rcu_read_lock_any_held(),		\
> >  			 "RCU-list traversed in non-reader section!");	\
> > -	 })
> > +	})
> >  #else
> >  #define __list_check_rcu(dummy, cond, extra...)				\
> >  	({ check_arg_count_one(extra); })
> > -- 
> > 2.24.1
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
