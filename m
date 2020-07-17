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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76266C433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 06:39:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD8920704
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 06:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCdY58WA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AD8920704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 314B3861B2;
	Fri, 17 Jul 2020 06:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Ud-K2MDnvo5; Fri, 17 Jul 2020 06:39:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B384986053;
	Fri, 17 Jul 2020 06:39:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99B35C07FF;
	Fri, 17 Jul 2020 06:39:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6741EC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 63B778809D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPPgKzBNuFHa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:39:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D07A888092
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:39:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id o13so6227900pgf.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 23:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3UmYWRJdZF39qPxiyCNEd3/I71syYWtAye2lr9jTA6I=;
 b=BCdY58WADm6UpJ5JU0mlK5H55GHa8V31bdBQgGtb7kbn0e8o1/W+3QfucNtBNjveRp
 DSKQFQfOs2vBGbp2ASOVon7CQG0ksLGwfcZojX15FvAwq13yOsdEuSdkMcyo3hv3w+oP
 kc9HL5fMgxdFTPMPGBSL2mJQGZgBDygRXU7p5B4ASMbpPWlucpYItkdF7xCv9Ruugxiv
 lLUX8eAhFVGYzEN5Arj34lCS8KCcihCOIZSBbYaMoE2PLrZL0OxAFlmDNEp9FYHd2gh1
 rNqV/DB7ytf2DOVbDQh94GlGo86D3wmywofvj6aFujvJlLkKresHOJ5nBS0rw/Wane0h
 k6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3UmYWRJdZF39qPxiyCNEd3/I71syYWtAye2lr9jTA6I=;
 b=csG0QMVyWzEutTIdei7xHFq8u2vRdebvEgGLtuAYaGLeHdjPzHkukfoPi+RLSYGRqi
 p+2ozQS0eM+7L/Kr3hfozFWkom7leiUm35rW6/8OPnzDWQhECmrex9Ewc0OmiXPUo3nG
 kB3liAH5WjPdP6Ej8+LlKj1ZpNYjYxgmseubm2f0TSoQpZ6vU9pSina4Gnl79r+FgN8v
 +ITnLhKvaPzm5eQPfjmOnAJJr7Epvw/+YRlwby4fXv33CoDChB2ElRyZzITAe5AFR7z8
 bwXyr1ad4CLuAx5CjNx//luu11wZ1GavrflFrif+Z7k+v6ME1BwH56vlXOz1k73XHq+4
 +InA==
X-Gm-Message-State: AOAM530KbmyaPegTT6RHhAixoODUAFv+ozUCd2S3tsghI4ZBksBSAKcG
 DYk6jRqmwIkRbjl/J22HuEEriBfuZyePng==
X-Google-Smtp-Source: ABdhPJxcmmKECoF0TfV4zG0jknFf/N+8haFoRRYUr/nQQejuy0NkIuTPWwREtvU2q5gTVoS9Ku8PJA==
X-Received: by 2002:a63:8f58:: with SMTP id r24mr7141799pgn.379.1594967943416; 
 Thu, 16 Jul 2020 23:39:03 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id y22sm1683392pjp.41.2020.07.16.23.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 23:39:02 -0700 (PDT)
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
Date: Fri, 17 Jul 2020 12:04:38 +0530
Message-Id: <20200717063438.175022-16-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717063438.175022-1-vaibhavgupta40@gmail.com>
References: <20200717063438.175022-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v1 15/15] scsi: pmcraid: use generic
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

Drivers using legacy PM have to manage PCI states and device's PM states
themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of
above mentioned, device-independent, jobs.

This driver makes use of PCI helper functions like
pci_save/restore_state(), pci_enable/disable_device(),
pci_set_power_state() and to do required operations. In generic mode, they
are no longer needed.

Change function parameter in both .suspend() and .resume() to
"struct device*" type. Use to_pci_dev() to get "struct pci_dev*" variable.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/pmcraid.c | 42 ++++++++++--------------------------------
 1 file changed, 10 insertions(+), 32 deletions(-)

diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index aa9ae2ae8579..e5f2667f745b 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -5237,54 +5237,39 @@ static void pmcraid_remove(struct pci_dev *pdev)
 	return;
 }
 
-#ifdef CONFIG_PM
 /**
  * pmcraid_suspend - driver suspend entry point for power management
- * @pdev:   PCI device structure
- * @state:  PCI power state to suspend routine
+ * @dev:   Device structure
  *
  * Return Value - 0 always
  */
-static int pmcraid_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused pmcraid_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pmcraid_instance *pinstance = pci_get_drvdata(pdev);
 
 	pmcraid_shutdown(pdev);
 	pmcraid_disable_interrupts(pinstance, ~0);
 	pmcraid_kill_tasklets(pinstance);
-	pci_set_drvdata(pinstance->pdev, pinstance);
 	pmcraid_unregister_interrupt_handler(pinstance);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 
 	return 0;
 }
 
 /**
  * pmcraid_resume - driver resume entry point PCI power management
- * @pdev: PCI device structure
+ * @dev: Device structure
  *
  * Return Value - 0 in case of success. Error code in case of any failure
  */
-static int pmcraid_resume(struct pci_dev *pdev)
+static int __maybe_unused pmcraid_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pmcraid_instance *pinstance = pci_get_drvdata(pdev);
 	struct Scsi_Host *host = pinstance->host;
 	int rc;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_wake(pdev, PCI_D0, 0);
-	pci_restore_state(pdev);
-
-	rc = pci_enable_device(pdev);
-
-	if (rc) {
-		dev_err(&pdev->dev, "resume: Enable device failed\n");
-		return rc;
-	}
-
-	pci_set_master(pdev);
+	device_wakeup_disable(dev);
 
 	if (sizeof(dma_addr_t) == 4 ||
 	    dma_set_mask(&pdev->dev, DMA_BIT_MASK(64)))
@@ -5337,18 +5322,10 @@ static int pmcraid_resume(struct pci_dev *pdev)
 	scsi_host_put(host);
 
 disable_device:
-	pci_disable_device(pdev);
 
 	return rc;
 }
 
-#else
-
-#define pmcraid_suspend NULL
-#define pmcraid_resume  NULL
-
-#endif /* CONFIG_PM */
-
 /**
  * pmcraid_complete_ioa_reset - Called by either timer or tasklet during
  *				completion of the ioa reset
@@ -5836,6 +5813,8 @@ static int pmcraid_probe(struct pci_dev *pdev,
 	return -ENODEV;
 }
 
+static SIMPLE_DEV_PM_OPS(pmcraid_pm_ops, pmcraid_suspend, pmcraid_resume);
+
 /*
  * PCI driver structure of pmcraid driver
  */
@@ -5844,8 +5823,7 @@ static struct pci_driver pmcraid_driver = {
 	.id_table = pmcraid_pci_table,
 	.probe = pmcraid_probe,
 	.remove = pmcraid_remove,
-	.suspend = pmcraid_suspend,
-	.resume = pmcraid_resume,
+	.driver.pm = &pmcraid_pm_ops,
 	.shutdown = pmcraid_shutdown
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
