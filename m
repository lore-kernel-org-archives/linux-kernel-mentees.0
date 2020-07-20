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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF50C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:37:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FFB022B4D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBs20ij9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FFB022B4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EF0FD854FC;
	Mon, 20 Jul 2020 13:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WsjYXnRuHW8t; Mon, 20 Jul 2020 13:37:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7A806854C2;
	Mon, 20 Jul 2020 13:37:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6984AC089F;
	Mon, 20 Jul 2020 13:37:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EE74C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 69D3286DA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qNkG6hy3JAc7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E5E9A82124
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:53 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k27so10308735pgm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qP/lw2OrWNJnMcQg/XtLZOmUZ9RFHua2vKNQYNPkmuc=;
 b=PBs20ij9CfDSVkVn+RaQUG5fj1gktc26Oy0Dvr3oNVU7k7ZDL8JOe7QDjkS9LUSG9I
 pwtiUs9nWtk3BWxeYWPo+WzpVRP5d8iXegrjhrVm6Gd4kqTheF9Jj9mwAQfFvdxvOUwo
 a5Ri3SR9GFVjaHAFXbyV11Z7LU++RkSknIgHN/FnZexLX1c8Htq7vz1VcPr8JZ8w/1Pr
 4N8LojHNPFXXfaoo9q8+0Ip0idFJ6hZx8DAp6hrR30Y/dfWejFidBhhIaItfuY0icKSE
 ZBwchB6V7hv3t+v6/woqqhWTBHkDSb489gMTN6tDSXC/5j+f9qy/Zx1aAUdp2ei7NHBO
 SIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qP/lw2OrWNJnMcQg/XtLZOmUZ9RFHua2vKNQYNPkmuc=;
 b=kq7p8HXkI6P1Nu1jo/j3vET3Zz4sCZ57CrC3cGMR4D6UAhplJ9oBBxBDn8oXilQPEd
 CZcHs62zR6/4vtB+XfImTn5rlNhsu5X0ISfIRyq9jj32DtBjLzWHwA7WFZHwmx9ZUWi0
 VkiL+cCftMMNfKY4mUUvyAOYwaxhT0doTqt3/VoVKwjKC9UZ+1Jn5VZqBoG7BLeAEk+5
 lSdlNhN+QglxXHqdGfBdTp8svJEYeR4m7Kl+PNOYxYnYZ1mWvvbLt2cDltk38VBCHeTN
 faR6metSd8ZIc4BWfHE1nb4sfS0DzOcnTYyzGk6qbOmsaBvzVodlF6ADEGAxUnk6dHtH
 EO2g==
X-Gm-Message-State: AOAM532790Lhf5AgmfcooDwiH9h+LBzDZVKI6UWT5k3/Bgs40KQngVaV
 JdcIYAW9ZCEwWkJw+h4oIsG7BlVXfKb3Mw==
X-Google-Smtp-Source: ABdhPJxVcEI9vj+VkSrnExQJ5pjS1IaJwUzUyKXnm+2ao+8/m0qxgbZ0qslCpMyjvURUTfAG8Oazgg==
X-Received: by 2002:a63:ce15:: with SMTP id y21mr18997162pgf.163.1595252273465; 
 Mon, 20 Jul 2020 06:37:53 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id s6sm17042183pfd.20.2020.07.20.06.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 06:37:53 -0700 (PDT)
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
Date: Mon, 20 Jul 2020 19:04:21 +0530
Message-Id: <20200720133427.454400-9-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v2 08/15] scsi: mpt3sas_scsih: use
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

The driver was calling pci_save/restore_state(), pci_choose_state(),
pci_enable/disable_device() and pci_set_power_state() which is no more
needed.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/mpt3sas/mpt3sas_scsih.c | 36 +++++++++++-----------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_scsih.c b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
index 08fc4b381056..f3c6e68b2921 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_scsih.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
@@ -10829,44 +10829,40 @@ _scsih_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return rv;
 }
 
-#ifdef CONFIG_PM
 /**
  * scsih_suspend - power management suspend main entry point
- * @pdev: PCI device struct
- * @state: PM state change to (usually PCI_D3)
+ * @dev: Device struct
  *
  * Return: 0 success, anything else error.
  */
-static int
-scsih_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused
+scsih_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct Scsi_Host *shost = pci_get_drvdata(pdev);
 	struct MPT3SAS_ADAPTER *ioc = shost_priv(shost);
-	pci_power_t device_state;
 
 	mpt3sas_base_stop_watchdog(ioc);
 	flush_scheduled_work();
 	scsi_block_requests(shost);
 	_scsih_nvme_shutdown(ioc);
-	device_state = pci_choose_state(pdev, state);
-	ioc_info(ioc, "pdev=0x%p, slot=%s, entering operating state [D%d]\n",
-		 pdev, pci_name(pdev), device_state);
+	ioc_info(ioc, "pdev=0x%p, slot=%s, entering suspended state\n",
+		 pdev, pci_name(pdev));
 
-	pci_save_state(pdev);
 	mpt3sas_base_free_resources(ioc);
-	pci_set_power_state(pdev, device_state);
 	return 0;
 }
 
 /**
  * scsih_resume - power management resume main entry point
- * @pdev: PCI device struct
+ * @dev: Device struct
  *
  * Return: 0 success, anything else error.
  */
-static int
-scsih_resume(struct pci_dev *pdev)
+static int __maybe_unused
+scsih_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct Scsi_Host *shost = pci_get_drvdata(pdev);
 	struct MPT3SAS_ADAPTER *ioc = shost_priv(shost);
 	pci_power_t device_state = pdev->current_state;
@@ -10875,9 +10871,7 @@ scsih_resume(struct pci_dev *pdev)
 	ioc_info(ioc, "pdev=0x%p, slot=%s, previous operating state [D%d]\n",
 		 pdev, pci_name(pdev), device_state);
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_wake(pdev, PCI_D0, 0);
-	pci_restore_state(pdev);
+	device_wakeup_disable(dev);
 	ioc->pdev = pdev;
 	r = mpt3sas_base_map_resources(ioc);
 	if (r)
@@ -10888,7 +10882,6 @@ scsih_resume(struct pci_dev *pdev)
 	mpt3sas_base_start_watchdog(ioc);
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 /**
  * scsih_pci_error_detected - Called when a PCI error is detected.
@@ -11162,6 +11155,8 @@ static struct pci_error_handlers _mpt3sas_err_handler = {
 	.resume		= scsih_pci_resume,
 };
 
+static SIMPLE_DEV_PM_OPS(scsih_pm_ops, scsih_suspend, scsih_resume);
+
 static struct pci_driver mpt3sas_driver = {
 	.name		= MPT3SAS_DRIVER_NAME,
 	.id_table	= mpt3sas_pci_table,
@@ -11169,10 +11164,7 @@ static struct pci_driver mpt3sas_driver = {
 	.remove		= scsih_remove,
 	.shutdown	= scsih_shutdown,
 	.err_handler	= &_mpt3sas_err_handler,
-#ifdef CONFIG_PM
-	.suspend	= scsih_suspend,
-	.resume		= scsih_resume,
-#endif
+	.driver.pm	= &scsih_pm_ops,
 };
 
 /**
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
