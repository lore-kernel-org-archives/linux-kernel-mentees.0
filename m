Return-Path: <SRS0=3RFK=ZW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C9DC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Nov 2019 02:16:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F284620869
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Nov 2019 02:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="p0VMc7Gv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F284620869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C89F220467;
	Sat, 30 Nov 2019 02:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04ky3fbNGy0G; Sat, 30 Nov 2019 02:15:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E9A5B20452;
	Sat, 30 Nov 2019 02:15:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D00E4C1DD5;
	Sat, 30 Nov 2019 02:15:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB6E2C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 02:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E1A4588462
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 02:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95OEeZAiOhxu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 02:15:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C787E8845D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 02:15:55 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 193so15470635pfc.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Nov 2019 18:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QudVKO8PpHDY0QPRDjrLS+45fBA9fe2WvpbxZI2jQhM=;
 b=p0VMc7GvAyQocYJ21HkYujY5ESSrqjlbOvCYQJANZQ82Vq/rwhHtcaq7g3t4V7tmqK
 ltDD0ctybM+2zQKe7/dFqP9e6RASHLFtLM7gpg6IAWJ/50jZyvd0H/gGSzNDfN7dpskp
 zFlfTf9BfAOjK+sXLw16ZTlBuoqATSAkV8gV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QudVKO8PpHDY0QPRDjrLS+45fBA9fe2WvpbxZI2jQhM=;
 b=SL6AVB1iy40sM/cd3DCdPSnxUw9vS0NEWyf5rJxXzPO+FcbJ6W5AyXF6uYXiMhTlIK
 pisfg9+3RX43xmGK3RCA383FnIJtp1q0sAgxKpSKxldXfhqOm49+73CdAkw0aDYPvFqf
 +rIYWgYz0mswliXxniPUxNThCD9dcDBSNRQedFCFPiKU+42K8B9+/zknSMCY12tylvvX
 tk7LbKBVCmEiF39vF9ha+OZ9mQUr2Y25t5jStqYobkFHnFCiM6+YUnVVTOlvhigzWXFC
 KOFrpsYYf1CzKEiEgoRNumFLjSqWu5huWVk+vsAEiGyyeNCPf6CPwELgcgyr2kYUOuZi
 zXcA==
X-Gm-Message-State: APjAAAUuCrP19Hu8xkBTDpV/KjmEf5nYYahDDrTqe2QTlBY6MmizGi2B
 GWV/ucplDk9fML0LN0kbMVxCEg==
X-Google-Smtp-Source: APXvYqxvrL7gQ4UHvGl0OH80nFnpTXbY9LyocxTQJ8pHkSe9LnSm6z/+3DuUedz0z8nb/MsLQYnEYQ==
X-Received: by 2002:aa7:87c5:: with SMTP id i5mr59616561pfo.60.1575079664078; 
 Fri, 29 Nov 2019 18:07:44 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id s22sm15478745pjr.5.2019.11.29.18.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 18:07:43 -0800 (PST)
Date: Fri, 29 Nov 2019 21:07:42 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20191130020742.GF157739@google.com>
References: <20191128153203.GA23803@workstation-kernel-dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128153203.GA23803@workstation-kernel-dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Paul Moore <paul@paul-moore.com>, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, linux-audit@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] kernel: audit.c: Add __rcu
	notation to RCU pointer
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

On Thu, Nov 28, 2019 at 09:02:03PM +0530, Amol Grover wrote:
> add __rcu notation to RCU protected global pointer auditd_conn

Again, please use proper punctuation and captilization. This is unacceptable.
Please put more effort into changelog.

Otherwise the patch diff itself looks good to me, with the above nit
corrected, you could add my tag to the next revision:

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel

> 
> Fixes multiple instances of sparse error:
> error: incompatible types in comparison expression
> (different address spaces)
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
> v2:
> - fix erroneous RCU pointer initialization
> 
>  kernel/audit.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index da8dc0db5bd3..ff7cfc61f53d 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -102,12 +102,13 @@ struct audit_net {
>   * This struct is RCU protected; you must either hold the RCU lock for reading
>   * or the associated spinlock for writing.
>   */
> -static struct auditd_connection {
> +struct auditd_connection {
>  	struct pid *pid;
>  	u32 portid;
>  	struct net *net;
>  	struct rcu_head rcu;
> -} *auditd_conn = NULL;
> +};
> +static struct auditd_connection __rcu *auditd_conn;
>  static DEFINE_SPINLOCK(auditd_conn_lock);
>  
>  /* If audit_rate_limit is non-zero, limit the rate of sending audit records
> -- 
> 2.24.0
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
