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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9ADFC00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:50:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6381E22258
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3lZJK8y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6381E22258
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E8463204D9;
	Mon,  2 Nov 2020 16:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jV7bq1fG3Y7l; Mon,  2 Nov 2020 16:50:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8748A204D0;
	Mon,  2 Nov 2020 16:50:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 762D1C088B;
	Mon,  2 Nov 2020 16:50:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFCC7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DA02787149
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FrAVMXQf-F-U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:50:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 501AB87103
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:50:41 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 10so11605760pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 08:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xMl2q2iLm2/Cdtv5ee/rXDY13o0Y92WxN2/36ftQDFE=;
 b=N3lZJK8yVGUBj08y7lZt7IKKaayO2BadDdgyAZ9gRmKGK7XyajcLkU5LhsDuEvMnxa
 PRuDKB3XzVTnwB/DYV2HNDtLpYtOjIRuPUaHDRfvDb6bOuc1p6wPfuxsWo+S8cc8L4vf
 iHzqhFfXxn7Jj3P2U9C4ymYwQ496zq4jFZB2HSTunKz1T2JAecHGkxV17uSihi8LqTBr
 GkJDeZSx8hOUUss2rEYm+nnd1bTxHsgNkMD3EWkt4HGM0IDilHelovgDeLlKUuVfiVdY
 +qyO0VTSi064IAD8fGEaVcA/WBgBaMYDSNI6OZYgzNbW97ChhjPKTkUJd84nwyvcHP/m
 0alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xMl2q2iLm2/Cdtv5ee/rXDY13o0Y92WxN2/36ftQDFE=;
 b=nJSYjxz7lrWst94UlxyoMQnmmecYM+nrKUYGWjneWFt+LPtTYZpHN7kHL/nxpiDbN/
 lRGfT5x0cX4zT5FsMSRFop9PLuh/1Mw629wBMpprKiL09VpDd6SYm44loci/hMj7Xq33
 9LMiuxSFcpZZz3hK6IvKnJkwoI3gx4ON3m3/LmHgBMq36EnYTk8qDu9PP5VaDpXGFnpe
 Imx9E6LY6Yw0ZAncCNie9N77bl4QSq7P7Sd6Ga9LEFsOsz5PaQzkTJl+Lmo+BrHdxKPc
 cRG3tZMlVTJynoMDgzrL2BCzwuBod0SPjRha94ZcqfAwOrnglVQy4Nv/zBElTdQxvkge
 pHaw==
X-Gm-Message-State: AOAM5301qoj9r9xMpIUyLQo+czFLOfZZbjWooOUiKx8+MIHSEc8Hn7C0
 zcfEaPpD6CbkNU8asqC8nDw=
X-Google-Smtp-Source: ABdhPJwlKBw65eKuMzpHgWsQqGYAVR+8a482HYN1Sgsq7fhC5AYvVA4J3WoyPhUJQvYex+BL7iTQVw==
X-Received: by 2002:a63:f80f:: with SMTP id n15mr13940744pgh.267.1604335840856; 
 Mon, 02 Nov 2020 08:50:40 -0800 (PST)
Received: from varodek.localdomain ([223.179.149.110])
 by smtp.gmail.com with ESMTPSA id t74sm4953233pfc.47.2020.11.02.08.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 08:50:40 -0800 (PST)
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
Date: Mon,  2 Nov 2020 22:17:03 +0530
Message-Id: <20201102164730.324035-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
References: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v4 02/29] scsi: megaraid_sas: use
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
 drivers/scsi/megaraid/megaraid_sas_base.c | 51 ++++++-----------------
 1 file changed, 13 insertions(+), 38 deletions(-)

diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index 47ffdada541d..bd330ea4063a 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -7593,25 +7593,23 @@ static void megasas_shutdown_controller(struct megasas_instance *instance,
 	megasas_return_cmd(instance, cmd);
 }
 
-#ifdef CONFIG_PM
 /**
  * megasas_suspend -	driver suspend entry point
- * @pdev:		PCI device structure
- * @state:		PCI power state to suspend routine
+ * @dev:		Device structure
  */
-static int
-megasas_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused
+megasas_suspend(struct device *dev)
 {
 	struct megasas_instance *instance;
 
-	instance = pci_get_drvdata(pdev);
+	instance = dev_get_drvdata(dev);
 
 	if (!instance)
 		return 0;
 
 	instance->unload = 1;
 
-	dev_info(&pdev->dev, "%s is called\n", __func__);
+	dev_info(dev, "%s is called\n", __func__);
 
 	/* Shutdown SR-IOV heartbeat timer */
 	if (instance->requestorId && !instance->skip_heartbeat_timer_del)
@@ -7641,47 +7639,29 @@ megasas_suspend(struct pci_dev *pdev, pm_message_t state)
 	if (instance->msix_vectors)
 		pci_free_irq_vectors(instance->pdev);
 
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
 	return 0;
 }
 
 /**
  * megasas_resume-      driver resume entry point
- * @pdev:               PCI device structure
+ * @dev:		Device structure
  */
-static int
-megasas_resume(struct pci_dev *pdev)
+static int __maybe_unused
+megasas_resume(struct device *dev)
 {
 	int rval;
 	struct Scsi_Host *host;
 	struct megasas_instance *instance;
 	u32 status_reg;
 
-	instance = pci_get_drvdata(pdev);
+	instance = dev_get_drvdata(dev);
 
 	if (!instance)
 		return 0;
 
 	host = instance->host;
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	dev_info(&pdev->dev, "%s is called\n", __func__);
-	/*
-	 * PCI prepping: enable device set bus mastering and dma mask
-	 */
-	rval = pci_enable_device_mem(pdev);
 
-	if (rval) {
-		dev_err(&pdev->dev, "Enable device failed\n");
-		return rval;
-	}
-
-	pci_set_master(pdev);
+	dev_info(dev, "%s is called\n", __func__);
 
 	/*
 	 * We expect the FW state to be READY
@@ -7807,14 +7787,8 @@ megasas_resume(struct pci_dev *pdev)
 fail_set_dma_mask:
 fail_ready_state:
 
-	pci_disable_device(pdev);
-
 	return -ENODEV;
 }
-#else
-#define megasas_suspend	NULL
-#define megasas_resume	NULL
-#endif
 
 static inline int
 megasas_wait_for_adapter_operational(struct megasas_instance *instance)
@@ -8572,6 +8546,8 @@ static const struct file_operations megasas_mgmt_fops = {
 	.llseek = noop_llseek,
 };
 
+static SIMPLE_DEV_PM_OPS(megasas_pm_ops, megasas_suspend, megasas_resume);
+
 /*
  * PCI hotplug support registration structure
  */
@@ -8581,8 +8557,7 @@ static struct pci_driver megasas_pci_driver = {
 	.id_table = megasas_pci_table,
 	.probe = megasas_probe_one,
 	.remove = megasas_detach_one,
-	.suspend = megasas_suspend,
-	.resume = megasas_resume,
+	.driver.pm = &megasas_pm_ops,
 	.shutdown = megasas_shutdown,
 };
 
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
