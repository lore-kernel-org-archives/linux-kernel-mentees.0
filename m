Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4641C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 11:11:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07782075F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 11:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vVwDjUUI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B07782075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 81611862CA;
	Thu, 30 Jul 2020 11:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SL7xDHP6sXM; Thu, 30 Jul 2020 11:11:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0992C861BC;
	Thu, 30 Jul 2020 11:11:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0F85C004F;
	Thu, 30 Jul 2020 11:11:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F29ADC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 11:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CEC792051A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 11:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2KahfkUHyIF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 11:11:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id AC9FD20519
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 11:11:02 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id t15so4186972pjq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ae96SR23iZeBLSBCoLIaAGm/kTSoCvrW0+UYQgfK9PA=;
 b=vVwDjUUI8QVtGmGOzrkxP9OugoCgdsctYMdsbBmFGJLK1yMhi9zeY5aH3Vy6IEtcqF
 VaqmPddg6vM9AtB69G34lkcF5WbPBB5WJWPLS6PYB6/rIGXgeSavm2/RA+QxzJ5kH26E
 wcd7Dw8pYssor/HcG6JZYfYdBbyua0Zd4fg8flNkOgTXe22Tqqm0Ubdi7F1+iu2m++1i
 KqBhxTzsLNYuokT0vh/X7SeOMlbLflLZ9vl7kl78wwzImunjjjjb/8lrvBvDfGR52kRH
 jvwBrq1JGyAzmMnYruGdOMR4ge8kfTS3k/ZPPwpsA2MQ+w4XLW5JeTj5ieoSrnb5l4YW
 zcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ae96SR23iZeBLSBCoLIaAGm/kTSoCvrW0+UYQgfK9PA=;
 b=oGVOFR6VfIQBTbW4hmCLFVdIMdwtsgGVSwuXNeGpbSHh+1jj9tb7heJ8aFv5lnCJ1t
 SkWsa05iG94hajisF73zxwBSXRZtf/04njZJabQ3ZnBFmnjSBwQfiJYJFKVH6eVP6ipQ
 BjM0zdV1jvzxAqTxntHFqg/L+j5yP4Zl4RJu6A6+c840okpyS9fCUXKdRy+07w1nhliU
 ZKFTCflxojcTzxRQq1B7yOVg3G+AlkcRvvIBeslWHc9jyx4E57In9hQrSvq8gRTZ8ZUk
 DcSXN2ookwJXA/81yu2boRsgCwRWhydOlYpRfm5phNIc8EYY4JB7vj4UEjQEEaqtKPLn
 0TXg==
X-Gm-Message-State: AOAM532Tw4SqZi4kz/KHPL+hlmzy5cZ6tjMReu2afSaXNhb6uQTz85rF
 yWZvHg0b7xzGrZaMoRSIQT8=
X-Google-Smtp-Source: ABdhPJyu9imbhe+saOmZcAMN5MLeoXerEyGeCx7iwEx2yngQKrOHY5GyuhjSg8RAG0NjyyViO3LBQw==
X-Received: by 2002:a63:1406:: with SMTP id u6mr33350183pgl.108.1596107462192; 
 Thu, 30 Jul 2020 04:11:02 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id i67sm5888019pfg.13.2020.07.30.04.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 04:11:01 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Don Brace <don.brace@microsemi.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 30 Jul 2020 16:39:30 +0530
Message-Id: <20200730110930.664486-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730070233.221488-1-vaibhavgupta40@gmail.com>
References: <20200730070233.221488-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] scsi: smartpqi: use generic power
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
 drivers/scsi/smartpqi/smartpqi_init.c | 44 +++++++++++++++++++--------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index cd157f11eb22..7061bd26897a 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -8059,11 +8059,11 @@ static void pqi_process_module_params(void)
 	pqi_process_lockup_action_param();
 }
 
-static __maybe_unused int pqi_suspend(struct pci_dev *pci_dev, pm_message_t state)
+static int pqi_suspend_late(struct device *dev, pm_message_t state)
 {
 	struct pqi_ctrl_info *ctrl_info;
 
-	ctrl_info = pci_get_drvdata(pci_dev);
+	ctrl_info = dev_get_drvdata(dev);
 
 	pqi_disable_events(ctrl_info);
 	pqi_cancel_update_time_worker(ctrl_info);
@@ -8081,20 +8081,33 @@ static __maybe_unused int pqi_suspend(struct pci_dev *pci_dev, pm_message_t stat
 	if (state.event == PM_EVENT_FREEZE)
 		return 0;
 
-	pci_save_state(pci_dev);
-	pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
-
 	ctrl_info->controller_online = false;
 	ctrl_info->pqi_mode_enabled = false;
 
 	return 0;
 }
 
-static __maybe_unused int pqi_resume(struct pci_dev *pci_dev)
+static __maybe_unused int pqi_suspend(struct device *dev)
+{
+	return pqi_suspend_late(dev, PMSG_SUSPEND);
+}
+
+static __maybe_unused int pqi_hibernate(struct device *dev)
+{
+	return pqi_suspend_late(dev, PMSG_HIBERNATE);
+}
+
+static __maybe_unused int pqi_freeze(struct device *dev)
+{
+	return pqi_suspend_late(dev, PMSG_FREEZE);
+}
+
+static __maybe_unused int pqi_resume(struct device *dev)
 {
 	int rc;
 	struct pqi_ctrl_info *ctrl_info;
 
+	struct pci_dev *pci_dev = to_pci_dev(dev);
 	ctrl_info = pci_get_drvdata(pci_dev);
 
 	if (pci_dev->current_state != PCI_D0) {
@@ -8115,9 +8128,6 @@ static __maybe_unused int pqi_resume(struct pci_dev *pci_dev)
 		return 0;
 	}
 
-	pci_set_power_state(pci_dev, PCI_D0);
-	pci_restore_state(pci_dev);
-
 	return pqi_ctrl_init_resume(ctrl_info);
 }
 
@@ -8480,16 +8490,24 @@ static const struct pci_device_id pqi_pci_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, pqi_pci_id_table);
 
+static const struct dev_pm_ops pqi_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend = pqi_suspend,
+	.resume = pqi_resume,
+	.freeze = pqi_freeze,
+	.thaw = pqi_resume,
+	.poweroff = pqi_hibernate,
+	.restore = pqi_resume,
+#endif
+};
+
 static struct pci_driver pqi_pci_driver = {
 	.name = DRIVER_NAME_SHORT,
 	.id_table = pqi_pci_id_table,
 	.probe = pqi_pci_probe,
 	.remove = pqi_pci_remove,
 	.shutdown = pqi_shutdown,
-#if defined(CONFIG_PM)
-	.suspend = pqi_suspend,
-	.resume = pqi_resume,
-#endif
+	.driver.pm = &pqi_pm_ops
 };
 
 static int __init pqi_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
