Return-Path: <SRS0=dZpl=65=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD782C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 May 2020 00:44:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68F9F206B6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 May 2020 00:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68F9F206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1B9732DC04;
	Fri, 15 May 2020 00:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9RXHaj47fTwo; Fri, 15 May 2020 00:44:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7B5792DA5A;
	Fri, 15 May 2020 00:44:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D816C0863;
	Fri, 15 May 2020 00:44:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F20FAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 00:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E7AC187BA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 00:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ekmf9CHccdgw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 00:44:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8B94887BA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 00:44:08 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 9ECBF14D69E20;
 Thu, 14 May 2020 17:44:05 -0700 (PDT)
Date: Thu, 14 May 2020 17:44:04 -0700 (PDT)
Message-Id: <20200514.174404.371938387358739530.davem@davemloft.net>
To: madhuparnabhowmik10@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200514141115.16074-1-madhuparnabhowmik10@gmail.com>
References: <20200514141115.16074-1-madhuparnabhowmik10@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 14 May 2020 17:44:06 -0700 (PDT)
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 cai@lca.pw, allison@lohutok.net, joel@joelfernandes.org, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, ap420073@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH net] drivers: net: hamradio: Fix
 suspicious RCU usage warning in bpqether.c
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

From: madhuparnabhowmik10@gmail.com
Date: Thu, 14 May 2020 19:41:15 +0530

> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> This patch fixes the following warning:
> =============================
> WARNING: suspicious RCU usage
> 5.7.0-rc5-next-20200514-syzkaller #0 Not tainted
> -----------------------------
> drivers/net/hamradio/bpqether.c:149 RCU-list traversed in non-reader section!!
> 
> Since rtnl lock is held, pass this cond in list_for_each_entry_rcu().
> 
> Reported-by: syzbot+bb82cafc737c002d11ca@syzkaller.appspotmail.com
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

Applied, thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
