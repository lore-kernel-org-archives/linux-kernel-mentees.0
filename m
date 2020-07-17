Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2924AC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 08:10:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED65620829
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 08:10:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMnHL1YO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED65620829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CBB148809E;
	Fri, 17 Jul 2020 08:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwOdPY5Pzhvn; Fri, 17 Jul 2020 08:10:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E869C880BB;
	Fri, 17 Jul 2020 08:10:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6730C07FF;
	Fri, 17 Jul 2020 08:10:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C60DC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 08:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6650187DA2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 08:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRpq5vcMFVrz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 08:10:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B6D8A87D9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 08:10:36 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x8so5127684plm.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 01:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PZjzGiciE1mRdv57FSEZmpziMkegKz0PO+BIzmQwRfA=;
 b=VMnHL1YOb9YOEXXi/OnuLA/sSel2Odj47qKeawJDhqx1RAoLxMXt+Q//5VIxc6wnXp
 RZB6OdTw35/W1ERtFx9vBDPYJm6le1X5GVy9YmfUa6+19Nrcf2p+pXCSEAw0/0R1jNs1
 c2F0xbfbwL+wxsivT3czCVjRrqXbcCEjvvfbLVCBPDIIHS/KJ62ZMmwFx+tmSEjNSQC3
 cWwa3sHY95Axfuw5naqINQPuz49HDx4qo12KrZdVO85qzzjH4KUi2hVDrmqe0ddbUUsB
 OKsPeSHu5WhTmxUBFNn1/al/dt8/4U3Vpc7zX3Flchi8qnI+6h+ype58UYMzDzw8iQ2y
 f1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZjzGiciE1mRdv57FSEZmpziMkegKz0PO+BIzmQwRfA=;
 b=e61jMASwnWinTl6QD/eNseCQhv9OyZQvDTNs9peDBin7QEKGpfLkinzJqq9mPHhBDM
 E65dN9yZjXONfLR8ylL0cuTwFFaD/uMoAXnKPqOVKzcBZY8pBRrZlFa8HlLW1GcOymmd
 Z2CVQ+fMQk046dqhnoeMiP21Z3cB9vU0qZFizDyP3INPFJBLs0pCS3iEcRqhhHsFqdR3
 0uAUgkXfIGwRnZ10YHhhXJLkuT8vMv73gEXcGpHwNI4yfHifvw7d8ywxwyUyaUFQyeeg
 Ilg3agTzNh3o4uOInCTcc2h6LLTHsLoja3P3FRfF7CFQp40e3H4S+4FIUih1n4Keq4VL
 G+3w==
X-Gm-Message-State: AOAM530QdKfxgAbRJxt1m1Sm46UlE4I+ARvvoBs6tiB6zY6IXQC/wbJK
 i7paz5KYdbgxuO+xiaaYUMQ=
X-Google-Smtp-Source: ABdhPJyGKgakP3e2eFrh35aHdGLeSwy7yHiVg0bx3UuHraWqnM5wZiRGjyj0qHqCkCz5Dz583pnhTQ==
X-Received: by 2002:a17:90a:1901:: with SMTP id
 1mr9158692pjg.199.1594973436153; 
 Fri, 17 Jul 2020 01:10:36 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id d5sm1937296pju.15.2020.07.17.01.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 01:10:35 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Fri, 17 Jul 2020 13:39:08 +0530
Message-Id: <20200717080910.342741-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717080910.342741-1-vaibhavgupta40@gmail.com>
References: <20200717080910.342741-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 1/3] mtip32xx: use generic power
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
pci_save/restore_state(), pci_disable_device(), pcim_enable_device(),
pci_set_power_state() and pci_set_master() to do required operations. In
generic mode, they are no longer needed.

Change function parameter in both .suspend() and .resume() to
"struct device*" type. Use dev_get_drvdata() to get drv data.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/block/mtip32xx/mtip32xx.c | 54 +++++++------------------------
 1 file changed, 12 insertions(+), 42 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index f6bafa9a68b9..7d1280952b35 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -4246,14 +4246,13 @@ static void mtip_pci_remove(struct pci_dev *pdev)
  *	0  Success
  *	<0 Error
  */
-static int mtip_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
+static int __maybe_unused mtip_pci_suspend(struct device *dev)
 {
 	int rv = 0;
-	struct driver_data *dd = pci_get_drvdata(pdev);
+	struct driver_data *dd = dev_get_drvdata(dev);
 
 	if (!dd) {
-		dev_err(&pdev->dev,
-			"Driver private datastructure is NULL\n");
+		dev_err(dev, "Driver private datastructure is NULL\n");
 		return -EFAULT;
 	}
 
@@ -4261,21 +4260,8 @@ static int mtip_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
 
 	/* Disable ports & interrupts then send standby immediate */
 	rv = mtip_block_suspend(dd);
-	if (rv < 0) {
-		dev_err(&pdev->dev,
-			"Failed to suspend controller\n");
-		return rv;
-	}
-
-	/*
-	 * Save the pci config space to pdev structure &
-	 * disable the device
-	 */
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-
-	/* Move to Low power state*/
-	pci_set_power_state(pdev, PCI_D3hot);
+	if (rv < 0)
+		dev_err(dev, "Failed to suspend controller\n");
 
 	return rv;
 }
@@ -4287,42 +4273,25 @@ static int mtip_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
  *      0  Success
  *      <0 Error
  */
-static int mtip_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused mtip_pci_resume(struct device *dev)
 {
 	int rv = 0;
 	struct driver_data *dd;
 
-	dd = pci_get_drvdata(pdev);
+	dd = dev_get_drvdata(dev);
 	if (!dd) {
-		dev_err(&pdev->dev,
-			"Driver private datastructure is NULL\n");
+		dev_err(dev, "Driver private datastructure is NULL\n");
 		return -EFAULT;
 	}
 
-	/* Move the device to active State */
-	pci_set_power_state(pdev, PCI_D0);
-
-	/* Restore PCI configuration space */
-	pci_restore_state(pdev);
-
-	/* Enable the PCI device*/
-	rv = pcim_enable_device(pdev);
-	if (rv < 0) {
-		dev_err(&pdev->dev,
-			"Failed to enable card during resume\n");
-		goto err;
-	}
-	pci_set_master(pdev);
-
 	/*
 	 * Calls hbaReset, initPort, & startPort function
 	 * then enables interrupts
 	 */
 	rv = mtip_block_resume(dd);
 	if (rv < 0)
-		dev_err(&pdev->dev, "Unable to resume\n");
+		dev_err(dev, "Unable to resume\n");
 
-err:
 	clear_bit(MTIP_DDF_RESUME_BIT, &dd->dd_flag);
 
 	return rv;
@@ -4353,14 +4322,15 @@ static const struct pci_device_id mtip_pci_tbl[] = {
 	{ 0 }
 };
 
+static SIMPLE_DEV_PM_OPS(mtip_pci_pm_ops, mtip_pci_suspend, mtip_pci_resume);
+
 /* Structure that describes the PCI driver functions. */
 static struct pci_driver mtip_pci_driver = {
 	.name			= MTIP_DRV_NAME,
 	.id_table		= mtip_pci_tbl,
 	.probe			= mtip_pci_probe,
 	.remove			= mtip_pci_remove,
-	.suspend		= mtip_pci_suspend,
-	.resume			= mtip_pci_resume,
+	.driver.pm		= &mtip_pci_pm_ops,
 	.shutdown		= mtip_pci_shutdown,
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
