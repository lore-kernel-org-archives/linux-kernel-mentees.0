Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B55C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 13:00:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FED120B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 13:00:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="Zx0TX2ub"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FED120B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EACCF2049B;
	Thu,  1 Oct 2020 13:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rjTePvpBRRj; Thu,  1 Oct 2020 13:00:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 93B3E204A9;
	Thu,  1 Oct 2020 13:00:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88C52C0889;
	Thu,  1 Oct 2020 13:00:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE470C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A9DBE86A3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rwo0llVPR+vN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:00:09 +0000 (UTC)
X-Greylist: delayed 00:06:13 by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AB331869B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:00:09 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id u21so7955784eja.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=06zHlwXUngyRXgBFfhpGG+CXA5ZNckw9XHHn+j/oAwY=;
 b=Zx0TX2ubgW0Ri33jwwHz69y55RfQINo/RuZyr9Hk+HdKZb0iVhlr8tk98VCxjNy0+Q
 tGMBzczN1vRhX0GveBC6m3gw0DZDnPR0oRfF7IKiY5zolv1BZzW9NVtNp54YliUUB63W
 /kEowAEbvMsVIZlvF1o13OYjfTQkNWCWd2hcxKSzDO0X/vKIDaN9ZB2gvBx7MyQ7uDdd
 OuM0YHROAg2o7vc0wM6w5N1+ZMOdXSbkm+JeE6lbn9CPN4FVW8XAsv6IoIgwRneBc7K4
 elmlOllXsDmnt77Gee5TgFFkKTU9oy8UvXodbOVB/zzWw+Xm543jNb2vEkavsYrbq4LT
 OF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06zHlwXUngyRXgBFfhpGG+CXA5ZNckw9XHHn+j/oAwY=;
 b=YUR4XBsRaQx/FX2Y3kAI2zW+99OxXMCxPnY68r8ypkbsJMAnWNpWG8d79uz5tmC4Lg
 NmtwVQN4p/WUSSvi3iG2OJWk4z73CQ9MD82qqm561/zvJnHZPNenqiL0a0FwTuiWR0CJ
 G1aXhAPtBA4SIWc2t61cpfOMWCfOY4QhrjNBVrQupMTHSoc98uPTLfW6VpNAOXasgakz
 BvNX9aHIBBF+R7GccEz76LGdXF2K10vIkCEROgcv7XaPtL79/TIDOTMdyYJUyThR4inh
 TwalKsynXTU4embAsU7VXHeDCD/1lN+i9G6ivYLs2BlYCLVgJbiTE0quAMAubh6O3DPG
 bL+g==
X-Gm-Message-State: AOAM533wCy7ogLrMODcRN34mlp9ZFJwYMO6uW1W9SzaFYv8pEmDJCC7I
 W4Zd+WNwb1D7wQjySWXqHdrPhylIryDQvDdnbEU2Pw==
X-Google-Smtp-Source: ABdhPJy2jnDB4nsMZeAxrM672OuFou/ETnP5WUNusUY+Dpfx4FikpknL0KnWapBriVEdeq0glYyNiCavk6KtiEFRwlM=
X-Received: by 2002:a17:906:3397:: with SMTP id
 v23mr3190662eja.212.1601556834567; 
 Thu, 01 Oct 2020 05:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
 <20201001122511.1075420-18-vaibhavgupta40@gmail.com>
In-Reply-To: <20201001122511.1075420-18-vaibhavgupta40@gmail.com>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Thu, 1 Oct 2020 14:53:43 +0200
Message-ID: <CAMGffEkF9ATZJ77FKTfP1g=iBLeVObco7nyQwLTjGu2pDehz-A@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Don Brace <don.brace@microsemi.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Hannes Reinecke <hare@suse.com>, Bradley Grove <linuxdrivers@attotech.com>,
 Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>,
 Sathya Prakash <sathya.prakash@broadcom.com>, esc.storagedev@microsemi.com,
 James Smart <james.smart@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>, Bjorn Helgaas <helgaas@kernel.org>,
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
Subject: Re: [Linux-kernel-mentees] [PATCH v3 17/28] scsi: pm_8001: Drop PCI
	Wakeup calls from .resume
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

On Thu, Oct 1, 2020 at 2:30 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> The driver calls pci_enable_wake(...., false) in pm8001_pci_resume(), and
> there is no corresponding pci_enable_wake(...., true) in
> pm8001_pci_suspend(). Either it should do enable-wake the device in
> .suspend() or should not invoke pci_enable_wake() at all.
>
> Concluding that this driver doesn't support enable-wake and PCI core calls
> pci_enable_wake(pci_dev, PCI_D0, false) during resume, drop it from
> pm8001_pci__resume().
>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Looks good to me!
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>

Thanks!
> ---
>  drivers/scsi/pm8001/pm8001_init.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/scsi/pm8001/pm8001_init.c b/drivers/scsi/pm8001/pm8001_init.c
> index 9e99262a2b9d..ee27ecb17560 100644
> --- a/drivers/scsi/pm8001/pm8001_init.c
> +++ b/drivers/scsi/pm8001/pm8001_init.c
> @@ -1248,7 +1248,6 @@ static int pm8001_pci_resume(struct pci_dev *pdev)
>                 "operating state [D%d]\n", pdev, pm8001_ha->name, device_state);
>
>         pci_set_power_state(pdev, PCI_D0);
> -       pci_enable_wake(pdev, PCI_D0, 0);
>         pci_restore_state(pdev);
>         rc = pci_enable_device(pdev);
>         if (rc) {
> --
> 2.28.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
