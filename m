Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5C1C00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:52:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79F76206F9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:52:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qeGq4sy0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79F76206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 23F8D87199;
	Mon,  2 Nov 2020 16:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ifeb89yIfWvi; Mon,  2 Nov 2020 16:52:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7F42D8715E;
	Mon,  2 Nov 2020 16:52:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B885C088B;
	Mon,  2 Nov 2020 16:52:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2063C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DEBD82010F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AuJbG7VT1uVM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id DC58520013
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:52:35 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 13so11608149pfy.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 08:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WUBvgbl6iGKCFFzOFeem+Ak5qZZi8vOAFv31Ry1s8Ag=;
 b=qeGq4sy0Twb2LAXIoCUbswcwn5ARIZjtbvsgY+oMv6tpsKJBflcN0heggKOvGtAqlF
 5lWH8QI0yCIRswe3y9aFtE4ifNs/DVlApOrcyVqC+BWmQvc3TF2UsKcW2AvIOOf2Q5Xp
 eYffTtiEej9hzNYv+Ao6e5/9+dOMgx3vPfbwOh+YLptr1r/Zc88Yhm68bvLv4bNzolZ7
 2pISvCLddMw9n0rFCiEzmY5pEMguW+KZ2mqsL0Poev7+GgE8Av4S/6rbZKZGxl4O5S0S
 CUlraZ6y34Q6SjK0QqTBWFJ18eEmU2626VUSvimPY1VA8lXybPhbRpHTHa7JCe8zQNHm
 3Avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUBvgbl6iGKCFFzOFeem+Ak5qZZi8vOAFv31Ry1s8Ag=;
 b=hav7246khMoU8z06RmRGy5XSrmGDsxi8lXwjNbp561u65keIKHNqc5B7RXXc4jCU11
 wF/VWiWPVXTVybFhsIKbWHKbrcbNktswEmdx3Ho03AldX5DeTfZOhDvsu/MSnZX2gwXY
 VrOjuhDH6PSwc/gtWRiYulsrj9I8v6tcM5CYpWW3HWrhdpgQQlB5dTy+CSKv5uDytk7t
 rbx7xdGITvHgfmSx+BtHS6Eur5XGJxKZ1862VfcW5vukAuhH/iBMtvObs6GB9LehU5Ve
 Rymzqv1FEjUED5OvfTRulEPjQ61DWIrHwY2R6mCOsnqz1kZnrNxXaXFSxfCpC9Vnc+KH
 e/ww==
X-Gm-Message-State: AOAM531g1dwrsP73SCkYL3wo13Ek+oA/TEv52/6lC0ZSdmvruDVqStWh
 QWRWOOeuWtpIcLGeutZLfXY=
X-Google-Smtp-Source: ABdhPJxVRX3en5oytRjcT9dRbMawLDnUSZPxIfG/YiS9M7Ityd8FlnM25FraJFjXR8i/6UM+kEw3Sw==
X-Received: by 2002:a05:6a00:2cf:b029:160:c0c:a95c with SMTP id
 b15-20020a056a0002cfb02901600c0ca95cmr21990295pft.76.1604335955469; 
 Mon, 02 Nov 2020 08:52:35 -0800 (PST)
Received: from varodek.localdomain ([223.179.149.110])
 by smtp.gmail.com with ESMTPSA id t74sm4953233pfc.47.2020.11.02.08.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 08:52:34 -0800 (PST)
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
Date: Mon,  2 Nov 2020 22:17:12 +0530
Message-Id: <20201102164730.324035-12-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
References: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v4 11/29] scsi: esas2r: use generic
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
 drivers/scsi/esas2r/esas2r.h      |  5 ++--
 drivers/scsi/esas2r/esas2r_init.c | 44 +++++++++----------------------
 drivers/scsi/esas2r/esas2r_main.c |  3 +--
 3 files changed, 16 insertions(+), 36 deletions(-)

diff --git a/drivers/scsi/esas2r/esas2r.h b/drivers/scsi/esas2r/esas2r.h
index e30d2f1f5368..ed63f7a9ea54 100644
--- a/drivers/scsi/esas2r/esas2r.h
+++ b/drivers/scsi/esas2r/esas2r.h
@@ -996,8 +996,9 @@ void esas2r_adapter_tasklet(unsigned long context);
 irqreturn_t esas2r_interrupt(int irq, void *dev_id);
 irqreturn_t esas2r_msi_interrupt(int irq, void *dev_id);
 void esas2r_kickoff_timer(struct esas2r_adapter *a);
-int esas2r_suspend(struct pci_dev *pcid, pm_message_t state);
-int esas2r_resume(struct pci_dev *pcid);
+
+extern const struct dev_pm_ops esas2r_pm_ops;
+
 void esas2r_fw_event_off(struct esas2r_adapter *a);
 void esas2r_fw_event_on(struct esas2r_adapter *a);
 bool esas2r_nvram_write(struct esas2r_adapter *a, struct esas2r_request *rq,
diff --git a/drivers/scsi/esas2r/esas2r_init.c b/drivers/scsi/esas2r/esas2r_init.c
index 905a6c874789..eb7763af7089 100644
--- a/drivers/scsi/esas2r/esas2r_init.c
+++ b/drivers/scsi/esas2r/esas2r_init.c
@@ -640,49 +640,27 @@ void esas2r_kill_adapter(int i)
 	}
 }
 
-int esas2r_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused esas2r_suspend(struct device *dev)
 {
-	struct Scsi_Host *host = pci_get_drvdata(pdev);
-	u32 device_state;
+	struct Scsi_Host *host = dev_get_drvdata(dev);
 	struct esas2r_adapter *a = (struct esas2r_adapter *)host->hostdata;
 
-	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev), "suspending adapter()");
+	esas2r_log_dev(ESAS2R_LOG_INFO, dev, "suspending adapter()");
 	if (!a)
 		return -ENODEV;
 
 	esas2r_adapter_power_down(a, 1);
-	device_state = pci_choose_state(pdev, state);
-	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
-		       "pci_save_state() called");
-	pci_save_state(pdev);
-	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
-		       "pci_disable_device() called");
-	pci_disable_device(pdev);
-	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
-		       "pci_set_power_state() called");
-	pci_set_power_state(pdev, device_state);
-	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev), "esas2r_suspend(): 0");
+	esas2r_log_dev(ESAS2R_LOG_INFO, dev, "esas2r_suspend(): 0");
 	return 0;
 }
 
-int esas2r_resume(struct pci_dev *pdev)
+static int __maybe_unused esas2r_resume(struct device *dev)
 {
-	struct Scsi_Host *host = pci_get_drvdata(pdev);
+	struct Scsi_Host *host = dev_get_drvdata(dev);
 	struct esas2r_adapter *a = (struct esas2r_adapter *)host->hostdata;
-	int rez;
-
-	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev), "resuming adapter()");
-	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
-		       "pci_set_power_state(PCI_D0) "
-		       "called");
-	pci_set_power_state(pdev, PCI_D0);
-	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
-		       "pci_restore_state() called");
-	pci_restore_state(pdev);
-	esas2r_log_dev(ESAS2R_LOG_INFO, &(pdev->dev),
-		       "pci_enable_device() called");
-	rez = pci_enable_device(pdev);
-	pci_set_master(pdev);
+	int rez = 0;
+
+	esas2r_log_dev(ESAS2R_LOG_INFO, dev, "resuming adapter()");
 
 	if (!a) {
 		rez = -ENODEV;
@@ -726,11 +704,13 @@ int esas2r_resume(struct pci_dev *pdev)
 	}
 
 error_exit:
-	esas2r_log_dev(ESAS2R_LOG_CRIT, &(pdev->dev), "esas2r_resume(): %d",
+	esas2r_log_dev(ESAS2R_LOG_CRIT, dev, "esas2r_resume(): %d",
 		       rez);
 	return rez;
 }
 
+SIMPLE_DEV_PM_OPS(esas2r_pm_ops, esas2r_suspend, esas2r_resume);
+
 bool esas2r_set_degraded_mode(struct esas2r_adapter *a, char *error_str)
 {
 	set_bit(AF_DEGRADED_MODE, &a->flags);
diff --git a/drivers/scsi/esas2r/esas2r_main.c b/drivers/scsi/esas2r/esas2r_main.c
index 7b49e2e9fcde..aab3ea580e6b 100644
--- a/drivers/scsi/esas2r/esas2r_main.c
+++ b/drivers/scsi/esas2r/esas2r_main.c
@@ -346,8 +346,7 @@ static struct pci_driver
 	.id_table	= esas2r_pci_table,
 	.probe		= esas2r_probe,
 	.remove		= esas2r_remove,
-	.suspend	= esas2r_suspend,
-	.resume		= esas2r_resume,
+	.driver.pm	= &esas2r_pm_ops,
 };
 
 static int esas2r_probe(struct pci_dev *pcid,
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
