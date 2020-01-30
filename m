Return-Path: <SRS0=9uDz=3T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987E3C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 15:20:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 670D6206D5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 15:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 670D6206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2875888402;
	Thu, 30 Jan 2020 15:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJfExxNNQSCK; Thu, 30 Jan 2020 15:20:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 79E8288364;
	Thu, 30 Jan 2020 15:20:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70FA8C0178;
	Thu, 30 Jan 2020 15:20:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02C4EC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 15:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E3856203F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 15:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U4XMTfRn-gLX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 15:20:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by silver.osuosl.org (Postfix) with ESMTPS id 8B2DE203DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 15:20:53 +0000 (UTC)
Received: from [109.134.33.162] (helo=wittgenstein)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1ixBca-0004pl-BA; Thu, 30 Jan 2020 15:20:44 +0000
Date: Thu, 30 Jan 2020 16:20:43 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Oleg Nesterov <oleg@redhat.com>
Message-ID: <20200130152043.kgcf5s6h6qaalpbl@wittgenstein>
References: <20200130062028.4870-1-madhuparnabhowmik10@gmail.com>
 <20200130103158.azxldyfnugwvv6vy@wittgenstein>
 <20200130113339.GA25426@redhat.com>
 <32DE6B3E-ADC3-49EB-888C-CABCF82330FE@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32DE6B3E-ADC3-49EB-888C-CABCF82330FE@ubuntu.com>
Cc: paulmck@kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, madhuparnabhowmik10@gmail.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, mingo@kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] exit.c: Fix Sparse errors and
	warnings
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

On Thu, Jan 30, 2020 at 12:45:26PM +0100, Christian Brauner wrote:
> On January 30, 2020 12:33:41 PM GMT+01:00, Oleg Nesterov <oleg@redhat.com> wrote:
> >On 01/30, Christian Brauner wrote:
> >>
> >> On Thu, Jan 30, 2020 at 11:50:28AM +0530,
> >madhuparnabhowmik10@gmail.com wrote:
> >> > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >> >
> >> > This patch fixes the following sparse error:
> >> > kernel/exit.c:627:25: error: incompatible types in comparison
> >expression
> >> >
> >> > And the following warning:
> >> > kernel/exit.c:626:40: warning: incorrect type in assignment
> >> >
> >> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >>
> >> I think the previous version was already fine but hopefully
> >> RCU_INIT_POINTER() really saves some overhead. In any case:
> >
> >It is not about overhead, RCU_INIT_POINTER() documents the fact that we
> >didn't make any changes to the new parent, we only need to change the
> >pointer.
> 
> Right, I wasn't complaining.  RCU_INIT_POINTER() claims that it has less overhead than rcu_assign_pointer().
> So that is an additional argument for it.
> 
> >
> >And btw, I don't really understand the __rcu annotations. Say,
> >according
> >to sparse this code is wrong:
> >
> >	int __rcu *P;
> >
> >	void func(int *p)
> >	{
> >		P = p;
> >	}
> >
> >OK, although quite possibly it is fine.
> >
> >However, this code
> >
> >	int __rcu *P;
> >
> >	void func(int __rcu *p)
> >	{
> >		*p = 10;
> >	       	P = p;
> >	}
> >
> >is almost certainly wrong but sparse is happy, asn is the same.
> 
> That's more an argument to fix sparse I guess?
> The annotations themselves are rather useful I think.
> They at least help me when reading the code.
> It's not that rcu lifetimes are trivial and anything that helps remind me that an object wants rcu semantics I'm happy to take it. :)
> 
> >
> >
> >> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
> >
> >Acked-by: Oleg Nesterov <oleg@redhat.com>

Thanks, applied for post -rc1.
Christian
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
