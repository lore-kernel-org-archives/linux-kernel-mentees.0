Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC70DC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 08:11:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85FAC2078D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 08:11:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByO3yBfH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85FAC2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60EFE861C8;
	Mon, 17 Aug 2020 08:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUVzNcTBeUTF; Mon, 17 Aug 2020 08:11:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E225B861CE;
	Mon, 17 Aug 2020 08:11:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0A3FC07FF;
	Mon, 17 Aug 2020 08:11:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8F90C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 08:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9774A20410
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 08:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s8ffJN-bXZYv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 08:11:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 9FDD120381
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 08:11:22 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y206so7835803pfb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vrc3902/LyjUToaP0T6jczt+Dazk6Byup+Z2y7wGrvo=;
 b=ByO3yBfHuC8Oi3Go9E9JvdznzILTxNU0krXeVns4vevfXHOBzuW8RUC5nPT1Inugth
 EkTLvMFjz9X8Y6qU1Hn2S2f2o1ZjPcTvmc/XO9CMb23IP7QMwR5ThDVv7DJR8gUym87Z
 86TFejRu2JpzV/DNekTLCyl/dYZyduvNe2bvE2YaklYM9x/ZweDQE25z7ZVAuzZnmU3S
 oaiF+2jKHvJvSqXj8jp2DPFVL24k9YUu2S4t5flwPCfY4YLLFWV8rPiYLIT5B+maHsfJ
 5YHP/fNZbAvAG8dyEv+2YSMbf1Ow2mGXtNWmxoOrS8mXzxbY3mT0GE1j6xWlabFlzJcz
 RmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vrc3902/LyjUToaP0T6jczt+Dazk6Byup+Z2y7wGrvo=;
 b=Gpsh3/prN4Aq3bUVaoe4Uk+/ZC9t88ks73be080/WtK4ghHnJeHgL0hIUifa57z0vb
 tWwrWkohZ18eXTaxTeOdPGPIfqzNeHuW78m2ZkPZdAY4zB6zVoUko4Z9bpPiEuLE02dh
 UxFGhwfBDbUEQQGqVVZBE8H0+PhQOSQXCTmjzBbxe9b3QDWE5uu6D53/isZm1JjB5d3u
 rXDLe+MJfeH1S3X4JubC00QRZLLiMOxrSRSmjhPZBQ3VtuYMRyRrsSAoGHqqIALw1Uo6
 mCpDeYsA8IQYXy3pElQLf2AoYXI83MdYezfKWlquQSw3kMHWKIKTKdFjJ6qduHUWvfQY
 7HtA==
X-Gm-Message-State: AOAM531rnaOMPs9Qok9Bfh/n/mGm2qh6IPU7YZAFCiipu8Cc7hjugHIL
 FQ3sz/7ZeO34kPhqYi0ZmX8=
X-Google-Smtp-Source: ABdhPJz2ABg60O1CErb8rgafu1jP+kelkm+BlAsIdvNS3iUNr1AU3yojduJMCSyCTuDNrAKMq3eQ1Q==
X-Received: by 2002:a05:6a00:790:: with SMTP id
 g16mr10469418pfu.312.1597651882145; 
 Mon, 17 Aug 2020 01:11:22 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id g7sm16961220pjj.2.2020.08.17.01.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:11:21 -0700 (PDT)
Date: Mon, 17 Aug 2020 13:39:45 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Message-ID: <20200817080945.GG5869@gmail.com>
References: <20200730101658.576205-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730101658.576205-1-vaibhavgupta40@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] scsi: stex: use generic power
	management
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

On Thu, Jul 30, 2020 at 03:46:58PM +0530, Vaibhav Gupta wrote:
> Drivers using legacy power management .suspen()/.resume() callbacks
> have to manage PCI states and device's PM states themselves. They also
> need to take care of standard configuration registers.
> 
> Switch to generic power management framework using a single
> "struct dev_pm_ops" variable to take the unnecessary load from the driver.
> This also avoids the need for the driver to directly call most of the PCI
> helper functions and device power state control functions, as through
> the generic framework PCI Core takes care of the necessary operations,
> and drivers are required to do only device-specific jobs.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/scsi/stex.c | 37 +++++++++++++++++++++++++++++++------
>  1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/scsi/stex.c b/drivers/scsi/stex.c
> index d4f10c0d813c..5ef6f3cbac11 100644
> --- a/drivers/scsi/stex.c
> +++ b/drivers/scsi/stex.c
> @@ -1972,9 +1972,9 @@ static int stex_choice_sleep_mic(struct st_hba *hba, pm_message_t state)
>  	}
>  }
>  
> -static int stex_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int stex_suspend_late(struct device *dev, pm_message_t state)
>  {
> -	struct st_hba *hba = pci_get_drvdata(pdev);
> +	struct st_hba *hba = dev_get_drvdata(dev);
>  
>  	if ((hba->cardtype == st_yel || hba->cardtype == st_P3)
>  		&& hba->supports_pm == 1)
> @@ -1984,9 +1984,24 @@ static int stex_suspend(struct pci_dev *pdev, pm_message_t state)
>  	return 0;
>  }
>  
> -static int stex_resume(struct pci_dev *pdev)
> +static int __maybe_unused stex_suspend(struct device *dev)
>  {
> -	struct st_hba *hba = pci_get_drvdata(pdev);
> +	return stex_suspend_late(dev, PMSG_SUSPEND);
> +}
> +
> +static int __maybe_unused stex_hibernate(struct device *dev)
> +{
> +	return stex_suspend_late(dev, PMSG_HIBERNATE);
> +}
> +
> +static int __maybe_unused stex_freeze(struct device *dev)
> +{
> +	return stex_suspend_late(dev, PMSG_FREEZE);
> +}
> +
> +static int __maybe_unused stex_resume(struct device *dev)
> +{
> +	struct st_hba *hba = dev_get_drvdata(dev);
>  
>  	hba->mu_status = MU_STATE_STARTING;
>  	stex_handshake(hba);
> @@ -2000,14 +2015,24 @@ static int stex_halt(struct notifier_block *nb, unsigned long event, void *buf)
>  }
>  MODULE_DEVICE_TABLE(pci, stex_pci_tbl);
>  
> +static const struct dev_pm_ops stex_pm_ops = {
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend	= stex_suspend,
> +	.resume		= stex_resume,
> +	.freeze		= stex_freeze,
> +	.thaw		= stex_resume,
> +	.poweroff	= stex_hibernate,
> +	.restore	= stex_resume,
> +#endif
> +};
> +
>  static struct pci_driver stex_pci_driver = {
>  	.name		= DRV_NAME,
>  	.id_table	= stex_pci_tbl,
>  	.probe		= stex_probe,
>  	.remove		= stex_remove,
>  	.shutdown	= stex_shutdown,
> -	.suspend	= stex_suspend,
> -	.resume		= stex_resume,
> +	.driver.pm	= &stex_pm_ops,
>  };
>  
>  static int __init stex_init(void)
> -- 
> 2.27.0
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
