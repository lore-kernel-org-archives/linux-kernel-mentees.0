Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1238BC433EA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 11:19:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9B302078A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 11:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tnPmAVCa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9B302078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A2F4B87E65;
	Mon, 27 Jul 2020 11:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZwBl-wX7bwx; Mon, 27 Jul 2020 11:19:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 15B1D87E68;
	Mon, 27 Jul 2020 11:19:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6788C0050;
	Mon, 27 Jul 2020 11:19:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83AB4C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 72BBD85D7E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UwYfieFhrjF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:19:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B2F09851CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:19:29 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id e22so2067931pjt.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 04:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WlZG7+7DASiAzqRKJZMw2+Puq2+bYr5zSYxEeHcy5yE=;
 b=tnPmAVCazQgMI6svqYEuWU5taBJyw947KUxPTAau0I/QZbDyWIrbIpF91LGxjwuXGS
 LRPhm0xQXCIHj6tLs3yJMPYfYpDu6C2ECNaIk4i+MVZtfJSrr3XrrO8UUwTiZNve2FKx
 tt61tOCsJ7vzFAXkYye3SH7Ypg93rIZ6DSgW08NfmYPzTXpbStrm3Apl1ZWnrYNHLvWD
 OBldOrdbRoK6cSzFCmd5prG6Tm8BCV2/TP0GPyY4scENzh9f169OGou9zJOOMnO77e2T
 BtfzRoDkSg4mYSwTZbYir+6sEgEO3hafKHhPd/Dxho5+HIiA0vuqcDXdyTYNzbfldbHo
 Wldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WlZG7+7DASiAzqRKJZMw2+Puq2+bYr5zSYxEeHcy5yE=;
 b=XypWt9VTDTvOhKSR1OI1V2cwuEbiQGAJBwfxWQKllHneeo8Dx1g7Xitlg6yI1jL7Mc
 Vr0hiz0QSX8J2ImRHzLeOQMgJjoV9P2+9CX6RA6sCPYKk2PhMKh6yi26EyYyeFJxWPma
 XVK2/i0kDqXTj/fVoNQ6I5Sdvj3Kde4q9v7aDGEA7+u4YzFD6XUiNCZV3xGaHdwPZmNx
 PDtz2orT+xae3Z00KO5QlNffUU9dWuet7rCnymIXcKcIiCGPVJOUC/1kabiq/pS532hn
 +AXy6Np0lYJNYiVK/Ipu13sdueBmMyinY1c+2SZ5QUWXtlCIz4qBbNSuN3iFKM2S9p4f
 /ahg==
X-Gm-Message-State: AOAM530hXiLGR/DtbaclwYmMfyFgy6kXUBBVumfh1EwnxoGLtVhyKYSY
 W4AYqm8bsrZsZYLBH6Rir9jmLCXHtZ6a/FyD13E=
X-Google-Smtp-Source: ABdhPJyXz/W9tfXLQ1P01pH1D/POYketJG+WWNnTcbGfmsPrhZC3owwch/SJ3tmfvaxowkKhGEHHRFKy/88Ks6iHGfQ=
X-Received: by 2002:a17:90a:8985:: with SMTP id
 v5mr2785017pjn.181.1595848769238; 
 Mon, 27 Jul 2020 04:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200720113740.353479-1-vaibhavgupta40@gmail.com>
 <20200727085621.GL12965@vkoul-mobl>
In-Reply-To: <20200727085621.GL12965@vkoul-mobl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 Jul 2020 14:19:14 +0300
Message-ID: <CAHp75VesTCOffxiy6=HG=g2t4=js3SnTm4LcdrgAGYiNvSS65Q@mail.gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine <dmaengine@vger.kernel.org>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

On Mon, Jul 27, 2020 at 1:16 PM Vinod Koul <vkoul@kernel.org> wrote:
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

Vinod, while I completely agree with you in general, in this case it
would make more unnecessary churn and will be rather unhelpful in all
ways: for the contributor to do this work, for the reader to collect
all the pieces. It also will be a bisectability issue, because the
#ifdeffery replacement (IIRC you need to move from CONFIG_PM to
CONFIG_PM_SLEEP). I really don't see any advantages of the splitting
here.

> > Compile-tested only.
>
> I would like to see some testing before we merge this

I have hardware to test (Intel Minnowboard v1) but have no time. And
taking into account that I did similar changes for many other drivers,
I can give my
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
and take responsibility if somebody complains in the future (I don't
believe it will be one).

P.S. Another scenario if Vaibhav can find that board (there were
dozens of thousands at least produced and floating on the second hand
market) and test himself. It may be good since he touches the full lot
of PCH (EGT20) drivers.

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
> >       return ret0 | ret2;
> >  }
> >
> > -#ifdef       CONFIG_PM
> > -static void pch_dma_save_regs(struct pch_dma *pd)
> > +static void __maybe_unused pch_dma_save_regs(struct pch_dma *pd)
> >  {
> >       struct pch_dma_chan *pd_chan;
> >       struct dma_chan *chan, *_c;
> > @@ -759,7 +758,7 @@ static void pch_dma_save_regs(struct pch_dma *pd)
> >       }
> >  }
> >
> > -static void pch_dma_restore_regs(struct pch_dma *pd)
> > +static void __maybe_unused pch_dma_restore_regs(struct pch_dma *pd)
> >  {
> >       struct pch_dma_chan *pd_chan;
> >       struct dma_chan *chan, *_c;
> > @@ -782,40 +781,25 @@ static void pch_dma_restore_regs(struct pch_dma *pd)
> >       }
> >  }
> >
> > -static int pch_dma_suspend(struct pci_dev *pdev, pm_message_t state)
> > +static int __maybe_unused pch_dma_suspend(struct device *dev)
> >  {
> > -     struct pch_dma *pd = pci_get_drvdata(pdev);
> > +     struct pch_dma *pd = dev_get_drvdata(dev);
> >
> >       if (pd)
> >               pch_dma_save_regs(pd);
> >
> > -     pci_save_state(pdev);
> > -     pci_disable_device(pdev);
> > -     pci_set_power_state(pdev, pci_choose_state(pdev, state));
> > -
> >       return 0;
> >  }
> >
> > -static int pch_dma_resume(struct pci_dev *pdev)
> > +static int __maybe_unused pch_dma_resume(struct device *dev)
> >  {
> > -     struct pch_dma *pd = pci_get_drvdata(pdev);
> > -     int err;
> > -
> > -     pci_set_power_state(pdev, PCI_D0);
> > -     pci_restore_state(pdev);
> > -
> > -     err = pci_enable_device(pdev);
> > -     if (err) {
> > -             dev_dbg(&pdev->dev, "failed to enable device\n");
> > -             return err;
> > -     }
> > +     struct pch_dma *pd = dev_get_drvdata(dev);
> >
> >       if (pd)
> >               pch_dma_restore_regs(pd);
> >
> >       return 0;
> >  }
> > -#endif
> >
> >  static int pch_dma_probe(struct pci_dev *pdev,
> >                                  const struct pci_device_id *id)
> > @@ -993,15 +977,14 @@ static const struct pci_device_id pch_dma_id_table[] = {
> >       { 0, },
> >  };
> >
> > +static SIMPLE_DEV_PM_OPS(pch_dma_pm_ops, pch_dma_suspend, pch_dma_resume);
> > +
> >  static struct pci_driver pch_dma_driver = {
> >       .name           = DRV_NAME,
> >       .id_table       = pch_dma_id_table,
> >       .probe          = pch_dma_probe,
> >       .remove         = pch_dma_remove,
> > -#ifdef CONFIG_PM
> > -     .suspend        = pch_dma_suspend,
> > -     .resume         = pch_dma_resume,
> > -#endif
> > +     .driver.pm      = &pch_dma_pm_ops,
> >  };
> >
> >  module_pci_driver(pch_dma_driver);
> > --
> > 2.27.0
>
> --
> ~Vinod



-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
