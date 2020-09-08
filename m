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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E2FC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:10:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52863207DE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyS6OBFC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52863207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D134B2E105;
	Tue,  8 Sep 2020 17:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvFH0FqZmSIL; Tue,  8 Sep 2020 17:10:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B099927A5C;
	Tue,  8 Sep 2020 17:10:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97571C0052;
	Tue,  8 Sep 2020 17:10:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BECEBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AC67886D76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozCG22TdoWA9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:10:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 23B0786AEF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:10:13 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id gf14so42597pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 10:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IJ84Dco6eLoIv+QhaZ1+EKy5WcV+FPbruhEJbqApu5k=;
 b=NyS6OBFC5QJRqQC59Ilw2MrC0TVowdh91k+YvAcGb0TVyRKHAjoPUaY0KKQIGKc9lS
 QBW4s/5u4gKcMOnKrAx11MTo+CtcvPsaBVRTevRZZc/Coh9/iUIaGuCce5ElF4XSA4rD
 Sm0Umjyk/Nu/gEBCythZlr0LRjrisaoKeULzuI1qH9iSrlUnSeyNvV5IOYbz3Dtu37px
 G5UrEGN4tAWR3a/llp/eq5GE7FqwdAqF6MTWVIN5Y0JI7pH5pZm8hg8y0f9QdsUzl7xm
 RrZZs04Jl9J35y7g6LO09Oeq5UL02+WY7sWoGbwLJwLnKLyXDZvkMgHU87eWEFsSQAmy
 VDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IJ84Dco6eLoIv+QhaZ1+EKy5WcV+FPbruhEJbqApu5k=;
 b=edFN2ihAYr8SdicI9VqJU8fNb8Dtk78vEALyRqqZG1osxizEDBv08WMXQbzDLIcAwr
 lssujoahhDoP0mOPRK8zo1Iyjzny8Xq6OP24j02RGA3cGufQO0Qsxn4M1hBxBECi8DmZ
 QIf1ClyJ2c61b5hchfK9qLKNz4ysp6LvopACQaiI+vPHAhxLpZsESYBzIEQ/ZlXQ0MFu
 yTah9ESbZTmjnXFjeZn05UJHv4u8BSR+pkG+/FAck2NELOyRr4nSnQrFxwbWEFDzt7VY
 a3a7IhG1Mj3OJhhw2Y35/R37A+KNLf0fiTxkziJ+TJXvNRZAofQKeHco3m6FGOvg+o+u
 JfqQ==
X-Gm-Message-State: AOAM531mc8Chvdik78iXORqVndL1NpME4iQetfi3gP/F8vGAEFE8eVoE
 JX4oxiwl9uP8JmDLN6hjuIo=
X-Google-Smtp-Source: ABdhPJz+LupikwcXi8+L56pMv9pV+9q6l24UCCc9Ms4+oqhlRGluDntBU1vjkieR70cpz6FydIqR3w==
X-Received: by 2002:a17:90b:357:: with SMTP id
 fh23mr73628pjb.221.1599585012676; 
 Tue, 08 Sep 2020 10:10:12 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id x140sm552pfc.211.2020.09.08.10.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 10:10:12 -0700 (PDT)
Date: Tue, 8 Sep 2020 22:38:16 +0530
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
Message-ID: <20200908170816.GP9948@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-16-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720133427.454400-16-vaibhavgupta40@gmail.com>
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 15/15] scsi: pmcraid: use
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

On Mon, Jul 20, 2020 at 07:04:28PM +0530, Vaibhav Gupta wrote:
> Drivers using legacy PM have to manage PCI states and device's PM states
> themselves. They also need to take care of configuration registers.
> 
> With improved and powerful support of generic PM, PCI Core takes care of
> above mentioned, device-independent, jobs.
> 
> This driver makes use of PCI helper functions like
> pci_save/restore_state(), pci_enable/disable_device(),
> pci_set_power_state() and to do required operations. In generic mode, they
> are no longer needed.
> 
> Change function parameter in both .suspend() and .resume() to
> "struct device*" type. Use to_pci_dev() to get "struct pci_dev*" variable.
> 
> In function pmcraid_resume(), earlier, the variable "rc" was set by
> pci_enable_device() which is now removed. Since PCI core does the required
> job, initialize "rc" with 0 value when declaring it.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/scsi/pmcraid.c | 44 +++++++++++-------------------------------
>  1 file changed, 11 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
> index aa9ae2ae8579..b6b70ac2e2ee 100644
> --- a/drivers/scsi/pmcraid.c
> +++ b/drivers/scsi/pmcraid.c
> @@ -5237,54 +5237,39 @@ static void pmcraid_remove(struct pci_dev *pdev)
>  	return;
>  }
>  
> -#ifdef CONFIG_PM
>  /**
>   * pmcraid_suspend - driver suspend entry point for power management
> - * @pdev:   PCI device structure
> - * @state:  PCI power state to suspend routine
> + * @dev:   Device structure
>   *
>   * Return Value - 0 always
>   */
> -static int pmcraid_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused pmcraid_suspend(struct device *dev)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct pmcraid_instance *pinstance = pci_get_drvdata(pdev);
>  
>  	pmcraid_shutdown(pdev);
>  	pmcraid_disable_interrupts(pinstance, ~0);
>  	pmcraid_kill_tasklets(pinstance);
> -	pci_set_drvdata(pinstance->pdev, pinstance);
>  	pmcraid_unregister_interrupt_handler(pinstance);
> -	pci_save_state(pdev);
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
>  
>  	return 0;
>  }
>  
>  /**
>   * pmcraid_resume - driver resume entry point PCI power management
> - * @pdev: PCI device structure
> + * @dev: Device structure
>   *
>   * Return Value - 0 in case of success. Error code in case of any failure
>   */
> -static int pmcraid_resume(struct pci_dev *pdev)
> +static int __maybe_unused pmcraid_resume(struct device *dev)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct pmcraid_instance *pinstance = pci_get_drvdata(pdev);
>  	struct Scsi_Host *host = pinstance->host;
> -	int rc;
> -
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_enable_wake(pdev, PCI_D0, 0);
> -	pci_restore_state(pdev);
> -
> -	rc = pci_enable_device(pdev);
> -
> -	if (rc) {
> -		dev_err(&pdev->dev, "resume: Enable device failed\n");
> -		return rc;
> -	}
> +	int rc = 0;
>  
> -	pci_set_master(pdev);
> +	device_wakeup_disable(dev);
>  
>  	if (sizeof(dma_addr_t) == 4 ||
>  	    dma_set_mask(&pdev->dev, DMA_BIT_MASK(64)))
> @@ -5337,18 +5322,10 @@ static int pmcraid_resume(struct pci_dev *pdev)
>  	scsi_host_put(host);
>  
>  disable_device:
> -	pci_disable_device(pdev);
>  
>  	return rc;
>  }
>  
> -#else
> -
> -#define pmcraid_suspend NULL
> -#define pmcraid_resume  NULL
> -
> -#endif /* CONFIG_PM */
> -
>  /**
>   * pmcraid_complete_ioa_reset - Called by either timer or tasklet during
>   *				completion of the ioa reset
> @@ -5836,6 +5813,8 @@ static int pmcraid_probe(struct pci_dev *pdev,
>  	return -ENODEV;
>  }
>  
> +static SIMPLE_DEV_PM_OPS(pmcraid_pm_ops, pmcraid_suspend, pmcraid_resume);
> +
>  /*
>   * PCI driver structure of pmcraid driver
>   */
> @@ -5844,8 +5823,7 @@ static struct pci_driver pmcraid_driver = {
>  	.id_table = pmcraid_pci_table,
>  	.probe = pmcraid_probe,
>  	.remove = pmcraid_remove,
> -	.suspend = pmcraid_suspend,
> -	.resume = pmcraid_resume,
> +	.driver.pm = &pmcraid_pm_ops,
>  	.shutdown = pmcraid_shutdown
>  };
>  
> -- 
> 2.27.0
> 
.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
