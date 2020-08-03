Return-Path: <SRS0=1dzN=BN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F3AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 23:06:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A6FF20722
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 23:06:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="aQPbnrju"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A6FF20722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CC69C85DB5;
	Mon,  3 Aug 2020 23:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4SuAugF8xEW; Mon,  3 Aug 2020 23:06:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 331EF85EC1;
	Mon,  3 Aug 2020 23:06:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18491C0050;
	Mon,  3 Aug 2020 23:06:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D339DC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 23:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CD4B98453B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 23:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zp7N16S2Mdub
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 23:06:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 112FD84520
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 23:06:30 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id b79so36747663qkg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 03 Aug 2020 16:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wAUE6jUn5mAwPKG/Q4g9vNtYtEutYsrwV5EW4m6aKOU=;
 b=aQPbnrjunrUlMKPJZCkOu9GiuwLThf4AAYXaSayDvpYZIe0S0J5kWgrEUjiDBH9If6
 Nk9QNCh3nxu8CXdo+xB/HLA8CehJ2h3vX8mFXWeKtG4Ehnv/lG4XUFRHkTOmDmx2Gu+t
 isoDrdskWg1Yq4JaJ2gyFOMQASXHDC3AOHQFV8jXqTkjjMH9OISCb5l703LpOA/etz3n
 Odi5KMRaQBfXsQRPGtsPxY+h2Mu3CS08N6pHNkSCakHEE7/ei6ZPcuVPeLMgC98An320
 u+suEZDSIIjWB+8Yuby/tpgOMJBQQty/fmvjkfvWZZTaQmoN4l3AusKGnGnuiBnLxtgp
 mMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wAUE6jUn5mAwPKG/Q4g9vNtYtEutYsrwV5EW4m6aKOU=;
 b=ev8FDwfzSjyVCtBO91fQaL+deldhY30V2o0V+SiVJrB0GX/kVYCKuc9yx3SKck0din
 oMX0wTq8SSxyN7cL3ye++VHgoTwEJBtSRmqhQhvE8194jek8qCknUTxILvTwKKkXtK0t
 1kPrmCCLHSM5c+tfRQBnHdrh3rrwcufW2Kd702i2n2LLBKATYJrevCKG4sIMAneioTRD
 7uhiAa8TgXiO6Q/cyWzIpxLgYvzLv/jCSQ0d33SxVmCwG7glcOaYlz8xfVbyZHv82Dxz
 gGmBkLkevMPHWrvVuDb0/jtBklLiudGOK/3I0nPD7hsFpD/NQPCaq3SQIE7VGxsndQx/
 o1FQ==
X-Gm-Message-State: AOAM533OzpFVtKVrQoIwpVD51VwM/i0o60Hqu7ZY2rzdSvsRUTbReuWM
 MJgAZl/pIu0/3uUb3YshifSCsw==
X-Google-Smtp-Source: ABdhPJyd0Tryhkzt206/Jh2HMiFEcuAT06LpeX3boAviXZIf/eRMRzhVp8FyjqPcmsR8tNjqSdSpPA==
X-Received: by 2002:a37:649:: with SMTP id 70mr18613154qkg.318.1596495988988; 
 Mon, 03 Aug 2020 16:06:28 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id 9sm22473777qtg.4.2020.08.03.16.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 16:06:27 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1k2jXH-0039ha-72; Mon, 03 Aug 2020 20:06:27 -0300
Date: Mon, 3 Aug 2020 20:06:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joe Perches <joe@perches.com>
Message-ID: <20200803230627.GQ24045@ziepe.ca>
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
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
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

The kernel already relies on a lot of C11/C99 features and
behaviors. For instance Linus just bumped the minimum compiler version
so that C11's _Generic is usable.

Why do you think this particular part of C11 shouldn't be relied on?

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
