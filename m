Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878C1C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 22:19:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A1E820716
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 22:19:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="ZVXY/r+S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A1E820716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3C66184546;
	Wed, 29 Jan 2020 22:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRZr2jhmsBxp; Wed, 29 Jan 2020 22:19:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 59886843E8;
	Wed, 29 Jan 2020 22:19:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5369DC0178;
	Wed, 29 Jan 2020 22:19:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACAF2C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 22:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A5AD08835E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 22:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvWBbM3STtJw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 22:19:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 750F98835D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 22:19:40 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x185so381776pfc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 14:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O3TiciWiwwK058w7XwXNGwARhLlgPQ6fF5uUmz3hDNg=;
 b=ZVXY/r+ShX4Zivq4Z3I92ZVcd9Q7yKQCKt5uLMSe1JV6beO0vhHafVP6G8W7GVtlj7
 U3yclnWmQQtKtgAPvzOkPgwlFTllAuYDCWVVSps74/ea10Rwiiihy3lQGy+MloFQptD7
 4xlu5FXqZ+G3ITsL8ifb2SZWTgFScovf/OT2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O3TiciWiwwK058w7XwXNGwARhLlgPQ6fF5uUmz3hDNg=;
 b=DVR+gof+w8GOfdHXQ3aOi/ze+V7Y1jgKs65PHnqAl3Cv6mnRZDfq0KOKWVBX0m8OG0
 V1JVg8Em8wFPIlP3EwlyUwzsdt2KndgSStzxCQMW1LZee7K0fvEN06V6SIxhTCdEqNnQ
 GI7eWTH8L6z+34v+zFT6EZDEGhbPC5RdvT7XTRdBXUu90bCLDMjxroJTt4ySsUGhPHux
 zs/E8m62u3L7pOlQisRZzN2WYtHqBQzZ3P0/8k+K24UPGGA8vIfPvLNpvvuqKFL6e9+j
 kUU7qpsCWPizQ/eCeM4k+++a6W+P8k+P4smz29eI2EC9vgG9SlnWTz1ekeuVBgX7XWaE
 Z2AQ==
X-Gm-Message-State: APjAAAVr65SY1WcZvEZgE7cnh+ilzjCCXyjIxc/FAoSptk32kSFqECXx
 25Ggrmtg9tv6CggmI4qIPo251Q==
X-Google-Smtp-Source: APXvYqwMu5y/wTdfADHxCBrK+vWTaIAyop18k8T0NxA/phdbf6TsWaAzC3FXZ2QAR/E8I9/J547EFA==
X-Received: by 2002:a65:4c82:: with SMTP id m2mr1278832pgt.432.1580336380030; 
 Wed, 29 Jan 2020 14:19:40 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id h11sm3660407pgv.38.2020.01.29.14.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 14:19:39 -0800 (PST)
Date: Wed, 29 Jan 2020 17:19:38 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200129221938.GA71381@google.com>
References: <20200129160813.14263-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129160813.14263-1-frextrite@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Jiri Olsa <jolsa@redhat.com>
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] events: callchain: Annotate
	RCU pointer with __rcu
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

On Wed, Jan 29, 2020 at 09:38:12PM +0530, Amol Grover wrote:
> Fixes following instances of sparse error
> error: incompatible types in comparison expression
> (different address spaces)
> kernel/events/callchain.c:66:9: error: incompatible types in comparison
> kernel/events/callchain.c:96:9: error: incompatible types in comparison
> kernel/events/callchain.c:161:19: error: incompatible types in comparison
> 
> This introduces the following warning
> kernel/events/callchain.c:65:17: warning: incorrect type in assignment

Would have been nice if you mentioned the warning is fixed in your second
patch. But I think its ok.

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel

> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  kernel/events/callchain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
> index c2b41a263166..f91e1f41d25d 100644
> --- a/kernel/events/callchain.c
> +++ b/kernel/events/callchain.c
> @@ -32,7 +32,7 @@ static inline size_t perf_callchain_entry__sizeof(void)
>  static DEFINE_PER_CPU(int, callchain_recursion[PERF_NR_CONTEXTS]);
>  static atomic_t nr_callchain_events;
>  static DEFINE_MUTEX(callchain_mutex);
> -static struct callchain_cpus_entries *callchain_cpus_entries;
> +static struct callchain_cpus_entries __rcu *callchain_cpus_entries;
>  
>  
>  __weak void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
> -- 
> 2.24.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
