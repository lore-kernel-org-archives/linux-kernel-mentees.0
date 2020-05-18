Return-Path: <SRS0=A5MH=7A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDC8C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 May 2020 15:27:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19117207D3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 May 2020 15:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wHP0fFes"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19117207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC71C879AE;
	Mon, 18 May 2020 15:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bd09vuohatxJ; Mon, 18 May 2020 15:27:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E9CFF86569;
	Mon, 18 May 2020 15:27:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEA2AC0888;
	Mon, 18 May 2020 15:27:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E354C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F0E9888359
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9LNq1seHuei
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:27:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 09C5888338
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:27:04 +0000 (UTC)
Received: from localhost (mobile-166-175-190-200.mycingular.net
 [166.175.190.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 684A720758;
 Mon, 18 May 2020 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589815623;
 bh=RjHrCNZ8GKMqpb/jTa5tUW5sf7F+AqOfR2aX0M7DXeY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=wHP0fFesJcm7v9PJ6J7yNduo7j8Eau2SHDOGjAZTqgJXpL39TPD2R7Qf1ozbaUhSR
 MA5mvo/XG1Hn4Srqg/epZgT14cNBKvGaL88X/H8BrjiO1t9GelM0ZpzbAqAWQXAPGr
 TPH7Q5kFad7b/+fbLIGG0nITeL0MvQzjZj3TSSrQ=
Date: Mon, 18 May 2020 10:27:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Message-ID: <20200518152701.GA930338@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPBsFfANa2ktd5h3YGVmPQMasNapzPkM3yBZ0icp8++53bbcZw@mail.gmail.com>
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

On Mon, May 18, 2020 at 08:37:13PM +0530, Vaibhav Gupta wrote:
> On Sat, 2 May 2020 at 03:15, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, May 01, 2020 at 09:19:00PM +0000, Kirsher, Jeffrey T wrote:
> > > > -----Original Message-----
> > > > From: Bjorn Helgaas <helgaas@kernel.org>
> > > > Sent: Friday, May 1, 2020 13:58
> > > > To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > > > Cc: linux-kernel-mentees@lists.linuxfoundation.org; bjorn@helgaas.com;
> > > > skhan@linuxfoundation.org; rjw@rjwysocki.net; Kirsher, Jeffrey T
> > > > <jeffrey.t.kirsher@intel.com>; Brandeburg, Jesse
> > > > <jesse.brandeburg@intel.com>
> > > > Subject: Re: [Linux-kernel-mentees] [PATCH v1] ethernet: intel: e1000: Convert
> > > > to dev_pm_ops
> > > >
> > > > [+cc Jeff, Jesse]
> > > >
> > > > On Fri, Apr 10, 2020 at 06:14:19PM +0530, Vaibhav Gupta wrote:
> > > > > Convert the legacy callback .suspend() and .resume() to the generic
> > > > > ones.
> > > > >
> > > > > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > > > > ---
> > > > >  drivers/net/ethernet/intel/e1000/e1000_main.c | 47
> > > > > +++++--------------
> > > > >  1 file changed, 12 insertions(+), 35 deletions(-)
> > > [Kirsher, Jeffrey T]
> > >
> > > Was there a reason why this patch was not at least CC'd to
> > > intel-wired-lan@lists.osuosl.org mailing list for all Intel wired
> > > LAN driver changes?  Thank you Bjorn for at least adding Jesse and
> > > myself to the thread.
> >
> > Don't worry, this is potentially part of a mentoring project, and
> > we're just trying to shake out trivial issues first before throwing
> > Vaibhav straight into the lions' den, so to speak.
> >
> > > On top of the potential issues Bjorn pointed out, this could cause
> > > regression issues that can not fully be validated since this driver
> > > is really old and all supported devices may no longer be available
> > > to test against.
> >
> > Understood.  The problem we're trying to solve is that the PCI
> > core carries quite a bit of code to support both the legacy power
> > management and the "new" (now 10 year-old) generic scheme.  That
> > extra code is its own source of bugs since it's hard to keep both
> > paths up to date and tested.
> >
> > > > > diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c
> > > > > b/drivers/net/ethernet/intel/e1000/e1000_main.c
> > > > > index 2bced34c19ba..09a6ef46be96 100644
> > > > > --- a/drivers/net/ethernet/intel/e1000/e1000_main.c
> > > > > +++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
> > > > > @@ -152,8 +152,8 @@ static int e1000_vlan_rx_kill_vid(struct
> > > > > net_device *netdev,  static void e1000_restore_vlan(struct
> > > > > e1000_adapter *adapter);
> > > > >
> > > > >  #ifdef CONFIG_PM
> > > > > -static int e1000_suspend(struct pci_dev *pdev, pm_message_t state);
> > > > > -static int e1000_resume(struct pci_dev *pdev);
> > > > > +static int e1000_suspend(struct device *dev); static int
> > > > > +e1000_resume(struct device *dev);
> > > > >  #endif
> > > > >  static void e1000_shutdown(struct pci_dev *pdev);
> > > > >
> > > > > @@ -179,16 +179,16 @@ static const struct pci_error_handlers
> > > > e1000_err_handler = {
> > > > >   .resume = e1000_io_resume,
> > > > >  };
> > > > >
> > > > > +static SIMPLE_DEV_PM_OPS(e1000_pm_ops, e1000_suspend,
> > > > e1000_resume);
> > > > > +
> > > > >  static struct pci_driver e1000_driver = {
> > > > >   .name     = e1000_driver_name,
> > > > >   .id_table = e1000_pci_tbl,
> > > > >   .probe    = e1000_probe,
> > > > >   .remove   = e1000_remove,
> > > > > -#ifdef CONFIG_PM
> > > > > - /* Power Management Hooks */
> > > > > - .suspend  = e1000_suspend,
> > > > > - .resume   = e1000_resume,
> > > > > -#endif
> > > > > + .driver = {
> > > > > +         .pm = &e1000_pm_ops,
> > > > > + },
> > > > >   .shutdown = e1000_shutdown,
> > > > >   .err_handler = &e1000_err_handler
> > > > >  };
> > > > > @@ -5052,9 +5052,6 @@ static int __e1000_shutdown(struct pci_dev *pdev,
> > > > bool *enable_wake)
> > > > >   struct e1000_hw *hw = &adapter->hw;
> > > > >   u32 ctrl, ctrl_ext, rctl, status;
> > > > >   u32 wufc = adapter->wol;
> > > > > -#ifdef CONFIG_PM
> > > > > - int retval = 0;
> > > > > -#endif
> > > > >
> > > > >   netif_device_detach(netdev);
> > > > >
> > > > > @@ -5068,12 +5065,6 @@ static int __e1000_shutdown(struct pci_dev
> > > > *pdev, bool *enable_wake)
> > > > >           e1000_down(adapter);
> > > > >   }
> > > > >
> > > > > -#ifdef CONFIG_PM
> > > > > - retval = pci_save_state(pdev);
> > > > > - if (retval)
> > > > > -         return retval;
> > > > > -#endif
> > > > > -
> > > > >   status = er32(STATUS);
> > > > >   if (status & E1000_STATUS_LU)
> > > > >           wufc &= ~E1000_WUFC_LNKC;
> > > > > @@ -5135,36 +5126,22 @@ static int __e1000_shutdown(struct pci_dev
> > > > > *pdev, bool *enable_wake)  }
> > > > >
> > > > >  #ifdef CONFIG_PM
> > > > > -static int e1000_suspend(struct pci_dev *pdev, pm_message_t state)
> > > > > +static int e1000_suspend(struct device *dev)
> > > > >  {
> > > > > - int retval;
> > > > > + struct pci_dev *pdev = to_pci_dev(dev);
> > > > >   bool wake;
> > > > >
> > > > > - retval = __e1000_shutdown(pdev, &wake);
> > > > > - if (retval)
> > > > > -         return retval;
> > > > > -
> > > > > - if (wake) {
> > > > > -         pci_prepare_to_sleep(pdev);
> > > > > - } else {
> > > > > -         pci_wake_from_d3(pdev, false);
> > > >
> > > > I think there's a case where this changes the behavior because we normally set
> > > > the device wakeup enable to adapter->wol, but the "wake"
> > > > returned from __e1000_shutdown() is sometimes different.
> > > >
> > > >   e1000_probe
> > > >     adapter->wol = adapter->eeprom_wol;      # assume adapter->wol == 1
> > > >     device_set_wakeup_enable(adapter->wol);
> > > >
> > > >   Existing code:
> > > >     e1000_suspend
> > > >       __e1000_shutdown(&wake)                # assume returns wake == 0
> > > >       pci_wake_from_d3(false)
> > > >         pci_enable_wake(PCI_D3hot, false)    # <-- compare
> > > >
> > > >   New code using generic PM ops:
> > > >     pci_pm_suspend
> > > >       e1000_suspend
> > > >         __e1000_shutdown(&wake)              # returns wake == 0 (ignored)
> > > >     pci_pm_suspend_noirq
> > > >       pci_prepare_to_sleep
> > > >         wakeup = device_may_wakeup()         # returns 1
> > > >         pci_enable_wake(PCI_D3hot, true)     # <-- different!
> > > >
> > > > I sort of suspect that __e1000_shutdown() should call
> > > > device_set_wakeup_enable() when it updates the chip's wake-on-lan
> > > > registers, but the driver maintainers would know better.
> >
> > If you have any ideas about this, or maybe patterns in newer Intel
> > drivers that could be followed here, we'd love to hear them.
> >
> > If you think it's impossible to update e1000 to generic power
> > management, it'd be useful to know that, too, so we can move on to
> > other drivers.
>
> Is it safe to assume that we should leave e1000 for now? As
> the thread seems to be discontinued.

My suggestion: update the patch to reflect my feedback above, and post
what we believe to be the correct thing to the appropriate upstream
lists:

  Jeff Kirsher <jeffrey.t.kirsher@intel.com>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  David S. Miller <davem@davemloft.net>
  Rafael J. Wysocki <rjw@rjwysocki.net>
  intel-wired-lan@lists.osuosl.org
  netdev@vger.kernel.org
  linux-pm@vger.kernel.org
  linux-pci@vger.kernel.org

The maintainers may want to defer it for now because it's old hardware
that's hard to test, and that's OK.  But at least we'll have the patch
available, and if/when we get to the point of removing legacy PM from
the PCI core, we can revisit this.

What we learn about wake-on-LAN here will probably apply to other
drivers as well.

> > > > > -         pci_set_power_state(pdev, PCI_D3hot);
> > > > > - }
> > > > > -
> > > > > - return 0;
> > > > > + return __e1000_shutdown(pdev, &wake);
> > > > >  }
> > > > >
> > > > > -static int e1000_resume(struct pci_dev *pdev)
> > > > > +static int e1000_resume(struct device *dev)
> > > > >  {
> > > > > + struct pci_dev *pdev = to_pci_dev(dev);
> > > > >   struct net_device *netdev = pci_get_drvdata(pdev);
> > > > >   struct e1000_adapter *adapter = netdev_priv(netdev);
> > > > >   struct e1000_hw *hw = &adapter->hw;
> > > > >   u32 err;
> > > > >
> > > > > - pci_set_power_state(pdev, PCI_D0);
> > > > > - pci_restore_state(pdev);
> > > > > - pci_save_state(pdev);
> > > > > -
> > > > >   if (adapter->need_ioport)
> > > > >           err = pci_enable_device(pdev);
> > > > >   else
> > > > > --
> > > > > 2.26.0
> > > > >
> > _______________________________________________
> > Linux-kernel-mentees mailing list
> > Linux-kernel-mentees@lists.linuxfoundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
