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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3102CC2D0E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:07:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFBDB207DE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 17:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3hF/139"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFBDB207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 841C886D63;
	Tue,  8 Sep 2020 17:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbJfOGaxhVNY; Tue,  8 Sep 2020 17:07:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F08DF86D58;
	Tue,  8 Sep 2020 17:07:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF4F8C0052;
	Tue,  8 Sep 2020 17:07:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 101D0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F358786CB8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Idst0kbdNg_J
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:07:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8F94686C9D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 17:07:18 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id n14so3539904pff.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IOdsYvuedMqs4VETpiys3IXPYNWGiW6l6USeWyBo5Tw=;
 b=E3hF/139sLDHkufkGEuXu0Q9tGnJAuMoinQNyL1/f1M5ITqMHmhy8VOQW9c2ijlO8J
 45LVWXWWXwmRzEu1Iza+SsIpBUD3A5fNtsjLwCbBkhZEUwZm8UCr+w8qucGys/PaARi3
 pHbYGFycwxvRzYFsAmKoyKgpJ5grAaeFAEKms4+JBCyRo3e6ZG40nKDU2bX+O1VRT5qJ
 XqyldHdQVAYlBLqR0zs3qe/bgBGcTxCY+qCbSIX6pzB8jRcJJUNy2YfYRNZUGUbPRzUy
 0U9duWrfBp97BcOKZBa/ht01rj3bCdryAIHmd06RvcfRdWgzeugwOLf8WsMnPq/MI3OQ
 nIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IOdsYvuedMqs4VETpiys3IXPYNWGiW6l6USeWyBo5Tw=;
 b=EN0xGGZ12CCAw6G9iKxSJARQV3Uxx05HmECYUnOnI6VJzUXpjV6kEPsjfvahvDaAuU
 ni3NudSxCUFMetfI1XhuJwsbie1N1wiBTRtsp09BgkZtaq+DFS5PD3MNPiIkAwDeput5
 orIyUe3LvF75FRbox3wijtD6WFvtVHq/IOo6/pBlBSGuQ/y80gEDRgXHD6NhZqWwcRGF
 DoRlNJ+Rtml5ZSpO2Ejhyn3NfpvNd5AL09PFyJPHFiLV0rxDS1OaaCujyQkmpXBQeKwz
 B5Lny8AHdIj9ANegKpkQ6MiaaBwXIHu7X39iHcafHllcFG8Wc/hLuhquQ38ge3kXv/zY
 c3CA==
X-Gm-Message-State: AOAM533QzH/d5C0LnSWRX5Yz/CGQq7ZSGHGVz4OUGWYM2OFp3B7Cer5o
 M6YC4U5ck9YRVWp7PDn7aAM=
X-Google-Smtp-Source: ABdhPJyBDsUF+MDMugjzk8GWbvb0LDjNE6l8t+6+RE+TZU51ofLulEyHHUkRKBe/RL/viJ9TXboP4Q==
X-Received: by 2002:a62:1648:: with SMTP id 69mr24979230pfw.127.1599584838112; 
 Tue, 08 Sep 2020 10:07:18 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id e27sm16517pfj.62.2020.09.08.10.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 10:07:17 -0700 (PDT)
Date: Tue, 8 Sep 2020 22:35:24 +0530
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
Message-ID: <20200908170524.GL9948@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-12-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720133427.454400-12-vaibhavgupta40@gmail.com>
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 11/15] scsi: hpsa: use generic
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

On Mon, Jul 20, 2020 at 07:04:24PM +0530, Vaibhav Gupta wrote:
> Drivers using legacy PM have to manage PCI states and device's PM states
> themselves. They also need to take care of configuration registers.
> 
> With improved and powerful support of generic PM, PCI Core takes care of
> above mentioned, device-independent, jobs.
> 
> Change function parameter in both .suspend() and .resume() to
> "struct device*" type. The function body remains unchanged as it was empty.
> Also, bind callbacks with "static const struct dev_pm_ops" variable.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/scsi/hpsa.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/scsi/hpsa.c b/drivers/scsi/hpsa.c
> index 81d0414e2117..70bdd6fe91ee 100644
> --- a/drivers/scsi/hpsa.c
> +++ b/drivers/scsi/hpsa.c
> @@ -9070,25 +9070,27 @@ static void hpsa_remove_one(struct pci_dev *pdev)
>  	hpda_free_ctlr_info(h);				/* init_one 1 */
>  }
>  
> -static int hpsa_suspend(__attribute__((unused)) struct pci_dev *pdev,
> -	__attribute__((unused)) pm_message_t state)
> +static int __maybe_unused hpsa_suspend(
> +	__attribute__((unused)) struct device *dev)
>  {
>  	return -ENOSYS;
>  }
>  
> -static int hpsa_resume(__attribute__((unused)) struct pci_dev *pdev)
> +static int __maybe_unused hpsa_resume
> +	(__attribute__((unused)) struct device *dev)
>  {
>  	return -ENOSYS;
>  }
>  
> +static SIMPLE_DEV_PM_OPS(hpsa_pm_ops, hpsa_suspend, hpsa_resume);
> +
>  static struct pci_driver hpsa_pci_driver = {
>  	.name = HPSA,
>  	.probe = hpsa_init_one,
>  	.remove = hpsa_remove_one,
>  	.id_table = hpsa_pci_device_id,	/* id_table */
>  	.shutdown = hpsa_shutdown,
> -	.suspend = hpsa_suspend,
> -	.resume = hpsa_resume,
> +	.driver.pm = &hpsa_pm_ops,
>  };
>  
>  /* Fill in bucket_map[], given nsgs (the max number of
> -- 
> 2.27.0
> 
.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
