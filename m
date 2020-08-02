Return-Path: <SRS0=RDF/=BM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14788C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Aug 2020 22:28:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9828206F6
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Aug 2020 22:28:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="lIf6/YNu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9828206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DB9EE84D74;
	Sun,  2 Aug 2020 22:28:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RbKt81HP6Inp; Sun,  2 Aug 2020 22:28:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6BF88844B2;
	Sun,  2 Aug 2020 22:28:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E670C0051;
	Sun,  2 Aug 2020 22:28:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C595DC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 22:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ADE12878CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 22:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fkbS2G6ySZT9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 22:28:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E7AC1878A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 22:28:45 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id d14so33651518qke.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 02 Aug 2020 15:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X2bYgTX4K3EZYIeQDAN4hcSO5LdesUSG+q6mG9kn4ys=;
 b=lIf6/YNuL/fGjujaZaoNWqjOsE+V2SxqHpXstZJx+0q2hXtLpUFUTz5JX8XdrjIX84
 nHNBhu4B25HP4PjS2WRfH/wBVJnp15ux7/z2PJT4SEWunVT30EfxZztzctwXk7QW0gTo
 9Nl0wqW9uhY/cOlHKkY2bAxXtZ8oU22wXRgsHJkYugvcXjiHns5QhPw+INH4KWhRatZ0
 Zb9IgHQCzuejMB4jCfe0cnBMXT0o2vTT+BoP48ROWLDHm99aMCb15cx9yTnjG0xA+izp
 1a2shGvPVx/c3qIncZKuA2cCSdiHnxQ4E8gu8ODnEPo0jl+X8CW+q5BGj0a6F6cDfN43
 G5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X2bYgTX4K3EZYIeQDAN4hcSO5LdesUSG+q6mG9kn4ys=;
 b=GxAmwuA6OijVeMo9w2fQhNPOzzQDVol6dScb61MYc+lDlig+tXd+2Vt4uMTb9BGMm4
 qBumGfkDQ0CBLL9XMCxZJkkl4yJFwC/Gb7J+istjvLmdWcUy5eT34uXdJxEAi7KgQNdN
 9qyo+RFRSYUEeejBWEGGSLsgZSld8P5pyh/hZeWUKXHfbmx089qNlUYnh/DzVuGoyIS3
 mQjL6RSwj93nGc7R1soHg6uvai/XWpoJoVejTfsbrmRQqZU3LP55sMbbWxDhEAo6sN5m
 eGGw3B+wzs4TEzYuGOBQRzhmjMslfghrnGRw7ipGlFoF9aAgXWeeyMd/0xw5lNs/P8C+
 d1GA==
X-Gm-Message-State: AOAM532ogWR9igBvB/EjV52ur1rH+UF1mjCpKVwDvL5hXaMtwWAhwgD8
 /2Z4yLcsh+MaIP9hazvumTDSmw==
X-Google-Smtp-Source: ABdhPJy4eXa0DseBVUfptK+ZJ5ECzRMJW3DLsqYCv1XNOKBUDhbP4IqCmIWvuu9UONvVig+CWSFdDQ==
X-Received: by 2002:a37:4c9:: with SMTP id 192mr13359614qke.125.1596407324789; 
 Sun, 02 Aug 2020 15:28:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id p33sm18333547qtp.49.2020.08.02.15.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 15:28:44 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1k2MTD-002q9U-LB; Sun, 02 Aug 2020 19:28:43 -0300
Date: Sun, 2 Aug 2020 19:28:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joe Perches <joe@perches.com>
Message-ID: <20200802222843.GP24045@ziepe.ca>
References: <20200731045301.GI75549@unreal> <20200731053306.GA466103@kroah.com>
 <20200731053333.GB466103@kroah.com>
 <20200731140452.GE24045@ziepe.ca>
 <20200731142148.GA1718799@kroah.com>
 <20200731143604.GF24045@ziepe.ca>
 <20200731171924.GA2014207@kroah.com>
 <20200801053833.GK75549@unreal> <20200802221020.GN24045@ziepe.ca>
 <fb7ec4d4ed78e6ae7fa6c04abb24d1c00dc2b0f7.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb7ec4d4ed78e6ae7fa6c04abb24d1c00dc2b0f7.camel@perches.com>
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

On Sun, Aug 02, 2020 at 03:23:58PM -0700, Joe Perches wrote:
> On Sun, 2020-08-02 at 19:10 -0300, Jason Gunthorpe wrote:
> > On Sat, Aug 01, 2020 at 08:38:33AM +0300, Leon Romanovsky wrote:
> > 
> > > I'm using {} instead of {0} because of this GCC bug.
> > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119
> > 
> > This is why the {} extension exists..
> 
> There is no guarantee that the gcc struct initialization {}
> extension also zeros padding.

We just went over this. Yes there is, C11 requires it.

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
