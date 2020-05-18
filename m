Return-Path: <SRS0=A5MH=7A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A2AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 May 2020 15:08:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E97020671
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 May 2020 15:08:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u8+DTiXF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E97020671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2448087CA2;
	Mon, 18 May 2020 15:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1amTnahgev9n; Mon, 18 May 2020 15:08:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 402DF8793F;
	Mon, 18 May 2020 15:08:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37924C0881;
	Mon, 18 May 2020 15:08:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A0F3C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 58E9B86AD8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwhPrrgPZao4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:08:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4820886AD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:08:28 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id w25so10857603iol.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AuDeKBeiNbV2BPHyEwzll87/zPtHL71dC0MLzOjyGrQ=;
 b=u8+DTiXFQh9U8Kyj4BXtiFiwOjIBfs1jZhqWoAIqx2wiFaKOfl7tEIhLmaCIM+eEIO
 Dz+cc+D6BtnzQlp9Dheip0SvkUxwXA1MuEfppH2wUtZC2QzynLrrtZWEbltypAj6zIzp
 1qrf5K0/gGpHcno1dTZgg3sHXix4I/18cWCRH19R1TtMQaSeEWl3aQVxwhCagPtqnMD9
 ylQaQ3yNlTr3xlRd0kT/syBJBTukneDEcn0o1uTP9OzfB3GwoPks1EAAJ5Qs9IILh75V
 47pkj5CSh6qmANlcooHslMQ2Q7Ym0J95euEG0JwHANNAPC8gQdd241aCj85IlKHRjPCp
 K5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AuDeKBeiNbV2BPHyEwzll87/zPtHL71dC0MLzOjyGrQ=;
 b=VI0CDDxq/M6e5vt3NNjzbqwI7/EMG7mm3gXB+CSX9TtVKhLRJ/0Y9Rj9qyvC2VxsSH
 jq+Zk5HBGuXWCE2trqIXlQsNas/hMTSgx2cFeRdNhQbzlW//6MhSBcgURuKSaqGsldAV
 fok4nVqprC8tgB+60H2vg9B8Svx0BmEdgSGTbhnOhDkUmtWTgCYWyv824sMXjoCj5rOc
 WH2zePAGJ0HtbSVZ/3Gd95Jw5hc7FZsHbtDh1npsYMloRku/IpcoFUeG1NbJCXNtuGAy
 oFTc6EYHhPQJHO5RDSQgoYcXS7oLmRU2qZd7QYmFSnDWcxZx/mmGpUniF5jenApsUEg/
 jf7A==
X-Gm-Message-State: AOAM5323IiRyu/yWHjphyiADg0naHzTKyBR+nSdO1ATJALXDOjzhEs1o
 hl1UWW8tYToFhHwQuo+2JF922bKmllYHJtDCHno=
X-Google-Smtp-Source: ABdhPJxxvJjr7OIw8LMAeMevKqTed6j80XxbKIwDBMHCDaBh0raEA/u/VUV/h0KlROb5K/FuJM1Rf+Y5esVIMlzd1cs=
X-Received: by 2002:a05:6638:2ad:: with SMTP id
 d13mr15638233jaq.119.1589814506078; 
 Mon, 18 May 2020 08:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <61CC2BC414934749BD9F5BF3D5D9404498682656@ORSMSX112.amr.corp.intel.com>
 <20200501214520.GA135661@bjorn-Precision-5520>
In-Reply-To: <20200501214520.GA135661@bjorn-Precision-5520>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Mon, 18 May 2020 20:37:13 +0530
Message-ID: <CAPBsFfANa2ktd5h3YGVmPQMasNapzPkM3yBZ0icp8++53bbcZw@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "Kirsher,
 Jeffrey T" <jeffrey.t.kirsher@intel.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] ethernet: intel: e1000:
 Convert to dev_pm_ops
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

On Sat, 2 May 2020 at 03:15, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, May 01, 2020 at 09:19:00PM +0000, Kirsher, Jeffrey T wrote:
> > > -----Original Message-----
> > > From: Bjorn Helgaas <helgaas@kernel.org>
> > > Sent: Friday, May 1, 2020 13:58
> > > To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > > Cc: linux-kernel-mentees@lists.linuxfoundation.org; bjorn@helgaas.com;
> > > skhan@linuxfoundation.org; rjw@rjwysocki.net; Kirsher, Jeffrey T
> > > <jeffrey.t.kirsher@intel.com>; Brandeburg, Jesse
> > > <jesse.brandeburg@intel.com>
> > > Subject: Re: [Linux-kernel-mentees] [PATCH v1] ethernet: intel: e1000: Convert
> > > to dev_pm_ops
> > >
> > > [+cc Jeff, Jesse]
> > >
> > > On Fri, Apr 10, 2020 at 06:14:19PM +0530, Vaibhav Gupta wrote:
> > > > Convert the legacy callback .suspend() and .resume() to the generic
> > > > ones.
> > > >
> > > > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > > > ---
> > > >  drivers/net/ethernet/intel/e1000/e1000_main.c | 47
> > > > +++++--------------
> > > >  1 file changed, 12 insertions(+), 35 deletions(-)
> > [Kirsher, Jeffrey T]
> >
> > Was there a reason why this patch was not at least CC'd to
> > intel-wired-lan@lists.osuosl.org mailing list for all Intel wired
> > LAN driver changes?  Thank you Bjorn for at least adding Jesse and
> > myself to the thread.
>
> Don't worry, this is potentially part of a mentoring project, and
> we're just trying to shake out trivial issues first before throwing
> Vaibhav straight into the lions' den, so to speak.
>
> > On top of the potential issues Bjorn pointed out, this could cause
> > regression issues that can not fully be validated since this driver
> > is really old and all supported devices may no longer be available
> > to test against.
>
> Understood.  The problem we're trying to solve is that the PCI
> core carries quite a bit of code to support both the legacy power
> management and the "new" (now 10 year-old) generic scheme.  That
> extra code is its own source of bugs since it's hard to keep both
> paths up to date and tested.
>
> > > > diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c
> > > > b/drivers/net/ethernet/intel/e1000/e1000_main.c
> > > > index 2bced34c19ba..09a6ef46be96 100644
> > > > --- a/drivers/net/ethernet/intel/e1000/e1000_main.c
> > > > +++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
> > > > @@ -152,8 +152,8 @@ static int e1000_vlan_rx_kill_vid(struct
> > > > net_device *netdev,  static void e1000_restore_vlan(struct
> > > > e1000_adapter *adapter);
> > > >
> > > >  #ifdef CONFIG_PM
> > > > -static int e1000_suspend(struct pci_dev *pdev, pm_message_t state);
> > > > -static int e1000_resume(struct pci_dev *pdev);
> > > > +static int e1000_suspend(struct device *dev); static int
> > > > +e1000_resume(struct device *dev);
> > > >  #endif
> > > >  static void e1000_shutdown(struct pci_dev *pdev);
> > > >
> > > > @@ -179,16 +179,16 @@ static const struct pci_error_handlers
> > > e1000_err_handler = {
> > > >   .resume = e1000_io_resume,
> > > >  };
> > > >
> > > > +static SIMPLE_DEV_PM_OPS(e1000_pm_ops, e1000_suspend,
> > > e1000_resume);
> > > > +
> > > >  static struct pci_driver e1000_driver = {
> > > >   .name     = e1000_driver_name,
> > > >   .id_table = e1000_pci_tbl,
> > > >   .probe    = e1000_probe,
> > > >   .remove   = e1000_remove,
> > > > -#ifdef CONFIG_PM
> > > > - /* Power Management Hooks */
> > > > - .suspend  = e1000_suspend,
> > > > - .resume   = e1000_resume,
> > > > -#endif
> > > > + .driver = {
> > > > +         .pm = &e1000_pm_ops,
> > > > + },
> > > >   .shutdown = e1000_shutdown,
> > > >   .err_handler = &e1000_err_handler
> > > >  };
> > > > @@ -5052,9 +5052,6 @@ static int __e1000_shutdown(struct pci_dev *pdev,
> > > bool *enable_wake)
> > > >   struct e1000_hw *hw = &adapter->hw;
> > > >   u32 ctrl, ctrl_ext, rctl, status;
> > > >   u32 wufc = adapter->wol;
> > > > -#ifdef CONFIG_PM
> > > > - int retval = 0;
> > > > -#endif
> > > >
> > > >   netif_device_detach(netdev);
> > > >
> > > > @@ -5068,12 +5065,6 @@ static int __e1000_shutdown(struct pci_dev
> > > *pdev, bool *enable_wake)
> > > >           e1000_down(adapter);
> > > >   }
> > > >
> > > > -#ifdef CONFIG_PM
> > > > - retval = pci_save_state(pdev);
> > > > - if (retval)
> > > > -         return retval;
> > > > -#endif
> > > > -
> > > >   status = er32(STATUS);
> > > >   if (status & E1000_STATUS_LU)
> > > >           wufc &= ~E1000_WUFC_LNKC;
> > > > @@ -5135,36 +5126,22 @@ static int __e1000_shutdown(struct pci_dev
> > > > *pdev, bool *enable_wake)  }
> > > >
> > > >  #ifdef CONFIG_PM
> > > > -static int e1000_suspend(struct pci_dev *pdev, pm_message_t state)
> > > > +static int e1000_suspend(struct device *dev)
> > > >  {
> > > > - int retval;
> > > > + struct pci_dev *pdev = to_pci_dev(dev);
> > > >   bool wake;
> > > >
> > > > - retval = __e1000_shutdown(pdev, &wake);
> > > > - if (retval)
> > > > -         return retval;
> > > > -
> > > > - if (wake) {
> > > > -         pci_prepare_to_sleep(pdev);
> > > > - } else {
> > > > -         pci_wake_from_d3(pdev, false);
> > >
> > > I think there's a case where this changes the behavior because we normally set
> > > the device wakeup enable to adapter->wol, but the "wake"
> > > returned from __e1000_shutdown() is sometimes different.
> > >
> > >   e1000_probe
> > >     adapter->wol = adapter->eeprom_wol;      # assume adapter->wol == 1
> > >     device_set_wakeup_enable(adapter->wol);
> > >
> > >   Existing code:
> > >     e1000_suspend
> > >       __e1000_shutdown(&wake)                # assume returns wake == 0
> > >       pci_wake_from_d3(false)
> > >         pci_enable_wake(PCI_D3hot, false)    # <-- compare
> > >
> > >   New code using generic PM ops:
> > >     pci_pm_suspend
> > >       e1000_suspend
> > >         __e1000_shutdown(&wake)              # returns wake == 0 (ignored)
> > >     pci_pm_suspend_noirq
> > >       pci_prepare_to_sleep
> > >         wakeup = device_may_wakeup()         # returns 1
> > >         pci_enable_wake(PCI_D3hot, true)     # <-- different!
> > >
> > > I sort of suspect that __e1000_shutdown() should call
> > > device_set_wakeup_enable() when it updates the chip's wake-on-lan
> > > registers, but the driver maintainers would know better.
>
> If you have any ideas about this, or maybe patterns in newer Intel
> drivers that could be followed here, we'd love to hear them.
>
> If you think it's impossible to update e1000 to generic power
> management, it'd be useful to know that, too, so we can move on to
> other drivers.
Is it safe to assume that we should leave e1000 for now? As
the thread seems to be discontinued.

--Vaibhav Gupta
>
> > > > -         pci_set_power_state(pdev, PCI_D3hot);
> > > > - }
> > > > -
> > > > - return 0;
> > > > + return __e1000_shutdown(pdev, &wake);
> > > >  }
> > > >
> > > > -static int e1000_resume(struct pci_dev *pdev)
> > > > +static int e1000_resume(struct device *dev)
> > > >  {
> > > > + struct pci_dev *pdev = to_pci_dev(dev);
> > > >   struct net_device *netdev = pci_get_drvdata(pdev);
> > > >   struct e1000_adapter *adapter = netdev_priv(netdev);
> > > >   struct e1000_hw *hw = &adapter->hw;
> > > >   u32 err;
> > > >
> > > > - pci_set_power_state(pdev, PCI_D0);
> > > > - pci_restore_state(pdev);
> > > > - pci_save_state(pdev);
> > > > -
> > > >   if (adapter->need_ioport)
> > > >           err = pci_enable_device(pdev);
> > > >   else
> > > > --
> > > > 2.26.0
> > > >
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
