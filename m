Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84852C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 08:59:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5607320760
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 08:59:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rFzIXEjT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5607320760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 31135885E9;
	Mon,  6 Jul 2020 08:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swD8Ti3TisYj; Mon,  6 Jul 2020 08:59:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BF64C885DE;
	Mon,  6 Jul 2020 08:59:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD5FCC0893;
	Mon,  6 Jul 2020 08:59:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9885C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E65028769E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5nharp2lmLWe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:59:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 771AB87622
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 08:59:30 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id b92so16732090pjc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 01:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YDgHKvvmhsfWS8A9BYdRbUuXFuoTQjGp+5UpoFiAnjA=;
 b=rFzIXEjTzJ+YSq0LUkTDOF5yEVqOHm2fLik0s365SypOU57MghxUaHEt7P4+lWmhLo
 ukyWeXdlW2BcCn2gkiloxjmvEj/dLziRtbApGUr7uenm99O72BXKwyMa7L1XrIQxWbXw
 Z0C4EA+upuqWYOS1A+/8PmbZsEIMhqVTL7uSH91xNv+mvJYeLzX4GyMkXMm6YN5ZZ/gj
 vfRiSiXeiAb5C8d7cfxlycz7IF6KmjDoirZFssC0ko48Wusk+vLJw3Wro0qI9lPtjid1
 Z0ofdKV9+XXwF6zigiqCDWB5eGHzmdlOMdQuobbNq67EN7OiiPUqUGnPt/AcpYX9wThn
 gDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YDgHKvvmhsfWS8A9BYdRbUuXFuoTQjGp+5UpoFiAnjA=;
 b=kUzZOofMai2baHml4WjRjgEOPqAQnvdKfc7Z0uEaGY9ueSUkRsYhx7tNbcrM/r9+5W
 j/rgQTE5AWnzom5uksziXlj2gwEB41ux3jttG78JVlsg32e8YqRr2pFoFjTC0/8wBika
 yfFBAxo6gEhsJXOCQJSoU8bmP6Tz9lfjkry+SmXV/faSL7NIpai/erGeLY7sGiM0UmHU
 79w/YwbtGb9kkaXaPwOEHUchjjeDYavmn/4eYlq8C0mVTkbug2AJsaJefTqOpf2xR+mE
 VbRRaAJ1NrbY4tHwlTDrxbTEx5KbQR/KE//EEJ++y9QunqcmnK0PVzaBpbAk9mfsvMWQ
 sy9A==
X-Gm-Message-State: AOAM531Iwoy/RzHCxHha6UT3vIeOxcpzVBt8vKeDLY8W3xGnpPJEt86c
 2jvRxdKwTgZCsvkPy/VslmY=
X-Google-Smtp-Source: ABdhPJzKQrxdddAx3q2gn5XToDsOozVUCzBnDA6HTLFoaLzWUs3fbTedziS88I6WT0oq+DuJbEpSAg==
X-Received: by 2002:a17:90a:eb01:: with SMTP id
 j1mr51503192pjz.29.1594025970046; 
 Mon, 06 Jul 2020 01:59:30 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id a19sm10068149pfn.136.2020.07.06.01.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 01:59:29 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Mon,  6 Jul 2020 14:27:45 +0530
Message-Id: <20200706085746.221992-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706085746.221992-1-vaibhavgupta40@gmail.com>
References: <20200706085746.221992-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 2/3] sun/niu: use generic power
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

The driver was calling pci_save/restore_state() which is no more needed.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/sun/niu.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index 9a5004f674c7..68541c823245 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -9873,9 +9873,9 @@ static void niu_pci_remove_one(struct pci_dev *pdev)
 	}
 }
 
-static int niu_suspend(struct pci_dev *pdev, pm_message_t state)
+static int niu_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct niu *np = netdev_priv(dev);
 	unsigned long flags;
 
@@ -9897,14 +9897,12 @@ static int niu_suspend(struct pci_dev *pdev, pm_message_t state)
 	niu_stop_hw(np);
 	spin_unlock_irqrestore(&np->lock, flags);
 
-	pci_save_state(pdev);
-
 	return 0;
 }
 
-static int niu_resume(struct pci_dev *pdev)
+static int niu_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct niu *np = netdev_priv(dev);
 	unsigned long flags;
 	int err;
@@ -9912,8 +9910,6 @@ static int niu_resume(struct pci_dev *pdev)
 	if (!netif_running(dev))
 		return 0;
 
-	pci_restore_state(pdev);
-
 	netif_device_attach(dev);
 
 	spin_lock_irqsave(&np->lock, flags);
@@ -9930,13 +9926,14 @@ static int niu_resume(struct pci_dev *pdev)
 	return err;
 }
 
+static SIMPLE_DEV_PM_OPS(niu_pm_ops, niu_suspend, niu_resume);
+
 static struct pci_driver niu_pci_driver = {
 	.name		= DRV_MODULE_NAME,
 	.id_table	= niu_pci_tbl,
 	.probe		= niu_pci_init_one,
 	.remove		= niu_pci_remove_one,
-	.suspend	= niu_suspend,
-	.resume		= niu_resume,
+	.driver.pm	= &niu_pm_ops,
 };
 
 #ifdef CONFIG_SPARC64
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
