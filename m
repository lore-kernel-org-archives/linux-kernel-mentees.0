Return-Path: <SRS0=HsuC=3P=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB2CC35242
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jan 2020 01:23:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 805A52077C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jan 2020 01:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHMhoBBG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 805A52077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34AF087C9F;
	Sun, 26 Jan 2020 01:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1R3Np-Ph2Uj9; Sun, 26 Jan 2020 01:23:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1ACE787C17;
	Sun, 26 Jan 2020 01:23:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2FABC18DC;
	Sun, 26 Jan 2020 01:23:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9984C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jan 2020 01:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C0E43862F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jan 2020 01:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rKQtdKE5Ulp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jan 2020 01:23:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 25D11862C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jan 2020 01:23:55 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D35DE2071E;
 Sun, 26 Jan 2020 01:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580001834;
 bh=GT9CakDKgzHGUsSd9Pzep51RqWx2T4j5nL8jJpuNXfU=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=cHMhoBBGZV26DndY6i79l0/oheY4IbhYgCsuqfMECWp+RWh41bvab2aVqy5sh4VP2
 zzY5c7ceHPkAgkzOeJIIw+jRuMUcrqF1H9vWDxzZF26XayhojEOK1n8F6qZrqmiqZb
 iWqsFYhbU643ZDKtlj+M0bfkHQQLNXzrJJ2KrkZc=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id A43853522863; Sat, 25 Jan 2020 17:23:54 -0800 (PST)
Date: Sat, 25 Jan 2020 17:23:54 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <20200126012354.GH2935@paulmck-ThinkPad-P72>
References: <20200124045908.26389-1-madhuparnabhowmik10@gmail.com>
 <37A3FF92-0958-46DD-AFB1-CE72000B153F@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37A3FF92-0958-46DD-AFB1-CE72000B153F@ubuntu.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: juri.lelli@redhat.com, vincent.guittot@linaro.org, peterz@infradead.org,
 oleg@redhat.com, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 madhuparnabhowmik10@gmail.com, mingo@redhat.com, ebiederm@xmission.com,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Jan 25, 2020 at 10:41:06PM +0100, Christian Brauner wrote:
> On January 24, 2020 5:59:08 AM GMT+01:00, madhuparnabhowmik10@gmail.com wrote:
> >From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >
> >This patch fixes the following sparse errors by annotating the
> >sighand_struct with __rcu
> >
> >kernel/fork.c:1511:9: error: incompatible types in comparison
> >expression
> >kernel/exit.c:100:19: error: incompatible types in comparison
> >expression
> >kernel/signal.c:1370:27: error: incompatible types in comparison
> >expression
> >
> >This fix introduces the following sparse error in signal.c due to
> >checking the sighand pointer without rcu primitives:
> >
> >kernel/signal.c:1386:21: error: incompatible types in comparison
> >expression
> >
> >This new sparse error is also fixed in this patch.
> >
> >Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

Acked-by: Paul E. McKenney <paulmck@kernel.org>

> >---
> > include/linux/sched.h | 2 +-
> > kernel/signal.c       | 2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/include/linux/sched.h b/include/linux/sched.h
> >index b511e178a89f..7a351360ad54 100644
> >--- a/include/linux/sched.h
> >+++ b/include/linux/sched.h
> >@@ -918,7 +918,7 @@ struct task_struct {
> > 
> > 	/* Signal handlers: */
> > 	struct signal_struct		*signal;
> >-	struct sighand_struct		*sighand;
> >+	struct sighand_struct __rcu		*sighand;
> > 	sigset_t			blocked;
> > 	sigset_t			real_blocked;
> > 	/* Restored if set_restore_sigmask() was used: */
> >diff --git a/kernel/signal.c b/kernel/signal.c
> >index bcd46f547db3..9ad8dea93dbb 100644
> >--- a/kernel/signal.c
> >+++ b/kernel/signal.c
> >@@ -1383,7 +1383,7 @@ struct sighand_struct *__lock_task_sighand(struct
> >task_struct *tsk,
> > 		 * must see ->sighand == NULL.
> > 		 */
> > 		spin_lock_irqsave(&sighand->siglock, *flags);
> >-		if (likely(sighand == tsk->sighand))
> >+		if (likely(sighand == rcu_access_pointer(tsk->sighand)))
> > 			break;
> > 		spin_unlock_irqrestore(&sighand->siglock, *flags);
> > 	}
> 
> If Paul is happy with this and nobody wants to take it I'll pick this up.

Works for me!

							Thanx, Paul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
