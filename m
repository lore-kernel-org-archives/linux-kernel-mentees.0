Return-Path: <SRS0=/TfH=DE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0814C4346E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 27 Sep 2020 19:40:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F00EF207D8
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 27 Sep 2020 19:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F00EF207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9D64485109;
	Sun, 27 Sep 2020 19:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcWoGYZAWRMP; Sun, 27 Sep 2020 19:40:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1DD76850EA;
	Sun, 27 Sep 2020 19:40:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1151DC016F;
	Sun, 27 Sep 2020 19:40:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FD1CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Sep 2020 19:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5490785109
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Sep 2020 19:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xrAI8MuKAYZI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Sep 2020 19:40:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0206.hostedemail.com
 [216.40.44.206])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 39413850EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Sep 2020 19:40:54 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id E4054181660ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Sep 2020 17:45:50 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 7921C1730858;
 Sun, 27 Sep 2020 17:45:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: cry47_3d0f42d2717a
X-Filterd-Recvd-Size: 3344
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf10.hostedemail.com (Postfix) with ESMTPA;
 Sun, 27 Sep 2020 17:45:46 +0000 (UTC)
Message-ID: <983c49ebe4bbe0435a73d25cd8525764a4f8adac.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 27 Sep 2020 10:45:45 -0700
In-Reply-To: <alpine.DEB.2.22.394.2009271907270.2839@hadrien>
References: <87r1qqvo2d.fsf@nanos.tec.linutronix.de>
 <a53048f738dacc1c58654eb94e229de79d4f94c2.camel@perches.com>
 <alpine.DEB.2.22.394.2009271907270.2839@hadrien>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: Giuseppe Scrivano <gscrivan@redhat.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 lkp <lkp@intel.com>, kernelnewbies <kernelnewbies@kernelnewbies.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, cocci <cocci@systeme.lip6.fr>,
 Andy Whitcroft <apw@shadowen.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Linux-kernel-mentees] [Cocci] coccinelle: Convert comma to
 semicolons (was Re: [PATCH] checkpatch: Add test for comma use that should
 be semicolon)
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

On Sun, 2020-09-27 at 19:08 +0200, Julia Lawall wrote:
> I end up with 208 patches.  I'm not sure that sending them all at once
> would be a good idea...

Last I looked the diffstat for comma -> semicolon was:

234 files changed, 509 insertions(+), 509 deletions(-)

So it would be nearly 1 patch per individual file,

Greg KH does send hundreds of patches for -stable at a time.

So, maybe or maybe not send them all at once.
Maybe send it in batches of 25 or so.

There's no single right way to do this.

Maybe put up a git tree somewhere and let the
kernel-robot test compilation.

(A nicety might be for the kernel-robot to have some
 option to test pre and post compilation object code
 differences with an optional report)

When I automated 491 patches for /* fallthrough */ to
fallthrough;, the robot caught a couple problems which
was great.

https://repo.or.cz/linux-2.6/trivial-mods.git/shortlog/refs/heads/20200310_fallthrough_2

I only posted the first ~30 patches though with
about 50% acceptance. Gustavo Silva picked up the
effort and did a great job.  Eventually, a single
treewide patch was posted and accepted by Linus for
this though after dozens of individual patches went
through various maintainer trees:

$ git log --shortstat -1 df561f6688fe
commit df561f6688fef775baa341a0f5d960becd248b11
Author: Gustavo A. R. Silva <gustavoars@kernel.org>
Date:   Sun Aug 23 17:36:59 2020 -0500

    treewide: Use fallthrough pseudo-keyword
    
    Replace the existing /* fall through */ comments and its variants with
    the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
    fall-through markings when it is the case.
    
    [1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=>
    
    Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

 1148 files changed, 2667 insertions(+), 2737 deletions(-)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
