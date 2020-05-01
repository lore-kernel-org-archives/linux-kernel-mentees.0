Return-Path: <SRS0=To0o=6P=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7272AC4725C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 May 2020 20:58:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336B4208DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 May 2020 20:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5ESUHOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 336B4208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0B16489219;
	Fri,  1 May 2020 20:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JWenbB5eeS7; Fri,  1 May 2020 20:58:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4649F8928C;
	Fri,  1 May 2020 20:58:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B781C0888;
	Fri,  1 May 2020 20:58:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CF4DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 May 2020 20:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2DF0425FB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 May 2020 20:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IHYOW12ufEmH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 May 2020 20:58:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id D5A67260A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 May 2020 20:58:05 +0000 (UTC)
Received: from localhost (mobile-166-175-184-168.mycingular.net
 [166.175.184.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17409208DB;
 Fri,  1 May 2020 20:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588366685;
 bh=xE4zncjQOwEIuP7zsHQtGM1yzd2qplrlL9IXMaWpZkk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=n5ESUHOusM70DyWTzeyEBxyVINW5HrIQ6xvx3Hpz9BsShD8Ntuclwx2HSPgI6xiPQ
 XGYBLcIey9j+oEnXukO5ri8CJzxbdEo7WiXIyEacCNF1fHOjTp3lFBCreU78d5F4If
 uPsdRoZ3lPaBAgiVVqIKL2TvXVUSiMaTDwxv17vM=
Date: Fri, 1 May 2020 15:58:03 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200501205803.GA129132@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410124418.34640-1-vaibhavgupta40@gmail.com>
Cc: rjw@rjwysocki.net, Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

[+cc Jeff, Jesse]

On Fri, Apr 10, 2020 at 06:14:19PM +0530, Vaibhav Gupta wrote:
> Convert the legacy callback .suspend() and .resume()
> to the generic ones.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/net/ethernet/intel/e1000/e1000_main.c | 47 +++++--------------
>  1 file changed, 12 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
> index 2bced34c19ba..09a6ef46be96 100644
> --- a/drivers/net/ethernet/intel/e1000/e1000_main.c
> +++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
> @@ -152,8 +152,8 @@ static int e1000_vlan_rx_kill_vid(struct net_device *netdev,
>  static void e1000_restore_vlan(struct e1000_adapter *adapter);
>  
>  #ifdef CONFIG_PM
> -static int e1000_suspend(struct pci_dev *pdev, pm_message_t state);
> -static int e1000_resume(struct pci_dev *pdev);
> +static int e1000_suspend(struct device *dev);
> +static int e1000_resume(struct device *dev);
>  #endif
>  static void e1000_shutdown(struct pci_dev *pdev);
>  
> @@ -179,16 +179,16 @@ static const struct pci_error_handlers e1000_err_handler = {
>  	.resume = e1000_io_resume,
>  };
>  
> +static SIMPLE_DEV_PM_OPS(e1000_pm_ops, e1000_suspend, e1000_resume);
> +
>  static struct pci_driver e1000_driver = {
>  	.name     = e1000_driver_name,
>  	.id_table = e1000_pci_tbl,
>  	.probe    = e1000_probe,
>  	.remove   = e1000_remove,
> -#ifdef CONFIG_PM
> -	/* Power Management Hooks */
> -	.suspend  = e1000_suspend,
> -	.resume   = e1000_resume,
> -#endif
> +	.driver = {
> +		.pm = &e1000_pm_ops,
> +	},
>  	.shutdown = e1000_shutdown,
>  	.err_handler = &e1000_err_handler
>  };
> @@ -5052,9 +5052,6 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
>  	struct e1000_hw *hw = &adapter->hw;
>  	u32 ctrl, ctrl_ext, rctl, status;
>  	u32 wufc = adapter->wol;
> -#ifdef CONFIG_PM
> -	int retval = 0;
> -#endif
>  
>  	netif_device_detach(netdev);
>  
> @@ -5068,12 +5065,6 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
>  		e1000_down(adapter);
>  	}
>  
> -#ifdef CONFIG_PM
> -	retval = pci_save_state(pdev);
> -	if (retval)
> -		return retval;
> -#endif
> -
>  	status = er32(STATUS);
>  	if (status & E1000_STATUS_LU)
>  		wufc &= ~E1000_WUFC_LNKC;
> @@ -5135,36 +5126,22 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
>  }
>  
>  #ifdef CONFIG_PM
> -static int e1000_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int e1000_suspend(struct device *dev)
>  {
> -	int retval;
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	bool wake;
>  
> -	retval = __e1000_shutdown(pdev, &wake);
> -	if (retval)
> -		return retval;
> -
> -	if (wake) {
> -		pci_prepare_to_sleep(pdev);
> -	} else {
> -		pci_wake_from_d3(pdev, false);

I think there's a case where this changes the behavior because we
normally set the device wakeup enable to adapter->wol, but the "wake"
returned from __e1000_shutdown() is sometimes different.

  e1000_probe
    adapter->wol = adapter->eeprom_wol;      # assume adapter->wol == 1
    device_set_wakeup_enable(adapter->wol);

  Existing code:
    e1000_suspend
      __e1000_shutdown(&wake)                # assume returns wake == 0
      pci_wake_from_d3(false)
        pci_enable_wake(PCI_D3hot, false)    # <-- compare

  New code using generic PM ops:
    pci_pm_suspend
      e1000_suspend
        __e1000_shutdown(&wake)              # returns wake == 0 (ignored)
    pci_pm_suspend_noirq
      pci_prepare_to_sleep
        wakeup = device_may_wakeup()         # returns 1
        pci_enable_wake(PCI_D3hot, true)     # <-- different!

I sort of suspect that __e1000_shutdown() should call
device_set_wakeup_enable() when it updates the chip's wake-on-lan
registers, but the driver maintainers would know better.

> -		pci_set_power_state(pdev, PCI_D3hot);
> -	}
> -
> -	return 0;
> +	return __e1000_shutdown(pdev, &wake);
>  }
>  
> -static int e1000_resume(struct pci_dev *pdev)
> +static int e1000_resume(struct device *dev)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct net_device *netdev = pci_get_drvdata(pdev);
>  	struct e1000_adapter *adapter = netdev_priv(netdev);
>  	struct e1000_hw *hw = &adapter->hw;
>  	u32 err;
>  
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_restore_state(pdev);
> -	pci_save_state(pdev);
> -
>  	if (adapter->need_ioport)
>  		err = pci_enable_device(pdev);
>  	else
> -- 
> 2.26.0
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
