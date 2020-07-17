Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAEFC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 06:36:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B73282071A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 06:36:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuhR7AEN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B73282071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8589320406;
	Fri, 17 Jul 2020 06:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MGNvKpH8IuMP; Fri, 17 Jul 2020 06:36:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E7B57203E4;
	Fri, 17 Jul 2020 06:36:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCA2CC07FF;
	Fri, 17 Jul 2020 06:36:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA6D1C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C07B286200
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SA9M7L0PxSWb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 46A9C861FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:36:18 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q17so4919488pfu.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 23:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fuLbBhPUhKAR3I+8q0SKnGOpN3cxYtGrBhqDxxyRUk8=;
 b=FuhR7AENpGuNAggdn7GFuVjmvAwOLgp5wsm5TjTGHb0s6g3tCkJJWQaAoTZt31h8OK
 pSIvNYxVWnQt0XVwCHUbFzU62AokgKo9SwJvjy/7ggnro6gp5PFuh1+MUCqzNCEdTa4T
 vbTofkSxIL2ohZoZSJj4UtWgw6cfM4GpJAqF/hObVtERDsZoFaiPfaeprsHFVNphMLgw
 xIFRy8PjR6vgHR8xoxhKemhD71CMLJew0yqX54JdlDas03e3JUEaLEJvkc6I0WKRtEwz
 /FEGpid2HHRavSZn3sUiG8qTmwA0rLdCRq+znNkqdXPYVWEMTdxYWUS1lgEhzVCY9XFO
 J4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fuLbBhPUhKAR3I+8q0SKnGOpN3cxYtGrBhqDxxyRUk8=;
 b=D/W0v674r4Ac7FOKTm/O6LAyHMBtTTiloEqQDBKjKPXu7oUVJPP1d7MDV8mCK7M6+Y
 7DDGOmUfdJ4oGqYOFAL4ytpObu7DVTzwwCdBeBs00HBJJVX653Chfquf8a+V1q3qN+5x
 MFYC9f6TQtDfwXTMm4/oZTEnKTop5OnUp/PV4+osRWNYFaccY+XxEvnUKAHjO3ZQ7VQk
 HIPgWcuFJez0oCFM3/s15qNQ9sI5AzVjLxVWX/G2v4k7+6pxiPUham84D9WRyIIMNuUz
 ezfTU5+HXmW9a1fMCNm0SiDAgALSgxseGXWErl3S9U9HAejrLiL8qP5YCgIfrCT7KXyC
 Vp0g==
X-Gm-Message-State: AOAM532uQxcvzxbGUD1zB9HX7aGYgTGKdWN7gITGK9KR6OVEQMtN3hqX
 ianoahtWjzZIqA+hI88xP8w=
X-Google-Smtp-Source: ABdhPJxmGs8PQMT/xY21Q4L1G8znzEuRE+0Deq1bt+KZPU72UfztLi9k6nCm5FwF046HkfepC1ye6Q==
X-Received: by 2002:a63:1f11:: with SMTP id f17mr7213867pgf.217.1594967777748; 
 Thu, 16 Jul 2020 23:36:17 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id y22sm1683392pjp.41.2020.07.16.23.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 23:36:17 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>, Adam Radford <aradford@gmail.com>,
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
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Fri, 17 Jul 2020 12:04:23 +0530
Message-Id: <20200717063438.175022-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v1 00/15] scsi: use generic power
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

Linux Kernel Mentee: Remove Legacy Power Management.

The purpose of this patch series is to upgrade power management in scsi
drivers. This has been done by upgrading .suspend() and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
helper functions like pci_request/release_regions(), pci_set_power_state(),
pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
their job.

The conversion requires the removal of those function calls, change the
callbacks' definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Vaibhav Gupta (15):
  scsi: megaraid_sas: use generic power management
  scsi: aacraid: use generic power management
  scsi: aic7xxx: use generic power management
  scsi: aic79xx: use generic power management
  scsi: arcmsr: use generic power management
  scsi: esas2r: use generic power management
  scsi: hisi_sas_v3_hw: use generic power management
  scsi: mpt3sas_scsih: use generic power management
  scsi: lpfc: use generic power management
  scsi: pm_8001: use generic power management
  scsi: hpsa: use generic power management
  scsi: 3w-9xxx: use generic power management
  scsi: 3w-sas: use generic power management
  scsi: mvumi: use generic power management
  scsi: pmcraid: use generic power management

 drivers/scsi/3w-9xxx.c                    |  30 ++-----
 drivers/scsi/3w-sas.c                     |  31 ++-----
 drivers/scsi/aacraid/linit.c              |  34 ++------
 drivers/scsi/aic7xxx/aic79xx.h            |  12 +--
 drivers/scsi/aic7xxx/aic79xx_core.c       |   8 +-
 drivers/scsi/aic7xxx/aic79xx_osm_pci.c    |  43 +++-------
 drivers/scsi/aic7xxx/aic79xx_pci.c        |   6 +-
 drivers/scsi/aic7xxx/aic7xxx.h            |  10 +--
 drivers/scsi/aic7xxx/aic7xxx_core.c       |   6 +-
 drivers/scsi/aic7xxx/aic7xxx_osm_pci.c    |  46 +++-------
 drivers/scsi/aic7xxx/aic7xxx_pci.c        |   4 +-
 drivers/scsi/arcmsr/arcmsr_hba.c          |  35 +++-----
 drivers/scsi/esas2r/esas2r.h              |   5 +-
 drivers/scsi/esas2r/esas2r_init.c         |  46 +++-------
 drivers/scsi/esas2r/esas2r_main.c         |   3 +-
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c    |  32 +++----
 drivers/scsi/hpsa.c                       |  12 +--
 drivers/scsi/lpfc/lpfc_init.c             | 100 +++++++---------------
 drivers/scsi/megaraid/megaraid_sas_base.c |  57 ++++--------
 drivers/scsi/mpt3sas/mpt3sas_scsih.c      |  36 +++-----
 drivers/scsi/mvumi.c                      |  49 +++--------
 drivers/scsi/pm8001/pm8001_init.c         |  43 ++++------
 drivers/scsi/pmcraid.c                    |  42 +++------
 23 files changed, 208 insertions(+), 482 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
