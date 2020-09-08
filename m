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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725CDC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:03:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECFD3207DE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZ179g5D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECFD3207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 933E0873AD;
	Tue,  8 Sep 2020 17:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4EBaGNFze0x; Tue,  8 Sep 2020 17:03:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 03B9F873A5;
	Tue,  8 Sep 2020 17:03:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF46FC0052;
	Tue,  8 Sep 2020 17:03:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86391C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 74F0585E9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zLmxvlMYubsC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:03:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D2CBD85D6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:03:38 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j34so5075171pgi.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xuJFXsSZhLTn4QTt9AYHjV/t9mROTn+fOq6waSMNYSs=;
 b=oZ179g5DtG+h+chAplPBrXJjuj638S0FCpKhCEGhpvm9VvsWXQPUwYI8HDc1UEmWi6
 a+j/vWhh9LqAWZTjUz/2hFCLZm54OTaNusV/I5bixoPh7ekshrIVMT/Bu+/HRtWu6KQV
 X81IZvECksxQEzu7rN2jEhRFk/b/yV5bkZhAq0MfzLlKM2GB8EFvukwEfbiFoBEONeHa
 unzBJIdc9g/SuIv56GyM9BCmwc5l8hSjJVzWJMzwcY5JPx/MKw9ymT3JNzxYET6VJbH5
 DbCFSsPONl3pp8ucslMne8kOtAS2SaJv8VKckKyYqFXrRjHx87+r6juf0xC6e6A92aOW
 sAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xuJFXsSZhLTn4QTt9AYHjV/t9mROTn+fOq6waSMNYSs=;
 b=S859wqlj9xW53B+fPYyjjLlpWRiorHori/Uizx60lVi6DLlubu9kisgyoZsvy4nbFR
 oLL7DmMPJHAMKA/ematR0C0sj0G2uA1LWqAmh43nKfbjfNpJysEejoiqS4W4q5X/DF/8
 4Sz8g907wF9fQDixjdmai/Hml+lFKhYosnNEcitbuq0h0WWERRITdTRGD3zf4+lEz0Mg
 PhcGZCTy5ew++a9b+sC3nwmdx4c/W+JletUSf3M/+3PoJfsEGsVx63Cpn5uf1RLiLivS
 RSBrwKpb+jr1b4vbeEg90HB8RuiR+PAssdOF21Aig4QoCnYZDen/SG9WQ1dca8MwWnMP
 zEIg==
X-Gm-Message-State: AOAM531qVQfJRxV2POpQtzQBSCoeNbZZT57f2Gk+sZxXH/+BFrQism6j
 0XSMe9Brm+UvuTWeBXvwlKM=
X-Google-Smtp-Source: ABdhPJyGcJoQNTrFi39eSyTpTCIiBnDYR1AtM61vOqpau6HB++g0/IWCmYOD3BVolI2a/79HX5yPGQ==
X-Received: by 2002:a05:6a00:1356:b029:13e:d13d:a084 with SMTP id
 k22-20020a056a001356b029013ed13da084mr64321pfu.27.1599584618337; 
 Tue, 08 Sep 2020 10:03:38 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id ie13sm42824pjb.5.2020.09.08.10.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 10:03:37 -0700 (PDT)
Date: Tue, 8 Sep 2020 22:31:44 +0530
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
Message-ID: <20200908170058.GG9948@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-7-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720133427.454400-7-vaibhavgupta40@gmail.com>
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 06/15] scsi: esas2r: use
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

On Mon, Jul 20, 2020 at 07:04:19PM +0530, Vaibhav Gupta wrote:
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
>  drivers/scsi/esas2r/esas2r.h      |  5 ++--
>  drivers/scsi/esas2r/esas2r_init.c | 48 +++++++++----------------------
>  drivers/scsi/esas2r/esas2r_main.c |  3 +-
>  3 files changed, 18 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/scsi/esas2r/esas2r.h b/drivers/scsi/esas2r/esas2r.h
> index 7f43b95f4e94..6ad3e0871ef0 100644
> --- a/drivers/scsi/esas2r/esas2r.h
> +++ b/drivers/scsi/esas2r/esas2r.h
> @@ -996,8 +996,9 @@ void esas2r_adapter_tasklet(unsigned long context);
>  irqreturn_t esas2r_interrupt(int irq, void *dev_id);
>  irqreturn_t esas2r_msi_interrupt(int irq, void *dev_id);
>  void esas2r_kickoff_timer(struct esas2r_adapter *a);
> -int esas2r_suspend(struct pci_dev *pcid, pm_message_t state);
> -int esas2r_resume(struct pci_dev *pcid);
> +
> +extern const struct dev_pm_ops esas2r_pm_ops;
> +
>  void esas2r_fw_event_off(struct esas2r_adapter *a);
>  void esas2r_fw_event_on(struct esas2r_adapter *a);
>  bool esas2r_nvram_write(struct esas2r_adapter *a, struct esas2r_request *rq,
> diff --git a/drivers/scsi/esas2r/esas2r_init.c b/drivers/scsi/esas2r/esas2r_init.c
> index eb7d139ffc00..6c5854969791 100644
> --- a/drivers/scsi/esas2r/esas2r_init.c
> +++ b/drivers/scsi/esas2r/esas2r_init.c
> @@ -640,53 +640,31 @@ void esas2r_kill_adapter(int i)
>  	}
>  }
>  
> -int esas2r_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused esas2r_suspend(struct device *dev)
>  {
> -	struct Scsi_Host *host = pci_get_drvdata(pdev);
> -	u32 device_state;
> +	struct Scsi_Host *host = dev_get_drvdata(dev);
>  	struct esas2r_adapter *a = (struct esas2r_adapter *)host->hostdata;
>  
> -	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev), "suspending adapter()");
> +	esas2r_log_dev(ESAS2R_LOG_INFO, dev, "suspending adapter()");
>  	if (!a)
>  		return -ENODEV;
>  
>  	esas2r_adapter_power_down(a, 1);
> -	device_state = pci_choose_state(pdev, state);
> -	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
> -		       "pci_save_state() called");
> -	pci_save_state(pdev);
> -	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
> -		       "pci_disable_device() called");
> -	pci_disable_device(pdev);
> -	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
> -		       "pci_set_power_state() called");
> -	pci_set_power_state(pdev, device_state);
> -	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev), "esas2r_suspend(): 0");
> +	esas2r_log_dev(ESAS2R_LOG_INFO, dev, "esas2r_suspend(): 0");
>  	return 0;
>  }
>  
> -int esas2r_resume(struct pci_dev *pdev)
> +static int __maybe_unused esas2r_resume(struct device *dev)
>  {
> -	struct Scsi_Host *host = pci_get_drvdata(pdev);
> +	struct Scsi_Host *host = dev_get_drvdata(dev);
>  	struct esas2r_adapter *a = (struct esas2r_adapter *)host->hostdata;
> -	int rez;
> +	int rez = 0;
>  
> -	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev), "resuming adapter()");
> -	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
> -		       "pci_set_power_state(PCI_D0) "
> +	esas2r_log_dev(ESAS2R_LOG_INFO, dev, "resuming adapter()");
> +	esas2r_log_dev(ESAS2R_LOG_INFO, dev,
> +		       "device_wakeup_disable() "
>  		       "called");
> -	pci_set_power_state(pdev, PCI_D0);
> -	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
> -		       "pci_enable_wake(PCI_D0, 0) "
> -		       "called");
> -	pci_enable_wake(pdev, PCI_D0, 0);
> -	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
> -		       "pci_restore_state() called");
> -	pci_restore_state(pdev);
> -	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
> -		       "pci_enable_device() called");
> -	rez = pci_enable_device(pdev);
> -	pci_set_master(pdev);
> +	device_wakeup_disable(dev);
>  
>  	if (!a) {
>  		rez = -ENODEV;
> @@ -730,11 +708,13 @@ int esas2r_resume(struct pci_dev *pdev)
>  	}
>  
>  error_exit:
> -	esas2r_log_dev(ESAS2R_LOG_CRIT, &(pdev->dev), "esas2r_resume(): %d",
> +	esas2r_log_dev(ESAS2R_LOG_CRIT, dev, "esas2r_resume(): %d",
>  		       rez);
>  	return rez;
>  }
>  
> +SIMPLE_DEV_PM_OPS(esas2r_pm_ops, esas2r_suspend, esas2r_resume);
> +
>  bool esas2r_set_degraded_mode(struct esas2r_adapter *a, char *error_str)
>  {
>  	set_bit(AF_DEGRADED_MODE, &a->flags);
> diff --git a/drivers/scsi/esas2r/esas2r_main.c b/drivers/scsi/esas2r/esas2r_main.c
> index 7b49e2e9fcde..aab3ea580e6b 100644
> --- a/drivers/scsi/esas2r/esas2r_main.c
> +++ b/drivers/scsi/esas2r/esas2r_main.c
> @@ -346,8 +346,7 @@ static struct pci_driver
>  	.id_table	= esas2r_pci_table,
>  	.probe		= esas2r_probe,
>  	.remove		= esas2r_remove,
> -	.suspend	= esas2r_suspend,
> -	.resume		= esas2r_resume,
> +	.driver.pm	= &esas2r_pm_ops,
>  };
>  
>  static int esas2r_probe(struct pci_dev *pcid,
> -- 
> 2.27.0
> 
.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
