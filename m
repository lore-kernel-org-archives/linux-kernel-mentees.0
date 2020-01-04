Return-Path: <SRS0=knry=2Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1195BC32771
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  4 Jan 2020 21:21:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF8E21734
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  4 Jan 2020 21:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="am5n50n1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF8E21734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B6C086165;
	Sat,  4 Jan 2020 21:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SB6mo-OZiwUs; Sat,  4 Jan 2020 21:21:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E4643855D2;
	Sat,  4 Jan 2020 21:21:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDCF7C1797;
	Sat,  4 Jan 2020 21:21:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A69FEC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Jan 2020 21:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 88A1B8587C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Jan 2020 21:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbOXuIN+hgdO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Jan 2020 21:21:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 45509855D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Jan 2020 21:21:33 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k197so24995383pga.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 04 Jan 2020 13:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=plpKbdiW72DXJOvU1TVKdnl0zL4VM/YG87vawclIn4g=;
 b=am5n50n1oazIAUJ+wPBXku6ho9iqM+p9CB9klzmmA3vS9X9Fy65BjVdjbZadmAjSTF
 j7rspwpImjnIRTaPRl89iMez9Wwy0CEciZyQ+72J/Js5lZPUyCO6b6TQxTYvA33B/LUJ
 qW0Kx8ekLp+UQ+TwZjCvlGUFOndUeA4M/hX88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=plpKbdiW72DXJOvU1TVKdnl0zL4VM/YG87vawclIn4g=;
 b=UhRvzhB8TbG/0LnHx0kjc1Sglp/oW/7wOdCAy++r47RHKUNeSntv83tx1m26cqN1fU
 6rPnv2XvK7aBPv7cuTH+6yVrCrqCpH23YXUqavy5n6L4q3y1qEifaWmPZZhYAy1xMMsY
 iOQBtNH3RfgLqWPiAbky45wm4W7j5iDjNIJkt+JD4PGmoZLt/V9rvJbgkmNjhEOKaAyB
 dtv947tQZ83kJL+nV765BH1sOkt7PruAZppTv2UL8W7Qc3BgYNlRuyxxvFp3mxC9yZA4
 DwCOlQWpCeL9BStPfMX84NBYpyVtXaHByD1XRPcbqGkLqnoVruZrhSUqmW3I3o/0z2Cs
 iqzg==
X-Gm-Message-State: APjAAAUOKeNVEnmqXDermhUBVZqGcHvlmZQzyl0gQB8tdLqSaaRx1mL2
 jjFrP1zjBPBbyreW5/Z+Rd2nQQ==
X-Google-Smtp-Source: APXvYqznm49seUa5hKAczurh81jT6PyWLH3/0O90WcjrfI7g+tRM/rvYJDn6zIYHARt2LE/nuhElqA==
X-Received: by 2002:aa7:96b7:: with SMTP id g23mr98998711pfk.108.1578172892874; 
 Sat, 04 Jan 2020 13:21:32 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id s18sm67570463pfh.179.2020.01.04.13.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2020 13:21:32 -0800 (PST)
Date: Sat, 4 Jan 2020 16:21:31 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200104212131.GN189259@google.com>
References: <20200104144215.27590-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200104144215.27590-1-madhuparnabhowmik04@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 stefanr@s5r6.in-berlin.de, linux1394-devel@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] drivers: firewire:
 core-transaction: Pass lockdep condition to address_handler_list iterator
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

On Sat, Jan 04, 2020 at 08:12:15PM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> The address_handler_list is traversed with list_for_each_entry_rcu
> with address_handler_list_lock held.
> list_for_each_entry_rcu has built-in RCU and lock checking.
> Use it for address_handler_list traversal.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel

> ---
>  drivers/firewire/core-transaction.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
> index 404a035f104d..a15e70027932 100644
> --- a/drivers/firewire/core-transaction.c
> +++ b/drivers/firewire/core-transaction.c
> @@ -61,6 +61,11 @@
>  #define PHY_CONFIG_ROOT_ID(node_id)	((((node_id) & 0x3f) << 24) | (1 << 23))
>  #define PHY_IDENTIFIER(id)		((id) << 30)
>  
> +static DEFINE_SPINLOCK(address_handler_list_lock);
> +static LIST_HEAD(address_handler_list);
> +
> +#define address_handler_list_lock_held() lock_is_held(&(address_handler_list_lock).dep_map)
> +
>  /* returns 0 if the split timeout handler is already running */
>  static int try_cancel_split_timeout(struct fw_transaction *t)
>  {
> @@ -485,7 +490,7 @@ static struct fw_address_handler *lookup_overlapping_address_handler(
>  {
>  	struct fw_address_handler *handler;
>  
> -	list_for_each_entry_rcu(handler, list, link) {
> +	list_for_each_entry_rcu(handler, list, link, address_handler_list_lock_held()) {
>  		if (handler->offset < offset + length &&
>  		    offset < handler->offset + handler->length)
>  			return handler;
> @@ -514,8 +519,6 @@ static struct fw_address_handler *lookup_enclosing_address_handler(
>  	return NULL;
>  }
>  
> -static DEFINE_SPINLOCK(address_handler_list_lock);
> -static LIST_HEAD(address_handler_list);
>  
>  const struct fw_address_region fw_high_memory_region =
>  	{ .start = FW_MAX_PHYSICAL_RANGE, .end = 0xffffe0000000ULL, };
> -- 
> 2.17.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
