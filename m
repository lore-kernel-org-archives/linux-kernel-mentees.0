Return-Path: <SRS0=zeZA=CR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FB7C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 16:57:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA419207DE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 16:57:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ele0Rrax"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA419207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B2F986DB0;
	Tue,  8 Sep 2020 16:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F0rEouUEAdqS; Tue,  8 Sep 2020 16:57:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E192A86D94;
	Tue,  8 Sep 2020 16:57:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCC24C0052;
	Tue,  8 Sep 2020 16:57:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3354CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 16:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 22B3C872D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 16:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q5tU7yf51VKE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 16:57:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 925B4872C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 16:57:01 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id z19so9296026pfn.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kBD1EJXPjVAPBpvdc8wf1ILIVz5P8vX0mxtXEPwALzw=;
 b=Ele0Rrax+SxCArR7vCT+Ep4XzRpupXA++JWD3kHsYCsN5NDhZAVsIEGGQQ88ehNC5R
 46X0/j2chtpx+hmu9XItNJmS3if7iMfnXSYDV1uEJMrQHQDW22kF9ka/I3di4/dJSFYF
 4mtMnPvRlqjWvbhmtg21sQpyMB8u4w4i21teNB+X3EFAJhMHaLCu5aKE2z+IrKZzcuRB
 8LmD1TVvq7PW+2h4Y8+DchxExEX+odbLBhJV+TqhWyBPLlyj/IFZkOOwXg5f6T1hM9cn
 I1yEt6NQJu3QdvQoIL6YzFaipMpF4S26ypm5drRygYvWFfuiOGAdfr8wrkQXzy2hLNNH
 xKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kBD1EJXPjVAPBpvdc8wf1ILIVz5P8vX0mxtXEPwALzw=;
 b=um9itBGFUDD/6o41C/XUHc1wp5kqHlfbenDRFvwjcnswX+HjK2O6qKOZdfuRdjQvT1
 AHmwlCI0Be9ounPuV0ByRYLFqeKoAjKPRscKJW5axb959q1sT/jxULcQhMDliBwwLEKy
 myQTdFxviuwGn58QUCaqOMPA7OrMWcYMlHq9XQmbUJrX4TRtQOMxyw+izd1PDRvQIMh+
 F2l4Nys6hsKfeAi3r/gbCUGdNctxTppZULTlttoVcaNJ6zFhJsVF3L5CnbBBvEHgNhlN
 Ta3EUj3QJBy1bTAim0U5GCYuW5nyvJZw+dnIMPVh+avU2OHN7je7a5y24bfcGIcIT7w8
 b2PA==
X-Gm-Message-State: AOAM533COxGDtC+uTYpGzU217POBwzuahAjSx1tOFOF13SUq9wZb6IKg
 UvstML4zqts29dKfoQo+DDs=
X-Google-Smtp-Source: ABdhPJwZxemNY6Dve6ZxiSwz4vCGjA5iIlNIPUHL3l9AnM4JkFzTMbYq7IAQKVpAR9CjNuYYwMBgSQ==
X-Received: by 2002:a05:6a00:8c5:b029:13e:ce2c:88bd with SMTP id
 s5-20020a056a0008c5b029013ece2c88bdmr96593pfu.0.1599584221085; 
 Tue, 08 Sep 2020 09:57:01 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id h15sm4467pfo.23.2020.09.08.09.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 09:57:00 -0700 (PDT)
Date: Tue, 8 Sep 2020 22:24:58 +0530
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
Message-ID: <20200908165458.GA9948@gmail.com>
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
Please review the patch-series.

Thanks
Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
