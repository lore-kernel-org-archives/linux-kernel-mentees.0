Return-Path: <SRS0=5DCt=AD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0129C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:44:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90ACB206BE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1Y6qRPp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90ACB206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73D3788B24;
	Mon, 22 Jun 2020 11:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6gNW2cu0SQ3; Mon, 22 Jun 2020 11:44:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F284F886FF;
	Mon, 22 Jun 2020 11:44:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF7CFC0891;
	Mon, 22 Jun 2020 11:44:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD179C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A9A89887E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbr8JcFSHCaE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 31D01886FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:10 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id k6so7461031pll.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 04:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s/zCuTBKH1kgRei9/PLc6fkyfxFbJ6O9JTgH9Zw9bLI=;
 b=L1Y6qRPpiJ7wjkUPPYV+yWXDZYyq7d1winYfIuveKQ+vr3B8aGhSLSrRRj0LIjVUmw
 i3m3lxunxggGfl9Jjol9gCHS7KluCkBJxbOS+WE6xXJ7X9EchL07q8gdsuT5tt0fYP6k
 JSbckvTGhhyPQulLeTvuWPkVR60h6FI3Twmoo2ZBdItMsD/R2sqm1vZneGXpuT1VJSml
 nXm75JK3QbkteUqKna+WDGOzHoTOYnBNIU8u6kfTlglLbivQoesbLsQmyVPKXB9LYIKy
 sqWclMDiJFpyj6uUAiK+BWc1E6+G20z545amyhaZqWVc+6EYaJT2WeQ1EOjLLRNYc2E+
 5MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s/zCuTBKH1kgRei9/PLc6fkyfxFbJ6O9JTgH9Zw9bLI=;
 b=USwMCIt6+eLr4Hvmk/IsgA+wfzKRo4DSDE5N7Mp2mz64rfNvioRwx1wU/QPIHPAQyd
 GGehsxbcGzkzMIQ4Kvdrv3AXdxxxwJkOPE3CeGJs1Q7O6W4moR7BdH0WbDDwObhLqwfv
 LqGuoS8UypMuke6twovIp/Jl+t9pMq2nYYiWaA3sNBTyKcVv37vvV1PZCEGkkMyWZLp/
 ep+ckKe/glMGGs/Rd6Wfncjm4qwHQ4jS3QmYCEkbqcYQPAx0AfGl5bUCRqRnX2oNoRKo
 uWUBNbs1mERhaBfimqbdm2fjO5psEzmH5OX6V01lpB+S+ovV8ug8uL/h5qIbGNBeNb5K
 XE4w==
X-Gm-Message-State: AOAM533aEsOx4cm9a0/TcW6eygALPoaKx1P29eFPekGKOeJQGTBfEQLi
 ksr1+z5VfUQyfIRmD3Hr+04=
X-Google-Smtp-Source: ABdhPJyRXxliXX4cjV/vHWpiMmYDUvL3wizT4QWytIUjPst/tH0F9/f1PMuaccwBGyizSQEW9ZJjGw==
X-Received: by 2002:a17:90a:260b:: with SMTP id
 l11mr18778684pje.210.1592826249756; 
 Mon, 22 Jun 2020 04:44:09 -0700 (PDT)
Received: from varodek.localdomain ([2401:4900:b8b:123e:d7ae:5602:b3d:9c0])
 by smtp.gmail.com with ESMTPSA id j17sm14081032pjy.22.2020.06.22.04.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:44:09 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Mon, 22 Jun 2020 17:12:24 +0530
Message-Id: <20200622114228.60027-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622114228.60027-1-vaibhavgupta40@gmail.com>
References: <20200622114228.60027-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-parisc@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 1/5] tulip: dmfe: use generic
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

With legacy PM hooks, it was the responsibility of a driver to manage PCI
states and also the device's power state. The generic approach is to let the
PCI core handle the work.

The legacy suspend() and resume() were making use of
pci_read/write_config_dword() to enable/disable wol. Driver editing
configuration registers of a device is not recommended. Thus replace them
all with device_wakeup_enable/disable().

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/dec/tulip/dmfe.c | 49 +++++----------------------
 1 file changed, 9 insertions(+), 40 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/dmfe.c b/drivers/net/ethernet/dec/tulip/dmfe.c
index c1884fc9ad32..c3b4abff48b5 100644
--- a/drivers/net/ethernet/dec/tulip/dmfe.c
+++ b/drivers/net/ethernet/dec/tulip/dmfe.c
@@ -2081,14 +2081,11 @@ static const struct pci_device_id dmfe_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, dmfe_pci_tbl);
 
-
-#ifdef CONFIG_PM
-static int dmfe_suspend(struct pci_dev *pci_dev, pm_message_t state)
+static int __maybe_unused dmfe_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pci_dev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct dmfe_board_info *db = netdev_priv(dev);
 	void __iomem *ioaddr = db->ioaddr;
-	u32 tmp;
 
 	/* Disable upper layer interface */
 	netif_device_detach(dev);
@@ -2105,63 +2102,35 @@ static int dmfe_suspend(struct pci_dev *pci_dev, pm_message_t state)
 	dmfe_free_rxbuffer(db);
 
 	/* Enable WOL */
-	pci_read_config_dword(pci_dev, 0x40, &tmp);
-	tmp &= ~(DMFE_WOL_LINKCHANGE|DMFE_WOL_MAGICPACKET);
-
-	if (db->wol_mode & WAKE_PHY)
-		tmp |= DMFE_WOL_LINKCHANGE;
-	if (db->wol_mode & WAKE_MAGIC)
-		tmp |= DMFE_WOL_MAGICPACKET;
-
-	pci_write_config_dword(pci_dev, 0x40, tmp);
-
-	pci_enable_wake(pci_dev, PCI_D3hot, 1);
-	pci_enable_wake(pci_dev, PCI_D3cold, 1);
-
-	/* Power down device*/
-	pci_save_state(pci_dev);
-	pci_set_power_state(pci_dev, pci_choose_state (pci_dev, state));
+	device_wakeup_enable(dev_d);
 
 	return 0;
 }
 
-static int dmfe_resume(struct pci_dev *pci_dev)
+static int __maybe_unused dmfe_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pci_dev);
-	u32 tmp;
-
-	pci_set_power_state(pci_dev, PCI_D0);
-	pci_restore_state(pci_dev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 
 	/* Re-initialize DM910X board */
 	dmfe_init_dm910x(dev);
 
 	/* Disable WOL */
-	pci_read_config_dword(pci_dev, 0x40, &tmp);
-
-	tmp &= ~(DMFE_WOL_LINKCHANGE | DMFE_WOL_MAGICPACKET);
-	pci_write_config_dword(pci_dev, 0x40, tmp);
-
-	pci_enable_wake(pci_dev, PCI_D3hot, 0);
-	pci_enable_wake(pci_dev, PCI_D3cold, 0);
+	device_wakeup_disable(dev_d);
 
 	/* Restart upper layer interface */
 	netif_device_attach(dev);
 
 	return 0;
 }
-#else
-#define dmfe_suspend NULL
-#define dmfe_resume NULL
-#endif
+
+static SIMPLE_DEV_PM_OPS(dmfe_pm_ops, dmfe_suspend, dmfe_resume);
 
 static struct pci_driver dmfe_driver = {
 	.name		= "dmfe",
 	.id_table	= dmfe_pci_tbl,
 	.probe		= dmfe_init_one,
 	.remove		= dmfe_remove_one,
-	.suspend        = dmfe_suspend,
-	.resume         = dmfe_resume
+	.driver.pm	= &dmfe_pm_ops,
 };
 
 MODULE_AUTHOR("Sten Wang, sten_wang@davicom.com.tw");
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
