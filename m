Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C56C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:38:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA62222BF3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:38:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9AlCn0H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA62222BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 941872048A;
	Mon, 20 Jul 2020 13:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ieD1oUqme10f; Mon, 20 Jul 2020 13:38:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C33482048B;
	Mon, 20 Jul 2020 13:38:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1F21C089F;
	Mon, 20 Jul 2020 13:38:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8E4BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A434688098
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HnvRnSaFmjTR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:38:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2720A87FE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:38:16 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id x9so8705993plr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QNdYsbl4+XM5p8ZSbWCDqtJXkln/I2GRSNrzcSaa0oc=;
 b=G9AlCn0H7+u10I/5gNDZdsT8POYgfIJQKGWI60sQqcb1spWtBbNkADDzdlZO0pZOOP
 y9dun8KdhtXA3J1aqwb658O0LHY/OMg/FAk72Lzm2BDWfvvovlW+XZBrOIlvB4wbrSuS
 PzurYiMXs99PmDCmCO3ZaWmIC39k5gjhdciF3SakWTGeVlDY4x8QXW9s/T8b9+dtkTK2
 UL2rx00qszjcGyVyEOMcWxubjwjPxLkW+6HajCVV0Bm1yfr3l70IEnk250pSXE9zvVFp
 5fQw6fv5MqPiDEYYQt5XWaaai3SCSLZBBBC6LFuI9wDdoOckgwLGgAv9YN6pN8CMkGML
 DFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QNdYsbl4+XM5p8ZSbWCDqtJXkln/I2GRSNrzcSaa0oc=;
 b=bWqtmJ56KUcOHhUFhrzRDkWWsnR7sY4inPiH6J7W7xkp4GDoVesyGbRLOtT0SsZtMl
 je8CcpJ1L33Yb7Hm7iP4OamIsvdB4cStSUpzBwAkEQUnhQoy41gQZCes56eCHfUUsZgt
 WF/YAqETJ3s6G/rGp+O3gnMo1Dd7VbWuI6/3lWiAT4ZFMjMtYn7QtUxowWAztiKHsS8W
 tJI5ihXveA6wOEW//EvJtk8ErL7PEq665aJ2JKyu1imb4WVYqJ0wlhKhja8MOKgz99la
 1u8W4DGDuspjXAViT88vVhIw2brjhSSfC6336fNLSY5DOjYxWwcrz0WO50A0uSeo9icm
 vkSA==
X-Gm-Message-State: AOAM530nDwo6MfSz8vWErkOBo7aGUoiyVutPaZ1WHV5bHkLg01A8t2lL
 3bFClBDTNaycW7bAYo85qos=
X-Google-Smtp-Source: ABdhPJxeCH3Fog0YsSNIR68PoQfqjKwTZEa5DPf55cd2QdCewTGo0wsU+AttluAniU/1nEN7nB4iSQ==
X-Received: by 2002:a17:90a:6702:: with SMTP id
 n2mr24664230pjj.82.1595252295713; 
 Mon, 20 Jul 2020 06:38:15 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id s6sm17042183pfd.20.2020.07.20.06.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 06:38:15 -0700 (PDT)
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
Date: Mon, 20 Jul 2020 19:04:23 +0530
Message-Id: <20200720133427.454400-11-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v2 10/15] scsi: pm_8001: use generic
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

The driver was calling pci_save/restore_state(), pci_choose_state(),
pci_enable/disable_device() and pci_set_power_state() which is no more
needed.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/pm8001/pm8001_init.c | 46 ++++++++++++-------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/scsi/pm8001/pm8001_init.c b/drivers/scsi/pm8001/pm8001_init.c
index 9e99262a2b9d..d7d664b87720 100644
--- a/drivers/scsi/pm8001/pm8001_init.c
+++ b/drivers/scsi/pm8001/pm8001_init.c
@@ -1178,23 +1178,21 @@ static void pm8001_pci_remove(struct pci_dev *pdev)
 
 /**
  * pm8001_pci_suspend - power management suspend main entry point
- * @pdev: PCI device struct
- * @state: PM state change to (usually PCI_D3)
+ * @dev: Device struct
  *
  * Returns 0 success, anything else error.
  */
-static int pm8001_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused pm8001_pci_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct sas_ha_struct *sha = pci_get_drvdata(pdev);
-	struct pm8001_hba_info *pm8001_ha;
+	struct pm8001_hba_info *pm8001_ha = sha->lldd_ha;
 	int  i, j;
-	u32 device_state;
-	pm8001_ha = sha->lldd_ha;
 	sas_suspend_ha(sha);
 	flush_workqueue(pm8001_wq);
 	scsi_block_requests(pm8001_ha->shost);
 	if (!pdev->pm_cap) {
-		dev_err(&pdev->dev, " PCI PM not supported\n");
+		dev_err(dev, " PCI PM not supported\n");
 		return -ENODEV;
 	}
 	PM8001_CHIP_DISP->interrupt_disable(pm8001_ha, 0xFF);
@@ -1217,24 +1215,21 @@ static int pm8001_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 		for (j = 0; j < PM8001_MAX_MSIX_VEC; j++)
 			tasklet_kill(&pm8001_ha->tasklet[j]);
 #endif
-	device_state = pci_choose_state(pdev, state);
 	pm8001_printk("pdev=0x%p, slot=%s, entering "
-		      "operating state [D%d]\n", pdev,
-		      pm8001_ha->name, device_state);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, device_state);
+		      "suspended state\n", pdev,
+		      pm8001_ha->name);
 	return 0;
 }
 
 /**
  * pm8001_pci_resume - power management resume main entry point
- * @pdev: PCI device struct
+ * @dev: Device struct
  *
  * Returns 0 success, anything else error.
  */
-static int pm8001_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused pm8001_pci_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct sas_ha_struct *sha = pci_get_drvdata(pdev);
 	struct pm8001_hba_info *pm8001_ha;
 	int rc;
@@ -1247,17 +1242,8 @@ static int pm8001_pci_resume(struct pci_dev *pdev)
 	pm8001_printk("pdev=0x%p, slot=%s, resuming from previous "
 		"operating state [D%d]\n", pdev, pm8001_ha->name, device_state);
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_wake(pdev, PCI_D0, 0);
-	pci_restore_state(pdev);
-	rc = pci_enable_device(pdev);
-	if (rc) {
-		pm8001_printk("slot=%s Enable device failed during resume\n",
-			      pm8001_ha->name);
-		goto err_out_enable;
-	}
+	device_wakeup_disable(dev);
 
-	pci_set_master(pdev);
 	rc = pci_go_44(pdev);
 	if (rc)
 		goto err_out_disable;
@@ -1318,8 +1304,7 @@ static int pm8001_pci_resume(struct pci_dev *pdev)
 
 err_out_disable:
 	scsi_remove_host(pm8001_ha->shost);
-	pci_disable_device(pdev);
-err_out_enable:
+
 	return rc;
 }
 
@@ -1402,13 +1387,16 @@ static struct pci_device_id pm8001_pci_table[] = {
 	{} /* terminate list */
 };
 
+static SIMPLE_DEV_PM_OPS(pm8001_pci_pm_ops,
+			 pm8001_pci_suspend,
+			 pm8001_pci_resume);
+
 static struct pci_driver pm8001_pci_driver = {
 	.name		= DRV_NAME,
 	.id_table	= pm8001_pci_table,
 	.probe		= pm8001_pci_probe,
 	.remove		= pm8001_pci_remove,
-	.suspend	= pm8001_pci_suspend,
-	.resume		= pm8001_pci_resume,
+	.driver.pm	= &pm8001_pci_pm_ops,
 };
 
 /**
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
