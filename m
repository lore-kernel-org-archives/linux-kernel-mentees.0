Return-Path: <SRS0=2zBv=7I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BA6C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 08:05:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8682A2071A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 08:05:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDkz+eJC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8682A2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6C2AB8836E;
	Tue, 26 May 2020 08:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2SlOBw7Rk+cS; Tue, 26 May 2020 08:05:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E50BC88347;
	Tue, 26 May 2020 08:05:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D29EAC0888;
	Tue, 26 May 2020 08:05:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19A44C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F379A22802
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q-C5Nilq9r0H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:05:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 9FEED2035D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:05:05 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id l73so4556067pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PlwFQdfdCmfSwOeUTRovD942w6tO4d7LRvzC7J4XcqA=;
 b=pDkz+eJChZDIv9m2rtYLnfyfQOMv1f7nYKnKlGQuQ+paT+GzmxYrIz78q8SEZz5okF
 4q8f9Z4NNdrvbaIg/sZq+yLfhIq9va4yW1c/kysxCU4YFOMTmZ9R+VgDno++IXcUaKZL
 47tcm2H+k4dRpuv4+eLNweYz+T/u7aFxWJEe/8Fs8EAk5BDlk3UHpMJq+/I2yEn6xxgI
 cv+X/DdGPPMhmT9djiGWOxWjCkk96xe0Oi8V0SCHlbzDQp8vBQaAgXXkvGfFcDv6ktWm
 aPQbhmmdCP+IaCYVBiia7cYmX3T93rIGUjkP0JDCiWHvXng2+wkAWyoNfKSdglDZB7Rd
 PYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PlwFQdfdCmfSwOeUTRovD942w6tO4d7LRvzC7J4XcqA=;
 b=knG6pAGm2vnex0DNjLsAGPMiyqbNJB8e7b+Gvd3ce08ae+sttsLKWviSAsycppxrhl
 Ou1I1pm9IxDJRAUDscGGCMvR2qmjiagiVPkNe9+/D/X1isNJMnTzHMaqlkQezNv3XqPx
 OkcoeY+coh7xC0AEXABG6nfNBiu+oNPCWea20ie76GUK4UlhsBG83AxLdaq3AuLpwCDX
 uLP5C+sj2vlHNGdGg3yMYMBzQn7CdjF8dpnY62ktZlx1nskiv3mu/ki5JohHMrXlbiWG
 TkmnkNVyVAWbNwUdtAebFKMDmYpmXD70U9d64Z86HeIICrUzJLoFfb9ZgKMHqpIiLkRk
 87iQ==
X-Gm-Message-State: AOAM530TRHnAbg1kwHLanoSjzBbVEDRT94yqQ+ScYrpu9sLyyO3pO1P6
 lXSiyhtiH6BGUceM+TFE3WQ=
X-Google-Smtp-Source: ABdhPJzWmQSDNQwEgG3hSXQXPPh564uH3Bj59AaIEpppfhcb0ZSx42XMCCIubBNsIaZom0CqcM0Ybg==
X-Received: by 2002:a17:90a:b883:: with SMTP id
 o3mr23087659pjr.81.1590480305058; 
 Tue, 26 May 2020 01:05:05 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.209])
 by smtp.gmail.com with ESMTPSA id fa19sm8614477pjb.18.2020.05.26.01.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 01:05:04 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Don Fry <pcnet32@frontier.com>, Tom Lendacky <thomas.lendacky@amd.com>
Date: Tue, 26 May 2020 13:33:23 +0530
Message-Id: <20200526080324.69828-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526080324.69828-1-vaibhavgupta40@gmail.com>
References: <20200526080324.69828-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [RFC PATCH v1 2/3] amd8111e: Convert to
	generic power mangement
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

Drivers should not save device registers and/or change the power state of
the device. As per the generic PM approach, these are handled by PCI core.

The driver should support dev_pm_ops callbacks and bind them to pci_driver.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/amd/amd8111e.c | 30 +++++++++++------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/amd/amd8111e.c b/drivers/net/ethernet/amd/amd8111e.c
index 7a1286f8e983..c6591b33abcc 100644
--- a/drivers/net/ethernet/amd/amd8111e.c
+++ b/drivers/net/ethernet/amd/amd8111e.c
@@ -1580,9 +1580,10 @@ static void amd8111e_tx_timeout(struct net_device *dev, unsigned int txqueue)
 	if(!err)
 		netif_wake_queue(dev);
 }
-static int amd8111e_suspend(struct pci_dev *pci_dev, pm_message_t state)
+
+static int amd8111e_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pci_dev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct amd8111e_priv *lp = netdev_priv(dev);
 
 	if (!netif_running(dev))
@@ -1609,34 +1610,24 @@ static int amd8111e_suspend(struct pci_dev *pci_dev, pm_message_t state)
 		if(lp->options & OPTION_WAKE_PHY_ENABLE)
 			amd8111e_enable_link_change(lp);
 
-		pci_enable_wake(pci_dev, PCI_D3hot, 1);
-		pci_enable_wake(pci_dev, PCI_D3cold, 1);
+		device_set_wakeup_enable(dev_d, 1);
 
 	}
 	else{
-		pci_enable_wake(pci_dev, PCI_D3hot, 0);
-		pci_enable_wake(pci_dev, PCI_D3cold, 0);
+		device_set_wakeup_enable(dev_d, 0);
 	}
 
-	pci_save_state(pci_dev);
-	pci_set_power_state(pci_dev, PCI_D3hot);
-
 	return 0;
 }
-static int amd8111e_resume(struct pci_dev *pci_dev)
+
+static int amd8111e_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pci_dev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct amd8111e_priv *lp = netdev_priv(dev);
 
 	if (!netif_running(dev))
 		return 0;
 
-	pci_set_power_state(pci_dev, PCI_D0);
-	pci_restore_state(pci_dev);
-
-	pci_enable_wake(pci_dev, PCI_D3hot, 0);
-	pci_enable_wake(pci_dev, PCI_D3cold, 0); /* D3 cold */
-
 	netif_device_attach(dev);
 
 	spin_lock_irq(&lp->lock);
@@ -1918,13 +1909,14 @@ static const struct pci_device_id amd8111e_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, amd8111e_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(amd8111e_pm_ops, amd8111e_suspend, amd8111e_resume);
+
 static struct pci_driver amd8111e_driver = {
 	.name   	= MODULE_NAME,
 	.id_table	= amd8111e_pci_tbl,
 	.probe		= amd8111e_probe_one,
 	.remove		= amd8111e_remove_one,
-	.suspend	= amd8111e_suspend,
-	.resume		= amd8111e_resume
+	.driver.pm	= &amd8111e_pm_ops
 };
 
 module_pci_driver(amd8111e_driver);
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
