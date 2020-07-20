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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE1FC433F2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 15:59:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 041F52065E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 15:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qo6EmHJ6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 041F52065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B612685BD5;
	Mon, 20 Jul 2020 15:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6bXGfPruoAn; Mon, 20 Jul 2020 15:59:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BAE0085683;
	Mon, 20 Jul 2020 15:59:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A17B9C089F;
	Mon, 20 Jul 2020 15:59:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E294C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 15:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EA2AC87C9C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 15:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YxbC8f27r1Vs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 15:59:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7523287C88
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 15:59:19 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w17so8848103ply.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 08:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kWWiPDDkLSZWJniasWbkxAHeh1UEHqV+0VQVWXHKxgs=;
 b=Qo6EmHJ6FLUfuIlTjBgcG21BsVpmr0VH7Yb9ut6xUm5kKcC7tNm1SRbu1hUp2is0oE
 K59szg3P18X3twG5h+fit41FGJiiWGW3Rde8SzsMeKAMAKtvniR4JSaUWZJLEcXHoyny
 qh4ictM9zpYPRp038Wc2f3nxc1L+bCMf7h4p3Ze2esZ0W3Uok+6FtRf4S/y4Tgb6Lp4Z
 62mmy+MRGeU4GC86mlAlzST/Mce2MWY2PYfR/52gqXpgs0vn+Uc4DzgydPuSYJ5OoxIk
 mzDIe/EQ9IWaoQXXeJQolHf5vta+KCvwGVtUKjfcOneFuvsWKlci35yLWAC5P0D2wN5u
 pXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kWWiPDDkLSZWJniasWbkxAHeh1UEHqV+0VQVWXHKxgs=;
 b=fa3g9An/ss8qGPGgCY6IaKhN++RXFQ8I55Xt0RRmxNYafZ00A8OEAIRCat4dMf6hEb
 25V1IooKqx5rXKP+fJtUY3de18WYt/0Aq48yCNfbZEk57u5ZSWpE9xjh3kKwhz484h3o
 DgwEn4FWNo+/yHUu1Yf6rHm5oWtB81km0XF6H3ow1fwhSQQ7xianieUcne2C/24pydk/
 2DEtB4tl9C5CDluIozgHJ4a2Y4TmCv+xn7gyel+GckHJAT1o3D8HRiWnKsSO2l3o/2ek
 tlbyp79IMQnT7w/7xENB+vjKNwEUeuKR0ZTLHW8AxA94kDGlZyvuxd4AhQxxc5Tn/+5E
 Ldmg==
X-Gm-Message-State: AOAM53078BQp1hewewgg5v83QRKp7+UHSFnhlq3dc4xKpLH8xOS2Jja3
 pZ2DxSBtwKfdtb9FtqEzO0k=
X-Google-Smtp-Source: ABdhPJz3fHLBx5cpEHrrDHL4MX3LASDS4caNtL6Cv+gi9ULwVLHjXytlSxHbCIeKpNkAi0+toz0k+A==
X-Received: by 2002:a17:90b:234f:: with SMTP id ms15mr55698pjb.7.1595260758978; 
 Mon, 20 Jul 2020 08:59:18 -0700 (PDT)
Received: from varodek.localdomain ([110.225.71.189])
 by smtp.gmail.com with ESMTPSA id s6sm17368157pfd.20.2020.07.20.08.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 08:59:18 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Mon, 20 Jul 2020 21:27:15 +0530
Message-Id: <20200720155714.714114-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-spi@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] spi: spi-topcliff-pch: use
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

Drivers using legacy PM have to manage PCI states and device's PM states
themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of
above mentioned, device-independent, jobs.

This driver makes use of PCI helper functions like
pci_save/restore_state(), pci_enable/disable_device(), pci_enable_wake()
and pci_set_power_state() to do required operations. In generic mode, they
are no longer needed.

Change function parameter in both .suspend() and .resume() to
"struct device*" type. Use dev_get_drvdata() to get drv data.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/spi/spi-topcliff-pch.c | 51 +++++++++-------------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

diff --git a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pch.c
index d7ea6af74743..281a90f1b5d8 100644
--- a/drivers/spi/spi-topcliff-pch.c
+++ b/drivers/spi/spi-topcliff-pch.c
@@ -1631,64 +1631,39 @@ static void pch_spi_remove(struct pci_dev *pdev)
 	kfree(pd_dev_save);
 }
 
-#ifdef CONFIG_PM
-static int pch_spi_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused pch_spi_suspend(struct device *dev)
 {
-	int retval;
-	struct pch_pd_dev_save *pd_dev_save = pci_get_drvdata(pdev);
+	struct pch_pd_dev_save *pd_dev_save = dev_get_drvdata(dev);
 
-	dev_dbg(&pdev->dev, "%s ENTRY\n", __func__);
+	dev_dbg(dev, "%s ENTRY\n", __func__);
 
 	pd_dev_save->board_dat->suspend_sts = true;
 
-	/* save config space */
-	retval = pci_save_state(pdev);
-	if (retval == 0) {
-		pci_enable_wake(pdev, PCI_D3hot, 0);
-		pci_disable_device(pdev);
-		pci_set_power_state(pdev, PCI_D3hot);
-	} else {
-		dev_err(&pdev->dev, "%s pci_save_state failed\n", __func__);
-	}
-
-	return retval;
+	return 0;
 }
 
-static int pch_spi_resume(struct pci_dev *pdev)
+static int __maybe_unused pch_spi_resume(struct device *dev)
 {
-	int retval;
-	struct pch_pd_dev_save *pd_dev_save = pci_get_drvdata(pdev);
-	dev_dbg(&pdev->dev, "%s ENTRY\n", __func__);
+	struct pch_pd_dev_save *pd_dev_save = dev_get_drvdata(dev);
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
+	dev_dbg(dev, "%s ENTRY\n", __func__);
 
-	retval = pci_enable_device(pdev);
-	if (retval < 0) {
-		dev_err(&pdev->dev,
-			"%s pci_enable_device failed\n", __func__);
-	} else {
-		pci_enable_wake(pdev, PCI_D3hot, 0);
+	device_wakeup_disable(dev);
 
-		/* set suspend status to false */
-		pd_dev_save->board_dat->suspend_sts = false;
-	}
+	/* set suspend status to false */
+	pd_dev_save->board_dat->suspend_sts = false;
 
-	return retval;
+	return 0;
 }
-#else
-#define pch_spi_suspend NULL
-#define pch_spi_resume NULL
 
-#endif
+static SIMPLE_DEV_PM_OPS(pch_spi_pm_ops, pch_spi_suspend, pch_spi_resume);
 
 static struct pci_driver pch_spi_pcidev_driver = {
 	.name = "pch_spi",
 	.id_table = pch_spi_pcidev_id,
 	.probe = pch_spi_probe,
 	.remove = pch_spi_remove,
-	.suspend = pch_spi_suspend,
-	.resume = pch_spi_resume,
+	.driver.pm = &pch_spi_pm_ops,
 };
 
 static int __init pch_spi_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
