Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10431C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 10:18:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAEE520809
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 10:18:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1090J5l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAEE520809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 955F485621;
	Thu, 30 Jul 2020 10:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hupNOhnooK2K; Thu, 30 Jul 2020 10:18:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 98EF08034E;
	Thu, 30 Jul 2020 10:18:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FC7CC0050;
	Thu, 30 Jul 2020 10:18:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B861FC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 10:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A760287E1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 10:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiMlxtzc4SZL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 10:18:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3248F865F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 10:18:44 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t10so8314866plz.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 03:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wfvGgVXPE//hQYiCJ3Y28E2/v0p7YSlsyuVMVmFQhXI=;
 b=P1090J5lZ/jfkYaE5ZKSv1PwN+iPKcSAuV3/SGSLcuTP1BtTfqjBuaHOTWCCt9PyAb
 gqZJGBwC/RUbq8fiAvrXge70fnhp76kNeWXJnus0Zds2LPPusFp/P1Wv14MwcVgQP7OV
 uhRoSZpMQa0gQtWtVCjPWngBfeja1LipkB5cEVyWrmlqlc145r1jP/JeUp6wpoSR1ad9
 V+fzMsM5pZWxFcmAKQ0KSlKgkItZ2evK5XLi51NVZQcu7RdjzxnZY0gH+DhsLu27Gtrz
 KjIJ/6ho83UYIE7Uy0mafzuXLGBwKDv2IHngxTnQWVbflS4NOVxZchYoO55wiYG8iRKX
 J6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wfvGgVXPE//hQYiCJ3Y28E2/v0p7YSlsyuVMVmFQhXI=;
 b=HfaRZUy1cgKe+nyg0dtrn8N3G4mjIz5Zy9GQoMG0k2Otc5YCN5huMazAhm/3dIto8s
 WddOY/HjEc5Ytfuz63Rw7CzluzGPjpmmreHwz7XrMgFg54klvGQlqwi6P6EcQOkjcZmS
 0Vhl0cxY7cf9xMtqAbdKyIbWF8Lsl0ELoK8RPNKiR/v0DWTCCNCKZ1Na+htzopNQQO4o
 tExeVbSMDNWG1ETdHTAqTXiySjmLaGo61yW+Yo746YOtWn7y/2OXUPIgOtn7+GnVh2YL
 yRDt/tIPBYa0tkCQOBWc5EmrJu096dVjmDnEJBtei8VoxiZmYnJrsGMqitDubm1GXQ2a
 m/wQ==
X-Gm-Message-State: AOAM532/9MFQ/5tSnYQjEHhn4sqWHGpZYUc7t12d11LJoBsakDoLYh+h
 mjT1Nxlmpi36cCAGslIzzdA=
X-Google-Smtp-Source: ABdhPJxpg6lp4/yuJVJsGNsNy/UKwch0Tz803qNvlZsB90/Bhx8andlF4XkhRn8gU3mnFkWx0P+i1Q==
X-Received: by 2002:a17:902:8491:: with SMTP id
 c17mr31587981plo.262.1596104323577; 
 Thu, 30 Jul 2020 03:18:43 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id p5sm5456870pgi.83.2020.07.30.03.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 03:18:42 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 30 Jul 2020 15:46:58 +0530
Message-Id: <20200730101658.576205-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2] scsi: stex: use generic power
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
 drivers/scsi/stex.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/stex.c b/drivers/scsi/stex.c
index d4f10c0d813c..5ef6f3cbac11 100644
--- a/drivers/scsi/stex.c
+++ b/drivers/scsi/stex.c
@@ -1972,9 +1972,9 @@ static int stex_choice_sleep_mic(struct st_hba *hba, pm_message_t state)
 	}
 }
 
-static int stex_suspend(struct pci_dev *pdev, pm_message_t state)
+static int stex_suspend_late(struct device *dev, pm_message_t state)
 {
-	struct st_hba *hba = pci_get_drvdata(pdev);
+	struct st_hba *hba = dev_get_drvdata(dev);
 
 	if ((hba->cardtype == st_yel || hba->cardtype == st_P3)
 		&& hba->supports_pm == 1)
@@ -1984,9 +1984,24 @@ static int stex_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-static int stex_resume(struct pci_dev *pdev)
+static int __maybe_unused stex_suspend(struct device *dev)
 {
-	struct st_hba *hba = pci_get_drvdata(pdev);
+	return stex_suspend_late(dev, PMSG_SUSPEND);
+}
+
+static int __maybe_unused stex_hibernate(struct device *dev)
+{
+	return stex_suspend_late(dev, PMSG_HIBERNATE);
+}
+
+static int __maybe_unused stex_freeze(struct device *dev)
+{
+	return stex_suspend_late(dev, PMSG_FREEZE);
+}
+
+static int __maybe_unused stex_resume(struct device *dev)
+{
+	struct st_hba *hba = dev_get_drvdata(dev);
 
 	hba->mu_status = MU_STATE_STARTING;
 	stex_handshake(hba);
@@ -2000,14 +2015,24 @@ static int stex_halt(struct notifier_block *nb, unsigned long event, void *buf)
 }
 MODULE_DEVICE_TABLE(pci, stex_pci_tbl);
 
+static const struct dev_pm_ops stex_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend	= stex_suspend,
+	.resume		= stex_resume,
+	.freeze		= stex_freeze,
+	.thaw		= stex_resume,
+	.poweroff	= stex_hibernate,
+	.restore	= stex_resume,
+#endif
+};
+
 static struct pci_driver stex_pci_driver = {
 	.name		= DRV_NAME,
 	.id_table	= stex_pci_tbl,
 	.probe		= stex_probe,
 	.remove		= stex_remove,
 	.shutdown	= stex_shutdown,
-	.suspend	= stex_suspend,
-	.resume		= stex_resume,
+	.driver.pm	= &stex_pm_ops,
 };
 
 static int __init stex_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
