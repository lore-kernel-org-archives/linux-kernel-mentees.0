Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BCBC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 10:26:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B84520714
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 10:26:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl1MZrCA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B84520714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DC27D85D4C;
	Mon, 27 Jul 2020 10:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJvJ2usYb64x; Mon, 27 Jul 2020 10:26:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 58876854E0;
	Mon, 27 Jul 2020 10:26:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D7A4C004F;
	Mon, 27 Jul 2020 10:26:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA7BFC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 10:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C363987F78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 10:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8hxKsQb32Eu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 10:26:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 17C8087F52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 10:26:29 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id i92so1355523pje.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 03:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mIbgqGp5MHZMjDC7erbJ1Rt5TOVChIklfPVrDvY14LE=;
 b=Hl1MZrCAMbdwuH66+INdibLCKo1F5WaU6Wzbw1CxFVM2/CC6eXpakmuU2zctfwPKUA
 iXI3IKDljPUoa9TZLpOUEi6bnEWomQyorlKflg3VEU1h/EN9iCI5oKYH72OSm5fN9dav
 Ft6Zx1+9I1skoUVpqVPBB9NxT+zQk/70gWHVzcHs/YTUcL48DsFlqkHfweg0TSpUlCMY
 ck2S8tlJCe39gYSVuCahnrgkdU6pQ8Negd8HCEvMwoxKRHBtfTZiCiGRTjLvuUvT+gVq
 kWc3zXYoq2sN18WJS1fmoy4sT0JeDNmnpHuRtMSHrkQp1dAHWn5vqRDy1U0l4XJPH22l
 5xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mIbgqGp5MHZMjDC7erbJ1Rt5TOVChIklfPVrDvY14LE=;
 b=TgTKGqHvPUhRxJm6mI40lRHTRytli+fzc7lFW2tJhS26F59appuMc4HD8FxGAikCTs
 ry+RpL+opBO8t2H1d3PRg9kMNBi1fEJGoZuENkv425ttnMwefpFofhr00q1eUxjyjyyg
 i/n4RKWi7QdH/we2f+x+58hKUiL99/Vr4gdo4ewvg/gjBSH8fD7UMBPBn/Jhl/gg2hoO
 R0bou7vnL0tAuZ4wUF0kM3y+YFoeur+g8ZqMYtTdlwohrj0+aS7MI0RUqCXXsR0CM0uM
 7/15hx6LzSJ/eyej/V6QdL1VddWAB6L4NMi0+5Z0AoXA6qNmepmfwaaBl/vC5ihKwYmr
 fzlw==
X-Gm-Message-State: AOAM530+R/NTz0lX39DQ15qKkfoixCZ7jmROYtNbwtqJ6dy9CxIt48X7
 8yOSzpp2Qpr1rz7U+N+MW2o=
X-Google-Smtp-Source: ABdhPJwvy/WOl/w2WDv1Ka8d4q2k+6ieoSAP+9ozI85rk/XR45FfGfn+17WzdJQvOpACbwFBJhlq7g==
X-Received: by 2002:a17:902:8bc6:: with SMTP id
 r6mr5839446plo.289.1595845588420; 
 Mon, 27 Jul 2020 03:26:28 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id g3sm14217345pfq.19.2020.07.27.03.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 03:26:27 -0700 (PDT)
Date: Mon, 27 Jul 2020 15:55:03 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20200727102503.GA7767@gmail.com>
References: <20200720113740.353479-1-vaibhavgupta40@gmail.com>
 <20200727085621.GL12965@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727085621.GL12965@vkoul-mobl>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] dmaengine: pch_dma: use
	generic power management
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

On Mon, Jul 27, 2020 at 02:26:21PM +0530, Vinod Koul wrote:
> Hi Vaibhav,
> 
> On 20-07-20, 17:07, Vaibhav Gupta wrote:
> > Drivers using legacy PM have to manage PCI states and device's PM states
> > themselves. They also need to take care of configuration registers.
> > 
> > With improved and powerful support of generic PM, PCI Core takes care of
> > above mentioned, device-independent, jobs.
> > 
> > This driver makes use of PCI helper functions like
> > pci_save/restore_state(), pci_enable/disable_device(),
> > and pci_set_power_state() to do required operations. In generic mode, they
> > are no longer needed.
> > 
> > Change function parameter in both .suspend() and .resume() to
> > "struct device*" type. Use dev_get_drvdata() to get drv data.
> 
> You are doing too many things in One patch. Do consider splitting them
> up to a change per patch. for example using __maybe could be one patch,
> removing code is suspend-resume callbacks would be other one.
>
Sure. But I guess just marking of "__maybe_unused" is not some significant
change. All the legacy PCI drivers have .suspend() and .resume() inside
"#ifdef CONFIG_PM" container.
It is only when I am upgrading them one by one to generic, I remove the
container and mark them with the attribute. So it is like a part of complete
generic upgrade.

Thanks
Vaibhav Gupta
> > Compile-tested only.
> 
> I would like to see some testing before we merge this
> 
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/dma/pch_dma.c | 35 +++++++++--------------------------
> >  1 file changed, 9 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
> > index a3b0b4c56a19..e93005837e3f 100644
> > --- a/drivers/dma/pch_dma.c
> > +++ b/drivers/dma/pch_dma.c
> > @@ -735,8 +735,7 @@ static irqreturn_t pd_irq(int irq, void *devid)
> >  	return ret0 | ret2;
> >  }
> >  
> > -#ifdef	CONFIG_PM
> > -static void pch_dma_save_regs(struct pch_dma *pd)
> > +static void __maybe_unused pch_dma_save_regs(struct pch_dma *pd)
> >  {
> >  	struct pch_dma_chan *pd_chan;
> >  	struct dma_chan *chan, *_c;
> > @@ -759,7 +758,7 @@ static void pch_dma_save_regs(struct pch_dma *pd)
> >  	}
> >  }
> >  
> > -static void pch_dma_restore_regs(struct pch_dma *pd)
> > +static void __maybe_unused pch_dma_restore_regs(struct pch_dma *pd)
> >  {
> >  	struct pch_dma_chan *pd_chan;
> >  	struct dma_chan *chan, *_c;
> > @@ -782,40 +781,25 @@ static void pch_dma_restore_regs(struct pch_dma *pd)
> >  	}
> >  }
> >  
> > -static int pch_dma_suspend(struct pci_dev *pdev, pm_message_t state)
> > +static int __maybe_unused pch_dma_suspend(struct device *dev)
> >  {
> > -	struct pch_dma *pd = pci_get_drvdata(pdev);
> > +	struct pch_dma *pd = dev_get_drvdata(dev);
> >  
> >  	if (pd)
> >  		pch_dma_save_regs(pd);
> >  
> > -	pci_save_state(pdev);
> > -	pci_disable_device(pdev);
> > -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> > -
> >  	return 0;
> >  }
> >  
> > -static int pch_dma_resume(struct pci_dev *pdev)
> > +static int __maybe_unused pch_dma_resume(struct device *dev)
> >  {
> > -	struct pch_dma *pd = pci_get_drvdata(pdev);
> > -	int err;
> > -
> > -	pci_set_power_state(pdev, PCI_D0);
> > -	pci_restore_state(pdev);
> > -
> > -	err = pci_enable_device(pdev);
> > -	if (err) {
> > -		dev_dbg(&pdev->dev, "failed to enable device\n");
> > -		return err;
> > -	}
> > +	struct pch_dma *pd = dev_get_drvdata(dev);
> >  
> >  	if (pd)
> >  		pch_dma_restore_regs(pd);
> >  
> >  	return 0;
> >  }
> > -#endif
> >  
> >  static int pch_dma_probe(struct pci_dev *pdev,
> >  				   const struct pci_device_id *id)
> > @@ -993,15 +977,14 @@ static const struct pci_device_id pch_dma_id_table[] = {
> >  	{ 0, },
> >  };
> >  
> > +static SIMPLE_DEV_PM_OPS(pch_dma_pm_ops, pch_dma_suspend, pch_dma_resume);
> > +
> >  static struct pci_driver pch_dma_driver = {
> >  	.name		= DRV_NAME,
> >  	.id_table	= pch_dma_id_table,
> >  	.probe		= pch_dma_probe,
> >  	.remove		= pch_dma_remove,
> > -#ifdef CONFIG_PM
> > -	.suspend	= pch_dma_suspend,
> > -	.resume		= pch_dma_resume,
> > -#endif
> > +	.driver.pm	= &pch_dma_pm_ops,
> >  };
> >  
> >  module_pci_driver(pch_dma_driver);
> > -- 
> > 2.27.0
> 
> -- 
> ~Vinod
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
