Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD13C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 18:27:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E508522D02
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 18:27:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jirAyMKB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E508522D02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B76D486B15;
	Fri, 31 Jul 2020 18:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWOaZbsSn3BQ; Fri, 31 Jul 2020 18:27:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3290686AF4;
	Fri, 31 Jul 2020 18:27:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1836DC004F;
	Fri, 31 Jul 2020 18:27:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 676E2C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 18:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 54489886C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 18:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qqQommUnGF1J
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 18:27:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8DB7488699
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 18:27:14 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id o22so23420263qtt.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tV7sc6wflPo/OY3J/lFfg1ZRZlhKID3SNfnVWUEEij0=;
 b=jirAyMKBcEnHMUKDFUsSmCToGT23RCdr6mO7c82AJACLIFDcftcqtQv7Y0rpjSOAZa
 0Hh+Gkg0mXocP7OYRjdIhqSzcbiRWDUjAWJRAlUl4vtGGsHuEh74PRbLnc0uSwtOpuy/
 +u+c664zqSnJ3ocdEv65VSLvGtOu1+TA+Le6rXbzmPjN1kTHwfPSCstj6EusTPHr06Ew
 tdI/nddtwUQsYmraBl7AGJhzOmKShzGAPGhJiypVRfJbrcIlL6IAyoF6oM05IjxYsHb0
 HBkqvC6HByoBCfOx3KJBz8HksYdfzNIAYp7926RYYrbyoGblBM7e1pjBe8gPKE4MlaFM
 CWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tV7sc6wflPo/OY3J/lFfg1ZRZlhKID3SNfnVWUEEij0=;
 b=kaH9Ki+JbXYLmhemrNkcw2u71ibLWS5JJ2RlDCHd23jgBC2cBN9oqgzSTtusSnaHTm
 fEvbSSYhigSe/1TlKVPX5quA/hz8YW/wtb5jKf65SeLv0x3JSrUc3dOuPg97a/UenRBe
 y6xO8glY3wXGMyPu7t7wdaaX/aEARQFiNMZvqf/dojf2mJn5iofgplnETNFM0xJJxA8J
 W1bKdRmdg42+s7a2hHmLkgx0d6Xi12oSv8isipykWmnHRTOexIEI7tzW3uw0HHCRdpEo
 JxYntD8nPhljEp3djGVFFNpEGLz+BrX5CMVUXCqob0t9FyQn+XXVZ9hkplTQnwIfnORh
 6vwQ==
X-Gm-Message-State: AOAM5304akNpyl+ajio80UfmY97SjPJSCsPDKcDjM5BfUul5ipTLDUIY
 EcERwyp/ZQSfDUA6tchzEFR/qg==
X-Google-Smtp-Source: ABdhPJwzQPkhbiQL7KlW31VPxmlTv3PTAEP2UbW2gPotPOEEZgW2ADBjjJCvh6rUtEiaGporHH73jw==
X-Received: by 2002:ac8:8b3:: with SMTP id v48mr2085093qth.274.1596220033350; 
 Fri, 31 Jul 2020 11:27:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id x67sm9513983qke.136.2020.07.31.11.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 11:27:12 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1k1ZkO-002AoB-41; Fri, 31 Jul 2020 15:27:12 -0300
Date: Fri, 31 Jul 2020 15:27:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200731182712.GI24045@ziepe.ca>
References: <20200730192026.110246-1-yepeilin.cs@gmail.com>
 <20200731045301.GI75549@unreal> <20200731053306.GA466103@kroah.com>
 <20200731053333.GB466103@kroah.com>
 <20200731140452.GE24045@ziepe.ca>
 <20200731142148.GA1718799@kroah.com>
 <20200731143604.GF24045@ziepe.ca>
 <20200731171924.GA2014207@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731171924.GA2014207@kroah.com>
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

On Fri, Jul 31, 2020 at 07:19:24PM +0200, Greg Kroah-Hartman wrote:

> > I tried for a bit and didn't find a way to get even old gcc 4.4 to not
> > initialize the holes.
> 
> Odd, so it is just the "= {0};" that does not zero out the holes?

Nope, it seems to work fine too. I tried a number of situations and I
could not get the compiler to not zero holes, even back to gcc 4.4

It is not just accidental either, take this:

	struct rds_rdma_notify {
		unsigned long user_token;
		unsigned char status;
		unsigned long user_token1 __attribute__((aligned(32)));
	} foo = {0};

Which has quite a big hole, clang generates:

	movq	$0, 56(%rdi)
	movq	$0, 48(%rdi)
	movq	$0, 40(%rdi)
	movq	$0, 32(%rdi)
	movq	$0, 24(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 8(%rdi)
	movq	$0, (%rdi)

Deliberate extra instructions to fill both holes. gcc 10 does the
same, older gcc's do create a rep stosq over the whole thing.

Some fiddling with godbolt shows quite a variety of output, but I
didn't see anything that looks like a compiler not filling
padding. Even godbolt's gcc 4.1 filled the padding, which is super old.

In several cases it seems the aggregate initializer produced better
code than memset, in other cases it didn't

Without an actual example where this doesn't work right it is hard to
say anything more..

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
