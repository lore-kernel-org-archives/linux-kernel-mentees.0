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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F084C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 16:59:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E738207DE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 16:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jx+X8veF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E738207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3AC56873B2;
	Tue,  8 Sep 2020 16:59:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y+dlYRFAK0sk; Tue,  8 Sep 2020 16:59:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4631C873AA;
	Tue,  8 Sep 2020 16:59:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EDDEC0052;
	Tue,  8 Sep 2020 16:59:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 410EDC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 16:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2E61C228E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 16:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lC2C3LC-mKDb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 16:59:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id E0B57203BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 16:59:01 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id b17so36248pji.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OsDHF9l8KLweJEV4F/UUUN9AsWj6Q1K3HzbgaaqAR+c=;
 b=Jx+X8veFdJOPa0X0J9oKcogx9QwoQksOBY8M2bOMrLsgJCHlinQ/6KLsmsI0BCpcdb
 6zYDjx7hgf5J/7JWlK75dlCWqSULL6JwIAa9Mh0vsu8EaQj+D9Cy6WwXpeW9YuHhj82u
 lvhRFQP+QacUHjn5tHoRSmX4ohlwS5d7tfGfqXrQzw9G3863ccMTWfD7KG72g6YD6nNw
 fN2u4N8aZCQgNss+QauNu0Ko4KYHHd9sldTEuMtsHejcL6bDTooF+X3dqAHMCmW4HxDl
 WIRcdrVrA3unnQ+ysCT5WJOskUfT0Dpxp0Z1skyncyJV3tG0Vi04mv+unGzoJK3b56vj
 yGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OsDHF9l8KLweJEV4F/UUUN9AsWj6Q1K3HzbgaaqAR+c=;
 b=JftSd7gx4NR+3WgqkRlpiHLMo7t11F1CGsfjNDIm9+Y5uWpWzmtB3+4nCj0sI9Jbou
 JTjHNh6aYV+1YwGXJ3Q8yKH0nQHDEV5nwPgdTQZAxCFq9tcc1isJcr8yztVIyorumQ66
 VmlM2WCoQy9x+a8G46JRw13PjQULsQxoMwZ7KJBGeRXVh29hT56KH//zYtWej03HSbZn
 NVHOS2z30TkQsr1gfsVHVTe0Pmq+cimGqjU6rHSZTOmca2it1IKIcBHHqRZD9sgIlKT6
 km0V9xlxdkahGmXzqIHHc34o0D0LZztwgDjj6CRCr4q0/rQq47mWVrskWSfejgr5YRWZ
 xiOg==
X-Gm-Message-State: AOAM532xMZr7nu9nYSZ3NwSKX9OOnkjhr2iEyNv/GIMgRe27wDdiZqsC
 AKVk708OCAwsNtNjSqmmXc8=
X-Google-Smtp-Source: ABdhPJw73yuN92T7L31s/Mu5c6yngdnp2uuE+tJOLHPn8pMUo7b77Is0I+rofpf1nrbe69tjZ1uaGg==
X-Received: by 2002:a17:90a:6848:: with SMTP id e8mr32374pjm.221.1599584341427; 
 Tue, 08 Sep 2020 09:59:01 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id a20sm3393pfa.59.2020.09.08.09.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 09:59:00 -0700 (PDT)
Date: Tue, 8 Sep 2020 22:27:02 +0530
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
Message-ID: <20200908165702.GB9948@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-2-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720133427.454400-2-vaibhavgupta40@gmail.com>
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 01/15] scsi: megaraid_sas: use
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

On Mon, Jul 20, 2020 at 07:04:14PM +0530, Vaibhav Gupta wrote:
> With legacy PM hooks, it was the responsibility of a driver to manage PCI
> states and also the device's power state. The generic approach is to let
> the PCI core handle the work.
> 
> PCI core passes "struct device*" as an argument to the .suspend() and
> .resume() callbacks. As the .suspend() work with "struct instance*",
> extract it from "struct device*" using dev_get_drv_data().
> 
> Driver was also using PCI helper functions like pci_save/restore_state(),
> pci_disable/enable_device(), pci_set_power_state() and pci_enable_wake().
> They should not be invoked by the driver.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/scsi/megaraid/megaraid_sas_base.c | 61 ++++++-----------------
>  1 file changed, 16 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
> index 00668335c2af..4a6ee7778977 100644
> --- a/drivers/scsi/megaraid/megaraid_sas_base.c
> +++ b/drivers/scsi/megaraid/megaraid_sas_base.c
> @@ -7539,25 +7539,21 @@ static void megasas_shutdown_controller(struct megasas_instance *instance,
>  	megasas_return_cmd(instance, cmd);
>  }
>  
> -#ifdef CONFIG_PM
>  /**
>   * megasas_suspend -	driver suspend entry point
> - * @pdev:		PCI device structure
> - * @state:		PCI power state to suspend routine
> + * @dev:		Device structure
>   */
> -static int
> -megasas_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused
> +megasas_suspend(struct device *dev)
>  {
> -	struct megasas_instance *instance;
> -
> -	instance = pci_get_drvdata(pdev);
> +	struct megasas_instance *instance = dev_get_drvdata(dev);
>  
>  	if (!instance)
>  		return 0;
>  
>  	instance->unload = 1;
>  
> -	dev_info(&pdev->dev, "%s is called\n", __func__);
> +	dev_info(dev, "%s is called\n", __func__);
>  
>  	/* Shutdown SR-IOV heartbeat timer */
>  	if (instance->requestorId && !instance->skip_heartbeat_timer_del)
> @@ -7579,7 +7575,7 @@ megasas_suspend(struct pci_dev *pdev, pm_message_t state)
>  
>  	tasklet_kill(&instance->isr_tasklet);
>  
> -	pci_set_drvdata(instance->pdev, instance);
> +	dev_set_drvdata(dev, instance);
>  	instance->instancet->disable_intr(instance);
>  
>  	megasas_destroy_irqs(instance);
> @@ -7587,48 +7583,28 @@ megasas_suspend(struct pci_dev *pdev, pm_message_t state)
>  	if (instance->msix_vectors)
>  		pci_free_irq_vectors(instance->pdev);
>  
> -	pci_save_state(pdev);
> -	pci_disable_device(pdev);
> -
> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> -
>  	return 0;
>  }
>  
>  /**
>   * megasas_resume-      driver resume entry point
> - * @pdev:               PCI device structure
> + * @dev:              Device structure
>   */
> -static int
> -megasas_resume(struct pci_dev *pdev)
> +static int __maybe_unused
> +megasas_resume(struct device *dev)
>  {
>  	int rval;
>  	struct Scsi_Host *host;
> -	struct megasas_instance *instance;
> +	struct megasas_instance *instance = dev_get_drvdata(dev);
>  	u32 status_reg;
>  
> -	instance = pci_get_drvdata(pdev);
> -
>  	if (!instance)
>  		return 0;
>  
>  	host = instance->host;
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_enable_wake(pdev, PCI_D0, 0);
> -	pci_restore_state(pdev);
> +	device_wakeup_disable(dev);
>  
> -	dev_info(&pdev->dev, "%s is called\n", __func__);
> -	/*
> -	 * PCI prepping: enable device set bus mastering and dma mask
> -	 */
> -	rval = pci_enable_device_mem(pdev);
> -
> -	if (rval) {
> -		dev_err(&pdev->dev, "Enable device failed\n");
> -		return rval;
> -	}
> -
> -	pci_set_master(pdev);
> +	dev_info(dev, "%s is called\n", __func__);
>  
>  	/*
>  	 * We expect the FW state to be READY
> @@ -7754,14 +7730,8 @@ megasas_resume(struct pci_dev *pdev)
>  fail_set_dma_mask:
>  fail_ready_state:
>  
> -	pci_disable_device(pdev);
> -
>  	return -ENODEV;
>  }
> -#else
> -#define megasas_suspend	NULL
> -#define megasas_resume	NULL
> -#endif
>  
>  static inline int
>  megasas_wait_for_adapter_operational(struct megasas_instance *instance)
> @@ -7931,7 +7901,7 @@ static void megasas_detach_one(struct pci_dev *pdev)
>  
>  /**
>   * megasas_shutdown -	Shutdown entry point
> - * @device:		Generic device structure
> + * @pdev:		PCI device structure
>   */
>  static void megasas_shutdown(struct pci_dev *pdev)
>  {
> @@ -8508,6 +8478,8 @@ static const struct file_operations megasas_mgmt_fops = {
>  	.llseek = noop_llseek,
>  };
>  
> +static SIMPLE_DEV_PM_OPS(megasas_pm_ops, megasas_suspend, megasas_resume);
> +
>  /*
>   * PCI hotplug support registration structure
>   */
> @@ -8517,8 +8489,7 @@ static struct pci_driver megasas_pci_driver = {
>  	.id_table = megasas_pci_table,
>  	.probe = megasas_probe_one,
>  	.remove = megasas_detach_one,
> -	.suspend = megasas_suspend,
> -	.resume = megasas_resume,
> +	.driver.pm = &megasas_pm_ops,
>  	.shutdown = megasas_shutdown,
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
