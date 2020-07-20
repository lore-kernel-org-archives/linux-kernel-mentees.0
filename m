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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB43BC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:37:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 911BD22CAF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:37:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOxJz7Q5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 911BD22CAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6C32D85D59;
	Mon, 20 Jul 2020 13:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XzYY72V9CzEj; Mon, 20 Jul 2020 13:37:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D173B85D11;
	Mon, 20 Jul 2020 13:37:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD323C089F;
	Mon, 20 Jul 2020 13:37:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 232A8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C6BFA20474
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8CURLbs0G3Kx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 72BA61FEF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:10 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id g67so10296704pgc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0aKAKc3QV9tSVn9rtnXDsVWLu3x/6YoSShniIPxhNVg=;
 b=XOxJz7Q5cUuoFJe3nTMYE7aAmh8fbUlnM5GnEOMXsP5otcY367tCL62mmdMeJ97u/y
 kZB+3zADxo7FcuR9+FmXM8yT7XCPYxxW5EOxryHjdO2G560vSlcG7/N2qf9MiIRBS4Hb
 LHGlOegxf0JWr4g8l0/qiAro7i+2G2IzIYyBRBPYl3nyUtrt2j5Q2XSIF0RgsSlfblC2
 Brv2AMDsAlPhyLUscr/rotWoxV3E5fOE7XVgM2wtREy3YwWe5bDZoT+rpdHE7ijgfExt
 wOsIEC/6vJo2g/w3WEdcItuqxN2SXOq6EzomDl+Zm4XjM3rj0tuFhyn76HXjeWos6n3n
 qh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0aKAKc3QV9tSVn9rtnXDsVWLu3x/6YoSShniIPxhNVg=;
 b=Mr6y5cDjzc/LhUSaglTGUq/zxrGJM8EMphjW/qTeOl7WWPnmyCygNLiTc8mryoywL0
 xL0Gt+jmJjkP0k5A+xHCU7jL1fqCYGeQdV2AIYOqYgo5VNgT3lmwAWZFz5DJOXoI+7A/
 4mSQGbDhbW5jwW/QBsuSYEXfSCVN9sSMgOlVnznM/mMwfSY6egOozA9AnHaPgcpfbvuV
 TgGC5UIdbojqr3qsl68p0mofAoNR91Lp9fdRmVr2II3zlma2kO+PZqSmtxzZW/s2X8mr
 eJ3wUMZpGFScBdy9JX6Qk6vkj0+Z8IztbdrsHWZseygg/MJFhH9QDbpLZhrJKcz/cNG/
 naMw==
X-Gm-Message-State: AOAM532b/vYoCTFRkvnqW/tcWyXgf4nxUozY+VlMADsp8ZDpIGc35uYl
 vwR+Mc6fiuN2Ybs451nwvYc=
X-Google-Smtp-Source: ABdhPJxuHX0sd+Np+B2ksuwsPmaZnIbF5yQh2nXVuC4rBECp2vxQkfinhUTLb2AnJMzy/aTk5StxEQ==
X-Received: by 2002:a62:1ccb:: with SMTP id
 c194mr20189690pfc.277.1595252229968; 
 Mon, 20 Jul 2020 06:37:09 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id s6sm17042183pfd.20.2020.07.20.06.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 06:37:09 -0700 (PDT)
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
Date: Mon, 20 Jul 2020 19:04:16 +0530
Message-Id: <20200720133427.454400-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v2 03/15] scsi: aic7xxx: use generic
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

Also, .suspend() and .resume() are invoking other functions for PM, which
were againg bounded by "#ifdef CONFIG_PM" directive. Remove the directive
and mark those functions as "__maybe_unused".

Compile-tested only.

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
index 3d4df906fa4f..c7eb238a9599 100644
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
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
