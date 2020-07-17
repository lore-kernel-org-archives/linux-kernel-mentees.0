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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D90C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 06:36:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C486720704
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 06:36:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uOV9K5F4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C486720704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A52C6881EC;
	Fri, 17 Jul 2020 06:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pzT1alVA4zv5; Fri, 17 Jul 2020 06:36:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F3945881DC;
	Fri, 17 Jul 2020 06:36:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA290C07FF;
	Fri, 17 Jul 2020 06:36:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80B48C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6F17786203
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EE5Rur05i_Bt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:36:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A14AD86200
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 06:36:28 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id ch3so6049327pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 23:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sRkE7ksFL2ebr2n2v9nXbzY1XW3YY8T5bASrkjktDKo=;
 b=uOV9K5F4ab4r2ImEgZz3T7yRcZwuq3d2y0cXjv84ZmB0wcl2VKO8bKEyIsnnjrERDI
 +kvchZ6WVHJDiEDAXJ1G+SMZLkETwkZYKRRbu+ma6m8pOw+juKUptrbwxPm4t2VgDtST
 G06UNh0ujWMLPwY0KUL/uGsXepRhP1LPco9v6mFiY5W4S3/T2MvF2aRINcfd0T+UUH1f
 Y2wWLFwHXkCs1IEyOKM0VsZnMa5wOlKk+6duJrcKgAHyFCw48TwJMIRaaxPgvKHqwQGq
 6F/rKOjiJUvakOtcTtDmA4HskaV8FSCh3Lrbx0DulzS6RtfKtiHh6ZmXe0sJyH//vOYL
 CkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sRkE7ksFL2ebr2n2v9nXbzY1XW3YY8T5bASrkjktDKo=;
 b=MfTTKuJ7wGsrlYaTopZbpWXjTsltc3xl4Yi4qrerzZqHHGo3HFBFQvLpqO4K+g/YKW
 zAmqPGWybA6p1Bu1F0b17YQifC3jTPzbtVNUajv964n5Iqd8Z2YZmj0WDzTsftLFHAJm
 WHD/pfVUs0tJwaoPyH0gYksQ9OczRDvJEvkjyuCJJ8CaMmIEVUdpCRGwjm/kGMhhyefK
 RG1LySElzClpUK5cursm9gBR8VKjiZ4m/7BhbixSAmiNVDPnrmA/z7LjXJ9ysv67kX06
 95sBI37tX1yr6fDx5on4aXnoeGKGo/R1umuoGrmDrjZSSfzUwmfBIWYzcdgStEEuDr9w
 tqeQ==
X-Gm-Message-State: AOAM530oj8CZTBiSZIpicbZ8JMpNli4mSh5Eo70Qcwk0AoaiRiLGJroh
 FGA63J70sAq7YOXtgnxAS50=
X-Google-Smtp-Source: ABdhPJxQYr14KgIsWdXSIy60jgnY/LkACxqU5+78XPFx9k6obCtrSr7pjlmsac0aVOChj13/kUv38A==
X-Received: by 2002:a17:90b:4910:: with SMTP id
 kr16mr8409682pjb.126.1594967788167; 
 Thu, 16 Jul 2020 23:36:28 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id y22sm1683392pjp.41.2020.07.16.23.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 23:36:27 -0700 (PDT)
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
Date: Fri, 17 Jul 2020 12:04:24 +0530
Message-Id: <20200717063438.175022-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717063438.175022-1-vaibhavgupta40@gmail.com>
References: <20200717063438.175022-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v1 01/15] scsi: megaraid_sas: use
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

With legacy PM hooks, it was the responsibility of a driver to manage PCI
states and also the device's power state. The generic approach is to let
the PCI core handle the work.

PCI core passes "struct device*" as an argument to the .suspend() and
.resume() callbacks. As the .suspend() work with "struct instance*",
extract it from "struct device*" using dev_get_drv_data().

Driver was also using PCI helper functions like pci_save/restore_state(),
pci_disable/enable_device(), pci_set_power_state() and pci_enable_wake().
They should not be invoked by the driver.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/megaraid/megaraid_sas_base.c | 57 +++++++----------------
 1 file changed, 16 insertions(+), 41 deletions(-)

diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index 00668335c2af..c1bf429d29db 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -7539,25 +7539,23 @@ static void megasas_shutdown_controller(struct megasas_instance *instance,
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
@@ -7579,7 +7577,7 @@ megasas_suspend(struct pci_dev *pdev, pm_message_t state)
 
 	tasklet_kill(&instance->isr_tasklet);
 
-	pci_set_drvdata(instance->pdev, instance);
+	dev_set_drvdata(dev, instance);
 	instance->instancet->disable_intr(instance);
 
 	megasas_destroy_irqs(instance);
@@ -7587,48 +7585,30 @@ megasas_suspend(struct pci_dev *pdev, pm_message_t state)
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
+ * @dev:              Device structure
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
-	pci_enable_wake(pdev, PCI_D0, 0);
-	pci_restore_state(pdev);
+	device_wakeup_disable(dev);
 
-	dev_info(&pdev->dev, "%s is called\n", __func__);
-	/*
-	 * PCI prepping: enable device set bus mastering and dma mask
-	 */
-	rval = pci_enable_device_mem(pdev);
-
-	if (rval) {
-		dev_err(&pdev->dev, "Enable device failed\n");
-		return rval;
-	}
-
-	pci_set_master(pdev);
+	dev_info(dev, "%s is called\n", __func__);
 
 	/*
 	 * We expect the FW state to be READY
@@ -7754,14 +7734,8 @@ megasas_resume(struct pci_dev *pdev)
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
@@ -7931,7 +7905,7 @@ static void megasas_detach_one(struct pci_dev *pdev)
 
 /**
  * megasas_shutdown -	Shutdown entry point
- * @device:		Generic device structure
+ * @pdev:		PCI device structure
  */
 static void megasas_shutdown(struct pci_dev *pdev)
 {
@@ -8508,6 +8482,8 @@ static const struct file_operations megasas_mgmt_fops = {
 	.llseek = noop_llseek,
 };
 
+static SIMPLE_DEV_PM_OPS(megasas_pm_ops, megasas_suspend, megasas_resume);
+
 /*
  * PCI hotplug support registration structure
  */
@@ -8517,8 +8493,7 @@ static struct pci_driver megasas_pci_driver = {
 	.id_table = megasas_pci_table,
 	.probe = megasas_probe_one,
 	.remove = megasas_detach_one,
-	.suspend = megasas_suspend,
-	.resume = megasas_resume,
+	.driver.pm = &megasas_pm_ops,
 	.shutdown = megasas_shutdown,
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
