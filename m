Return-Path: <SRS0=BcdZ=BV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7870C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 07:06:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEF06204FD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 07:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEF06204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ssi.bg
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 76E0886DD3;
	Tue, 11 Aug 2020 07:06:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgUYPeDMana9; Tue, 11 Aug 2020 07:06:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 41FB086D37;
	Tue, 11 Aug 2020 07:06:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B4BFC013C;
	Tue, 11 Aug 2020 07:06:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54353C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 07:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 50C63866AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 07:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cv36whJcuFq4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 07:06:26 +0000 (UTC)
X-Greylist: delayed 00:07:00 by SQLgrey-1.7.6
Received: from ja.ssi.bg (unknown [178.16.129.10])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 250DF8665D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 07:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by ja.ssi.bg (8.15.2/8.15.2) with ESMTP id 07B6wk1t005940;
 Tue, 11 Aug 2020 09:58:46 +0300
Date: Tue, 11 Aug 2020 09:58:46 +0300 (EEST)
From: Julian Anastasov <ja@ssi.bg>
To: Peilin Ye <yepeilin.cs@gmail.com>
In-Reply-To: <20200811050929.GA821443@PWN>
Message-ID: <alpine.LFD.2.23.451.2008110936570.3707@ja.home.ssi.bg>
References: <20200810220703.796718-1-yepeilin.cs@gmail.com>
 <CAM_iQpWsQubVJ-AYaLHujHwz68+nsHBcbgbf8XPMEPD=Vu+zaA@mail.gmail.com>
 <20200811050929.GA821443@PWN>
MIME-Version: 1.0
Cc: Wensong Zhang <wensong@linux-vs.org>, coreteam@netfilter.org,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Florian Westphal <fw@strlen.de>, LKML <linux-kernel@vger.kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, lvs-devel@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, NetFilter <netfilter-devel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Cong Wang <xiyou.wangcong@gmail.com>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [Linux-kernel-mentees] [PATCH net] ipvs: Fix uninit-value in
 do_ip_vs_set_ctl()
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

> On Mon, Aug 10, 2020 at 08:57:19PM -0700, Cong Wang wrote:
> > On Mon, Aug 10, 2020 at 3:10 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > >
> > > do_ip_vs_set_ctl() is referencing uninitialized stack value when `len` is
> > > zero. Fix it.
> > 
> > Which exact 'cmd' is it here?
> > 
> > I _guess_ it is one of those uninitialized in set_arglen[], which is 0.
> 
> Yes, it was `IP_VS_SO_SET_NONE`, implicitly initialized to zero.
> 
> > But if that is the case, should it be initialized to
> > sizeof(struct ip_vs_service_user) instead because ip_vs_copy_usvc_compat()
> > is called anyway. Or, maybe we should just ban len==0 case.
> 
> I see. I think the latter would be easier, but we cannot ban all of
> them, since the function does something with `IP_VS_SO_SET_FLUSH`, which
> is a `len == 0` case.
> 
> Maybe we do something like this?

	Yes, only IP_VS_SO_SET_FLUSH uses len 0. We can go with
this change but you do not need to target net tree, as the
problem is not fatal net-next works too. What happens is
that we may lookup services with random search keys which
is harmless.

	Another option is to add new block after this one:

        } else if (cmd == IP_VS_SO_SET_TIMEOUT) {
                /* Set timeout values for (tcp tcpfin udp) */
                ret = ip_vs_set_timeout(ipvs, (struct ip_vs_timeout_user *)arg);
                goto out_unlock;
        }

	such as:

	} else if (!len) {
		/* No more commands with len=0 below */
		ret = -EINVAL;
		goto out_unlock;
	}

	It give more chance for future commands to use len=0
but the drawback is that the check happens under mutex. So, I'm
fine with both versions, it is up to you to decide :)

> @@ -2432,6 +2432,8 @@ do_ip_vs_set_ctl(struct sock *sk, int cmd, void __user *user, unsigned int len)
> 
>  	if (cmd < IP_VS_BASE_CTL || cmd > IP_VS_SO_SET_MAX)
>  		return -EINVAL;
> +	if (len == 0 && cmd != IP_VS_SO_SET_FLUSH)
> +		return -EINVAL;
>  	if (len != set_arglen[CMDID(cmd)]) {
>  		IP_VS_DBG(1, "set_ctl: len %u != %u\n",
>  			  len, set_arglen[CMDID(cmd)]);
> @@ -2547,9 +2549,6 @@ do_ip_vs_set_ctl(struct sock *sk, int cmd, void __user *user, unsigned int len)
>  		break;
>  	case IP_VS_SO_SET_DELDEST:
>  		ret = ip_vs_del_dest(svc, &udest);
> -		break;
> -	default:
> -		ret = -EINVAL;
>  	}
> 
>    out_unlock:

Regards

--
Julian Anastasov <ja@ssi.bg>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
