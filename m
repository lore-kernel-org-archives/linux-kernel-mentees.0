Return-Path: <SRS0=4e7Y=BP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AC1C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 06:40:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AED2A22B40
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 06:40:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pp1F3Gn3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AED2A22B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6DE712047F;
	Wed,  5 Aug 2020 06:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pemGHL3bgnCX; Wed,  5 Aug 2020 06:40:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C0B0720460;
	Wed,  5 Aug 2020 06:40:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8419C0050;
	Wed,  5 Aug 2020 06:40:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2B2AC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 06:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BE60987D5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 06:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdln-jKhK5PC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 06:40:15 +0000 (UTC)
X-Greylist: delayed 00:05:33 by SQLgrey-1.7.6
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 04D4187C30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 06:40:15 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id o184so22143935vsc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Aug 2020 23:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d2ZiF+evfZ66+HifnXyioxGC5MxoHunhZYeIelbyLK0=;
 b=Pp1F3Gn30EM5c6aAAsf4shLRD0JwsRXxIpCpLuM6vKt8rKp33GZvzZ+lkDYgPiLsXf
 eZwJXF2sV30Uy39U3ktkOCtPYxfRQDoKF8HyLrQ67D7BH1Cm1DDOl5XtHacb3vD3t33M
 ePteu5fZNSYNfBFgtbMuuYdHzw4y6ljHTkMVNGyB/Je9JUXjGtCTsvIo2HYb4vh45Cj9
 W+Kg3fsbkojGqSnPmK36SFLOcR82MXJZlJiWN5AW24RZaL+bAfHt7LVNvoy74RLeo6pR
 mauo67Usaupye6fc94QefbVEMyISOeirNMqzbZtMs9NJDtfjJK60+UIcTNdJDVAtNQ43
 0VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d2ZiF+evfZ66+HifnXyioxGC5MxoHunhZYeIelbyLK0=;
 b=nzf3jmvNQXN9aXdidVP1CIulWb5I1hoUAYArdfKAQGNr5LkQIOH4JDWqjKq2dBxDTb
 ePM3Fn3K8FS8oPcrDOKQoT5avXnUzkVuTWMtnT3b3fHM35ATgw1y+cO2r9VGBsEiB/aq
 fxs+5OqTklU1pLMK83xCi+XPKvc4B4ziKDz0bIwE9VbmW1p7UMbj3RZGvwnZoQjC1v1x
 HmP9ntZogYo8VZ5vTffs1w+t+sLppgityk2E08dTSJAbbb9ehL0HXJLuMx4YGRz1VKgM
 o+uikwlbYVRlVTTLrZ81ukwWw/WXn6rf/2ZURRkNzeemqA2EgJGoKPZ9AJyHmejTXiaC
 V8Bg==
X-Gm-Message-State: AOAM530Y92OSrwblTvA0JBT/mE4QpGtyxdoW5r8MigYKImCB1BqcZF9H
 THnbCXcXM9lnZ+Gq2GK0E8d6IVzTvDvSC3YiwS9jyMBAXZqTGg==
X-Google-Smtp-Source: ABdhPJyRAxMGxKHCQASdyGMOW+VV/QwhN4h2J8nDZRBTQ8jRAAZ8+Pi9OLVoeV6w/H/WWYuftedBrzdoXivBkBl/+EM=
X-Received: by 2002:a67:8c06:: with SMTP id o6mr912216vsd.200.1596609281713;
 Tue, 04 Aug 2020 23:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200720142603.577323-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20200720142603.577323-1-vaibhavgupta40@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Aug 2020 08:34:04 +0200
Message-ID: <CAPDyKFpHxf7xWOy+-qX+DQVtufbD50_imfi51TtsEp6P=iGs7g@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Harald Welte <HaraldWelte@viatech.com>, Bruce Chang <brucechang@via.com.tw>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] mmc: via-sdmmc: use generic
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

On Mon, 20 Jul 2020 at 16:28, Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> Drivers using legacy PM have to manage PCI states and device's PM states
> themselves. They also need to take care of configuration registers.
>
> With improved and powerful support of generic PM, PCI Core takes care of
> above mentioned, device-independent, jobs.
>
> This driver makes use of PCI helper functions like
> pci_save/restore_state(), pci_enable/disable_device(),
> pci_enable_wake() and pci_set_power_state() and to do required operations.
> In generic mode, they are no longer needed.
>
> Change function parameter in both .suspend() and .resume() to
> "struct device*" type. Use dev_get_drvdata() to get drv data.
>
> Compile-tested only.
>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Applied for next (a while ago), thanks!
Kind regards
Uffe


> ---
>  drivers/mmc/host/via-sdmmc.c | 33 ++++++++-------------------------
>  1 file changed, 8 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/mmc/host/via-sdmmc.c b/drivers/mmc/host/via-sdmmc.c
> index ef95bce50889..49dab9f42b6d 100644
> --- a/drivers/mmc/host/via-sdmmc.c
> +++ b/drivers/mmc/host/via-sdmmc.c
> @@ -1220,9 +1220,7 @@ static void via_sd_remove(struct pci_dev *pcidev)
>                 pci_name(pcidev), (int)pcidev->vendor, (int)pcidev->device);
>  }
>
> -#ifdef CONFIG_PM
> -
> -static void via_init_sdc_pm(struct via_crdr_mmc_host *host)
> +static void __maybe_unused via_init_sdc_pm(struct via_crdr_mmc_host *host)
>  {
>         struct sdhcreg *pm_sdhcreg;
>         void __iomem *addrbase;
> @@ -1256,30 +1254,27 @@ static void via_init_sdc_pm(struct via_crdr_mmc_host *host)
>         via_print_sdchc(host);
>  }
>
> -static int via_sd_suspend(struct pci_dev *pcidev, pm_message_t state)
> +static int __maybe_unused via_sd_suspend(struct device *dev)
>  {
>         struct via_crdr_mmc_host *host;
>
> -       host = pci_get_drvdata(pcidev);
> +       host = dev_get_drvdata(dev);
>
>         via_save_pcictrlreg(host);
>         via_save_sdcreg(host);
>
> -       pci_save_state(pcidev);
> -       pci_enable_wake(pcidev, pci_choose_state(pcidev, state), 0);
> -       pci_disable_device(pcidev);
> -       pci_set_power_state(pcidev, pci_choose_state(pcidev, state));
> +       device_wakeup_enable(dev);
>
>         return 0;
>  }
>
> -static int via_sd_resume(struct pci_dev *pcidev)
> +static int __maybe_unused via_sd_resume(struct device *dev)
>  {
>         struct via_crdr_mmc_host *sdhost;
>         int ret = 0;
>         u8 gatt;
>
> -       sdhost = pci_get_drvdata(pcidev);
> +       sdhost = dev_get_drvdata(dev);
>
>         gatt = VIA_CRDR_PCICLKGATT_PAD_PWRON;
>         if (sdhost->power == MMC_VDD_165_195)
> @@ -1294,32 +1289,20 @@ static int via_sd_resume(struct pci_dev *pcidev)
>
>         msleep(100);
>
> -       pci_set_power_state(pcidev, PCI_D0);
> -       pci_restore_state(pcidev);
> -       ret = pci_enable_device(pcidev);
> -       if (ret)
> -               return ret;
> -
>         via_restore_pcictrlreg(sdhost);
>         via_init_sdc_pm(sdhost);
>
>         return ret;
>  }
>
> -#else /* CONFIG_PM */
> -
> -#define via_sd_suspend NULL
> -#define via_sd_resume NULL
> -
> -#endif /* CONFIG_PM */
> +static SIMPLE_DEV_PM_OPS(via_sd_pm_ops, via_sd_suspend, via_sd_resume);
>
>  static struct pci_driver via_sd_driver = {
>         .name = DRV_NAME,
>         .id_table = via_ids,
>         .probe = via_sd_probe,
>         .remove = via_sd_remove,
> -       .suspend = via_sd_suspend,
> -       .resume = via_sd_resume,
> +       .driver.pm = &via_sd_pm_ops,
>  };
>
>  module_pci_driver(via_sd_driver);
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
