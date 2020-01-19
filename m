Return-Path: <SRS0=OzsJ=3I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F60C32771
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jan 2020 02:14:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FBB624699
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jan 2020 02:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="MSAL+3bf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FBB624699
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1B00420366;
	Sun, 19 Jan 2020 02:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q+ZN-Cv2kq0i; Sun, 19 Jan 2020 02:14:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5312720034;
	Sun, 19 Jan 2020 02:14:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38FD6C1796;
	Sun, 19 Jan 2020 02:14:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DABE1C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 02:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C411184DDD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 02:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnF6iVz26Lad
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 02:14:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DC9F5848F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 02:14:26 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id ay11so11573736plb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 18:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wKnHTOsGYbWMuEtHLalSufdyt5LKcQfM0ik/ggkorb8=;
 b=MSAL+3bf/Sr2q37mtoS4XEMfewmJNpRseZ6b4abZn9jW7t3K12vCcgectB7jCIDb7/
 j6RbLWT4TqX3yfnuGs+zMOw7LRrOGeL5RmzFVP9zcT49BJEUaASoMtd4wJqKyv97Ir+q
 BXawhfdNbTXCBZp2wkM2yRwSvg0ywrzs26GfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wKnHTOsGYbWMuEtHLalSufdyt5LKcQfM0ik/ggkorb8=;
 b=B7Czw4LyIGIcoj80x0iZd8be1bR2f2kepzO8nemRTXFnKXrA7p3VpxKfnDIhRV7T05
 LLSFilzYCscB7u92NZZn9xrTmXZO6JhcLceFLOFqPf6QapkGaWjptIrInFsuvThLesnH
 DOmWcSZB5APDE9a82HsbnpTl4ao0xjUXdd/Rc3JaZJXt/LflaAqeR31rntK6TNGImFU1
 FqlmIqcSY6kVkoWgJ6coSjSks/2WXjo71uzpyWKj7aXh0dN6zkg8z1UbB1U5v63A9Ovr
 SYvkdLRPVo9dqruOoXoGwU8ConASLaDgxRHt0GKtlzKeaOsZCU+8gyAqyRB9gJNp8eD3
 mGQg==
X-Gm-Message-State: APjAAAXpEAHxkev+nq0L/kioeu4+8govj5sYk2RSFKSxOUX4ZMPLh4z9
 4jzsoeHjpjOEBZzJsoWpvbmdhw==
X-Google-Smtp-Source: APXvYqy1q/djUVAv160MfTz3J71YGDJtMyBxn5miqmwtbqWbxd3BLPJQgl9/gbHhVY35TvtnaXx2tQ==
X-Received: by 2002:a17:902:9a8e:: with SMTP id
 w14mr7598767plp.315.1579400066308; 
 Sat, 18 Jan 2020 18:14:26 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id h7sm35796636pfq.36.2020.01.18.18.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2020 18:14:25 -0800 (PST)
Date: Sat, 18 Jan 2020 21:14:25 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200119021425.GH244899@google.com>
References: <20200118165417.12325-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200118165417.12325-1-frextrite@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] rculist: Add brackets around
 cond argument in __list_check_rcu macro
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

On Sat, Jan 18, 2020 at 10:24:18PM +0530, Amol Grover wrote:
> Passing a complex lockdep condition to __list_check_rcu results
> in false positive lockdep splat due to incorrect expression
> evaluation.
> 
> For example, a lockdep check condition `cond1 || cond2` is
> evaluated as `!cond1 || cond2 && !rcu_read_lock_any_held()`
> which, according to operator precedence, evaluates to
> `!cond1 || (cond2 && !rcu_read_lock_any_held())`.
> This would result in a lockdep splat when cond1 is false
> and cond2 is true which is logically incorrect.
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>

Good catch!

Acked-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel


> ---
>  include/linux/rculist.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/rculist.h b/include/linux/rculist.h
> index 4158b7212936..dce491f0b354 100644
> --- a/include/linux/rculist.h
> +++ b/include/linux/rculist.h
> @@ -50,9 +50,9 @@ static inline void INIT_LIST_HEAD_RCU(struct list_head *list)
>  #define __list_check_rcu(dummy, cond, extra...)				\
>  	({								\
>  	check_arg_count_one(extra);					\
> -	RCU_LOCKDEP_WARN(!cond && !rcu_read_lock_any_held(),		\
> +	RCU_LOCKDEP_WARN(!(cond) && !rcu_read_lock_any_held(),		\
>  			 "RCU-list traversed in non-reader section!");	\
> -	 })
> +	})
>  #else
>  #define __list_check_rcu(dummy, cond, extra...)				\
>  	({ check_arg_count_one(extra); })
> -- 
> 2.24.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
