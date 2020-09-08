Return-Path: <SRS0=zeZA=CR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E532EC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:06:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93CD320936
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:06:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcpQncCg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93CD320936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 54E8886FB7;
	Tue,  8 Sep 2020 17:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oRehrVbqtx+h; Tue,  8 Sep 2020 17:06:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B9C2786F72;
	Tue,  8 Sep 2020 17:06:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B420AC0052;
	Tue,  8 Sep 2020 17:06:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7578C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 991E92E109
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNH-Fsno9D0b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:06:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id DA78D2E106
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:06:20 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id q4so37338pjh.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AnfV4++qeYNOgdT0ROy0q1s9L3CrCi5xVMUzWVJilp4=;
 b=kcpQncCg9k2mhH5jl/RiR2b3GZFmDxAcNV3VLPkKAglPHCCTivucamWHSZC/NKxc5O
 aaA55gr7lvZfumQEQJQLqS3mUIws0vyF0hYM25P8HKpfbJnburAlI94mFx/5162MCU6+
 /b54aZObkC6o0VfCmT3WPYf+yVeRgQAaat4iae3R2kSOdmdPie5Lq8RUk3lnWBL57dBx
 fX0a/ubFHw6BU8hmyzvoAboekabmJX3tAI6cnpGXENYJ/il2EaR1pkkUoz8Ut7MP3O9N
 H6t3AiyvR8PYxlmTM4XGS/oAlF8wMeTPyN6Rx2oco+zlPyhrkwCZkltNHuVcSdvLILw5
 ttYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AnfV4++qeYNOgdT0ROy0q1s9L3CrCi5xVMUzWVJilp4=;
 b=Zu+3JzfZOA1ej6YjRbr/DPM2X78v6merGatPf6lihQeHhYWCgL8c0J1zflIzSedBSI
 L9PbKmvRZsbeii1sV5vnGzPBfSf7xYiHKIdzEHDzfDtY4faOZVIoROD48c277XoaGQ1J
 4P2IQmSn7VXDijKMYwHrTKlgoRzW52X++f9LR6psPuC94HOElByrLa0B88QDgzmyNThn
 2HlLKRqquJBTQ0Nut5HvDZ20wRBWt3Qg6fIf3Tmd6hUHNx2ap3+Iap+6XgvWfW2lr3Mv
 oPf8uWBFhkPGr/42Ix3iMxMD3KO9C8/3+H1aQDkJYC5l8Llyj360B8XKPyh7+eBsp/QN
 K2qg==
X-Gm-Message-State: AOAM531Z8r49cJLYK7bpfbW3b+ZZX2ia0sNUO/52/g/gVcEV6FW2b30W
 NBWm0PHP6LbWKwt+YS0AlGU=
X-Google-Smtp-Source: ABdhPJwyX8LocD+VxFqC4aQKnDsDammaHOlfIYOcVtg+NexiuZMaDsHgWMOePIj2lh7oNOLVT/bkFg==
X-Received: by 2002:a17:90a:fcc:: with SMTP id 70mr85978pjz.220.1599584780350; 
 Tue, 08 Sep 2020 10:06:20 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id 25sm19066pfj.35.2020.09.08.10.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 10:06:19 -0700 (PDT)
Date: Tue, 8 Sep 2020 22:34:27 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Adam Radford <aradford@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 Hannes Reinecke <hare@suse.com>, Bradley Grove <linuxdrivers@attotech.com>,
 John Garry <john.garry@huawei.com>, Don Brace <don.brace@microsemi.com>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>
Message-ID: <20200908170427.GK9948@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-11-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720133427.454400-11-vaibhavgupta40@gmail.com>
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 10/15] scsi: pm_8001: use
	generic power management
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

On Mon, Jul 20, 2020 at 07:04:23PM +0530, Vaibhav Gupta wrote:
> With legacy PM, drivers themselves were responsible for managing the
> device's power states and takes care of register states.
> 
> After upgrading to the generic structure, PCI core will take care of
> required tasks and drivers should do only device-specific operations.
> 
> The driver was calling pci_save/restore_state(), pci_choose_state(),
> pci_enable/disable_device() and pci_set_power_state() which is no more
> needed.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/scsi/pm8001/pm8001_init.c | 46 ++++++++++++-------------------
>  1 file changed, 17 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/scsi/pm8001/pm8001_init.c b/drivers/scsi/pm8001/pm8001_init.c
> index 9e99262a2b9d..d7d664b87720 100644
> --- a/drivers/scsi/pm8001/pm8001_init.c
> +++ b/drivers/scsi/pm8001/pm8001_init.c
> @@ -1178,23 +1178,21 @@ static void pm8001_pci_remove(struct pci_dev *pdev)
>  
>  /**
>   * pm8001_pci_suspend - power management suspend main entry point
> - * @pdev: PCI device struct
> - * @state: PM state change to (usually PCI_D3)
> + * @dev: Device struct
>   *
>   * Returns 0 success, anything else error.
>   */
> -static int pm8001_pci_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused pm8001_pci_suspend(struct device *dev)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct sas_ha_struct *sha = pci_get_drvdata(pdev);
> -	struct pm8001_hba_info *pm8001_ha;
> +	struct pm8001_hba_info *pm8001_ha = sha->lldd_ha;
>  	int  i, j;
> -	u32 device_state;
> -	pm8001_ha = sha->lldd_ha;
>  	sas_suspend_ha(sha);
>  	flush_workqueue(pm8001_wq);
>  	scsi_block_requests(pm8001_ha->shost);
>  	if (!pdev->pm_cap) {
> -		dev_err(&pdev->dev, " PCI PM not supported\n");
> +		dev_err(dev, " PCI PM not supported\n");
>  		return -ENODEV;
>  	}
>  	PM8001_CHIP_DISP->interrupt_disable(pm8001_ha, 0xFF);
> @@ -1217,24 +1215,21 @@ static int pm8001_pci_suspend(struct pci_dev *pdev, pm_message_t state)
>  		for (j = 0; j < PM8001_MAX_MSIX_VEC; j++)
>  			tasklet_kill(&pm8001_ha->tasklet[j]);
>  #endif
> -	device_state = pci_choose_state(pdev, state);
>  	pm8001_printk("pdev=0x%p, slot=%s, entering "
> -		      "operating state [D%d]\n", pdev,
> -		      pm8001_ha->name, device_state);
> -	pci_save_state(pdev);
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, device_state);
> +		      "suspended state\n", pdev,
> +		      pm8001_ha->name);
>  	return 0;
>  }
>  
>  /**
>   * pm8001_pci_resume - power management resume main entry point
> - * @pdev: PCI device struct
> + * @dev: Device struct
>   *
>   * Returns 0 success, anything else error.
>   */
> -static int pm8001_pci_resume(struct pci_dev *pdev)
> +static int __maybe_unused pm8001_pci_resume(struct device *dev)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct sas_ha_struct *sha = pci_get_drvdata(pdev);
>  	struct pm8001_hba_info *pm8001_ha;
>  	int rc;
> @@ -1247,17 +1242,8 @@ static int pm8001_pci_resume(struct pci_dev *pdev)
>  	pm8001_printk("pdev=0x%p, slot=%s, resuming from previous "
>  		"operating state [D%d]\n", pdev, pm8001_ha->name, device_state);
>  
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_enable_wake(pdev, PCI_D0, 0);
> -	pci_restore_state(pdev);
> -	rc = pci_enable_device(pdev);
> -	if (rc) {
> -		pm8001_printk("slot=%s Enable device failed during resume\n",
> -			      pm8001_ha->name);
> -		goto err_out_enable;
> -	}
> +	device_wakeup_disable(dev);
>  
> -	pci_set_master(pdev);
>  	rc = pci_go_44(pdev);
>  	if (rc)
>  		goto err_out_disable;
> @@ -1318,8 +1304,7 @@ static int pm8001_pci_resume(struct pci_dev *pdev)
>  
>  err_out_disable:
>  	scsi_remove_host(pm8001_ha->shost);
> -	pci_disable_device(pdev);
> -err_out_enable:
> +
>  	return rc;
>  }
>  
> @@ -1402,13 +1387,16 @@ static struct pci_device_id pm8001_pci_table[] = {
>  	{} /* terminate list */
>  };
>  
> +static SIMPLE_DEV_PM_OPS(pm8001_pci_pm_ops,
> +			 pm8001_pci_suspend,
> +			 pm8001_pci_resume);
> +
>  static struct pci_driver pm8001_pci_driver = {
>  	.name		= DRV_NAME,
>  	.id_table	= pm8001_pci_table,
>  	.probe		= pm8001_pci_probe,
>  	.remove		= pm8001_pci_remove,
> -	.suspend	= pm8001_pci_suspend,
> -	.resume		= pm8001_pci_resume,
> +	.driver.pm	= &pm8001_pci_pm_ops,
>  };
>  
>  /**
> -- 
> 2.27.0
> 
.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
