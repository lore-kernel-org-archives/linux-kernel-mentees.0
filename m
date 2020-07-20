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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CDEC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:37:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCF8E22BF3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIWS1iDS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCF8E22BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB8BF87688;
	Mon, 20 Jul 2020 13:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDwoWLQuMeKn; Mon, 20 Jul 2020 13:37:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1DAAC87680;
	Mon, 20 Jul 2020 13:37:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17217C089F;
	Mon, 20 Jul 2020 13:37:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24F93C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 103A32048B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kj0-rpTfbJV1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 7DD352048A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:27 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id d1so8706019plr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bpDL8hP0A1+XBDIs+//qQv7nf7yzkQKaBmD5iZnM/EU=;
 b=aIWS1iDSUm2VTLaN9ACrEdgMlbuhD4ZZWpEBNAl0ATKxHpck66GEgX77MUFDxES/14
 ihg909GqmZH8kZAoTh96f4sUM6TYCfyINKyU61WdoGG5cSpr4ijjn5r+Kzd1iFB2S9eq
 82rCoH2ETCz3u3co90YsoIsiXgQGjPvyQztyxR3+ZmmhY9SDMqGeNw7o/G6Xv11lIAxk
 e8QZ157i0DgGjc9ndtVj2nP1AQttFhyZP03QifoznI3bgrv9w+/Q/6hweGSLvLSJBpDr
 hXqZlu5t/rUXymJU/6B0p7TZGAdlySbMrAYGCyw004g2l40OE4f15xlsGLs8MmdjWKGU
 Zmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bpDL8hP0A1+XBDIs+//qQv7nf7yzkQKaBmD5iZnM/EU=;
 b=Hq8Kqa3RaH1aqhem32DFUzgGQxy3uF3c/cMkpUdhwtfzInF8VMhewAm75DKawVcYaY
 M9ReJUcan8TozKkYRjCVqs/AlgYUnK0u8GYenbhndsE7mioRqWJp0eXax18zXRXp276d
 7VENlgC2EAsuaLI+qwgZqoXhkm6My4jOiFMz+uTFgZozoIYkXfqWKf/tFUUwOcNzV0Gf
 tplw67n18LbRVox5hCiIxxhtX3frpHQP68J/PcTd4xPnPWXlXWaaZy12M9J8pq9Z3u/A
 weME54j5qXlQHFLkRA5qA2F5Tjwjrk7nC58FlFNIBRERaXD2Kqi+UgQzrGdOUnJpe7mF
 F9wA==
X-Gm-Message-State: AOAM532pv8CNDZpCBTzQabDbQZcfpqFV07j6bBWlomd51YNgfyUmSQAr
 BIg7z9d2rnwy3j73+nhBDmM=
X-Google-Smtp-Source: ABdhPJwATblenhS1dEt8I55FiSAhco/yd1XFQJzqKKNvo5kMw2YTTJ66SHhtFKHhbd7Yu8kkl4nUJg==
X-Received: by 2002:a17:902:b207:: with SMTP id
 t7mr5567455plr.135.1595252247070; 
 Mon, 20 Jul 2020 06:37:27 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id s6sm17042183pfd.20.2020.07.20.06.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 06:37:26 -0700 (PDT)
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
Date: Mon, 20 Jul 2020 19:04:18 +0530
Message-Id: <20200720133427.454400-6-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v2 05/15] scsi: arcmsr: use generic
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

With legacy PM hooks, it was the responsibility of a driver to manage PCI
states and also the device's power state. The generic approach is to let
the PCI core handle the work.

PCI core passes "struct device*" as an argument to the .suspend() and
.resume() callbacks.

Driver was also using PCI helper functions like pci_save/restore_state(),
pci_disable/enable_device(), pci_set_power_state() and pci_enable_wake().
They should not be invoked by the driver.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/arcmsr/arcmsr_hba.c | 35 ++++++++++++--------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index 30914c8f29cc..7e098ddcc4f5 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -113,8 +113,8 @@ static int arcmsr_bios_param(struct scsi_device *sdev,
 static int arcmsr_queue_command(struct Scsi_Host *h, struct scsi_cmnd *cmd);
 static int arcmsr_probe(struct pci_dev *pdev,
 				const struct pci_device_id *id);
-static int arcmsr_suspend(struct pci_dev *pdev, pm_message_t state);
-static int arcmsr_resume(struct pci_dev *pdev);
+static int __maybe_unused arcmsr_suspend(struct device *dev);
+static int __maybe_unused arcmsr_resume(struct device *dev);
 static void arcmsr_remove(struct pci_dev *pdev);
 static void arcmsr_shutdown(struct pci_dev *pdev);
 static void arcmsr_iop_init(struct AdapterControlBlock *acb);
@@ -213,13 +213,14 @@ static struct pci_device_id arcmsr_device_id_table[] = {
 };
 MODULE_DEVICE_TABLE(pci, arcmsr_device_id_table);
 
+static SIMPLE_DEV_PM_OPS(arcmsr_pm_ops, arcmsr_suspend, arcmsr_resume);
+
 static struct pci_driver arcmsr_pci_driver = {
 	.name			= "arcmsr",
 	.id_table		= arcmsr_device_id_table,
 	.probe			= arcmsr_probe,
 	.remove			= arcmsr_remove,
-	.suspend		= arcmsr_suspend,
-	.resume			= arcmsr_resume,
+	.driver.pm		= &arcmsr_pm_ops,
 	.shutdown		= arcmsr_shutdown,
 };
 /*
@@ -1065,14 +1066,14 @@ static void arcmsr_free_irq(struct pci_dev *pdev,
 	pci_free_irq_vectors(pdev);
 }
 
-static int arcmsr_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused arcmsr_suspend(struct device *dev)
 {
-	uint32_t intmask_org;
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct Scsi_Host *host = pci_get_drvdata(pdev);
 	struct AdapterControlBlock *acb =
 		(struct AdapterControlBlock *)host->hostdata;
 
-	intmask_org = arcmsr_disable_outbound_ints(acb);
+	arcmsr_disable_outbound_ints(acb);
 	arcmsr_free_irq(pdev, acb);
 	del_timer_sync(&acb->eternal_timer);
 	if (set_date_time)
@@ -1080,29 +1081,21 @@ static int arcmsr_suspend(struct pci_dev *pdev, pm_message_t state)
 	flush_work(&acb->arcmsr_do_message_isr_bh);
 	arcmsr_stop_adapter_bgrb(acb);
 	arcmsr_flush_adapter_cache(acb);
-	pci_set_drvdata(pdev, host);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 	return 0;
 }
 
-static int arcmsr_resume(struct pci_dev *pdev)
+static int __maybe_unused arcmsr_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct Scsi_Host *host = pci_get_drvdata(pdev);
 	struct AdapterControlBlock *acb =
 		(struct AdapterControlBlock *)host->hostdata;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_wake(pdev, PCI_D0, 0);
-	pci_restore_state(pdev);
-	if (pci_enable_device(pdev)) {
-		pr_warn("%s: pci_enable_device error\n", __func__);
-		return -ENODEV;
-	}
+	device_wakeup_disable(dev);
+
 	if (arcmsr_set_dma_mask(acb))
 		goto controller_unregister;
-	pci_set_master(pdev);
+
 	if (arcmsr_request_irq(pdev, acb) == FAILED)
 		goto controller_stop;
 	switch (acb->adapter_type) {
@@ -1137,9 +1130,7 @@ static int arcmsr_resume(struct pci_dev *pdev)
 	scsi_remove_host(host);
 	arcmsr_free_ccb_pool(acb);
 	arcmsr_unmap_pciregion(acb);
-	pci_release_regions(pdev);
 	scsi_host_put(host);
-	pci_disable_device(pdev);
 	return -ENODEV;
 }
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
