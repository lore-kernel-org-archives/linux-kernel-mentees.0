Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F609C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 07:46:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F16162072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 07:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0x6mCa8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F16162072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CB449203E8;
	Mon, 17 Aug 2020 07:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wdMrsVJ5A5hy; Mon, 17 Aug 2020 07:46:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 615E920392;
	Mon, 17 Aug 2020 07:46:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 453AFC07FF;
	Mon, 17 Aug 2020 07:46:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D51AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7B391875A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1h9OIEDMfLp1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:46:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C69FE87580
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:46:50 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id mt12so7411099pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LZRMSrBr7/vKE4UdeSABY6b/Zwq77nI7xyHDqM8/IwM=;
 b=j0x6mCa8Uc7oA6s+ex2+GxuwOZELXDDKx5k3RWmZZmOilScX9AQdDXw3aNbCPZVXWL
 GpM1O8b6xW+BMCqf0uIBXYoRt6pL7AczzNKpGe4kFoR7m146xmS7uNKn4pSlaDFpuDb/
 7bETik/tMc4YOlatyrxzjZG8BzXnKWp0Fmfm4ruJU06Ln0hDlU5wy2a0v8a5czI/wbuQ
 vqbfYEJvJbHX8/1l7GCPsViR6qKerHBpDCXRcPMfN45wJz7t1r1fE3XUUFCwRl7mYW0F
 Y30P18+gG1IwoI4HHbuiJqRzEZEr5Q8pzvMAMxgNSFaOG9x7yST66wS7oGqwuXdCpM+M
 UlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LZRMSrBr7/vKE4UdeSABY6b/Zwq77nI7xyHDqM8/IwM=;
 b=X3Ox94ZXghFIHfZUCgDcHzcB94c6HtxMNMxXlcBV9JRS0kkgR366F8fge9hUGLJSYG
 EoSWqVFcjbUBAt3GdOhC1qX6Xb0kHj86uxP6aBfmpzYEIWZ62uCmw3SY72t1oME9PI6w
 7+vAT4p/ZStlp2tzt8c33QjBwlk3VNHJeOHiUgTlpypr3FY1EUnJmDpcTwP8hKU0qKLQ
 5CmtxZY/sMIIAGBxvSGSOjXDav8c2wfzzk7+pgxPREEanXPcoUJ2hmUQVdnjUOlffwhX
 HR/hEQ2Jodl/r18zmKuagmAULrgU9jTR2Df8/cehVDCCAH1/AVRlVWN2VGdD+k5IHScX
 yHfA==
X-Gm-Message-State: AOAM531KVKg9kZ9YK6IVGl67qQsZCxCOZ9QvnQUgjkfArNIHYDm28svJ
 nk+gr5T6Yg1nbKv+vgNkWHE=
X-Google-Smtp-Source: ABdhPJwXn/WjeEGwrJvbdSPrlAx+5odIX14PWQ7A66El9MjrTgTDdiaCiyeTSlB4xFRJ4lw0WLHtWQ==
X-Received: by 2002:a17:90a:8918:: with SMTP id
 u24mr11089516pjn.7.1597650410282; 
 Mon, 17 Aug 2020 00:46:50 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id b15sm17586069pje.52.2020.08.17.00.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 00:46:49 -0700 (PDT)
Date: Mon, 17 Aug 2020 13:15:01 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Message-ID: <20200817074501.GC5869@gmail.com>
References: <20200810165458.GA292825@ravnborg.org>
 <20200810185723.15540-1-vaibhavgupta40@gmail.com>
 <20200810185723.15540-2-vaibhavgupta40@gmail.com>
 <20200816201601.GA1426650@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200816201601.GA1426650@ravnborg.org>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Antonino Daplas <adaplas@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>,
 Andres Salomon <dilinger@queued.net>, Bjorn Helgaas <bhelgaas@google.com>,
 Paul Mackerras <paulus@samba.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 01/12] fbdev: gxfb: use
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

On Sun, Aug 16, 2020 at 10:16:01PM +0200, Sam Ravnborg wrote:
> Hi Vaibhav
> 
> On Tue, Aug 11, 2020 at 12:27:12AM +0530, Vaibhav Gupta wrote:
> > Drivers should do only device-specific jobs. But in general, drivers using
> > legacy PCI PM framework for .suspend()/.resume() have to manage many PCI
> > PM-related tasks themselves which can be done by PCI Core itself. This
> > brings extra load on the driver and it directly calls PCI helper functions
> > to handle them.
> > 
> > Although the gxfb driver does not have that extra load,
> Sorry, but I am lost here.
> If this drivers does not have the extra load that you describe here then
> I really cannot see why it is relevant for this driver to describe it.
> 
> This is a seldomly touched driver - so it helps if the changelog when we
> finally touch the code is easy to parse.
> 
> > we should switch to
> > the new generic framework by updating function signatures and define a
> > "struct dev_pm_ops" variable to bind PM callbacks so that we can remove
> > the legacy .suspend & .resume bindings.
> This part matches the patch - good.
> 
> > Additionally, this helps us to
> > remove the unnecessary call to gxfb_suspend() in the event of Freeze and
> > Hibernate, as the function does nothing in their case.
> What I think you are explaining above is that the pci pm support
> will only call the suspend operation in case of suspend, so the 
> state.event == PM_EVENT_SUSPEND can be dropped in gxfb_suspend().
> 
> For reference later I would prefer that this is explained a bit
> more explicit - not that the changelog needs update anyway.
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> Patch looks good, but please give the changelog one more go.
> I have not checked other patches - but I assume they would benefit
> from a similar clarification.
> 
> 	Sam
> 
Hello Sam

I will do the changes as suggested.

Thanks
Vaibhav Gupta
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
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
