Return-Path: <SRS0=4dzS=AL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC03C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Jun 2020 08:19:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 893B720759
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Jun 2020 08:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 893B720759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 578FA85F7E;
	Tue, 30 Jun 2020 08:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDrxnA0wq1Tq; Tue, 30 Jun 2020 08:19:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C5D86859C1;
	Tue, 30 Jun 2020 08:19:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B20F7C088F;
	Tue, 30 Jun 2020 08:19:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BECDC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Jun 2020 08:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 439E18669A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Jun 2020 08:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zd-11UvZ4vKu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Jun 2020 08:19:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 309F486354
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Jun 2020 08:19:45 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id lx13so933052ejb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Jun 2020 01:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hvNDb619PND9BSnOO/FTgYwwF+7N75fMEl+ZD4EKqsM=;
 b=L3SLlleDx/LoQZgxM5eUncknvbnjLQDEyAhg6KbGPxQcUq3N/UYU2NErxH580wbd4l
 NjubCo0pGMVwEj/kp+CWAy1IAuoeEiGJwbBjSYLPAggGnHqLoFfUvQ97NsOOd1Ju7pwo
 pckEP9/eSO+1Wog5iRXq6ANX+SFoKH+UfJlKW2lnYCrD7hrmEohuc/6+52hqAnsuJN9E
 k5iyj0DtDu1RQrkBHcBSUSKCRsUpuiGTdU6Nmdm0mucwGRiqKTGYwHb36KQeP23E1XN2
 tVTqJ1+GkFqu0IHl4IinE6g6U7a8l6lVhlwn3DLutKvXwt3QOTxzDm5EAYJaogfFTfx5
 jigA==
X-Gm-Message-State: AOAM531tlzABx0D17O5LFT6UzUuTznrLIF9pTUmlE+yIQC3woij/MZ6o
 9ue+Kk/YMH+aZuC+UQIGTjTahjQ5
X-Google-Smtp-Source: ABdhPJx1S2bMBQqMtx4WXGh/d/lkwjOBn+S/nzIRGYuA9KRMjCqnTzm3OP/1N3JVGlohhgDY6AJQBw==
X-Received: by 2002:a17:907:7283:: with SMTP id
 dt3mr17835137ejc.195.1593505183733; 
 Tue, 30 Jun 2020 01:19:43 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id w8sm1999763eds.41.2020.06.30.01.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 01:19:43 -0700 (PDT)
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>
References: <20200629081531.214734-1-vaibhavgupta40@gmail.com>
 <20200629081531.214734-5-vaibhavgupta40@gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <164d7366-27f5-c764-3122-5c4a0239e66f@kernel.org>
Date: Tue, 30 Jun 2020 10:19:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629081531.214734-5-vaibhavgupta40@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 4/5] misc/phantom.c: use
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

On 29. 06. 20, 10:15, Vaibhav Gupta wrote:
> With the support of generic PM callbacks, drivers no longer need to use
> legacy .suspend() and .resume() in which they had to maintain PCI states
> changes and device's power state themselves. All required operations are
> done by PCI core.
> 
> Driver needs to do only device-specific operations.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

From the driver's POV:
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> ---
>  drivers/misc/phantom.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/misc/phantom.c b/drivers/misc/phantom.c
> index 6a5ed0e25ff1..ce72e46a2e73 100644
> --- a/drivers/misc/phantom.c
> +++ b/drivers/misc/phantom.c
> @@ -457,31 +457,26 @@ static void phantom_remove(struct pci_dev *pdev)
>  	pci_disable_device(pdev);
>  }
>  
> -#ifdef CONFIG_PM
> -static int phantom_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused phantom_suspend(struct device *dev_d)
>  {
> -	struct phantom_device *dev = pci_get_drvdata(pdev);
> +	struct phantom_device *dev = dev_get_drvdata(dev_d);
>  
>  	iowrite32(0, dev->caddr + PHN_IRQCTL);
>  	ioread32(dev->caddr + PHN_IRQCTL); /* PCI posting */
>  
> -	synchronize_irq(pdev->irq);
> +	synchronize_irq(to_pci_dev(dev_d)->irq);
>  
>  	return 0;
>  }
>  
> -static int phantom_resume(struct pci_dev *pdev)
> +static int __maybe_unused phantom_resume(struct device *dev_d)
>  {
> -	struct phantom_device *dev = pci_get_drvdata(pdev);
> +	struct phantom_device *dev = dev_get_drvdata(dev_d);
>  
>  	iowrite32(0, dev->caddr + PHN_IRQCTL);
>  
>  	return 0;
>  }
> -#else
> -#define phantom_suspend	NULL
> -#define phantom_resume	NULL
> -#endif
>  
>  static struct pci_device_id phantom_pci_tbl[] = {
>  	{ .vendor = PCI_VENDOR_ID_PLX, .device = PCI_DEVICE_ID_PLX_9050,
> @@ -491,13 +486,14 @@ static struct pci_device_id phantom_pci_tbl[] = {
>  };
>  MODULE_DEVICE_TABLE(pci, phantom_pci_tbl);
>  
> +static SIMPLE_DEV_PM_OPS(phantom_pm_ops, phantom_suspend, phantom_resume);
> +
>  static struct pci_driver phantom_pci_driver = {
>  	.name = "phantom",
>  	.id_table = phantom_pci_tbl,
>  	.probe = phantom_probe,
>  	.remove = phantom_remove,
> -	.suspend = phantom_suspend,
> -	.resume = phantom_resume
> +	.driver.pm = &phantom_pm_ops,
>  };
>  
>  static CLASS_ATTR_STRING(version, 0444, PHANTOM_VERSION);
> 


-- 
js
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
