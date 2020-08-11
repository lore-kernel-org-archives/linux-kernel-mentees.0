Return-Path: <SRS0=BcdZ=BV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DE0C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 10:29:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E555205CB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 10:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E555205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ssi.bg
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5719B204A8;
	Tue, 11 Aug 2020 10:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Kaa0llitZza; Tue, 11 Aug 2020 10:29:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 624071FDFB;
	Tue, 11 Aug 2020 10:29:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A40DC07FF;
	Tue, 11 Aug 2020 10:29:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39980C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 10:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2659287BFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 10:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2CeDDCpVPtJ5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 10:29:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ja.ssi.bg (unknown [178.16.129.10])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 54D9787B96
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 10:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by ja.ssi.bg (8.15.2/8.15.2) with ESMTP id 07BAT4fo009688;
 Tue, 11 Aug 2020 13:29:04 +0300
Date: Tue, 11 Aug 2020 13:29:04 +0300 (EEST)
From: Julian Anastasov <ja@ssi.bg>
To: Peilin Ye <yepeilin.cs@gmail.com>
In-Reply-To: <20200811074640.841693-1-yepeilin.cs@gmail.com>
Message-ID: <alpine.LFD.2.23.451.2008111324570.7428@ja.home.ssi.bg>
References: <20200810220703.796718-1-yepeilin.cs@gmail.com>
 <20200811074640.841693-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Wensong Zhang <wensong@linux-vs.org>, coreteam@netfilter.org,
 syzkaller-bugs@googlegroups.com, Florian Westphal <fw@strlen.de>,
 linux-kernel@vger.kernel.org, Jozsef Kadlecsik <kadlec@netfilter.org>,
 lvs-devel@vger.kernel.org, Simon Horman <horms@verge.net.au>,
 netfilter-devel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Cong Wang <xiyou.wangcong@gmail.com>, netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [Linux-kernel-mentees] [PATCH net-next v2] ipvs: Fix
 uninit-value in do_ip_vs_set_ctl()
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


	Hello,

On Tue, 11 Aug 2020, Peilin Ye wrote:

> do_ip_vs_set_ctl() is referencing uninitialized stack value when `len` is
> zero. Fix it.
> 
> Reported-by: syzbot+23b5f9e7caf61d9a3898@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=46ebfb92a8a812621a001ef04d90dfa459520fe2
> Suggested-by: Julian Anastasov <ja@ssi.bg>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

	Looks good to me, thanks!

Acked-by: Julian Anastasov <ja@ssi.bg>

> ---
> Changes in v2:
>     - Target net-next tree. (Suggested by Julian Anastasov <ja@ssi.bg>)
>     - Reject all `len == 0` requests except `IP_VS_SO_SET_FLUSH`, instead
>       of initializing `arg`. (Suggested by Cong Wang
>       <xiyou.wangcong@gmail.com>, Julian Anastasov <ja@ssi.bg>)
> 
>  net/netfilter/ipvs/ip_vs_ctl.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/net/netfilter/ipvs/ip_vs_ctl.c b/net/netfilter/ipvs/ip_vs_ctl.c
> index 412656c34f20..beeafa42aad7 100644
> --- a/net/netfilter/ipvs/ip_vs_ctl.c
> +++ b/net/netfilter/ipvs/ip_vs_ctl.c
> @@ -2471,6 +2471,10 @@ do_ip_vs_set_ctl(struct sock *sk, int cmd, void __user *user, unsigned int len)
>  		/* Set timeout values for (tcp tcpfin udp) */
>  		ret = ip_vs_set_timeout(ipvs, (struct ip_vs_timeout_user *)arg);
>  		goto out_unlock;
> +	} else if (!len) {
> +		/* No more commands with len == 0 below */
> +		ret = -EINVAL;
> +		goto out_unlock;
>  	}
>  
>  	usvc_compat = (struct ip_vs_service_user *)arg;
> @@ -2547,9 +2551,6 @@ do_ip_vs_set_ctl(struct sock *sk, int cmd, void __user *user, unsigned int len)
>  		break;
>  	case IP_VS_SO_SET_DELDEST:
>  		ret = ip_vs_del_dest(svc, &udest);
> -		break;
> -	default:
> -		ret = -EINVAL;
>  	}
>  
>    out_unlock:
> -- 
> 2.25.1

Regards

--
Julian Anastasov <ja@ssi.bg>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
