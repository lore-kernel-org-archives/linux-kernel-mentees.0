Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC7BC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 08:17:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D6DB2335A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 08:17:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jP/gf47e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D6DB2335A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5272389396;
	Mon, 29 Jun 2020 08:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z4lBpBb0cR6Z; Mon, 29 Jun 2020 08:17:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C63FE89393;
	Mon, 29 Jun 2020 08:17:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B558FC0865;
	Mon, 29 Jun 2020 08:17:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDC93C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C975B887F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8wb7zH6124b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5774A887EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:48 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id c1so444534pja.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 01:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BuikRCWls/1715AYcrraFB3A4+eL6QoET64hwm9dIIo=;
 b=jP/gf47eOAWCydT0MD5J/MqFLIRfzGNtbv40edfut0G47CNTlMQkGiwDTp8xadJX4m
 D0ShTR3QHMoyP4xFqKl6nb+ZPOSRDBgEhhTYvvSt5M+RNSKIk3xY0J/bTlyeOnbe9KXn
 RiStoGsGpw4efhK8fTVYZkT4za65116Fagz+kiU+Xdf4vhkcZ2p61i8n4wuI4gRPRpvG
 tRp+Gtgfl/ZgR2Op/u0RByKENB6mlWeg6AodbP/0TUMtDvEHSquIMc7JFv28XiF1zWxb
 4AIdYlbgOOtpFD7JY1NyI55tClHbn8OCiK9MuBaINVMawfj3E2oIaw2650c5P8+MeHOi
 rFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BuikRCWls/1715AYcrraFB3A4+eL6QoET64hwm9dIIo=;
 b=TKvPPBR35VyZfwrlaiTAAEsdl6h1Lx5d4C+qTnmmhbfWfnLJl5ydHrau2ytxORWGxb
 CwoZvDmijhFyI7F0uqz3Wkfl4iLQdj9e+1n0oDOmjSFY4Jy2hFhWEci/azHNUdiO5vFT
 uw41f081be69F8V3Z4nydGG1NTiZoL8btjN5KosQABtbYtN5T5eo1UWcKE4bkBV4hal/
 T6/LoR5RcC98H65+lZoAMAAAGbE8HJ18t88sarUvNL6myV5yphYWsRMc9VDxNAFfkwMu
 CXOaJQXVMXAhI1Bw3GlYigAfXhZgHJVcHJUbQLYC/LrLdk+mN4Uk1ZWa5D6GBM3TuujC
 rmKw==
X-Gm-Message-State: AOAM530o+j38AIocXKUux1LEJ1TgVY31yZHHUzs3/FcNVmVDD7e105vU
 EKRIIQfDV9mVh2TUrlwz6H0=
X-Google-Smtp-Source: ABdhPJxnJPlt/8JXN+pUfZVG1FIXk17uecrD76ia3WS3D9c5PMOoCFl1Z5akYQn/d+t/mhUxZgTk5w==
X-Received: by 2002:a17:90a:304d:: with SMTP id
 q13mr16206436pjl.73.1593418667901; 
 Mon, 29 Jun 2020 01:17:47 -0700 (PDT)
Received: from varodek.localdomain ([106.210.40.90])
 by smtp.gmail.com with ESMTPSA id co1sm3345154pjb.34.2020.06.29.01.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 01:17:47 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@gmail.com>, Alex Dubov <oakad@yahoo.com>
Date: Mon, 29 Jun 2020 13:45:31 +0530
Message-Id: <20200629081531.214734-6-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629081531.214734-1-vaibhavgupta40@gmail.com>
References: <20200629081531.214734-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 5/5] misc/pch_phub.c: use generic
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

Drivers should not use legacy power management as they have to manage power
states and related operations, for the device, themselves. This driver was
handling them with the help of PCI helper functions like
pci_save/restore_state(), pci_enable/disable_device(), etc.

With generic PM, all essentials will be handled by the PCI core. Driver
needs to do only device-specific operations.

The driver was also using pci_enable_wake(...,..., 0) to disable wake. Use
device_wakeup_disable() instead. It was also saving device register
configuration using pch_phub_save/restore_reg_conf() which is not
recommended.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/misc/pch_phub.c | 48 ++++++++---------------------------------
 1 file changed, 9 insertions(+), 39 deletions(-)

diff --git a/drivers/misc/pch_phub.c b/drivers/misc/pch_phub.c
index 60828af7506a..9321d4239932 100644
--- a/drivers/misc/pch_phub.c
+++ b/drivers/misc/pch_phub.c
@@ -147,9 +147,8 @@ static void pch_phub_read_modify_write_reg(struct pch_phub_reg *chip,
 	iowrite32(((ioread32(reg_addr) & ~mask)) | data, reg_addr);
 }
 
-#ifdef CONFIG_PM
 /* pch_phub_save_reg_conf - saves register configuration */
-static void pch_phub_save_reg_conf(struct pci_dev *pdev)
+static void __maybe_unused pch_phub_save_reg_conf(struct pci_dev *pdev)
 {
 	unsigned int i;
 	struct pch_phub_reg *chip = pci_get_drvdata(pdev);
@@ -210,7 +209,7 @@ static void pch_phub_save_reg_conf(struct pci_dev *pdev)
 }
 
 /* pch_phub_restore_reg_conf - restore register configuration */
-static void pch_phub_restore_reg_conf(struct pci_dev *pdev)
+static void __maybe_unused pch_phub_restore_reg_conf(struct pci_dev *pdev)
 {
 	unsigned int i;
 	struct pch_phub_reg *chip = pci_get_drvdata(pdev);
@@ -270,7 +269,6 @@ static void pch_phub_restore_reg_conf(struct pci_dev *pdev)
 	if ((chip->ioh_type == 2) || (chip->ioh_type == 4))
 		iowrite32(chip->funcsel_reg, p + FUNCSEL_REG_OFFSET);
 }
-#endif
 
 /**
  * pch_phub_read_serial_rom() - Reading Serial ROM
@@ -835,48 +833,19 @@ static void pch_phub_remove(struct pci_dev *pdev)
 	kfree(chip);
 }
 
-#ifdef CONFIG_PM
-
-static int pch_phub_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused pch_phub_suspend(struct device *dev_d)
 {
-	int ret;
-
-	pch_phub_save_reg_conf(pdev);
-	ret = pci_save_state(pdev);
-	if (ret) {
-		dev_err(&pdev->dev,
-			" %s -pci_save_state returns %d\n", __func__, ret);
-		return ret;
-	}
-	pci_enable_wake(pdev, PCI_D3hot, 0);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
+	device_wakeup_disable(dev_d);
 
 	return 0;
 }
 
-static int pch_phub_resume(struct pci_dev *pdev)
+static int __maybe_unused pch_phub_resume(struct device *dev_d)
 {
-	int ret;
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	ret = pci_enable_device(pdev);
-	if (ret) {
-		dev_err(&pdev->dev,
-		"%s-pci_enable_device failed(ret=%d) ", __func__, ret);
-		return ret;
-	}
-
-	pci_enable_wake(pdev, PCI_D3hot, 0);
-	pch_phub_restore_reg_conf(pdev);
+	device_wakeup_disable(dev_d);
 
 	return 0;
 }
-#else
-#define pch_phub_suspend NULL
-#define pch_phub_resume NULL
-#endif /* CONFIG_PM */
 
 static const struct pci_device_id pch_phub_pcidev_id[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_PCH1_PHUB),       1,  },
@@ -888,13 +857,14 @@ static const struct pci_device_id pch_phub_pcidev_id[] = {
 };
 MODULE_DEVICE_TABLE(pci, pch_phub_pcidev_id);
 
+static SIMPLE_DEV_PM_OPS(pch_phub_pm_ops, pch_phub_suspend, pch_phub_resume);
+
 static struct pci_driver pch_phub_driver = {
 	.name = "pch_phub",
 	.id_table = pch_phub_pcidev_id,
 	.probe = pch_phub_probe,
 	.remove = pch_phub_remove,
-	.suspend = pch_phub_suspend,
-	.resume = pch_phub_resume
+	.driver.pm = &pch_phub_pm_ops,
 };
 
 module_pci_driver(pch_phub_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
