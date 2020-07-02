Return-Path: <SRS0=sA50=AN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F8FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 03:53:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77672083E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 03:53:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlN07dH+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77672083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9BE4A8A9DB;
	Thu,  2 Jul 2020 03:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WdzTHKKxKibB; Thu,  2 Jul 2020 03:53:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E911D8A7BE;
	Thu,  2 Jul 2020 03:53:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4C5BC0890;
	Thu,  2 Jul 2020 03:53:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B8CEC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 03:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7AB428929D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 03:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dw26ZKWhECGs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 03:53:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 025CE89294
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 03:53:56 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x72so2496592pfc.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 20:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3oYvyksVrbHk1iNvFKP9oG5AS4jj+3Xyy3ZrJpHppKQ=;
 b=BlN07dH+M3YzqlnXAQdwHneCB13cA789PclAov8FAePjA1rPpPBOG7LPbuDsu1s6Gp
 cBthq7R4rhUq78ya7NPjvNdnTHd/OlDCdjB0Fk0U/vQ38ESwmtF3IpiBTFf7svIdVbTz
 i82dekfnAs+B9c+++Z3ELUEGd3V3ylxAohga+bxWE+kvMOlEeUHd3I6jhLrdRv1Xah/l
 cqNFNbeh9wZqP4Zgctsy+X+8Gntp7lHQOb9vo6AZRmYVjNeJaGRLoGitqu6hMPjzwIbn
 3IFkR1rlsY9NDMpKCyxCSHGHh8RKJDAQoJkj1QvjrIsr2VLRbDOAsuG3/5930v9KjZ1q
 Oh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3oYvyksVrbHk1iNvFKP9oG5AS4jj+3Xyy3ZrJpHppKQ=;
 b=WNQGYX7uXsdHEOMrCwJzXdVgQ5IBBI3l8WsDkBHaIGhDLjf9Wk2Nqih2qR0vynnugK
 XUEfdyLrSwL/dxG/YJ4z0qZC8XDU9tHWD/sLilZTvr3pQLpCKj/PmMwBhgDRTVnxuD2p
 FeLNHdk4S+Yok50t7PucsaBKX0sB4kZNyLz4GIdA9udCIvmx47DYqBzAcC6aT6gI4jws
 KCpWeVvYY3qitOG/3NwQkasBgCJ3CPMQpLDYqUS2nZtj8BtKkCTQZbcAMDslD4g8cJN0
 8upAv1T223S4bQ73qFp+6gWawTUWSktVfnRqmpD9hBcphJi0d0T6rtzdfyKoK+Z4ys6K
 PiEw==
X-Gm-Message-State: AOAM5320MLzuYsBNHUdBaGkZu0sr3r16ywcTN29i47mtNwookbi4ea9K
 jr5tcv+XPL6LHA5Ku80i700=
X-Google-Smtp-Source: ABdhPJxdVZLTwnn9gfe0sPqwOmPTjlMdXpEKzA+EDBiRwFjMygXaGhexF+GqAjfXZLZra9xeySTt8A==
X-Received: by 2002:a62:1801:: with SMTP id 1mr27505781pfy.242.1593662035539; 
 Wed, 01 Jul 2020 20:53:55 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id t187sm7308885pgb.76.2020.07.01.20.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 20:53:55 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Jay Cliburn <jcliburn@gmail.com>,
 Chris Snook <chris.snook@gmail.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Thu,  2 Jul 2020 09:22:23 +0530
Message-Id: <20200702035223.115412-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702035223.115412-1-vaibhavgupta40@gmail.com>
References: <20200702035223.115412-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 2/2] atl2: use generic power
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

Remove legacy PM callbacks and use generic operations. With legacy code,
drivers were responsible for handling PCI PM operations like
pci_save_state(). In generic code, all these hre andled by PCI core.

The generic suspend() and resume() are called at the same point the legacy
ones were called. Thus, it does not affect the normal functioning of the
driver.

__maybe_unused attribute is used with .resume() but not with .suspend(), as
.suspend() is calleb by .shutdown().

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/atheros/atlx/atl2.c | 64 +++++++-----------------
 1 file changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index c915852b8892..3e01e9fdb7fd 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -1484,19 +1484,15 @@ static void atl2_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-static int atl2_suspend(struct pci_dev *pdev, pm_message_t state)
+static int atl2_suspend(struct device *dev_d)
 {
-	struct net_device *netdev = pci_get_drvdata(pdev);
+	struct net_device *netdev = dev_get_drvdata(dev_d);
 	struct atl2_adapter *adapter = netdev_priv(netdev);
 	struct atl2_hw *hw = &adapter->hw;
 	u16 speed, duplex;
 	u32 ctrl = 0;
 	u32 wufc = adapter->wol;
 
-#ifdef CONFIG_PM
-	int retval = 0;
-#endif
-
 	netif_device_detach(netdev);
 
 	if (netif_running(netdev)) {
@@ -1504,12 +1500,6 @@ static int atl2_suspend(struct pci_dev *pdev, pm_message_t state)
 		atl2_down(adapter);
 	}
 
-#ifdef CONFIG_PM
-	retval = pci_save_state(pdev);
-	if (retval)
-		return retval;
-#endif
-
 	atl2_read_phy_reg(hw, MII_BMSR, (u16 *)&ctrl);
 	atl2_read_phy_reg(hw, MII_BMSR, (u16 *)&ctrl);
 	if (ctrl & BMSR_LSTATUS)
@@ -1560,7 +1550,7 @@ static int atl2_suspend(struct pci_dev *pdev, pm_message_t state)
 		ctrl |= PCIE_DLL_TX_CTRL1_SEL_NOR_CLK;
 		ATL2_WRITE_REG(hw, REG_PCIE_DLL_TX_CTRL1, ctrl);
 
-		pci_enable_wake(pdev, pci_choose_state(pdev, state), 1);
+		device_wakeup_enable(dev_d);
 		goto suspend_exit;
 	}
 
@@ -1580,7 +1570,7 @@ static int atl2_suspend(struct pci_dev *pdev, pm_message_t state)
 
 		hw->phy_configured = false; /* re-init PHY when resume */
 
-		pci_enable_wake(pdev, pci_choose_state(pdev, state), 1);
+		device_wakeup_enable(dev_d);
 
 		goto suspend_exit;
 	}
@@ -1600,42 +1590,26 @@ static int atl2_suspend(struct pci_dev *pdev, pm_message_t state)
 	atl2_force_ps(hw);
 	hw->phy_configured = false; /* re-init PHY when resume */
 
-	pci_enable_wake(pdev, pci_choose_state(pdev, state), 0);
+	device_wakeup_disable(dev_d);
 
 suspend_exit:
 	if (netif_running(netdev))
 		atl2_free_irq(adapter);
 
-	pci_disable_device(pdev);
-
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int atl2_resume(struct pci_dev *pdev)
+static int __maybe_unused atl2_resume(struct device *dev_d)
 {
-	struct net_device *netdev = pci_get_drvdata(pdev);
+	struct net_device *netdev = dev_get_drvdata(dev_d);
 	struct atl2_adapter *adapter = netdev_priv(netdev);
 	u32 err;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	err = pci_enable_device(pdev);
-	if (err) {
-		printk(KERN_ERR
-			"atl2: Cannot enable PCI device from suspend\n");
-		return err;
-	}
-
-	pci_set_master(pdev);
+	pci_set_master(to_pci_dev(dev_d));
 
 	ATL2_READ_REG(&adapter->hw, REG_WOL_CTRL); /* clear WOL status */
 
-	pci_enable_wake(pdev, PCI_D3hot, 0);
-	pci_enable_wake(pdev, PCI_D3cold, 0);
+	device_wakeup_disable(dev_d);
 
 	ATL2_WRITE_REG(&adapter->hw, REG_WOL_CTRL, 0);
 
@@ -1654,24 +1628,22 @@ static int atl2_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#endif
 
 static void atl2_shutdown(struct pci_dev *pdev)
 {
-	atl2_suspend(pdev, PMSG_SUSPEND);
+	atl2_suspend(&pdev->dev);
 }
 
+static SIMPLE_DEV_PM_OPS(atl2_pm_ops, atl2_suspend, atl2_resume);
+
 static struct pci_driver atl2_driver = {
-	.name     = atl2_driver_name,
-	.id_table = atl2_pci_tbl,
-	.probe    = atl2_probe,
-	.remove   = atl2_remove,
+	.name      = atl2_driver_name,
+	.id_table  = atl2_pci_tbl,
+	.probe     = atl2_probe,
+	.remove    = atl2_remove,
 	/* Power Management Hooks */
-	.suspend  = atl2_suspend,
-#ifdef CONFIG_PM
-	.resume   = atl2_resume,
-#endif
-	.shutdown = atl2_shutdown,
+	.driver.pm = &atl2_pm_ops,
+	.shutdown  = atl2_shutdown,
 };
 
 /**
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
