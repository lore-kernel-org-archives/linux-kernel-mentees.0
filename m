Return-Path: <SRS0=ZpoD=BI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1037C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 09:46:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B452206D4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 09:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exdMY4zA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B452206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4645822CC7;
	Wed, 29 Jul 2020 09:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0uOfgxlz6av; Wed, 29 Jul 2020 09:46:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9E95E203BB;
	Wed, 29 Jul 2020 09:46:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 848A6C0050;
	Wed, 29 Jul 2020 09:46:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99E94C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 09:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 820A68763B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 09:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2LQJOdb5tevy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 09:46:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DB1308761C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 09:46:05 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id a19so4542108qvy.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qKqsPY+0Cr+gMXTjgMZqIkPYuBQVt0J989rAmnFgmeU=;
 b=exdMY4zALaxlGmXURUoiL4WbHOj/tNkzH0Kx4srdUzkOqbr3CT19pZFQkU2LdAMebo
 7rCDri0qfWSXkeEAs7m/zfUD9Xmi5dd8uHpKLlL0Msk4rSk+HcQz2eygACEcYa8XIO6p
 1HtUVDavfa/4dFho4htY+pTGJgwqdrMliIILol9FWMlICuSI9gAopyGXGQNWABScT5dZ
 WTx5e/JOToAMvj9xej5K+J93URQYNzEF8Z1vtCfONKCq40WzXwPiOfyuhWhWyTBH7pv7
 SdsOz+t94s+MuPGEs/w30Plpxb+McqrZHne+GLkXFKtBCKpV+wbXr+wZ8//fIHhGg4ux
 XrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qKqsPY+0Cr+gMXTjgMZqIkPYuBQVt0J989rAmnFgmeU=;
 b=jZVQFRaGh0N7NJ4lEhPdLxL4wlisMPFcZ+Q4AKjUeH9AynbyJwVQaNzDIOBxWC1E46
 aFFHLzQHVlNuaktbkEMhBNoF6I5ArEI+3zctjH4xXLyZVkjJ8MRsZall37i24JH7Opf1
 2jDX6Y4q7JT2PYvl8timpcH0ATpXi/i5JnO/SI+qpbSty5FW8XCalaHDOcVQfZ2ni+4C
 oLd2lIvmWuEDyOsdwXhxC+aQUe+hn3Ny1BUHoV3xYpyqmWruiHK3rF7AhfbebJmCBylK
 Otj1LUcIRP065LpPjgWgyAgZMbYQeBUG+3D9KdrwyStSifCUu3pyXZMTqfGxwBRkU1Bd
 89CA==
X-Gm-Message-State: AOAM533o6r84LTnWqE3p+CqJjieVkJkjoylr4NYCgEjLuvME5cYDurQ7
 bw37P8XIWDbeGVWsUHvR5g==
X-Google-Smtp-Source: ABdhPJz+gwQhzTK7TSgsm4aDXkBGBvswsQhlOnR4n29OVW7eRUNdrmqXogHXIenVoNs6xjdhNdG3Nw==
X-Received: by 2002:ad4:4645:: with SMTP id y5mr32679485qvv.163.1596015964876; 
 Wed, 29 Jul 2020 02:46:04 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id c70sm902307qke.109.2020.07.29.02.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 02:46:04 -0700 (PDT)
Date: Wed, 29 Jul 2020 05:46:02 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Denis Efremov <efremov@linux.com>
Message-ID: <20200729094602.GA6026@PWN>
References: <20200728141946.426245-1-yepeilin.cs@gmail.com>
 <f80acf0f-3e7e-89c5-a00e-d5a89553f0b4@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f80acf0f-3e7e-89c5-a00e-d5a89553f0b4@linux.com>
Cc: linux-block@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Linux-kernel-mentees] [PATCH] block/floppy: Prevent
 kernel-infoleak in raw_cmd_copyout()
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

On Wed, Jul 29, 2020 at 12:18:42PM +0300, Denis Efremov wrote:
> 
> 
> On 7/28/20 5:19 PM, Peilin Ye wrote:
> > raw_cmd_copyout() is potentially copying uninitialized kernel stack memory
> > since it is initializing `cmd` by assignment, which may cause the compiler
> > to leave uninitialized holes in this structure. Fix it by using memcpy()
> > instead.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 2145e15e0557 ("floppy: don't write kernel-only members to FDRAWCMD ioctl output")
> 
> Nitpick, I would say this fix is not related to commit 2145e15e0557.

I see, I will send a v2 soon. Thank you for reviewing the patch!

Peilin Ye

> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
