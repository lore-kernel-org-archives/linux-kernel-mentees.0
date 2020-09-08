Return-Path: <SRS0=zeZA=CR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E9CC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:32:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0505C2076C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:32:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="w443FAgs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0505C2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE7CE868CF;
	Tue,  8 Sep 2020 17:32:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3nnuH0SKLAjl; Tue,  8 Sep 2020 17:32:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B06A0835CE;
	Tue,  8 Sep 2020 17:32:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1C94C0859;
	Tue,  8 Sep 2020 17:32:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A991C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F2AA622FC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BFSaNYPGoon
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:32:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 6310022DE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:32:11 +0000 (UTC)
Received: from localhost (35.sub-72-107-115.myvzw.com [72.107.115.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 821D220738;
 Tue,  8 Sep 2020 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599586330;
 bh=kUTqcdvvfzcSjWaK0H6A5NdpMrZNrv0SGFczPrxzh2I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=w443FAgsCnle6zPIMQhAt3jMhssw9u1Htr1KiAP6iOc1pzVVGk6sw4JNj43q7EOZJ
 SZnAMZ6lwcAJ1LPoz4m/tiVshXlhrheQfSg08J1HyqKYAjyIHowjC+NRJfM1bJsxfM
 Q0IFMBC3s4GtTf+rIMpFH2mcfYxWqayRcp7xnn8U=
Date: Tue, 8 Sep 2020 12:32:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200908173209.GA607806@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720133427.454400-2-vaibhavgupta40@gmail.com>
Cc: Don Brace <don.brace@microsemi.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Hannes Reinecke <hare@suse.com>, Bradley Grove <linuxdrivers@attotech.com>,
 linux-scsi@vger.kernel.org, Sathya Prakash <sathya.prakash@broadcom.com>,
 esc.storagedev@microsemi.com, James Smart <james.smart@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, Adam Radford <aradford@gmail.com>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 megaraidlinux.pdl@broadcom.com, Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 MPT-FusionLinux.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Sumit Saxena <sumit.saxena@broadcom.com>
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

It *might* be correct to replace "instance->pdev" with "dev", but it's
not obvious and deserves some explanation.  It's true that you can
replace &pdev->dev with dev, but I don't know anything about
instance->dev.

I don't think this change is actually necessary, is it?
"instance->pdev" is still a pci_dev pointer, so pci_set_drvdata()
should work fine.

It looks goofy to use pci_set_drvdata() or dev_set_drvdata() in a
suspend routine, but I didn't bother trying to figure out what's going
on here.

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

Shouldn't there be a corresponding device_wakeup_enable() or similar
elsewhere?

Maybe the fact that megasas disables wakeup but never enables it is a
latent bug?

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

Looks like an unrelated typo fix?  I would put this in a separate
patch.

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
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
