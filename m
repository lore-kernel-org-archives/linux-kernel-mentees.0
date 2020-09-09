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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2D3C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 15:23:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 811E721D81
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 15:23:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7Nu/Gdk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 811E721D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 322CD8751D;
	Wed,  9 Sep 2020 15:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xsfJo2kYWXm3; Wed,  9 Sep 2020 15:23:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 345B487518;
	Wed,  9 Sep 2020 15:23:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 207AEC0859;
	Wed,  9 Sep 2020 15:23:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3FCFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 15:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A78008728F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 15:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2BUnETDta+J9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 15:23:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 006CB8728C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 15:23:02 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id mm21so1493743pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 08:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=noQeIbbfRoQ0vZidOFhwWAtZHlg8KZn5Mi7qKiUoSv0=;
 b=R7Nu/GdkZmEC7TSLlP7R1O7TOyafDUdN6tay9lOSACMBaKb1nIEA9caWMlBIvIwEqg
 RurBwTc+FMV4gdRWQ8bJl3G9VT88ykR+HHjd6z8slJDU9De2K7HpRqzQX3kuaqgR6hYe
 dKFg24ew0Usg/YH1H/W5nCJ/v2vtNS7+SqMuedsfBWHtLNzkR3tm+/xoKIKBYRLuTeau
 ujAKFaMr2va34hxRNKG6vZ1lmb69TUCABv+08mggUQencSE3Ru58Yp5sbvYw7zJvLK8b
 Jjz7BS6emhbrlfTmO9kkfNf4nFZo7r96hXE3g1AnidGnRlJzngcHCMxvAlHKeltpYRIn
 Ozug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=noQeIbbfRoQ0vZidOFhwWAtZHlg8KZn5Mi7qKiUoSv0=;
 b=dvc2o/f2MbE6sWieIawMB3kngDcz30/dnXMO3ERXmHq58YY7HNV3EX6Cb9Mq35lrsC
 p1Pa0OTODuht8xlTOHFGZAq9DSOlbqQv+pCaxqCuAZFBcmyz17JRqOJ/SngbcasDQr+J
 +DF4J9dHAHc/ektxmBmUASgQ1Ku6l4/CjxGe6x283Umzt3ke87GCr3ItUx5jygYbDbmG
 tbPOk3LLgPVnJi4wpJ36J8N/27zZrQjVxtWzCVA0n9EZav8AKkb3MeTx7pCkbpWs+sUk
 NGIN5Rf47Ir7OqABU/4Uk7iV/w1DYbXupDxxQU5fZcr0qGkDXrHcoupbG5gbozJ1qeZS
 bc+A==
X-Gm-Message-State: AOAM532HYGkCkrirJA+cKVtHtPZwocQ9U3t84lekAnSrVDkjqEEjMVIU
 QvUtTb90A0ZRuPDA7fTB5ZY=
X-Google-Smtp-Source: ABdhPJxqyDSxATruhior6ZQs2kvioJaM7ed7VFeMTMm6hLUtqFjHtkirT8TP5qyBahgoWiWYiapPww==
X-Received: by 2002:a17:90a:a40d:: with SMTP id
 y13mr1187741pjp.183.1599664982471; 
 Wed, 09 Sep 2020 08:23:02 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id a2sm3014910pfr.104.2020.09.09.08.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 08:23:01 -0700 (PDT)
Date: Wed, 9 Sep 2020 20:50:58 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20200909152058.GA14223@gmail.com>
References: <20200909100315.GA13015@gmail.com>
 <20200909132332.GA696701@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909132332.GA696701@bjorn-Precision-5520>
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

On Wed, Sep 09, 2020 at 08:23:32AM -0500, Bjorn Helgaas wrote:
> On Wed, Sep 09, 2020 at 03:33:15PM +0530, Vaibhav Gupta wrote:
> > On Tue, Sep 08, 2020 at 12:32:09PM -0500, Bjorn Helgaas wrote:
> > > On Mon, Jul 20, 2020 at 07:04:14PM +0530, Vaibhav Gupta wrote:
> > > > With legacy PM hooks, it was the responsibility of a driver to manage PCI
> > > > states and also the device's power state. The generic approach is to let
> > > > the PCI core handle the work.
> > > > 
> > > > PCI core passes "struct device*" as an argument to the .suspend() and
> > > > .resume() callbacks. As the .suspend() work with "struct instance*",
> > > > extract it from "struct device*" using dev_get_drv_data().
> > > > 
> > > > Driver was also using PCI helper functions like pci_save/restore_state(),
> > > > pci_disable/enable_device(), pci_set_power_state() and pci_enable_wake().
> > > > They should not be invoked by the driver.
> > > > 
> > > > Compile-tested only.
> > > > 
> > > > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > > > ---
> > > >  drivers/scsi/megaraid/megaraid_sas_base.c | 61 ++++++-----------------
> > > >  1 file changed, 16 insertions(+), 45 deletions(-)
> > > > 
> > > > diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
> > > > index 00668335c2af..4a6ee7778977 100644
> > > > --- a/drivers/scsi/megaraid/megaraid_sas_base.c
> > > > +++ b/drivers/scsi/megaraid/megaraid_sas_base.c
> > > > @@ -7539,25 +7539,21 @@ static void megasas_shutdown_controller(struct megasas_instance *instance,
> > > >  	megasas_return_cmd(instance, cmd);
> > > >  }
> > > >  
> > > > -#ifdef CONFIG_PM
> > > >  /**
> > > >   * megasas_suspend -	driver suspend entry point
> > > > - * @pdev:		PCI device structure
> > > > - * @state:		PCI power state to suspend routine
> > > > + * @dev:		Device structure
> > > >   */
> > > > -static int
> > > > -megasas_suspend(struct pci_dev *pdev, pm_message_t state)
> > > > +static int __maybe_unused
> > > > +megasas_suspend(struct device *dev)
> > > >  {
> > > > -	struct megasas_instance *instance;
> > > > -
> > > > -	instance = pci_get_drvdata(pdev);
> > > > +	struct megasas_instance *instance = dev_get_drvdata(dev);
> > > >  
> > > >  	if (!instance)
> > > >  		return 0;
> > > >  
> > > >  	instance->unload = 1;
> > > >  
> > > > -	dev_info(&pdev->dev, "%s is called\n", __func__);
> > > > +	dev_info(dev, "%s is called\n", __func__);
> > > >  
> > > >  	/* Shutdown SR-IOV heartbeat timer */
> > > >  	if (instance->requestorId && !instance->skip_heartbeat_timer_del)
> > > > @@ -7579,7 +7575,7 @@ megasas_suspend(struct pci_dev *pdev, pm_message_t state)
> > > >  
> > > >  	tasklet_kill(&instance->isr_tasklet);
> > > >  
> > > > -	pci_set_drvdata(instance->pdev, instance);
> > > > +	dev_set_drvdata(dev, instance);
> > > 
> > > It *might* be correct to replace "instance->pdev" with "dev", but it's
> > > not obvious and deserves some explanation.  It's true that you can
> > > replace &pdev->dev with dev, but I don't know anything about
> > > instance->dev.
> 
> Sorry, I meant "instance->pdev" here.
> 
> > > I don't think this change is actually necessary, is it?
> > > "instance->pdev" is still a pci_dev pointer, so pci_set_drvdata()
> > > should work fine. ...
> > > 
> > There is no instance->dev . The 'dev' passed dev_set_drvdata() is
> > same &pdev->dev. 
> 
> Yes, it's true that "dev" here is the same as the "&pdev->dev" we had
> previously.  But we passed "instance->pdev" (not "pdev") to
> pci_set_drvdata().  So the question is whether instance->pdev->dev ==
> dev.
> 
> They *might* be the same, but I don't think it's obvious.
> 
Yes, they are same.
driver/pci/pci-driver.c :
'dev' is passed as parameter to both pci_device_probe() and pci_pm_suspend()
From 'dev', pci_device_probe() extracts "struct pci_dev*" and passes it to the
probe callback of this driver.

In the proble function - megasas_probe_one()
:7347	instance->pdev = pdev;
:7386	pci_set_drvdata(pdev, instance);

The proble function is using "struct pci_dev*" variable "pdev" provided by core
and same we replaced &pdev->dev with "struct device *dev".

So the instance->pdev->dev and 'dev' can only differ if 'dev' passed to
pci_device_probe() and pci_pm_suspend() are different.
> > The dev pointer used here, points to same value.
> > 
> > pci_get_drvdata() and pci_set_drvdata() invoke dev_get_drvdata() and
> > dev_set_drvdata() respectively. And they do nothing else. Seems like
> > additional unnecessary function calls and operations.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
