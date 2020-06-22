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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A641C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:15:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6C820738
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbGBlQt5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6C820738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 47FAE88587;
	Mon, 22 Jun 2020 11:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjDskt56Zy6f; Mon, 22 Jun 2020 11:15:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D0BB5877D6;
	Mon, 22 Jun 2020 11:15:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDA0CC0891;
	Mon, 22 Jun 2020 11:15:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9ED8AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9B871877D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VBj+oHxRieMT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1C63E8733E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:38 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id u8so8010896pje.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sxPv/Iyoimpx50ZrGLI4f7gnz66vb/eKDQ1bVrimQeA=;
 b=NbGBlQt5sHYNuNvrqaq0Ld4jjjxR4/TAI8CKJdvl3WkAzuV8B4LnvIUzuc5rT+uUpQ
 UGWoNydliKXJYPZSPPSUnxAqM5Jwx8h2mx6d4kMxDdwM1O979WVh/tWOalnpufh6An1M
 IAabhnHFmp28TsIsonT9hBNdXp9ZWY139a8Jp6zD5tiC1nIukE6EioSxjZTHPy162NYm
 a6l1O13/4b63mf3CfTRLf27B8Z2BxzvuoQAedIVXf3UuhlfwYu8se2rvHhpUXYGl8X73
 yYeGuh0C7nKZLlyVieEkJt0zut1eO/MVCCrsUHy427IsWLOM8QCPhkBSPxVaCkAeGE3j
 f2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sxPv/Iyoimpx50ZrGLI4f7gnz66vb/eKDQ1bVrimQeA=;
 b=JGXoQ7JjS74KeJGGcvBg5KKc9whRvi3vl9BhzVIvnft79I77mFJrDv7K7Zi4v23pUS
 fSVxVRFDMdmyt4tChQb+RMS8nu7Ce5ARnp4vZ0I/JMzV4cSm/0lfnv0gGv2aDRyO5gVY
 4eMFNtr5jinUWJC4M5TiMXKmxO3EodqMGVRnwzyPAofkNOKRyofZfnrCLZOYMXGW9sXg
 yyqY31c/UlIyuQBNEQAoirWv6N31Y2IIxkzBtj7I+yf4y+hkXvbJtjSvovQumcGrBDho
 p1453FbDNiAYN4yxE5XlI/t5wpXaLuSQWtoq7kxERYPXkiBF8KnPeMi5JDx9+2a54HpE
 z2MQ==
X-Gm-Message-State: AOAM531yxGobAV5wub8fBaF9FHwWownZzqlrGEdMSbXUYllF0uvCaLEo
 rfH7ySwPnZxJ+0VUrgmVQjM=
X-Google-Smtp-Source: ABdhPJzZO5xLP2AwlmraI94flE9YliyRPA8lEdwVhoqOd0C80a6IiTL2RDKR/0y/elsqHYMyfM5Clw==
X-Received: by 2002:a17:902:7404:: with SMTP id
 g4mr18941802pll.134.1592824537633; 
 Mon, 22 Jun 2020 04:15:37 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id n189sm13950150pfn.108.2020.06.22.04.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:15:37 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Don Fry <pcnet32@frontier.com>, Tom Lendacky <thomas.lendacky@amd.com>
Date: Mon, 22 Jun 2020 16:43:59 +0530
Message-Id: <20200622111400.55956-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622111400.55956-1-vaibhavgupta40@gmail.com>
References: <20200622111400.55956-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 2/3] amd8111e: Convert to generic
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

Drivers should not save device registers and/or change the power state of
the device. As per the generic PM approach, these are handled by PCI core.

The driver should support dev_pm_ops callbacks and bind them to pci_driver.

Compile-tested only.

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
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
