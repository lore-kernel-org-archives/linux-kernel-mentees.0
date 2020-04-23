Return-Path: <SRS0=CC7Y=6H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812BCC54FCB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Apr 2020 13:29:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B302073A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Apr 2020 13:29:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIYvFizf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B302073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A67487813;
	Thu, 23 Apr 2020 13:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3vOGkxPAPOzG; Thu, 23 Apr 2020 13:29:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1536E8777F;
	Thu, 23 Apr 2020 13:29:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09F38C1AE2;
	Thu, 23 Apr 2020 13:29:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA01AC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 13:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B905C86FF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 13:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7Zjd913dML7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 13:29:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 769B187CB5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 13:29:33 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id a5so2488511pjh.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A/qLi5DZxHoHRrY1Zo0bANgrwlK0VgvwOiKl05Q08YI=;
 b=WIYvFizfw641zmEzFPfGqFztmbCxpPDF6wW4gUIlu4E1VghjjXII8VEcNLo39T0BqR
 h6pFcwfConso59wGRa8VXKuahu0a9OojNirHwJ/gALeaNMCM1OqFD9xd6yYnrSmP0QKT
 0gPiA5Kpdg5z8RBHmRsv90fcLGC+gcsaNonfv9rQOsQm0hIoD0Z63zXixsX5e4meklIe
 V870KnT2kx6tdMktpLvfDH+DAyf8s366yfTzx00wiwO4jxsqifkSBI2SBWDPuIK7XaSM
 aM1N4oSxJ5ID8++h+0j8zsiGdkjrL9j1EdMzJX4VK8pUBQBHDA12eu3uHqAXdLt3mkhR
 HrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A/qLi5DZxHoHRrY1Zo0bANgrwlK0VgvwOiKl05Q08YI=;
 b=drV1ayeQnNgfMtkkdZldjoOsYMRfQL/QK5DvVwICFiK1E6iy/u9V/Ib8Q5q01q8Sl7
 M/xjYQjVlZUws8wu3MuNCF+JIux7opXZDp3elM4eu6cm/q1MCfkGEbUg9uFcu0eFZN+y
 gzXpoEuDB48NDlaCj04HVKSitUzKcrCliryWtvqkZ+rBQVRYmMdqRaru2Q8lIL7zGjQB
 PziRlKURmNTqbkzc3+xs3FzgJhkP8IBgaAliBwJAuNZW9mbExJ7FXFc0vduzv0En96SM
 4g5kD6wwOdNZzg1WtDEEXATAUKXssmgn+vVagl9poviL63JRkaS+3bS12UuiOFaHNFTu
 CqMA==
X-Gm-Message-State: AGi0PualBdQoPli9rNEdptvD/Jgnts0zG6qcvjAJwywWPpe8ppy+NkP0
 l4VJtNSzg/CTM6ZA8HQGH70jeHADBW4=
X-Google-Smtp-Source: APiQypKfBl8F9PlOgP+xYH4ZRY8aemLt77gJiCoZCv/4sZcTKwsd4vnaWKaA3dHuH8A9mP4TkKATPQ==
X-Received: by 2002:a17:90b:19cc:: with SMTP id
 nm12mr725642pjb.34.1587648572660; 
 Thu, 23 Apr 2020 06:29:32 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.47])
 by smtp.gmail.com with ESMTPSA id 127sm2567258pfz.128.2020.04.23.06.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 06:29:31 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org, bjorn@helgaas.com,
 skhan@linuxfoundation.org, rjw@rjwysocki.net
Date: Thu, 23 Apr 2020 18:57:59 +0530
Message-Id: <20200423132759.38191-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 1/2] realtek/8139too: Remove
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

Upgrade Power Management from legacy to generic using dev_pm_ops.

Remove struct pci_driver.suspend and struct pci_driver.resume bindings,
and add struct pci_driver.driver.pm .

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/realtek/8139too.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/realtek/8139too.c b/drivers/net/ethernet/realtek/8139too.c
index 5caeb8368eab..b7c98b165256 100644
--- a/drivers/net/ethernet/realtek/8139too.c
+++ b/drivers/net/ethernet/realtek/8139too.c
@@ -2603,17 +2603,13 @@ static void rtl8139_set_rx_mode (struct net_device *dev)
 	spin_unlock_irqrestore (&tp->lock, flags);
 }
 
-#ifdef CONFIG_PM
-
-static int rtl8139_suspend (struct pci_dev *pdev, pm_message_t state)
+static int rtl8139_suspend(struct device *device)
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
+static int rtl8139_resume(struct device *device)
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
