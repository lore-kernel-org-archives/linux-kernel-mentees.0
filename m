Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F98CC55178
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:53:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 439CC206F9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4lK7B2j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 439CC206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2EFA58715E;
	Mon,  2 Nov 2020 16:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n3HNnZ0spTby; Mon,  2 Nov 2020 16:52:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B6B0C87199;
	Mon,  2 Nov 2020 16:52:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A61D7C088B;
	Mon,  2 Nov 2020 16:52:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B491FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A2BFB869F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFXN3m5FHtUf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2EECE86957
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:58 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z24so11299096pgk.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 08:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MBzsuEUa6bYvsV+CNnIl+xHeK3YoENUVJTW96RlBScM=;
 b=i4lK7B2jCeWUWs/7k7aRJe2mVzCOREf/YaZphfdcnGM0u+NoaCHXT1UMtxiid1cPRk
 z+BPB3zIpcTUGy7gNJ+vQ+mf6T/j71u4xbBtkOpJFr0pkC7C9qKw3p0Q/5/01HSApBta
 Ou3O6JCnnfnkLTA7bAPGiA4KrhBxm/8fKADenbdF1J4iCL0+VyOS918WGeSy6jnLmizw
 gqP9jIo7nYYWjov+spMoRffy2As9Y9GUzTL5aQWpXYLgfZia0BjMUJBE8J1Or8gBFVVo
 F016wRV7uUCivQ4adKG5hAUXH+lhQwfZSg1Wfk102HFPrtIRVcxXRArRP+VFGN2ZB9nO
 alSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MBzsuEUa6bYvsV+CNnIl+xHeK3YoENUVJTW96RlBScM=;
 b=eXcONi76Xxe35Yw91WLANbkUbcGifUHoVb6fblc+1IpnPG8Bk4iko5po6lYasklN2X
 ohqm1CGi9wKkzcS/WVvjabEevYyrgI8Vn6pkJn4WKSlfuR9UGGakM302UF70+bGDcA6a
 45AouptHFIomCjOnBqj7ywC4kDDQyTaW4XcDzOwELhuaM6VU2wtC9lKxTBR8GSxWAP8B
 9MWAf7WcoeZF9cZqvickfC0KaTwSLZKEvYWLWebJkFS7iLxPf1AZCdiK/8QpPqgRgTUn
 9XZ5SkCQVKovyhOMYkjAhhsO13jGBs7jrYIrKWLIOys6ix+rmq4V3hNkeQmNyc7eAwcH
 nyRQ==
X-Gm-Message-State: AOAM530ltX1nuf7x3nXiV8NZh54MUlC/x15lnK9sTUPjf1pSilbXCF7d
 SE0mrPxGh5FS41NICapCzzU=
X-Google-Smtp-Source: ABdhPJxiIXDXayIA4x2vypTJ5B2naXIVlq1IYCXlgXG2jWp3RJ2Zwiiq5D86qMZ/Pko1ZcPv4K6N1w==
X-Received: by 2002:a17:90a:3e4a:: with SMTP id
 t10mr18207881pjm.151.1604335977846; 
 Mon, 02 Nov 2020 08:52:57 -0800 (PST)
Received: from varodek.localdomain ([223.179.149.110])
 by smtp.gmail.com with ESMTPSA id t74sm4953233pfc.47.2020.11.02.08.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 08:52:57 -0800 (PST)
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
 Xiang Chen <chenxiang66@hisilicon.com>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 Balsundar P <balsundar.p@microchip.com>
Date: Mon,  2 Nov 2020 22:17:14 +0530
Message-Id: <20201102164730.324035-14-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
References: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v4 13/29] scsi: hisi_sas_v3_hw: Don't
	use PCI helper functions
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

Drivers using new-framework/generic-framework should not handle standard
power management operations. These operations were performed by legacy
framework through PCI helper functions like pci_save/restore_state(),
pci_set_power_state(), etc.

Drivers should not use them now.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
index f19f3db1ac6d..dfeb86c865d3 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
@@ -3440,7 +3440,6 @@ static int _suspend_v3_hw(struct device *device)
 	struct hisi_hba *hisi_hba = sha->lldd_ha;
 	struct device *dev = hisi_hba->dev;
 	struct Scsi_Host *shost = hisi_hba->shost;
-	pci_power_t device_state;
 	int rc;
 
 	if (!pdev->pm_cap) {
@@ -3466,12 +3465,7 @@ static int _suspend_v3_hw(struct device *device)
 
 	hisi_sas_init_mem(hisi_hba);
 
-	device_state = pci_choose_state(pdev, PMSG_SUSPEND);
-	dev_warn(dev, "entering operating state [D%d]\n",
-			device_state);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, device_state);
+	dev_warn(dev, "entering suspend state\n");
 
 	hisi_sas_release_tasks(hisi_hba);
 
@@ -3491,15 +3485,7 @@ static int _resume_v3_hw(struct device *device)
 
 	dev_warn(dev, "resuming from operating state [D%d]\n",
 		 device_state);
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	rc = pci_enable_device(pdev);
-	if (rc) {
-		dev_err(dev, "enable device failed during resume (%d)\n", rc);
-		return rc;
-	}
 
-	pci_set_master(pdev);
 	scsi_unblock_requests(shost);
 	clear_bit(HISI_SAS_REJECT_CMD_BIT, &hisi_hba->flags);
 
@@ -3507,7 +3493,6 @@ static int _resume_v3_hw(struct device *device)
 	rc = hw_init_v3_hw(hisi_hba);
 	if (rc) {
 		scsi_remove_host(shost);
-		pci_disable_device(pdev);
 		return rc;
 	}
 	hisi_hba->hw->phys_init(hisi_hba);
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
