Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DBEC83009
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 14:44:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DDE4206C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 14:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFiMphrb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DDE4206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 68FB62042A;
	Tue, 28 Apr 2020 14:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v8lJteSK2lrX; Tue, 28 Apr 2020 14:44:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 700B022053;
	Tue, 28 Apr 2020 14:44:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FA83C0864;
	Tue, 28 Apr 2020 14:44:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3A9BC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 14:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B310184549
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 14:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1iZUC_CxngP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 14:44:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 245D384547
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 14:44:19 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n11so2311693pgl.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LCiVTM/RrP5MB9UAMWjZafxjJ9w9LQDtySRr0yyUvig=;
 b=WFiMphrbohCkvc0PmCtP/0ONKUKWxcS62Fk6uIC6T8M52zhLLHPWc9D7PeXpIDGObI
 y9kLa6VeSut0qcLlQ7Sn6JXxRTeuEM+5iiPEmIA07DXF14OqLcKVRkouqdxwP6bHQGon
 9FL0hRmU8cNm1EaLqtmGOwZAhsSLgQBwWGpRCT5RlaQbz0TFIOZemsrracSLmDRcZJK5
 +Zwj7XYc+M1n/O02AVo7JCe7xAU3GZmkHd0y5hZn8dEDUdIH5dF0acFBwBSxqA1GU/ti
 2QtbRdeuvN0ijzIBi6VoLcUhEaqNITxwsuJHuVzLad0ufJXD0vXKlsGD2mHo/FdehKr1
 OMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LCiVTM/RrP5MB9UAMWjZafxjJ9w9LQDtySRr0yyUvig=;
 b=KRU/hXljmxsTcEJ3yyy+8xvX6Lb1I53gnRt91TcN+cCkJJ/dY/mR5z6MRDupnnYV0y
 YZ1yp6Ro9Lv+UV1Txvtd2L5TPBrXN4AvjRumxiCOzb9JKUQ4BngIMtiuC4i4Zz+5PBNx
 cHUqa+19fy+PssrQGgLE1aXMNtcvXMMu82yIhU8O25gVLO5/8d3IZp5FUYjdqp4yn7O8
 alPUs/kuBBwo5JLQcCHjrv1rwww5zdkvtjnQyIUTcRqwJbCeC6aYowYAQAjs0GMAMija
 24sBUGtZFxZbyHV2hB8R9L1qS+R8V2eccZNgJY2crMu/ldLv9SaMq0RBpK914gQGmFX9
 EQbw==
X-Gm-Message-State: AGi0PuYNNT71R5FrIAUW4WQ43VuziuELFE0N/VQNEexmJCaDm9DvK54F
 iLJyWCDK4Um0pLS5nfEdsgo=
X-Google-Smtp-Source: APiQypKUZzm/idAOYsCJcbPNAUKzD83TMnBLulC070lQrVOaapGzddiPI7XjHdlA3223hVBT7BxCCQ==
X-Received: by 2002:a63:354:: with SMTP id 81mr27730225pgd.304.1588085058694; 
 Tue, 28 Apr 2020 07:44:18 -0700 (PDT)
Received: from varodek.localdomain ([2401:4900:40f3:10a2:97c1:b981:9f1:d7d0])
 by smtp.gmail.com with ESMTPSA id
 d203sm15053203pfd.79.2020.04.28.07.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 07:44:18 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Shannon Nelson <snelson@pensando.io>, Jakub Kicinski <kuba@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Martin Habets <mhabets@solarflare.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, netdev@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, linux-kernel-mentees@lists.linuxfoundation.org,
 rjw@rjwysocki.net
Date: Tue, 28 Apr 2020 20:13:13 +0530
Message-Id: <20200428144314.24533-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200428144314.24533-1-vaibhavgupta40@gmail.com>
References: <20200428144314.24533-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 1/2] realtek/8139too: Remove
	Legacy Power Management
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

Upgrade power management from legacy to generic using dev_pm_ops.

Remove "struct pci_driver.suspend" and "struct pci_driver.resume"
bindings, and add "struct pci_driver.driver.pm" .

Add "__maybe_unused" attribute to resume() and susend() callbacks
definition to suppress compiler warnings.

Generic callback requires an argument of type "struct device*". Hence,
convert it to "struct net_device*" using "dev_get_drvdata()" to use
it in the callback.

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
