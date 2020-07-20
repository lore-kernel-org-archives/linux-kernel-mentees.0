Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B655CC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 15:09:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AFC822B4E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 15:09:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pF2xi4w6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AFC822B4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 47AFC2000B;
	Mon, 20 Jul 2020 15:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMltBJmkUkoQ; Mon, 20 Jul 2020 15:09:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 46E1D20004;
	Mon, 20 Jul 2020 15:09:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35665C089F;
	Mon, 20 Jul 2020 15:09:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A27A0C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 15:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9DB4F84E0C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 15:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xghhB9NW3J3u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 15:09:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 13543869C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 15:09:40 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id n5so10412901pgf.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2mRU9DML+WlUjG+x0KgX1XxnekTukVWP0rhuq7mq9o=;
 b=pF2xi4w6gHUB6KW6oVO8ioBNFr4YuhVG9jm+hW8Zh4OrXm28Dd17IN8/kmz4H2P4oc
 ISGLz5n0zY0gA4ad2Nx38ctTepSAW3OALHb1zN8K6Foel9279E6gvQzFhrN82mLQEUZx
 JtTx7YTY52uGnM7rUnkEKUNfZ5yXRDy+6YhHrJT25y0ZJp+NFT+LL0kSBcOM/HN1FHI2
 7rKtd/WT8rLzBvDXhQRMK6ZbtG+d6L2A3iOCg7XUWIB+Qu4xFimDWE0vVwJjo/C5Z7bA
 qnFxGBBONqB9BmFEE4Ur0rP0MBBcQcngNzyZVAUsoN4RkyGlSQwe/Ba/aWdcLt2yeJwY
 cw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2mRU9DML+WlUjG+x0KgX1XxnekTukVWP0rhuq7mq9o=;
 b=rUwwWK/9KeWbeucJOXrZ75RbJiIbHDwYGqDa8wdaJUV+nNeM/qdRfCTStpE+gu4vwr
 2Gk7DTIdDcmN/wFarFTr3kfxHdWHQpxTEHkblbUOyzrRO5IDvdnNjABYVQs4ryLwqftd
 FhW9AiPgQe2zvBfnBnldKt1WdQtp8hdmzdys428ORn3t74i0+4A/L+Mdk5+TMQvUmlVY
 xSnOEBFO13GBT0bXPe5x1+niIdQs6WbyLnDgiJbi1rr2fYg1DkCj35OxOmt/Kx6ACdON
 9cFpIueM5iZ/7oQAdxyjO7jooHssOS4YbgZ6Vx5NISOesh7X1thvKh7rvUi2ai//YdW0
 XQ/w==
X-Gm-Message-State: AOAM533/gBDdRhY+370l7RjEdzlXAxDvCQq2mMMOV5s3t2g6zuKAZt8j
 6W2D4OpwOJVKbmWqWWZTdL4=
X-Google-Smtp-Source: ABdhPJws8JrM5TULRLzImq9oyGdayyre0j2HUv0+tiud6sIC2oAR/xrn7Ia6p4g9JrdCMX4x7qpP9Q==
X-Received: by 2002:aa7:9155:: with SMTP id 21mr19004277pfi.306.1595257779413; 
 Mon, 20 Jul 2020 08:09:39 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id f207sm17723624pfa.107.2020.07.20.08.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 08:09:38 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Mon, 20 Jul 2020 20:37:16 +0530
Message-Id: <20200720150715.624520-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux1394-devel@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] firewire: ohci: use generic power
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

Drivers using legacy PM have to manage PCI states and device's PM states
themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of
above mentioned, device-independent, jobs.

This driver makes use of PCI helper functions like
pci_save/restore_state(), pci_disable_device() and pci_set_power_state() to
do required operations. In generic mode, they are no longer needed.

Change function parameter in both .suspend() and .resume() to
"struct device*" type. Use to_pci_dev() to get "struct pci_dev*" variable.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/firewire/ohci.c | 43 ++++++++++++-----------------------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 54fdc39cd0bc..2d19db5e81a1 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -3169,8 +3169,7 @@ static int ohci_set_iso_channels(struct fw_iso_context *base, u64 *channels)
 	return ret;
 }
 
-#ifdef CONFIG_PM
-static void ohci_resume_iso_dma(struct fw_ohci *ohci)
+static void __maybe_unused ohci_resume_iso_dma(struct fw_ohci *ohci)
 {
 	int i;
 	struct iso_context *ctx;
@@ -3187,7 +3186,6 @@ static void ohci_resume_iso_dma(struct fw_ohci *ohci)
 			ohci_start_iso(&ctx->base, 0, ctx->sync, ctx->tags);
 	}
 }
-#endif
 
 static int queue_iso_transmit(struct iso_context *ctx,
 			      struct fw_iso_packet *packet,
@@ -3793,39 +3791,24 @@ static void pci_remove(struct pci_dev *dev)
 	dev_notice(&dev->dev, "removed fw-ohci device\n");
 }
 
-#ifdef CONFIG_PM
-static int pci_suspend(struct pci_dev *dev, pm_message_t state)
+static int __maybe_unused pci_suspend(struct device *dev)
 {
-	struct fw_ohci *ohci = pci_get_drvdata(dev);
-	int err;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct fw_ohci *ohci = pci_get_drvdata(pdev);
 
 	software_reset(ohci);
-	err = pci_save_state(dev);
-	if (err) {
-		ohci_err(ohci, "pci_save_state failed\n");
-		return err;
-	}
-	err = pci_set_power_state(dev, pci_choose_state(dev, state));
-	if (err)
-		ohci_err(ohci, "pci_set_power_state failed with %d\n", err);
-	pmac_ohci_off(dev);
+	pmac_ohci_off(pdev);
 
 	return 0;
 }
 
-static int pci_resume(struct pci_dev *dev)
+static int __maybe_unused pci_resume(struct device *dev)
 {
-	struct fw_ohci *ohci = pci_get_drvdata(dev);
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct fw_ohci *ohci = pci_get_drvdata(pdev);
 	int err;
 
-	pmac_ohci_on(dev);
-	pci_set_power_state(dev, PCI_D0);
-	pci_restore_state(dev);
-	err = pci_enable_device(dev);
-	if (err) {
-		ohci_err(ohci, "pci_enable_device failed\n");
-		return err;
-	}
+	pmac_ohci_on(pdev);
 
 	/* Some systems don't setup GUID register on resume from ram  */
 	if (!reg_read(ohci, OHCI1394_GUIDLo) &&
@@ -3842,7 +3825,6 @@ static int pci_resume(struct pci_dev *dev)
 
 	return 0;
 }
-#endif
 
 static const struct pci_device_id pci_table[] = {
 	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_FIREWIRE_OHCI, ~0) },
@@ -3851,15 +3833,14 @@ static const struct pci_device_id pci_table[] = {
 
 MODULE_DEVICE_TABLE(pci, pci_table);
 
+static SIMPLE_DEV_PM_OPS(pci_pm_ops, pci_suspend, pci_resume);
+
 static struct pci_driver fw_ohci_pci_driver = {
 	.name		= ohci_driver_name,
 	.id_table	= pci_table,
 	.probe		= pci_probe,
 	.remove		= pci_remove,
-#ifdef CONFIG_PM
-	.resume		= pci_resume,
-	.suspend	= pci_suspend,
-#endif
+	.driver.pm	= &pci_pm_ops,
 };
 
 static int __init fw_ohci_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
