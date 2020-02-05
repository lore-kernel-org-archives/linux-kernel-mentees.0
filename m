Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CB9C35254
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 13:19:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE578217BA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 13:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE578217BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B09EB8783F;
	Wed,  5 Feb 2020 13:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vgQG+dLHY-3; Wed,  5 Feb 2020 13:19:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B1E8A874BA;
	Wed,  5 Feb 2020 13:19:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4E14C0175;
	Wed,  5 Feb 2020 13:19:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86F20C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6F1F6816F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EqIlozHKo5QG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:19:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B0ECF816D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:19:27 +0000 (UTC)
Received: from oasis.local.home (unknown [212.187.182.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D349A217BA;
 Wed,  5 Feb 2020 13:19:25 +0000 (UTC)
Date: Wed, 5 Feb 2020 08:19:21 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Message-ID: <20200205081921.34b19d9a@oasis.local.home>
In-Reply-To: <20200205081409.4550aa67@oasis.local.home>
References: <20200201072703.17330-1-frextrite@gmail.com>
 <20200203163301.GB85781@google.com>
 <20200204200116.479f0c60@oasis.local.home>
 <20200205131110.GT2935@paulmck-ThinkPad-P72>
 <20200205081409.4550aa67@oasis.local.home>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, 5 Feb 2020 08:14:09 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 5 Feb 2020 05:11:10 -0800
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > I strongly recommend a comment stating why disabling preemption prevents
> > ftrace_graph_hash from going away.  I see the synchronize_rcu() after
> > the rcu_assign_pointer() in ftrace_graph_release(), but I don't see
> > anything that waits on CPUs that RCU is not watching.
> > 
> > Of course, event tracing -makes- RCU watch when needed, but if that
> > was set up, then lockdep would not have complained.
> > 
> > So what am I missing?  
> 
> Keep looking in your INBOX and look at the patch I asked you to ack or
> complain about ;-) 


Actually, looking at the code myself, it appears to be missing the
ftrace_sync. Thus, this is a bug, and requires the ftrace sync, as
synchronize_rcu() is not strong enough here.

Patch in process!

-- Steve

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
