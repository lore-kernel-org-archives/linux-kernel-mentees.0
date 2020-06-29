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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61646C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 08:17:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336D52336D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 08:17:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dlx0UwC3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 336D52336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 16F4D89396;
	Mon, 29 Jun 2020 08:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ArHW1rmHuru; Mon, 29 Jun 2020 08:17:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AD6F089393;
	Mon, 29 Jun 2020 08:17:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A91EC0865;
	Mon, 29 Jun 2020 08:17:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3256C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AE59189396
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PVsEKEIcmtK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 14E4789393
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 08:17:42 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id c1so444423pja.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 01:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rqvwsn3zKVSYtQI3W9Dp3plnfUTHaA+z2ZGTb8aVlbU=;
 b=Dlx0UwC3kYeJgxeEwQAj3b/6RGb5GbiAsuc7KMAmV2cD4pYManJXgnL7YtesPkh36B
 Kqp5iQI1OSR8AJ0hTIi0NOr5wTSYaEJwR0j+7BeklgBn5zBDCzXqA+2pwiJfPARqVRVh
 Nn8xqTdsGwWAwJ5lhIkvdDREPxW1VWlXbHBrtYj6N2LRGzs26tYOVD/xULhRjClRV0lF
 OxbXgKuqP8RnfSy26NLfYj/dVj2PrdaTIxIMpxO4aMT4kktpPpA/mqBV/B5MUIiKEXeQ
 jbgb2X8r19TOoiPVRoCRalAAu03ETaiqW77lghO3OkJxxJPeq1+W419gtSdyQLXtih1b
 T5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rqvwsn3zKVSYtQI3W9Dp3plnfUTHaA+z2ZGTb8aVlbU=;
 b=NQbsuHIjywLm663Bl8Vy0HUXjy/mPyMHxIpmA41KkVmbC2toFr66AcPbyNOG0ASoZu
 2JSzx95Ckcea/d/RJlgdaJ/t0t6tGnZx0ock2GWqdLunuI2BvZrvxigxty7AYcmlTzIN
 x5FRIaChNLZSKDZA5WILcDGZB+6m30D54DRL2Qx7yIqPiGug356QLi3kwUGDFMYCSRk6
 1ovVdA3cnN58d0s+VzkvsffiVocpls0ygcTGyXK+/uYTdkNIdKAKglBdoW6CgoXj/NSA
 vpeZ/5Znm6rBEVaZREPS+ndfDVE/aYvyuDo85xubuzOwkEFIF36GL8teD2t8NDSUiVmn
 PP9g==
X-Gm-Message-State: AOAM531iLdrDVVM084/ZhOcaQR6Fk08TvWGg4tUSOcHe7Cq+FbjiDTmo
 ITNigtVqcAQHmrVG7TJ9c1g=
X-Google-Smtp-Source: ABdhPJx8PaH2DnmEhNBkeLM9D17iH5gA7L/GLMxi1RyXKTMPo6/qJ076tWUlqdFu6m7l/qvvhQDTMQ==
X-Received: by 2002:a17:90a:982:: with SMTP id 2mr823366pjo.34.1593418661628; 
 Mon, 29 Jun 2020 01:17:41 -0700 (PDT)
Received: from varodek.localdomain ([106.210.40.90])
 by smtp.gmail.com with ESMTPSA id co1sm3345154pjb.34.2020.06.29.01.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 01:17:41 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@gmail.com>, Alex Dubov <oakad@yahoo.com>
Date: Mon, 29 Jun 2020 13:45:30 +0530
Message-Id: <20200629081531.214734-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629081531.214734-1-vaibhavgupta40@gmail.com>
References: <20200629081531.214734-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 4/5] misc/phantom.c: use generic
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

With the support of generic PM callbacks, drivers no longer need to use
legacy .suspend() and .resume() in which they had to maintain PCI states
changes and device's power state themselves. All required operations are
done by PCI core.

Driver needs to do only device-specific operations.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/misc/phantom.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/phantom.c b/drivers/misc/phantom.c
index 6a5ed0e25ff1..ce72e46a2e73 100644
--- a/drivers/misc/phantom.c
+++ b/drivers/misc/phantom.c
@@ -457,31 +457,26 @@ static void phantom_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-#ifdef CONFIG_PM
-static int phantom_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused phantom_suspend(struct device *dev_d)
 {
-	struct phantom_device *dev = pci_get_drvdata(pdev);
+	struct phantom_device *dev = dev_get_drvdata(dev_d);
 
 	iowrite32(0, dev->caddr + PHN_IRQCTL);
 	ioread32(dev->caddr + PHN_IRQCTL); /* PCI posting */
 
-	synchronize_irq(pdev->irq);
+	synchronize_irq(to_pci_dev(dev_d)->irq);
 
 	return 0;
 }
 
-static int phantom_resume(struct pci_dev *pdev)
+static int __maybe_unused phantom_resume(struct device *dev_d)
 {
-	struct phantom_device *dev = pci_get_drvdata(pdev);
+	struct phantom_device *dev = dev_get_drvdata(dev_d);
 
 	iowrite32(0, dev->caddr + PHN_IRQCTL);
 
 	return 0;
 }
-#else
-#define phantom_suspend	NULL
-#define phantom_resume	NULL
-#endif
 
 static struct pci_device_id phantom_pci_tbl[] = {
 	{ .vendor = PCI_VENDOR_ID_PLX, .device = PCI_DEVICE_ID_PLX_9050,
@@ -491,13 +486,14 @@ static struct pci_device_id phantom_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, phantom_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(phantom_pm_ops, phantom_suspend, phantom_resume);
+
 static struct pci_driver phantom_pci_driver = {
 	.name = "phantom",
 	.id_table = phantom_pci_tbl,
 	.probe = phantom_probe,
 	.remove = phantom_remove,
-	.suspend = phantom_suspend,
-	.resume = phantom_resume
+	.driver.pm = &phantom_pm_ops,
 };
 
 static CLASS_ATTR_STRING(version, 0444, PHANTOM_VERSION);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
