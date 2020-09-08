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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82735C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:01:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 040A2207DE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8/RMlU9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 040A2207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 59DB286CBD;
	Tue,  8 Sep 2020 17:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNQMrAVjqbXW; Tue,  8 Sep 2020 17:01:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A621F86CB2;
	Tue,  8 Sep 2020 17:01:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 944E6C0052;
	Tue,  8 Sep 2020 17:01:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D388BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B727B228E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3KILWiow9Kip
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:01:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 5F5372E112
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:01:11 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 5so10467828pgl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 10:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mRpbVHynvDS3doIRIHFjhHnaCPKlqwHCLe8ogVJxt1I=;
 b=U8/RMlU9cXz4Z3yJRxldmj8yP2siKjJpVPL/+UGXPlxXRR1OlP/gUPShsct1VxO7lR
 kPozkb5zZO2bsBdcZ7dqsjuLIg9f62auvTXIXNXbZUqRg3MVk9olmUv42FKkTH/P4Rvb
 H7tLgtjsAQP4BplddXaTi27iOc+Ybg+eUYoE2jbHnPItljGHLFdY5sObv1M1ZFUx1rsG
 Z+ZC02jLo73QBVin0oMRk0bh/JEwVSqmyfpot0F68HollnY65/mxbEd46WAKCGsTW7MO
 gMxuHoMsZmfemb/ncdkGbKzGuBWMqoxzuKJbnXNLHBQG0udYG6YHoZTfNJJebO7Ucy6r
 +95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mRpbVHynvDS3doIRIHFjhHnaCPKlqwHCLe8ogVJxt1I=;
 b=ipeo1T6oA7B8IVQryKFiSzb73BuQlEWMDYqjE8u9N6Sz2dL0npRGsS3LLLjz6B1WC5
 MP+ihraEYAi9rC+pAMSBW78ue8zh4jvXwzH/4ndZC/p2mr+XdUpR3Z2uKeyFzXgM15H8
 1ymbfo5GUfw21B3PXtctJ9heAB+aOg4g1V4WPy+BT8nVVt53fC2T1VY7eMBdzDkSV0k+
 0rFOmACMw+Duw6AXR0v+xGxAB7dwkd5qb/Sf5u7B0BnzuL1p4iP/ZlwG2FmJ8ZD6UKjZ
 NulPsrlLFu2RO+XLaPx2AkrMS7tVLD4U7LclqVhxzSKFNxe7Yy1OxppP50CgwSmOkZoZ
 JLQw==
X-Gm-Message-State: AOAM530XiNqgYqavV8ivxoSq8M1Kn++QWeLonUmz8MsC1VN+ckln60K+
 WMDM7NbXhXSgWLzmX/FRYvc=
X-Google-Smtp-Source: ABdhPJzLeGaww7r+x1jkJD0JD95WM/W8uIQPEPhZGVVwielyvToQVAuva3KA8dSfITN7K89YL7D7dQ==
X-Received: by 2002:a63:fd0b:: with SMTP id d11mr21093871pgh.21.1599584470769; 
 Tue, 08 Sep 2020 10:01:10 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id j26sm10655251pfa.160.2020.09.08.10.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 10:01:10 -0700 (PDT)
Date: Tue, 8 Sep 2020 22:29:12 +0530
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
Message-ID: <20200908165858.GD9948@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-4-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720133427.454400-4-vaibhavgupta40@gmail.com>
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 03/15] scsi: aic7xxx: use
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

On Mon, Jul 20, 2020 at 07:04:16PM +0530, Vaibhav Gupta wrote:
> With legacy PM hooks, it was the responsibility of a driver to manage PCI
> states and also the device's power state. The generic approach is to let
> the PCI core handle the work.
> 
> PCI core passes "struct device*" as an argument to the .suspend() and
> .resume() callbacks.
> 
> Driver was using PCI helper functions like pci_save/restore_state(),
> pci_disable/enable_device(), pci_set_power_state() and pci_enable_wake().
> They should not be invoked by the driver.
> 
> Also, .suspend() and .resume() are invoking other functions for PM, which
> were againg bounded by "#ifdef CONFIG_PM" directive. Remove the directive
> and mark those functions as "__maybe_unused".
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/scsi/aic7xxx/aic7xxx.h         | 10 ++----
>  drivers/scsi/aic7xxx/aic7xxx_core.c    |  6 ++--
>  drivers/scsi/aic7xxx/aic7xxx_osm_pci.c | 46 ++++++--------------------
>  drivers/scsi/aic7xxx/aic7xxx_pci.c     |  4 +--
>  4 files changed, 17 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/scsi/aic7xxx/aic7xxx.h b/drivers/scsi/aic7xxx/aic7xxx.h
> index 88b90f9806c9..11a09798e6b5 100644
> --- a/drivers/scsi/aic7xxx/aic7xxx.h
> +++ b/drivers/scsi/aic7xxx/aic7xxx.h
> @@ -1134,9 +1134,7 @@ const struct ahc_pci_identity	*ahc_find_pci_device(ahc_dev_softc_t);
>  int			 ahc_pci_config(struct ahc_softc *,
>  					const struct ahc_pci_identity *);
>  int			 ahc_pci_test_register_access(struct ahc_softc *);
> -#ifdef CONFIG_PM
> -void			 ahc_pci_resume(struct ahc_softc *ahc);
> -#endif
> +void __maybe_unused	 ahc_pci_resume(struct ahc_softc *ahc);
>  
>  /*************************** EISA/VL Front End ********************************/
>  struct aic7770_identity *aic7770_find_device(uint32_t);
> @@ -1160,10 +1158,8 @@ int			 ahc_chip_init(struct ahc_softc *ahc);
>  int			 ahc_init(struct ahc_softc *ahc);
>  void			 ahc_intr_enable(struct ahc_softc *ahc, int enable);
>  void			 ahc_pause_and_flushwork(struct ahc_softc *ahc);
> -#ifdef CONFIG_PM
> -int			 ahc_suspend(struct ahc_softc *ahc); 
> -int			 ahc_resume(struct ahc_softc *ahc);
> -#endif
> +int __maybe_unused	 ahc_suspend(struct ahc_softc *ahc);
> +int __maybe_unused	 ahc_resume(struct ahc_softc *ahc);
>  void			 ahc_set_unit(struct ahc_softc *, int);
>  void			 ahc_set_name(struct ahc_softc *, char *);
>  void			 ahc_free(struct ahc_softc *ahc);
> diff --git a/drivers/scsi/aic7xxx/aic7xxx_core.c b/drivers/scsi/aic7xxx/aic7xxx_core.c
> index 3d4df906fa4f..c7eb238a9599 100644
> --- a/drivers/scsi/aic7xxx/aic7xxx_core.c
> +++ b/drivers/scsi/aic7xxx/aic7xxx_core.c
> @@ -5590,8 +5590,7 @@ ahc_pause_and_flushwork(struct ahc_softc *ahc)
>  	ahc->flags &= ~AHC_ALL_INTERRUPTS;
>  }
>  
> -#ifdef CONFIG_PM
> -int
> +int __maybe_unused
>  ahc_suspend(struct ahc_softc *ahc)
>  {
>  
> @@ -5617,7 +5616,7 @@ ahc_suspend(struct ahc_softc *ahc)
>  	return (0);
>  }
>  
> -int
> +int __maybe_unused
>  ahc_resume(struct ahc_softc *ahc)
>  {
>  
> @@ -5626,7 +5625,6 @@ ahc_resume(struct ahc_softc *ahc)
>  	ahc_restart(ahc);
>  	return (0);
>  }
> -#endif
>  /************************** Busy Target Table *********************************/
>  /*
>   * Return the untagged transaction id for a given target/channel lun.
> diff --git a/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c b/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c
> index 9b293b1f0b71..a07e94fac673 100644
> --- a/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c
> +++ b/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c
> @@ -121,47 +121,23 @@ static const struct pci_device_id ahc_linux_pci_id_table[] = {
>  
>  MODULE_DEVICE_TABLE(pci, ahc_linux_pci_id_table);
>  
> -#ifdef CONFIG_PM
> -static int
> -ahc_linux_pci_dev_suspend(struct pci_dev *pdev, pm_message_t mesg)
> +static int __maybe_unused
> +ahc_linux_pci_dev_suspend(struct device *dev)
>  {
> -	struct ahc_softc *ahc = pci_get_drvdata(pdev);
> -	int rc;
> -
> -	if ((rc = ahc_suspend(ahc)))
> -		return rc;
> +	struct ahc_softc *ahc = dev_get_drvdata(dev);
>  
> -	pci_save_state(pdev);
> -	pci_disable_device(pdev);
> -
> -	if (mesg.event & PM_EVENT_SLEEP)
> -		pci_set_power_state(pdev, PCI_D3hot);
> -
> -	return rc;
> +	return ahc_suspend(ahc);
>  }
>  
> -static int
> -ahc_linux_pci_dev_resume(struct pci_dev *pdev)
> +static int __maybe_unused
> +ahc_linux_pci_dev_resume(struct device *dev)
>  {
> -	struct ahc_softc *ahc = pci_get_drvdata(pdev);
> -	int rc;
> -
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_restore_state(pdev);
> -
> -	if ((rc = pci_enable_device(pdev))) {
> -		dev_printk(KERN_ERR, &pdev->dev,
> -			   "failed to enable device after resume (%d)\n", rc);
> -		return rc;
> -	}
> -
> -	pci_set_master(pdev);
> +	struct ahc_softc *ahc = dev_get_drvdata(dev);
>  
>  	ahc_pci_resume(ahc);
>  
>  	return (ahc_resume(ahc));
>  }
> -#endif
>  
>  static void
>  ahc_linux_pci_dev_remove(struct pci_dev *pdev)
> @@ -319,14 +295,14 @@ ahc_pci_write_config(ahc_dev_softc_t pci, int reg, uint32_t value, int width)
>  	}
>  }
>  
> +static SIMPLE_DEV_PM_OPS(ahc_linux_pci_dev_pm_ops,
> +			 ahc_linux_pci_dev_suspend,
> +			 ahc_linux_pci_dev_resume);
>  
>  static struct pci_driver aic7xxx_pci_driver = {
>  	.name		= "aic7xxx",
>  	.probe		= ahc_linux_pci_dev_probe,
> -#ifdef CONFIG_PM
> -	.suspend	= ahc_linux_pci_dev_suspend,
> -	.resume		= ahc_linux_pci_dev_resume,
> -#endif
> +	.driver.pm	= &ahc_linux_pci_dev_pm_ops,
>  	.remove		= ahc_linux_pci_dev_remove,
>  	.id_table	= ahc_linux_pci_id_table
>  };
> diff --git a/drivers/scsi/aic7xxx/aic7xxx_pci.c b/drivers/scsi/aic7xxx/aic7xxx_pci.c
> index 656f680c7802..dab3a6d12c4d 100644
> --- a/drivers/scsi/aic7xxx/aic7xxx_pci.c
> +++ b/drivers/scsi/aic7xxx/aic7xxx_pci.c
> @@ -2008,8 +2008,7 @@ ahc_pci_chip_init(struct ahc_softc *ahc)
>  	return (ahc_chip_init(ahc));
>  }
>  
> -#ifdef CONFIG_PM
> -void
> +void __maybe_unused
>  ahc_pci_resume(struct ahc_softc *ahc)
>  {
>  	/*
> @@ -2040,7 +2039,6 @@ ahc_pci_resume(struct ahc_softc *ahc)
>  		ahc_release_seeprom(&sd);
>  	}
>  }
> -#endif
>  
>  static int
>  ahc_aic785X_setup(struct ahc_softc *ahc)
> -- 
> 2.27.0
> 
.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
