Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30E5C35247
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 21:58:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BD1B2082E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 21:58:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="BfgtY2l3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BD1B2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4C1C3214EC;
	Wed,  5 Feb 2020 21:58:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qdgmkvnDIXhZ; Wed,  5 Feb 2020 21:58:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 26F3820119;
	Wed,  5 Feb 2020 21:58:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B544C1D81;
	Wed,  5 Feb 2020 21:58:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9778C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 21:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 91ED887356
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 21:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6iXorX+Cf7rC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 21:58:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ECD428731E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 21:58:01 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id dw13so1544665pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Feb 2020 13:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GZiszdRhEoXDklowAhrMMrF/LCE5Ul6eKPbb4HvqS4w=;
 b=BfgtY2l3umi7jAcYAQkg0xPmgX1OhRn09atiKDbbeZ66YUiA39WaRMI0IYWXIR78lH
 camocExRGLndJzc7CcnzUHTuiZsTZGalRcwYsKd161M1EvmA9q3xNSK01OzMDVRNYtOl
 TX4dEOq/PIsoUdTqRGSWus5SFSKGc+Pir9A0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GZiszdRhEoXDklowAhrMMrF/LCE5Ul6eKPbb4HvqS4w=;
 b=eTmRQz8ChHDoEPEG8V2yxIuMdESRmYgclognx+A1Qy7Bwd8fJQp7mp56Dgfh7tjToY
 WZaSWM0rzjiMgUGl0n0Uf+9FCzQyFBAyy7CPkF5bYHfKkag/n1P6pGgLmzalHj7y3yMu
 pZsHGN5eNfZwTq4xvo6G01zpX613xaKc0Olb5ESkm4d3RcCQuaxwYds+keDJR6hKg2Uh
 CsGkSTicQZ0CFqFZ02FHm9edYmjGm4QQKlpgpjxANbm9rTOL1oxwrCOphjc7m5wwtFmd
 5htrrNA2IZUdpy8o1P6R6/+4IBCj3bmswtWAOkQnZbfHGPp+8pAAXZpbB9s0rE9akJEu
 j/UA==
X-Gm-Message-State: APjAAAX+gMUO1YQOryiCcxnOSQm71q85Phjuh2XeXDOBAFwpZkz0mjP9
 d70Sn9BaZ+c/a58PepWcVuvhxA==
X-Google-Smtp-Source: APXvYqw6aPnw9wiX99xKRjaXoLALCuAIA38bb2qb5PqIt39eb/sDjSo3NuwC4AtV73voA3Z/K7bpVw==
X-Received: by 2002:a17:902:bf49:: with SMTP id u9mr64670pls.199.1580939881455; 
 Wed, 05 Feb 2020 13:58:01 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id d2sm717301pjv.18.2020.02.05.13.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 13:58:00 -0800 (PST)
Date: Wed, 5 Feb 2020 16:57:59 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20200205215759.GK142103@google.com>
References: <20200205094156.717b36c9@oasis.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205094156.717b36c9@oasis.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: LKML <linux-kernel@vger.kernel.org>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] ftrace: Protect
	ftrace_graph_hash with ftrace_sync
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

On Wed, Feb 05, 2020 at 09:41:56AM -0500, Steven Rostedt wrote:
> 
> From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> 
> As function_graph tracer can run when RCU is not "watching", it can not be
> protected by synchronize_rcu() it requires running a task on each CPU before
> it can be freed. Calling schedule_on_each_cpu(ftrace_sync) needs to be used.
> 
> Link: https://lore.kernel.org/r/20200205131110.GT2935@paulmck-ThinkPad-P72
> 
> Cc: stable@vger.kernel.org
> Fixes: b9b0c831bed26 ("ftrace: Convert graph filter to use hash tables")
> Reported-by: "Paul E. McKenney" <paulmck@kernel.org>
> Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel

> ---
>  kernel/trace/ftrace.c | 11 +++++++++--
>  kernel/trace/trace.h  |  2 ++
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 481ede3eac13..3f7ee102868a 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -5867,8 +5867,15 @@ ftrace_graph_release(struct inode *inode, struct file *file)
>  
>  		mutex_unlock(&graph_lock);
>  
> -		/* Wait till all users are no longer using the old hash */
> -		synchronize_rcu();
> +		/*
> +		 * We need to do a hard force of sched synchronization.
> +		 * This is because we use preempt_disable() to do RCU, but
> +		 * the function tracers can be called where RCU is not watching
> +		 * (like before user_exit()). We can not rely on the RCU
> +		 * infrastructure to do the synchronization, thus we must do it
> +		 * ourselves.
> +		 */
> +		schedule_on_each_cpu(ftrace_sync);
>  
>  		free_ftrace_hash(old_hash);
>  	}
> diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
> index 8c52f5de9384..3c75d29bd861 100644
> --- a/kernel/trace/trace.h
> +++ b/kernel/trace/trace.h
> @@ -979,6 +979,7 @@ static inline int ftrace_graph_addr(struct ftrace_graph_ent *trace)
>  	 * Have to open code "rcu_dereference_sched()" because the
>  	 * function graph tracer can be called when RCU is not
>  	 * "watching".
> +	 * Protected with schedule_on_each_cpu(ftrace_sync)
>  	 */
>  	hash = rcu_dereference_protected(ftrace_graph_hash, !preemptible());
>  
> @@ -1031,6 +1032,7 @@ static inline int ftrace_graph_notrace_addr(unsigned long addr)
>  	 * Have to open code "rcu_dereference_sched()" because the
>  	 * function graph tracer can be called when RCU is not
>  	 * "watching".
> +	 * Protected with schedule_on_each_cpu(ftrace_sync)
>  	 */
>  	notrace_hash = rcu_dereference_protected(ftrace_graph_notrace_hash,
>  						 !preemptible());
> -- 
> 2.20.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
