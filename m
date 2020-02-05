Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDF5C352A2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 13:29:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3944E217BA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 13:29:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofwCmh1s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3944E217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 04EB2813E8;
	Wed,  5 Feb 2020 13:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 977mIF2kVWf5; Wed,  5 Feb 2020 13:29:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B94281392;
	Wed,  5 Feb 2020 13:29:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87E18C0175;
	Wed,  5 Feb 2020 13:29:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD50DC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BBE182044D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PfcfkAZ7Tlog
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:29:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 4215920443
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:29:20 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FB7F2072B;
 Wed,  5 Feb 2020 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580909360;
 bh=q3GH23a1FDWaFVRhUTNliOpuwo1wF6ZsFejI9M8tSQ0=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=ofwCmh1sIX/qbPu2BPDWAM8+n1bBJRtfpk57yQ5E3gpnTb1ouvryIAWv1mX68b7+V
 asnILCtTNG4d18fkKGdPX0/wEEH9JMoUTOeLLVzuWrJ4NExqkhMf2bNqoCf0SNipV1
 0qXXPXGEiLt76+qPSL7164BVlu3fifDR8dPG4HNc=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id D16FD35227F3; Wed,  5 Feb 2020 05:29:19 -0800 (PST)
Date: Wed, 5 Feb 2020 05:29:19 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20200205132919.GU2935@paulmck-ThinkPad-P72>
References: <20200201072703.17330-1-frextrite@gmail.com>
 <20200203163301.GB85781@google.com>
 <20200204200116.479f0c60@oasis.local.home>
 <20200205131110.GT2935@paulmck-ThinkPad-P72>
 <20200205081409.4550aa67@oasis.local.home>
 <20200205081921.34b19d9a@oasis.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205081921.34b19d9a@oasis.local.home>
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

On Wed, Feb 05, 2020 at 08:19:21AM -0500, Steven Rostedt wrote:
> On Wed, 5 Feb 2020 08:14:09 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Wed, 5 Feb 2020 05:11:10 -0800
> > "Paul E. McKenney" <paulmck@kernel.org> wrote:
> > 
> > > I strongly recommend a comment stating why disabling preemption prevents
> > > ftrace_graph_hash from going away.  I see the synchronize_rcu() after
> > > the rcu_assign_pointer() in ftrace_graph_release(), but I don't see
> > > anything that waits on CPUs that RCU is not watching.
> > > 
> > > Of course, event tracing -makes- RCU watch when needed, but if that
> > > was set up, then lockdep would not have complained.
> > > 
> > > So what am I missing?  
> > 
> > Keep looking in your INBOX and look at the patch I asked you to ack or
> > complain about ;-) 

Not yet seeing it, but...

> Actually, looking at the code myself, it appears to be missing the
> ftrace_sync. Thus, this is a bug, and requires the ftrace sync, as
> synchronize_rcu() is not strong enough here.
> 
> Patch in process!

Thank you for chasing it down!

							Thanx, Paul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
