Return-Path: <SRS0=/sBJ=4M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD2AC35671
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Feb 2020 12:25:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A90A2072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Feb 2020 12:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A90A2072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E666384AE2;
	Mon, 24 Feb 2020 12:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ls-ujcxpr8L8; Mon, 24 Feb 2020 12:25:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 96449848ED;
	Mon, 24 Feb 2020 12:25:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75DEEC18DA;
	Mon, 24 Feb 2020 12:25:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33D40C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 12:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 12C6620478
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 12:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SdIMjcYoqfAn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 12:25:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by silver.osuosl.org (Postfix) with ESMTPS id 7BCCE2046B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 12:25:17 +0000 (UTC)
Received: from ip5f5bf7ec.dynamic.kabel-deutschland.de ([95.91.247.236]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1j6CnI-0002AG-1u; Mon, 24 Feb 2020 12:25:04 +0000
Date: Mon, 24 Feb 2020 13:25:03 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200224122503.2m4oc5wgg2oqpjsi@wittgenstein>
References: <20200222001513.43099-1-colin.king@canonical.com>
 <20200222121801.cu4dfnk4z5xd5uc2@wittgenstein>
 <20200224073157.GB3286@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224073157.GB3286@kadam>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Colin King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org, Ingo Molnar <mingo@kernel.org>,
 Christian Brauner <christian@brauner.io>
Subject: Re: [Linux-kernel-mentees] [PATCH][next] clone3: fix an unsigned
 args.cgroup comparison to less than zero
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

On Mon, Feb 24, 2020 at 10:31:57AM +0300, Dan Carpenter wrote:
> On Sat, Feb 22, 2020 at 01:18:01PM +0100, Christian Brauner wrote:
> > On Sat, Feb 22, 2020 at 12:15:13AM +0000, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index 2diff --git a/kernel/fork.c b/kernel/fork.c
> > index 2853e258fe1f..dca4dde3b5b2 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -2618,7 +2618,8 @@ noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
> >                      !valid_signal(args.exit_signal)))
> >                 return -EINVAL;
> > 
> > -       if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
> > +       if ((args.flags & CLONE_INTO_CGROUP) &&
> > +           (args.cgroup > INT_MAX || (s64)args.cgroup < 0))
> 
> If we're capping it at INT_MAX then the check for negative isn't
> required and static analysis tools know it's not so they might complain.

It isn't, but it's easier to understand for the reader. But I don't care
that much and if it's trouble for tools than fine.

Christian
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
