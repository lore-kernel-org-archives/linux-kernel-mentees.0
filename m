Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88F0C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 06:37:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DC462071A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 06:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaarUoCO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DC462071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8C05C1FF59;
	Fri, 17 Jul 2020 06:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e4PZNlbYUkLr; Fri, 17 Jul 2020 06:37:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BD9AD2036C;
	Fri, 17 Jul 2020 06:37:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2451C07FF;
	Fri, 17 Jul 2020 06:37:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1918C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C117D88092
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXpaNLPqPEUf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:37:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 442FF87FD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:37:27 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id mn17so6059144pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 23:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l8tgAiiB6kZiNGO4J6Nzv+v3TQbrsbT5yAPUnfw5Pug=;
 b=XaarUoCO66nhPhPELtHqNVFXorQ6eK3GrkcYG/idLL6uzFQD6scgYMlGFHF8+ArnEe
 5ugaK5J4tCVIk3w/Pec3KSsMF8hCaKhgRGWFAdpYTOHHTG1la4zboiVxAKXPTTODqi4F
 QpZZhaz0XHqxLGKFEcpgbQ90d8aR3tE17RH3o+9C0us8oFUv/4iZ759Z2heiF4iZ5yJt
 PBkjdZr0hP29Y8b6p0Yk5ofAGJjX71UIcqRTaAj/GYCuNdPMUANsO16TjZOskASRUiVc
 1RbB0a6hdXFfZI9j/21dKGhQpMUSKhDSrORW76vl0LlDrQcjA2vPP0Ni4NeX2pFCJHpU
 8PAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l8tgAiiB6kZiNGO4J6Nzv+v3TQbrsbT5yAPUnfw5Pug=;
 b=SK/4iYATbJGc4k5cVS7JyQotkLRzk5vdy23zVtbbwXLOhfg6lJHxGRAwi/M5EyOTo9
 O74vZ5qbV9DC62YCexX0jWYpCrBlDyjJd3Zwu5h6igJxQ3pvfWkbKioLvEabGmzumKy2
 Ymgh8YVDPDLNyRZA/hc3zaDFyqH/VWfk9MEvFSkt1NJcWF2OEpSGoP+/svjdCPCPQWEg
 uPZx/rRmthGiyVCKGKwGcHDI1xl4Qw0LAe0zjd9NXFodiPvgfW0fmPRtOyLO7HG9Ibyo
 Ib29+PxLlcVSyYON3Vs9pqxyE7JDJ+q+rGooiSk4KkfPHQuJPrghxf321sfKLPsxEhyO
 +88A==
X-Gm-Message-State: AOAM5332yTCQEoI/e5V6a/+CDO4DqboCOMNM45uP/j6r5GVwJlkgXgt3
 46vjqyznjG35sJnsPqbOOKU=
X-Google-Smtp-Source: ABdhPJy8OO1zQxnnzwYmXOFKdyYc+LanLWWTJozxSpEzy037eKHsOdIU9XCPJngxHVb4Ha6RhEMHXw==
X-Received: by 2002:a17:90a:7648:: with SMTP id
 s8mr3550818pjl.122.1594967846799; 
 Thu, 16 Jul 2020 23:37:26 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id y22sm1683392pjp.41.2020.07.16.23.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 23:37:26 -0700 (PDT)
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
Date: Fri, 17 Jul 2020 12:04:30 +0530
Message-Id: <20200717063438.175022-8-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717063438.175022-1-vaibhavgupta40@gmail.com>
References: <20200717063438.175022-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v1 07/15] scsi: hisi_sas_v3_hw: use
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
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c | 32 ++++++++------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
index 55e2321a65bc..45605a520bc8 100644
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
@@ -3406,21 +3406,15 @@ static int hisi_sas_v3_suspend(struct pci_dev *pdev, pm_message_t state)
 
 	hisi_sas_init_mem(hisi_hba);
 
-	device_state = pci_choose_state(pdev, state);
-	dev_warn(dev, "entering operating state [D%d]\n",
-			device_state);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, device_state);
-
 	hisi_sas_release_tasks(hisi_hba);
 
 	sas_suspend_ha(sha);
 	return 0;
 }
 
-static int hisi_sas_v3_resume(struct pci_dev *pdev)
+static int __maybe_unused hisi_sas_v3_resume(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct sas_ha_struct *sha = pci_get_drvdata(pdev);
 	struct hisi_hba *hisi_hba = sha->lldd_ha;
 	struct Scsi_Host *shost = hisi_hba->shost;
@@ -3430,16 +3424,8 @@ static int hisi_sas_v3_resume(struct pci_dev *pdev)
 
 	dev_warn(dev, "resuming from operating state [D%d]\n",
 		 device_state);
-	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_wake(pdev, PCI_D0, 0);
-	pci_restore_state(pdev);
-	rc = pci_enable_device(pdev);
-	if (rc) {
-		dev_err(dev, "enable device failed during resume (%d)\n", rc);
-		return rc;
-	}
+	device_wakeup_disable(dev_d);
 
-	pci_set_master(pdev);
 	scsi_unblock_requests(shost);
 	clear_bit(HISI_SAS_REJECT_CMD_BIT, &hisi_hba->flags);
 
@@ -3447,7 +3433,6 @@ static int hisi_sas_v3_resume(struct pci_dev *pdev)
 	rc = hw_init_v3_hw(hisi_hba);
 	if (rc) {
 		scsi_remove_host(shost);
-		pci_disable_device(pdev);
 		return rc;
 	}
 	hisi_hba->hw->phys_init(hisi_hba);
@@ -3468,13 +3453,16 @@ static const struct pci_error_handlers hisi_sas_err_handler = {
 	.reset_done	= hisi_sas_reset_done_v3_hw,
 };
 
+static SIMPLE_DEV_PM_OPS(hisi_sas_v3_pm_ops,
+			 hisi_sas_v3_suspend,
+			 hisi_sas_v3_resume);
+
 static struct pci_driver sas_v3_pci_driver = {
 	.name		= DRV_NAME,
 	.id_table	= sas_v3_pci_table,
 	.probe		= hisi_sas_v3_probe,
 	.remove		= hisi_sas_v3_remove,
-	.suspend	= hisi_sas_v3_suspend,
-	.resume		= hisi_sas_v3_resume,
+	.driver.pm	= &hisi_sas_v3_pm_ops,
 	.err_handler	= &hisi_sas_err_handler,
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
