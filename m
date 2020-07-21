Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C82C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 16:32:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F14F8207BB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 16:32:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEdaPyHd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F14F8207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9498D87C13;
	Tue, 21 Jul 2020 16:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNLSOOt95Dgq; Tue, 21 Jul 2020 16:32:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9DC2E8630A;
	Tue, 21 Jul 2020 16:32:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 814CEC089F;
	Tue, 21 Jul 2020 16:32:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BD7CC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 16:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4FB86203B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 16:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d-a1RMi5ZHBX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 16:32:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 9C57C1FF11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 16:32:21 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id k5so1935647pjg.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LPmyjWx9tWsRH5uEf65QCL8YMbiStfFo3Vcfges55fU=;
 b=PEdaPyHdq+UcCPdmaHqy3vwaLCO1d9UYBqTlisJxyeo6rvZZc+kQfrddkq1mcQ9JJS
 +8GY0HhG389+xyMppz6eL5z+EZVW5DfiVIyCNKrJ/Swi0FVfOmWL7krNETayOc/6YpGc
 ChrtydDlZgzZ1YdujTEnti0poOkSfXyNgrPMcFZMUupMnQuVZM6U19xoczR/lzsNeFJf
 TPcDzbzlXzyCoDEoT1plvQMqj/bmBLEFYkA8iFI9FpKxvGBDLNtXxXn9Awk0TcQBjCGO
 8tY5rHZk0bIBnILPtcmc8YeY//ZeOuMSohf1SSgby1BD3SsifmH78znFCQKh4/tJ3heq
 BydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LPmyjWx9tWsRH5uEf65QCL8YMbiStfFo3Vcfges55fU=;
 b=o5SEhB4kqrFcpAytoQOeFswmycKp7WPm56o+TQzN98BOU0GQ18C+09DZkZExmyrMY4
 865/RJVZxMnd5GdTVPfdEktLv4vhedwspTxdn+vk1Y4Fzao0e5hEbaJmHMN9kuJp1Yvo
 9w/i9LbeUMLYpKksjcCMWgTKiwVPmEVS4iDvXig6mb4SFKiXaDwYpIX0QRm+z9M8w++s
 oFEZUQhDY+dUYpjFgy6K7kjDTpi1DOi33P6pzR8BZsF9BncHV96oYBiWlSIuc/3Xz5g1
 Sjry8TlWns1SQmUj7f7ZisTlnVAZ5bVE1/gZAGBTfmgkJl7h/SRjoHRBS0wggmhiAzlA
 2N9w==
X-Gm-Message-State: AOAM530IdvMIzRxL45713zA7Rd/iECW2aHWsqFhSz1ZXHVGd8lJ+em0s
 s9UgCWYShTurdq66bWWLVM0ttWmF9UzkEg==
X-Google-Smtp-Source: ABdhPJzsB/s5l4dhKrBmeIKLlNBrKUvw6CydMMAGmeMjeeEDEsO+/jmcu7RPRDDT4PxXd82Q8p9lww==
X-Received: by 2002:a17:902:c086:: with SMTP id
 j6mr22107858pld.293.1595349140814; 
 Tue, 21 Jul 2020 09:32:20 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id j13sm3219829pjf.28.2020.07.21.09.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:32:20 -0700 (PDT)
Date: Tue, 21 Jul 2020 22:00:56 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <20200721163056.GA396078@gmail.com>
References: <20200721123146.81710-1-vaibhavgupta40@gmail.com>
 <7100976b-cf7c-c304-e2a6-660876e310af@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7100976b-cf7c-c304-e2a6-660876e310af@amd.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, linux-crypto@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] crypto: ccp: sp-pci: use
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

On Tue, Jul 21, 2020 at 10:19:33AM -0500, Tom Lendacky wrote:
> On 7/21/20 7:31 AM, Vaibhav Gupta wrote:
> > Drivers using legacy power management .suspen()/.resume() callbacks
> > have to manage PCI states and device's PM states themselves. They also
> > need to take care of standard configuration registers.
> > 
> > Switch to generic power management framework using a single
> > "struct dev_pm_ops" variable to take the unnecessary load from the driver.
> > This also avoids the need for the driver to directly call most of the PCI
> > helper functions and device power state control functions as through
> > the generic framework, PCI Core takes care of the necessary operations,
> > and drivers are required to do only device-specific jobs.
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/crypto/ccp/ccp-dev.c     |  8 +++-----
> >  drivers/crypto/ccp/sp-dev.c      |  6 ++----
> >  drivers/crypto/ccp/sp-dev.h      |  6 +++---
> >  drivers/crypto/ccp/sp-pci.c      | 17 ++++++-----------
> >  drivers/crypto/ccp/sp-platform.c |  2 +-
> >  5 files changed, 15 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/crypto/ccp/ccp-dev.c b/drivers/crypto/ccp/ccp-dev.c
> > index 19ac509ed76e..8ae26d3cffff 100644
> > --- a/drivers/crypto/ccp/ccp-dev.c
> > +++ b/drivers/crypto/ccp/ccp-dev.c
> > @@ -531,8 +531,7 @@ int ccp_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
> >  	return len;
> >  }
> >  
> > -#ifdef CONFIG_PM
> > -bool ccp_queues_suspended(struct ccp_device *ccp)
> > +bool __maybe_unused ccp_queues_suspended(struct ccp_device *ccp)
> 
> These aren't static functions, so is the __maybe_unused necessary?
>
> (Same comment on the other non-static functions changed below)
> 
> >  {
> >  	unsigned int suspended = 0;
> >  	unsigned long flags;
> > @@ -549,7 +548,7 @@ bool ccp_queues_suspended(struct ccp_device *ccp)
> >  	return ccp->cmd_q_count == suspended;
> >  }
> >  
> > -int ccp_dev_suspend(struct sp_device *sp, pm_message_t state)
> > +int __maybe_unused ccp_dev_suspend(struct sp_device *sp)
> >  {
> >  	struct ccp_device *ccp = sp->ccp_data;
> >  	unsigned long flags;
> > @@ -577,7 +576,7 @@ int ccp_dev_suspend(struct sp_device *sp, pm_message_t state)
> >  	return 0;
> >  }
> >  
> > -int ccp_dev_resume(struct sp_device *sp)
> > +int __maybe_unused ccp_dev_resume(struct sp_device *sp)
> >  {
> >  	struct ccp_device *ccp = sp->ccp_data;
> >  	unsigned long flags;
> > @@ -601,7 +600,6 @@ int ccp_dev_resume(struct sp_device *sp)
> >  
> >  	return 0;
> >  }
> > -#endif
> >  
> >  int ccp_dev_init(struct sp_device *sp)
> >  {
> > diff --git a/drivers/crypto/ccp/sp-dev.c b/drivers/crypto/ccp/sp-dev.c
> > index ce42675d3274..6284a15e5047 100644
> > --- a/drivers/crypto/ccp/sp-dev.c
> > +++ b/drivers/crypto/ccp/sp-dev.c
> > @@ -211,13 +211,12 @@ void sp_destroy(struct sp_device *sp)
> >  	sp_del_device(sp);
> >  }
> >  
> > -#ifdef CONFIG_PM
> > -int sp_suspend(struct sp_device *sp, pm_message_t state)
> > +int sp_suspend(struct sp_device *sp)
> >  {
> >  	int ret;
> >  
> >  	if (sp->dev_vdata->ccp_vdata) {
> > -		ret = ccp_dev_suspend(sp, state);
> > +		ret = ccp_dev_suspend(sp);
> >  		if (ret)
> >  			return ret;
> >  	}
> > @@ -237,7 +236,6 @@ int sp_resume(struct sp_device *sp)
> >  
> >  	return 0;
> >  }
> > -#endif
> >  
> >  struct sp_device *sp_get_psp_master_device(void)
> >  {
> > diff --git a/drivers/crypto/ccp/sp-dev.h b/drivers/crypto/ccp/sp-dev.h
> > index f913f1494af9..0218d0670eee 100644
> > --- a/drivers/crypto/ccp/sp-dev.h
> > +++ b/drivers/crypto/ccp/sp-dev.h
> > @@ -119,7 +119,7 @@ int sp_init(struct sp_device *sp);
> >  void sp_destroy(struct sp_device *sp);
> >  struct sp_device *sp_get_master(void);
> >  
> > -int sp_suspend(struct sp_device *sp, pm_message_t state);
> > +int sp_suspend(struct sp_device *sp);
> >  int sp_resume(struct sp_device *sp);
> >  int sp_request_ccp_irq(struct sp_device *sp, irq_handler_t handler,
> >  		       const char *name, void *data);
> > @@ -134,7 +134,7 @@ struct sp_device *sp_get_psp_master_device(void);
> >  int ccp_dev_init(struct sp_device *sp);
> >  void ccp_dev_destroy(struct sp_device *sp);
> >  
> > -int ccp_dev_suspend(struct sp_device *sp, pm_message_t state);
> > +int ccp_dev_suspend(struct sp_device *sp);
> >  int ccp_dev_resume(struct sp_device *sp);
> >  
> >  #else	/* !CONFIG_CRYPTO_DEV_SP_CCP */
> > @@ -145,7 +145,7 @@ static inline int ccp_dev_init(struct sp_device *sp)
> >  }
> >  static inline void ccp_dev_destroy(struct sp_device *sp) { }
> >  
> > -static inline int ccp_dev_suspend(struct sp_device *sp, pm_message_t state)
> > +static inline int ccp_dev_suspend(struct sp_device *sp)
> >  {
> >  	return 0;
> >  }
> > diff --git a/drivers/crypto/ccp/sp-pci.c b/drivers/crypto/ccp/sp-pci.c
> > index cb6cb47053f4..f471dbaef1fb 100644
> > --- a/drivers/crypto/ccp/sp-pci.c
> > +++ b/drivers/crypto/ccp/sp-pci.c
> > @@ -252,23 +252,19 @@ static void sp_pci_remove(struct pci_dev *pdev)
> >  	sp_free_irqs(sp);
> >  }
> >  
> > -#ifdef CONFIG_PM
> > -static int sp_pci_suspend(struct pci_dev *pdev, pm_message_t state)
> > +static int __maybe_unused sp_pci_suspend(struct device *dev)
> >  {
> > -	struct device *dev = &pdev->dev;
> >  	struct sp_device *sp = dev_get_drvdata(dev);
> >  
> > -	return sp_suspend(sp, state);
> > +	return sp_suspend(sp);
> >  }
> >  
> > -static int sp_pci_resume(struct pci_dev *pdev)
> > +static int __maybe_unused sp_pci_resume(struct device *dev)
> >  {
> > -	struct device *dev = &pdev->dev;
> >  	struct sp_device *sp = dev_get_drvdata(dev);
> >  
> >  	return sp_resume(sp);
> >  }
> > -#endif
> >  
> >  #ifdef CONFIG_CRYPTO_DEV_SP_PSP
> >  static const struct sev_vdata sevv1 = {
> > @@ -365,15 +361,14 @@ static const struct pci_device_id sp_pci_table[] = {
> >  };
> >  MODULE_DEVICE_TABLE(pci, sp_pci_table);
> >  
> > +static SIMPLE_DEV_PM_OPS(sp_pci_pm_ops, sp_pci_suspend, sp_pci_resume);
> > +
> >  static struct pci_driver sp_pci_driver = {
> >  	.name = "ccp",
> >  	.id_table = sp_pci_table,
> >  	.probe = sp_pci_probe,
> >  	.remove = sp_pci_remove,
> > -#ifdef CONFIG_PM
> > -	.suspend = sp_pci_suspend,
> > -	.resume = sp_pci_resume,
> > -#endif
> > +	.driver.pm = &sp_pci_pm_ops,
> >  };
> >  
> >  int sp_pci_init(void)
> > diff --git a/drivers/crypto/ccp/sp-platform.c b/drivers/crypto/ccp/sp-platform.c
> > index 831aac1393a2..9dba52fbee99 100644
> > --- a/drivers/crypto/ccp/sp-platform.c
> > +++ b/drivers/crypto/ccp/sp-platform.c
> 
> This file use the same "#ifdef CONFIG_PM" to define the suspend and resume
> functions (see sp_platform_driver variable). Doesn't that need to be
> updated similar to sp-pci.c? Not sure how this compile tested successfully
> unless your kernel config didn't have CONFIG_PM defined?
I am not sure but my .config file has "CONFIG_PM=y"

The motive is update PM of sp-pci. Months ago, we decided to remove
"#ifdef CONFIG_PM" container and mark the callbacks as __maybe_unused.
Hence, I did similar changes to all files on which sp-pci is dependent.

This caused change in function defintion and declaration of sp_suspend().

sp-pci is not depended upon sp-platform. sp-platform was modified only because
it also invoked sp_suspend() which got modified.

Thus, I didn't made any other changes to sp-platofrm.

Thanks
Vaibhav Gupta
> 
> Thanks,
> Tom
> 
> > @@ -207,7 +207,7 @@ static int sp_platform_suspend(struct platform_device *pdev,
> >  	struct device *dev = &pdev->dev;
> >  	struct sp_device *sp = dev_get_drvdata(dev);
> >  
> > -	return sp_suspend(sp, state);
> > +	return sp_suspend(sp);
> >  }
> >  
> >  static int sp_platform_resume(struct platform_device *pdev)
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
