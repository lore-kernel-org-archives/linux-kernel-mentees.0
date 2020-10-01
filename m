Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592C7C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:31:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0417A2087D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMCaefO+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0417A2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BFCA986C94;
	Thu,  1 Oct 2020 12:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2amzmSJgsWZF; Thu,  1 Oct 2020 12:31:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 514D086C7A;
	Thu,  1 Oct 2020 12:31:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D80EC0889;
	Thu,  1 Oct 2020 12:31:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6E63C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A52E386C71
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4j6Lofi0M3T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:31:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 29AA086C69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:31:51 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id z19so4330486pfn.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 05:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yCf+5pBHtGakI8vGh3iG+XqVcPWuJKKA8L3HBDKw1hc=;
 b=SMCaefO+GDy2LTqmcPRkWQzQePduXz/8CGCTNsh/8EIR8JfCXCVnh2Cs1IaTM5UDKc
 gz0Nl37bLENTFOZGFkklP8NUuiW+iwPxpXjr3R7XCT0hX56VqUVK3c1uDfigpK+8CdOz
 QNGOhCEDX0kytXW6hnYuRWbTPi342VGN+FtmWBxcSm1ikbfJ2IDIaUrayFC90L7r2R+l
 WQ13Kr+71cPKp/EqDKJDbhnfYB7tPkQ88LCmVyGRGQy8KDNF2JB5KSLSaeE9/dMBzb8E
 sxzSVZJhZlEk1Cml4/GrkMV4DXn8SpuiMWvYuFXHlhNGzP1gIgeEhWYddpHm2d3E1/pF
 24Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yCf+5pBHtGakI8vGh3iG+XqVcPWuJKKA8L3HBDKw1hc=;
 b=ENL/mRXXQl5NxsC4epkttmzSoB3nZIsr5CvoQqKGaFzZFRFy/a/cG4EPDrciiu1Ib4
 KrN1SjWrhs72uzvvlIpQ4eP8vxHGm8RNb3VDYNifmPy+59193B6rZl37ZQSu1477fBPa
 dCDBsYnyGdq48H4nCjdnHPUCarIH+WTEiQOnZ8Tj5A/lWxtOrSA8/0w6JWix75xGtsE8
 IfGHbqKtRFljjJSaZQV+hIKR0b+I6hQKRzpy3aJNEwMmVdGhG5SCQxji4/ViFFGw/Cv0
 JUJJwI/eyL059ySVF8fspwZhUGDJvj0Z7eizLLqi5JPMXMgPSfkqtwkCZbRPVYajxlLt
 rlTg==
X-Gm-Message-State: AOAM532XoHdx8UGFfh3TH9rApjjrvjHOix8mIiTnUEr7vmvHtX6eqmko
 oHFMzwEtJy2dgclXIGgBhkw=
X-Google-Smtp-Source: ABdhPJyaWJwo00IH02FqAlYVk3iDFt3m09OedfhK544ZN2l6gEpfDhkFeia4cyHlU5Y/1x6rQ0Zh9A==
X-Received: by 2002:a63:d648:: with SMTP id d8mr5912533pgj.4.1601555510725;
 Thu, 01 Oct 2020 05:31:50 -0700 (PDT)
Received: from varodek.localdomain ([171.61.143.130])
 by smtp.gmail.com with ESMTPSA id m13sm5695199pjl.45.2020.10.01.05.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 05:31:50 -0700 (PDT)
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
Date: Thu,  1 Oct 2020 17:55:06 +0530
Message-Id: <20201001122511.1075420-24-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
References: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v3 23/28] scsi: 3w-sas: use generic
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
 drivers/scsi/3w-sas.c | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/scsi/3w-sas.c b/drivers/scsi/3w-sas.c
index 0b4888199699..b8f1848ecef2 100644
--- a/drivers/scsi/3w-sas.c
+++ b/drivers/scsi/3w-sas.c
@@ -1756,11 +1756,10 @@ static void twl_remove(struct pci_dev *pdev)
 	twl_device_extension_count--;
 } /* End twl_remove() */
 
-#ifdef CONFIG_PM
 /* This function is called on PCI suspend */
-static int twl_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused twl_suspend(struct device *dev)
 {
-	struct Scsi_Host *host = pci_get_drvdata(pdev);
+	struct Scsi_Host *host = dev_get_drvdata(dev);
 	TW_Device_Extension *tw_dev = (TW_Device_Extension *)host->hostdata;
 
 	printk(KERN_WARNING "3w-sas: Suspending host %d.\n", tw_dev->host->host_no);
@@ -1779,31 +1778,18 @@ static int twl_suspend(struct pci_dev *pdev, pm_message_t state)
 	/* Clear doorbell interrupt */
 	TWL_CLEAR_DB_INTERRUPT(tw_dev);
 
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
 	return 0;
 } /* End twl_suspend() */
 
 /* This function is called on PCI resume */
-static int twl_resume(struct pci_dev *pdev)
+static int __maybe_unused twl_resume(struct device *dev)
 {
 	int retval = 0;
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct Scsi_Host *host = pci_get_drvdata(pdev);
 	TW_Device_Extension *tw_dev = (TW_Device_Extension *)host->hostdata;
 
 	printk(KERN_WARNING "3w-sas: Resuming host %d.\n", tw_dev->host->host_no);
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	retval = pci_enable_device(pdev);
-	if (retval) {
-		TW_PRINTK(tw_dev->host, TW_DRIVER, 0x24, "Enable device failed during resume");
-		return retval;
-	}
-
-	pci_set_master(pdev);
 	pci_try_set_mwi(pdev);
 
 	retval = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
@@ -1841,11 +1827,9 @@ static int twl_resume(struct pci_dev *pdev)
 
 out_disable_device:
 	scsi_remove_host(host);
-	pci_disable_device(pdev);
 
 	return retval;
 } /* End twl_resume() */
-#endif
 
 /* PCI Devices supported by this driver */
 static struct pci_device_id twl_pci_tbl[] = {
@@ -1854,16 +1838,15 @@ static struct pci_device_id twl_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, twl_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(twl_pm_ops, twl_suspend, twl_resume);
+
 /* pci_driver initializer */
 static struct pci_driver twl_driver = {
 	.name		= "3w-sas",
 	.id_table	= twl_pci_tbl,
 	.probe		= twl_probe,
 	.remove		= twl_remove,
-#ifdef CONFIG_PM
-	.suspend	= twl_suspend,
-	.resume		= twl_resume,
-#endif
+	.driver.pm	= &twl_pm_ops,
 	.shutdown	= twl_shutdown
 };
 
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
