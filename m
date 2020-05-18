Return-Path: <SRS0=A5MH=7A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE45C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 May 2020 15:03:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA8C2065F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 May 2020 15:03:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iC18Lt1F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEA8C2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 139E32012D;
	Mon, 18 May 2020 15:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pg1FCyuZruh; Mon, 18 May 2020 15:03:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 73E6221509;
	Mon, 18 May 2020 15:03:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E007C0881;
	Mon, 18 May 2020 15:03:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9252CC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7DBBE86A78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ccH3IPF5Tdff
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:03:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0166A8691E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:03:22 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v63so5078762pfb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q0vJRwaWiHDVlGbG3eVh8/uWQVt4wHmZxTm6RgydJQg=;
 b=iC18Lt1F9S0QFmiy4w8gAPf9ngNJphTTHweMRteryTOpuIddajPWCthBnN/60KUdX2
 AeoXNZnevaZiRDGOqujyYZk9lQKYvubij7TsyyiAeifkWphQpeekEdx601BFlR7vhZ3E
 cMYsRAffHe1qpRzuxgWFZoxIYX6tRiAo9yd41QrHHuZS91aH8WXhC8xIp85qfKW3JroU
 N3uUvA9CKdnaldcQUC5OshIuuMc9FFbYalXNMszjfK8MwnfpxsmXagQdimhgQmyCPwAk
 X4j29MG9Q8fphqnM9mz4NLN7p9KJ7RbMqkQG0a6njvPax0UgThhe2qbnfquK3v0y7aRr
 iPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q0vJRwaWiHDVlGbG3eVh8/uWQVt4wHmZxTm6RgydJQg=;
 b=lN0MJeDuJ1RQVPgBplp0sCQZ1z89k2uKTIi3HSjgfT6paKgHFThQNx//ORkjl5wN5f
 jsbllvNVSbpX7YbI1KZEJrVlIeeKu1UE/Bf474ete72px/gv+hOihZoRTVq8Jy0VY+JB
 WGfMg2IdKs4qNQfZcFQIaS4uJmGCi/7OHMX7FhE6dryDm98tYnAbnGjQ8gOwHcPVSBgc
 N7KIhhntKkf34RryLPZcRNAI8jzkxg5WU+JeGRljZFMclZ7OHmeAZ+Yjg8Xiwq+f1Dng
 cR/EjusqJyvUoTdVDJ0ECQ6Kdq4yEDll2q7KFsZjnDswvvcktxKqiyw44KHhrlkHfcND
 9T0g==
X-Gm-Message-State: AOAM530H/uCZWKV8X6/VipCOnTQcOti7cxDQdjG0ovlieEDwE3QiCoWM
 hhpp+pZBPst5uaGxTx1T1kY=
X-Google-Smtp-Source: ABdhPJy0cN4s+kAwOA6UoSUDKcF5V6dFfDZ6hRyOGNVqB8Vkht1ipy/lVMrfS40Y1q+zHnKfH0zROw==
X-Received: by 2002:aa7:81cf:: with SMTP id c15mr17732953pfn.211.1589814202338; 
 Mon, 18 May 2020 08:03:22 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.209])
 by smtp.gmail.com with ESMTPSA id k1sm7963142pgh.78.2020.05.18.08.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 08:03:21 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, netdev@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, linux-kernel-mentees@lists.linuxfoundation.org,
 rjw@rjwysocki.net, "David S . Miller" <davem@davemloft.net>
Date: Mon, 18 May 2020 20:32:13 +0530
Message-Id: <20200518150214.100491-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518150214.100491-1-vaibhavgupta40@gmail.com>
References: <20200518150214.100491-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH net-next v3 1/2] realtek/8139too: use
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

compile-tested only

With legacy PM hooks, it was the responsibility
of a driver to manage PCI states and also
device's power state. The generic approach is
to let PCI core handle the work.

PCI core passes "struct device*" as an argument
to the .suspend() and .resume() callbacks. As
these callabcks work with "struct net_device*",
extract it from "struct device*" using
dev_get_drv_data().

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/realtek/8139too.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/realtek/8139too.c b/drivers/net/ethernet/realtek/8139too.c
index 5caeb8368eab..227139d42227 100644
--- a/drivers/net/ethernet/realtek/8139too.c
+++ b/drivers/net/ethernet/realtek/8139too.c
@@ -2603,17 +2603,13 @@ static void rtl8139_set_rx_mode (struct net_device *dev)
 	spin_unlock_irqrestore (&tp->lock, flags);
 }
 
-#ifdef CONFIG_PM
-
-static int rtl8139_suspend (struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused rtl8139_suspend(struct device *device)
 {
-	struct net_device *dev = pci_get_drvdata (pdev);
+	struct net_device *dev = dev_get_drvdata(device);
 	struct rtl8139_private *tp = netdev_priv(dev);
 	void __iomem *ioaddr = tp->mmio_addr;
 	unsigned long flags;
 
-	pci_save_state (pdev);
-
 	if (!netif_running (dev))
 		return 0;
 
@@ -2631,38 +2627,30 @@ static int rtl8139_suspend (struct pci_dev *pdev, pm_message_t state)
 
 	spin_unlock_irqrestore (&tp->lock, flags);
 
-	pci_set_power_state (pdev, PCI_D3hot);
-
 	return 0;
 }
 
-
-static int rtl8139_resume (struct pci_dev *pdev)
+static int __maybe_unused rtl8139_resume(struct device *device)
 {
-	struct net_device *dev = pci_get_drvdata (pdev);
+	struct net_device *dev = dev_get_drvdata(device);
 
-	pci_restore_state (pdev);
 	if (!netif_running (dev))
 		return 0;
-	pci_set_power_state (pdev, PCI_D0);
+
 	rtl8139_init_ring (dev);
 	rtl8139_hw_start (dev);
 	netif_device_attach (dev);
 	return 0;
 }
 
-#endif /* CONFIG_PM */
-
+static SIMPLE_DEV_PM_OPS(rtl8139_pm_ops, rtl8139_suspend, rtl8139_resume);
 
 static struct pci_driver rtl8139_pci_driver = {
 	.name		= DRV_NAME,
 	.id_table	= rtl8139_pci_tbl,
 	.probe		= rtl8139_init_one,
 	.remove		= rtl8139_remove_one,
-#ifdef CONFIG_PM
-	.suspend	= rtl8139_suspend,
-	.resume		= rtl8139_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= &rtl8139_pm_ops,
 };
 
 
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
