Return-Path: <SRS0=BcdZ=BV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3007CC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 17:13:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEC0C2076B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 17:13:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4l35cES"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEC0C2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B9FE3861A3;
	Tue, 11 Aug 2020 17:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCPyzgd92cSz; Tue, 11 Aug 2020 17:13:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67F8D86199;
	Tue, 11 Aug 2020 17:13:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 456B5C013C;
	Tue, 11 Aug 2020 17:13:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B22C2C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 17:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9F36B87D80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 17:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JY-ejK9xo++1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 17:13:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3CB1F87A18
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 17:13:18 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y6so7116092plt.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 10:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ccr1YG+uUavAc3BLSL6SyQAEXgA3SXQDKm+kKYhlM4w=;
 b=B4l35cESUVYYiGVibTB5Elvb0Gb9x+ZC/jCg8YfKLSGYU6rStZqtdsKrksLZW5+IQ+
 7Boe6neBR0hw3PY+uHysGSMEEbbpgR4wLLmB9y+MLOwk/DGRP8K8e9Kzv3fkCMXL109E
 PSYFGr8Kn8xZ9NA2iWFBhLOexL5UZL4t8jxhy7DrS/c5fmgvHDkl2vxwYzfdNEj1pnzB
 1J5B6BrerOLONvlRt+83DBxVhMjiJBk1O51swkWdRODkFJS74XnGh4sHtkznOhvrLGag
 HqSUZMSMCro1F5ZOEsH4C3zYYCS9pQ68NEa4b2nDKitTTdTglq5nx4Ds52O1WtH/Uz8D
 GnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ccr1YG+uUavAc3BLSL6SyQAEXgA3SXQDKm+kKYhlM4w=;
 b=uM8VhVcxO/fokmdH/WhVfr0bgf1NPsXAY9M5ejw52Phbb8ScCdGddCXdvrqRfF4or2
 r9++sjgyXPpi+fCvJwAC7vVejKyoz/699uWNj7eZu+zYRmNTzC7UcAdaE82FYQ/86cx1
 CU8jIngHq/AaRW/iLqlo3SKlqInRpyD8Ad0c67xD3ui+mUp9WzIRAh2nfPJk3Og8lzTm
 KgSN7uW0C8eX8zlzicPJldnSgkTwFwW0M0uL5gbNBk9xm42srJc5T7uCWl2st7kNg54Y
 z6TYJFW46aEnkeHsSeLlNaJC+PlZ2ZCllnThLa4yw9zfjkmhZY3neQhLvX5zrF4vuUl3
 kZjg==
X-Gm-Message-State: AOAM531ZohaztdAnU1PNp8C3lkHjHYh31lRnkwdW0bXa16N6vDFpCbsF
 hJSjv4CAEVfG46WQo18zBrg=
X-Google-Smtp-Source: ABdhPJy800tC/x7FlqOOxjMO4tBXPXzIbpWJ/iVl4flqCxZo9vvRRlR0CoKLAPFwfKhKRVvpFii0tg==
X-Received: by 2002:a17:902:b111:: with SMTP id
 q17mr1704052plr.202.1597165997683; 
 Tue, 11 Aug 2020 10:13:17 -0700 (PDT)
Received: from arch ([27.255.176.246])
 by smtp.gmail.com with ESMTPSA id y20sm26228569pfn.183.2020.08.11.10.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 10:13:16 -0700 (PDT)
Date: Tue, 11 Aug 2020 22:43:08 +0530
From: Puranjay Mohan <puranjay12@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20200811171308.GA69827@arch>
References: <20200810182107.18577-1-puranjay12@gmail.com>
 <20200811103640.19d3121a@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811103640.19d3121a@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Driver-API: Documentation:
 Replace deprecated :c:func: Usage
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

On Tue, Aug 11, 2020 at 10:36:40AM -0600, Jonathan Corbet wrote:
> On Mon, 10 Aug 2020 23:51:07 +0530
> Puranjay Mohan <puranjay12@gmail.com> wrote:
> 
> > Replace :c:func: with func() as the previous usage is deprecated.
> > 
> > Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> > ---
> >  Documentation/driver-api/device-io.rst | 22 +++++++++++-----------
> >  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> I applied this patch from you in early July, and it's in mainline now...?
this is a new patch with same name I think?, this is not that patch.
> 

> jon

thanks,
puranjay
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
