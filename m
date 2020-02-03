Return-Path: <SRS0=Cf9c=3X=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B1DC3524D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Feb 2020 16:33:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB22A21775
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Feb 2020 16:33:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="ssVhzTyI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB22A21775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB02A86D63;
	Mon,  3 Feb 2020 16:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ACdoDecdGlj; Mon,  3 Feb 2020 16:33:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2565F85948;
	Mon,  3 Feb 2020 16:33:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A981C1D81;
	Mon,  3 Feb 2020 16:33:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25C4FC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Feb 2020 16:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0F4BC858F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Feb 2020 16:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQ6jT6SgU0SV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Feb 2020 16:33:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 59BF7858D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Feb 2020 16:33:03 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i6so7863013pfc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 03 Feb 2020 08:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kygvN3JdMT5rx78cW75jLEUMNI3vcBU3dBQx9CHHh28=;
 b=ssVhzTyIIEma75A48rf94bLZxvLV2Ygj35UJQ0/ElMy5zReCrcJWlvCCuAVwB8VEEM
 llqIZ5iH0KbSY++6FbAuS7zmU1K48lVteIrWwROBafWrJk86DC6f6DsiYbQ+WcCZwq8u
 HnYB7uYVt+WC3ZQNE/fe5Uzj89sjepMDJavCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kygvN3JdMT5rx78cW75jLEUMNI3vcBU3dBQx9CHHh28=;
 b=lqkd/BKjU8VTaPEY1vwoZwCli9Ql/j07xJGAVG/XDb/t8zHT3CgUtwSJa3eG7tNS0w
 4VahkUaATSkTZLUGUqx3A3EwJkyMXyvMhZflHt/FJbMuf4x6YyiySJ3rAoz3GM3R7w0A
 NU+yI+KnSWdTOyExGPw0jhBP275KCOATBv501NsMhj3h4/g61eaDifwh3EWM3wrHDLK3
 wYXunL7jv6n2aWTbHq2aVrcPI1r4qLOd20atzEmN5ARQuh9nljRHyawLRqQ2sZvZwt5o
 XPIiZuRXUKJdg5Ee5UIXV5NViZYFVhhe8i8s6/cRJgjFvxoKdHA4UUArz7IH5VKxEcCs
 5nLA==
X-Gm-Message-State: APjAAAXHHOxy+3V80RJRQVbTPWlWLdGyEiImk+MwSDoGVfX7BIhpKzc1
 BqMMSvX4OpbmL5nMpoCOaxcW5g==
X-Google-Smtp-Source: APXvYqwiD0ofx+MWpoFTDHUC7QLzEfQhhRkJS46LskXJIT7/Zw6mHw+5kbzS177wESnxUfXWKuKlmg==
X-Received: by 2002:aa7:8e85:: with SMTP id a5mr25792754pfr.24.1580747582875; 
 Mon, 03 Feb 2020 08:33:02 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id 11sm22034985pfz.25.2020.02.03.08.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 08:33:02 -0800 (PST)
Date: Mon, 3 Feb 2020 11:33:01 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200203163301.GB85781@google.com>
References: <20200201072703.17330-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200201072703.17330-1-frextrite@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Feb 01, 2020 at 12:57:04PM +0530, Amol Grover wrote:
> Fix following instances of sparse error
> kernel/trace/ftrace.c:5664:29: error: incompatible types in comparison
> kernel/trace/ftrace.c:5785:21: error: incompatible types in comparison
> kernel/trace/ftrace.c:5864:36: error: incompatible types in comparison
> kernel/trace/ftrace.c:5866:25: error: incompatible types in comparison
> 
> Use rcu_dereference_protected to access the __rcu annotated pointer.
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  kernel/trace/ftrace.c | 2 +-
>  kernel/trace/trace.h  | 9 ++++++---
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 9bf1f2cd515e..959ded08dc13 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -5596,7 +5596,7 @@ static const struct file_operations ftrace_notrace_fops = {
>  
>  static DEFINE_MUTEX(graph_lock);
>  
> -struct ftrace_hash *ftrace_graph_hash = EMPTY_HASH;
> +struct ftrace_hash __rcu *ftrace_graph_hash = EMPTY_HASH;
>  struct ftrace_hash *ftrace_graph_notrace_hash = EMPTY_HASH;
>  
>  enum graph_filter_type {
> diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
> index 63bf60f79398..97dad3326020 100644
> --- a/kernel/trace/trace.h
> +++ b/kernel/trace/trace.h
> @@ -950,22 +950,25 @@ extern void __trace_graph_return(struct trace_array *tr,
>  				 unsigned long flags, int pc);
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE
> -extern struct ftrace_hash *ftrace_graph_hash;
> +extern struct ftrace_hash __rcu *ftrace_graph_hash;
>  extern struct ftrace_hash *ftrace_graph_notrace_hash;
>  
>  static inline int ftrace_graph_addr(struct ftrace_graph_ent *trace)
>  {
>  	unsigned long addr = trace->func;
>  	int ret = 0;
> +	struct ftrace_hash *hash;
>  
>  	preempt_disable_notrace();
>  
> -	if (ftrace_hash_empty(ftrace_graph_hash)) {
> +	hash = rcu_dereference_protected(ftrace_graph_hash, !preemptible());

I think you can use rcu_dereference_sched() here? That way no need to pass
!preemptible.

A preempt-disabled section is an RCU "sched flavor" section. Flavors are
consolidated in the backend, but in the front end the dereference API still
do have flavors.

thanks,

 - Joel


> +
> +	if (ftrace_hash_empty(hash)) {
>  		ret = 1;
>  		goto out;
>  	}
>  
> -	if (ftrace_lookup_ip(ftrace_graph_hash, addr)) {
> +	if (ftrace_lookup_ip(hash, addr)) {
>  
>  		/*
>  		 * This needs to be cleared on the return functions
> -- 
> 2.24.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
