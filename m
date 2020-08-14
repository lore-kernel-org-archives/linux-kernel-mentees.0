Return-Path: <SRS0=D2Vm=BY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7905C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Aug 2020 17:07:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CF8E20774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Aug 2020 17:07:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SAuPo0kB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CF8E20774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38A6488ABD;
	Fri, 14 Aug 2020 17:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dW1rkpKdoSoD; Fri, 14 Aug 2020 17:07:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6252888A9E;
	Fri, 14 Aug 2020 17:07:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52B37C07FF;
	Fri, 14 Aug 2020 17:07:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CF2FC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 17:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 842C525E37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 17:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FC36d7OiDfRQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 17:07:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 9F03B25048
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 17:07:11 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id f19so2935731qtp.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9dxlpovzJD+TOEGVVjsD+xHktzeJbFiQKOPQEqkZM9M=;
 b=SAuPo0kB4++laPCsa/UJIFJ7sqnHBPnVC3kGXEza9f04NT29/1K9uJRiw/r7EK5U5u
 zO/yYdx38sU0we9d3cmvxhWEZKc5X6nwQ/XjLLeohAaIKY06PuBJaqR1trbDdIYnsGTH
 08eXLh8G+WR8e7CRlVIWWg1gEoZlYpFZ7hcOUzARI4KKmlviDtCF6F18vHxsBasvE2t6
 wAfTnGKPlE22dFrFIEH3weBYO2fU04//eTyCHDLLU0FvqwcgyhvTr+Y77w5T9pNVui0I
 fqiFrISZhNZ6ri+OWInsJI2CF2gs+c3eTR46kGxaCeZCwXLm7ay2e+mDwN+n2xutul2m
 3UYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9dxlpovzJD+TOEGVVjsD+xHktzeJbFiQKOPQEqkZM9M=;
 b=okOUv6cBmbQiIioZmxZpNbjhNuOMJ230Jwp+YF0roBj/yvEwpT4MKK4i9c302sltnD
 e2pR76OedlJ9fQgNDavDKQQp5/op7/SeOD+MgllVwiRH57CF2RnUdz0fT2rTtwSh+Bv2
 RcC3lEb+HZvbkwmSYhBXX7cxkQFxmh36Q+IR/4DQ2yd71Jk8d96Fz28n0ZvTMsz3IxD4
 qdC9SBqWqv/UYWsxo6KbcVGYiJJrlzV0TmHONe2cdxfDlsrnByVnzI+oAI1LtAF2hoE3
 LhDrDXfq8wujm8UOvtT3x4uVQNQFrkNO4ZmcY0AaAQmV5WgvoJaWQfpYNWyL2ub+tQmd
 I4wQ==
X-Gm-Message-State: AOAM5305UFhIh0N+wdY1oR9xMZmGEXALGYrUu2erGjikpNxReZQpQ9l4
 hP9Vwk660qd7BcwJhVSIG3gctg==
X-Google-Smtp-Source: ABdhPJxtxR/DpDD2wqT6cjrvAzJOAgKL557tPYvsOhNta+6vq5T+QXPHbnmTF7MBntLVhE9sMcpbrg==
X-Received: by 2002:aed:33e7:: with SMTP id v94mr2860210qtd.18.1597424829705; 
 Fri, 14 Aug 2020 10:07:09 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id x29sm10363864qtv.80.2020.08.14.10.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 10:07:08 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1k6dAZ-006l92-QG; Fri, 14 Aug 2020 14:07:07 -0300
Date: Fri, 14 Aug 2020 14:07:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jack Leadford <leadford.jack@gmail.com>
Message-ID: <20200814170707.GV24045@ziepe.ca>
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
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Joe Perches <joe@perches.com>, Jakub Kicinski <kuba@kernel.org>,
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

It seems fine, at least Godbolt doesn't show a bug with that code.

Can you share the test that does fail?

This seems like the sort of security sensitive bug that should be
addressed in gcc, not worked around in the kernel code :\

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
