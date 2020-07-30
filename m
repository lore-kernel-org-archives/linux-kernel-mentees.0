Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EEEC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 06:44:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA358206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 06:44:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWC0bJiO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA358206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 79BF087D0B;
	Thu, 30 Jul 2020 06:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5B6-pdOYQVPU; Thu, 30 Jul 2020 06:44:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 906E987850;
	Thu, 30 Jul 2020 06:44:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78FFEC004F;
	Thu, 30 Jul 2020 06:44:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C842C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6B8EA883AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UaHcO5dCIZnb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E325C8695B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:25 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z5so15997156pgb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 23:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxW9b/q+4sJNPVzuIBcNVUFU45uGZZ5i5gNq3WgDQXk=;
 b=RWC0bJiOb/xpT1/NhoU9qVxFsb1jQWfUSHwVYaA4esTTb7vPINin1HgHdIJEP4l86l
 KL5ua+H1bfAyTnXfN+qVgEKO3WyEDgQS12wKLaqFQOQuEQGQanLGNe8pxnb4yNnqxRfF
 IRizwp/ERPSX0VSKIwlIXpDhL0arZ3cxEbxMtM/Kq3HqIGDjO4XqmIQ7dbXFAyy0/FiS
 O8DRg3EhbfJyAjuDVbDNpegjMvq38wPMadwqIAyhhJjEeKhmp0GvxkKMFXFqivvgqr+U
 ubCQi3MdHt7/fEUKgPZQZlZYAlsxOASG/kQ3KU5qsjGITkmkBjHOgKU5x80yZV3kF3Dk
 9gEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FxW9b/q+4sJNPVzuIBcNVUFU45uGZZ5i5gNq3WgDQXk=;
 b=sScd2py5Smf8lbqvQgNISzEtF+u4LFy/iJku919IK+pvnRG/0t5AwGCUHfeeYkEKpw
 YxLn6zl/JZSAjWiv4ClCYfWJio+kAh7sWy/G/DZAT58xpCj2o3YehTl0ZGJzUl5+Isfh
 WB0wLEfdGlVwKIS1MRf+dkBR1mk6TWBOFSDMU+h/xy29y6b7T4QoYuGH0ibjP/8cfqUo
 EgLwTMopu/DdEO9XeQaPdsV2wzbxDslaYkSsYA+dq9cpDyylwRUyyPXZvX18nEfoSrQK
 8id9H6FKGzO8agZGNuIi2DKOfzpcGequwG3U7NyxPVGel7/Kj8m2y4Myv645fEar09bz
 RCZQ==
X-Gm-Message-State: AOAM530WT7JyvsIqiTZbQyHyGreXV9uugy/LJA0XUaNq7hfkzRH4BRpH
 SCXU0zKbt5ETQnBx0KCyWQM=
X-Google-Smtp-Source: ABdhPJyzdxmIK3PFACPbbxyboXP+nVs/EbrQeOMwXQ7G4jMA1ogRi+T9SDFLmfueLlLC2qJEyWHqRg==
X-Received: by 2002:a62:31c7:: with SMTP id x190mr1879177pfx.100.1596091465451; 
 Wed, 29 Jul 2020 23:44:25 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t19sm4456942pgg.19.2020.07.29.23.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 23:44:25 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Daniele Venzano <venza@brownhat.org>, Samuel Chessman <chessman@tux.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 30 Jul 2020 12:12:28 +0530
Message-Id: <20200730064229.174933-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730064229.174933-1-vaibhavgupta40@gmail.com>
References: <20200730051733.113652-1-vaibhavgupta40@gmail.com>
 <20200730064229.174933-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 2/3] sis900: use generic power
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
 drivers/net/ethernet/sis/sis900.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/sis/sis900.c b/drivers/net/ethernet/sis/sis900.c
index 81ed7589e33c..2af2c9816dfc 100644
--- a/drivers/net/ethernet/sis/sis900.c
+++ b/drivers/net/ethernet/sis/sis900.c
@@ -2493,11 +2493,9 @@ static void sis900_remove(struct pci_dev *pci_dev)
 	pci_release_regions(pci_dev);
 }
 
-#ifdef CONFIG_PM
-
-static int sis900_suspend(struct pci_dev *pci_dev, pm_message_t state)
+static int __maybe_unused sis900_suspend(struct device *dev)
 {
-	struct net_device *net_dev = pci_get_drvdata(pci_dev);
+	struct net_device *net_dev = dev_get_drvdata(dev);
 	struct sis900_private *sis_priv = netdev_priv(net_dev);
 	void __iomem *ioaddr = sis_priv->ioaddr;
 
@@ -2510,22 +2508,17 @@ static int sis900_suspend(struct pci_dev *pci_dev, pm_message_t state)
 	/* Stop the chip's Tx and Rx Status Machine */
 	sw32(cr, RxDIS | TxDIS | sr32(cr));
 
-	pci_set_power_state(pci_dev, PCI_D3hot);
-	pci_save_state(pci_dev);
-
 	return 0;
 }
 
-static int sis900_resume(struct pci_dev *pci_dev)
+static int __maybe_unused sis900_resume(struct device *dev)
 {
-	struct net_device *net_dev = pci_get_drvdata(pci_dev);
+	struct net_device *net_dev = dev_get_drvdata(dev);
 	struct sis900_private *sis_priv = netdev_priv(net_dev);
 	void __iomem *ioaddr = sis_priv->ioaddr;
 
 	if(!netif_running(net_dev))
 		return 0;
-	pci_restore_state(pci_dev);
-	pci_set_power_state(pci_dev, PCI_D0);
 
 	sis900_init_rxfilter(net_dev);
 
@@ -2549,17 +2542,15 @@ static int sis900_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
+
+static SIMPLE_DEV_PM_OPS(sis900_pm_ops, sis900_suspend, sis900_resume);
 
 static struct pci_driver sis900_pci_driver = {
 	.name		= SIS900_MODULE_NAME,
 	.id_table	= sis900_pci_tbl,
 	.probe		= sis900_probe,
 	.remove		= sis900_remove,
-#ifdef CONFIG_PM
-	.suspend	= sis900_suspend,
-	.resume		= sis900_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= &sis900_pm_ops,
 };
 
 static int __init sis900_init_module(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
