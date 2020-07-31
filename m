Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BABAC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 14:11:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62F2206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 14:11:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Q6DR3qA2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D62F2206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 808A120519;
	Fri, 31 Jul 2020 14:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lkg5bLCrKCKE; Fri, 31 Jul 2020 14:11:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 92EFC2001F;
	Fri, 31 Jul 2020 14:11:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7982CC004F;
	Fri, 31 Jul 2020 14:11:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0641CC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 14:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F0AEF8769E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 14:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4o-aseloeGyU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 14:11:10 +0000 (UTC)
X-Greylist: delayed 00:06:16 by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 12277885DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 14:11:10 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id c12so13975887qtn.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 07:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=781IgXX02TRDkWHahRceQKsFXQSmPskr3l/EDT57Vi4=;
 b=Q6DR3qA2s07ap18NgbhUz2I65CJAcbZd0GqAm8NJxwCYrMe7KPboFzZXDRIW5lebPB
 oPAHJk7XUdYIt6eLnbwRK5OsrvSiHbJroVQmKedNKll7+oQTEicW2nHi4Rn6BWyBvJmc
 lEcbaN7HrczmvO3LYz4q8LcxNGlBJ3tUKlHS8B68jhZ9zFDhvmhI9wnD5QNOETP1shOL
 79KgAqq62WlRj0VUpG9xstUqwVILBIlJ7fRjPbuyu2hRjsy7UxqmSM7o55hhWvcbtFih
 IJ29FiOq3N/1C3oFhp4V5OwU8vwRHkhlq6ImCk398H1tIuyiht+hq6GxBMWm63ZYSugB
 yLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=781IgXX02TRDkWHahRceQKsFXQSmPskr3l/EDT57Vi4=;
 b=sun7J6UE7aLbKAqBW6XcrOK2IpZ6GDur9qUOZ35voyDaugTnPWWMO9e9OjWtogM7p6
 +3z7Oq5+jSNiFWJHSGkuBhkbMycIwRtt4zHbPaEFG9Vkx3A1bXtqezk55Iqh1nn7Mm4J
 FgydGjdq2He+Q+VJqdEX1WhskcuZsMllKeeXO61t9mPRxzbMxFb0GRs8Cn+NVgeJmgqp
 pyPV+qYVbQKXRgDapTNwCm6nCWC8bFe7pTDNeCW458QBfp8iqOEfcxHwBUa4lmogHrjw
 /ZKdGAXwjkiwfxdrQkVS+6iLNQUGRXAAEhdhEI9KPbrp7BUWe0efeHeYZiCUUHsbHRhb
 Tk3A==
X-Gm-Message-State: AOAM531M0uT8w+AVAwtk21QP7mzILQ3J/+tgGJVH/+FAXfbumCDjhH83
 Tu/2BZ3WY9lN4GnM2VrTUisPmXunxVR9Iw==
X-Google-Smtp-Source: ABdhPJy1g859VdHLa7g09AW4SpHkI8nxyECHbw18XD+WYQwl6Uwee6XxVPfUS5+iBrmKK+EwP4CFMA==
X-Received: by 2002:ac8:7383:: with SMTP id t3mr3755232qtp.160.1596204293590; 
 Fri, 31 Jul 2020 07:04:53 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id w27sm8432660qtv.68.2020.07.31.07.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 07:04:52 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1k1VeW-001u9f-23; Fri, 31 Jul 2020 11:04:52 -0300
Date: Fri, 31 Jul 2020 11:04:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200731140452.GE24045@ziepe.ca>
References: <20200730192026.110246-1-yepeilin.cs@gmail.com>
 <20200731045301.GI75549@unreal> <20200731053306.GA466103@kroah.com>
 <20200731053333.GB466103@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731053333.GB466103@kroah.com>
Cc: rds-devel@oss.oracle.com, Arnd Bergmann <arnd@arndb.de>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
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

On Fri, Jul 31, 2020 at 07:33:33AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jul 31, 2020 at 07:33:06AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jul 31, 2020 at 07:53:01AM +0300, Leon Romanovsky wrote:
> > > On Thu, Jul 30, 2020 at 03:20:26PM -0400, Peilin Ye wrote:
> > > > rds_notify_queue_get() is potentially copying uninitialized kernel stack
> > > > memory to userspace since the compiler may leave a 4-byte hole at the end
> > > > of `cmsg`.
> > > >
> > > > In 2016 we tried to fix this issue by doing `= { 0 };` on `cmsg`, which
> > > > unfortunately does not always initialize that 4-byte hole. Fix it by using
> > > > memset() instead.
> > > 
> > > Of course, this is the difference between "{ 0 }" and "{}" initializations.
> > 
> > Really?  Neither will handle structures with holes in it, try it and
> > see.
> 
> And if true, where in the C spec does it say that?

The spec was updated in C11 to require zero'ing padding when doing
partial initialization of aggregates (eg = {})

"""if it is an aggregate, every member is initialized (recursively)
according to these rules, and any padding is initialized to zero
bits;"""

The difference between {0} and the {} extension is only that {}
reliably triggers partial initialization for all kinds of aggregates,
while {0} has a number of edge cases where it can fail to compile.

IIRC gcc has cleared the padding during aggregate initialization for a
long time. Considering we have thousands of aggregate initializers it
seems likely to me Linux also requires a compiler with this C11
behavior to operate correctly.

Does this patch actually fix anything? My compiler generates identical
assembly code in either case.

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
