Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52834C43217
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Dec 2021 19:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF811403E7;
	Wed,  8 Dec 2021 19:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXnVZwhWmXmV; Wed,  8 Dec 2021 19:25:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F12D140231;
	Wed,  8 Dec 2021 19:25:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C53B1C0073;
	Wed,  8 Dec 2021 19:25:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1DB4C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B450940901
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HzN9ZHZsGUvL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 041C2408FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E6C98B82271;
 Wed,  8 Dec 2021 19:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F03C341CA;
 Wed,  8 Dec 2021 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638991504;
 bh=oQFwcN3lUVqm/QC2mXvvhW5W+70BEyg1ywIOR6zcnUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Er+Q1gw7uO6ekkXfxvesyhl0sDJc2L88xfrJ9wikppnjwxdUtHuWJ1M4Ug2G1vg6c
 OasEocccOiD6b1dkjTCUPwycDkzI+7enwlP0auOvCeOak81HmRHZZMueMFxNKp+F8z
 mhtLsz2Ziml5LCktjoP1ukZynuoryu6Ta8FI9HDTRq3+9B7aRZ4yfJR/71v2BEtrLI
 ONgouI3WDZd4zPqzgTOo+NrpccETm9qqn5IQIdlha+hS3i2ohjqt5XJtZ8fmfi8wHa
 CUEFLukDCUNmXrap8fprOPbxX/J9R2o7v6z272V+ugZ4Vh+jix6GI96ukgk8+IOKPz
 egp4XBjhWCRSQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>
Subject: [PATCH v5 1/4] mtip32xx: remove pointless drvdata checking
Date: Wed,  8 Dec 2021 13:24:46 -0600
Message-Id: <20211208192449.146076-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208192449.146076-1-helgaas@kernel.org>
References: <20211208192449.146076-1-helgaas@kernel.org>
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

From: Bjorn Helgaas <bhelgaas@google.com>

The .suspend() and .resume() methods are only called after the .probe()
method (mtip_pci_probe()) has set the drvdata and returned success.

Therefore, if we get to mtip_pci_suspend() or mtip_pci_resume(), the
drvdata must be valid.  Drop the unnecessary checking.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/block/mtip32xx/mtip32xx.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index c91b9010c1a6..8677ac4c3431 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -4150,12 +4150,6 @@ static int mtip_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
 	int rv = 0;
 	struct driver_data *dd = pci_get_drvdata(pdev);
 
-	if (!dd) {
-		dev_err(&pdev->dev,
-			"Driver private datastructure is NULL\n");
-		return -EFAULT;
-	}
-
 	set_bit(MTIP_DDF_RESUME_BIT, &dd->dd_flag);
 
 	/* Disable ports & interrupts then send standby immediate */
@@ -4189,14 +4183,7 @@ static int mtip_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
 static int mtip_pci_resume(struct pci_dev *pdev)
 {
 	int rv = 0;
-	struct driver_data *dd;
-
-	dd = pci_get_drvdata(pdev);
-	if (!dd) {
-		dev_err(&pdev->dev,
-			"Driver private datastructure is NULL\n");
-		return -EFAULT;
-	}
+	struct driver_data *dd = pci_get_drvdata(pdev);
 
 	/* Move the device to active State */
 	pci_set_power_state(pdev, PCI_D0);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
