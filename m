Return-Path: <SRS0=vwAy=DL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BCDC4363C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Oct 2020 21:48:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24515206DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Oct 2020 21:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24515206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA1F186FAA;
	Sun,  4 Oct 2020 21:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RlmXW-Y-KFFg; Sun,  4 Oct 2020 21:48:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 12EE186FA9;
	Sun,  4 Oct 2020 21:48:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01BE8C016F;
	Sun,  4 Oct 2020 21:48:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2EC7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 21:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DC6B784808
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 21:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwAkX_5Wjt0W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 21:48:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2F8608462A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 21:48:26 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 90DD212780A38;
 Sun,  4 Oct 2020 14:31:36 -0700 (PDT)
Date: Sun, 04 Oct 2020 14:48:23 -0700 (PDT)
Message-Id: <20201004.144823.620544782441330271.davem@davemloft.net>
To: anant.thazhemadam@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20201004205536.4734-1-anant.thazhemadam@gmail.com>
References: <20201004205536.4734-1-anant.thazhemadam@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [2620:137:e000::1:9]);
 Sun, 04 Oct 2020 14:31:36 -0700 (PDT)
Cc: jiri@resnulli.us, syzbot+69b804437cfec30deac3@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] net: team: fix memory leak in
	__team_options_register
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

From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Date: Mon,  5 Oct 2020 02:25:36 +0530

> The variable "i" isn't initialized back correctly after the first loop
> under the label inst_rollback gets executed.
> 
> The value of "i" is assigned to be option_count - 1, and the ensuing 
> loop (under alloc_rollback) begins by initializing i--. 
> Thus, the value of i when the loop begins execution will now become 
> i = option_count - 2.
> 
> Thus, when kfree(dst_opts[i]) is called in the second loop in this 
> order, (i.e., inst_rollback followed by alloc_rollback), 
> dst_optsp[option_count - 2] is the first element freed, and 
> dst_opts[option_count - 1] does not get freed, and thus, a memory 
> leak is caused.
> 
> This memory leak can be fixed, by assigning i = option_count (instead of
> option_count - 1).
> 
> Fixes: 80f7c6683fe0 ("team: add support for per-port options")
> Reported-by: syzbot+69b804437cfec30deac3@syzkaller.appspotmail.com
> Tested-by: syzbot+69b804437cfec30deac3@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>

Applied and queued up for -stable, thank you.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
