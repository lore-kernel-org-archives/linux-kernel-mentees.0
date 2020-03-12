Return-Path: <SRS0=9c4A=45=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918CBC10DCE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Mar 2020 05:55:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78BE620663
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Mar 2020 05:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78BE620663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6560289273;
	Thu, 12 Mar 2020 05:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xFJ4q0BiLQ7x; Thu, 12 Mar 2020 05:55:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A20238923C;
	Thu, 12 Mar 2020 05:55:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 957A0C07FF;
	Thu, 12 Mar 2020 05:55:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1C9AC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Mar 2020 05:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CB31A8612B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Mar 2020 05:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cA6FpIEn7vMY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Mar 2020 05:55:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5CFA686121
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Mar 2020 05:55:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 2C17C14C7E036;
 Wed, 11 Mar 2020 22:55:46 -0700 (PDT)
Date: Wed, 11 Mar 2020 22:55:45 -0700 (PDT)
Message-Id: <20200311.225545.780993448550563267.davem@davemloft.net>
To: frextrite@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200312053419.12258-1-frextrite@gmail.com>
References: <20200312053419.12258-1-frextrite@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 11 Mar 2020 22:55:46 -0700 (PDT)
Cc: lkp@intel.com, paulmck@kernel.org, madhuparnabhowmik10@gmail.com,
 linux-kernel@vger.kernel.org, rfontana@redhat.com, netdev@vger.kernel.org,
 joel@joelfernandes.org, kuba@kernel.org, tglx@linutronix.de, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, allison@lohutok.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: caif: Add lockdep
 expression to RCU traversal primitive
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

From: Amol Grover <frextrite@gmail.com>
Date: Thu, 12 Mar 2020 11:04:20 +0530

> caifdevs->list is traversed using list_for_each_entry_rcu()
> outside an RCU read-side critical section but under the
> protection of rtnl_mutex. Hence, add the corresponding lockdep
> expression to silence the following false-positive warning:
> 
> [   10.868467] =============================
> [   10.869082] WARNING: suspicious RCU usage
> [   10.869817] 5.6.0-rc1-00177-g06ec0a154aae4 #1 Not tainted
> [   10.870804] -----------------------------
> [   10.871557] net/caif/caif_dev.c:115 RCU-list traversed in non-reader section!!
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Amol Grover <frextrite@gmail.com>

Applied, thank you.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
