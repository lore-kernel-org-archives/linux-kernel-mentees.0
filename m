Return-Path: <SRS0=vIBS=4A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D11C2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Feb 2020 13:46:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E40520659
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Feb 2020 13:46:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ruTm3lqW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E40520659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 02B8981AE0;
	Wed, 12 Feb 2020 13:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLJLtSm7K3Mg; Wed, 12 Feb 2020 13:46:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 72EAC816F3;
	Wed, 12 Feb 2020 13:46:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60647C07FE;
	Wed, 12 Feb 2020 13:46:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60072C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 13:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 529F5203D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 13:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z7XvSQu3PM8b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 13:45:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 37D0020373
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 13:45:58 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id p125so2006419oif.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 05:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w+9a/C8GLe23HYD/53W97lcvboWXgDPM5I+bKJDpdyw=;
 b=ruTm3lqW2VysvFQ29tg9NgK2kyDCsR7ohgp4u2we/nGM4La/iKBWJCgqKJ0tm2+MR1
 SzeEcJfO+CDWCBGlPrzJ0EXZ3biWOqDsxAIvTMTQAFmOmpwIS+kkyxKt4MFNSDHhFiYl
 TqKjqBUeQoCBxTLwZY0skkn3vLbIkWK3g1ulxuS7yz1ILB3SjvDHVeVsVQvjqUJOMjSD
 yTUdhqenNBftYtyxMsE7saHnHGOnHQcqg75E7+BxR110ybOK5dBdAFkmRRLeG+sKx72V
 tbSAZYcGXhzmE15dI9iOiUa6NTUU3TDt7J9LPmN7w5EMvPWGcY0t5hvq+0PsLgCGWf5y
 c8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=w+9a/C8GLe23HYD/53W97lcvboWXgDPM5I+bKJDpdyw=;
 b=Y2OO7s6n79n6UHiK8giEEISl2sQz3YOT7bwotvv5qe/F6hA8BN/hB7WqTm6Jih7VE/
 VajO9rzNVGW0xwhYTkejlMBoStIb5IA9XSG0VDIYVxFUOQVvQVE2qfkJLLkB/YX2OcMb
 kIzQjL10uDwQAEiaPho4/RgsKBZ//AdKkW4mzm1ZCSfPQS95Sr8NDcHthhpaMb3HWAkk
 /A1BR5qCPJOjbun49oPpMPCuZg79G1eiJhJF94dbCihiGIY70nTwSmXb42Z66hf8dHR4
 4Wi+qmMaHcccASMe9v4MU7zfNNe1kDHN/snmC0zwAtFRD+3K72ZKVwdUysSOlj+bH4+X
 NCwg==
X-Gm-Message-State: APjAAAUrxSHRZfij+Uj/6uIPR7942dWMPfrpk324WuaQwvc4dBjJr+Vz
 c4mCAykYN9bO90/NbJNM+Q==
X-Google-Smtp-Source: APXvYqwkgvblGx+JRC3ff68p+PCc3tv+uA3GDD2bV0WIyuf0Auq4Vf0YuAu0VPq26OyW80NZ5v2iKg==
X-Received: by 2002:a05:6808:3ae:: with SMTP id
 n14mr6317402oie.63.1581515157211; 
 Wed, 12 Feb 2020 05:45:57 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id 108sm185737oti.1.2020.02.12.05.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 05:45:53 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:e166:6491:dd75:4196])
 by serve.minyard.net (Postfix) with ESMTPSA id 5A6DA180053;
 Wed, 12 Feb 2020 13:45:53 +0000 (UTC)
Date: Wed, 12 Feb 2020 07:45:52 -0600
From: Corey Minyard <minyard@acm.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200212134552.GN7842@minyard.net>
References: <20200117132521.31020-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117132521.31020-1-frextrite@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 openipmi-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] drivers: char: ipmi:
 ipmi_msghandler: Pass lockdep expression to RCU lists
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

On Fri, Jan 17, 2020 at 06:55:22PM +0530, Amol Grover wrote:
> intf->cmd_rcvrs is traversed with list_for_each_entry_rcu
> outside an RCU read-side critical section but under the
> protection of intf->cmd_rcvrs_mutex.
> 
> ipmi_interfaces is traversed using list_for_each_entry_rcu
> outside an RCU read-side critical section but under the protection
> of ipmi_interfaces_mutex.
> 
> Hence, add the corresponding lockdep expression to the list traversal
> primitive to silence false-positive lockdep warnings, and
> harden RCU lists.
> 
> Add macro for the corresponding lockdep expression to make the code
> clean and concise.
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>

After reading everything, I think this is correct, but I would like
Paul's stamp of approval on this.

Thanks,

-corey

> ---
> v3:
> - Remove rcu_read_lock_held() from lockdep expression since it is
>   implicitly checked.
> - Remove unintended macro usage.
>  
> v2:
> - Fix sparse error
>   CHECK: Alignment should match open parenthesis
> 
>  drivers/char/ipmi/ipmi_msghandler.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index cad9563f8f48..64ba16dcb681 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -618,6 +618,8 @@ static DEFINE_MUTEX(ipmidriver_mutex);
>  
>  static LIST_HEAD(ipmi_interfaces);
>  static DEFINE_MUTEX(ipmi_interfaces_mutex);
> +#define ipmi_interfaces_mutex_held() \
> +	lockdep_is_held(&ipmi_interfaces_mutex)
>  static struct srcu_struct ipmi_interfaces_srcu;
>  
>  /*
> @@ -1321,7 +1323,8 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
>  	 * synchronize_srcu()) then free everything in that list.
>  	 */
>  	mutex_lock(&intf->cmd_rcvrs_mutex);
> -	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link) {
> +	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
> +				lockdep_is_held(&intf->cmd_rcvrs_mutex)) {
>  		if (rcvr->user == user) {
>  			list_del_rcu(&rcvr->link);
>  			rcvr->next = rcvrs;
> @@ -1599,7 +1602,8 @@ static struct cmd_rcvr *find_cmd_rcvr(struct ipmi_smi *intf,
>  {
>  	struct cmd_rcvr *rcvr;
>  
> -	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link) {
> +	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
> +				lockdep_is_held(&intf->cmd_rcvrs_mutex)) {
>  		if ((rcvr->netfn == netfn) && (rcvr->cmd == cmd)
>  					&& (rcvr->chans & (1 << chan)))
>  			return rcvr;
> @@ -1614,7 +1618,8 @@ static int is_cmd_rcvr_exclusive(struct ipmi_smi *intf,
>  {
>  	struct cmd_rcvr *rcvr;
>  
> -	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link) {
> +	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
> +				lockdep_is_held(&intf->cmd_rcvrs_mutex)) {
>  		if ((rcvr->netfn == netfn) && (rcvr->cmd == cmd)
>  					&& (rcvr->chans & chans))
>  			return 0;
> @@ -3450,7 +3455,8 @@ int ipmi_add_smi(struct module         *owner,
>  	/* Look for a hole in the numbers. */
>  	i = 0;
>  	link = &ipmi_interfaces;
> -	list_for_each_entry_rcu(tintf, &ipmi_interfaces, link) {
> +	list_for_each_entry_rcu(tintf, &ipmi_interfaces, link,
> +				ipmi_interfaces_mutex_held()) {
>  		if (tintf->intf_num != i) {
>  			link = &tintf->link;
>  			break;
> -- 
> 2.24.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
