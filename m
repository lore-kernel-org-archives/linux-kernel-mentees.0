Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A7DC83009
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:29:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 924CB208FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:29:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxwYE2w2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 924CB208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A4738827C;
	Tue, 28 Apr 2020 17:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1matsRqWysGB; Tue, 28 Apr 2020 17:29:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 710D9880F4;
	Tue, 28 Apr 2020 17:29:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AFFEC0863;
	Tue, 28 Apr 2020 17:29:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FBB1C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 511A78648E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvIkdEGWwNxd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:29:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CAADE86463
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:29:19 +0000 (UTC)
Received: from localhost (mobile-166-175-187-210.mycingular.net
 [166.175.187.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38D1C2085B;
 Tue, 28 Apr 2020 17:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588094959;
 bh=KVlfB6OONnLYWB6zTD4NzqP3muDeWV4yVUIppLNLLR4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=MxwYE2w2lKs5eDKpwbNX8Fs+0pJ2GijfEqIhf7nzZ8rNyGiqrQMqA93fspMHjHEQy
 Gw+tm+13xO0WK8HHvcXokteJtLGtgYcWO7MhuD9yqRTerZnvx93JLJfSxb/V0s16tO
 KFYuby1C0slOe4Y0mFMyK52Kj6NclZLuIfB8arWs=
Date: Tue, 28 Apr 2020 12:29:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200428172917.GA177492@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428144314.24533-3-vaibhavgupta40@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 Martin Habets <mhabets@solarflare.com>, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Shannon Nelson <snelson@pensando.io>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/2] realtek/8139cp: Remove
 Legacy Power Management
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

On Tue, Apr 28, 2020 at 08:13:14PM +0530, Vaibhav Gupta wrote:
> Upgrade power management from legacy to generic using dev_pm_ops.
> 
> Add "__maybe_unused" attribute to resume() and susend() callbacks
> definition to suppress compiler warnings.
> 
> Generic callback requires an argument of type "struct device*". Hence,
> convert it to "struct net_device*" using "dev_get_drv_data()" to use
> it in the callback.
> 
> Most of the cleaning part is to remove pci_save_state(),
> pci_set_power_state(), etc power management function calls.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/net/ethernet/realtek/8139cp.c | 25 +++++++------------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/realtek/8139cp.c b/drivers/net/ethernet/realtek/8139cp.c
> index 60d342f82fb3..4f2fb1393966 100644
> --- a/drivers/net/ethernet/realtek/8139cp.c
> +++ b/drivers/net/ethernet/realtek/8139cp.c
> @@ -2054,10 +2054,9 @@ static void cp_remove_one (struct pci_dev *pdev)
>  	free_netdev(dev);
>  }
>  
> -#ifdef CONFIG_PM
> -static int cp_suspend (struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused cp_suspend(struct device *device)
>  {
> -	struct net_device *dev = pci_get_drvdata(pdev);
> +	struct net_device *dev = dev_get_drvdata(device);
>  	struct cp_private *cp = netdev_priv(dev);
>  	unsigned long flags;
>  
> @@ -2075,16 +2074,12 @@ static int cp_suspend (struct pci_dev *pdev, pm_message_t state)
>  
>  	spin_unlock_irqrestore (&cp->lock, flags);
>  
> -	pci_save_state(pdev);
> -	pci_enable_wake(pdev, pci_choose_state(pdev, state), cp->wol_enabled);

This one is a little more interesting because it relies on the driver
state (cp->wol_enabled).  IIUC, the corresponding pci_enable_wake() in
the generic path is in pci_prepare_to_sleep() (called from
pci_pm_suspend_noirq()).

But of course the generic path doesn't look at cp->wol_enabled.  It
looks at device_may_wakeup(), but I don't know whether there's a
connection between that and cp->wol_enabled.

> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> -
>  	return 0;
>  }
>  
> -static int cp_resume (struct pci_dev *pdev)
> +static int __maybe_unused cp_resume(struct device *device)
>  {
> -	struct net_device *dev = pci_get_drvdata (pdev);
> +	struct net_device *dev = dev_get_drvdata(device);
>  	struct cp_private *cp = netdev_priv(dev);
>  	unsigned long flags;
>  
> @@ -2093,10 +2088,6 @@ static int cp_resume (struct pci_dev *pdev)
>  
>  	netif_device_attach (dev);
>  
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_restore_state(pdev);
> -	pci_enable_wake(pdev, PCI_D0, 0);
> -
>  	/* FIXME: sh*t may happen if the Rx ring buffer is depleted */
>  	cp_init_rings_index (cp);
>  	cp_init_hw (cp);
> @@ -2111,7 +2102,6 @@ static int cp_resume (struct pci_dev *pdev)
>  
>  	return 0;
>  }
> -#endif /* CONFIG_PM */
>  
>  static const struct pci_device_id cp_pci_tbl[] = {
>          { PCI_DEVICE(PCI_VENDOR_ID_REALTEK,     PCI_DEVICE_ID_REALTEK_8139), },
> @@ -2120,15 +2110,14 @@ static const struct pci_device_id cp_pci_tbl[] = {
>  };
>  MODULE_DEVICE_TABLE(pci, cp_pci_tbl);
>  
> +static SIMPLE_DEV_PM_OPS(cp_pm_ops, cp_suspend, cp_resume);
> +
>  static struct pci_driver cp_driver = {
>  	.name         = DRV_NAME,
>  	.id_table     = cp_pci_tbl,
>  	.probe        =	cp_init_one,
>  	.remove       = cp_remove_one,
> -#ifdef CONFIG_PM
> -	.resume       = cp_resume,
> -	.suspend      = cp_suspend,
> -#endif
> +	.driver.pm    = &cp_pm_ops,
>  };
>  
>  module_pci_driver(cp_driver);
> -- 
> 2.26.2
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
