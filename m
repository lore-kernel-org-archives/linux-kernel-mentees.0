Return-Path: <SRS0=ZZOl=GR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7200DC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 11:57:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F2C23A5F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 11:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F2C23A5F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 64CD42041F;
	Thu, 14 Jan 2021 11:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y06diu1enXPB; Thu, 14 Jan 2021 11:57:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CF1F8203DE;
	Thu, 14 Jan 2021 11:57:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B42D2C088B;
	Thu, 14 Jan 2021 11:57:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20EC7C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 11:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CD59A2041F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 11:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRaoNikMrDzB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 11:57:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by silver.osuosl.org (Postfix) with ESMTPS id 1D50F203DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 11:57:36 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id ce17so796574pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 03:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6pH8Qxja5JY4RQXz/fkwX0dken3Vg7X5Veu7c4FYNmA=;
 b=UKi4NOssNVNwkZ0FzElGxaGgRmlq5ovk60o5FGxtMhkP40IbkQYMtIdQPpWoeitkXl
 OD8v7lok8Xi/o7Lo6tfB1D0AjTC+h3XEbGt/8Ij7nPMJ9Z7bEz8Vg2VOa/W1m+PK0bPp
 xY/39qd3kn+xZf3u1jy5aHYr7KgBZmThDXXKry5aFQYmn0ycEkaWksqjYRjU20JliWPP
 V5StqLPPIZz1d1Yo72yQntlHRcgHfrarDHDrTEBOwNbXOq1DoLHz4QENX0s544i1LKTj
 garTsBcn9nn+/cSGd9hPSSs5IYI9p3haj+BjUs3f86ycFawK3r8VRXCFH1VpLRxJlqj8
 RFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6pH8Qxja5JY4RQXz/fkwX0dken3Vg7X5Veu7c4FYNmA=;
 b=ap9quj2homVTRoa1J5GV3lVOpld0gx/R0t6gZfpSZUCxqaYttT3m9RaWvpGNU95Ui3
 H+tr5nf83Yo+Pmz3CQAwcpfRHdseKsth/cTcWicb5a5/LNqOn44WZJZFKAEjOlhdOy63
 Eu05iUNFz4kYvqUEnFpzKzvPUwjLw0nXzFs6ovMNICprjndZ8vxjWo4jysfodX3CMWWl
 JuXAjI62oLfRGKaa4ZXu9E5ucspc+C1rsz2yrKi5kHKCLvy1e1Xw1xWzwnRr8DhxsqDN
 zPWvFuo9lWlhxvFqyLX83ZAu4oBjwwTcBZWvJ7Lm+5kRNWsCO5/14NWKXZgEYITIDm5w
 enaw==
X-Gm-Message-State: AOAM533UaijCGAwUsJLhqdBGDC2k1xru06zlptOkqvRObYGXvhPDBuQB
 Wirk3q5FqEsZ32RmlEg8oko=
X-Google-Smtp-Source: ABdhPJxCpXBKb3/Uavxt5C15oYfIxFZBDW4HK3SX575IoyKeOtuzcbDphn/g91Qu0uFfDxV8Fe2NfQ==
X-Received: by 2002:a17:90b:94b:: with SMTP id
 dw11mr4670586pjb.12.1610625455705; 
 Thu, 14 Jan 2021 03:57:35 -0800 (PST)
Received: from varodek.localdomain ([223.190.37.127])
 by smtp.gmail.com with ESMTPSA id t4sm5107914pfe.212.2021.01.14.03.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 03:57:35 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Thu, 14 Jan 2021 17:24:21 +0530
Message-Id: <20210114115423.52414-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114115423.52414-1-vaibhavgupta40@gmail.com>
References: <20200722083335.50068-1-vaibhavgupta40@gmail.com>
 <20210114115423.52414-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4 1/3] mtip32xx: use generic power
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
 drivers/block/mtip32xx/mtip32xx.c | 54 +++++++------------------------
 1 file changed, 12 insertions(+), 42 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 53ac59d19ae5..de1ac3366b97 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -4232,14 +4232,13 @@ static void mtip_pci_remove(struct pci_dev *pdev)
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
 
@@ -4247,21 +4246,8 @@ static int mtip_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
 
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
@@ -4273,42 +4259,25 @@ static int mtip_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
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
@@ -4339,14 +4308,15 @@ static const struct pci_device_id mtip_pci_tbl[] = {
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
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
