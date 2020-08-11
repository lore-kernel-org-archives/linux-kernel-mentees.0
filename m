Return-Path: <SRS0=BcdZ=BV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AAAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 07:19:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83C7820774
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 07:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8B0k6+g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83C7820774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1C551203C7;
	Tue, 11 Aug 2020 07:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5nVw1cMevmx; Tue, 11 Aug 2020 07:19:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B053A1FF59;
	Tue, 11 Aug 2020 07:19:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9420DC07FF;
	Tue, 11 Aug 2020 07:19:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 599B5C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 07:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 487E61FF59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 07:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ooJ4oqpzbJp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 07:19:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by silver.osuosl.org (Postfix) with ESMTPS id D0107203C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 07:19:18 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k18so8754074qtm.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QUV+RKelrGDMMeJLFdVFPbO5APkLi9wyQFp+5QMDpqo=;
 b=G8B0k6+gHQyZJGZkIl+xEMk6z/IlDGgzjGX5y4LxNPYyppL8U7UKPd3gn+3fIKXHCo
 l9kweqnqTiecZV2ppBXXk7umYr3ephBhbV8F21O/89WgTHoAW0RxLr7uNmAFB/jp7JAS
 QkKwvX2oUHmDCy2WrQQG3Q7sOLr62fSGghzehtSVFW5dSIffIgKzCwEkKerIv2qsnz2j
 6HXMeKJr7toegZllvqQbAmUtlY3qUIGrTZG3Sg/2nNGBCdCC+ot2LSIpg6JI8qB4/rcf
 heYYSfK9onwXOq7o4LBJlO95mn//YsfsVAlK5QbjYbgU6M3+ZGw+qvxYy25G/3shbRUP
 PgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QUV+RKelrGDMMeJLFdVFPbO5APkLi9wyQFp+5QMDpqo=;
 b=e7pj+zOFmr9XhUmhG1pFFSdHEFVLxXnk5Dd6M8vw2mUwDy+amtxGZUb3SU+Ac0h0Q4
 88ojkzpz66SoyIkwinUlgbXFn1C2lOCEvKMpn6ugkp83/41c1exlXChyWSnq3cEJilUX
 96VE4CMiBTglTEKvfb9Lm6gOV5CFVsK0/IFTFdxnkCuSd9VbnrReszAAJVKivY+tExyq
 eyY2EUjyJiFVRt3a4Kpp1juJFKFQNoIm3VdYe/ba4ivU/Eo2B3wwgBWKBCGZIj0u7HB1
 aNFy/OrB6jQ/4kCl/om+qfZa4l1GszIZTZhVVlQr6MzesTgYdYXRTtyVyu6GLGO28kRo
 ANAg==
X-Gm-Message-State: AOAM530oPB1tyMD0mZ1XIs7I3Nw8J5Upq8z2JVPdZo/sRjETLclBc/fd
 YDHpdQPiWY5/SuetR3XozQ==
X-Google-Smtp-Source: ABdhPJxBd5Yw2qCQsEu0ftMM++sr6OpE6pVjh3+jCMAnheGuaNBmkGoWNWMr2U2MFEYgUmx3GtaNhw==
X-Received: by 2002:ac8:454b:: with SMTP id z11mr32295102qtn.350.1597130357716; 
 Tue, 11 Aug 2020 00:19:17 -0700 (PDT)
Received: from PWN
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id x67sm16866688qke.136.2020.08.11.00.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 00:19:17 -0700 (PDT)
Date: Tue, 11 Aug 2020 03:19:14 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Julian Anastasov <ja@ssi.bg>
Message-ID: <20200811071914.GA832118@PWN>
References: <20200810220703.796718-1-yepeilin.cs@gmail.com>
 <CAM_iQpWsQubVJ-AYaLHujHwz68+nsHBcbgbf8XPMEPD=Vu+zaA@mail.gmail.com>
 <20200811050929.GA821443@PWN>
 <alpine.LFD.2.23.451.2008110936570.3707@ja.home.ssi.bg>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.23.451.2008110936570.3707@ja.home.ssi.bg>
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

On Tue, Aug 11, 2020 at 09:58:46AM +0300, Julian Anastasov wrote:
> 
> 	Hello,
> 
> On Tue, 11 Aug 2020, Peilin Ye wrote:
> 
> > On Mon, Aug 10, 2020 at 08:57:19PM -0700, Cong Wang wrote:
> > > On Mon, Aug 10, 2020 at 3:10 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > >
> > > > do_ip_vs_set_ctl() is referencing uninitialized stack value when `len` is
> > > > zero. Fix it.
> > > 
> > > Which exact 'cmd' is it here?
> > > 
> > > I _guess_ it is one of those uninitialized in set_arglen[], which is 0.
> > 
> > Yes, it was `IP_VS_SO_SET_NONE`, implicitly initialized to zero.
> > 
> > > But if that is the case, should it be initialized to
> > > sizeof(struct ip_vs_service_user) instead because ip_vs_copy_usvc_compat()
> > > is called anyway. Or, maybe we should just ban len==0 case.
> > 
> > I see. I think the latter would be easier, but we cannot ban all of
> > them, since the function does something with `IP_VS_SO_SET_FLUSH`, which
> > is a `len == 0` case.
> > 
> > Maybe we do something like this?
> 
> 	Yes, only IP_VS_SO_SET_FLUSH uses len 0. We can go with
> this change but you do not need to target net tree, as the
> problem is not fatal net-next works too. What happens is
> that we may lookup services with random search keys which
> is harmless.

I see, I'll target net-next instead.

> 	Another option is to add new block after this one:
> 
>         } else if (cmd == IP_VS_SO_SET_TIMEOUT) {
>                 /* Set timeout values for (tcp tcpfin udp) */
>                 ret = ip_vs_set_timeout(ipvs, (struct ip_vs_timeout_user *)arg);
>                 goto out_unlock;
>         }
> 
> 	such as:
> 
> 	} else if (!len) {
> 		/* No more commands with len=0 below */
> 		ret = -EINVAL;
> 		goto out_unlock;
> 	}
> 
> 	It give more chance for future commands to use len=0
> but the drawback is that the check happens under mutex. So, I'm
> fine with both versions, it is up to you to decide :)

Ah, this seems much cleaner. I'll send v2 soon, thank you!

Peilin Ye

> > @@ -2432,6 +2432,8 @@ do_ip_vs_set_ctl(struct sock *sk, int cmd, void __user *user, unsigned int len)
> > 
> >  	if (cmd < IP_VS_BASE_CTL || cmd > IP_VS_SO_SET_MAX)
> >  		return -EINVAL;
> > +	if (len == 0 && cmd != IP_VS_SO_SET_FLUSH)
> > +		return -EINVAL;
> >  	if (len != set_arglen[CMDID(cmd)]) {
> >  		IP_VS_DBG(1, "set_ctl: len %u != %u\n",
> >  			  len, set_arglen[CMDID(cmd)]);
> > @@ -2547,9 +2549,6 @@ do_ip_vs_set_ctl(struct sock *sk, int cmd, void __user *user, unsigned int len)
> >  		break;
> >  	case IP_VS_SO_SET_DELDEST:
> >  		ret = ip_vs_del_dest(svc, &udest);
> > -		break;
> > -	default:
> > -		ret = -EINVAL;
> >  	}
> > 
> >    out_unlock:
> 
> Regards
> 
> --
> Julian Anastasov <ja@ssi.bg>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
