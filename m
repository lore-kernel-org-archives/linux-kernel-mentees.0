Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C6CC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 12:58:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B542073A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 12:58:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fr3YLS21"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08B542073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BF9FD226FC;
	Tue, 21 Jul 2020 12:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upozPwnHdKIv; Tue, 21 Jul 2020 12:58:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7A0AD226E5;
	Tue, 21 Jul 2020 12:58:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75D48C089F;
	Tue, 21 Jul 2020 12:58:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FEF4C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4F6DD8464C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1N3uDunKmpy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:58:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D904785081
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:58:08 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d7so1455157plq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t2vMm5MN6COcLP/AC1bsbI/E+zsl4wCZerr7TM2M9Bk=;
 b=fr3YLS211Gmt5YGjeWiE/LFiFj6YG+zPEieeHXqHXdyDwVPBswzW476JH2GbekCA0R
 33FjkoOaQp4eovrKc6t8q+SNSOXcarYBhQ2s4pjcBtcik7wavPC4bKVpTa1d7hfAG63z
 tFn1Di3tXn1b4rJAGi6IhgCWb7RdDqAx6fGIeprwlcmTYkNlf0g1MsbZJ94oM1tXPGxW
 Mx0WjzPy7O3iDsciWz+y6G2c+hKVMpa/8+9EjujtbBqjbZdMcXjNNlHcyZTxQAO0pmOd
 0fghdSwtQzENvCQbBGW24iwpi4E5dQXaDbWla4QR6q8S5dAgw6WfMdetdCfIEF7vfICF
 Q3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t2vMm5MN6COcLP/AC1bsbI/E+zsl4wCZerr7TM2M9Bk=;
 b=kjEaJRFFMdCbQLuw1P0BR/pARqfb3CJnHupuhPU+MgdDhULe3ufQPW+ChFLX/GvaY+
 ZeSba5OxA5WRb/b4hoBHlnAFGVmCCdiPD9BYhlhomhZim4MAFabtFkkzZWYwB5yLa/Ia
 75SDGisihB0aKzt+vnmdGXD8SbVxR3qFNTio11t4QwFKXkrJWuuYA5xMBgpuoDzWbL/6
 sqBQ+ZFlp9TBzSNzJQwt3P2LTp0no0Q9Q8698haCBsd9UjmYqMW5hipIPFnuI23WMpbD
 365n8wPAZlzrVlaLU7GxJW7pUGxwWQpTIs7iM02LeXS46nOIMZ3k/o+gMJKBaTOfxIth
 sfHQ==
X-Gm-Message-State: AOAM531xhW6tgsImwMvw6cEBRDIb6gsa77Z1PLI0g5rHqhm3Cq5aGKWa
 Q+liRMOtww0ousxVQIhS2kA=
X-Google-Smtp-Source: ABdhPJzQEfoRb3UE4er+pdhXjNmen1E198JhpdeN0Yigv10qpv0/N5+ym6vRm0GCGdtjLMzAKyYNRA==
X-Received: by 2002:a17:90b:3901:: with SMTP id
 ob1mr4531304pjb.168.1595336288282; 
 Tue, 21 Jul 2020 05:58:08 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id a2sm20573833pfg.120.2020.07.21.05.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:58:07 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 21 Jul 2020 18:25:15 +0530
Message-Id: <20200721125514.145607-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1] prism54: islpci_hotplug: use
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

Drivers using legacy power management .suspen()/.resume() callbacks
have to manage PCI states and device's PM states themselves. They also
need to take care of standard configuration registers.

Switch to generic power management framework using a single
"struct dev_pm_ops" variable to take the unnecessary load from the driver.
This also avoids the need for the driver to directly call most of the PCI
helper functions and device power state control functions as through
the generic framework, PCI Core takes care of the necessary operations,
and drivers are required to do only device-specific jobs.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 .../intersil/prism54/islpci_hotplug.c         | 34 ++++++-------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/intersil/prism54/islpci_hotplug.c b/drivers/net/wireless/intersil/prism54/islpci_hotplug.c
index 20291c0d962d..e8369befe100 100644
--- a/drivers/net/wireless/intersil/prism54/islpci_hotplug.c
+++ b/drivers/net/wireless/intersil/prism54/islpci_hotplug.c
@@ -63,16 +63,17 @@ MODULE_DEVICE_TABLE(pci, prism54_id_tbl);
 
 static int prism54_probe(struct pci_dev *, const struct pci_device_id *);
 static void prism54_remove(struct pci_dev *);
-static int prism54_suspend(struct pci_dev *, pm_message_t state);
-static int prism54_resume(struct pci_dev *);
+static int __maybe_unused prism54_suspend(struct device *);
+static int __maybe_unused prism54_resume(struct device *);
+
+static SIMPLE_DEV_PM_OPS(prism54_pm_ops, prism54_suspend, prism54_resume);
 
 static struct pci_driver prism54_driver = {
 	.name = DRV_NAME,
 	.id_table = prism54_id_tbl,
 	.probe = prism54_probe,
 	.remove = prism54_remove,
-	.suspend = prism54_suspend,
-	.resume = prism54_resume,
+	.driver.pm = &prism54_pm_ops,
 };
 
 /******************************************************************************
@@ -243,16 +244,13 @@ prism54_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-static int
-prism54_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused
+prism54_suspend(struct device *dev)
 {
-	struct net_device *ndev = pci_get_drvdata(pdev);
+	struct net_device *ndev = dev_get_drvdata(dev);
 	islpci_private *priv = ndev ? netdev_priv(ndev) : NULL;
 	BUG_ON(!priv);
 
-
-	pci_save_state(pdev);
-
 	/* tell the device not to trigger interrupts for now... */
 	isl38xx_disable_interrupts(priv->device_base);
 
@@ -266,26 +264,16 @@ prism54_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-static int
-prism54_resume(struct pci_dev *pdev)
+static int __maybe_unused
+prism54_resume(struct device *dev)
 {
-	struct net_device *ndev = pci_get_drvdata(pdev);
+	struct net_device *ndev = dev_get_drvdata(dev);
 	islpci_private *priv = ndev ? netdev_priv(ndev) : NULL;
-	int err;
 
 	BUG_ON(!priv);
 
 	printk(KERN_NOTICE "%s: got resume request\n", ndev->name);
 
-	err = pci_enable_device(pdev);
-	if (err) {
-		printk(KERN_ERR "%s: pci_enable_device failed on resume\n",
-		       ndev->name);
-		return err;
-	}
-
-	pci_restore_state(pdev);
-
 	/* alright let's go into the PREBOOT state */
 	islpci_reset(priv, 1);
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
