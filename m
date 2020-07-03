Return-Path: <SRS0=CGmO=AO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D21FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 16:24:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5223520870
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 16:24:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linux-powerpc-org.20150623.gappssmtp.com header.i=@linux-powerpc-org.20150623.gappssmtp.com header.b="De8MqE6o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5223520870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-powerpc.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1565C21503;
	Fri,  3 Jul 2020 16:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jqOih8T8GOlC; Fri,  3 Jul 2020 16:24:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C5768231AB;
	Fri,  3 Jul 2020 16:24:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7864C0888;
	Fri,  3 Jul 2020 16:24:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 217BCC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 16:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 12075897E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 16:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zw4YW40m4Ya7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 16:24:41 +0000 (UTC)
X-Greylist: delayed 00:06:14 by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B9570897D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 16:24:40 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id p20so34809540ejd.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 03 Jul 2020 09:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qiEZaKZ9FC6yDmrpUiBYeXNjpNa2H+Da4zGNKkrzBmA=;
 b=De8MqE6obLkfjvoFPW9CRmvzox7ddURkpzlnlbuIHhuhT1ugHuW25ywzcQfHfRQFRf
 dXOm3vwqSpxXpMngdWyV5KB4W1cVUJC+A7VcC+MIV8qVStAJSY4lE4K6n1/czDejlJhF
 LK7H2rqhTlcl6dKw2adPgEJwvOqC/bK/52/T78IKh3IiCUDGdlkk2cAoQSKORZdwFMsH
 n06pPHDrAhU/v4uc+Dz35b+pIg0aCfMLnSy/1bub8Uwf/xrhhOVX3VXgCvSWxA4d7edq
 mZdTDGKBawOcplvf7HTh3glcWRRanARemg+Vr8567Qn105IeVxQC7IoP5U+dmSXI+ZdP
 BQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qiEZaKZ9FC6yDmrpUiBYeXNjpNa2H+Da4zGNKkrzBmA=;
 b=JrvY5KJlNZesT+w0es6V14pTVJnItx1QYFpxS+7mqOUlhLI9OtmK7H01JbYW4LUkpS
 uZBPj1qANsBPIt3ACPez3zUsj2oR74w4ZHbyO7Tkxi/GcwdP4a1eUAvfco6xzvf9h2u3
 PWgT99sNPUocJGuR/sHTx6SpqDqMlYy5y8VFRI7M21lBFgyxzyYlXpBhcGUDkpFGHUmQ
 WVVvmHnk1ABx4eVjej8dr2SO4mUOphcw30tuzm4KgJyF2nJePDdFcYxo3/4ZkG9eagp2
 fcHMMIlPLb4IbXYu416c3q0txskefmppwdj4Nd2Wu7GqniJ8tkhjomakZPN+L7eRAU6J
 gSOw==
X-Gm-Message-State: AOAM533J/lCgwqcrQP6g4ZkRCzI0/lzey20+JCjljL1b++SyV+wIZg6+
 rq9BR0YXoTInF2fxhFYDjcZcdLap7ZbRTlb6e6DFMwzT3bBa2Q==
X-Google-Smtp-Source: ABdhPJzNQSVXnsqFLLCySL5wP60ViOog3L1iCfEO8JhHHdp4TE/25m2500UQlvy/RsLvr8DPsk5X+QCQrIVMvUtuToA=
X-Received: by 2002:a17:906:6897:: with SMTP id
 n23mr31801112ejr.473.1593793104893; 
 Fri, 03 Jul 2020 09:18:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:3a1b:0:0:0:0:0 with HTTP;
 Fri, 3 Jul 2020 09:18:24 -0700 (PDT)
X-Originating-IP: [5.35.13.201]
In-Reply-To: <20200701165057.667799-7-vaibhavgupta40@gmail.com>
References: <20200701165057.667799-1-vaibhavgupta40@gmail.com>
 <20200701165057.667799-7-vaibhavgupta40@gmail.com>
From: Denis Kirjanov <kda@linux-powerpc.org>
Date: Fri, 3 Jul 2020 19:18:24 +0300
Message-ID: <CAOJe8K0aYeba0fOpSz6dzgWUwAP8FTyOpQc8rckWO=RPTKiprw@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>,
 David Dillow <dave@thedillows.org>, Somnath Kotur <somnath.kotur@broadcom.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Arthur Kiyanovski <akiyano@amazon.com>,
 Zorik Machulsky <zorik@amazon.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guy Tzalik <gtzalik@amazon.com>, Satanand Burla <sburla@marvell.com>,
 Felix Manlunas <fmanlunas@marvell.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ion Badulescu <ionut@badula.org>, Netanel Belgazal <netanel@amazon.com>,
 Jon Mason <jdmason@kudzu.us>, Saeed Bishara <saeedb@amazon.com>,
 Derek Chickles <dchickles@marvell.com>,
 "David S. Miller" <davem@davemloft.net>, Tariq Toukan <tariqt@mellanox.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 06/11] sundance: use generic
	power management
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

On 7/1/20, Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> With legacy PM, drivers themselves were responsible for managing the
> device's power states and takes care of register states.
>
> After upgrading to the generic structure, PCI core will take care of
> required tasks and drivers should do only device-specific operations.
>
> Thus, there is no need to call the PCI helper functions like
> pci_enable/disable_device(), pci_save/restore_sate() and
> pci_set_power_state().
>
> Compile-tested only.
>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Should be fine. I'll try to test it in the upcoming weekend

> ---
>  drivers/net/ethernet/dlink/sundance.c | 27 ++++++++-------------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/net/ethernet/dlink/sundance.c
> b/drivers/net/ethernet/dlink/sundance.c
> index dc566fcc3ba9..ca97e321082d 100644
> --- a/drivers/net/ethernet/dlink/sundance.c
> +++ b/drivers/net/ethernet/dlink/sundance.c
> @@ -1928,11 +1928,9 @@ static void sundance_remove1(struct pci_dev *pdev)
>  	}
>  }
>
> -#ifdef CONFIG_PM
> -
> -static int sundance_suspend(struct pci_dev *pci_dev, pm_message_t state)
> +static int __maybe_unused sundance_suspend(struct device *dev_d)
>  {
> -	struct net_device *dev = pci_get_drvdata(pci_dev);
> +	struct net_device *dev = dev_get_drvdata(dev_d);
>  	struct netdev_private *np = netdev_priv(dev);
>  	void __iomem *ioaddr = np->base;
>
> @@ -1942,30 +1940,24 @@ static int sundance_suspend(struct pci_dev *pci_dev,
> pm_message_t state)
>  	netdev_close(dev);
>  	netif_device_detach(dev);
>
> -	pci_save_state(pci_dev);
>  	if (np->wol_enabled) {
>  		iowrite8(AcceptBroadcast | AcceptMyPhys, ioaddr + RxMode);
>  		iowrite16(RxEnable, ioaddr + MACCtrl1);
>  	}
> -	pci_enable_wake(pci_dev, pci_choose_state(pci_dev, state),
> -			np->wol_enabled);
> -	pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
> +
> +	device_set_wakeup_enable(dev_d, np->wol_enabled);
>
>  	return 0;
>  }
>
> -static int sundance_resume(struct pci_dev *pci_dev)
> +static int __maybe_unused sundance_resume(struct device *dev_d)
>  {
> -	struct net_device *dev = pci_get_drvdata(pci_dev);
> +	struct net_device *dev = dev_get_drvdata(dev_d);
>  	int err = 0;
>
>  	if (!netif_running(dev))
>  		return 0;
>
> -	pci_set_power_state(pci_dev, PCI_D0);
> -	pci_restore_state(pci_dev);
> -	pci_enable_wake(pci_dev, PCI_D0, 0);
> -
>  	err = netdev_open(dev);
>  	if (err) {
>  		printk(KERN_ERR "%s: Can't resume interface!\n",
> @@ -1979,17 +1971,14 @@ static int sundance_resume(struct pci_dev *pci_dev)
>  	return err;
>  }
>
> -#endif /* CONFIG_PM */
> +static SIMPLE_DEV_PM_OPS(sundance_pm_ops, sundance_suspend,
> sundance_resume);
>
>  static struct pci_driver sundance_driver = {
>  	.name		= DRV_NAME,
>  	.id_table	= sundance_pci_tbl,
>  	.probe		= sundance_probe1,
>  	.remove		= sundance_remove1,
> -#ifdef CONFIG_PM
> -	.suspend	= sundance_suspend,
> -	.resume		= sundance_resume,
> -#endif /* CONFIG_PM */
> +	.driver.pm	= &sundance_pm_ops,
>  };
>
>  static int __init sundance_init(void)
> --
> 2.27.0
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
