Return-Path: <SRS0=/TfH=DE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D896DC4346E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 27 Sep 2020 19:35:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BA7D2311C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 27 Sep 2020 19:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BA7D2311C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CBEDE860CE;
	Sun, 27 Sep 2020 19:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HMlpsV81fqYk; Sun, 27 Sep 2020 19:35:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 89AC48575A;
	Sun, 27 Sep 2020 19:35:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6429AC016F;
	Sun, 27 Sep 2020 19:35:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1943C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Sep 2020 19:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D9AE085631
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Sep 2020 19:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gv4BgTeWr3k6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Sep 2020 19:35:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E45C885624
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Sep 2020 19:35:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.77,311,1596492000"; d="scan'208";a="469742917"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2020 21:35:32 +0200
Date: Sun, 27 Sep 2020 21:35:32 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
In-Reply-To: <983c49ebe4bbe0435a73d25cd8525764a4f8adac.camel@perches.com>
Message-ID: <alpine.DEB.2.22.394.2009272132110.2839@hadrien>
References: <87r1qqvo2d.fsf@nanos.tec.linutronix.de>
 <a53048f738dacc1c58654eb94e229de79d4f94c2.camel@perches.com>
 <alpine.DEB.2.22.394.2009271907270.2839@hadrien>
 <983c49ebe4bbe0435a73d25cd8525764a4f8adac.camel@perches.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Cc: Giuseppe Scrivano <gscrivan@redhat.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
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



On Sun, 27 Sep 2020, Joe Perches wrote:

> On Sun, 2020-09-27 at 19:08 +0200, Julia Lawall wrote:
> > I end up with 208 patches.  I'm not sure that sending them all at once
> > would be a good idea...
>
> Last I looked the diffstat for comma -> semicolon was:
>
> 234 files changed, 509 insertions(+), 509 deletions(-)
>
> So it would be nearly 1 patch per individual file,

I have 282 files.

>
> Greg KH does send hundreds of patches for -stable at a time.
>
> So, maybe or maybe not send them all at once.
> Maybe send it in batches of 25 or so.
>
> There's no single right way to do this.
>
> Maybe put up a git tree somewhere and let the
> kernel-robot test compilation.

I compiled all but about 15 and checked those 15 an extra time.

I'll try the small batch approach to get started.

thanks,
julia

> (A nicety might be for the kernel-robot to have some
>  option to test pre and post compilation object code
>  differences with an optional report)
>
> When I automated 491 patches for /* fallthrough */ to
> fallthrough;, the robot caught a couple problems which
> was great.
>
> https://repo.or.cz/linux-2.6/trivial-mods.git/shortlog/refs/heads/20200310_fallthrough_2
>
> I only posted the first ~30 patches though with
> about 50% acceptance. Gustavo Silva picked up the
> effort and did a great job.  Eventually, a single
> treewide patch was posted and accepted by Linus for
> this though after dozens of individual patches went
> through various maintainer trees:
>
> $ git log --shortstat -1 df561f6688fe
> commit df561f6688fef775baa341a0f5d960becd248b11
> Author: Gustavo A. R. Silva <gustavoars@kernel.org>
> Date:   Sun Aug 23 17:36:59 2020 -0500
>
>     treewide: Use fallthrough pseudo-keyword
>
>     Replace the existing /* fall through */ comments and its variants with
>     the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
>     fall-through markings when it is the case.
>
>     [1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=>
>
>     Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
>  1148 files changed, 2667 insertions(+), 2737 deletions(-)
>
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
