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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C90C433EC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:38:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E3A922BF3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OD83R4Lz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E3A922BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 11B862048B;
	Mon, 20 Jul 2020 13:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZmey6Ka6GDu; Mon, 20 Jul 2020 13:38:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9AAEC2048A;
	Mon, 20 Jul 2020 13:38:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8852BC089F;
	Mon, 20 Jul 2020 13:38:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3010AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B2AB87FCC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcKdLGYL0t1I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:38:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 28EC987FE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:38:07 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id md7so10122390pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aOCvJ9OMLita4DjSQELNt/vTBzDq7eNN9v6xYwF0scM=;
 b=OD83R4LzuLPOKPuafSlh3v4a55b2Ecp6kTwYEiHVDJDk2+HkF2h7VkIrZpgjs6gZqw
 J3BQn2zNKflD6y2jeiR7QrLwjahilGelf7tIlZNxNJgXQzAg6KS9c52sEznTgwmX1/iA
 YFaTfp671XO8D0+u41Mnh9OJUg3VhWhQES2viS5RLWU24ueUDT4AXxlWiWAXXY+xiLLD
 pMpVW4+eHbE06PHneK+ZL71wX1F/NQRja0PPWKbiz7SUFSAkWgedLGJrS9CQMSlSiQmF
 iw6Ic/14I6uT5HL0hv3ocKH5vCifp67pRZ32iNiz3+IYVVlA6gdJGXm4lQsIVQtUK/xO
 gHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aOCvJ9OMLita4DjSQELNt/vTBzDq7eNN9v6xYwF0scM=;
 b=pb8TM1fGSkNuGiil9+XrcREeGGjKqECcfootG3zmJdgy5mkH6bN+pmWHmrp/UHxcwK
 4byIqxDlTdmu3baHxg2oPihZ5qmNexzVz76y0CtYVAy6a+oy97uXAY167OdKSV4QE18R
 Io/zZ+3gIIkzTGRsjj8ObIiLIN9eSwnsGj5Q7xdgjyBqJ+ZL6gxqGXNc77h6W5RzOQzZ
 mUzPgh0RobCsxuBxkFCo/+vhu4QKU7c8P8svPrY9RcGV/tFPqf/Zt6Ylt8nqYM4PcVrO
 2nRadYoc/Dq+lN97yIVkPHKcG2VIQWrLzjGpGXwgXCamZ1+l2KZCWAfs1IRwExUUyuZo
 Q5tg==
X-Gm-Message-State: AOAM532XE3g+9csjO074w4xaRPJV5+HqaDP7KOjgcQiVFZNVQJya8jVR
 Rq2EasDLtDXLTMDrMohncUQ=
X-Google-Smtp-Source: ABdhPJzrefgWJlwsiQew1HwItWjyQCmIWZSd6P3bWOaQNyPa/ldeUDgobqi5a4RL5HGhLFbm4Uq72A==
X-Received: by 2002:a17:90b:384c:: with SMTP id
 nl12mr24442140pjb.108.1595252286558; 
 Mon, 20 Jul 2020 06:38:06 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id s6sm17042183pfd.20.2020.07.20.06.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 06:38:06 -0700 (PDT)
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
Date: Mon, 20 Jul 2020 19:04:22 +0530
Message-Id: <20200720133427.454400-10-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v2 09/15] scsi: lpfc: use generic
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

The driver was calling pci_save/restore_state(), pci_choose_state() and
pci_set_power_state() which is no more needed.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/lpfc/lpfc_init.c | 100 +++++++++++-----------------------
 1 file changed, 33 insertions(+), 67 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 6637f84a3d1b..a36309b48144 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -12452,8 +12452,7 @@ lpfc_pci_remove_one_s3(struct pci_dev *pdev)
 
 /**
  * lpfc_pci_suspend_one_s3 - PCI func to suspend SLI-3 device for power mgmnt
- * @pdev: pointer to PCI device
- * @msg: power management message
+ * @dev_d: pointer to device
  *
  * This routine is to be called from the kernel's PCI subsystem to support
  * system Power Management (PM) to device with SLI-3 interface spec. When
@@ -12471,10 +12470,10 @@ lpfc_pci_remove_one_s3(struct pci_dev *pdev)
  * 	0 - driver suspended the device
  * 	Error otherwise
  **/
-static int
-lpfc_pci_suspend_one_s3(struct pci_dev *pdev, pm_message_t msg)
+static int __maybe_unused
+lpfc_pci_suspend_one_s3(struct device *dev_d)
 {
-	struct Scsi_Host *shost = pci_get_drvdata(pdev);
+	struct Scsi_Host *shost = dev_get_drvdata(dev_d);
 	struct lpfc_hba *phba = ((struct lpfc_vport *)shost->hostdata)->phba;
 
 	lpfc_printf_log(phba, KERN_INFO, LOG_INIT,
@@ -12488,16 +12487,12 @@ lpfc_pci_suspend_one_s3(struct pci_dev *pdev, pm_message_t msg)
 	/* Disable interrupt from device */
 	lpfc_sli_disable_intr(phba);
 
-	/* Save device state to PCI config space */
-	pci_save_state(pdev);
-	pci_set_power_state(pdev, PCI_D3hot);
-
 	return 0;
 }
 
 /**
  * lpfc_pci_resume_one_s3 - PCI func to resume SLI-3 device for power mgmnt
- * @pdev: pointer to PCI device
+ * @dev_d: pointer to device
  *
  * This routine is to be called from the kernel's PCI subsystem to support
  * system Power Management (PM) to device with SLI-3 interface spec. When PM
@@ -12514,10 +12509,10 @@ lpfc_pci_suspend_one_s3(struct pci_dev *pdev, pm_message_t msg)
  * 	0 - driver suspended the device
  * 	Error otherwise
  **/
-static int
-lpfc_pci_resume_one_s3(struct pci_dev *pdev)
+static int __maybe_unused
+lpfc_pci_resume_one_s3(struct device *dev_d)
 {
-	struct Scsi_Host *shost = pci_get_drvdata(pdev);
+	struct Scsi_Host *shost = dev_get_drvdata(dev_d);
 	struct lpfc_hba *phba = ((struct lpfc_vport *)shost->hostdata)->phba;
 	uint32_t intr_mode;
 	int error;
@@ -12525,19 +12520,6 @@ lpfc_pci_resume_one_s3(struct pci_dev *pdev)
 	lpfc_printf_log(phba, KERN_INFO, LOG_INIT,
 			"0452 PCI device Power Management resume.\n");
 
-	/* Restore device state from PCI config space */
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	/*
-	 * As the new kernel behavior of pci_restore_state() API call clears
-	 * device saved_state flag, need to save the restored state again.
-	 */
-	pci_save_state(pdev);
-
-	if (pdev->is_busmaster)
-		pci_set_master(pdev);
-
 	/* Startup the kernel thread for this host adapter. */
 	phba->worker_thread = kthread_run(lpfc_do_work, phba,
 					"lpfc_worker_%d", phba->brd_no);
@@ -13294,8 +13276,7 @@ lpfc_pci_remove_one_s4(struct pci_dev *pdev)
 
 /**
  * lpfc_pci_suspend_one_s4 - PCI func to suspend SLI-4 device for power mgmnt
- * @pdev: pointer to PCI device
- * @msg: power management message
+ * @dev_d: pointer to device
  *
  * This routine is called from the kernel's PCI subsystem to support system
  * Power Management (PM) to device with SLI-4 interface spec. When PM invokes
@@ -13313,10 +13294,10 @@ lpfc_pci_remove_one_s4(struct pci_dev *pdev)
  * 	0 - driver suspended the device
  * 	Error otherwise
  **/
-static int
-lpfc_pci_suspend_one_s4(struct pci_dev *pdev, pm_message_t msg)
+static int __maybe_unused
+lpfc_pci_suspend_one_s4(struct device *dev_d)
 {
-	struct Scsi_Host *shost = pci_get_drvdata(pdev);
+	struct Scsi_Host *shost = dev_get_drvdata(dev_d);
 	struct lpfc_hba *phba = ((struct lpfc_vport *)shost->hostdata)->phba;
 
 	lpfc_printf_log(phba, KERN_INFO, LOG_INIT,
@@ -13331,16 +13312,12 @@ lpfc_pci_suspend_one_s4(struct pci_dev *pdev, pm_message_t msg)
 	lpfc_sli4_disable_intr(phba);
 	lpfc_sli4_queue_destroy(phba);
 
-	/* Save device state to PCI config space */
-	pci_save_state(pdev);
-	pci_set_power_state(pdev, PCI_D3hot);
-
 	return 0;
 }
 
 /**
  * lpfc_pci_resume_one_s4 - PCI func to resume SLI-4 device for power mgmnt
- * @pdev: pointer to PCI device
+ * @dev_d: pointer to device
  *
  * This routine is called from the kernel's PCI subsystem to support system
  * Power Management (PM) to device with SLI-4 interface spac. When PM invokes
@@ -13357,10 +13334,10 @@ lpfc_pci_suspend_one_s4(struct pci_dev *pdev, pm_message_t msg)
  * 	0 - driver suspended the device
  * 	Error otherwise
  **/
-static int
-lpfc_pci_resume_one_s4(struct pci_dev *pdev)
+static int __maybe_unused
+lpfc_pci_resume_one_s4(struct device *dev_d)
 {
-	struct Scsi_Host *shost = pci_get_drvdata(pdev);
+	struct Scsi_Host *shost = dev_get_drvdata(dev_d);
 	struct lpfc_hba *phba = ((struct lpfc_vport *)shost->hostdata)->phba;
 	uint32_t intr_mode;
 	int error;
@@ -13368,19 +13345,6 @@ lpfc_pci_resume_one_s4(struct pci_dev *pdev)
 	lpfc_printf_log(phba, KERN_INFO, LOG_INIT,
 			"0292 PCI device Power Management resume.\n");
 
-	/* Restore device state from PCI config space */
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	/*
-	 * As the new kernel behavior of pci_restore_state() API call clears
-	 * device saved_state flag, need to save the restored state again.
-	 */
-	pci_save_state(pdev);
-
-	if (pdev->is_busmaster)
-		pci_set_master(pdev);
-
 	 /* Startup the kernel thread for this host adapter. */
 	phba->worker_thread = kthread_run(lpfc_do_work, phba,
 					"lpfc_worker_%d", phba->brd_no);
@@ -13696,8 +13660,7 @@ lpfc_pci_remove_one(struct pci_dev *pdev)
 
 /**
  * lpfc_pci_suspend_one - lpfc PCI func to suspend dev for power management
- * @pdev: pointer to PCI device
- * @msg: power management message
+ * @dev: pointer to device
  *
  * This routine is to be registered to the kernel's PCI subsystem to support
  * system Power Management (PM). When PM invokes this method, it dispatches
@@ -13708,19 +13671,19 @@ lpfc_pci_remove_one(struct pci_dev *pdev)
  * 	0 - driver suspended the device
  * 	Error otherwise
  **/
-static int
-lpfc_pci_suspend_one(struct pci_dev *pdev, pm_message_t msg)
+static int __maybe_unused
+lpfc_pci_suspend_one(struct device *dev)
 {
-	struct Scsi_Host *shost = pci_get_drvdata(pdev);
+	struct Scsi_Host *shost = dev_get_drvdata(dev);
 	struct lpfc_hba *phba = ((struct lpfc_vport *)shost->hostdata)->phba;
 	int rc = -ENODEV;
 
 	switch (phba->pci_dev_grp) {
 	case LPFC_PCI_DEV_LP:
-		rc = lpfc_pci_suspend_one_s3(pdev, msg);
+		rc = lpfc_pci_suspend_one_s3(dev);
 		break;
 	case LPFC_PCI_DEV_OC:
-		rc = lpfc_pci_suspend_one_s4(pdev, msg);
+		rc = lpfc_pci_suspend_one_s4(dev);
 		break;
 	default:
 		lpfc_printf_log(phba, KERN_ERR, LOG_INIT,
@@ -13733,7 +13696,7 @@ lpfc_pci_suspend_one(struct pci_dev *pdev, pm_message_t msg)
 
 /**
  * lpfc_pci_resume_one - lpfc PCI func to resume dev for power management
- * @pdev: pointer to PCI device
+ * @dev: pointer to device
  *
  * This routine is to be registered to the kernel's PCI subsystem to support
  * system Power Management (PM). When PM invokes this method, it dispatches
@@ -13744,19 +13707,19 @@ lpfc_pci_suspend_one(struct pci_dev *pdev, pm_message_t msg)
  * 	0 - driver suspended the device
  * 	Error otherwise
  **/
-static int
-lpfc_pci_resume_one(struct pci_dev *pdev)
+static int __maybe_unused
+lpfc_pci_resume_one(struct device *dev)
 {
-	struct Scsi_Host *shost = pci_get_drvdata(pdev);
+	struct Scsi_Host *shost = dev_get_drvdata(dev);
 	struct lpfc_hba *phba = ((struct lpfc_vport *)shost->hostdata)->phba;
 	int rc = -ENODEV;
 
 	switch (phba->pci_dev_grp) {
 	case LPFC_PCI_DEV_LP:
-		rc = lpfc_pci_resume_one_s3(pdev);
+		rc = lpfc_pci_resume_one_s3(dev);
 		break;
 	case LPFC_PCI_DEV_OC:
-		rc = lpfc_pci_resume_one_s4(pdev);
+		rc = lpfc_pci_resume_one_s4(dev);
 		break;
 	default:
 		lpfc_printf_log(phba, KERN_ERR, LOG_INIT,
@@ -13936,14 +13899,17 @@ static const struct pci_error_handlers lpfc_err_handler = {
 	.resume = lpfc_io_resume,
 };
 
+static SIMPLE_DEV_PM_OPS(lpfc_pci_pm_ops_one,
+			 lpfc_pci_suspend_one,
+			 lpfc_pci_resume_one);
+
 static struct pci_driver lpfc_driver = {
 	.name		= LPFC_DRIVER_NAME,
 	.id_table	= lpfc_id_table,
 	.probe		= lpfc_pci_probe_one,
 	.remove		= lpfc_pci_remove_one,
 	.shutdown	= lpfc_pci_remove_one,
-	.suspend        = lpfc_pci_suspend_one,
-	.resume		= lpfc_pci_resume_one,
+	.driver.pm	= &lpfc_pci_pm_ops_one,
 	.err_handler    = &lpfc_err_handler,
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
