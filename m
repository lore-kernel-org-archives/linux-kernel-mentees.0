Return-Path: <SRS0=dZpl=65=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A466AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 May 2020 01:01:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B8772065F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 May 2020 01:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B8772065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5FF8687BBB;
	Fri, 15 May 2020 01:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feYpAh4wghkb; Fri, 15 May 2020 01:01:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8E94787BB0;
	Fri, 15 May 2020 01:01:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BA4BC0863;
	Fri, 15 May 2020 01:01:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2942C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 01:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BFA2487526
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 01:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ptOUUYtXfMy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 01:01:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7A96087BB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2020 01:01:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id CA3CD14DD553C;
 Thu, 14 May 2020 18:01:32 -0700 (PDT)
Date: Thu, 14 May 2020 18:01:32 -0700 (PDT)
Message-Id: <20200514.180132.1153550322947224128.davem@davemloft.net>
To: frextrite@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200514180102.26425-2-frextrite@gmail.com>
References: <20200514180102.26425-1-frextrite@gmail.com>
 <20200514180102.26425-2-frextrite@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 14 May 2020 18:01:33 -0700 (PDT)
Cc: sfr@canb.auug.org.au, paulmck@kernel.org,
 syzbot+1519f497f2f9f08183c6@syzkaller.appspotmail.com, yoshfuji@linux-ipv6.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 madhuparnabhowmik10@gmail.com, cai@lca.pw, kuba@kernel.org,
 joel@joelfernandes.org, kuznet@ms2.inr.ac.ru,
 linux-kernel-mentees@lists.linuxfoundation.org, kaber@trash.net
Subject: Re: [Linux-kernel-mentees] [PATCH net v2 2/2] ipmr: Add lockdep
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

From: Amol Grover <frextrite@gmail.com>
Date: Thu, 14 May 2020 23:31:03 +0530

> During the initialization process, ipmr_new_table() is called
> to create new tables which in turn calls ipmr_get_table() which
> traverses net->ipv4.mr_tables without holding the writer lock.
> However, this is safe to do so as no tables exist at this time.
> Hence add a suitable lockdep expression to silence the following
> false-positive warning:
> 
> =============================
> WARNING: suspicious RCU usage
> 5.7.0-rc3-next-20200428-syzkaller #0 Not tainted
> -----------------------------
> net/ipv4/ipmr.c:136 RCU-list traversed in non-reader section!!
> 
> ipmr_get_table+0x130/0x160 net/ipv4/ipmr.c:136
> ipmr_new_table net/ipv4/ipmr.c:403 [inline]
> ipmr_rules_init net/ipv4/ipmr.c:248 [inline]
> ipmr_net_init+0x133/0x430 net/ipv4/ipmr.c:3089
> 
> Fixes: f0ad0860d01e ("ipv4: ipmr: support multiple tables")
> Reported-by: syzbot+1519f497f2f9f08183c6@syzkaller.appspotmail.com
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Amol Grover <frextrite@gmail.com>

Applied.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
