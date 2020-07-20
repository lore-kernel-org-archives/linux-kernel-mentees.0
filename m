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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B538C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:37:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3167122BF3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vESND/m2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3167122BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0917A21505;
	Mon, 20 Jul 2020 13:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qd98fKFnf7+u; Mon, 20 Jul 2020 13:37:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0BB2320796;
	Mon, 20 Jul 2020 13:37:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBB20C089F;
	Mon, 20 Jul 2020 13:37:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87EF3C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 776CD844A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2eSg-qdf8qrq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DB3B484415
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:37:18 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id k71so10265674pje.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 06:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g7GZQzL62FHm4zfeW7Rur2Q7XHclDeIeHZT7uPwrmpo=;
 b=vESND/m26eUm2DZbM2aO9zSHOhUWlbMIZV+svD+NnkEbhtaRsLBtpYXKBsHj8FBf3q
 Ps+VZkAfNONqzF+H/12H0mcII1xm6LdXCz+RR+niEmGuIYYCwEBIZuU6WvRvQNdwR47P
 1jWztMZ+0ZIOc8lUkq7ry1gxRsoCH5e4ebq5RCKb+QEWITl9l65aOZJo7mH3FBGFYCWB
 zARAjLWbnCLdGr9MN2fhdxRWj1BPMYMkk2lr7DTS8BN6FHe1iq/nvix8EdsTsAlC8DqH
 K50hAyC9OqenMqmNU55gkrAQ8Nxj+Lu3iHiPjRqIXep8jOFv1tQ1F/H5H/oVA6O9o+qv
 1Lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g7GZQzL62FHm4zfeW7Rur2Q7XHclDeIeHZT7uPwrmpo=;
 b=uge0OisttqcAr9JUZR0P4id+z+Cu/Q2jSggYr/ZEq0B0oIUsPomPWppEXZ6p95c49E
 YJrl7J2L/RAoCBjRjaVDrPcUMZ6OmQeeLq76O2H0/dmm0b1/xg5e3erxo0xg4LKAnMeM
 5FZe8/AsAVb2XZKy0LcFlW6VlS/KTciHZBzhFOA6mOHJ7UvhQ0kljIYA+Gtp06WoNKAG
 jTNnlix/MrqRDJpmLJ9oFaVZoAx65PekDu6Jmd8NMIuKJv7rryv/KnJMLm1n2SyNn1lz
 0LdmeySEDMbLQdRQ642L8aVbRKPgY5Z0NG7lq+H1cMH7tDJXUw001zSo4n/PQhRvnbIr
 NWNQ==
X-Gm-Message-State: AOAM531z2/9NUDVF14Qz4HHo96rkKtmyOQ1LsJYg0bSOyIq2IgyYxvp8
 jZW3spZsDDv3aWQvOHYfxSk=
X-Google-Smtp-Source: ABdhPJwmZHNcvfCkoqerBRBzVcBbQwsxKvM2lPQhDUS3fGGZTfcYk8FsvSwMs30FtF7nge5gz/7MUw==
X-Received: by 2002:a17:90a:d3cf:: with SMTP id
 d15mr22599054pjw.202.1595252238471; 
 Mon, 20 Jul 2020 06:37:18 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id s6sm17042183pfd.20.2020.07.20.06.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 06:37:18 -0700 (PDT)
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
Date: Mon, 20 Jul 2020 19:04:17 +0530
Message-Id: <20200720133427.454400-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v2 04/15] scsi: aic79xx: use generic
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

Also, .suspend() and .resume() were invoking other functions for PM, which
were againg bounded by "#ifdef CONFIG_PM" directive. Remove them and mark
them as "__maybe_unused".

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/aic7xxx/aic79xx.h         | 12 +++----
 drivers/scsi/aic7xxx/aic79xx_core.c    |  8 ++---
 drivers/scsi/aic7xxx/aic79xx_osm_pci.c | 43 +++++++-------------------
 drivers/scsi/aic7xxx/aic79xx_pci.c     |  6 ++--
 4 files changed, 20 insertions(+), 49 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic79xx.h b/drivers/scsi/aic7xxx/aic79xx.h
index 9a515551641c..dd5dfd4f30a5 100644
--- a/drivers/scsi/aic7xxx/aic79xx.h
+++ b/drivers/scsi/aic7xxx/aic79xx.h
@@ -1330,10 +1330,8 @@ const struct	ahd_pci_identity *ahd_find_pci_device(ahd_dev_softc_t);
 int			  ahd_pci_config(struct ahd_softc *,
 					 const struct ahd_pci_identity *);
 int	ahd_pci_test_register_access(struct ahd_softc *);
-#ifdef CONFIG_PM
-void	ahd_pci_suspend(struct ahd_softc *);
-void	ahd_pci_resume(struct ahd_softc *);
-#endif
+void __maybe_unused	ahd_pci_suspend(struct ahd_softc *);
+void __maybe_unused	ahd_pci_resume(struct ahd_softc *);
 
 /************************** SCB and SCB queue management **********************/
 void		ahd_qinfifo_requeue_tail(struct ahd_softc *ahd,
@@ -1344,10 +1342,8 @@ struct ahd_softc	*ahd_alloc(void *platform_arg, char *name);
 int			 ahd_softc_init(struct ahd_softc *);
 void			 ahd_controller_info(struct ahd_softc *ahd, char *buf);
 int			 ahd_init(struct ahd_softc *ahd);
-#ifdef CONFIG_PM
-int			 ahd_suspend(struct ahd_softc *ahd);
-void			 ahd_resume(struct ahd_softc *ahd);
-#endif
+int __maybe_unused	 ahd_suspend(struct ahd_softc *ahd);
+void __maybe_unused	 ahd_resume(struct ahd_softc *ahd);
 int			 ahd_default_config(struct ahd_softc *ahd);
 int			 ahd_parse_vpddata(struct ahd_softc *ahd,
 					   struct vpd_config *vpd);
diff --git a/drivers/scsi/aic7xxx/aic79xx_core.c b/drivers/scsi/aic7xxx/aic79xx_core.c
index e4a09b93d00c..06ee7abd0f8f 100644
--- a/drivers/scsi/aic7xxx/aic79xx_core.c
+++ b/drivers/scsi/aic7xxx/aic79xx_core.c
@@ -7880,11 +7880,9 @@ ahd_pause_and_flushwork(struct ahd_softc *ahd)
 	ahd->flags &= ~AHD_ALL_INTERRUPTS;
 }
 
-#ifdef CONFIG_PM
-int
+int __maybe_unused
 ahd_suspend(struct ahd_softc *ahd)
 {
-
 	ahd_pause_and_flushwork(ahd);
 
 	if (LIST_FIRST(&ahd->pending_scbs) != NULL) {
@@ -7895,15 +7893,13 @@ ahd_suspend(struct ahd_softc *ahd)
 	return (0);
 }
 
-void
+void __maybe_unused
 ahd_resume(struct ahd_softc *ahd)
 {
-
 	ahd_reset(ahd, /*reinit*/TRUE);
 	ahd_intr_enable(ahd, TRUE); 
 	ahd_restart(ahd);
 }
-#endif
 
 /************************** Busy Target Table *********************************/
 /*
diff --git a/drivers/scsi/aic7xxx/aic79xx_osm_pci.c b/drivers/scsi/aic7xxx/aic79xx_osm_pci.c
index 8b891a05d9e7..07b670b80f1b 100644
--- a/drivers/scsi/aic7xxx/aic79xx_osm_pci.c
+++ b/drivers/scsi/aic7xxx/aic79xx_osm_pci.c
@@ -74,11 +74,10 @@ static const struct pci_device_id ahd_linux_pci_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, ahd_linux_pci_id_table);
 
-#ifdef CONFIG_PM
-static int
-ahd_linux_pci_dev_suspend(struct pci_dev *pdev, pm_message_t mesg)
+static int __maybe_unused
+ahd_linux_pci_dev_suspend(struct device *dev)
 {
-	struct ahd_softc *ahd = pci_get_drvdata(pdev);
+	struct ahd_softc *ahd = dev_get_drvdata(dev);
 	int rc;
 
 	if ((rc = ahd_suspend(ahd)))
@@ -86,39 +85,20 @@ ahd_linux_pci_dev_suspend(struct pci_dev *pdev, pm_message_t mesg)
 
 	ahd_pci_suspend(ahd);
 
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-
-	if (mesg.event & PM_EVENT_SLEEP)
-		pci_set_power_state(pdev, PCI_D3hot);
-
 	return rc;
 }
 
-static int
-ahd_linux_pci_dev_resume(struct pci_dev *pdev)
+static int __maybe_unused
+ahd_linux_pci_dev_resume(struct device *dev)
 {
-	struct ahd_softc *ahd = pci_get_drvdata(pdev);
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
+	struct ahd_softc *ahd = dev_get_drvdata(dev);
 
 	ahd_pci_resume(ahd);
 
 	ahd_resume(ahd);
 
-	return rc;
+	return 0;
 }
-#endif
 
 static void
 ahd_linux_pci_dev_remove(struct pci_dev *pdev)
@@ -224,13 +204,14 @@ ahd_linux_pci_dev_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return (0);
 }
 
+static SIMPLE_DEV_PM_OPS(ahd_linux_pci_dev_pm_ops,
+			 ahd_linux_pci_dev_suspend,
+			 ahd_linux_pci_dev_resume);
+
 static struct pci_driver aic79xx_pci_driver = {
 	.name		= "aic79xx",
 	.probe		= ahd_linux_pci_dev_probe,
-#ifdef CONFIG_PM
-	.suspend	= ahd_linux_pci_dev_suspend,
-	.resume		= ahd_linux_pci_dev_resume,
-#endif
+	.driver.pm	= &ahd_linux_pci_dev_pm_ops,
 	.remove		= ahd_linux_pci_dev_remove,
 	.id_table	= ahd_linux_pci_id_table
 };
diff --git a/drivers/scsi/aic7xxx/aic79xx_pci.c b/drivers/scsi/aic7xxx/aic79xx_pci.c
index 8397ae93f7dd..2f0bdb9225a4 100644
--- a/drivers/scsi/aic7xxx/aic79xx_pci.c
+++ b/drivers/scsi/aic7xxx/aic79xx_pci.c
@@ -377,8 +377,7 @@ ahd_pci_config(struct ahd_softc *ahd, const struct ahd_pci_identity *entry)
 	return ahd_pci_map_int(ahd);
 }
 
-#ifdef CONFIG_PM
-void
+void __maybe_unused
 ahd_pci_suspend(struct ahd_softc *ahd)
 {
 	/*
@@ -394,7 +393,7 @@ ahd_pci_suspend(struct ahd_softc *ahd)
 
 }
 
-void
+void __maybe_unused
 ahd_pci_resume(struct ahd_softc *ahd)
 {
 	ahd_pci_write_config(ahd->dev_softc, DEVCONFIG,
@@ -404,7 +403,6 @@ ahd_pci_resume(struct ahd_softc *ahd)
 	ahd_pci_write_config(ahd->dev_softc, CSIZE_LATTIME,
 			     ahd->suspend_state.pci_state.csize_lattime, /*bytes*/1);
 }
-#endif
 
 /*
  * Perform some simple tests that should catch situations where
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
