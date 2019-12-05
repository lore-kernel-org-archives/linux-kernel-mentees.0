Return-Path: <SRS0=8tby=Z3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9361BC2D0BE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 00:25:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D9321744
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 00:25:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryvX+Chr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65D9321744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 342FD87070;
	Thu,  5 Dec 2019 00:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yHXt_yvkcFb; Thu,  5 Dec 2019 00:25:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17A0A8706F;
	Thu,  5 Dec 2019 00:25:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CCF3C1DD6;
	Thu,  5 Dec 2019 00:25:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 720D3C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 00:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5521487EDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 00:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-ZPV5ps2cJ2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 00:25:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AB7FF87ED7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 00:25:18 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C6F221823;
 Thu,  5 Dec 2019 00:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575505518;
 bh=T/Kj7aasoT8tfhY99yWbDoxlX9qhhOFSHcc6kCya+w4=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=ryvX+ChrgSSB1Io3Gi7dVPJWmmRMoJY7/wQgtM0WahgDcb7IZkre4B1T7fdhsr3Tm
 VF8Qw6spRW2HMCohpoeq+MH5/VK6x+F+Tf3OpsgsjoeMMRsSMTnTA8BfQb246fKlUL
 fF5OD8qLXHdSujHPiANYICYblDdT3VPUADY062/M=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 3EA8E3522922; Wed,  4 Dec 2019 16:25:18 -0800 (PST)
Date: Wed, 4 Dec 2019 16:25:18 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20191205002518.GP2889@paulmck-ThinkPad-P72>
References: <20191204120357.11658-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204120357.11658-1-madhuparnabhowmik04@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: joel@joelfernandes.org, rcu@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Include: Linux: rculist_nulls:
 Add docbook comment headers
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Dec 04, 2019 at 05:33:57PM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> This patch adds docbook comment headers for hlist_nulls_first_rcu
> and hlist_nulls_next_rcu in rculist_nulls.h.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> ---

Good to see, thank you!  A few grammar nits below -- could you please
update and re-send?

							Thanx, Paul

>  include/linux/rculist_nulls.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nulls.h
> index 517a06f36c7a..d796ef18ec52 100644
> --- a/include/linux/rculist_nulls.h
> +++ b/include/linux/rculist_nulls.h
> @@ -38,9 +38,17 @@ static inline void hlist_nulls_del_init_rcu(struct hlist_nulls_node *n)
>  	}
>  }
>  
> +/**
> + * hlist_nulls_first_rcu - returns the first element of the hash list.
> + * @head: the head for your list.

Could you please say something like "The head of the list."?
Just to keep point of view more consistent through the documentation.

> + */
>  #define hlist_nulls_first_rcu(head) \
>  	(*((struct hlist_nulls_node __rcu __force **)&(head)->first))
>  
> +/**
> + * hlist_nulls_next_rcu - returns the element of the list next to @node.

Here, could you please change "next to" to "after"?  This removes the
ambiguity where both the prior and the subsequent elements might be
thought of as "next to".

> + * @node: Element of the list.
> + */
>  #define hlist_nulls_next_rcu(node) \
>  	(*((struct hlist_nulls_node __rcu __force **)&(node)->next))
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
