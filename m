Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1CEC83008
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:19:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2BFB2082E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="17nyOSUW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2BFB2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8022A22882;
	Tue, 28 Apr 2020 17:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0ggAcxRPDDD; Tue, 28 Apr 2020 17:19:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 72D7022846;
	Tue, 28 Apr 2020 17:19:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4AE4C0863;
	Tue, 28 Apr 2020 17:19:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BD52C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DFA472286C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLxpoEBz3HTf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:19:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id A189622846
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:19:30 +0000 (UTC)
Received: from localhost (mobile-166-175-187-210.mycingular.net
 [166.175.187.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F8732082E;
 Tue, 28 Apr 2020 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588094370;
 bh=hh6nXBiocZ2GmSoC/HUt/H1ViNWeuSi+aGw8ni8/Vvw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=17nyOSUWlUVh2D5YBLMoRXzFRf9mzTyTROtZ8B5ZHjNJxg+5j7ESUyJgPbQq5TroI
 LLXY0smLQRaOIuamjjyPUqXEVCT55Slkrvn6qQIXc4+57aDc9pYekU/1KybBw1/rYQ
 x3rlcb6g5qdNQB0ExSFcfFOBt6FSELMWYXWXTvWA=
Date: Tue, 28 Apr 2020 12:19:28 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200428171928.GA170516@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428144314.24533-2-vaibhavgupta40@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 Martin Habets <mhabets@solarflare.com>, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Shannon Nelson <snelson@pensando.io>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 1/2] realtek/8139too: Remove
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

Uncapitalize "legacy power management" in subject.  I'd say "convert",
not "remove", to make it clear that the driver will still do power
management afterwards.

I think your to: and cc: list came from the get_maintainer.pl script,
but you can trim it a bit by omitting people who have just made
occasional random fixups.  These drivers are really unmaintained, so
Dave M, netdev, Rafael, linux-pm, linux-pci, and maybe LKML are
probably enough.

On Tue, Apr 28, 2020 at 08:13:13PM +0530, Vaibhav Gupta wrote:
> Upgrade power management from legacy to generic using dev_pm_ops.

Instead of the paragraphs below, which cover the stuff that's fairly
obvious, I think it would be more useful to include hints about where
the things you removed will be done now.  That helps reviewers verify
that this doesn't break anything.  E.g.,

  In the legacy PM model, drivers save and restore PCI state and set
  the device power state directly.  In the generic model, this is all
  done by the PCI core in .suspend_noirq() (pci_pm_suspend_noirq())
  and .resume_noirq() (pci_pm_resume_noirq()).

This sort of thing could go in each commit log.  The cover letter
doesn't normally go in the commit log, so you have to assume it will
be lost.

> Remove "struct pci_driver.suspend" and "struct pci_driver.resume"
> bindings, and add "struct pci_driver.driver.pm" .
> 
> Add "__maybe_unused" attribute to resume() and susend() callbacks
> definition to suppress compiler warnings.
>
> Generic callback requires an argument of type "struct device*". Hence,
> convert it to "struct net_device*" using "dev_get_drvdata()" to use
> it in the callback.
>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Thanks a lot for doing this!

> ---
>  drivers/net/ethernet/realtek/8139too.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/realtek/8139too.c b/drivers/net/ethernet/realtek/8139too.c
> index 5caeb8368eab..227139d42227 100644
> --- a/drivers/net/ethernet/realtek/8139too.c
> +++ b/drivers/net/ethernet/realtek/8139too.c
> @@ -2603,17 +2603,13 @@ static void rtl8139_set_rx_mode (struct net_device *dev)
>  	spin_unlock_irqrestore (&tp->lock, flags);
>  }
>  
> -#ifdef CONFIG_PM
> -
> -static int rtl8139_suspend (struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused rtl8139_suspend(struct device *device)
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
> +static int __maybe_unused rtl8139_resume(struct device *device)
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
>  
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
