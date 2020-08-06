Return-Path: <SRS0=sW3u=BQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33798C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Aug 2020 11:56:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB58D221E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Aug 2020 11:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfX2ioH7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB58D221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 720DC887D3;
	Thu,  6 Aug 2020 06:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQVSn3m8Ac5u; Thu,  6 Aug 2020 06:00:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C513A88717;
	Thu,  6 Aug 2020 06:00:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAD2BC0050;
	Thu,  6 Aug 2020 06:00:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D52B8C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 06:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C0E6E881E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 06:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAsnMv6vwlSE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 06:00:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E0C4F880C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 06:00:39 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id w17so26937068ply.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Aug 2020 23:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MQuBJ0AZA3Ql/KbLn468nE0MeNrmfmZUYry76u8WWnU=;
 b=jfX2ioH7ZSJzrDANkazGM2XJ7JGsVM3tBYR+RSYwcg/QLerDtmI8jEw3H/5e15kW44
 RdeU2DdDLmI10zC0CweUu8fZ37g6mnn5baVOhReo3lXeWp9XSKC+4V7Of0+OwqCuI4HG
 77axr46GEeY2Jmgoy9wGnQoCNgx0L8uhh/bI4zWmrr1GhqvMaz59mfSuqAv7niwihqTD
 AbKBMVdEaT6bS/ggY3wjGM+36AjP0+JIvLXMVkdJ9y8RhNy3U7pvaEhKR8SwCrGFOpAJ
 p6pnV/p/0+ayK2r2gatPQWKV31vBIQYHFCugvJfaWXQrwbYd30qXTnmP1G2alMR9rXzv
 gAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MQuBJ0AZA3Ql/KbLn468nE0MeNrmfmZUYry76u8WWnU=;
 b=HPdBuzyzc8BFAwsCNFjJMO9gygvLRTh+qmQ3jxvTe0YmQe8UYBN8B9E+CE2mcrm5/X
 wWMHFnAAlKcBTD9FM1hIgHZReSs0GGJLl3+t9dAyBk8adLgFqj6thgjZJk6heZ55V/jK
 RTPx/sTtuvGFlEg2s28aKTxnM2pwzBr2emT4Dyf7N+C4XcAec4nHsMD4Gm+qQiGavBX3
 bwAmRVXii4+W7MS6sLbisK7rhvlTNKbHGRy6fsZgVKHHZdzTPIHG/wgU/eKcLKUcb5CB
 KVvVgoVFGCIT8DXpXvce7T3R635zI+1kDhsfA/alXQnqd1u/wxQRy2vDhRvnZ1YJ3dlh
 bBgw==
X-Gm-Message-State: AOAM531PK4PVnw8oh3NzRxkxTi9T/472bqPrt7zaaL+JT6P6+Yn/tmDn
 Ax2whyrdTHRKc0hr0s6h3WQ=
X-Google-Smtp-Source: ABdhPJz1AigiTfRNCtWEJT/qDJuvjr1ZSqs97lpsBEC1kzhcEQtEN0LMSmKPKOzO3LsEollShQ8VxQ==
X-Received: by 2002:a17:90b:124e:: with SMTP id
 gx14mr6994509pjb.225.1596693639235; 
 Wed, 05 Aug 2020 23:00:39 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id a33sm5485817pgl.75.2020.08.05.23.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 23:00:38 -0700 (PDT)
Date: Thu, 6 Aug 2020 11:29:06 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20200806055843.GA486683@gmail.com>
References: <20200805180722.244008-2-vaibhavgupta40@gmail.com>
 <20200805201901.GA529929@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805201901.GA529929@bjorn-Precision-5520>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Antonino Daplas <adaplas@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 Andres Salomon <dilinger@queued.net>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 01/12] fbdev: gxfb: use
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

On Wed, Aug 05, 2020 at 03:19:01PM -0500, Bjorn Helgaas wrote:
> On Wed, Aug 05, 2020 at 11:37:11PM +0530, Vaibhav Gupta wrote:
> > Drivers using legacy power management .suspen()/.resume() callbacks
> > have to manage PCI states and device's PM states themselves. They also
> > need to take care of standard configuration registers.
> 
> s/using legacy/using legacy PCI/
> s/.suspen/.suspend/ (in all these patches)
> 
Oh, that's a blunder. Since most of the drivers in my project need similar
changes, I made a template for commit message. And by mistake I would have
edited the template itself.
> I wouldn't necessarily repost the whole series just for that (unless
> the maintainer wants it), but maybe update your branch so if you have
> occasion to repost for other reasons, this will be fixed.
> 
> This particular driver actually doesn't *do* any of the PCI state or
> device PM state management you mention.  And I don't see the "single
> 'struct dev_pm_ops'" you mention below -- I thought that meant you
> would have a single struct shared between drivers (I think you did
> that for IDE?), but that's not what you're doing.  This driver has
> gxfb_pm_ops, the next has lxfb_pm_ops, etc.
> 
Yeah, the sentence sounds misleading. What I meant was that earlier there
were two pointers for PM, .suspend and .resume. Whereas now there is a single
"struct dev_pm_ops" variable inside pci_driver.
> AFAICT the patches are fine, but the commit logs don't seem exactly
> accurate.
> 
I am fixing it.

Thanks
Vaibhav Gupta
> > Switch to generic power management framework using a single
> > "struct dev_pm_ops" variable to take the unnecessary load from the driver.
> > This also avoids the need for the driver to directly call most of the PCI
> > helper functions and device power state control functions, as through
> > the generic framework PCI Core takes care of the necessary operations,
> > and drivers are required to do only device-specific jobs.
> >
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/video/fbdev/geode/gxfb.h       |  5 ----
> >  drivers/video/fbdev/geode/gxfb_core.c  | 36 ++++++++++++++------------
> >  drivers/video/fbdev/geode/suspend_gx.c |  4 ---
> >  3 files changed, 20 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/geode/gxfb.h b/drivers/video/fbdev/geode/gxfb.h
> > index d2e9c5c8e294..792c111c21e4 100644
> > --- a/drivers/video/fbdev/geode/gxfb.h
> > +++ b/drivers/video/fbdev/geode/gxfb.h
> > @@ -21,7 +21,6 @@ struct gxfb_par {
> >  	void __iomem *dc_regs;
> >  	void __iomem *vid_regs;
> >  	void __iomem *gp_regs;
> > -#ifdef CONFIG_PM
> >  	int powered_down;
> >  
> >  	/* register state, for power management functionality */
> > @@ -36,7 +35,6 @@ struct gxfb_par {
> >  	uint64_t fp[FP_REG_COUNT];
> >  
> >  	uint32_t pal[DC_PAL_COUNT];
> > -#endif
> >  };
> >  
> >  unsigned int gx_frame_buffer_size(void);
> > @@ -49,11 +47,8 @@ void gx_set_dclk_frequency(struct fb_info *info);
> >  void gx_configure_display(struct fb_info *info);
> >  int gx_blank_display(struct fb_info *info, int blank_mode);
> >  
> > -#ifdef CONFIG_PM
> >  int gx_powerdown(struct fb_info *info);
> >  int gx_powerup(struct fb_info *info);
> > -#endif
> > -
> >  
> >  /* Graphics Processor registers (table 6-23 from the data book) */
> >  enum gp_registers {
> > diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
> > index d38a148d4746..44089b331f91 100644
> > --- a/drivers/video/fbdev/geode/gxfb_core.c
> > +++ b/drivers/video/fbdev/geode/gxfb_core.c
> > @@ -322,17 +322,14 @@ static struct fb_info *gxfb_init_fbinfo(struct device *dev)
> >  	return info;
> >  }
> >  
> > -#ifdef CONFIG_PM
> > -static int gxfb_suspend(struct pci_dev *pdev, pm_message_t state)
> > +static int __maybe_unused gxfb_suspend(struct device *dev)
> >  {
> > -	struct fb_info *info = pci_get_drvdata(pdev);
> > +	struct fb_info *info = dev_get_drvdata(dev);
> >  
> > -	if (state.event == PM_EVENT_SUSPEND) {
> > -		console_lock();
> > -		gx_powerdown(info);
> > -		fb_set_suspend(info, 1);
> > -		console_unlock();
> > -	}
> > +	console_lock();
> > +	gx_powerdown(info);
> > +	fb_set_suspend(info, 1);
> > +	console_unlock();
> >  
> >  	/* there's no point in setting PCI states; we emulate PCI, so
> >  	 * we don't end up getting power savings anyways */
> > @@ -340,9 +337,9 @@ static int gxfb_suspend(struct pci_dev *pdev, pm_message_t state)
> >  	return 0;
> >  }
> >  
> > -static int gxfb_resume(struct pci_dev *pdev)
> > +static int __maybe_unused gxfb_resume(struct device *dev)
> >  {
> > -	struct fb_info *info = pci_get_drvdata(pdev);
> > +	struct fb_info *info = dev_get_drvdata(dev);
> >  	int ret;
> >  
> >  	console_lock();
> > @@ -356,7 +353,6 @@ static int gxfb_resume(struct pci_dev *pdev)
> >  	console_unlock();
> >  	return 0;
> >  }
> > -#endif
> >  
> >  static int gxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >  {
> > @@ -467,15 +463,23 @@ static const struct pci_device_id gxfb_id_table[] = {
> >  
> >  MODULE_DEVICE_TABLE(pci, gxfb_id_table);
> >  
> > +static const struct dev_pm_ops gxfb_pm_ops = {
> > +#ifdef CONFIG_PM_SLEEP
> > +	.suspend	= gxfb_suspend,
> > +	.resume		= gxfb_resume,
> > +	.freeze		= NULL,
> > +	.thaw		= gxfb_resume,
> > +	.poweroff	= NULL,
> > +	.restore	= gxfb_resume,
> > +#endif
> > +};
> > +
> >  static struct pci_driver gxfb_driver = {
> >  	.name		= "gxfb",
> >  	.id_table	= gxfb_id_table,
> >  	.probe		= gxfb_probe,
> >  	.remove		= gxfb_remove,
> > -#ifdef CONFIG_PM
> > -	.suspend	= gxfb_suspend,
> > -	.resume		= gxfb_resume,
> > -#endif
> > +	.driver.pm	= &gxfb_pm_ops,
> >  };
> >  
> >  #ifndef MODULE
> > diff --git a/drivers/video/fbdev/geode/suspend_gx.c b/drivers/video/fbdev/geode/suspend_gx.c
> > index 1110a527c35c..8c49d4e98772 100644
> > --- a/drivers/video/fbdev/geode/suspend_gx.c
> > +++ b/drivers/video/fbdev/geode/suspend_gx.c
> > @@ -11,8 +11,6 @@
> >  
> >  #include "gxfb.h"
> >  
> > -#ifdef CONFIG_PM
> > -
> >  static void gx_save_regs(struct gxfb_par *par)
> >  {
> >  	int i;
> > @@ -259,5 +257,3 @@ int gx_powerup(struct fb_info *info)
> >  	par->powered_down  = 0;
> >  	return 0;
> >  }
> > -
> > -#endif
> > -- 
> > 2.27.0
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
