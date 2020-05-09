Return-Path: <SRS0=VQEw=6X=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0EEC54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  9 May 2020 21:19:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B61EC214D8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  9 May 2020 21:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wOsCHPDr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B61EC214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 83EBE877F1;
	Sat,  9 May 2020 21:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U8jCvbuL-eCY; Sat,  9 May 2020 21:19:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 16DDE86DC5;
	Sat,  9 May 2020 21:19:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F34B9C0889;
	Sat,  9 May 2020 21:19:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30A0EC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 May 2020 21:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2ACEE86B87
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 May 2020 21:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zGGBUajgzyZW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 May 2020 21:19:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 16C7F86B51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 May 2020 21:19:41 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C45721473;
 Sat,  9 May 2020 21:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589059180;
 bh=VmwPVJKT2v+erZFsLCasdEboGnLPwgraIeEZ+VZKOMs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=wOsCHPDrh0mHaFSaxipTFAcZ+JRW6Ycicfqco2CcTCCoSv8LTi4yHScET00RKIYxj
 XigbMqA5U4m4L26IkmKQZA2J7gSDX3c261EmTEcfeS5rO4ZHOTPzNW0Ygo5JRt10+d
 WUiPtLUW6z1rpQW4iaBOK7mJf4U9EkLVQXYt+EmY=
Date: Sat, 9 May 2020 14:19:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200509141938.028fa959@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200509072243.3141-2-frextrite@gmail.com>
References: <20200509072243.3141-1-frextrite@gmail.com>
 <20200509072243.3141-2-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH net 2/2 RESEND] ipmr: Add lockdep
 expression to ipmr_for_each_table macro
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

On Sat,  9 May 2020 12:52:44 +0530 Amol Grover wrote:
> ipmr_for_each_table() uses list_for_each_entry_rcu() for
> traversing outside of an RCU read-side critical section but
> under the protection of pernet_ops_rwsem. Hence add the
> corresponding lockdep expression to silence the following
> false-positive warning at boot:

Thanks for the fix, the warning has been annoying me as well!

> [    0.645292] =============================
> [    0.645294] WARNING: suspicious RCU usage
> [    0.645296] 5.5.4-stable #17 Not tainted
> [    0.645297] -----------------------------
> [    0.645299] net/ipv4/ipmr.c:136 RCU-list traversed in non-reader section!!

please provide a fuller stack trace, it would have helped the review

> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  net/ipv4/ipmr.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
> index 99c864eb6e34..950ffe9943da 100644
> --- a/net/ipv4/ipmr.c
> +++ b/net/ipv4/ipmr.c
> @@ -109,9 +109,10 @@ static void mroute_clean_tables(struct mr_table *mrt, int flags);
>  static void ipmr_expire_process(struct timer_list *t);
>  
>  #ifdef CONFIG_IP_MROUTE_MULTIPLE_TABLES
> -#define ipmr_for_each_table(mrt, net) \
> -	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list, \
> -				lockdep_rtnl_is_held())
> +#define ipmr_for_each_table(mrt, net)					\
> +	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list,	\
> +				lockdep_rtnl_is_held() ||		\
> +				lockdep_is_held(&pernet_ops_rwsem))

This is a strange condition, IMHO. How can we be fine with either
lock.. This is supposed to be the writer side lock, one can't have 
two writer side locks..

I think what is happening is this:

ipmr_net_init() -> ipmr_rules_init() -> ipmr_new_table()

ipmr_new_table() returns an existing table if there is one, but
obviously none can exist at init.  So a better fix would be:

#define ipmr_for_each_table(mrt, net)					\
	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list,	\
				lockdep_rtnl_is_held() ||		\
				list_empty(&net->ipv4.mr_tables))

Thoughts?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
