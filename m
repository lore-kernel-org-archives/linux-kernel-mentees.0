Return-Path: <SRS0=hVmh=4C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BAAC2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 18:20:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B338720873
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 18:20:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlN8Rr9w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B338720873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88C5486943;
	Fri, 14 Feb 2020 18:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veQ0-sdDmKqL; Fri, 14 Feb 2020 18:20:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2CE6186942;
	Fri, 14 Feb 2020 18:20:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14427C08A4;
	Fri, 14 Feb 2020 18:20:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 930D0C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 18:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7C76986942
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 18:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDc3miMqLJhF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 18:20:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 031DC86933
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 18:20:36 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s1so5252244pfh.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 10:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ErA6jWmmhfb1QGDKOQtEER5Ilc0UgOh2Gqv2PGMN0HE=;
 b=AlN8Rr9wAt7e/JdQ398Ln/0Pgz9LEQu52lKml03hoYL+Kej1LX1Cr4EeA10Qe8zdrP
 RK5SP9i2jYx35aykVGR2g/0onBcpFUJNpFwV4ymCb2LK76xcOP9aPMs6fRWoa5WdtKQd
 0lbSub1/AJjFLlTVC6kAYd/C/yWF/VPZ9UVBw4Dxnn1dVhBoMDo0d09btXNlKci2LOb3
 TONpvgLieMjffTOazxw56KMEaMYiO5AfO5eZKVow4wKVjpBiKetJn4EUQoKoyYoQbL30
 ldK/cUpZwYrhB+k/33T0vmnMq6nS5FeADc4EdcgS/WPWtsgWAw88v+i2+w59r7ob/irL
 7HNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ErA6jWmmhfb1QGDKOQtEER5Ilc0UgOh2Gqv2PGMN0HE=;
 b=jx4XASAx2JHvIxEg2QmBEhKh0pdpb322MGK/RcQX4laIXYP6umNk2yGs4I7KBProAz
 PGsdNsV5dtcDeWQh3lShLaYDuiVbE+pMygXKv7464e7P1z6QzmpfcW5UsqAAWg9FO6W+
 /ZOCOhDpO5SAq4ppSczLm7Y+26AmwmE9Xus/wEzt+esmZIYIzKMg9x5yJKPbSLPzVKon
 X+rwscT7J86Dro/WVyCS3frvhxUjKOw/XPNXOZGyLzaIHx5Cj1pqvVKHeh9VuOIzN3ro
 KR1DfxZPhhNS/e4Dc9Ge3rGOVYEhiqqHXIt0E2509nJm3DNGvozYcqZEp31YQo7jyho5
 SmHQ==
X-Gm-Message-State: APjAAAXOVYQw4xdAb7zMgmI5mPjjxso709ZQA6dWGHlTxnxeP1kY1v6T
 m1JGLgYimq7aw/AIMecrfHY=
X-Google-Smtp-Source: APXvYqxRukUjTxlNcRdQc6EB6yehiYsWGKukYpYn476AdEmv6xHv+atjQeeskaxXJY1Etjlq4A58CQ==
X-Received: by 2002:a63:3712:: with SMTP id e18mr4918078pga.316.1581704436575; 
 Fri, 14 Feb 2020 10:20:36 -0800 (PST)
Received: from workstation-portable ([146.196.37.246])
 by smtp.gmail.com with ESMTPSA id o11sm7196634pjs.6.2020.02.14.10.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 10:20:36 -0800 (PST)
Date: Fri, 14 Feb 2020 23:50:27 +0530
From: Amol Grover <frextrite@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Message-ID: <20200214182027.GB15350@workstation-portable>
References: <20200130141818.18391-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130141818.18391-1-frextrite@gmail.com>
Cc: Joel Fernandes <joel@joelfernandes.org>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 "Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] callchain: Annotate RCU
	pointer with __rcu
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

On Thu, Jan 30, 2020 at 07:48:19PM +0530, Amol Grover wrote:
> Fixes following instances of sparse error
> error: incompatible types in comparison expression
> (different address spaces)
> kernel/events/callchain.c:66:9: error: incompatible types in comparison
> kernel/events/callchain.c:96:9: error: incompatible types in comparison
> kernel/events/callchain.c:161:19: error: incompatible types in comparison
> 
> This introduces the following warning
> kernel/events/callchain.c:65:17: warning: incorrect type in assignment
> which is fixed as below
> 
> callchain_cpus_entries is annotated as an RCU pointer.
> Hence rcu_dereference_protected or similar RCU API is
> required to dereference the pointer.
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>

Hey Peter,

Can you have a look at this patch as well? I have already done the
requested changes.

Thanks
Amol

> ---
> v2:
> - Squash both the commits into a single one.
> 
>  kernel/events/callchain.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
> index c2b41a263166..a672d02a1b3a 100644
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
> @@ -62,7 +62,8 @@ static void release_callchain_buffers(void)
>  {
>  	struct callchain_cpus_entries *entries;
>  
> -	entries = callchain_cpus_entries;
> +	entries = rcu_dereference_protected(callchain_cpus_entries,
> +					    lockdep_is_held(&callchain_mutex));
>  	RCU_INIT_POINTER(callchain_cpus_entries, NULL);
>  	call_rcu(&entries->rcu_head, release_callchain_buffers_rcu);
>  }
> -- 
> 2.24.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
