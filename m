Return-Path: <SRS0=XrqI=4Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E91BC3F2D3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Feb 2020 17:44:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FA4246A3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Feb 2020 17:44:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V29Two3r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53FA4246A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0B81F8826E;
	Fri, 28 Feb 2020 17:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HICZBcMf-xX2; Fri, 28 Feb 2020 17:44:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68C9088258;
	Fri, 28 Feb 2020 17:44:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62FB9C1D84;
	Fri, 28 Feb 2020 17:44:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E72F9C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 17:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DF55F869D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 17:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nf0xdbCEEU70
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 17:44:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DD9E3869D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 17:44:47 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id j80so1625184oih.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 09:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6odYFUxjVW/kDM7K5IcOeiMB98fdGcFmNhxPrV1QxrU=;
 b=V29Two3r82q98dZeBM8vjtTnh4rtjYfE/b+k+qyZkB2v9hKgV+JjnFRFuUjmUzdBQA
 0GcFHi7BeduXmq1vX3nVHW72D4KlZ7eaRFmE6zzFfGvFNmEAghDjNz9eEkg/vs0mg50B
 GMucagJBbOl9NLxr5lbj0PIAj/NgKdwAoY4UcZkttVVChdRSQb5zFiCcj9VjzSXCBD6v
 Pd3HyaWLybtEcbvcN15qMIODpYm8NW8dBgee848eX+7C51WlVZmf9Ezobx/TFCoRTMdq
 NmJ3deWyqIJ7NBXKf7d2h+iGJfsfVD9D3Uw1f7DWNE5V6VzNfSylICGL5cwKKhnUgflG
 AXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=6odYFUxjVW/kDM7K5IcOeiMB98fdGcFmNhxPrV1QxrU=;
 b=oH7oTIXz3/QPlWopCcOirtGo62NKeoNp0GV8h0TCAVBIVTUsOfaVK4d07sm7B0Fphq
 v5rPXUB1GdB6fRYilo4NT7iceLaMkDbbZTiYQzOQeyXk6QFf22Y/28b1dgdrkwHNR2tB
 zNSLqMm9r54E+l5wENU26pJtr3IpTjSuTSF1aB1AXtaoXXiw0ku/prG6JssGH2CXqR37
 SHYIuNJ2lOFZudKDolHpn08Rl9Bqt8adgpkgw4yyAP2HtxFpREvbBg2G9f+tGw8u0rjJ
 wHIqmWLbVKkQYkMuCG8Ac34Xt0ewVcHmBD+oEA9R1tbfQF09nfax4ES+0tzb73NvFp6k
 hWLA==
X-Gm-Message-State: APjAAAWqJ3qreCC9DLQigg3YFqCbir0JLKk/AKEY66QLPW492769Pqci
 P27wsbMNDH2IbNkM1dgOHw==
X-Google-Smtp-Source: APXvYqwiBFJA4p21dMu8dX7+zOpbTosOuJ9GQtz8NCddtM7ZChaF3RUnufWiwb89RdwCubODYR6/bA==
X-Received: by 2002:aca:33d5:: with SMTP id z204mr3781165oiz.120.1582911886930; 
 Fri, 28 Feb 2020 09:44:46 -0800 (PST)
Received: from serve.minyard.net ([47.184.141.150])
 by smtp.gmail.com with ESMTPSA id g5sm3328290otp.10.2020.02.28.09.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 09:44:46 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:44b4:3c45:39b0:ab94])
 by serve.minyard.net (Postfix) with ESMTPSA id D09A818000D;
 Fri, 28 Feb 2020 17:44:45 +0000 (UTC)
Date: Fri, 28 Feb 2020 11:44:44 -0600
From: Corey Minyard <minyard@acm.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200228174444.GE3840@minyard.net>
References: <20200228081731.18149-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228081731.18149-1-frextrite@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "Paul E . Mckenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 John Garry <john.garry@huawei.com>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 openipmi-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] ipmi: Fix RCU list lockdep
	debugging warnings
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
Reply-To: minyard@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Feb 28, 2020 at 01:47:33PM +0530, Amol Grover wrote:
> It is completely safe to traverse ipmi_interfaces and
> intf->users under SRCU read lock using list_for_each_entry_rcu().
> Tell lockdep about it as well else it will show false-positive
> warnings as the one below.

Thanks, this is queued for 5.7, and I hadded John Garry's test by.

-corey

> 
> Fixes the following false-positive warning and others that may follow.
> 
> [   29.772408] =============================
> [   29.776863] WARNING: suspicious RCU usage
> [   29.780915] 5.6.0-rc3-00001-g907305ae6618-dirty #1755 Not tainted
> [   29.787046] -----------------------------
> [   29.791100] drivers/char/ipmi/ipmi_msghandler.c:744 RCU-list traversed in
> non-reader section!!
> 
> Reported-by: John Garry <john.garry@huawei.com>
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index cad9563f8f48..d202022c69de 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -741,7 +741,8 @@ int ipmi_smi_watcher_register(struct ipmi_smi_watcher *watcher)
>  	list_add(&watcher->link, &smi_watchers);
>  
>  	index = srcu_read_lock(&ipmi_interfaces_srcu);
> -	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
> +	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
> +				srcu_read_lock_held(&ipmi_interfaces_srcu)) {
>  		int intf_num = READ_ONCE(intf->intf_num);
>  
>  		if (intf_num == -1)
> @@ -1188,7 +1189,8 @@ int ipmi_create_user(unsigned int          if_num,
>  		return -ENOMEM;
>  
>  	index = srcu_read_lock(&ipmi_interfaces_srcu);
> -	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
> +	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
> +				srcu_read_lock_held(&ipmi_interfaces_srcu)) {
>  		if (intf->intf_num == if_num)
>  			goto found;
>  	}
> @@ -1241,7 +1243,8 @@ int ipmi_get_smi_info(int if_num, struct ipmi_smi_info *data)
>  	struct ipmi_smi *intf;
>  
>  	index = srcu_read_lock(&ipmi_interfaces_srcu);
> -	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
> +	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
> +				srcu_read_lock_held(&ipmi_interfaces_srcu)) {
>  		if (intf->intf_num == if_num)
>  			goto found;
>  	}
> @@ -4098,7 +4101,8 @@ static int handle_read_event_rsp(struct ipmi_smi *intf,
>  	 * getting events.
>  	 */
>  	index = srcu_read_lock(&intf->users_srcu);
> -	list_for_each_entry_rcu(user, &intf->users, link) {
> +	list_for_each_entry_rcu(user, &intf->users, link,
> +				srcu_read_lock_held(&intf->users_srcu)) {
>  		if (!user->gets_events)
>  			continue;
>  
> @@ -4453,7 +4457,8 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
>  		int index;
>  
>  		index = srcu_read_lock(&intf->users_srcu);
> -		list_for_each_entry_rcu(user, &intf->users, link) {
> +		list_for_each_entry_rcu(user, &intf->users, link,
> +					srcu_read_lock_held(&intf->users_srcu)) {
>  			if (user->handler->ipmi_watchdog_pretimeout)
>  				user->handler->ipmi_watchdog_pretimeout(
>  					user->handler_data);
> @@ -4746,7 +4751,8 @@ static void ipmi_timeout(struct timer_list *unused)
>  		return;
>  
>  	index = srcu_read_lock(&ipmi_interfaces_srcu);
> -	list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
> +	list_for_each_entry_rcu(intf, &ipmi_interfaces, link,
> +				srcu_read_lock_held(&ipmi_interfaces_srcu)) {
>  		if (atomic_read(&intf->event_waiters)) {
>  			intf->ticks_to_req_ev--;
>  			if (intf->ticks_to_req_ev == 0) {
> -- 
> 2.25.0
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
