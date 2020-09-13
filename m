Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A986C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 21:39:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7F18221F0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 21:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7F18221F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7F57C85D3D;
	Sun, 13 Sep 2020 21:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S5i7SpRxyxus; Sun, 13 Sep 2020 21:39:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1678D85D11;
	Sun, 13 Sep 2020 21:39:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0575FC0859;
	Sun, 13 Sep 2020 21:39:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6DD2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 21:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8311C85D11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 21:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wb8g6WKaWYwX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 21:39:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0FB7585618
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 21:39:41 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id BFEB41281E8CA;
 Sun, 13 Sep 2020 14:22:53 -0700 (PDT)
Date: Sun, 13 Sep 2020 14:39:39 -0700 (PDT)
Message-Id: <20200913.143939.859765790019703223.davem@davemloft.net>
To: anant.thazhemadam@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200913110313.4239-1-anant.thazhemadam@gmail.com>
References: <20200913110313.4239-1-anant.thazhemadam@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [2620:137:e000::1:9]);
 Sun, 13 Sep 2020 14:22:54 -0700 (PDT)
Cc: syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: fix uninit value error
	in __sys_sendmmsg
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
Date: Sun, 13 Sep 2020 16:33:13 +0530

> diff --git a/net/socket.c b/net/socket.c
> index 0c0144604f81..1e6f9b54982c 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -2398,6 +2398,7 @@ static int ___sys_sendmsg(struct socket *sock, struct user_msghdr __user *msg,
>  	struct iovec iovstack[UIO_FASTIOV], *iov = iovstack;
>  	ssize_t err;
>  
> +	memset(iov, 0, UIO_FASTIOV);
>  	msg_sys->msg_name = &address;

Did you even test this?

Seriously?

UIO_FASTIOV is the number of entries in 'iovstack', it's not the
size with would be "UIO_FASTIOV * sizeof (struct iovec)", or
even "sizeof(iovstack)"

So could you really explain to me how you tested this patch for
correctness, and for any functional or performance regressions
that may occur?

Because, once you correct that size argument to memset() we will now
have a huge memset() for _EVERY_ _SINGLE_ sendmsg() done by the
system.  And that will cause severe performance regressions for many
workloads involving networking.

This patch submission has been extremely careless on so many levels. I
sincerely wish you would take your time with these changes and not be
so lacking in the areas of testing and validation.

It is always a reg flag when a submitter doesn't even notice an
obvious compiler warning that reviewers like Greg and myself can see
even without trying to build your code changes.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
