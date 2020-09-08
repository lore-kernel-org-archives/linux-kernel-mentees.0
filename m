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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3158AC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:02:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5BBD2098B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJXs4g3z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5BBD2098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 585CE86D08;
	Tue,  8 Sep 2020 17:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4frCVEPGGEI; Tue,  8 Sep 2020 17:02:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CDF1686CFD;
	Tue,  8 Sep 2020 17:02:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4C0AC088B;
	Tue,  8 Sep 2020 17:02:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AB46C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 23D0186D2C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jurfiKc0tKnz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:02:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9498986D10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:02:25 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w7so11478223pfi.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 10:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BZmIEpkXHMccerUzS/eWsNfrpJDT5KMzQFld7Ac4EeA=;
 b=nJXs4g3zSYUyvbXvl+pQ9haosLehljosUOdGlxDg+0iVCK5373vpNdkV5f3x9Ujcgx
 iqKQ4AtcAbDvbHx/ATkInbh4Sz7A0dsS105sB24SH49B08HDSo1GNjR6G1TwnAlA5Jo9
 GHsjnDWlnLftb031A/iglbploRQAkr3c8n/4PNqDn4si1d7mvD7dxt9cTnS1Pv6aGq4f
 7XVliTOLTb8zst5rkCTzbOpd2Xzgw+zs4hpOsF1lNKC34z3YbXyPxUgXVEiPu9YY4WAq
 8E/U3ydO45Kw6h61WNCGu0E04M/QcgZpM+kM7rWtaEfKISwmuJ1P3BNicj4pWr0LllGW
 V7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BZmIEpkXHMccerUzS/eWsNfrpJDT5KMzQFld7Ac4EeA=;
 b=YjnUNTVflbglEsNIjDFd+TQsK61qClx/XGFJZ369ctgxufTSQ9lNtPf8k6A4umXDX5
 D1lTPvYkzZzXurCVcJxiCxeQGvCJ+QzIWo0XYsxJIPebgzspT8Csh+hPbApk15NLFlGJ
 4usXvxi2Vupc2q+9inbwi5qxZsSHiroYe1P/hhsCNSkNYKHhQnTnrPVZlNmpzh4cOYIS
 lWLOvLVFRngjP8pdamDzGJzU9YvL0oVf6LBIraQX+do2OBl5dT2HNieO/0yBkt+dOxcS
 rA19IKglUP1HyuaYtGIC7+ZdioZ+SWJZ8dVqpvOqLhBi+CXWc/dMAdqbwYDWW44uIo0/
 WJxw==
X-Gm-Message-State: AOAM532sjT8IQEZy2KZ3/SSb7C4NuU+/Rcusy8Z/gWPr4djtAnnLi92L
 eiYcct4T7euNorvd9C9FeIg=
X-Google-Smtp-Source: ABdhPJysf6/+o9H2e3hKfxDDDNnovTxk3xmwwMf//CV2vPdtw+RF8nXiW+RMWW8MrHLhZ6kAJ2iN+A==
X-Received: by 2002:aa7:8aca:0:b029:13e:d13d:a07d with SMTP id
 b10-20020aa78aca0000b029013ed13da07dmr99143pfd.20.1599584545076; 
 Tue, 08 Sep 2020 10:02:25 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id f3sm15403716pgf.32.2020.09.08.10.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 10:02:24 -0700 (PDT)
Date: Tue, 8 Sep 2020 22:30:27 +0530
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
Message-ID: <20200908170027.GF9948@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-6-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720133427.454400-6-vaibhavgupta40@gmail.com>
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 05/15] scsi: arcmsr: use
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

On Mon, Jul 20, 2020 at 07:04:18PM +0530, Vaibhav Gupta wrote:
> With legacy PM hooks, it was the responsibility of a driver to manage PCI
> states and also the device's power state. The generic approach is to let
> the PCI core handle the work.
> 
> PCI core passes "struct device*" as an argument to the .suspend() and
> .resume() callbacks.
> 
> Driver was also using PCI helper functions like pci_save/restore_state(),
> pci_disable/enable_device(), pci_set_power_state() and pci_enable_wake().
> They should not be invoked by the driver.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/scsi/arcmsr/arcmsr_hba.c | 35 ++++++++++++--------------------
>  1 file changed, 13 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
> index 30914c8f29cc..7e098ddcc4f5 100644
> --- a/drivers/scsi/arcmsr/arcmsr_hba.c
> +++ b/drivers/scsi/arcmsr/arcmsr_hba.c
> @@ -113,8 +113,8 @@ static int arcmsr_bios_param(struct scsi_device *sdev,
>  static int arcmsr_queue_command(struct Scsi_Host *h, struct scsi_cmnd *cmd);
>  static int arcmsr_probe(struct pci_dev *pdev,
>  				const struct pci_device_id *id);
> -static int arcmsr_suspend(struct pci_dev *pdev, pm_message_t state);
> -static int arcmsr_resume(struct pci_dev *pdev);
> +static int __maybe_unused arcmsr_suspend(struct device *dev);
> +static int __maybe_unused arcmsr_resume(struct device *dev);
>  static void arcmsr_remove(struct pci_dev *pdev);
>  static void arcmsr_shutdown(struct pci_dev *pdev);
>  static void arcmsr_iop_init(struct AdapterControlBlock *acb);
> @@ -213,13 +213,14 @@ static struct pci_device_id arcmsr_device_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(pci, arcmsr_device_id_table);
>  
> +static SIMPLE_DEV_PM_OPS(arcmsr_pm_ops, arcmsr_suspend, arcmsr_resume);
> +
>  static struct pci_driver arcmsr_pci_driver = {
>  	.name			= "arcmsr",
>  	.id_table		= arcmsr_device_id_table,
>  	.probe			= arcmsr_probe,
>  	.remove			= arcmsr_remove,
> -	.suspend		= arcmsr_suspend,
> -	.resume			= arcmsr_resume,
> +	.driver.pm		= &arcmsr_pm_ops,
>  	.shutdown		= arcmsr_shutdown,
>  };
>  /*
> @@ -1065,14 +1066,14 @@ static void arcmsr_free_irq(struct pci_dev *pdev,
>  	pci_free_irq_vectors(pdev);
>  }
>  
> -static int arcmsr_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused arcmsr_suspend(struct device *dev)
>  {
> -	uint32_t intmask_org;
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct Scsi_Host *host = pci_get_drvdata(pdev);
>  	struct AdapterControlBlock *acb =
>  		(struct AdapterControlBlock *)host->hostdata;
>  
> -	intmask_org = arcmsr_disable_outbound_ints(acb);
> +	arcmsr_disable_outbound_ints(acb);
>  	arcmsr_free_irq(pdev, acb);
>  	del_timer_sync(&acb->eternal_timer);
>  	if (set_date_time)
> @@ -1080,29 +1081,21 @@ static int arcmsr_suspend(struct pci_dev *pdev, pm_message_t state)
>  	flush_work(&acb->arcmsr_do_message_isr_bh);
>  	arcmsr_stop_adapter_bgrb(acb);
>  	arcmsr_flush_adapter_cache(acb);
> -	pci_set_drvdata(pdev, host);
> -	pci_save_state(pdev);
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
>  	return 0;
>  }
>  
> -static int arcmsr_resume(struct pci_dev *pdev)
> +static int __maybe_unused arcmsr_resume(struct device *dev)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct Scsi_Host *host = pci_get_drvdata(pdev);
>  	struct AdapterControlBlock *acb =
>  		(struct AdapterControlBlock *)host->hostdata;
>  
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_enable_wake(pdev, PCI_D0, 0);
> -	pci_restore_state(pdev);
> -	if (pci_enable_device(pdev)) {
> -		pr_warn("%s: pci_enable_device error\n", __func__);
> -		return -ENODEV;
> -	}
> +	device_wakeup_disable(dev);
> +
>  	if (arcmsr_set_dma_mask(acb))
>  		goto controller_unregister;
> -	pci_set_master(pdev);
> +
>  	if (arcmsr_request_irq(pdev, acb) == FAILED)
>  		goto controller_stop;
>  	switch (acb->adapter_type) {
> @@ -1137,9 +1130,7 @@ static int arcmsr_resume(struct pci_dev *pdev)
>  	scsi_remove_host(host);
>  	arcmsr_free_ccb_pool(acb);
>  	arcmsr_unmap_pciregion(acb);
> -	pci_release_regions(pdev);
>  	scsi_host_put(host);
> -	pci_disable_device(pdev);
>  	return -ENODEV;
>  }
>  
> -- 
> 2.27.0
> 
.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
