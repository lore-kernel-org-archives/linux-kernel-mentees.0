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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FE8C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:32:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3102220B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:32:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeHv+bOB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3102220B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 103EF87345;
	Thu,  1 Oct 2020 12:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sz1RjxCZ0p+2; Thu,  1 Oct 2020 12:32:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 884FE87337;
	Thu,  1 Oct 2020 12:32:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84D28C0889;
	Thu,  1 Oct 2020 12:32:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03CC9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DB4DC204C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWu+eQK30ud9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:32:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 0243C2048F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:32:10 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 7so3912166pgm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 05:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hrv7wRA+5E+4KqJ7bQMOzG1YJwF6Az+zVhIMy7DopLU=;
 b=GeHv+bOByYv/7nmo32iMHC75G0isZBzRUMMMArTGgzfs7JvMHmpNFXqYjkpdRwGcSX
 bhtqUAN53rSGBzAAnZmZcPat6VFeFAerXN9EaAXMWDs+NTfKG+rBXqeAmEv25g8l1raE
 2ZHoHLIqC2XJ38K0hXyFtf8vtb7O/7VC/+oyuRVK3Lrh/3BInkkLRXL+BhyPYU+Lf2Bx
 JGCVRIQS84xFLCF8CGYiSNvD7MnZuyoTOadztIIem4SQlARGl11jCRTh/WiSMZbe7T6I
 7FpPT+/sjvY2PngX2h4oMdb4Bbjnvs9yjL8llG/eaCnEOgsAGM7omVhMbsH36fkL/eem
 lFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hrv7wRA+5E+4KqJ7bQMOzG1YJwF6Az+zVhIMy7DopLU=;
 b=csFjNglW05O8Ms7pjxikbq1WRRHcv/+ouQvOU+BNWnKeVGGB2uO8v2DRWdcudwa1oj
 +uSOxolDqOptGTax+qdvpJ4gT9lFR/SJJ7DMZ2wt7eVhRfS82l603FbPO6WBZZRMLpR4
 okCfiOT7wfy5ENSerckosdZpvYkMjCbmQTJUP7WP23H9BZuP7AomFWOVgwJIr3xIgoev
 /1UXq+h6yVeJE/vcwYuHjB1MN5RWcYgBFG6TrIKrFkG++q+0sWb4GIzVk1gaKuEvqQEh
 bi+dRoKKZgWnWbx6zsCYLUO0Pshu3/wly8IJQoi5QfABCd2rVfzznh1QvaE6pZnahGW+
 oXpQ==
X-Gm-Message-State: AOAM530kDrDCL7u4UI6cnst6RUvfY3uy2FOaSHLj2KbmzLMXPvZX+sf6
 RGD9b1hDcz/EQFmmtPU0LLU=
X-Google-Smtp-Source: ABdhPJxQsNaElmb369gzt/Yo9RjTX54ks0xKIenxfw0M+AOwyH7+1Qtq1uXVqtfS/ux6tre3ChN/xQ==
X-Received: by 2002:aa7:94a4:0:b029:151:d786:d5c2 with SMTP id
 a4-20020aa794a40000b0290151d786d5c2mr6860664pfl.50.1601555530485; 
 Thu, 01 Oct 2020 05:32:10 -0700 (PDT)
Received: from varodek.localdomain ([171.61.143.130])
 by smtp.gmail.com with ESMTPSA id m13sm5695199pjl.45.2020.10.01.05.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 05:32:10 -0700 (PDT)
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
Date: Thu,  1 Oct 2020 17:55:08 +0530
Message-Id: <20201001122511.1075420-26-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
References: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v3 25/28] scsi: mvumi: use generic
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
 drivers/scsi/mvumi.c | 46 +++++++++-----------------------------------
 1 file changed, 9 insertions(+), 37 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 6a25e6918e26..6c710585a628 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -2567,46 +2567,26 @@ static void mvumi_shutdown(struct pci_dev *pdev)
 	mvumi_flush_cache(mhba);
 }
 
-static int __maybe_unused mvumi_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused mvumi_suspend(struct device *dev)
 {
-	struct mvumi_hba *mhba = NULL;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct mvumi_hba *mhba = pci_get_drvdata(pdev);
 
-	mhba = pci_get_drvdata(pdev);
 	mvumi_flush_cache(mhba);
 
-	pci_set_drvdata(pdev, mhba);
 	mhba->instancet->disable_intr(mhba);
-	free_irq(mhba->pdev->irq, mhba);
 	mvumi_unmap_pci_addr(pdev, mhba->base_addr);
-	pci_release_regions(pdev);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 
 	return 0;
 }
 
-static int __maybe_unused mvumi_resume(struct pci_dev *pdev)
+static int __maybe_unused mvumi_resume(struct device *dev)
 {
 	int ret;
-	struct mvumi_hba *mhba = NULL;
-
-	mhba = pci_get_drvdata(pdev);
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	ret = pci_enable_device(pdev);
-	if (ret) {
-		dev_err(&pdev->dev, "enable device failed\n");
-		return ret;
-	}
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct mvumi_hba *mhba = pci_get_drvdata(pdev);
 
-	ret = mvumi_pci_set_master(pdev);
 	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
-	if (ret)
-		goto fail;
-	ret = pci_request_regions(mhba->pdev, MV_DRIVER_NAME);
 	if (ret)
 		goto fail;
 	ret = mvumi_map_pci_addr(mhba->pdev, mhba->base_addr);
@@ -2626,12 +2606,6 @@ static int __maybe_unused mvumi_resume(struct pci_dev *pdev)
 		goto unmap_pci_addr;
 	}
 
-	ret = request_irq(mhba->pdev->irq, mvumi_isr_handler, IRQF_SHARED,
-				"mvumi", mhba);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register IRQ\n");
-		goto unmap_pci_addr;
-	}
 	mhba->instancet->enable_intr(mhba);
 
 	return 0;
@@ -2641,11 +2615,12 @@ static int __maybe_unused mvumi_resume(struct pci_dev *pdev)
 release_regions:
 	pci_release_regions(pdev);
 fail:
-	pci_disable_device(pdev);
 
 	return ret;
 }
 
+static SIMPLE_DEV_PM_OPS(mvumi_pm_ops, mvumi_suspend, mvumi_resume);
+
 static struct pci_driver mvumi_pci_driver = {
 
 	.name = MV_DRIVER_NAME,
@@ -2653,10 +2628,7 @@ static struct pci_driver mvumi_pci_driver = {
 	.probe = mvumi_probe_one,
 	.remove = mvumi_detach_one,
 	.shutdown = mvumi_shutdown,
-#ifdef CONFIG_PM
-	.suspend = mvumi_suspend,
-	.resume = mvumi_resume,
-#endif
+	.driver.pm = &mvumi_pm_ops,
 };
 
 module_pci_driver(mvumi_pci_driver);
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
