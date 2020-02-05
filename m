Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525D4C35247
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 22:06:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 182D9217BA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 22:06:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="fW9VMren"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 182D9217BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DF6C287A4F;
	Wed,  5 Feb 2020 22:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zH0F6JJUpaXr; Wed,  5 Feb 2020 22:06:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6ADD587A80;
	Wed,  5 Feb 2020 22:06:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58807C1D81;
	Wed,  5 Feb 2020 22:06:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68CE3C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 22:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 574398487A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 22:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MtIwVdDJTEyq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 22:06:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C89FF84867
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 22:06:01 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id c23so1440779plz.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Feb 2020 14:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0mz8ghzRtlNXRAOessj5ksQCBU4mJW2G9mtxFkaYRDQ=;
 b=fW9VMrenQz9iTmdfdoDMzHKyP8mMhtw2mck9e3ViEKVPBnj6IerWyXo1moiBRnAAij
 bYQkpq6s+48whH++3i/ihUrN6f8hlH54AuBmvHzVdZYO2Yb0LSt8n8yflOTaRVOXY627
 nME6stNH4hW4UJZTcKRuCz/7m7b3BZQtkARrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0mz8ghzRtlNXRAOessj5ksQCBU4mJW2G9mtxFkaYRDQ=;
 b=dkXMqpT3mLrz9mwRYtteLWj/59L/4S3DSOI2MilPl/nvrlTKU9D8hEjv2xTt9rHMlV
 cnI+hFtjC4P4B+sPXfrksOXdXsLkdrdYrpfjuvqB201HPbZKnJr/8q+9s/UYFzZJEvYv
 5h1YuuLVFl3oa5mK4wTilqzBw+SMdHphbBoEWpVV9puJZtw2KDVoYxUgDYgIOrXpVT8g
 TMuXZaT8DPMpW0jgjAcJrp7Bf7JcI7t2hS/Ms+8qhPAA2dvceJC+goik2xmSUrr9hAhV
 9sZTuIVn/AAEohRgHuy7WbOHwfH82FOLcFzqxXaCf/h1LjflkexFlMqS2sSP0bId2MHn
 Zr7g==
X-Gm-Message-State: APjAAAVF3r1nsxGLPx9f8+ndCpkHfW8N+HFd6q4crB3Srko4K2cCp/AK
 R1/J5rpsOrMBiQfAT3noS22mTw==
X-Google-Smtp-Source: APXvYqwPxwRuDtRVckccB99BVAAZnpynaXqtYDYcBqdZyf9yCOvN/yE8DvmTukAFZ2dnb8mjozDU4A==
X-Received: by 2002:a17:902:7c05:: with SMTP id
 x5mr143755pll.236.1580940361372; 
 Wed, 05 Feb 2020 14:06:01 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id 23sm494645pfh.28.2020.02.05.14.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 14:06:01 -0800 (PST)
Date: Wed, 5 Feb 2020 17:06:00 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200205220600.GM142103@google.com>
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

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

BTW I think set_ftrace_early_graph() should use rcu_assign_pointer() so that
the early writes to the hash are release-barrier'ed before the global pointer
is updated. I will send a patch for that.

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
