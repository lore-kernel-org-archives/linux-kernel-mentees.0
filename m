Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CE0C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:30:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4FDA2087D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:30:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajS/f1/Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4FDA2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BABF286B26;
	Thu,  1 Oct 2020 12:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4gvm06luMNB; Thu,  1 Oct 2020 12:30:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4DEA4869E2;
	Thu,  1 Oct 2020 12:30:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D56BC0889;
	Thu,  1 Oct 2020 12:30:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22A2EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0FED086B26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iq8dr9G7hUvr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:30:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8BD68869E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:30:08 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t14so3910530pgl.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 05:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F8ILo9F3hOuAiWCSF9VP8lcH33lMFOWB0JB4FepGoHw=;
 b=ajS/f1/QOGhJu7Hm7zXDe4wRl0ElgGA5K3TaNcrUSzXQNopdfqtSgRJArv9LL+cWFT
 u/gHMiPQqyBmVdVk4Ex3axgmIAnCvlFMvD9NNGhd3w76DkYPmiyNz5igixD214sh3Pyq
 LE8EQO+cKU7qoCPicvO+n+CmdZvNP/KDLGEL836TuvkyUYtH78CViZf0mvXbG1BE4Y6x
 ZGWAE7G8Ibv/zQiE/ZhWJGBanNiTYb8e8l2sDuC37QH1mjzlalljv1BWR5lwYaA3Jujs
 FoIgPC2cvC7y/Bsuxjk38uODZSCbdpz1Qx+Ge5jH1/LEtfytYj+Zg7mfysPMKuWLaOHV
 Tm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F8ILo9F3hOuAiWCSF9VP8lcH33lMFOWB0JB4FepGoHw=;
 b=omoIZexCdel+H52fCv+WfbYlP0s8zlbZH8UNs1l7pafdPzfF6ddZ0jOoJYhKKVA4DW
 uODvTccHYi5aS43cj3mVfAX5FSZlHoifrLgD0UiyaoVWnSIRAvpyUo5rBi7zPR6SAWT0
 OwN3fFaz8j1C6D5gKbv9zO3ESbWOG1KYTtteft986b22cZCL3CF7s7wLcr21c7sKSNLz
 WrkIm+xfLCGyB/8u9stgyrlqMAEW13x4SgZ6ud/wwo2KD3EFFV5k8QzhKexGIpydsi3F
 wtZVrF7l3B35AOTNh+yOBQzjsV7mcfKMOHZCb+QBA0oW31b8r0WcWPXSStDik5Ec43c9
 RGDg==
X-Gm-Message-State: AOAM532+GNEXGML3nQ/1dlV5wb/gTuEIGeoC/1YV/d/I2wA+Sgy6Uw0R
 1UbCh2tbN4xrpqnJxyQiSrM=
X-Google-Smtp-Source: ABdhPJwWTj+c4zhPxJxBu5RLvuvcwrNnzC7eEEHwrr31ec/sCEh3mqzLFvRvjyV506wuR8QklVu2ZQ==
X-Received: by 2002:a65:5902:: with SMTP id f2mr5718129pgu.379.1601555408153; 
 Thu, 01 Oct 2020 05:30:08 -0700 (PDT)
Received: from varodek.localdomain ([171.61.143.130])
 by smtp.gmail.com with ESMTPSA id m13sm5695199pjl.45.2020.10.01.05.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 05:30:05 -0700 (PDT)
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
Date: Thu,  1 Oct 2020 17:54:56 +0530
Message-Id: <20201001122511.1075420-14-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
References: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v3 13/28] scsi: hisi_sas_v3_hw: use
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

Drivers should do only device-specific jobs. But in general, drivers using
legacy PCI PM framework for .suspend()/.resume() have to manage many PCI
PM-related tasks themselves which can be done by PCI Core itself. This
brings extra load on the driver and it directly calls PCI helper functions
to handle them.

Switch to the new generic framework by updating function signatures and
define a "struct dev_pm_ops" variable to bind PM callbacks. Also, remove
unnecessary calls to the PCI Helper functions along with the legacy
.suspend & .resume bindings.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c | 30 +++++++++-----------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
index 8f0f4084a054..98b1848aabe7 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
@@ -3374,13 +3374,13 @@ enum {
 	hip08,
 };
 
-static int hisi_sas_v3_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused hisi_sas_v3_suspend(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct sas_ha_struct *sha = pci_get_drvdata(pdev);
 	struct hisi_hba *hisi_hba = sha->lldd_ha;
 	struct device *dev = hisi_hba->dev;
 	struct Scsi_Host *shost = hisi_hba->shost;
-	pci_power_t device_state;
 	int rc;
 
 	if (!pdev->pm_cap) {
@@ -3406,12 +3406,7 @@ static int hisi_sas_v3_suspend(struct pci_dev *pdev, pm_message_t state)
 
 	hisi_sas_init_mem(hisi_hba);
 
-	device_state = pci_choose_state(pdev, state);
-	dev_warn(dev, "entering operating state [D%d]\n",
-			device_state);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, device_state);
+	dev_warn(dev, "entering suspend state\n");
 
 	hisi_sas_release_tasks(hisi_hba);
 
@@ -3419,8 +3414,9 @@ static int hisi_sas_v3_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-static int hisi_sas_v3_resume(struct pci_dev *pdev)
+static int __maybe_unused hisi_sas_v3_resume(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct sas_ha_struct *sha = pci_get_drvdata(pdev);
 	struct hisi_hba *hisi_hba = sha->lldd_ha;
 	struct Scsi_Host *shost = hisi_hba->shost;
@@ -3430,15 +3426,7 @@ static int hisi_sas_v3_resume(struct pci_dev *pdev)
 
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
 
@@ -3446,7 +3434,6 @@ static int hisi_sas_v3_resume(struct pci_dev *pdev)
 	rc = hw_init_v3_hw(hisi_hba);
 	if (rc) {
 		scsi_remove_host(shost);
-		pci_disable_device(pdev);
 		return rc;
 	}
 	hisi_hba->hw->phys_init(hisi_hba);
@@ -3456,6 +3443,10 @@ static int hisi_sas_v3_resume(struct pci_dev *pdev)
 	return 0;
 }
 
+static SIMPLE_DEV_PM_OPS(hisi_sas_v3_pm_ops,
+			 hisi_sas_v3_suspend,
+			 hisi_sas_v3_resume);
+
 static const struct pci_device_id sas_v3_pci_table[] = {
 	{ PCI_VDEVICE(HUAWEI, 0xa230), hip08 },
 	{}
@@ -3472,8 +3463,7 @@ static struct pci_driver sas_v3_pci_driver = {
 	.id_table	= sas_v3_pci_table,
 	.probe		= hisi_sas_v3_probe,
 	.remove		= hisi_sas_v3_remove,
-	.suspend	= hisi_sas_v3_suspend,
-	.resume		= hisi_sas_v3_resume,
+	.driver.pm	= &hisi_sas_v3_pm_ops,
 	.err_handler	= &hisi_sas_err_handler,
 };
 
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
