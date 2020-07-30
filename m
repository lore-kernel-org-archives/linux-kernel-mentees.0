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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DA3C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 05:19:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FCFD2084D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 05:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNYeSPa5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FCFD2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1AFD987D9D;
	Thu, 30 Jul 2020 05:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9yR7gxoZMDUt; Thu, 30 Jul 2020 05:19:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 95CAF87D73;
	Thu, 30 Jul 2020 05:19:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C767C0050;
	Thu, 30 Jul 2020 05:19:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68E3BC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 05:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 525E087D9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 05:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N61hvdi-+T7n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 05:19:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B3FAE87D73
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 05:19:39 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id bh1so48258plb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 22:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EnGXeNbQwuYNZ4/SgA8a2g0/K9Xn2zkd8XxAO1wpPBE=;
 b=CNYeSPa5UHoQU/zAXoMxTvIy8LM9ZnpBrUa+u5uUMyQdzorRKQusWkM0WWRphxi5ru
 p/FmoF5qPGgJNNY0+EDETyed1MxEEDnBRCn9/qFltha0m+8igcWmCh9nFCRh3mRLf5qE
 oXYFuLxMrynBJjPTQ7xkCv/VoWYHHQ2CxG1MYDb+mDbsqpKjABOqr2615HF+D0k0Y0bq
 hwvXDejkhM7UM6Kq06SzRnTtf4aB1nJ4vOVO7tFo3BKYD0PajnvSPrWUBK29IIfPQCAQ
 blSwhF47KNibbIJ0e+vT7gwNsoX4dZds4/os/tKEW05Jbq9BhC9BWwcZUM8GY/o0iiOY
 5Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EnGXeNbQwuYNZ4/SgA8a2g0/K9Xn2zkd8XxAO1wpPBE=;
 b=pTlrPMIeExkOIP4mQyWAQFAFqIXgomXNQwvSQs9MLPt3ym9EtCkIK7jHF0NQjKSqeK
 z9x39EHP61BZvzADSYGSY5Nvh/D/Z0cnRW1l56hxgs7m3dJage1F2/AcZ3OtRWL8Qc11
 y6oAqGtOP4JcTjLMprYyE9QKqsd8yPwr58f/+94wDFnxms3nKnd40c8ujGi6gULxvAHH
 Uzt5Hdt783691HaMvyvPhxuzw//ZUbcGgV+Q5+/0GXiTVlZstX82KCPsJeTSViGbPqeS
 4RnAxcZlJm7BTfGfyKhdJQ3+7gn5oMjvm0gWl1KJlFshtZhOARmqrjUTg6BUOI+/sji6
 JpNg==
X-Gm-Message-State: AOAM531QNUN+aDAWQYm/IV9XlIVoJJJl2FMhBzJkwlP0XMAx4WVscKY4
 IMg3QLcsjCenziNIVU2kLGs=
X-Google-Smtp-Source: ABdhPJwjUlYjYmMWc8AL8fvrnaAOvzZZqXAtYVN5Q/5zg1fY1zOc8Bo7eLrzwvyLF10mdRA/NCC5WA==
X-Received: by 2002:a17:902:103:: with SMTP id
 3mr31556502plb.195.1596086379202; 
 Wed, 29 Jul 2020 22:19:39 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id 9sm4224025pfx.131.2020.07.29.22.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 22:19:38 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 30 Jul 2020 10:47:33 +0530
Message-Id: <20200730051733.113652-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] scsi: stex: use generic power
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
 drivers/scsi/stex.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/stex.c b/drivers/scsi/stex.c
index d4f10c0d813c..9500666b521a 100644
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
+static int stex_suspend(struct device *dev)
 {
-	struct st_hba *hba = pci_get_drvdata(pdev);
+	return stex_suspend_late(dev, PMSG_SUSPEND);
+}
+
+static int stex_hibernate(struct device *dev)
+{
+	return stex_suspend_late(dev, PMSG_HIBERNATE);
+}
+
+static int stex_freeze(struct device *dev)
+{
+	return stex_suspend_late(dev, PMSG_FREEZE);
+}
+
+static int stex_resume(struct device *dev)
+{
+	struct st_hba *hba = dev_get_drvdata(dev);
 
 	hba->mu_status = MU_STATE_STARTING;
 	stex_handshake(hba);
@@ -2000,14 +2015,22 @@ static int stex_halt(struct notifier_block *nb, unsigned long event, void *buf)
 }
 MODULE_DEVICE_TABLE(pci, stex_pci_tbl);
 
+static const struct dev_pm_ops stex_pm_ops = {
+	.suspend	= stex_suspend,
+	.resume		= stex_resume,
+	.freeze		= stex_freeze,
+	.thaw		= stex_resume,
+	.poweroff	= stex_hibernate,
+	.restore	= stex_resume,
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
