Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72982C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 17:36:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47064255C8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 17:36:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRoJqKnz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47064255C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 38321203FF;
	Mon, 29 Jun 2020 17:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WCx-hpm3sIfT; Mon, 29 Jun 2020 17:36:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5B9FD203F7;
	Mon, 29 Jun 2020 17:36:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43FE4C07FF;
	Mon, 29 Jun 2020 17:36:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01C2AC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 17:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F093888634
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 17:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJ+6NAzWqCrz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 17:36:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7AF2287EE8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 17:36:19 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j19so1756142pgm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 10:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CZkAqgCCUyZIGNalJFNzQkMvhQ98PbVukaKm6LBtBnw=;
 b=BRoJqKnzIZ14r5VSfz2GvyHmBQrCXaeQFISHO5MhmKwM+cQ4LkuCWFmuV2vLJ87hni
 1WSQfDvX1KIPgOIq0GqBSOl0kijABUuIg90rOEn5mt5rB8WUxWRMB+Q1GGTGjsSPZhOj
 5LyRcSRFbLG9ArQfDMA5IFsAug9TGGtsCFpIK30hOy+sYpdECEBzRy8WkR/bhwVZ5wUJ
 WIHo4Y8Mutr6NTDJKF5id3d3RcbZCLkytOl4dp1D/tFNqEC/dKAUXi+mh6nz6xoJUTg1
 rajzN+GCABHK1/kVgtFjmEvpVOC6P5laiMork/oGUt6rbY/JZagWjN21+VyL8Vq5BxTm
 Ki3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CZkAqgCCUyZIGNalJFNzQkMvhQ98PbVukaKm6LBtBnw=;
 b=rrP614agShfhgR94pCtV3Db+Z/2bTDo7aZkGP6CDYrCtJwkhUr7k1PwYm9o8ptiuEI
 u4ezuRQA/fvox0iJ3FL9W6q+dfBTy/3SzdJUXSHFItnG0V99Q5SAQ872WWr+01ZKX1+I
 xPAlWxRgtr3KFqZ4bmVhl6cmKqVEHMMLFvDnkcLfz2fUoQCb1k3uS6hVoJsFJ5yb8lf8
 4s34Ntj3Uv0kOtolXKb9PX8ERqdavOkzZ1cqLh27L+GtpH7lf93aBLjG05crmVAL2hHe
 qAFD8pB3FdJmUPk+MTSP7+Vt+YSiQH2xddkYF4WC20IX86qToprnmCsq9b5EFwjx75ny
 Ty4w==
X-Gm-Message-State: AOAM531sQJRHDcrajqfYwoMiOxTGFKqdKY0eiYvrDM1XrZ8xuoxaRVZs
 XwCpF2lu52gkVOV4NTTACWo=
X-Google-Smtp-Source: ABdhPJw6r6FYtLR2yskuhsNB7yhjQGHKP1pPuiujo9QgEcD55HQaBUT/5cbXYo1xJIh7l0zxt+bZBg==
X-Received: by 2002:a65:5649:: with SMTP id m9mr10983216pgs.279.1593452179043; 
 Mon, 29 Jun 2020 10:36:19 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id k23sm331461pgb.92.2020.06.29.10.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 10:36:18 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 29 Jun 2020 23:04:56 +0530
Message-Id: <20200629173459.262075-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629173459.262075-1-vaibhavgupta40@gmail.com>
References: <20200629173459.262075-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: devel@driverdev.osuosl.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 1/4] qlge/qlge_main.c: use generic
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
device_wakeup_disable() instead.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 38 +++++++++-----------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 402edaeffe12..86d1b53da2c2 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -4763,9 +4763,9 @@ static const struct pci_error_handlers qlge_err_handler = {
 	.resume = qlge_io_resume,
 };
 
-static int qlge_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused qlge_suspend(struct device *dev_d)
 {
-	struct net_device *ndev = pci_get_drvdata(pdev);
+	struct net_device *ndev = dev_get_drvdata(dev_d);
 	struct ql_adapter *qdev = netdev_priv(ndev);
 	int err;
 
@@ -4779,35 +4779,19 @@ static int qlge_suspend(struct pci_dev *pdev, pm_message_t state)
 	}
 
 	ql_wol(qdev);
-	err = pci_save_state(pdev);
-	if (err)
-		return err;
-
-	pci_disable_device(pdev);
-
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int qlge_resume(struct pci_dev *pdev)
+static int __maybe_unused qlge_resume(struct device *dev_d)
 {
-	struct net_device *ndev = pci_get_drvdata(pdev);
+	struct net_device *ndev = dev_get_drvdata(dev_d);
 	struct ql_adapter *qdev = netdev_priv(ndev);
 	int err;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	err = pci_enable_device(pdev);
-	if (err) {
-		netif_err(qdev, ifup, qdev->ndev, "Cannot enable PCI device from suspend\n");
-		return err;
-	}
-	pci_set_master(pdev);
+	pci_set_master(to_pci_dev(dev_d));
 
-	pci_enable_wake(pdev, PCI_D3hot, 0);
-	pci_enable_wake(pdev, PCI_D3cold, 0);
+	device_wakeup_disable(dev_d);
 
 	if (netif_running(ndev)) {
 		err = ql_adapter_up(qdev);
@@ -4820,22 +4804,20 @@ static int qlge_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static void qlge_shutdown(struct pci_dev *pdev)
 {
-	qlge_suspend(pdev, PMSG_SUSPEND);
+	qlge_suspend(&pdev->dev);
 }
 
+static SIMPLE_DEV_PM_OPS(qlge_pm_ops, qlge_suspend, qlge_resume);
+
 static struct pci_driver qlge_driver = {
 	.name = DRV_NAME,
 	.id_table = qlge_pci_tbl,
 	.probe = qlge_probe,
 	.remove = qlge_remove,
-#ifdef CONFIG_PM
-	.suspend = qlge_suspend,
-	.resume = qlge_resume,
-#endif
+	.driver.pm = &qlge_pm_ops,
 	.shutdown = qlge_shutdown,
 	.err_handler = &qlge_err_handler
 };
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
