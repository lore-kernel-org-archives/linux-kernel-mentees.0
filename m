Return-Path: <SRS0=eSSj=BT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E46C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Aug 2020 07:04:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036B7206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Aug 2020 07:04:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbjJligg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 036B7206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C11F9884EB;
	Sun,  9 Aug 2020 07:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z06cLBnK6bCb; Sun,  9 Aug 2020 07:04:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F111F88494;
	Sun,  9 Aug 2020 07:04:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D27AAC013C;
	Sun,  9 Aug 2020 07:04:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08968C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 07:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F1CD088648
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 07:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zGWFLgq054KG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 07:04:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CA4E48851F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 07:04:48 +0000 (UTC)
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9032206C3;
 Sun,  9 Aug 2020 07:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596956688;
 bh=RXegfO8sfwtCPziOMzKjff9+mTWukqMXNBxcvA/PHQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WbjJliggcdbohvw04zRJ7b4Y/r/cKmbBRJpasZ3n26KOioJjq7UsNclBR2x1bdeDt
 xlZbQXEruW13ZQFEm4tdU81P2XkQOrQ3i7WDcpzgrxamnx1xDAOLngh0sHZGNMUP4D
 1sgz5yxpQG0vFOT6X9NqnS70c7StKKboPX/plznY=
Date: Sun, 9 Aug 2020 10:04:40 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jack Leadford <leadford.jack@gmail.com>
Message-ID: <20200809070440.GA1653394@unreal>
References: <20200731142148.GA1718799@kroah.com>
 <20200731143604.GF24045@ziepe.ca>
 <20200731171924.GA2014207@kroah.com>
 <20200801053833.GK75549@unreal> <20200802221020.GN24045@ziepe.ca>
 <fb7ec4d4ed78e6ae7fa6c04abb24d1c00dc2b0f7.camel@perches.com>
 <20200802222843.GP24045@ziepe.ca>
 <60584f4c0303106b42463ddcfb108ec4a1f0b705.camel@perches.com>
 <20200803230627.GQ24045@ziepe.ca>
 <ff066616-3bb8-b6c8-d329-7de5ab8ee982@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff066616-3bb8-b6c8-d329-7de5ab8ee982@gmail.com>
Cc: rds-devel@oss.oracle.com, Arnd Bergmann <arnd@arndb.de>,
 linux-rdma@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 linux-kernel@vger.kernel.org, Peilin Ye <yepeilin.cs@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, netdev@vger.kernel.org,
 Joe Perches <joe@perches.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] rds: Prevent kernel-infoleak
 in rds_notify_queue_get()
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

On Sat, Aug 08, 2020 at 03:57:33PM -0700, Jack Leadford wrote:
> Hello!
>
> Thanks to Jason for getting this conversation back on track.
>
> Yes: in general, {} or a partial initializer /will/ zero padding bits.
>
> However, there is a bug in some versions of GCC where {} will /not/ zero
> padding bits; actually, Jason's test program in this mail
> https://lore.kernel.org/lkml/20200731143604.GF24045@ziepe.ca/
> has the right ingredients to trigger the bug, but the GCC
> versions used are outside of the bug window. :)
>
> For more details on these cases and more (including said GCC bug), see my
> paper at:
>
> https://www.nccgroup.com/us/about-us/newsroom-and-events/blog/2019/october/padding-the-struct-how-a-compiler-optimization-can-disclose-stack-memory/
>
> Hopefully this paper can serve as a helpful reference when these cases are
> encountered in the kernel.

I read the paper and didn't find exact GCC version, only remark that it
was before GCC 7.

So my question, why is this case different from any other GCC bugs?
AFAIK, we don't add kernel code to overcome GCC bugs which exist in
specific versions, which already were fixed.

More on that, this paper talks about specific flow which doesn't exist
in the discussed patch.

Thanks
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
