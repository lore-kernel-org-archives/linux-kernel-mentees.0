Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8CCC00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:52:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BE6E206F9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdnDTo/Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BE6E206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D3D8886AB1;
	Mon,  2 Nov 2020 16:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p5OyFiE43j42; Mon,  2 Nov 2020 16:52:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5537686A95;
	Mon,  2 Nov 2020 16:52:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 431B3C088B;
	Mon,  2 Nov 2020 16:52:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7827C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B3C4B869F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pT7mZ70dMyxh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 29E0B86957
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:16 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 72so4904776pfv.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 08:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZfFrvqo7DqkFljFYrfz490r27HiLjLHSzp/wVexiQxI=;
 b=IdnDTo/Z15gQQJenXHbz48rYyZ/viY+gIX4WeuWdw9YrvB5qHMPlW9Isvh8v/xjYQI
 0kWZQNPsIkfFdOAjHYKP+c03Rh33P4ZJMStTRU1josXmDvOOc1vNyzmuUFxBPB3Qdrc5
 ljpB3kLsnIHr0K044vjKgn0TpYJNwEvJt1tPcQgSCiUkMgdXAfiOH5cF9qXnOEKUWD0P
 hGkzzS9vDdqsfIS15adkZY7sb3CkU/GjCpwUppvlmyAxLmQk0jhk08kZzv2Qr9evE1jI
 TysSsLBvylG7r7fpMdwCYyLH6l4ofk8UcOAi2WaYRI4+4shSaRYRXhoZ0ONrcbsaK5OE
 I9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZfFrvqo7DqkFljFYrfz490r27HiLjLHSzp/wVexiQxI=;
 b=pKEtPalKm/VI6Jq0QQ4cMjc+ozJ5EcyAuC2L9FsF+A4hxzD/Fns8pKGIA7GNXApDuc
 /UHKJGv2b9EMQCopxS+V3x6PGLxZjlizmjFj7njptPW+ABNxHB/smLz5wPw6lV/fNkDq
 JdRSXeQ1W0xrE0WddmVXh994cqVSggqOIEiJ86zvtGnSwZFH5qAMKQD+eezWovmKTboa
 623F1y3u5aN4GfcUwdDkj8JSK0pcNjlgMFzMA+uuc7Ob0HveXg5uXPncFf/+lJdAf13y
 nZK8G3/jLN8rfjJLwgFc298WG6YqydZRUvPs6oTUbxSMMPTJy/zk8iqSfqPFPcS+9nxC
 nzwA==
X-Gm-Message-State: AOAM533XxeyO+/xwGn5FH7yHfAnxgBm6tdXM3ORXnER89xp9HDaJKlQX
 l0wrD1HbFJ7EnJMLwCP2RFI=
X-Google-Smtp-Source: ABdhPJzoB/aS3l59wiqAH8Fub2lfPofKLh5dv3O7rn/FPpOZWCaLVIp6hFC00Sx3oLNCUw1fY3Zkqw==
X-Received: by 2002:a17:90a:8b93:: with SMTP id
 z19mr11878765pjn.123.1604335935795; 
 Mon, 02 Nov 2020 08:52:15 -0800 (PST)
Received: from varodek.localdomain ([223.179.149.110])
 by smtp.gmail.com with ESMTPSA id t74sm4953233pfc.47.2020.11.02.08.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 08:52:15 -0800 (PST)
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
Date: Mon,  2 Nov 2020 22:17:10 +0530
Message-Id: <20201102164730.324035-10-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
References: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v4 09/29] scsi: arcmsr: use generic
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
 drivers/scsi/arcmsr/arcmsr_hba.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index c7ba4cbd197b..907f5af3bbd4 100644
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
@@ -216,13 +216,14 @@ static struct pci_device_id arcmsr_device_id_table[] = {
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
@@ -1126,8 +1127,9 @@ static void arcmsr_free_irq(struct pci_dev *pdev,
 	pci_free_irq_vectors(pdev);
 }
 
-static int arcmsr_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused arcmsr_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct Scsi_Host *host = pci_get_drvdata(pdev);
 	struct AdapterControlBlock *acb =
 		(struct AdapterControlBlock *)host->hostdata;
@@ -1140,28 +1142,18 @@ static int arcmsr_suspend(struct pci_dev *pdev, pm_message_t state)
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
-	pci_restore_state(pdev);
-	if (pci_enable_device(pdev)) {
-		pr_warn("%s: pci_enable_device error\n", __func__);
-		return -ENODEV;
-	}
 	if (arcmsr_set_dma_mask(acb))
 		goto controller_unregister;
-	pci_set_master(pdev);
 	if (arcmsr_request_irq(pdev, acb) == FAILED)
 		goto controller_stop;
 	switch (acb->adapter_type) {
@@ -1206,9 +1198,7 @@ static int arcmsr_resume(struct pci_dev *pdev)
 	if (acb->adapter_type == ACB_ADAPTER_TYPE_F)
 		arcmsr_free_io_queue(acb);
 	arcmsr_unmap_pciregion(acb);
-	pci_release_regions(pdev);
 	scsi_host_put(host);
-	pci_disable_device(pdev);
 	return -ENODEV;
 }
 
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
