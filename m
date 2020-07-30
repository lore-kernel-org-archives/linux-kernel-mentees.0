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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7A9C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 06:44:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29647206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 06:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3QhzXOJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29647206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E42DF86AE6;
	Thu, 30 Jul 2020 06:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QqnauplqdvRf; Thu, 30 Jul 2020 06:44:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 75CDE85EF0;
	Thu, 30 Jul 2020 06:44:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64CA6C004F;
	Thu, 30 Jul 2020 06:44:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A642AC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 92A5C8839A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M239vE2DBNMy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0F7778695B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:20 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 74so6205926pfx.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 23:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=txXh6bMNLO/zbmwd7UTGY/9gRZdmj9zCt/b5o3lUEMw=;
 b=Y3QhzXOJBNAVmgDvV+Z/DqNWZ0nvSKvRCAcaaA6jLbcQMW5vkp8TDbFHM2MgT7QaxC
 4GxTyx4vhmBDBiJ15WTSIMKj1j1dtwliPJcgY6Mq4pq5jeRd1A/+HlZDTcg4cgAKQDiW
 pQ9as7AVyOH6YOrOuE+ErJMqc2KCmsdXYiyuQN3tqH0F4J0A4/RDaSmmVL1qEOyq+SL/
 nX2v8BRAdBogUSu+QjZotGE1JM4jOdnBWbAh3Lwy+QQ5W+Qa64FdKea8Ou3I3zhnOhrL
 YVk63YWYjvj6+hlld7Sea2jvDlBcSRTyP3dUC5kbTCko/T0B+m6lAXDjPKRTbhNZ2vnw
 f51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=txXh6bMNLO/zbmwd7UTGY/9gRZdmj9zCt/b5o3lUEMw=;
 b=p7u2sMUuzOkPANbj6BqHs8uR4GQV0tdcamjlvelB6aUzfFGXSaJyzYQgguq5nwV6Rs
 Xre9QBPQkeZukc1bcJk8A+SIHJOtQOBYaR/2JzUXEWbWeWyzMzc5iLFI1zJy8GK5bf3r
 lRQnX1I/QDXUj2ZvP7CDpYtFdaBOGadA3IYATQTw5xTRDafDpvxiqoMfL0ufuoIMTeRZ
 JS4uCaxKu8deIPUrhdLljqq4cTA7fCaS8hrftLwc8J3OxunAzEn3tD/MowOK/XLYX1Ib
 MDOFLpaRXe6wq0g94bfzxOG7pJsHyMJsXD4nQkjj6xaZ0coFM2+FKdo+/QkFJWj6rBE2
 wyDg==
X-Gm-Message-State: AOAM531FXQrst+hS04lalDMNdLuNbGrOEAqKpxT4hRmFmxM9ZiNRJsQZ
 hp4wIOZjGFW417zoavbdBVk=
X-Google-Smtp-Source: ABdhPJyE2zPvOd/dNMtFYN9mwdZsqnjTLjF/RyuHTmuFSAVD9zVA79/Cuua8OyO06BnIjFS6zg3Nqg==
X-Received: by 2002:a63:6e08:: with SMTP id j8mr33133261pgc.187.1596091459601; 
 Wed, 29 Jul 2020 23:44:19 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t19sm4456942pgg.19.2020.07.29.23.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 23:44:19 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Daniele Venzano <venza@brownhat.org>, Samuel Chessman <chessman@tux.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 30 Jul 2020 12:12:27 +0530
Message-Id: <20200730064229.174933-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730064229.174933-1-vaibhavgupta40@gmail.com>
References: <20200730051733.113652-1-vaibhavgupta40@gmail.com>
 <20200730064229.174933-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 1/3] sc92031: use generic power
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
 drivers/net/ethernet/silan/sc92031.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/silan/sc92031.c b/drivers/net/ethernet/silan/sc92031.c
index cb043eb1bdc1..f94078f8ebe5 100644
--- a/drivers/net/ethernet/silan/sc92031.c
+++ b/drivers/net/ethernet/silan/sc92031.c
@@ -1499,15 +1499,13 @@ static void sc92031_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-static int sc92031_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused sc92031_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct sc92031_priv *priv = netdev_priv(dev);
 
-	pci_save_state(pdev);
-
 	if (!netif_running(dev))
-		goto out;
+		return 0;
 
 	netif_device_detach(dev);
 
@@ -1521,22 +1519,16 @@ static int sc92031_suspend(struct pci_dev *pdev, pm_message_t state)
 
 	spin_unlock_bh(&priv->lock);
 
-out:
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
 	return 0;
 }
 
-static int sc92031_resume(struct pci_dev *pdev)
+static int __maybe_unused sc92031_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct sc92031_priv *priv = netdev_priv(dev);
 
-	pci_restore_state(pdev);
-	pci_set_power_state(pdev, PCI_D0);
-
 	if (!netif_running(dev))
-		goto out;
+		return 0;
 
 	/* Interrupts already disabled by sc92031_suspend */
 	spin_lock_bh(&priv->lock);
@@ -1553,7 +1545,6 @@ static int sc92031_resume(struct pci_dev *pdev)
 	else
 		netif_tx_disable(dev);
 
-out:
 	return 0;
 }
 
@@ -1565,13 +1556,14 @@ static const struct pci_device_id sc92031_pci_device_id_table[] = {
 };
 MODULE_DEVICE_TABLE(pci, sc92031_pci_device_id_table);
 
+static SIMPLE_DEV_PM_OPS(sc92031_pm_ops, sc92031_suspend, sc92031_resume);
+
 static struct pci_driver sc92031_pci_driver = {
 	.name		= SC92031_NAME,
 	.id_table	= sc92031_pci_device_id_table,
 	.probe		= sc92031_probe,
 	.remove		= sc92031_remove,
-	.suspend	= sc92031_suspend,
-	.resume		= sc92031_resume,
+	.driver.pm	= &sc92031_pm_ops,
 };
 
 module_pci_driver(sc92031_pci_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
