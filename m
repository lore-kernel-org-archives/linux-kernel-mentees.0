Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26510C4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:27:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7C1520B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:27:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XT3oXB+K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7C1520B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 80CA386A32;
	Thu,  1 Oct 2020 12:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YgllqPkgCCjR; Thu,  1 Oct 2020 12:27:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C30158691C;
	Thu,  1 Oct 2020 12:27:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4B86C0889;
	Thu,  1 Oct 2020 12:27:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E6A3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 742B587337
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XjS4RqkX4KN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:27:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E10748728A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:27:38 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x16so3934814pgj.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 05:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KnvOWxZ63jDVIsDgpt2eg9PovmEULDReeqd1RWk++3Y=;
 b=XT3oXB+KwHrk8NDmUsYAVQar7wtEudnXYvLpo0HLetQqt9/WXcp7tKJhmADJ6pMAyX
 yffVbmBwwOArZ3D2Rf9e5zJUJ+c3EAlVFv2nr1u9LEpoyD9aNnf5yU8lUWpTOlo0i5M5
 lUnwxH0kKfSLMEvU7nXLVMAHd3hYQyCXoj0TUO1NRhgq1qmYfyOv10jGoobekJ5Ta+B7
 1+X/Tl4qyvXOZZ5WxsJkRAnDTpI0QFSrVHD7OtmahZktaHR9+2mZiA9EvYN0BNmqPUYR
 MUJww83bgQQfK6unK2FpmEsfCZ2fam+OdqmIecVxEB8r629Nf7IdmYg1FqipQPT3+KCD
 egFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KnvOWxZ63jDVIsDgpt2eg9PovmEULDReeqd1RWk++3Y=;
 b=QlTg1PcwQg0R0B3aN7zVATNS+FhOapAGt2rVm+svUJNjyVV5mkIT6fcdZBzdR0bN0C
 fU+sX0Xjpb6cwQwktcQxcwOcAEhB3a4hujxiNaum4VVTV073iB9vYQBjb2VRGLh1lg91
 ePD4QtIZHFUq0lexdIbwL5RlV/GRSkKowDyEh1XSer8vm/8PsIu/v/gzHAf5C3dCDniW
 HeUuDThOq6UyEHQHvXqSBZJHt8wogEdicoX7P+maCjIrFqIks8b2O9nIumDsTTCL6I00
 oEPcGDi2nHdZ/9rI4AnxjTt+OoMuGFcWEYbtersRkNDUC2m8YUAg/4jJdhINAFXe1OHy
 2A7A==
X-Gm-Message-State: AOAM532Pa8RSy6fk9679vBYgwKXnvl4SUHtyW5t/XV8agbGpKsZBp3Zg
 0zkoPXJoFSfm1kGcZ6lky1g=
X-Google-Smtp-Source: ABdhPJxZxHrN4qdXBPbki0Mn6IkgDW70IP12ApWg4XPJw4fN3UQsJvHGnpRePmsGG3LIJ8wW5pLtFQ==
X-Received: by 2002:a17:902:b70c:b029:d1:9b2d:1132 with SMTP id
 d12-20020a170902b70cb02900d19b2d1132mr7043930pls.36.1601555258339; 
 Thu, 01 Oct 2020 05:27:38 -0700 (PDT)
Received: from varodek.localdomain ([171.61.143.130])
 by smtp.gmail.com with ESMTPSA id m13sm5695199pjl.45.2020.10.01.05.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 05:27:37 -0700 (PDT)
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
Date: Thu,  1 Oct 2020 17:54:43 +0530
Message-Id: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v3 00/28] scsi: use generic power
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

The purpose of this patch series is to upgrade power management in xxxxxxxx
drivers. This has been done by upgrading .suspend() and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
their job.

The conversion requires the removal of those function calls, change the
callbacks' definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

v3: break down the patches to drop PCI wakeup calls.

Test tools:
    - Compiler: gcc (GCC) 10.2.0
    - allmodconfig build: make -j$(nproc) W=1 all

Vaibhav Gupta (28):
  scsi: megaraid_sas: Drop PCI wakeup calls from .resume
  scsi: megaraid_sas: use generic power management
  scsi: megaraid_sas: update function description
  scsi: aacraid: Drop pci_enable_wake() from .resume
  scsi: aacraid: use generic power management
  scsi: aic7xxx: use generic power management
  scsi: aic79xx: use generic power management
  scsi: arcmsr: Drop PCI wakeup calls from .resume
  scsi: arcmsr: use generic power management
  scsi: esas2r: Drop PCI Wakeup calls from .resume
  scsi: esas2r: use generic power management
  scsi: hisi_sas_v3_hw: Drop PCI Wakeup calls from .resume
  scsi: hisi_sas_v3_hw: use generic power management
  scsi: mpt3sas_scsih: Drop PCI Wakeup calls from .resume
  scsi: mpt3sas_scsih: use generic power management
  scsi: lpfc: use generic power management
  scsi: pm_8001:  Drop PCI Wakeup calls from .resume
  scsi: pm_8001: use generic power management
  scsi: hpsa: use generic power management
  scsi: 3w-9xxx: Drop PCI Wakeup calls from .resume
  scsi: 3w-9xxx: use generic power management
  scsi: 3w-sas: Drop PCI Wakeup calls from .resume
  scsi: 3w-sas: use generic power management
  scsi: mvumi: Drop PCI Wakeup calls from .resume
  scsi: mvumi: use generic power management
  scsi: mvumi: update function description
  scsi: pmcraid: Drop PCI Wakeup calls from .resume
  scsi: pmcraid: use generic power management

 drivers/scsi/3w-9xxx.c                    |  30 ++-----
 drivers/scsi/3w-sas.c                     |  32 ++-----
 drivers/scsi/aacraid/linit.c              |  34 ++------
 drivers/scsi/aic7xxx/aic79xx.h            |  12 +--
 drivers/scsi/aic7xxx/aic79xx_core.c       |   8 +-
 drivers/scsi/aic7xxx/aic79xx_osm_pci.c    |  43 +++-------
 drivers/scsi/aic7xxx/aic79xx_pci.c        |   6 +-
 drivers/scsi/aic7xxx/aic7xxx.h            |  10 +--
 drivers/scsi/aic7xxx/aic7xxx_core.c       |   6 +-
 drivers/scsi/aic7xxx/aic7xxx_osm_pci.c    |  46 +++-------
 drivers/scsi/aic7xxx/aic7xxx_pci.c        |   4 +-
 drivers/scsi/arcmsr/arcmsr_hba.c          |  33 +++----
 drivers/scsi/esas2r/esas2r.h              |   5 +-
 drivers/scsi/esas2r/esas2r_init.c         |  48 +++--------
 drivers/scsi/esas2r/esas2r_main.c         |   3 +-
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c    |  31 +++----
 drivers/scsi/hpsa.c                       |  12 +--
 drivers/scsi/lpfc/lpfc_init.c             | 100 +++++++---------------
 drivers/scsi/megaraid/megaraid_sas_base.c |  54 +++---------
 drivers/scsi/mpt3sas/mpt3sas_scsih.c      |  35 +++-----
 drivers/scsi/mvumi.c                      |  49 +++--------
 drivers/scsi/pm8001/pm8001_init.c         |  46 ++++------
 drivers/scsi/pmcraid.c                    |  44 +++-------
 23 files changed, 198 insertions(+), 493 deletions(-)

-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
