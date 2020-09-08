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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0B3C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:00:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7947B2080C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acYgkvgA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7947B2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0EFDD872EF;
	Tue,  8 Sep 2020 17:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bk09aapFUIJw; Tue,  8 Sep 2020 17:00:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6BDD1873A8;
	Tue,  8 Sep 2020 17:00:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66EDAC0052;
	Tue,  8 Sep 2020 17:00:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C6D9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 883F086CB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zbyi8a6nTWZh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:00:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D389086CA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:00:12 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id s2so30117pjr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iKuzfMMNhC5TJ+c7Fua7oTap7vymNcWtBzASKBpHXMA=;
 b=acYgkvgABuHjEKMgfiqkimbPBka+X6yG3/OejaxPCBtLpcyAcsbqyhwvQqlgjDZOA0
 8EvIyY76gDQcmL5FSdZTxH08ZQQCdkoO/ZPM/5KPHr3sL8UoAUz/fAko3p2UsI2wtPDZ
 xo3WEQ66kj9+ies/7OFNVu6Q/CpoW3KVz9IekekMO/3U6YNDz2yLRJMAC06qLPjFe4Qs
 TnFKKIn4TYbvJTMUAtOOJTHYbQA+w9lb3ARvzD4YtpDkyb/1J8kVHIokOFxMa1JeG8Mt
 mb7yzlkuWQ4ia5lDgklbNZmvq/8y3I5Q07XiOGjiA9XzIaQzj3LpsUBtOFYFySK1FvN4
 NiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iKuzfMMNhC5TJ+c7Fua7oTap7vymNcWtBzASKBpHXMA=;
 b=rysLMyn7WNngfMT2U2fVfec/A49r/h2AorCH8WdxS00MSd0P9c0eEHI9t+lBsQYJyl
 gMLIYwM5TbxwFi6kzFN5mWLaP0EUmpfzN+wSi7qE/+saa7QeeyS5hYe50OFcQlguP/0T
 bND9uZkRIfE9h82nNF5xvk/vDh2UKOXalFU19HLaQMDiZ+hy4Y9pGJGPOk8hqZe4zm+N
 fFtK9XFpfkQbYeNDXdp0FX5X9ZFFFu7OlLIdnrgVdvrMuaA2MiwZlggv3aCgAhFQGd13
 NxDKOlmsJ9GKhjZEEJFzFZZ+URElBDAMdzx+Dxl8Oyr8SFFgPj8R/Jk3xHJWbQHwxiFx
 AvRA==
X-Gm-Message-State: AOAM533t74qmb0uguj4Cc+ouVcQn6fkpJMlqbLk60bucKnfAW2Xb0hqW
 ODbkyF/fOxVlUrnGbxMaZ3E=
X-Google-Smtp-Source: ABdhPJxDDiTHs3utTJZoGKbwiCgqc0v2PDE0cUAb7ZeCzLBsKSuvjEX8RF0+OmgJJ14cK7JfUAlf+w==
X-Received: by 2002:a17:90a:ed8e:: with SMTP id
 k14mr73895pjy.178.1599584412423; 
 Tue, 08 Sep 2020 10:00:12 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id a10sm18845942pfn.219.2020.09.08.09.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 10:00:11 -0700 (PDT)
Date: Tue, 8 Sep 2020 22:28:04 +0530
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
Message-ID: <20200908165804.GC9948@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-3-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720133427.454400-3-vaibhavgupta40@gmail.com>
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 02/15] scsi: aacraid: use
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

On Mon, Jul 20, 2020 at 07:04:15PM +0530, Vaibhav Gupta wrote:
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
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/scsi/aacraid/linit.c | 34 ++++++++--------------------------
>  1 file changed, 8 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/scsi/aacraid/linit.c b/drivers/scsi/aacraid/linit.c
> index a308e86a97f1..1e44868ee953 100644
> --- a/drivers/scsi/aacraid/linit.c
> +++ b/drivers/scsi/aacraid/linit.c
> @@ -1910,11 +1910,9 @@ static int aac_acquire_resources(struct aac_dev *dev)
>  
>  }
>  
> -#if (defined(CONFIG_PM))
> -static int aac_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused aac_suspend(struct device *dev)
>  {
> -
> -	struct Scsi_Host *shost = pci_get_drvdata(pdev);
> +	struct Scsi_Host *shost = dev_get_drvdata(dev);
>  	struct aac_dev *aac = (struct aac_dev *)shost->hostdata;
>  
>  	scsi_host_block(shost);
> @@ -1923,29 +1921,16 @@ static int aac_suspend(struct pci_dev *pdev, pm_message_t state)
>  
>  	aac_release_resources(aac);
>  
> -	pci_set_drvdata(pdev, shost);
> -	pci_save_state(pdev);
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> -
>  	return 0;
>  }
>  
> -static int aac_resume(struct pci_dev *pdev)
> +static int __maybe_unused aac_resume(struct device *dev)
>  {
> -	struct Scsi_Host *shost = pci_get_drvdata(pdev);
> +	struct Scsi_Host *shost = dev_get_drvdata(dev);
>  	struct aac_dev *aac = (struct aac_dev *)shost->hostdata;
> -	int r;
>  
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_enable_wake(pdev, PCI_D0, 0);
> -	pci_restore_state(pdev);
> -	r = pci_enable_device(pdev);
> +	device_wakeup_disable(dev);
>  
> -	if (r)
> -		goto fail_device;
> -
> -	pci_set_master(pdev);
>  	if (aac_acquire_resources(aac))
>  		goto fail_device;
>  	/*
> @@ -1960,10 +1945,8 @@ static int aac_resume(struct pci_dev *pdev)
>  fail_device:
>  	printk(KERN_INFO "%s%d: resume failed.\n", aac->name, aac->id);
>  	scsi_host_put(shost);
> -	pci_disable_device(pdev);
>  	return -ENODEV;
>  }
> -#endif
>  
>  static void aac_shutdown(struct pci_dev *dev)
>  {
> @@ -2108,15 +2091,14 @@ static struct pci_error_handlers aac_pci_err_handler = {
>  	.resume			= aac_pci_resume,
>  };
>  
> +static SIMPLE_DEV_PM_OPS(aac_pm_ops, aac_suspend, aac_resume);
> +
>  static struct pci_driver aac_pci_driver = {
>  	.name		= AAC_DRIVERNAME,
>  	.id_table	= aac_pci_tbl,
>  	.probe		= aac_probe_one,
>  	.remove		= aac_remove_one,
> -#if (defined(CONFIG_PM))
> -	.suspend	= aac_suspend,
> -	.resume		= aac_resume,
> -#endif
> +	.driver.pm	= &aac_pm_ops,
>  	.shutdown	= aac_shutdown,
>  	.err_handler    = &aac_pci_err_handler,
>  };
> -- 
> 2.27.0
> 
.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
