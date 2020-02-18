Return-Path: <SRS0=Ux9x=4G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67840C3404B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 20:46:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460EC2176D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 20:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 460EC2176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2588986457;
	Tue, 18 Feb 2020 20:46:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3A4L4unjeFpL; Tue, 18 Feb 2020 20:46:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 127DE8641F;
	Tue, 18 Feb 2020 20:46:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1634C1D8E;
	Tue, 18 Feb 2020 20:46:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9587C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 20:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E32C7204C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 20:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GNzeXfGSABF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 20:46:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by silver.osuosl.org (Postfix) with ESMTPS id 1DA4720343
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 20:46:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 3EAC312446870;
 Tue, 18 Feb 2020 12:46:37 -0800 (PST)
Date: Tue, 18 Feb 2020 12:46:36 -0800 (PST)
Message-Id: <20200218.124636.1837918891283865601.davem@davemloft.net>
To: madhuparnabhowmik10@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200218195425.1962-1-madhuparnabhowmik10@gmail.com>
References: <20200218195425.1962-1-madhuparnabhowmik10@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 18 Feb 2020 12:46:37 -0800 (PST)
Cc: dev@openvswitch.org, paulmck@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pshelar@ovn.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/4] meter.c: Use built-in RCU
	list checking
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
Date: Wed, 19 Feb 2020 01:24:25 +0530

> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> hlist_for_each_entry_rcu() has built-in RCU and lock checking.
> 
> Pass cond argument to list_for_each_entry_rcu() to silence
> false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
> by default.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

Applied.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
