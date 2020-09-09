Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E04C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 10:05:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F5FA21973
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 10:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CP9aECFZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F5FA21973
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F2F387105;
	Wed,  9 Sep 2020 10:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCp24MGPk5up; Wed,  9 Sep 2020 10:05:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E193870F7;
	Wed,  9 Sep 2020 10:05:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27F79C0859;
	Wed,  9 Sep 2020 10:05:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7AF5AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 10:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C20292E17B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 10:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asE-zdLOnJr8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 10:05:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 505D4204DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 10:05:20 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id b16so1094986pjp.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 03:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XB3RLON5qcBthb/U8/A/O+8sQ7Tgn2KHnSYoALIjbSE=;
 b=CP9aECFZyZL9cNPC6KblFfjHnAeIdhRWfiNbIoAx5Bbi0lvpDWFQXeebyLf80tMdzx
 sMXsLSW6Y0qPhAmJjbsIP8Xx7GiprSnRuc83FpiCT3NcsiyETFbsK4OOo12gfCybKKtj
 37eVSUMylMLjGaMgeG4lqDh6DmoQAG8leelQkKYQJ5WwfxKDu9FFz7MrXx/G6yOgwzdx
 BVM0WTwbs5HcmMiG3dlCjDJ3/n2PFzA9nvyGu6V5NakdDsP5TRLRk+K8bU9bCMXXBgvj
 xKisg4nlLlnZM79rB/B/FzOPbFVbvZqRXk1qCmGHFbnqBBQYNwC8g4+5dRvescvPp9Zm
 cBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XB3RLON5qcBthb/U8/A/O+8sQ7Tgn2KHnSYoALIjbSE=;
 b=QZCMdwTMt91RnL/9s/LCDatAmn6sweAL9JgJ/yzP6a2heovBJQJpr+OtPCf8Yd+qZR
 8dz0rSYSP4sHJstbXeCCHI8J761Hi0iVP+5t2Twin14pJl7DWD+TrpIHB52oZ1BnOvTf
 qjHiWUWOYr6cpYaTd2QcNDRsqkmLkD0aiuQwp27gbrRTosuaLvjZoAFK5T5deYfc3o/B
 /KER8VfDVGmH6lhCCy2vb0C10OOnn3R+Kks0CNzlOxs4/CIi8+mG0oqV7djIJiqB8TIC
 ImoPmYGjzatSwcqTwW5c2T9FtjJvn4/EACcnoW2NDwJdgLnrdjZWFLFTn8QGbYTuzbVE
 GijQ==
X-Gm-Message-State: AOAM533rZI+Z8VxZhnBerzi4CUoE/ia+VJA+f0hPVEUmtEYwmJlJnmjP
 kv7lPMrW4SedXws09WiHvZQ=
X-Google-Smtp-Source: ABdhPJxhipPJcCxZ+k1YRv2vZByYBjQ1zjv+RABOUsx9MSpGzEONZGUieuPo5vYeNuljeYpsEhsgUw==
X-Received: by 2002:a17:90b:1916:: with SMTP id
 mp22mr170102pjb.132.1599645919622; 
 Wed, 09 Sep 2020 03:05:19 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id h1sm1577255pji.52.2020.09.09.03.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 03:05:19 -0700 (PDT)
Date: Wed, 9 Sep 2020 15:33:15 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20200909100315.GA13015@gmail.com>
References: <20200720133427.454400-2-vaibhavgupta40@gmail.com>
 <20200908173209.GA607806@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908173209.GA607806@bjorn-Precision-5520>
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

On Tue, Sep 08, 2020 at 12:32:09PM -0500, Bjorn Helgaas wrote:
> On Mon, Jul 20, 2020 at 07:04:14PM +0530, Vaibhav Gupta wrote:
> > With legacy PM hooks, it was the responsibility of a driver to manage PCI
> > states and also the device's power state. The generic approach is to let
> > the PCI core handle the work.
> > 
> > PCI core passes "struct device*" as an argument to the .suspend() and
> > .resume() callbacks. As the .suspend() work with "struct instance*",
> > extract it from "struct device*" using dev_get_drv_data().
> > 
> > Driver was also using PCI helper functions like pci_save/restore_state(),
> > pci_disable/enable_device(), pci_set_power_state() and pci_enable_wake().
> > They should not be invoked by the driver.
> > 
> > Compile-tested only.
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/scsi/megaraid/megaraid_sas_base.c | 61 ++++++-----------------
> >  1 file changed, 16 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
> > index 00668335c2af..4a6ee7778977 100644
> > --- a/drivers/scsi/megaraid/megaraid_sas_base.c
> > +++ b/drivers/scsi/megaraid/megaraid_sas_base.c
> > @@ -7539,25 +7539,21 @@ static void megasas_shutdown_controller(struct megasas_instance *instance,
> >  	megasas_return_cmd(instance, cmd);
> >  }
> >  
> > -#ifdef CONFIG_PM
> >  /**
> >   * megasas_suspend -	driver suspend entry point
> > - * @pdev:		PCI device structure
> > - * @state:		PCI power state to suspend routine
> > + * @dev:		Device structure
> >   */
> > -static int
> > -megasas_suspend(struct pci_dev *pdev, pm_message_t state)
> > +static int __maybe_unused
> > +megasas_suspend(struct device *dev)
> >  {
> > -	struct megasas_instance *instance;
> > -
> > -	instance = pci_get_drvdata(pdev);
> > +	struct megasas_instance *instance = dev_get_drvdata(dev);
> >  
> >  	if (!instance)
> >  		return 0;
> >  
> >  	instance->unload = 1;
> >  
> > -	dev_info(&pdev->dev, "%s is called\n", __func__);
> > +	dev_info(dev, "%s is called\n", __func__);
> >  
> >  	/* Shutdown SR-IOV heartbeat timer */
> >  	if (instance->requestorId && !instance->skip_heartbeat_timer_del)
> > @@ -7579,7 +7575,7 @@ megasas_suspend(struct pci_dev *pdev, pm_message_t state)
> >  
> >  	tasklet_kill(&instance->isr_tasklet);
> >  
> > -	pci_set_drvdata(instance->pdev, instance);
> > +	dev_set_drvdata(dev, instance);
> 
> It *might* be correct to replace "instance->pdev" with "dev", but it's
> not obvious and deserves some explanation.  It's true that you can
> replace &pdev->dev with dev, but I don't know anything about
> instance->dev.
> 
> I don't think this change is actually necessary, is it?
> "instance->pdev" is still a pci_dev pointer, so pci_set_drvdata()
> should work fine.
> 
> It looks goofy to use pci_set_drvdata() or dev_set_drvdata() in a
> suspend routine, but I didn't bother trying to figure out what's going
> on here.
> 
There is no instance->dev . The 'dev' passed dev_set_drvdata() is same
&pdev->dev. The dev pointer used here, points to same value.

pci_get_drvdata() and pci_set_drvdata() invoke dev_get_drvdata() and
dev_set_drvdata() respectively. And they do nothing else. Seems like additional
unnecessary function calls and operations.

We can get rid of these PCI helper functions too.
> >  	instance->instancet->disable_intr(instance);
> >  
> >  	megasas_destroy_irqs(instance);
> > @@ -7587,48 +7583,28 @@ megasas_suspend(struct pci_dev *pdev, pm_message_t state)
> >  	if (instance->msix_vectors)
> >  		pci_free_irq_vectors(instance->pdev);
> >  
> > -	pci_save_state(pdev);
> > -	pci_disable_device(pdev);
> > -
> > -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> > -
> >  	return 0;
> >  }
> >  
> >  /**
> >   * megasas_resume-      driver resume entry point
> > - * @pdev:               PCI device structure
> > + * @dev:              Device structure
> >   */
> > -static int
> > -megasas_resume(struct pci_dev *pdev)
> > +static int __maybe_unused
> > +megasas_resume(struct device *dev)
> >  {
> >  	int rval;
> >  	struct Scsi_Host *host;
> > -	struct megasas_instance *instance;
> > +	struct megasas_instance *instance = dev_get_drvdata(dev);
> >  	u32 status_reg;
> >  
> > -	instance = pci_get_drvdata(pdev);
> > -
> >  	if (!instance)
> >  		return 0;
> >  
> >  	host = instance->host;
> > -	pci_set_power_state(pdev, PCI_D0);
> > -	pci_enable_wake(pdev, PCI_D0, 0);
> > -	pci_restore_state(pdev);
> > +	device_wakeup_disable(dev);
> 
> Shouldn't there be a corresponding device_wakeup_enable() or similar
> elsewhere?
> 
> Maybe the fact that megasas disables wakeup but never enables it is a
> latent bug?
> 
Yeah, I guess I sent this patch a lot earlier than we figured this out and
didn't notice it later. I will send v3 for it.
> > -	dev_info(&pdev->dev, "%s is called\n", __func__);
> > -	/*
> > -	 * PCI prepping: enable device set bus mastering and dma mask
> > -	 */
> > -	rval = pci_enable_device_mem(pdev);
> > -
> > -	if (rval) {
> > -		dev_err(&pdev->dev, "Enable device failed\n");
> > -		return rval;
> > -	}
> > -
> > -	pci_set_master(pdev);
> > +	dev_info(dev, "%s is called\n", __func__);
> >  
> >  	/*
> >  	 * We expect the FW state to be READY
> > @@ -7754,14 +7730,8 @@ megasas_resume(struct pci_dev *pdev)
> >  fail_set_dma_mask:
> >  fail_ready_state:
> >  
> > -	pci_disable_device(pdev);
> > -
> >  	return -ENODEV;
> >  }
> > -#else
> > -#define megasas_suspend	NULL
> > -#define megasas_resume	NULL
> > -#endif
> >  
> >  static inline int
> >  megasas_wait_for_adapter_operational(struct megasas_instance *instance)
> > @@ -7931,7 +7901,7 @@ static void megasas_detach_one(struct pci_dev *pdev)
> >  
> >  /**
> >   * megasas_shutdown -	Shutdown entry point
> > - * @device:		Generic device structure
> > + * @pdev:		PCI device structure
> 
> Looks like an unrelated typo fix?  I would put this in a separate
> patch.
> 
Okay.
> >   */
> >  static void megasas_shutdown(struct pci_dev *pdev)
> >  {
> > @@ -8508,6 +8478,8 @@ static const struct file_operations megasas_mgmt_fops = {
> >  	.llseek = noop_llseek,
> >  };
> >  
> > +static SIMPLE_DEV_PM_OPS(megasas_pm_ops, megasas_suspend, megasas_resume);
> > +
> >  /*
> >   * PCI hotplug support registration structure
> >   */
> > @@ -8517,8 +8489,7 @@ static struct pci_driver megasas_pci_driver = {
> >  	.id_table = megasas_pci_table,
> >  	.probe = megasas_probe_one,
> >  	.remove = megasas_detach_one,
> > -	.suspend = megasas_suspend,
> > -	.resume = megasas_resume,
> > +	.driver.pm = &megasas_pm_ops,
> >  	.shutdown = megasas_shutdown,
> >  };
> >  
> > -- 
> > 2.27.0
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
