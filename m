Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9F5C5518A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 03:47:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62DD720706
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 03:47:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBO6rVx+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62DD720706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1A7D823251;
	Fri, 24 Apr 2020 03:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bed306c8KMhc; Fri, 24 Apr 2020 03:47:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 61ED320485;
	Fri, 24 Apr 2020 03:47:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47F70C1AE2;
	Fri, 24 Apr 2020 03:47:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 972F9C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 03:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 90925886C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 03:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NdXLl15AuSHY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 03:47:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 165EE886B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 03:47:35 +0000 (UTC)
Received: from localhost (mobile-166-175-187-210.mycingular.net
 [166.175.187.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C20720706;
 Fri, 24 Apr 2020 03:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587700054;
 bh=JZocvxA4gCxtORYoLVD2uh/OvgZFbJ3eVtYzA/aNPFo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=nBO6rVx+xI5UKBYCp5PPgmCp4E6+fhx7wCMXmVsqjOlHoCuoh8HGXk84uxIxOY7iw
 E+PPMmFicFkyKDccRsX4OQAGkLQXgxLZoImnDZglTb39nxFtquPDgS2zEGEkJFVdtM
 ZeWAMbX+ACkDn2zxswg1IRvouBNrPPlnkcoBXt5I=
Date: Thu, 23 Apr 2020 22:47:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200424034733.GA36790@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423132759.38191-2-vaibhavgupta40@gmail.com>
Cc: rjw@rjwysocki.net, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 2/2] realtek/8139cp: Remove
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

On Thu, Apr 23, 2020 at 06:58:01PM +0530, Vaibhav Gupta wrote:
> Upgrade Power Management from legacy to generic using dev_pm_ops.
> 
> Remove pci_save_sate(), pci_set_state(), etc. No need of directive
> '#ifdef CONFIG_PM' as, if CONFIG_PM is not defined, the binding
> will be by deafult set to NULL.

s/deafult/default/

I didn't quite follow this argument.  SIMPLE_DEV_PM_OPS() is defined
to SET_SYSTEM_SLEEP_PM_OPS(), and SET_SYSTEM_SLEEP_PM_OPS() is defined
to nothing unless CONFIG_PM_SLEEP (not CONFIG_PM).

But in any case, we don't want cp_suspend() and cp_resume() to be
compiled at all if they're not referenced.  So I think converting the
"#ifdef CONFIG_PM" to "#ifdef CONFIG_PM_SLEEP" is the right thing.

> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/net/ethernet/realtek/8139cp.c | 25 +++++++------------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/realtek/8139cp.c b/drivers/net/ethernet/realtek/8139cp.c
> index 60d342f82fb3..e2e79cf4e1fa 100644
> --- a/drivers/net/ethernet/realtek/8139cp.c
> +++ b/drivers/net/ethernet/realtek/8139cp.c
> @@ -2054,10 +2054,9 @@ static void cp_remove_one (struct pci_dev *pdev)
>  	free_netdev(dev);
>  }
>  
> -#ifdef CONFIG_PM
> -static int cp_suspend (struct pci_dev *pdev, pm_message_t state)
> +static int cp_suspend(struct device *device)
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
> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> -
>  	return 0;
>  }
>  
> -static int cp_resume (struct pci_dev *pdev)
> +static int cp_resume(struct device *device)
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
