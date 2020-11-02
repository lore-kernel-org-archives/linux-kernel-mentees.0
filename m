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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABDCC00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:51:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 859B222258
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:51:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVIGolkA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 859B222258
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2515B204C1;
	Mon,  2 Nov 2020 16:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pg+vEEwZqztZ; Mon,  2 Nov 2020 16:51:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 07BAE20013;
	Mon,  2 Nov 2020 16:51:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA46AC088B;
	Mon,  2 Nov 2020 16:51:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A935C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 784F987153
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4aAPu3xwl81b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:51:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 709B88714A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:51:39 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t22so7093145plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 08:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rkeme0HWV2vGIGAMlkCl1UyOrxrPPWM02ZKhUnuADDY=;
 b=MVIGolkAxm9wL3HFLSzBrHr4RCbLS5hSYygOp5T65SYrlSe9dW1NgOWGohX//YkaGX
 pW+RhEBrR0hSAtGL7Ua+0fJ3X5OKNXfYzpqvEYCfxV/ugd3d7dzcgGALRgjb39aHN0t2
 kW2ytvt05l1mFlE8DSJa/UCZetJRRY9EYJrwkXI2fpx+Nb2kGazlJ5yDLTSB9MjIlQnt
 FPto44U4wMEFqrmQQRtQgJ4ucMaXxvqnGSY1V89ji6PN0f3MNxXyAXPwJipJdn/v2rkH
 ApS/zKPsGPYZ8tga7K9gwTxocryAqiulZWQm0AAO4LcMD+RaG56+LBUvn3b9nTm9RCei
 eQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rkeme0HWV2vGIGAMlkCl1UyOrxrPPWM02ZKhUnuADDY=;
 b=YN8KraN7fMoHhepatps9nUo3T9mnBQUDY1gQlnLEfZoSyCsV4bREGX0/wD67E+dONd
 vpAPHP0tSLJgtuD/IH5VXC6VQF/+j62h1umPhzi+DHWdLMoF8kk3Q21rQKO0Fdo6dXXD
 6+H5DQFSh9ftu2/Oyrm9qyN9CBe1o0Aa5hNyaoQ8kDjdA5gnftLKK2wu04Mg51ayKZiI
 hdqmAwjd90kwWezKMv8bKYsUzwqrlrZvSNAXTtUUh+KOUZS+Oq6FY2q01OIMo/2OM/eo
 oH44O3JTqNfqHhlX4ReGBVaONeaG6JlRQZ4cc0ju5Ac9uTaRWKtui/NGRhGGHMnZOBrK
 0QAQ==
X-Gm-Message-State: AOAM531W8n7ChR9972S8H89vATqDWiucwh1mABev/RIATioQnGwdzAYl
 lbeH3OjeJ5pU5/cz4cOtmhU=
X-Google-Smtp-Source: ABdhPJwPTJkQo+eyulLgDesYWM3zj+Bn4umMf0gblMnQTVE2tWeRwAcD0M5KtQ7iNDdU2kCnXjCNMQ==
X-Received: by 2002:a17:902:6909:b029:d6:6ec4:e1f7 with SMTP id
 j9-20020a1709026909b02900d66ec4e1f7mr14719882plk.40.1604335899053; 
 Mon, 02 Nov 2020 08:51:39 -0800 (PST)
Received: from varodek.localdomain ([223.179.149.110])
 by smtp.gmail.com with ESMTPSA id t74sm4953233pfc.47.2020.11.02.08.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 08:51:38 -0800 (PST)
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
Date: Mon,  2 Nov 2020 22:17:07 +0530
Message-Id: <20201102164730.324035-7-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
References: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v4 06/29] scsi: aic7xxx: use generic
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

use generic power management

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
 drivers/scsi/aic7xxx/aic7xxx.h         | 10 ++----
 drivers/scsi/aic7xxx/aic7xxx_core.c    |  6 ++--
 drivers/scsi/aic7xxx/aic7xxx_osm_pci.c | 46 ++++++--------------------
 drivers/scsi/aic7xxx/aic7xxx_pci.c     |  4 +--
 4 files changed, 17 insertions(+), 49 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic7xxx.h b/drivers/scsi/aic7xxx/aic7xxx.h
index 88b90f9806c9..11a09798e6b5 100644
--- a/drivers/scsi/aic7xxx/aic7xxx.h
+++ b/drivers/scsi/aic7xxx/aic7xxx.h
@@ -1134,9 +1134,7 @@ const struct ahc_pci_identity	*ahc_find_pci_device(ahc_dev_softc_t);
 int			 ahc_pci_config(struct ahc_softc *,
 					const struct ahc_pci_identity *);
 int			 ahc_pci_test_register_access(struct ahc_softc *);
-#ifdef CONFIG_PM
-void			 ahc_pci_resume(struct ahc_softc *ahc);
-#endif
+void __maybe_unused	 ahc_pci_resume(struct ahc_softc *ahc);
 
 /*************************** EISA/VL Front End ********************************/
 struct aic7770_identity *aic7770_find_device(uint32_t);
@@ -1160,10 +1158,8 @@ int			 ahc_chip_init(struct ahc_softc *ahc);
 int			 ahc_init(struct ahc_softc *ahc);
 void			 ahc_intr_enable(struct ahc_softc *ahc, int enable);
 void			 ahc_pause_and_flushwork(struct ahc_softc *ahc);
-#ifdef CONFIG_PM
-int			 ahc_suspend(struct ahc_softc *ahc); 
-int			 ahc_resume(struct ahc_softc *ahc);
-#endif
+int __maybe_unused	 ahc_suspend(struct ahc_softc *ahc);
+int __maybe_unused	 ahc_resume(struct ahc_softc *ahc);
 void			 ahc_set_unit(struct ahc_softc *, int);
 void			 ahc_set_name(struct ahc_softc *, char *);
 void			 ahc_free(struct ahc_softc *ahc);
diff --git a/drivers/scsi/aic7xxx/aic7xxx_core.c b/drivers/scsi/aic7xxx/aic7xxx_core.c
index 725bb7f58054..4ef7af8c0f55 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_core.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_core.c
@@ -5590,8 +5590,7 @@ ahc_pause_and_flushwork(struct ahc_softc *ahc)
 	ahc->flags &= ~AHC_ALL_INTERRUPTS;
 }
 
-#ifdef CONFIG_PM
-int
+int __maybe_unused
 ahc_suspend(struct ahc_softc *ahc)
 {
 
@@ -5617,7 +5616,7 @@ ahc_suspend(struct ahc_softc *ahc)
 	return (0);
 }
 
-int
+int __maybe_unused
 ahc_resume(struct ahc_softc *ahc)
 {
 
@@ -5626,7 +5625,6 @@ ahc_resume(struct ahc_softc *ahc)
 	ahc_restart(ahc);
 	return (0);
 }
-#endif
 /************************** Busy Target Table *********************************/
 /*
  * Return the untagged transaction id for a given target/channel lun.
diff --git a/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c b/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c
index 9b293b1f0b71..a07e94fac673 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c
@@ -121,47 +121,23 @@ static const struct pci_device_id ahc_linux_pci_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, ahc_linux_pci_id_table);
 
-#ifdef CONFIG_PM
-static int
-ahc_linux_pci_dev_suspend(struct pci_dev *pdev, pm_message_t mesg)
+static int __maybe_unused
+ahc_linux_pci_dev_suspend(struct device *dev)
 {
-	struct ahc_softc *ahc = pci_get_drvdata(pdev);
-	int rc;
-
-	if ((rc = ahc_suspend(ahc)))
-		return rc;
+	struct ahc_softc *ahc = dev_get_drvdata(dev);
 
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-
-	if (mesg.event & PM_EVENT_SLEEP)
-		pci_set_power_state(pdev, PCI_D3hot);
-
-	return rc;
+	return ahc_suspend(ahc);
 }
 
-static int
-ahc_linux_pci_dev_resume(struct pci_dev *pdev)
+static int __maybe_unused
+ahc_linux_pci_dev_resume(struct device *dev)
 {
-	struct ahc_softc *ahc = pci_get_drvdata(pdev);
-	int rc;
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	if ((rc = pci_enable_device(pdev))) {
-		dev_printk(KERN_ERR, &pdev->dev,
-			   "failed to enable device after resume (%d)\n", rc);
-		return rc;
-	}
-
-	pci_set_master(pdev);
+	struct ahc_softc *ahc = dev_get_drvdata(dev);
 
 	ahc_pci_resume(ahc);
 
 	return (ahc_resume(ahc));
 }
-#endif
 
 static void
 ahc_linux_pci_dev_remove(struct pci_dev *pdev)
@@ -319,14 +295,14 @@ ahc_pci_write_config(ahc_dev_softc_t pci, int reg, uint32_t value, int width)
 	}
 }
 
+static SIMPLE_DEV_PM_OPS(ahc_linux_pci_dev_pm_ops,
+			 ahc_linux_pci_dev_suspend,
+			 ahc_linux_pci_dev_resume);
 
 static struct pci_driver aic7xxx_pci_driver = {
 	.name		= "aic7xxx",
 	.probe		= ahc_linux_pci_dev_probe,
-#ifdef CONFIG_PM
-	.suspend	= ahc_linux_pci_dev_suspend,
-	.resume		= ahc_linux_pci_dev_resume,
-#endif
+	.driver.pm	= &ahc_linux_pci_dev_pm_ops,
 	.remove		= ahc_linux_pci_dev_remove,
 	.id_table	= ahc_linux_pci_id_table
 };
diff --git a/drivers/scsi/aic7xxx/aic7xxx_pci.c b/drivers/scsi/aic7xxx/aic7xxx_pci.c
index 656f680c7802..dab3a6d12c4d 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_pci.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_pci.c
@@ -2008,8 +2008,7 @@ ahc_pci_chip_init(struct ahc_softc *ahc)
 	return (ahc_chip_init(ahc));
 }
 
-#ifdef CONFIG_PM
-void
+void __maybe_unused
 ahc_pci_resume(struct ahc_softc *ahc)
 {
 	/*
@@ -2040,7 +2039,6 @@ ahc_pci_resume(struct ahc_softc *ahc)
 		ahc_release_seeprom(&sd);
 	}
 }
-#endif
 
 static int
 ahc_aic785X_setup(struct ahc_softc *ahc)
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
