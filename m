Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB4DC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 07:44:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BAEE2177B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 07:44:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVPgV/X2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BAEE2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4EEAD87E5F;
	Mon, 17 Aug 2020 07:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Jdi2D5A91F8; Mon, 17 Aug 2020 07:44:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B5B7C872E9;
	Mon, 17 Aug 2020 07:44:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B209BC07FF;
	Mon, 17 Aug 2020 07:44:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA199C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9921A8813E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6eKEQFpA4qUZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:44:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2536D87CB5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:44:06 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y206so7804645pfb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 00:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dyqpdq5z1tV4VGcNVcGfrr6ZWrqS+ezelgjUrIGuMOY=;
 b=cVPgV/X2Wys5BSUaCqslmYpTyAJtSfcqQjAtJ25PxE1bfi6QFMip/+YUNsGYJVlT+0
 fXDpLXtueD0UY8a3VnYymeANd2d7ULnAldZ/eXoIt9hN/eQ5zHJzohxOoJATmYTOPZz0
 bMG7Js45uAPDKsG2z3UE/v7pBolErl8xOmBoWIQMrQV0CvHDSKISsjS6OYbXTV7w5A3i
 ZMMF0wU6IPdqazs+Cr4qE+i4IsIOGUDgzgHBmYOZAu2lVJVohKmQdNtRuQo0p4bNmgNI
 4qAaXddUlKfFUvKHnbH1vP1t58TcAqD8BOAGMTs0QphZN7Elrj43DFQs4ZO4bCE5ljwQ
 f6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dyqpdq5z1tV4VGcNVcGfrr6ZWrqS+ezelgjUrIGuMOY=;
 b=CxJJWCwUvQXTO61mAS6+M3SfZey/SqQhk1OBBf6IWIa2s4us2ZFyr+cXBMQbjhxVAg
 x47y/N/SpspQuQJcPUytNSeW9nrapqChLETwHlJ/VcCon4lP52Z02kIFNxx2uNgA5hy8
 /b7I7za2kAOxn73mqN9sV8640MIk7os8wrUovyPzNr1+BNSCjy78kTACWa2Y/X9Y+9nz
 RoNlEqxbtN5bdWtTWm2rG5A3CjprEndl+VytCiyWV5o3vBddcf3lMcInLEP/IwCy689p
 /6g0GIyGOx9F4Pu0QtsdAKyOywnhLVnd66nxCbpem95qe2Nm+krS5dNzptemG/bu8wiL
 D79g==
X-Gm-Message-State: AOAM532AYPwi+MNsYpn71xO8ukNfcX5Oph+de7b0pfsDYbIdH3f3pZgl
 oCl3JYAQiquYVfLinRloq1E=
X-Google-Smtp-Source: ABdhPJzbfbQ/uiCg2uwPwKHRn+2dYffKumh3NKqwFNqCskJdyyJPr79StlzHRuaoRMXJeVgxADokSA==
X-Received: by 2002:a63:541e:: with SMTP id i30mr9448058pgb.416.1597650245662; 
 Mon, 17 Aug 2020 00:44:05 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id y135sm18998916pfg.148.2020.08.17.00.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 00:44:05 -0700 (PDT)
Date: Mon, 17 Aug 2020 13:12:29 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>
Message-ID: <20200817074229.GB5869@gmail.com>
References: <20200622120229.89610-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622120229.89610-1-vaibhavgupta40@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] [media] saa7134: use generic
	power management
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

On Mon, Jun 22, 2020 at 05:32:30PM +0530, Vaibhav Gupta wrote:
> With the support of generic PM callbacks, drivers no longer need to use
> legacy .suspend() and .resume() in which they had to maintain PCI states
> changes and device's power state themselves. The required operations are
> done by PCI core.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/media/pci/saa7134/saa7134-core.c | 25 ++++++++----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
> index e4623ed2f831..eb01109d4f98 100644
> --- a/drivers/media/pci/saa7134/saa7134-core.c
> +++ b/drivers/media/pci/saa7134/saa7134-core.c
> @@ -1370,10 +1370,8 @@ static void saa7134_finidev(struct pci_dev *pci_dev)
>  	kfree(dev);
>  }
>  
> -#ifdef CONFIG_PM
> -
>  /* resends a current buffer in queue after resume */
> -static int saa7134_buffer_requeue(struct saa7134_dev *dev,
> +static int __maybe_unused saa7134_buffer_requeue(struct saa7134_dev *dev,
>  				  struct saa7134_dmaqueue *q)
>  {
>  	struct saa7134_buf *buf, *next;
> @@ -1397,8 +1395,9 @@ static int saa7134_buffer_requeue(struct saa7134_dev *dev,
>  	return 0;
>  }
>  
> -static int saa7134_suspend(struct pci_dev *pci_dev , pm_message_t state)
> +static int __maybe_unused saa7134_suspend(struct device *dev_d)
>  {
> +	struct pci_dev *pci_dev = to_pci_dev(dev_d);
>  	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
>  	struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
>  
> @@ -1428,21 +1427,15 @@ static int saa7134_suspend(struct pci_dev *pci_dev , pm_message_t state)
>  	if (dev->remote && dev->remote->dev->users)
>  		saa7134_ir_close(dev->remote->dev);
>  
> -	pci_save_state(pci_dev);
> -	pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
> -
>  	return 0;
>  }
>  
> -static int saa7134_resume(struct pci_dev *pci_dev)
> +static int __maybe_unused saa7134_resume(struct device *dev_d)
>  {
> -	struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
> +	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
>  	struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
>  	unsigned long flags;
>  
> -	pci_set_power_state(pci_dev, PCI_D0);
> -	pci_restore_state(pci_dev);
> -
>  	/* Do things that are done in saa7134_initdev ,
>  		except of initializing memory structures.*/
>  
> @@ -1490,7 +1483,6 @@ static int saa7134_resume(struct pci_dev *pci_dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  /* ----------------------------------------------------------- */
>  
> @@ -1522,15 +1514,14 @@ EXPORT_SYMBOL(saa7134_ts_unregister);
>  
>  /* ----------------------------------------------------------- */
>  
> +static SIMPLE_DEV_PM_OPS(saa7134_pm_ops, saa7134_suspend, saa7134_resume);
> +
>  static struct pci_driver saa7134_pci_driver = {
>  	.name     = "saa7134",
>  	.id_table = saa7134_pci_tbl,
>  	.probe    = saa7134_initdev,
>  	.remove   = saa7134_finidev,
> -#ifdef CONFIG_PM
> -	.suspend  = saa7134_suspend,
> -	.resume   = saa7134_resume
> -#endif
> +	.driver.pm = &saa7134_pm_ops,
>  };
>  
>  static int __init saa7134_init(void)
> -- 
> 2.27.0
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
