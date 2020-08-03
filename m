Return-Path: <SRS0=1dzN=BN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639A4C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 04:58:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F08C2068F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 04:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6qPIEgF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F08C2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5C15D2041A;
	Mon,  3 Aug 2020 04:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efBWwGoXn2XE; Mon,  3 Aug 2020 04:58:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3E7AE203A5;
	Mon,  3 Aug 2020 04:58:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31557C0051;
	Mon,  3 Aug 2020 04:58:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02337C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 04:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EC09E84D9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 04:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PV8YLEhfLhDO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 04:58:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C7D2884D74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 04:58:44 +0000 (UTC)
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5DD062068F;
 Mon,  3 Aug 2020 04:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596430724;
 bh=0wWu/yJWcJHPmm8RbF95+DdUX5G1LnDQ23Z2blw/WnY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z6qPIEgF/UKp+AlLPVIkFocBc7mvGHOXJRP678/PMve5rmyqsVTkuz9VsKK41IZ4o
 Bgw1F9OID013tKs7dEZEy+biN9BRct6FIt/kue+lSdWTS4UVyKh/nipQlhSjMABNEi
 dj1i+iPxo6xTYI7gA/KPead6eBLVxHt72ONcZb9U=
Date: Mon, 3 Aug 2020 07:58:40 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Joe Perches <joe@perches.com>
Message-ID: <20200803045840.GM75549@unreal>
References: <20200731053333.GB466103@kroah.com>
 <20200731140452.GE24045@ziepe.ca>
 <20200731142148.GA1718799@kroah.com>
 <20200731143604.GF24045@ziepe.ca>
 <20200731171924.GA2014207@kroah.com>
 <20200801053833.GK75549@unreal> <20200802221020.GN24045@ziepe.ca>
 <fb7ec4d4ed78e6ae7fa6c04abb24d1c00dc2b0f7.camel@perches.com>
 <20200802222843.GP24045@ziepe.ca>
 <60584f4c0303106b42463ddcfb108ec4a1f0b705.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60584f4c0303106b42463ddcfb108ec4a1f0b705.camel@perches.com>
Cc: rds-devel@oss.oracle.com, Arnd Bergmann <arnd@arndb.de>,
 linux-rdma@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 linux-kernel@vger.kernel.org, Peilin Ye <yepeilin.cs@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
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

On Sun, Aug 02, 2020 at 03:45:40PM -0700, Joe Perches wrote:
> On Sun, 2020-08-02 at 19:28 -0300, Jason Gunthorpe wrote:
> > On Sun, Aug 02, 2020 at 03:23:58PM -0700, Joe Perches wrote:
> > > On Sun, 2020-08-02 at 19:10 -0300, Jason Gunthorpe wrote:
> > > > On Sat, Aug 01, 2020 at 08:38:33AM +0300, Leon Romanovsky wrote:
> > > >
> > > > > I'm using {} instead of {0} because of this GCC bug.
> > > > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119
> > > >
> > > > This is why the {} extension exists..
> > >
> > > There is no guarantee that the gcc struct initialization {}
> > > extension also zeros padding.
> >
> > We just went over this. Yes there is, C11 requires it.
>
> c11 is not c90.  The kernel uses c90.

It is not accurate, kernel uses gnu89 dialect, which is C90 with some
C99 features [1]. In our case, we rely on GCC extension {} that doesn't
contradict standart [2] and fills holes with zeros too.

[1] Makefile:500
   496 KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
   497                    -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
   498                    -Werror=implicit-function-declaration -Werror=implicit-int \
   499                    -Wno-format-security \
   500                    -std=gnu89

[2] From GCC:
https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
"When a base standard is specified, the compiler accepts all programs
following that standard plus those using GNU extensions that do not
contradict it."

Thanks

>
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
