Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09038C83F11
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Aug 2023 09:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CD82415EA;
	Mon, 28 Aug 2023 09:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CD82415EA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fbOYFG75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLz-6PamXjLu; Mon, 28 Aug 2023 09:11:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1A5CF409F2;
	Mon, 28 Aug 2023 09:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A5CF409F2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F27D8C0071;
	Mon, 28 Aug 2023 09:11:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7B49C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 09:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE29A4053F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 09:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE29A4053F
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=fbOYFG75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7M5zMcHsW9IY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 09:11:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DA66402F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 09:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DA66402F5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF22960F59;
 Mon, 28 Aug 2023 09:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2364C433C7;
 Mon, 28 Aug 2023 09:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1693213896;
 bh=eUqeVQREvamINg0qpOLldb9GpOoBTq89jsyCq2h3JCM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fbOYFG75Xe/LvyM98CE188KL/eq3TxV6V1hfnbwruqa1nrelJIyqr+W0C7tOyjXsn
 MumRrZ66hAOFnjHIonngnSQ699P9J9bBjWl/1Y4slm6UNoIfEKe+nuPO7rExm2wDVs
 eagRs4KonA1jk7mg9EpCAAbRC/nryYgpVROXwYgc=
Date: Mon, 28 Aug 2023 11:11:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anshul <anshulusr@gmail.com>
Subject: Re: [PATCH] fixed formatting issues
Message-ID: <2023082801-cost-radiance-95fa@gregkh>
References: <20230828071829.64366-1-anshulusr@gmail.com>
 <2023082827-craftily-citric-06fa@gregkh>
 <CAPwwkU7+zHo2jpt+ovJDE1ca=K8AKyowyA5Z9pOFAy6iifVEwA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPwwkU7+zHo2jpt+ovJDE1ca=K8AKyowyA5Z9pOFAy6iifVEwA@mail.gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org,
 ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, mattst88@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Aug 28, 2023 at 01:54:41PM +0530, Anshul wrote:
> Hello Greg,
> 
> > - Your patch did many different things all at once, making it difficult
> >   to review.  All Linux kernel patches need to only do one thing at a
> >   time.  If you need to do multiple things (such as clean up all coding
> >   style issues in a file/driver), do it in a sequence of patches, each
> >   one doing only one thing.  This will make it easier to review the
> >   patches to ensure that they are correct, and to help alleviate any
> >   merge issues that larger patches can cause.
> 
> I believe that splitting the patch is not necessary in this instance since
> the changes are localized and trivial to reason about.

That's up to the maintainer to decide.

> > - You did not write a descriptive Subject: for the patch, allowing
> >   everyone, to know what this patch is all about.  Please read the
> >   section entitled "The canonical patch format" in the kernel file,
> >   Documentation/process/submitting-patches.rst for what a proper
> >   Subject: line should look like.
> 
> As per the feedback, the updated patch has incorporated the changes.

Why are you changing coding style issues in this portion of the kernel?
Do you have this hardware to test with?

Normally coding style cleanups like this are only allowed in the
drivers/staging/* portion of the kernel.  Unless you get approval from
the maintainer of the subsystem you are changing, I wouldn't work on
this as it's generally considered bad form.

> > - It looks like you did not use your "real" name for the patch on either
> >   the Signed-off-by: line, or the From: line (both of which have to
> >   match).  Please read the kernel file,
> >   Documentation/process/submitting-patches.rst for how to do this
> >   correctly.
> 
> I have verified that the Signed-off-by: line and the From: line contain the
> same content.

Your name is only 1 word?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
