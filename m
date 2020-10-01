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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AEFC4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:31:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAA8920B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 12:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZzb3EcU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAA8920B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BD5F786CD7;
	Thu,  1 Oct 2020 12:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTSruA3T2cGx; Thu,  1 Oct 2020 12:31:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 367F786C7A;
	Thu,  1 Oct 2020 12:31:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22D4BC0889;
	Thu,  1 Oct 2020 12:31:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79A66C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6384786943
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 69JJDl9JGJfG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:31:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CB35E86940
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 12:31:30 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id k8so4362423pfk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9uM1XyBCr19CDVWn9sf0w7KO65sKBGQo8/F3BUibYX0=;
 b=nZzb3EcUjTYpCRdQAX3xmBANibn8WqIzGcBrd3W6p89cEtprf6OSZWiMpMuzQCqz7l
 DLTk6SbEUdDfOoQ29zSTEol5F2yPN2p7Dc6zE5rVYK2nuQe1rldK/QMwFbghEBPY7tYz
 +7NMIKvBS2hy8a+5tKkIUPRdrNWx5q5pUWSpxeRMYexZ8IOtdSrZpaTF2DkBXs+/eYia
 XGRYIvY96aIJ2r+nofhnxdNpBDCs0zd8b2MgxeGJO6ctuXpylq1xBukWrPjplHayi0zV
 bKIQJh3VbZUGi39zmjAgktNDPf8uk9EPqD3JjGPawFYB4E/R901uAyWIh0kZQHNdyNvQ
 XIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9uM1XyBCr19CDVWn9sf0w7KO65sKBGQo8/F3BUibYX0=;
 b=kbI83xzUrkaS3ffVclviEHUeAPkfP5ua29Cc3Ccy6gBzzzkf+KbDiwZsv1n87j59Yq
 NdFaMG6adeQ52gTS5x0HGFDtfr3SkFMMKqRoDFxjQ5OR+HX6Qiai4hb724FMBlNWz2pP
 Sv2jkRdAJxwZ2oIuWzHhRr1w+ja9VF922hlcKNdJBdj5kMJ4Y34/1kuSN23Shssvn9QF
 /gDXDsYT2/mwOlkj9NIPjo8+ugvIaOaC0+JmVJ6XZgwAwBFX0bu9/fZb01cKI3LpZCbd
 hy/bOcYgQ4rGknyeV7Ffiy/kpTzp0LD/FQbHT7bM1ViSVpkDyEsZExmuCfu2D+k/kmJM
 fI7Q==
X-Gm-Message-State: AOAM530512qZQA3yrGzJN3Yn1h88vyKB/CqMdxItbAX7FnZV2wgTt33K
 Sd5hSquGU0yK/Vo6cQP7KMU=
X-Google-Smtp-Source: ABdhPJxGhxM79NkvfOxZ0wQbj6bjRlnLTRjAkhtufgv4O5/RVevsS/GoXarVQFu027om5zbBF/ehhQ==
X-Received: by 2002:a17:902:aa04:b029:d3:8b4e:e5ef with SMTP id
 be4-20020a170902aa04b02900d38b4ee5efmr2953510plb.65.1601555490385; 
 Thu, 01 Oct 2020 05:31:30 -0700 (PDT)
Received: from varodek.localdomain ([171.61.143.130])
 by smtp.gmail.com with ESMTPSA id m13sm5695199pjl.45.2020.10.01.05.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 05:31:29 -0700 (PDT)
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
Date: Thu,  1 Oct 2020 17:55:04 +0530
Message-Id: <20201001122511.1075420-22-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
References: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v3 21/28] scsi: 3w-9xxx: use generic
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
 drivers/scsi/3w-9xxx.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/scsi/3w-9xxx.c b/drivers/scsi/3w-9xxx.c
index e458e99ff161..b4718a1b2bd6 100644
--- a/drivers/scsi/3w-9xxx.c
+++ b/drivers/scsi/3w-9xxx.c
@@ -2191,10 +2191,10 @@ static void twa_remove(struct pci_dev *pdev)
 	twa_device_extension_count--;
 } /* End twa_remove() */
 
-#ifdef CONFIG_PM
 /* This function is called on PCI suspend */
-static int twa_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused twa_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct Scsi_Host *host = pci_get_drvdata(pdev);
 	TW_Device_Extension *tw_dev = (TW_Device_Extension *)host->hostdata;
 
@@ -2214,31 +2214,19 @@ static int twa_suspend(struct pci_dev *pdev, pm_message_t state)
 	}
 	TW_CLEAR_ALL_INTERRUPTS(tw_dev);
 
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
 	return 0;
 } /* End twa_suspend() */
 
 /* This function is called on PCI resume */
-static int twa_resume(struct pci_dev *pdev)
+static int __maybe_unused twa_resume(struct device *dev)
 {
 	int retval = 0;
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct Scsi_Host *host = pci_get_drvdata(pdev);
 	TW_Device_Extension *tw_dev = (TW_Device_Extension *)host->hostdata;
 
 	printk(KERN_WARNING "3w-9xxx: Resuming host %d.\n", tw_dev->host->host_no);
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
 
-	retval = pci_enable_device(pdev);
-	if (retval) {
-		TW_PRINTK(tw_dev->host, TW_DRIVER, 0x39, "Enable device failed during resume");
-		return retval;
-	}
-
-	pci_set_master(pdev);
 	pci_try_set_mwi(pdev);
 
 	retval = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
@@ -2276,11 +2264,9 @@ static int twa_resume(struct pci_dev *pdev)
 
 out_disable_device:
 	scsi_remove_host(host);
-	pci_disable_device(pdev);
 
 	return retval;
 } /* End twa_resume() */
-#endif
 
 /* PCI Devices supported by this driver */
 static struct pci_device_id twa_pci_tbl[] = {
@@ -2296,16 +2282,15 @@ static struct pci_device_id twa_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, twa_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(twa_pm_ops, twa_suspend, twa_resume);
+
 /* pci_driver initializer */
 static struct pci_driver twa_driver = {
 	.name		= "3w-9xxx",
 	.id_table	= twa_pci_tbl,
 	.probe		= twa_probe,
 	.remove		= twa_remove,
-#ifdef CONFIG_PM
-	.suspend	= twa_suspend,
-	.resume		= twa_resume,
-#endif
+	.driver.pm	= &twa_pm_ops,
 	.shutdown	= twa_shutdown
 };
 
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
