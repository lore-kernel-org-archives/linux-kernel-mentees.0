Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FBFC5518A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 03:43:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD7542064C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 03:43:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEBRQGTT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD7542064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9143C23251;
	Fri, 24 Apr 2020 03:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtyOoykbkApB; Fri, 24 Apr 2020 03:43:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CABA6203D6;
	Fri, 24 Apr 2020 03:43:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA6F0C1AE2;
	Fri, 24 Apr 2020 03:43:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07A09C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 03:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E84AE886A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 03:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id av0MEOMIINRH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 03:43:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BC6BE8869D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 03:43:47 +0000 (UTC)
Received: from localhost (mobile-166-175-187-210.mycingular.net
 [166.175.187.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 387E52064C;
 Fri, 24 Apr 2020 03:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587699827;
 bh=7WoTKwe/FGHF8fwon+Pm9zFPqVU9D/TUyNv/POFFZMU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=JEBRQGTTHxwYCNOgwdBBh29g9u3mbUSjAhAtisEPva9sKehPIOJQy8BUSWHjhlbYG
 kCWsueDaqdUI8yLp+9FiG3RWv6H5G3bAdjB+sdLGcUh40y5Nzl2HFnaPOU7FiPYC4y
 povGBGIau756BmSzfFlndpl5tk1j7BlEDsGDFz68=
Date: Thu, 23 Apr 2020 22:43:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200424034345.GA34450@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423132759.38191-1-vaibhavgupta40@gmail.com>
Cc: rjw@rjwysocki.net, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 1/2] realtek/8139too: Remove
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

If you post more that one patch in a series, it's best if you include
a cover letter with the patches being responses to the cover letter.
In this case, it would be:

  [0/2] cover letter
  -> [1/2] realtek/8139too: Remove ...
  -> [2/2] realtek/8139cp: Remove ...

On Thu, Apr 23, 2020 at 06:57:59PM +0530, Vaibhav Gupta wrote:
> Upgrade Power Management from legacy to generic using dev_pm_ops.
> 
> Remove struct pci_driver.suspend and struct pci_driver.resume bindings,
> and add struct pci_driver.driver.pm .
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/net/ethernet/realtek/8139too.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/realtek/8139too.c b/drivers/net/ethernet/realtek/8139too.c
> index 5caeb8368eab..b7c98b165256 100644
> --- a/drivers/net/ethernet/realtek/8139too.c
> +++ b/drivers/net/ethernet/realtek/8139too.c
> @@ -2603,17 +2603,13 @@ static void rtl8139_set_rx_mode (struct net_device *dev)
>  	spin_unlock_irqrestore (&tp->lock, flags);
>  }
>  
> -#ifdef CONFIG_PM
> -
> -static int rtl8139_suspend (struct pci_dev *pdev, pm_message_t state)
> +static int rtl8139_suspend(struct device *device)
>  {
> -	struct net_device *dev = pci_get_drvdata (pdev);
> +	struct net_device *dev = dev_get_drvdata(device);
>  	struct rtl8139_private *tp = netdev_priv(dev);
>  	void __iomem *ioaddr = tp->mmio_addr;
>  	unsigned long flags;
>  
> -	pci_save_state (pdev);
> -
>  	if (!netif_running (dev))
>  		return 0;
>  
> @@ -2631,38 +2627,30 @@ static int rtl8139_suspend (struct pci_dev *pdev, pm_message_t state)
>  
>  	spin_unlock_irqrestore (&tp->lock, flags);
>  
> -	pci_set_power_state (pdev, PCI_D3hot);
> -
>  	return 0;
>  }
>  
> -
> -static int rtl8139_resume (struct pci_dev *pdev)
> +static int rtl8139_resume(struct device *device)
>  {
> -	struct net_device *dev = pci_get_drvdata (pdev);
> +	struct net_device *dev = dev_get_drvdata(device);
>  
> -	pci_restore_state (pdev);
>  	if (!netif_running (dev))
>  		return 0;
> -	pci_set_power_state (pdev, PCI_D0);
> +
>  	rtl8139_init_ring (dev);
>  	rtl8139_hw_start (dev);
>  	netif_device_attach (dev);
>  	return 0;
>  }
>  
> -#endif /* CONFIG_PM */
> -
> +static SIMPLE_DEV_PM_OPS(rtl8139_pm_ops, rtl8139_suspend, rtl8139_resume);

The common pattern here seems to be:

  #ifdef CONFIG_PM_SLEEP
  static int *_suspend(struct device *device) { ... }
  static int *_resume(struct device *device) { ... }
  #endif
  static SIMPLE_DEV_PM_OPS(*_pm_ops, *_suspend, *_resume);

So your patch looks great except that I think you should keep the
#ifdef and convert it to CONFIG_PM_SLEEP.

>  static struct pci_driver rtl8139_pci_driver = {
>  	.name		= DRV_NAME,
>  	.id_table	= rtl8139_pci_tbl,
>  	.probe		= rtl8139_init_one,
>  	.remove		= rtl8139_remove_one,
> -#ifdef CONFIG_PM
> -	.suspend	= rtl8139_suspend,
> -	.resume		= rtl8139_resume,
> -#endif /* CONFIG_PM */
> +	.driver.pm	= &rtl8139_pm_ops,
>  };
>  
>  
> -- 
> 2.26.2
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
