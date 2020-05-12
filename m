Return-Path: <SRS0=I4PQ=62=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D172C2D0F6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 May 2020 16:32:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E98CF20722
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 May 2020 16:32:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyfUMILZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E98CF20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C64C025EF4;
	Tue, 12 May 2020 16:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8StF2DjHZMba; Tue, 12 May 2020 16:32:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0A5EF2078B;
	Tue, 12 May 2020 16:32:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E86B2C0178;
	Tue, 12 May 2020 16:32:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3871BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 16:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 31559893DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 16:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id egUlzpN4ubUD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 16:32:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B7799893CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 16:32:33 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12432206CC;
 Tue, 12 May 2020 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589301153;
 bh=iai6OsTrstOImYGBblatIa+HRYGTeEYXR6O6Jhuge0Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gyfUMILZKf/6nFVyJhQlgWnDBIITwatliCL6ozMK0oYYDh9/NAxgxc1CXknpwXadj
 yyTgtV1zyYYhV6oo9ENRsJf+k/FGgpJvBVXQRyW1r8HEY4I+/AKreK2X+lh3ZWz0M1
 LJzi7cV8FRpSdqnDdByESWwxf/OWll2UtOoH1i2U=
Date: Tue, 12 May 2020 09:32:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Message-ID: <20200512093231.7ce29f30@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200512051705.GB9585@madhuparna-HP-Notebook>
References: <20200509072243.3141-1-frextrite@gmail.com>
 <20200509072243.3141-2-frextrite@gmail.com>
 <20200509141938.028fa959@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20200512051705.GB9585@madhuparna-HP-Notebook>
MIME-Version: 1.0
Cc: sfr@canb.auug.org.au, "Paul E . McKenney" <paulmck@kernel.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 linux-kernel-mentees@lists.linuxfoundation.org, "David S .
 Miller" <davem@davemloft.net>
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

On Tue, 12 May 2020 10:47:05 +0530 Madhuparna Bhowmik wrote:
> > >  #ifdef CONFIG_IP_MROUTE_MULTIPLE_TABLES
> > > -#define ipmr_for_each_table(mrt, net) \
> > > -	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list, \
> > > -				lockdep_rtnl_is_held())
> > > +#define ipmr_for_each_table(mrt, net)					\
> > > +	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list,	\
> > > +				lockdep_rtnl_is_held() ||		\
> > > +				lockdep_is_held(&pernet_ops_rwsem))  
> > 
> > This is a strange condition, IMHO. How can we be fine with either
> > lock.. This is supposed to be the writer side lock, one can't have 
> > two writer side locks..
> > 
> > I think what is happening is this:
> > 
> > ipmr_net_init() -> ipmr_rules_init() -> ipmr_new_table()
> > 
> > ipmr_new_table() returns an existing table if there is one, but
> > obviously none can exist at init.  So a better fix would be:
> > 
> > #define ipmr_for_each_table(mrt, net)					\
> > 	list_for_each_entry_rcu(mrt, &net->ipv4.mr_tables, list,	\
> > 				lockdep_rtnl_is_held() ||		\
> > 				list_empty(&net->ipv4.mr_tables))
> >  
> (adding Stephen)
> 
> Hi Jakub,
> 
> Thank you for your suggestion about this patch.
> Here is a stack trace for ipmr.c:
> 
> [...]

Thanks!

> > Thoughts?  
> 
> Do you think a similar fix (the one you suggested) is also applicable
> in the ip6mr case.

Yes, looking at the code it seems ip6mr has the exact same flow for
netns init.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
