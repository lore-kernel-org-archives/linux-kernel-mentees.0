Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A028C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:17:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52CA2207FC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:17:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0ui4TpP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52CA2207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2D02D87E94;
	Mon, 20 Jul 2020 13:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwE6+NVEBi9h; Mon, 20 Jul 2020 13:17:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1B5F487E19;
	Mon, 20 Jul 2020 13:17:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A2E2C089F;
	Mon, 20 Jul 2020 13:17:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34B5DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 23AF286BDC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2+SdRnH1z68h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:17:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 711C88648E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:17:51 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id a14so9046544pfi.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jpqacO9zR8Sudu9v86DTJ18b9fTO/xwUaLJoU6HeOnQ=;
 b=R0ui4TpPof2AriYTCWbS8iHic8pxOPEHnGSG+YT6BFLtxIoqKSRidzHy1pW6OA7lxo
 zdYkGpzT/qq/sfkeOcDOE70IFOe53/6UK52YIkZ13ukqHRiC9KL/rLvB1F+lj5NvZSWu
 FzV3yynUcBBkP1AtV5LEYVZLx/7AuzPx7FfzrqxWSJ5c4bqrhOXvjBPmHXGNICgLT/P9
 DDAMl8hNn8wt2mI015uRH7VbcjmoS4NcoH3Vnvy6o8AyhGPXBnr5aveTDGaajzV38Rpv
 DZIXA0Go38ZVnQI/Z2DKoqWlxUb719PvS77COBeVxlxCUc5k5UopSUYWQQHw/LJXlP3W
 JjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jpqacO9zR8Sudu9v86DTJ18b9fTO/xwUaLJoU6HeOnQ=;
 b=N5WO4tfN6UJaCvJaHItauTEmC5E2VfTtSTWL1K3aicOXbRITrWGYT3jObtAU4oE5dx
 Tru9YAVO/BtfwsC97W8ncyot0QaoajbhlN2yXE4IMEXRN+D7uQ62OdtUSOEQQnxqmgY6
 n3xdXYlRQb5WfK459KzfYiPt9krKDpiNYJ17h32gpwTOP7TQaylPBccbl6jY3QqLgdTN
 ixAcCrBDYfo6kTx7CJqwTbcv3Sfr+NPDMq9YiVT9uOWXm600z0aj7a0YVG7VIBQE4HAM
 ogOHy2iUCfa4z46ePA/cALlTC9oREjwEanG6DeJSjRxQMp+i+XbUypGZahGAG+jNlbpn
 AZ1A==
X-Gm-Message-State: AOAM532LaloCEYNX8+mf3SH7qMCwpBbFjlucSAEeZSKPpkbJmg16Nq/j
 P/uXbxjIS/czdvR5C/vytxc=
X-Google-Smtp-Source: ABdhPJzHaYOEgfYDopwh9TCSfXW1Smf+I09CCvOI+1aQoH/z6Hqobtgavp24UW3I4VSKtGEU85UO3A==
X-Received: by 2002:a05:6a00:1514:: with SMTP id
 q20mr20002025pfu.243.1595251070925; 
 Mon, 20 Jul 2020 06:17:50 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id w20sm16729302pfn.44.2020.07.20.06.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 06:17:50 -0700 (PDT)
Date: Mon, 20 Jul 2020 18:46:27 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200720131627.GA447599@gmail.com>
References: <20200717080910.342741-1-vaibhavgupta40@gmail.com>
 <20200717080910.342741-4-vaibhavgupta40@gmail.com>
 <CY4PR04MB37516C5544A7DCAD84921937E77B0@CY4PR04MB3751.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR04MB37516C5544A7DCAD84921937E77B0@CY4PR04MB3751.namprd04.prod.outlook.com>
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Joshua Morris <josh.h.morris@us.ibm.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 3/3] skd: use generic power
	management
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

On Mon, Jul 20, 2020 at 12:52:14PM +0000, Damien Le Moal wrote:
> On 2020/07/17 17:10, Vaibhav Gupta wrote:
> > Drivers using legacy PM have to manage PCI states and device's PM states
> > themselves. They also need to take care of configuration registers.
> > 
> > With improved and powerful support of generic PM, PCI Core takes care of
> > above mentioned, device-independent, jobs.
> > 
> > This driver makes use of PCI helper functions like
> > pci_save/restore_state(), pci_enable/disable_device(),
> > pci_request/release_regions(), pci_set_power_state() and
> > pci_set_master() to do required operations. In generic mode, they are no
> > longer needed.
> > 
> > Change function parameter in both .suspend() and .resume() to
> > "struct device*" type. Use to_pci_dev() to get "struct pci_dev*" variable.
> > 
> > Compile-tested only.
> 
> I do not think this belongs into the commit message. This was mentioned in the
> cover letter.
>
The messages in cover letter and commit message are bit similar. But the commit
message has patch specific changes mentioned in it.
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/block/skd_main.c | 36 ++++++++++--------------------------
> >  1 file changed, 10 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
> > index 51569c199a6c..d8d1042e7338 100644
> > --- a/drivers/block/skd_main.c
> > +++ b/drivers/block/skd_main.c
> > @@ -3315,12 +3315,12 @@ static void skd_pci_remove(struct pci_dev *pdev)
> >  	return;
> >  }
> >  
> > -static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
> > +static int __maybe_unused skd_pci_suspend(struct device *dev)
> >  {
> >  	int i;
> > -	struct skd_device *skdev;
> > +	struct pci_dev *pdev = to_pci_dev(dev);
> > +	struct skd_device *skdev = pci_get_drvdata(pdev);
> 
> You can just add the pdev declaration here. The other 2 changes are not needed.
> 
Okay.
> >  
> > -	skdev = pci_get_drvdata(pdev);
> 
> You can keep this as is.
> 
> >  	if (!skdev) {
> >  		dev_err(&pdev->dev, "no device data for PCI\n");
> >  		return -EIO;
> > @@ -3337,35 +3337,23 @@ static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
> >  	if (skdev->pcie_error_reporting_is_enabled)
> >  		pci_disable_pcie_error_reporting(pdev);
> >  
> > -	pci_release_regions(pdev);
> > -	pci_save_state(pdev);
> > -	pci_disable_device(pdev);
> > -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> >  	return 0;
> >  }
> >  
> > -static int skd_pci_resume(struct pci_dev *pdev)
> > +static int __maybe_unused skd_pci_resume(struct device *dev)
> >  {
> >  	int i;
> >  	int rc = 0;
> > -	struct skd_device *skdev;
> >  
> > -	skdev = pci_get_drvdata(pdev);
> 
> Same comment as above. Keep these as is and add only pdev declaration.
> 
Okay.
Sending v2 with suggested changes.

--Vaibhav Gupta
> > +	struct pci_dev *pdev = to_pci_dev(dev);
> > +	struct skd_device *skdev = pci_get_drvdata(pdev);
> >  	if (!skdev) {
> >  		dev_err(&pdev->dev, "no device data for PCI\n");
> >  		return -1;
> >  	}
> >  
> > -	pci_set_power_state(pdev, PCI_D0);
> > -	pci_enable_wake(pdev, PCI_D0, 0);
> > -	pci_restore_state(pdev);
> > +	device_wakeup_disable(dev);
> >  
> > -	rc = pci_enable_device(pdev);
> > -	if (rc)
> > -		return rc;
> > -	rc = pci_request_regions(pdev, DRV_NAME);
> > -	if (rc)
> > -		goto err_out;
> >  	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> >  	if (rc)
> >  		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> > @@ -3374,7 +3362,6 @@ static int skd_pci_resume(struct pci_dev *pdev)
> >  		goto err_out_regions;
> >  	}
> >  
> > -	pci_set_master(pdev);
> >  	rc = pci_enable_pcie_error_reporting(pdev);
> >  	if (rc) {
> >  		dev_err(&pdev->dev,
> > @@ -3427,10 +3414,6 @@ static int skd_pci_resume(struct pci_dev *pdev)
> >  		pci_disable_pcie_error_reporting(pdev);
> >  
> >  err_out_regions:
> > -	pci_release_regions(pdev);
> > -
> > -err_out:
> > -	pci_disable_device(pdev);
> >  	return rc;
> >  }
> >  
> > @@ -3450,13 +3433,14 @@ static void skd_pci_shutdown(struct pci_dev *pdev)
> >  	skd_stop_device(skdev);
> >  }
> >  
> > +static SIMPLE_DEV_PM_OPS(skd_pci_pm_ops, skd_pci_suspend, skd_pci_resume);
> > +
> >  static struct pci_driver skd_driver = {
> >  	.name		= DRV_NAME,
> >  	.id_table	= skd_pci_tbl,
> >  	.probe		= skd_pci_probe,
> >  	.remove		= skd_pci_remove,
> > -	.suspend	= skd_pci_suspend,
> > -	.resume		= skd_pci_resume,
> > +	.driver.pm	= &skd_pci_pm_ops,
> >  	.shutdown	= skd_pci_shutdown,
> >  };
> >  
> > 
> 
> 
> -- 
> Damien Le Moal
> Western Digital Research
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
