Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719A2C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:37:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D5722B4D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:37:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTvtzKf5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41D5722B4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 24BC285C5C;
	Mon, 20 Jul 2020 13:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrW40mR9UYRa; Mon, 20 Jul 2020 13:37:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A804685CFE;
	Mon, 20 Jul 2020 13:37:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99527C08A5;
	Mon, 20 Jul 2020 13:37:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9170DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8169E2047D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VN4jLz5tNHTw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id A817E1FEF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:01 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id w2so10292424pgg.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IdweH5iSZf0gdMKKw0PG0GQ37VlTq8MURVu5SpxFL8o=;
 b=dTvtzKf5u14KTq3Qo4MS32B2wl3t0WwDIS6RZq2AzhGyAoF9c79LmsKHFc0f1IPSLj
 H42PPKKSzbx3QpvK1j7NY81Jl8p1fZFDFJMwPviE9PgkiEywwkBD5MFV3zxGG7TQHKUt
 UxqtM9QQF07xBO7yHVKv7nvObBFohg7proJXwcy/LmNCyIqwl+T5ZgzA3LU9h6Uq5K2z
 Zo126c+A2Ce6/oTXUcijlJ9Dsaj1CL8+4NL0AM3U7Fhc1R1wsuvIKZ7d0BrIHEXgyM+W
 Hli9LWEG/CRXGpWhzAJoZmtk4C5k5MgZDEzemhdwouEABGxCRGznPAjgo9V+OZ+54nDy
 m1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IdweH5iSZf0gdMKKw0PG0GQ37VlTq8MURVu5SpxFL8o=;
 b=LG1lt1yg8xZ29vzFcpEA6PdXBizRKZ3NUwGqagw0G7MLL6KpSMdnZIFq+OsKdOx6k1
 XoAPnLg3zl9j1MZYKm6/Yt0pkQF4rmeOFdu9GDNeA7GQ2Ac9fHjbOdLgmwCQ2NwDky7j
 NgxVZhOjltDX0gAJb+hBx5NOvWfHoclyYUpXL1V+gs/iUitOEX92mPAi9ilS0uoGR5Ol
 egB/137pu0/hkeNLg9RxMtE/H/SeMcIWwqL8gJCaws2d13qVf1uUJqOdkGqWiIVjbIkt
 kOHxfyU7UuTythgcHQ6JvjELc+SdP5taYnjeoba4TyjUlA+l5SPnaFIDRZfgIuAhMCJ8
 GQkg==
X-Gm-Message-State: AOAM532UZTVJ94Np2OrpG8GOnS91B59MH1QysoVvabymls/8S0hRlMtr
 6MFXXLC2N6ir1VDP+uFAgC0=
X-Google-Smtp-Source: ABdhPJyHcL/kBC1X6AD+L1l5fyG+XyKuNwUWeYclFGNiwkT/aXyqBb90T/V83ukb8VZSqg6g9i0cgA==
X-Received: by 2002:a65:43c1:: with SMTP id n1mr18160536pgp.67.1595252221196; 
 Mon, 20 Jul 2020 06:37:01 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id s6sm17042183pfd.20.2020.07.20.06.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 06:37:00 -0700 (PDT)
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
Date: Mon, 20 Jul 2020 19:04:15 +0530
Message-Id: <20200720133427.454400-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v2 02/15] scsi: aacraid: use generic
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

Driver was using PCI helper functions like pci_save/restore_state(),
pci_disable/enable_device(), pci_set_power_state() and pci_enable_wake().
They should not be invoked by the driver.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/aacraid/linit.c | 34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/scsi/aacraid/linit.c b/drivers/scsi/aacraid/linit.c
index a308e86a97f1..1e44868ee953 100644
--- a/drivers/scsi/aacraid/linit.c
+++ b/drivers/scsi/aacraid/linit.c
@@ -1910,11 +1910,9 @@ static int aac_acquire_resources(struct aac_dev *dev)
 
 }
 
-#if (defined(CONFIG_PM))
-static int aac_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused aac_suspend(struct device *dev)
 {
-
-	struct Scsi_Host *shost = pci_get_drvdata(pdev);
+	struct Scsi_Host *shost = dev_get_drvdata(dev);
 	struct aac_dev *aac = (struct aac_dev *)shost->hostdata;
 
 	scsi_host_block(shost);
@@ -1923,29 +1921,16 @@ static int aac_suspend(struct pci_dev *pdev, pm_message_t state)
 
 	aac_release_resources(aac);
 
-	pci_set_drvdata(pdev, shost);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
 	return 0;
 }
 
-static int aac_resume(struct pci_dev *pdev)
+static int __maybe_unused aac_resume(struct device *dev)
 {
-	struct Scsi_Host *shost = pci_get_drvdata(pdev);
+	struct Scsi_Host *shost = dev_get_drvdata(dev);
 	struct aac_dev *aac = (struct aac_dev *)shost->hostdata;
-	int r;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_wake(pdev, PCI_D0, 0);
-	pci_restore_state(pdev);
-	r = pci_enable_device(pdev);
+	device_wakeup_disable(dev);
 
-	if (r)
-		goto fail_device;
-
-	pci_set_master(pdev);
 	if (aac_acquire_resources(aac))
 		goto fail_device;
 	/*
@@ -1960,10 +1945,8 @@ static int aac_resume(struct pci_dev *pdev)
 fail_device:
 	printk(KERN_INFO "%s%d: resume failed.\n", aac->name, aac->id);
 	scsi_host_put(shost);
-	pci_disable_device(pdev);
 	return -ENODEV;
 }
-#endif
 
 static void aac_shutdown(struct pci_dev *dev)
 {
@@ -2108,15 +2091,14 @@ static struct pci_error_handlers aac_pci_err_handler = {
 	.resume			= aac_pci_resume,
 };
 
+static SIMPLE_DEV_PM_OPS(aac_pm_ops, aac_suspend, aac_resume);
+
 static struct pci_driver aac_pci_driver = {
 	.name		= AAC_DRIVERNAME,
 	.id_table	= aac_pci_tbl,
 	.probe		= aac_probe_one,
 	.remove		= aac_remove_one,
-#if (defined(CONFIG_PM))
-	.suspend	= aac_suspend,
-	.resume		= aac_resume,
-#endif
+	.driver.pm	= &aac_pm_ops,
 	.shutdown	= aac_shutdown,
 	.err_handler    = &aac_pci_err_handler,
 };
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
