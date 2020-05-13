Return-Path: <SRS0=2ll/=63=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CFCC2D0F8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 May 2020 05:35:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7C2D206F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 May 2020 05:35:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAgYphhM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7C2D206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79C1986B7E;
	Wed, 13 May 2020 05:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bg9MGDwcVAM7; Wed, 13 May 2020 05:35:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 22537860C4;
	Wed, 13 May 2020 05:35:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C9B1C088A;
	Wed, 13 May 2020 05:35:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09919C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 05:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E2FC6203F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 05:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OJ-95Jl91PvA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 05:35:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 2F128203FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 05:35:08 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id j13so469761pjm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 22:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xKuGTzBt71m8CIHDiDqn23KXHfAjPSHatdr1dMN3hRc=;
 b=RAgYphhM6lKLTBzgKAx5zx6yvuoUwfVoCymWZIgflUs/0LjoFuINBna/wDXzT6s361
 vXaI97zbEJnU7eViR0Apq3Icr8xvQqY8wEeaPO3eAZGzLiuN0qrxjusCno/743PbjDDc
 1lPMePNfi3BggixLBjij0p+j6KEGgk7zKTtPppn7Qkses6ZfnaM6PKEdTJHaQkZ6U3RR
 a2681p03wrnW0L7W7EZA3EgBqtVU0d3WgbuGt/gU16kAOTSHTJ9nG9loAM8kf66BDiY2
 xkCbyyR6c4lbSXd74JUhVyOWf2lvG/XitcT4Z88nlh7FMfTV8kJ/6Z4iep4ICrrpGTw8
 a4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xKuGTzBt71m8CIHDiDqn23KXHfAjPSHatdr1dMN3hRc=;
 b=QBh+bj69Cn3dEQU3d4bMpSSTWGcKPonAyrL6iwCVaVzYev3nh2BmUbdpyfc7ugi48B
 aeEPsyc3VoDYy/V3nXQWE5Gbb13AMy4OcDyKAxKdKkLvPFFFIgjRpjEBRz6WocovLEeH
 BVlfeppF7Y+gmo12HQS8DizgTjTexDYDvX7tp/0IZoX95KiM4b9Jkr0OHq61sZWTsE4h
 IKn9cXxfBCAzQB5nnVXKx2ubjSd9ZfbWEaUui3WEY0Qfg0Dk54h+cm0jXLV3xT2VMkeu
 1WL/up7rwTP1C+D1ccnO/ehdDNhAWpU5eYprkPhECnyc263cuffFregPJ6QszdfqwQ+3
 WiSw==
X-Gm-Message-State: AGi0PuY5/P2gzNwSLTimNQZ9wV6+KwPDMU5CV0OJDTM6ztR1UhYy5SV7
 fomseY9k++TAMpd+P6j4zw==
X-Google-Smtp-Source: APiQypKfvqODuQ4CFxPjmPeTQVxkuOOAoKkkaVAnEo+lH+kR3XTtYOdHg+gLw0Fcr+0cKMQIH8a5FQ==
X-Received: by 2002:a17:90a:8c98:: with SMTP id
 b24mr23216888pjo.226.1589348107506; 
 Tue, 12 May 2020 22:35:07 -0700 (PDT)
Received: from madhuparna-HP-Notebook ([2409:4071:5b5:d53:89fb:f860:f992:54ab])
 by smtp.gmail.com with ESMTPSA id 21sm7298563pgc.6.2020.05.12.22.35.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 May 2020 22:35:06 -0700 (PDT)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Wed, 13 May 2020 11:04:57 +0530
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20200513053457.GA13541@madhuparna-HP-Notebook>
References: <20200509072243.3141-1-frextrite@gmail.com>
 <20200509072243.3141-2-frextrite@gmail.com>
 <20200509141938.028fa959@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20200512051705.GB9585@madhuparna-HP-Notebook>
 <20200512093231.7ce29f30@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512093231.7ce29f30@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: sfr@canb.auug.org.au, "Paul E . McKenney" <paulmck@kernel.org>,
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

On Tue, May 12, 2020 at 09:32:31AM -0700, Jakub Kicinski wrote:
> On Tue, 12 May 2020 10:47:05 +0530 Madhuparna Bhowmik wrote:
> > > >  #ifdef CONFIG_IP_MROUTE_MULTIPLE_TABLES
> > > > -#define ipmr_for_each_table(mrt, net) \
> > > > -	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list, \
> > > > -				lockdep_rtnl_is_held())
> > > > +#define ipmr_for_each_table(mrt, net)					\
> > > > +	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list,	\
> > > > +				lockdep_rtnl_is_held() ||		\
> > > > +				lockdep_is_held(&pernet_ops_rwsem))  
> > > 
> > > This is a strange condition, IMHO. How can we be fine with either
> > > lock.. This is supposed to be the writer side lock, one can't have 
> > > two writer side locks..
> > > 
> > > I think what is happening is this:
> > > 
> > > ipmr_net_init() -> ipmr_rules_init() -> ipmr_new_table()
> > > 
> > > ipmr_new_table() returns an existing table if there is one, but
> > > obviously none can exist at init.  So a better fix would be:
> > > 
> > > #define ipmr_for_each_table(mrt, net)					\
> > > 	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list,	\
> > > 				lockdep_rtnl_is_held() ||		\
> > > 				list_empty(&net->ipv4.mr_tables))
> > >  
> > (adding Stephen)
> > 
> > Hi Jakub,
> > 
> > Thank you for your suggestion about this patch.
> > Here is a stack trace for ipmr.c:
> > 
> > [...]
> 
> Thanks!
> 
> > > Thoughts?  
> > 
> > Do you think a similar fix (the one you suggested) is also applicable
> > in the ip6mr case.
> 
> Yes, looking at the code it seems ip6mr has the exact same flow for
> netns init.

Alright, thanks a lot.
I will send a patch for ip6mr.c soon.

Thank you,
Madhuparna
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
