Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56B2C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 14:36:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6652177B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 14:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WqzSmsye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D6652177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 16583886A4;
	Fri, 31 Jul 2020 14:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8i6R4x43nAJ; Fri, 31 Jul 2020 14:36:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 624AE886A9;
	Fri, 31 Jul 2020 14:36:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BF52C004F;
	Fri, 31 Jul 2020 14:36:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E477DC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 14:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D9ED986AE1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 14:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mk0T5tdytkXM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 14:36:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8338986AE6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 14:36:06 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id x12so14557646qtp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 07:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q2m6QpaxCYFHVPlZEL2+5vv7eGY3gqCOfKrXEclIKvs=;
 b=WqzSmsye5HX9Zz23lh8/+PVQcQMOQwg6Hy3llCpDM+deJ1FPxUx1i/9hg4A/nFiiLh
 FPIcAFcl9UMuh8abfDQQmHlrrCDn5pI0jGNii4rCGD+4SP+XNUHvmZJX9NjktFx5A9ho
 j6VHCU0Mz/mF16KABA66xrQkGGmWxITe9pIPciK5xwmRNc8cD1sDYuDFld4lJZQb7OAq
 Nu2ps7V47GIjqIzBWXdsqTqMRjlgqqRypzT8WtpzLI+xleTXxtPXTQ0lqYp3/aWUZxmz
 FoNU8CwcQ3eeFVpmh2AUqS7tdwFM9jBWAHbT2vXrnJR+grWPZgSWfOeMhRWj0jHLpfv8
 K5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q2m6QpaxCYFHVPlZEL2+5vv7eGY3gqCOfKrXEclIKvs=;
 b=RRm6NxKUZsp6DCOVMMMgjIce0WD5BwkM1z2cK8GvGFrUSna25c0YA3/2NDsi64pCHd
 tA7L42dnAfr3z+g7QKC029Qvd3bm1mPycfuw5fF7th9NnW6AjXg58++5cclQUkUOGU8t
 1cr6NOS6n6fuQBJwl9UDm/OsX1TYpD7hPkPq1Kv6ME0vDrSsLjiZxPZnww+hbCpAc8lt
 bJLm4lpoPJZuw/u2QkcsOaTAdqHo76Za6ZO7iVEd5OfC3vW9XwpyfwcJnNd7zPOum6eC
 sVzu0V+LOuht+7c8j+gNY519yc/bYg9Z1EQBZhGo/22o/4Hv9fMaj1AVfthFewDI8k+v
 TRfQ==
X-Gm-Message-State: AOAM531qff5YWPPB09uZr5PKGSzBuzbeiAYUZ/Wa+AmS77DCwtZt072M
 mYZncHD4FxPYMuTMHDYP1a2Kjw==
X-Google-Smtp-Source: ABdhPJxEL/OfhyQEkNLYkey/a7yMnab6C8+sylRgEPWKF2YcNOLc+iOfeiEiufgz9Qt5u9olATqJ4A==
X-Received: by 2002:ac8:7b85:: with SMTP id p5mr3994935qtu.196.1596206165402; 
 Fri, 31 Jul 2020 07:36:05 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id q4sm7988142qkm.78.2020.07.31.07.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 07:36:04 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1k1W8i-001uoa-2Q; Fri, 31 Jul 2020 11:36:04 -0300
Date: Fri, 31 Jul 2020 11:36:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200731143604.GF24045@ziepe.ca>
References: <20200730192026.110246-1-yepeilin.cs@gmail.com>
 <20200731045301.GI75549@unreal> <20200731053306.GA466103@kroah.com>
 <20200731053333.GB466103@kroah.com>
 <20200731140452.GE24045@ziepe.ca>
 <20200731142148.GA1718799@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731142148.GA1718799@kroah.com>
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

On Fri, Jul 31, 2020 at 04:21:48PM +0200, Greg Kroah-Hartman wrote:

> > The spec was updated in C11 to require zero'ing padding when doing
> > partial initialization of aggregates (eg = {})
> > 
> > """if it is an aggregate, every member is initialized (recursively)
> > according to these rules, and any padding is initialized to zero
> > bits;"""
> 
> But then why does the compilers not do this?

Do you have an example?

> > Considering we have thousands of aggregate initializers it
> > seems likely to me Linux also requires a compiler with this C11
> > behavior to operate correctly.
> 
> Note that this is not an "operate correctly" thing, it is a "zero out
> stale data in structure paddings so that data will not leak to
> userspace" thing.

Yes, not being insecure is "operate correctly", IMHO :)
 
> > Does this patch actually fix anything? My compiler generates identical
> > assembly code in either case.
> 
> What compiler version?

I tried clang 10 and gcc 9.3 for x86-64.

#include <string.h>

void test(void *out)
{
	struct rds_rdma_notify {
		unsigned long user_token;
		unsigned int status;
	} foo = {};
	memcpy(out, &foo, sizeof(foo));
}

$ gcc -mno-sse2 -O2 -Wall -std=c99 t.c -S

test:
	endbr64
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	ret

Just did this same test with gcc 4.4 and it also gave the same output..

Made it more complex with this:

	struct rds_rdma_notify {
		unsigned long user_token;
		unsigned char status;
		unsigned long user_token1;
		unsigned char status1;
		unsigned long user_token2;
		unsigned char status2;
		unsigned long user_token3;
		unsigned char status3;
		unsigned long user_token4;
		unsigned char status4;
	} foo;

And still got the same assembly vs memset on gcc 4.4.

I tried for a bit and didn't find a way to get even old gcc 4.4 to not
initialize the holes.

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
