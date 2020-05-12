Return-Path: <SRS0=I4PQ=62=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844F5C47076
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 May 2020 21:59:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01C1B20747
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 May 2020 21:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Orwq489T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01C1B20747
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D2DDD8908B;
	Tue, 12 May 2020 21:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDDtBtpwWyTF; Tue, 12 May 2020 21:59:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DE1888713;
	Tue, 12 May 2020 21:59:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E68BC088A;
	Tue, 12 May 2020 21:59:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 153B5C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 21:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 090558784F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 21:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SuXM5YrJbWEj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 21:59:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7730887797
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2020 21:59:20 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2180206B7;
 Tue, 12 May 2020 21:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589320760;
 bh=umeyPfzMnWUsI5DYYCbU0pSKl5SS197xscOjTElhVOU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Orwq489TX5Fd2s66luzYbKVVgduIHMk5HY1Z5C2/g255CTs0S+aNNxq/hJsS/Y41o
 W8r0qfRHsg71g6f6Rxqm6CQwuwh6IBrjpO2gNOLIXo4fj0upk24RpESOk6UItCHhiL
 YVKL1XGaqCNX3GK3lmfbBhf5Q01Dnb+hT43e1oCQ=
Date: Tue, 12 May 2020 14:59:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200512145917.729db7bd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200512171710.GA3200@workstation-portable>
References: <20200509072243.3141-1-frextrite@gmail.com>
 <20200509072243.3141-2-frextrite@gmail.com>
 <20200509141938.028fa959@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20200512051705.GB9585@madhuparna-HP-Notebook>
 <20200512171710.GA3200@workstation-portable>
MIME-Version: 1.0
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

On Tue, 12 May 2020 22:47:10 +0530 Amol Grover wrote:
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
> 
> Jakub, I agree, this condition looks better (and correct) than the one I
> proposed. I'll do the changes as necessary. Also, do you want me to add
> the full trace to the git commit body as well? I omitted it on purpose
> to not make it messy.

In this case we can leave it at the depth of IPMR code + the caller, so:

[    1.534758]  ? ipmr_get_table+0x3c/0x70
[    1.535430]  ? ipmr_new_table+0x1c/0x60
[    1.536173]  ? ipmr_net_init+0x7b/0x170
[    1.536923]  ? register_pernet_subsys+0xd/0x30

This makes it clear that the problem happens at net namespace init.

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
