Return-Path: <SRS0=gjYE=ND=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC16C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 10:55:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 767D560F11
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 10:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 767D560F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35136404D8;
	Thu, 12 Aug 2021 10:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DylQsrRLd3Aj; Thu, 12 Aug 2021 10:55:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3452B40538;
	Thu, 12 Aug 2021 10:55:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0503CC0010;
	Thu, 12 Aug 2021 10:55:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E361BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 10:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD3EE80C79
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 10:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ccvna3fdpAT3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 10:55:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1070580C77
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 10:55:49 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id q2so6742438plr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eq9Xh1F7xdY3qhY4IzprUVHF5yW7bLehYY5/rO8uEeA=;
 b=GJOkBGonE+ybwwOlKpANl+y0qg5PXXeou55G7E5sGB25X97XoOQ54LoA0xAFS2XrFC
 kY2LA0BtFa1QII2X6O8kmiuleMpLKt7ZG+ABldp3wLqx7gDKO+IOg+TwxZ5fz9zm2GU/
 rpGNu1dVjC115xDXeTe3zAKYLpHiySWQod3s4pcIBxvaeoq/DB7rjcgVcDhsFAuFk4UA
 ix0yacAO1vOLUllzUvR4aRHLEgW9bFxzz6tYtqRrEpQXizwYkW+/uw+ygQvsC6W7Mkd6
 ACo1KAebCYYIcgxHraY6s1qTf8mhVDcroXpkRvK2EwWTNJzdYPXYVcEbtbYxlge/7dsJ
 LdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eq9Xh1F7xdY3qhY4IzprUVHF5yW7bLehYY5/rO8uEeA=;
 b=Z4YW0Avuxuegl/xCco15OX+UPsW4pZu6PP+D71LUnXIlHn65uwjKkL93noPn7M6xXy
 vu0v89ifFShTvdL3kJKjqUkgIH50kagw5P4X9pOEBgdyXlKdl5BGgnVhP72hBgs0ihkO
 gQrn1dFc/9lxvGCpsrtZfmo3vL32VAJ7EDgzydWHzK028w8fM1NltnoPJr7LiXbdbm9o
 jsT9R7LssZIrn34BIjr5SAgwfduhW2JYX9zLOSc7BD88jmqeFLw8hmMtFASb7/R+D16l
 ZkV/KfFPocrJFhW3mxkr87ZvCLHTM2S+bH8pNq8hVoOCVoPgpZuWEdZJ5ulN0AbYMvJj
 A+HA==
X-Gm-Message-State: AOAM531+1a6tD7RAISgJA0/8nvganFfczyU+Ea7k4Mvwhqqirq1cHVIf
 ot+4hWoTvdYN2Da8n4XnLIM=
X-Google-Smtp-Source: ABdhPJyb+lVLZvTwmpYzxubeLGi3KVZEZfje3QngJArxyahIJNOVk58p4KTNvs4FIxI9O7eornU8xA==
X-Received: by 2002:a17:902:bf48:b0:12d:8409:48ca with SMTP id
 u8-20020a170902bf4800b0012d840948camr680721pls.9.1628765749254; 
 Thu, 12 Aug 2021 03:55:49 -0700 (PDT)
Received: from uver-laptop ([2405:201:6006:a148:da50:248a:1651:e22d])
 by smtp.gmail.com with ESMTPSA id j5sm3219757pgg.41.2021.08.12.03.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 03:55:48 -0700 (PDT)
Date: Thu, 12 Aug 2021 16:25:37 +0530
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] PCI: Remove duplicate #ifdef in pci_try_set_mwi()
Message-ID: <20210812105537.GA9541@uver-laptop>
References: <20210811234601.341947-1-utkarshverma294@gmail.com>
 <YRTEcd0S2/2XlL7p@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YRTEcd0S2/2XlL7p@kroah.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Thu, Aug 12, 2021 at 08:49:21AM +0200, Greg KH wrote:
> On Thu, Aug 12, 2021 at 05:16:01AM +0530, Utkarsh Verma wrote:
> > Remove the unnecessary #ifdef PCI_DISABLE_MWI, because pci_set_mwi()
> > performs the same check.
> > 
> > Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> > ---
> >  drivers/pci/pci.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index aacf575c15cf..7d4c7c294ef2 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -4456,11 +4456,7 @@ EXPORT_SYMBOL(pcim_set_mwi);
> >   */
> >  int pci_try_set_mwi(struct pci_dev *dev)
> >  {
> > -#ifdef PCI_DISABLE_MWI
> > -	return 0;
> > -#else
> >  	return pci_set_mwi(dev);
> > -#endif
> >  }
> >  EXPORT_SYMBOL(pci_try_set_mwi);
> 
> If this is the case, why do we even need pci_try_set_mwi()?  Why not
> just replace it with calls to pci_set_mwi() and then delete this one?

The only difference between the pci_set_mwi() and pci_try_set_mwi() is
that, pci_set_mwi() is declared as __must_check which forces return
value checking.

The reason why pci_try_set_mwi() was introduced in the first place was
because it gives the drivers both options:
(1) most of the drivers don't require checking the return value, and
they can safely ignore the errors values returned if any, so
pci_try_set_mwi() can be used.
(2) But for some of the drivers it is nice to check the return values,
and generate proper warnings for error handling. By using the
pci_set_mwi(), we force the driver for proper error checking.

So both the functions are similar but have different purposes, and it
seems a more appropriate design.
The whole argument about adding this function:
https://lore.kernel.org/linux-ide/20070404213704.224128ec.randy.dunlap@oracle.com/

Also earlier there was a patch that removed the pci_try_set_mwi() and
__must_check attribute from pci_set_mwi(), just like you wanted,
https://lore.kernel.org/linux-pci/4d535d35-6c8c-2bd8-812b-2b53194ce0ec@gmail.com/
But it was not accepted because Bjorn wasn't convinced and he also gave
the above argument and that we should not break something in the name of
cleaning it up.

But it is safe to only remove the duplicate #ifdef block inside the
pci_try_set_mwi().


Best Regards,
Utkarsh Verma
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
