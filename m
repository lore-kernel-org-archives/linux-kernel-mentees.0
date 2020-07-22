Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F310C433F2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 08:35:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4B33207BB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 08:35:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5mjbVyJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4B33207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B6E65880DD;
	Wed, 22 Jul 2020 08:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSr+YfL7CZ-t; Wed, 22 Jul 2020 08:35:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B80888091;
	Wed, 22 Jul 2020 08:35:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30859C004E;
	Wed, 22 Jul 2020 08:35:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FFFEC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2C7C486B93
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wv_20cOn1z2w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:35:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A35AA869C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 08:35:20 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z3so792392pfn.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 01:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HO2KdHTG8CWRvUWixHHguAvRh8U1JUtcNnQoDE9NJ0=;
 b=B5mjbVyJZ28XLKNNuTPsCQ2bHZiK3f7R81S9TV/ugmZxnh3o0zlKPuacx5FU+trUnb
 AcdY3P0T2l/jeHkfkGAngdXYHBrjLDyafgM3ktkEoGbqnI4YUqHr1WB2at1x0tcvWATx
 SQxzG9FlSh0oW2Q4wZIzEsJRXW4WaqRLs7ip5O+qnqA/fc68BtE0XL5tdc64WYBsiLoh
 qErNJHJuVRC1va4D0SMTSQIduCSWdWop7Z4H9WRoNvWFqKBLZXhxCMTl4G8PmMKbdGZF
 nrg7PtG1/xXE1n6nPnSsVEPg9SmvmXtWCprIRiANxke/oU8QZ5DA673Pcvkq/MawEE+W
 ykyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HO2KdHTG8CWRvUWixHHguAvRh8U1JUtcNnQoDE9NJ0=;
 b=hOFfd/TYu4+17yOLn+InP8iCdh3BnOXUdBWTCOU5wqVy+uIzM3YK0pWFQ9LC7Rh+3u
 CpjeKKwsxVjqCSe+w++rdOG5J5eiY0NyoIfE1Dw1MxFsy103X8Nf90H8DOUxaKooWFu0
 n/5dp8aUC1VFf0Cra1OSYigRzOpyrdjvmQjAo/0WsOoQtYMzWa126vhMhis34Q5cHPqK
 xQNqdZoZCh6HS++agpqiGg0dI9SD/+/G6rG3bgkrGAsH1gd7eeGRUasumRj00hporgBI
 F71M4Ed9Mg2YboSx0ZGh1stksdr2XhGxjfdA3miqQc/P3EwiKmYphLBX4dLpImvaMYsb
 nVAQ==
X-Gm-Message-State: AOAM533RBedURPjcwiFJINpAOMz5WPt3pw7MSWuGcPI6jtNOFY5OmOY8
 t/xPDrn7mq5GqsNcI+/fE8o=
X-Google-Smtp-Source: ABdhPJxoD+asLmN+X4Kni/JrR8aEg1m0w9rLbNcvu3qHjQBL8mcRuLHj6gJ3gf40pij6nNmKGWPSMA==
X-Received: by 2002:a62:8342:: with SMTP id h63mr26886028pfe.183.1595406920209; 
 Wed, 22 Jul 2020 01:35:20 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id g13sm5777319pje.29.2020.07.22.01.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 01:35:19 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Wed, 22 Jul 2020 14:03:35 +0530
Message-Id: <20200722083335.50068-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200722083335.50068-1-vaibhavgupta40@gmail.com>
References: <ea5881cdfd4d612193feed646ce89f253a36db69.camel@wdc.com>
 <20200722083335.50068-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3 3/3] skd: use generic power
	management
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

Drivers using legacy power management .suspen()/.resume() callbacks
have to manage PCI states and device's PM states themselves. They also
need to take care of standard configuration registers.

Switch to generic power management framework using a single
"struct dev_pm_ops" variable to take the unnecessary load from the driver.
This also avoids the need for the driver to directly call most of the PCI
helper functions and device power state control functions, as through
the generic framework PCI Core takes care of the necessary operations,
and drivers are required to do only device-specific jobs.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/block/skd_main.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index 51569c199a6c..7f2d42900b38 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -3315,10 +3315,11 @@ static void skd_pci_remove(struct pci_dev *pdev)
 	return;
 }
 
-static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused skd_pci_suspend(struct device *dev)
 {
 	int i;
 	struct skd_device *skdev;
+	struct pci_dev *pdev = to_pci_dev(dev);
 
 	skdev = pci_get_drvdata(pdev);
 	if (!skdev) {
@@ -3337,18 +3338,15 @@ static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	if (skdev->pcie_error_reporting_is_enabled)
 		pci_disable_pcie_error_reporting(pdev);
 
-	pci_release_regions(pdev);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 	return 0;
 }
 
-static int skd_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused skd_pci_resume(struct device *dev)
 {
 	int i;
 	int rc = 0;
 	struct skd_device *skdev;
+	struct pci_dev *pdev = to_pci_dev(dev);
 
 	skdev = pci_get_drvdata(pdev);
 	if (!skdev) {
@@ -3356,16 +3354,8 @@ static int skd_pci_resume(struct pci_dev *pdev)
 		return -1;
 	}
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_wake(pdev, PCI_D0, 0);
-	pci_restore_state(pdev);
+	device_wakeup_disable(dev);
 
-	rc = pci_enable_device(pdev);
-	if (rc)
-		return rc;
-	rc = pci_request_regions(pdev, DRV_NAME);
-	if (rc)
-		goto err_out;
 	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 	if (rc)
 		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
@@ -3374,7 +3364,6 @@ static int skd_pci_resume(struct pci_dev *pdev)
 		goto err_out_regions;
 	}
 
-	pci_set_master(pdev);
 	rc = pci_enable_pcie_error_reporting(pdev);
 	if (rc) {
 		dev_err(&pdev->dev,
@@ -3427,10 +3416,6 @@ static int skd_pci_resume(struct pci_dev *pdev)
 		pci_disable_pcie_error_reporting(pdev);
 
 err_out_regions:
-	pci_release_regions(pdev);
-
-err_out:
-	pci_disable_device(pdev);
 	return rc;
 }
 
@@ -3450,13 +3435,14 @@ static void skd_pci_shutdown(struct pci_dev *pdev)
 	skd_stop_device(skdev);
 }
 
+static SIMPLE_DEV_PM_OPS(skd_pci_pm_ops, skd_pci_suspend, skd_pci_resume);
+
 static struct pci_driver skd_driver = {
 	.name		= DRV_NAME,
 	.id_table	= skd_pci_tbl,
 	.probe		= skd_pci_probe,
 	.remove		= skd_pci_remove,
-	.suspend	= skd_pci_suspend,
-	.resume		= skd_pci_resume,
+	.driver.pm	= &skd_pci_pm_ops,
 	.shutdown	= skd_pci_shutdown,
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
