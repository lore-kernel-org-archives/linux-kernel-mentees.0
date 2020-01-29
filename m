Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77887C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 22:19:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C93F20702
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 22:19:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="L0wTNSd/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C93F20702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 05247814CA;
	Wed, 29 Jan 2020 22:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JnqXy6+TaKCl; Wed, 29 Jan 2020 22:19:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4DF078147E;
	Wed, 29 Jan 2020 22:19:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32A41C0178;
	Wed, 29 Jan 2020 22:19:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9956BC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 22:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 81D20862A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 22:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fj0EBUpeuvI3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 22:19:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 49D28862A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 22:19:11 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id e9so431297pjr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 14:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gm6baxWqlVJBYjrTuitTNaBr1MkKZDLEKcjPTz92Yuw=;
 b=L0wTNSd/ba+/Jir8Y8zAOCd7bzmaRvQDYfPfI8/l5zQ/mCR76l00gBEDLWTaLHWYed
 oJM+kdxg6sizMD60HCiFYaoJapHuqErPhDUoNTBNc3XtG4v/jLGEqonFFwajIcmS5S8H
 rn1JDRJEIgVmwOZqhTfq8qfszi6iq44EBMiW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gm6baxWqlVJBYjrTuitTNaBr1MkKZDLEKcjPTz92Yuw=;
 b=MBnT9vNKV2MR5shdHh+hP0Dsrj6CdnSmqj4dIMxHJNFZDH7kPNvpyaWmwR3OhFxMCY
 RGFcqzirD89NuMrpoL2hhkXoHnXqybe6NaCTIJYDavZpOZTM6Vn9cpUaVm4PCnPN2iK4
 tGTBjHxZKoHClLAKO1WzWlCO+jLwdBAfS9nyyTgCbYeh/V3kNXR5q/WqGQ5y6jholXcD
 TYnpIega5JEqaFr4sJzRa7DtTma59Aq0gR9aj7X6afa1YWbytN5syIixA/Fji7BOpDYM
 NHs9Mg5+Ryre+5ulPdQ3b5liUW3u3uTd7eCFG623QbY+HZaLIYtYlH4U0VOvPEN7cmMh
 IRcQ==
X-Gm-Message-State: APjAAAXvRTBr7ROedd8pYpyQU05YV9zx3mVoU+tillZyd69zXvSFwHzu
 WgNDhrJJWVFdCCcpLpFsr5UvHQ==
X-Google-Smtp-Source: APXvYqyVTFJ4QGYL+Go0ew04cMV55S2wewIfTCwD5Ah3U4M1HkXDKHhZSGpRe9nEJkt5UHJBefNCPA==
X-Received: by 2002:a17:90a:3243:: with SMTP id
 k61mr2157855pjb.43.1580336350700; 
 Wed, 29 Jan 2020 14:19:10 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id gx2sm3676730pjb.18.2020.01.29.14.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 14:19:10 -0800 (PST)
Date: Wed, 29 Jan 2020 17:19:09 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200129221909.GA74354@google.com>
References: <20200129160813.14263-1-frextrite@gmail.com>
 <20200129160813.14263-2-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129160813.14263-2-frextrite@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Jiri Olsa <jolsa@redhat.com>
Subject: Re: [Linux-kernel-mentees] [PATCH 2/2] events: callchain: Use RCU
	API to access RCU pointer
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

On Wed, Jan 29, 2020 at 09:38:13PM +0530, Amol Grover wrote:
> callchain_cpus_entries is annotated as an RCU pointer.
> Hence rcu_dereference_protected or similar RCU API is
> required to dereference the pointer.
> 
> This fixes the following sparse warning
> kernel/events/callchain.c:65:17: warning: incorrect type in assignment
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  kernel/events/callchain.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
> index f91e1f41d25d..a672d02a1b3a 100644
> --- a/kernel/events/callchain.c
> +++ b/kernel/events/callchain.c
> @@ -62,7 +62,8 @@ static void release_callchain_buffers(void)
>  {
>  	struct callchain_cpus_entries *entries;
>  
> -	entries = callchain_cpus_entries;
> +	entries = rcu_dereference_protected(callchain_cpus_entries,
> +					    lockdep_is_held(&callchain_mutex));


Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel


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
