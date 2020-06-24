Return-Path: <SRS0=qUvW=AF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD547C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 17:44:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86B3F2078A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 17:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIcfSoxu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86B3F2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2DB052042B;
	Wed, 24 Jun 2020 17:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tuwed6c75Pe8; Wed, 24 Jun 2020 17:44:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1D611203F4;
	Wed, 24 Jun 2020 17:44:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F33F1C088E;
	Wed, 24 Jun 2020 17:44:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00054C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D85AE203F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9MhplNG5ZZKA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:44:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 03D222033E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:44:05 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id q90so936026pjh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 10:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q66XZq5tVZm4QZtVyx5dc+LjQt4l89O1YXK816M5JxU=;
 b=YIcfSoxuvmqeZqXnEhrXfx8fYBfSN0iMclikZiiCR5tBm9HHdSFD5NRwBxD7MXShRC
 cr3NgoGcbi4Ej15eKzuVdIvJLODfLC1QSwxQK0qIsmbp5gTPZE5NAKYv/JhyvGA8Y7SI
 qJr/L+gTb5nv0ENifRNbg9tb1geqMfATxqBPw/btSLsnB7zp0xRzdpOT9AkXlw7gbq5k
 z17ITLqdTALlvqdpIP3lHIv62ifAxvAzlk35pZHvc4xdiIcA0geGw+6bEnElErTDiW8j
 Xnq0ekf1vYiA2Zlw5LltLYPk6cqo7a6m8hX5XPTZtYo42RrAWo03FR7ILKdNlSjmZ1CY
 qlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q66XZq5tVZm4QZtVyx5dc+LjQt4l89O1YXK816M5JxU=;
 b=FkSgdKvHdgAxqLsM+JjMyDvzMxs+GBYz1iPO+Ngj9ylckvWNRpCJHAlrAR4GSoxMCf
 PtLOSma9/FveHkWpHQP3VBPwhg8tVGO4QNpiNCug6hIsMdU/6G459sbyvHFXYtbCFW+G
 Ih0pE+t0hbunPQZebkIzzS7JTlt7p+JfYUHeE1cajHgCmRPNTWFmFUaTwKPuKt+IYl9n
 s0F8mkHPSWJZDMkSYlAzwGJ6ouCjPmgFL2rtyoFi7p0huMzitDg49PCoFcVxyFMZ/9V1
 pxo8b+J7ptGgQMum0EHmSChZ3uoeqwc1KjgJq2q/RuDnKPa4k5k12ZHF7AAWmm8vd3/D
 aFDQ==
X-Gm-Message-State: AOAM533jjL+P1yygBrtFZ4f3fG/yHEeUHwZbqB5EvIOLFETjFgZKKS36
 rdhrhz9Riqzulvt/gY54sZA=
X-Google-Smtp-Source: ABdhPJzpC59BuAnXFlgkDpWoDCbUH8H2Ug5AMUQQO3WqUefsyf5wUAv8yEorWyaV4YgvzGvawPvwPQ==
X-Received: by 2002:a17:902:7896:: with SMTP id
 q22mr29894001pll.237.1593020644480; 
 Wed, 24 Jun 2020 10:44:04 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id b71sm11079297pfb.125.2020.06.24.10.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 10:44:03 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, "David S. Miller" <davem@davemloft.net>,
 Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Wed, 24 Jun 2020 23:10:49 +0530
Message-Id: <20200624174048.64754-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1] orinoco: use generic power
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

With the support of generic PM callbacks, drivers no longer need to use
legacy .suspend() and .resume() in which they had to maintain PCI states
changes and device's power state themselves. The required operations are
done by PCI core.

PCI drivers are not expected to invoke PCI helper functions like
pci_save/restore_state(), pci_enable/disable_device(),
pci_set_power_state(), etc. Their tasks are completed by PCI core itself.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 .../intersil/orinoco/orinoco_nortel.c         |  3 +-
 .../wireless/intersil/orinoco/orinoco_pci.c   |  3 +-
 .../wireless/intersil/orinoco/orinoco_pci.h   | 32 ++++++-------------
 .../wireless/intersil/orinoco/orinoco_plx.c   |  3 +-
 .../wireless/intersil/orinoco/orinoco_tmd.c   |  3 +-
 5 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/intersil/orinoco/orinoco_nortel.c b/drivers/net/wireless/intersil/orinoco/orinoco_nortel.c
index 048693b6c6c2..96a03d10a080 100644
--- a/drivers/net/wireless/intersil/orinoco/orinoco_nortel.c
+++ b/drivers/net/wireless/intersil/orinoco/orinoco_nortel.c
@@ -290,8 +290,7 @@ static struct pci_driver orinoco_nortel_driver = {
 	.id_table	= orinoco_nortel_id_table,
 	.probe		= orinoco_nortel_init_one,
 	.remove		= orinoco_nortel_remove_one,
-	.suspend	= orinoco_pci_suspend,
-	.resume		= orinoco_pci_resume,
+	.driver.pm	= &orinoco_pci_pm_ops,
 };
 
 static char version[] __initdata = DRIVER_NAME " " DRIVER_VERSION
diff --git a/drivers/net/wireless/intersil/orinoco/orinoco_pci.c b/drivers/net/wireless/intersil/orinoco/orinoco_pci.c
index 4938a2208a37..f3c86b07b1b9 100644
--- a/drivers/net/wireless/intersil/orinoco/orinoco_pci.c
+++ b/drivers/net/wireless/intersil/orinoco/orinoco_pci.c
@@ -230,8 +230,7 @@ static struct pci_driver orinoco_pci_driver = {
 	.id_table	= orinoco_pci_id_table,
 	.probe		= orinoco_pci_init_one,
 	.remove		= orinoco_pci_remove_one,
-	.suspend	= orinoco_pci_suspend,
-	.resume		= orinoco_pci_resume,
+	.driver.pm	= &orinoco_pci_pm_ops,
 };
 
 static char version[] __initdata = DRIVER_NAME " " DRIVER_VERSION
diff --git a/drivers/net/wireless/intersil/orinoco/orinoco_pci.h b/drivers/net/wireless/intersil/orinoco/orinoco_pci.h
index 43f5b9f5a0b0..d49d940864b4 100644
--- a/drivers/net/wireless/intersil/orinoco/orinoco_pci.h
+++ b/drivers/net/wireless/intersil/orinoco/orinoco_pci.h
@@ -18,51 +18,37 @@ struct orinoco_pci_card {
 	void __iomem *attr_io;
 };
 
-#ifdef CONFIG_PM
-static int orinoco_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused orinoco_pci_suspend(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct orinoco_private *priv = pci_get_drvdata(pdev);
 
 	orinoco_down(priv);
 	free_irq(pdev->irq, priv);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, PCI_D3hot);
 
 	return 0;
 }
 
-static int orinoco_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused orinoco_pci_resume(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct orinoco_private *priv = pci_get_drvdata(pdev);
 	struct net_device *dev = priv->ndev;
 	int err;
 
-	pci_set_power_state(pdev, PCI_D0);
-	err = pci_enable_device(pdev);
-	if (err) {
-		printk(KERN_ERR "%s: pci_enable_device failed on resume\n",
-		       dev->name);
-		return err;
-	}
-	pci_restore_state(pdev);
-
 	err = request_irq(pdev->irq, orinoco_interrupt, IRQF_SHARED,
 			  dev->name, priv);
 	if (err) {
 		printk(KERN_ERR "%s: cannot re-allocate IRQ on resume\n",
 		       dev->name);
-		pci_disable_device(pdev);
 		return -EBUSY;
 	}
 
-	err = orinoco_up(priv);
-
-	return err;
+	return orinoco_up(priv);
 }
-#else
-#define orinoco_pci_suspend NULL
-#define orinoco_pci_resume NULL
-#endif
+
+static SIMPLE_DEV_PM_OPS(orinoco_pci_pm_ops,
+			 orinoco_pci_suspend,
+			 orinoco_pci_resume);
 
 #endif /* _ORINOCO_PCI_H */
diff --git a/drivers/net/wireless/intersil/orinoco/orinoco_plx.c b/drivers/net/wireless/intersil/orinoco/orinoco_plx.c
index 221352027779..16dada94c774 100644
--- a/drivers/net/wireless/intersil/orinoco/orinoco_plx.c
+++ b/drivers/net/wireless/intersil/orinoco/orinoco_plx.c
@@ -336,8 +336,7 @@ static struct pci_driver orinoco_plx_driver = {
 	.id_table	= orinoco_plx_id_table,
 	.probe		= orinoco_plx_init_one,
 	.remove		= orinoco_plx_remove_one,
-	.suspend	= orinoco_pci_suspend,
-	.resume		= orinoco_pci_resume,
+	.driver.pm	= &orinoco_pci_pm_ops,
 };
 
 static char version[] __initdata = DRIVER_NAME " " DRIVER_VERSION
diff --git a/drivers/net/wireless/intersil/orinoco/orinoco_tmd.c b/drivers/net/wireless/intersil/orinoco/orinoco_tmd.c
index 20ce569b8a43..9a9d335611ac 100644
--- a/drivers/net/wireless/intersil/orinoco/orinoco_tmd.c
+++ b/drivers/net/wireless/intersil/orinoco/orinoco_tmd.c
@@ -213,8 +213,7 @@ static struct pci_driver orinoco_tmd_driver = {
 	.id_table	= orinoco_tmd_id_table,
 	.probe		= orinoco_tmd_init_one,
 	.remove		= orinoco_tmd_remove_one,
-	.suspend	= orinoco_pci_suspend,
-	.resume		= orinoco_pci_resume,
+	.driver.pm	= &orinoco_pci_pm_ops,
 };
 
 static char version[] __initdata = DRIVER_NAME " " DRIVER_VERSION
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
