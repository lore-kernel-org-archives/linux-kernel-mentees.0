Return-Path: <SRS0=To0o=6P=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F174CC35280
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 May 2020 21:19:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C156120787
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 May 2020 21:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C156120787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 778CF881B7;
	Fri,  1 May 2020 21:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zQity6nNv+OB; Fri,  1 May 2020 21:19:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3DA9B884F6;
	Fri,  1 May 2020 21:19:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24247C0864;
	Fri,  1 May 2020 21:19:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E985C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 May 2020 21:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 82D7320130
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 May 2020 21:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PgqNXpkqxxsI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 May 2020 21:19:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by silver.osuosl.org (Postfix) with ESMTPS id 99DE425E17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 May 2020 21:19:05 +0000 (UTC)
IronPort-SDR: mVgWau7P3b/CQw1ex0uxeyWjo6gfBChWq+L8sXV2dOp6c6+kTmkofjhZ5dcvVSNGAFX+xHb9vC
 nxKXxr5Jx1Lg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 14:19:04 -0700
IronPort-SDR: pshqECz9zAQmCsVeDGgYfLzz/RlI62YjP8eTLH6xsKSOXOsEPLHjVng9OUC8KRJkMEmaafE0Yq
 K+DgkW3qKK1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,341,1583222400"; d="scan'208";a="460032067"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by fmsmga005.fm.intel.com with ESMTP; 01 May 2020 14:19:04 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.248]) by
 ORSMSX109.amr.corp.intel.com ([169.254.11.125]) with mapi id 14.03.0439.000;
 Fri, 1 May 2020 14:19:00 -0700
From: "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Vaibhav Gupta
 <vaibhavgupta40@gmail.com>
Thread-Topic: [Linux-kernel-mentees] [PATCH v1] ethernet: intel: e1000:
 Convert to dev_pm_ops
Thread-Index: AQHWH/s3xJHe35HRpEO2P43z3BnfH6iTuiIA
Date: Fri, 1 May 2020 21:19:00 +0000
Message-ID: <61CC2BC414934749BD9F5BF3D5D9404498682656@ORSMSX112.amr.corp.intel.com>
References: <20200410124418.34640-1-vaibhavgupta40@gmail.com>
 <20200501205803.GA129132@bjorn-Precision-5520>
In-Reply-To: <20200501205803.GA129132@bjorn-Precision-5520>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, "Brandeburg,
 Jesse" <jesse.brandeburg@intel.com>
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

> -----Original Message-----
> From: Bjorn Helgaas <helgaas@kernel.org>
> Sent: Friday, May 1, 2020 13:58
> To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> Cc: linux-kernel-mentees@lists.linuxfoundation.org; bjorn@helgaas.com;
> skhan@linuxfoundation.org; rjw@rjwysocki.net; Kirsher, Jeffrey T
> <jeffrey.t.kirsher@intel.com>; Brandeburg, Jesse
> <jesse.brandeburg@intel.com>
> Subject: Re: [Linux-kernel-mentees] [PATCH v1] ethernet: intel: e1000: Convert
> to dev_pm_ops
> 
> [+cc Jeff, Jesse]
> 
> On Fri, Apr 10, 2020 at 06:14:19PM +0530, Vaibhav Gupta wrote:
> > Convert the legacy callback .suspend() and .resume() to the generic
> > ones.
> >
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/net/ethernet/intel/e1000/e1000_main.c | 47
> > +++++--------------
> >  1 file changed, 12 insertions(+), 35 deletions(-)
[Kirsher, Jeffrey T] 

Was there a reason why this patch was not at least CC'd to intel-wired-lan@lists.osuosl.org mailing list for all Intel wired LAN driver changes?  Thank you Bjorn for at least adding Jesse and myself to the thread.

On top of the potential issues Bjorn pointed out, this could cause regression issues that can not fully be validated since this driver is really old and all supported devices may no longer be available to test against.

> >
> > diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c
> > b/drivers/net/ethernet/intel/e1000/e1000_main.c
> > index 2bced34c19ba..09a6ef46be96 100644
> > --- a/drivers/net/ethernet/intel/e1000/e1000_main.c
> > +++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
> > @@ -152,8 +152,8 @@ static int e1000_vlan_rx_kill_vid(struct
> > net_device *netdev,  static void e1000_restore_vlan(struct
> > e1000_adapter *adapter);
> >
> >  #ifdef CONFIG_PM
> > -static int e1000_suspend(struct pci_dev *pdev, pm_message_t state);
> > -static int e1000_resume(struct pci_dev *pdev);
> > +static int e1000_suspend(struct device *dev); static int
> > +e1000_resume(struct device *dev);
> >  #endif
> >  static void e1000_shutdown(struct pci_dev *pdev);
> >
> > @@ -179,16 +179,16 @@ static const struct pci_error_handlers
> e1000_err_handler = {
> >  	.resume = e1000_io_resume,
> >  };
> >
> > +static SIMPLE_DEV_PM_OPS(e1000_pm_ops, e1000_suspend,
> e1000_resume);
> > +
> >  static struct pci_driver e1000_driver = {
> >  	.name     = e1000_driver_name,
> >  	.id_table = e1000_pci_tbl,
> >  	.probe    = e1000_probe,
> >  	.remove   = e1000_remove,
> > -#ifdef CONFIG_PM
> > -	/* Power Management Hooks */
> > -	.suspend  = e1000_suspend,
> > -	.resume   = e1000_resume,
> > -#endif
> > +	.driver = {
> > +		.pm = &e1000_pm_ops,
> > +	},
> >  	.shutdown = e1000_shutdown,
> >  	.err_handler = &e1000_err_handler
> >  };
> > @@ -5052,9 +5052,6 @@ static int __e1000_shutdown(struct pci_dev *pdev,
> bool *enable_wake)
> >  	struct e1000_hw *hw = &adapter->hw;
> >  	u32 ctrl, ctrl_ext, rctl, status;
> >  	u32 wufc = adapter->wol;
> > -#ifdef CONFIG_PM
> > -	int retval = 0;
> > -#endif
> >
> >  	netif_device_detach(netdev);
> >
> > @@ -5068,12 +5065,6 @@ static int __e1000_shutdown(struct pci_dev
> *pdev, bool *enable_wake)
> >  		e1000_down(adapter);
> >  	}
> >
> > -#ifdef CONFIG_PM
> > -	retval = pci_save_state(pdev);
> > -	if (retval)
> > -		return retval;
> > -#endif
> > -
> >  	status = er32(STATUS);
> >  	if (status & E1000_STATUS_LU)
> >  		wufc &= ~E1000_WUFC_LNKC;
> > @@ -5135,36 +5126,22 @@ static int __e1000_shutdown(struct pci_dev
> > *pdev, bool *enable_wake)  }
> >
> >  #ifdef CONFIG_PM
> > -static int e1000_suspend(struct pci_dev *pdev, pm_message_t state)
> > +static int e1000_suspend(struct device *dev)
> >  {
> > -	int retval;
> > +	struct pci_dev *pdev = to_pci_dev(dev);
> >  	bool wake;
> >
> > -	retval = __e1000_shutdown(pdev, &wake);
> > -	if (retval)
> > -		return retval;
> > -
> > -	if (wake) {
> > -		pci_prepare_to_sleep(pdev);
> > -	} else {
> > -		pci_wake_from_d3(pdev, false);
> 
> I think there's a case where this changes the behavior because we normally set
> the device wakeup enable to adapter->wol, but the "wake"
> returned from __e1000_shutdown() is sometimes different.
> 
>   e1000_probe
>     adapter->wol = adapter->eeprom_wol;      # assume adapter->wol == 1
>     device_set_wakeup_enable(adapter->wol);
> 
>   Existing code:
>     e1000_suspend
>       __e1000_shutdown(&wake)                # assume returns wake == 0
>       pci_wake_from_d3(false)
>         pci_enable_wake(PCI_D3hot, false)    # <-- compare
> 
>   New code using generic PM ops:
>     pci_pm_suspend
>       e1000_suspend
>         __e1000_shutdown(&wake)              # returns wake == 0 (ignored)
>     pci_pm_suspend_noirq
>       pci_prepare_to_sleep
>         wakeup = device_may_wakeup()         # returns 1
>         pci_enable_wake(PCI_D3hot, true)     # <-- different!
> 
> I sort of suspect that __e1000_shutdown() should call
> device_set_wakeup_enable() when it updates the chip's wake-on-lan registers,
> but the driver maintainers would know better.
> 
> > -		pci_set_power_state(pdev, PCI_D3hot);
> > -	}
> > -
> > -	return 0;
> > +	return __e1000_shutdown(pdev, &wake);
> >  }
> >
> > -static int e1000_resume(struct pci_dev *pdev)
> > +static int e1000_resume(struct device *dev)
> >  {
> > +	struct pci_dev *pdev = to_pci_dev(dev);
> >  	struct net_device *netdev = pci_get_drvdata(pdev);
> >  	struct e1000_adapter *adapter = netdev_priv(netdev);
> >  	struct e1000_hw *hw = &adapter->hw;
> >  	u32 err;
> >
> > -	pci_set_power_state(pdev, PCI_D0);
> > -	pci_restore_state(pdev);
> > -	pci_save_state(pdev);
> > -
> >  	if (adapter->need_ioport)
> >  		err = pci_enable_device(pdev);
> >  	else
> > --
> > 2.26.0
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
