Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B14BC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 07:48:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F81E2173E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 07:48:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zbh2ZDpx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F81E2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 355BD87CCB;
	Mon, 17 Aug 2020 07:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBXr-tWsm0E4; Mon, 17 Aug 2020 07:48:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 808EE87CDD;
	Mon, 17 Aug 2020 07:48:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78D38C07FF;
	Mon, 17 Aug 2020 07:48:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC114C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AAC9F87CB5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afz-O-dBhPx6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:48:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 23F8687C91
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:48:14 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j21so7716766pgi.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wi7uOh+yRtLfdGHBZ3WK6CGtcfeUS/qkjXRc9sQSjvc=;
 b=Zbh2ZDpx5D7ecoMsmjdy0EZPc17mhOMQ+yg6h9NruYfGK34WnVFxgqtb3ALzVVwFjW
 +fQOuZxuwzoaBjKLFhJHTpRxl+41tCCCAvNdTjbUvmKX4DCUH2imMS/IDINbDFEm8o14
 IZYTsGs25owiK+EZnJmh/I8SHam1odD/s+4vnAWqreIEGAWJQYqNVrpMo4xHS6l4q+Dt
 uZ717gj9zeYVjZcaRC2Cdkhkkdk5SMJX68fcUrPafwrcQkuF95Bs1DR5vrdxo8q60qwc
 NgaROWjOxuRyo4fNRoR4JEBt3XvWexmjtiTiObf7bEyOxfXMr5qzXXvuboSTaTps4Edz
 wp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wi7uOh+yRtLfdGHBZ3WK6CGtcfeUS/qkjXRc9sQSjvc=;
 b=ADUs9AmoE95FAiVqm5MsSXyeopB+x4ehHbzltnbsdHVK8VFTsKynxbXbO8kdEWS9cO
 WAZERGO6O7nCP2zVEWOx4WMh80Tc56XYWUGF3/WYVivcpze0f5NS+oAqUyDZl/+gLS3h
 rdT269LbTHPfh6Pa3XprSVPZuaNzYxtj9AcjILFaDxRcT3VbP9haPXBMytjQ4Q5lhBjk
 Qac0Zl3o0sqcSbChMK6IairkbAWq7T/N3gBOHw5vcfk7X0dkcTdBoY1OUFTUZjVisdZe
 E+KAX+0gNb8NXDZtHPkygO9jTqKjA9lNtegqjKGSCivrpgMOSLLImghL9OQ8xgrmMxAn
 tRoQ==
X-Gm-Message-State: AOAM532QRgj9lroTdj3MporekMc/JRoK96+jmWoi/5Sl6QNVht+1tMyu
 y+2ekc/oMXFV2EC+Bv77A0w=
X-Google-Smtp-Source: ABdhPJyH0PooAF7f8Gjqfs3WOBZbjkvwPWTfgVSpdwmSziet5j+X68Cf8uvMg8Xmk5uW4gSOtAOz0Q==
X-Received: by 2002:a63:794e:: with SMTP id u75mr8901794pgc.50.1597650493498; 
 Mon, 17 Aug 2020 00:48:13 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id mh14sm17112858pjb.23.2020.08.17.00.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 00:48:13 -0700 (PDT)
Date: Mon, 17 Aug 2020 13:16:34 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Message-ID: <20200817074634.GD5869@gmail.com>
References: <20200810165458.GA292825@ravnborg.org>
 <20200810185723.15540-1-vaibhavgupta40@gmail.com>
 <20200810185723.15540-10-vaibhavgupta40@gmail.com>
 <20200816202442.GB1426650@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200816202442.GB1426650@ravnborg.org>
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
Subject: Re: [Linux-kernel-mentees] [PATCH v2 09/12] fbdev: i740fb: use
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

On Sun, Aug 16, 2020 at 10:24:42PM +0200, Sam Ravnborg wrote:
> Hi Vaibhav
> 
> On Tue, Aug 11, 2020 at 12:27:20AM +0530, Vaibhav Gupta wrote:
> > Drivers should do only device-specific jobs. But in general, drivers using
> > legacy PCI PM framework for .suspend()/.resume() have to manage many PCI
> > PM-related tasks themselves which can be done by PCI Core itself. This
> > brings extra load on the driver and it directly calls PCI helper functions
> > to handle them.
> > 
> > Switch to the new generic framework by updating function signatures and
> > define a "struct dev_pm_ops" variable to bind PM callbacks. Also, remove
> > unnecessary calls to the PCI Helper functions along with the legacy
> > .suspend & .resume bindings.
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> 
> I several of the drivers I briefly looked at a new set of helpers were
> introduced for the different types of pm actions.
> They then called a more generic function that uses the passes
> enumeration to decide what to do.
> 
> But in this driver the test "state.event == PM_EVENT_FREEZE" is dropped
> and there is no freeze operation.
> Please explain this change so the reader is not left wondering.
> 
> 	Sam
> 
Okay,

Thanks
Vaibhav Gupta
> > ---
> >  drivers/video/fbdev/i740fb.c | 40 +++++++++++++++---------------------
> >  1 file changed, 16 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
> > index c65ec7386e87..8d7f06fc8a5a 100644
> > --- a/drivers/video/fbdev/i740fb.c
> > +++ b/drivers/video/fbdev/i740fb.c
> > @@ -1175,16 +1175,11 @@ static void i740fb_remove(struct pci_dev *dev)
> >  	}
> >  }
> >  
> > -#ifdef CONFIG_PM
> > -static int i740fb_suspend(struct pci_dev *dev, pm_message_t state)
> > +static int __maybe_unused i740fb_suspend(struct device *dev)
> >  {
> > -	struct fb_info *info = pci_get_drvdata(dev);
> > +	struct fb_info *info = dev_get_drvdata(dev);
> >  	struct i740fb_par *par = info->par;
> >  
> > -	/* don't disable console during hibernation and wakeup from it */
> > -	if (state.event == PM_EVENT_FREEZE || state.event == PM_EVENT_PRETHAW)
> > -		return 0;
> > -
> >  	console_lock();
> >  	mutex_lock(&(par->open_lock));
> >  
> > @@ -1197,19 +1192,15 @@ static int i740fb_suspend(struct pci_dev *dev, pm_message_t state)
> >  
> >  	fb_set_suspend(info, 1);
> >  
> > -	pci_save_state(dev);
> > -	pci_disable_device(dev);
> > -	pci_set_power_state(dev, pci_choose_state(dev, state));
> > -
> >  	mutex_unlock(&(par->open_lock));
> >  	console_unlock();
> >  
> >  	return 0;
> >  }
> >  
> > -static int i740fb_resume(struct pci_dev *dev)
> > +static int __maybe_unused i740fb_resume(struct device *dev)
> >  {
> > -	struct fb_info *info = pci_get_drvdata(dev);
> > +	struct fb_info *info = dev_get_drvdata(dev);
> >  	struct i740fb_par *par = info->par;
> >  
> >  	console_lock();
> > @@ -1218,11 +1209,6 @@ static int i740fb_resume(struct pci_dev *dev)
> >  	if (par->ref_count == 0)
> >  		goto fail;
> >  
> > -	pci_set_power_state(dev, PCI_D0);
> > -	pci_restore_state(dev);
> > -	if (pci_enable_device(dev))
> > -		goto fail;
> > -
> >  	i740fb_set_par(info);
> >  	fb_set_suspend(info, 0);
> >  
> > @@ -1231,10 +1217,17 @@ static int i740fb_resume(struct pci_dev *dev)
> >  	console_unlock();
> >  	return 0;
> >  }
> > -#else
> > -#define i740fb_suspend NULL
> > -#define i740fb_resume NULL
> > -#endif /* CONFIG_PM */
> > +
> > +static const struct dev_pm_ops i740fb_pm_ops = {
> > +#ifdef CONFIG_PM_SLEEP
> > +	.suspend	= i740fb_suspend,
> > +	.resume		= i740fb_resume,
> > +	.freeze		= NULL,
> > +	.thaw		= i740fb_resume,
> > +	.poweroff	= i740fb_suspend,
> > +	.restore	= i740fb_resume,
> > +#endif /* CONFIG_PM_SLEEP */
> > +};
> >  
> >  #define I740_ID_PCI 0x00d1
> >  #define I740_ID_AGP 0x7800
> > @@ -1251,8 +1244,7 @@ static struct pci_driver i740fb_driver = {
> >  	.id_table	= i740fb_id_table,
> >  	.probe		= i740fb_probe,
> >  	.remove		= i740fb_remove,
> > -	.suspend	= i740fb_suspend,
> > -	.resume		= i740fb_resume,
> > +	.driver.pm	= &i740fb_pm_ops,
> >  };
> >  
> >  #ifndef MODULE
> > -- 
> > 2.27.0
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
