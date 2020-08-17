Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABDDC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 08:18:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C81E20738
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 08:18:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5XZg9ok"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C81E20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4DB79877DD;
	Mon, 17 Aug 2020 08:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4yaj+Jw9j7ss; Mon, 17 Aug 2020 08:18:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C6E42877DC;
	Mon, 17 Aug 2020 08:18:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0C0CC088B;
	Mon, 17 Aug 2020 08:18:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F29CCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 08:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E0BFE203E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 08:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbS6piwBDPHm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 08:18:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 45AD120381
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 08:18:14 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id g33so7758302pgb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 01:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z+N51puImyhHxFx5Dm61lcPlZbEFuwK8jmWOAVp7Ph8=;
 b=K5XZg9ok4JjG3ct1sm9nhp9P1f1FppDczGCfLdNzfKpPuz++jIfBtakngC7NDdg9SV
 /0qXDp3CtBQvq2UJOciQrZdnscHe5oVUcB/ha1H9vdV6SmbrYpib1Uy9kgwZui5i+g4Q
 juHlIW8G1oNmOQrVOrhK7p5P2kcNR8fFqF74H7+zMg6nxLIpWSP5NmJzdq9ViVlyUati
 g8LB7o2+URT0tBDZsX6uXK/CcMI2/5jO6+J/jcJhVWNG/2gt3E9GAQqsmV5dhV44u93q
 g7/gWNzluJrxNicWYmCeId492BEGRpw2TeTsktBLONgzIMYqjaBEKQynwuH9wkau0+X6
 epAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z+N51puImyhHxFx5Dm61lcPlZbEFuwK8jmWOAVp7Ph8=;
 b=rpvbQfTJbrDXFU/5zNKo0sj16LOQVGs8BGaQeSmxsGqKWqUrtkj820MIL2t1YW3b6w
 rhAzISagcTzEcS99dE8Ga4Ika7htMexIblHJeQ7VHr/aWFHrekG/R9/ufQ1SXzOC2Gzn
 09SEbDZkvfbPONAD95F2wrKE1o9E4lpjUomc09m/aBuoZLp55bWr9mxp1aaa3tMRgvBC
 zVQA/H0yd5D8+KVMytEJOZYFaBPRwt/t2AqRQQGqSHElmvZKe+naqhhhqHvVud07UN0N
 ViwM15AWNV/hwSArsCa44LfDHdZ6D2pSNtfwNBV3tco4TzRsOjYhPky8g+1h2JwRaa37
 phJQ==
X-Gm-Message-State: AOAM530DBmZf4CXre0ObAjNs7X8mm7wq4N0Y4BwwFz1C92OrWMgMNFBF
 s5P62IIwsnZk/PeH8VEPomw=
X-Google-Smtp-Source: ABdhPJwaKRxVVpxObpt2jqteoMYfRRZZpAZmMGLvpTaseq2out4O7d+yilUaXa9D5vSOLFl1pRsV3Q==
X-Received: by 2002:a63:6e01:: with SMTP id j1mr9130334pgc.147.1597652293814; 
 Mon, 17 Aug 2020 01:18:13 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id q6sm16833689pjc.47.2020.08.17.01.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:18:13 -0700 (PDT)
Date: Mon, 17 Aug 2020 13:46:32 +0530
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
Message-ID: <20200817081632.GI5869@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 00/15] scsi: use generic power
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

On Mon, Jul 20, 2020 at 07:04:13PM +0530, Vaibhav Gupta wrote:
> Linux Kernel Mentee: Remove Legacy Power Management.
> 
> The purpose of this patch series is to upgrade power management in scsi
> drivers. This has been done by upgrading .suspend() and .resume() callbacks.
> 
> The upgrade makes sure that the involvement of PCI Core does not change the
> order of operations executed in a driver. Thus, does not change its behavior.
> 
> In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
> helper functions like pci_request/release_regions(), pci_set_power_state(),
> pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
> their job.
> 
> The conversion requires the removal of those function calls, change the
> callbacks' definition accordingly and make use of dev_pm_ops structure.
> 
> v2: kbuild error in v1.
> 
> All patches are compile-tested only.
> 
> Test tools:
>     - Compiler: gcc (GCC) 10.1.0
>     - allmodconfig build: make -j$(nproc) W=1 all
> 
> Vaibhav Gupta (15):
>   scsi: megaraid_sas: use generic power management
>   scsi: aacraid: use generic power management
>   scsi: aic7xxx: use generic power management
>   scsi: aic79xx: use generic power management
>   scsi: arcmsr: use generic power management
>   scsi: esas2r: use generic power management
>   scsi: hisi_sas_v3_hw: use generic power management
>   scsi: mpt3sas_scsih: use generic power management
>   scsi: lpfc: use generic power management
>   scsi: pm_8001: use generic power management
>   scsi: hpsa: use generic power management
>   scsi: 3w-9xxx: use generic power management
>   scsi: 3w-sas: use generic power management
>   scsi: mvumi: use generic power management
>   scsi: pmcraid: use generic power management
> 
>  drivers/scsi/3w-9xxx.c                    |  30 ++-----
>  drivers/scsi/3w-sas.c                     |  31 ++-----
>  drivers/scsi/aacraid/linit.c              |  34 ++------
>  drivers/scsi/aic7xxx/aic79xx.h            |  12 +--
>  drivers/scsi/aic7xxx/aic79xx_core.c       |   8 +-
>  drivers/scsi/aic7xxx/aic79xx_osm_pci.c    |  43 +++-------
>  drivers/scsi/aic7xxx/aic79xx_pci.c        |   6 +-
>  drivers/scsi/aic7xxx/aic7xxx.h            |  10 +--
>  drivers/scsi/aic7xxx/aic7xxx_core.c       |   6 +-
>  drivers/scsi/aic7xxx/aic7xxx_osm_pci.c    |  46 +++-------
>  drivers/scsi/aic7xxx/aic7xxx_pci.c        |   4 +-
>  drivers/scsi/arcmsr/arcmsr_hba.c          |  35 +++-----
>  drivers/scsi/esas2r/esas2r.h              |   5 +-
>  drivers/scsi/esas2r/esas2r_init.c         |  48 +++--------
>  drivers/scsi/esas2r/esas2r_main.c         |   3 +-
>  drivers/scsi/hisi_sas/hisi_sas_v3_hw.c    |  32 +++----
>  drivers/scsi/hpsa.c                       |  12 +--
>  drivers/scsi/lpfc/lpfc_init.c             | 100 +++++++---------------
>  drivers/scsi/megaraid/megaraid_sas_base.c |  61 ++++---------
>  drivers/scsi/mpt3sas/mpt3sas_scsih.c      |  36 +++-----
>  drivers/scsi/mvumi.c                      |  49 +++--------
>  drivers/scsi/pm8001/pm8001_init.c         |  46 ++++------
>  drivers/scsi/pmcraid.c                    |  44 +++-------
>  23 files changed, 212 insertions(+), 489 deletions(-)
> 
> -- 
> 2.27.0
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
