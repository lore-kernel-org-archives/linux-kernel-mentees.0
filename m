Return-Path: <SRS0=Lmc5=4W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADE5C3F2D1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Mar 2020 00:10:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C27B920842
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Mar 2020 00:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GK/YKQHZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C27B920842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 761EE1FF11;
	Thu,  5 Mar 2020 00:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0uW2hPjZwHz; Thu,  5 Mar 2020 00:10:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 77A241FDAF;
	Thu,  5 Mar 2020 00:10:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 608E7C089F;
	Thu,  5 Mar 2020 00:10:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8638CC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Mar 2020 00:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 74149848A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Mar 2020 00:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysjV-xcmbLHe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Mar 2020 00:10:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5A178847DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Mar 2020 00:10:46 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2211020842;
 Thu,  5 Mar 2020 00:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583367046;
 bh=iRqeuR4zqIe44/ohDAsoST7Lv50uMJs4rL4YHPuU0AE=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=GK/YKQHZXYef51SPBiZpY5AHhRzUhyE6DpUGpmjOZPiTa4gFtV253qBENyjex4FG8
 fYVr9TNCAyF55cJwGbi07Kam1hscWZbL32pSouG8pT2HqWeaPKao8lcTowOFTi8Et7
 EWWOfUwk8ADb+sZles3s15N5+SVcTKY7wpfSRSsg=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id E8ACA3522731; Wed,  4 Mar 2020 16:10:45 -0800 (PST)
Date: Wed, 4 Mar 2020 16:10:45 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Pawan Kumar Meena <pawank1804@gmail.com>
Message-ID: <20200305001045.GT2935@paulmck-ThinkPad-P72>
References: <20200303144546.20405-1-pawank1804@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303144546.20405-1-pawank1804@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH RESEND] Documentation: RCU:
 lockdep.txt: Convert to lockdep.rst
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

On Tue, Mar 03, 2020 at 08:15:46PM +0530, Pawan Kumar Meena wrote:
> This patch converts lockdep.txt to lockdep.rst and adds it to index.rst.
> 
> Signed-off-by: Pawan Kumar Meena <pawank1804@gmail.com>

Given an ack from someone on the docs side, I will be happy to queue
this one.  Given the large change from the last posted version with no
version history, I am a bit leery of taking it straight away.

						Thanx, Paul

> ---
>  Documentation/RCU/index.rst                    | 1 +
>  Documentation/RCU/{lockdep.txt => lockdep.rst} | 9 ++++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
>  rename Documentation/RCU/{lockdep.txt => lockdep.rst} (97%)
> 
> diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
> index 81a0a1e5f767..109dea13f165 100644
> --- a/Documentation/RCU/index.rst
> +++ b/Documentation/RCU/index.rst
> @@ -10,6 +10,7 @@ RCU concepts
>     arrayRCU
>     rcubarrier
>     rcu_dereference
> +   lockdep
>     whatisRCU
>     rcu
>     listRCU
> diff --git a/Documentation/RCU/lockdep.txt b/Documentation/RCU/lockdep.rst
> similarity index 97%
> rename from Documentation/RCU/lockdep.txt
> rename to Documentation/RCU/lockdep.rst
> index 89db949eeca0..3a88d8a59753 100644
> --- a/Documentation/RCU/lockdep.txt
> +++ b/Documentation/RCU/lockdep.rst
> @@ -1,4 +1,7 @@
> +.. _lockdep_doc:
> +
>  RCU and lockdep checking
> +========================
>  
>  All flavors of RCU have lockdep checking available, so that lockdep is
>  aware of when each task enters and leaves any flavor of RCU read-side
> @@ -63,7 +66,7 @@ checking of rcu_dereference() primitives:
>  The rcu_dereference_check() check expression can be any boolean
>  expression, but would normally include a lockdep expression.  However,
>  any boolean expression can be used.  For a moderately ornate example,
> -consider the following:
> +consider the following::
>  
>  	file = rcu_dereference_check(fdt->fd[fd],
>  				     lockdep_is_held(&files->file_lock) ||
> @@ -82,7 +85,7 @@ RCU read-side critical sections, in case (2) the ->file_lock prevents
>  any change from taking place, and finally, in case (3) the current task
>  is the only task accessing the file_struct, again preventing any change
>  from taking place.  If the above statement was invoked only from updater
> -code, it could instead be written as follows:
> +code, it could instead be written as follows::
>  
>  	file = rcu_dereference_protected(fdt->fd[fd],
>  					 lockdep_is_held(&files->file_lock) ||
> @@ -105,7 +108,7 @@ false and they are called from outside any RCU read-side critical section.
>  
>  For example, the workqueue for_each_pwq() macro is intended to be used
>  either within an RCU read-side critical section or with wq->mutex held.
> -It is thus implemented as follows:
> +It is thus implemented as follows::
>  
>  	#define for_each_pwq(pwq, wq)
>  		list_for_each_entry_rcu((pwq), &(wq)->pwqs, pwqs_node,
> -- 
> 2.17.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
