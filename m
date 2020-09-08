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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591D8C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:07:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CB2B2087C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:07:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tG/YUPF7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CB2B2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A604C873AD;
	Tue,  8 Sep 2020 17:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xycPxIUFwy1l; Tue,  8 Sep 2020 17:07:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 29092873A5;
	Tue,  8 Sep 2020 17:07:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15500C0052;
	Tue,  8 Sep 2020 17:07:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FBF1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0FB96275A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 44fcen0AoVgA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:07:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 0B5B7274ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:07:53 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id n14so3541533pff.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 10:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Vkm3URthXwvfCz2X/0Dh5umMnxjwLofZTcBfaZl0Z6Y=;
 b=tG/YUPF7peaPAP9CfK209Pn38yxJyOy8OHKCwmmqVxJ0gETyFt5E47yypeNVZlb0WW
 vzSrLbR71gHvWpEnbgdYI1Xjom5ZjiE6euinp+gISUzKn7g9rhYwU/3Gms63brYZ3oP6
 5djflAAHKKiCLS/xeeT7uFxDOasbEPszX6z74lQeQGxDYN3KXOPjMt4w+3FMTmczQc4v
 cO+KrOQTnkS9y3godo4V8gLjVbu5JdYF0mcK5XxdOc4fwUy9Xo2RTMrGfv6ynzKDzXqm
 nlVz4SXWSn0BFDXJQCrMXlZTnfBnhd143sO2H7sxeondeXhdg0bq1xoatGNL7RRJiiAl
 gd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vkm3URthXwvfCz2X/0Dh5umMnxjwLofZTcBfaZl0Z6Y=;
 b=CDneHQD0AEi1vKZclaf6OYOkUWbfZ9RYga+cpGlNejIxh0k0fCcNtGzPI18XrP1q9H
 Yi4pFv/IVcO5XOQYovwePWA2rs/lGyKVPPtv6XaD46Q/4lkVSCpsKQop490Qo5oCUqnf
 YCpCmPYGa63ryeQ8i5NN/lhi5rri6//CB/t16cBtwHV1li8afzGWXJWX6moZGzIeTSh1
 xSV0qnv/JDHLXBzuveTyUTEY4NOgk2Tkl7g+M3wYGfgdcHcI70reQwNoWprWEwnZBsh7
 lh8TY9eI8Io73rP/3fu4FIGQPLhB32sXiZJtva3vUFT+/rnQolXKSoN7QRIsoca9YosM
 oe8Q==
X-Gm-Message-State: AOAM5336vfbjRQN5MIVMgAeQfHrRMkAcadpGNXM+6QfZMkN2x/CQ131L
 97PEU9rkSU67jxe8r3AGh4k=
X-Google-Smtp-Source: ABdhPJzjf3ma939UXz/wlJ5BHxhf5CnuqeUC1sRoD1AIWGssRazx9QXjeHH5ONg+i+f1WoTcQBDdAA==
X-Received: by 2002:a17:902:70c8:b029:d0:cbe1:e748 with SMTP id
 l8-20020a17090270c8b02900d0cbe1e748mr2028914plt.35.1599584872526; 
 Tue, 08 Sep 2020 10:07:52 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id q71sm41669pja.9.2020.09.08.10.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 10:07:52 -0700 (PDT)
Date: Tue, 8 Sep 2020 22:35:59 +0530
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
Message-ID: <20200908170559.GM9948@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-13-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720133427.454400-13-vaibhavgupta40@gmail.com>
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 12/15] scsi: 3w-9xxx: use
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

On Mon, Jul 20, 2020 at 07:04:25PM +0530, Vaibhav Gupta wrote:
> Drivers using legacy PM have to manage PCI states and device's PM states
> themselves. They also need to take care of configuration registers.
> 
> With improved and powerful support of generic PM, PCI Core takes care of
> above mentioned, device-independent, jobs.
> 
> This driver makes use of PCI helper functions like
> pci_save/restore_state(), pci_enable/disable_device(),
> pci_set_power_state() and pci_set_master() to do required operations. In
> generic mode, they are no longer needed.
> 
> Change function parameter in both .suspend() and .resume() to
> "struct device*" type. Use to_pci_dev() and dev_get_drvdata() to get
> "struct pci_dev*" variable and drv data.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/scsi/3w-9xxx.c | 30 ++++++++----------------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/scsi/3w-9xxx.c b/drivers/scsi/3w-9xxx.c
> index 3337b1e80412..c15dcfda3957 100644
> --- a/drivers/scsi/3w-9xxx.c
> +++ b/drivers/scsi/3w-9xxx.c
> @@ -2191,10 +2191,10 @@ static void twa_remove(struct pci_dev *pdev)
>  	twa_device_extension_count--;
>  } /* End twa_remove() */
>  
> -#ifdef CONFIG_PM
>  /* This function is called on PCI suspend */
> -static int twa_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused twa_suspend(struct device *dev)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct Scsi_Host *host = pci_get_drvdata(pdev);
>  	TW_Device_Extension *tw_dev = (TW_Device_Extension *)host->hostdata;
>  
> @@ -2214,32 +2214,21 @@ static int twa_suspend(struct pci_dev *pdev, pm_message_t state)
>  	}
>  	TW_CLEAR_ALL_INTERRUPTS(tw_dev);
>  
> -	pci_save_state(pdev);
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> -
>  	return 0;
>  } /* End twa_suspend() */
>  
>  /* This function is called on PCI resume */
> -static int twa_resume(struct pci_dev *pdev)
> +static int __maybe_unused twa_resume(struct device *dev)
>  {
>  	int retval = 0;
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct Scsi_Host *host = pci_get_drvdata(pdev);
>  	TW_Device_Extension *tw_dev = (TW_Device_Extension *)host->hostdata;
>  
>  	printk(KERN_WARNING "3w-9xxx: Resuming host %d.\n", tw_dev->host->host_no);
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_enable_wake(pdev, PCI_D0, 0);
> -	pci_restore_state(pdev);
>  
> -	retval = pci_enable_device(pdev);
> -	if (retval) {
> -		TW_PRINTK(tw_dev->host, TW_DRIVER, 0x39, "Enable device failed during resume");
> -		return retval;
> -	}
> +	device_wakeup_disable(dev);
>  
> -	pci_set_master(pdev);
>  	pci_try_set_mwi(pdev);
>  
>  	retval = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> @@ -2277,11 +2266,9 @@ static int twa_resume(struct pci_dev *pdev)
>  
>  out_disable_device:
>  	scsi_remove_host(host);
> -	pci_disable_device(pdev);
>  
>  	return retval;
>  } /* End twa_resume() */
> -#endif
>  
>  /* PCI Devices supported by this driver */
>  static struct pci_device_id twa_pci_tbl[] = {
> @@ -2297,16 +2284,15 @@ static struct pci_device_id twa_pci_tbl[] = {
>  };
>  MODULE_DEVICE_TABLE(pci, twa_pci_tbl);
>  
> +static SIMPLE_DEV_PM_OPS(twa_pm_ops, twa_suspend, twa_resume);
> +
>  /* pci_driver initializer */
>  static struct pci_driver twa_driver = {
>  	.name		= "3w-9xxx",
>  	.id_table	= twa_pci_tbl,
>  	.probe		= twa_probe,
>  	.remove		= twa_remove,
> -#ifdef CONFIG_PM
> -	.suspend	= twa_suspend,
> -	.resume		= twa_resume,
> -#endif
> +	.driver.pm	= &twa_pm_ops,
>  	.shutdown	= twa_shutdown
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
