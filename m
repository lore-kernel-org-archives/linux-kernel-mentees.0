Return-Path: <SRS0=5DCt=AD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6F3C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:44:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1347520716
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:44:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrBa16eg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1347520716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DD93D20426;
	Mon, 22 Jun 2020 11:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ts7sQwjbDt7d; Mon, 22 Jun 2020 11:44:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 35BB0203DB;
	Mon, 22 Jun 2020 11:44:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32109C0891;
	Mon, 22 Jun 2020 11:44:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB7E9C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C8DDE87E57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XV1TCdUuazck
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3CB7E87DEF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:27 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id l63so8021155pge.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WzDzrg/pch1EgVKcPwg7I2YaiPXfTbbhSV+G88b8TxU=;
 b=LrBa16egO6ZcXQeENGdXRQ7FIz7WVhoOD47Fz0V1DDN8wUgEvTxyDSjCnq2w32QLLg
 DWTRxEXLYqeiwyIH2VPOZ8fFEG3TCsJ4rUqVGnAWpeexvJ2NG/jznb895mdb5txpUifl
 MPq5saQvtjhNwzGKFs+bNDAcqlXYWf7cO1cXzm3V5qTqgyUl/vCI+LIiNqEzHSweaDbN
 JItcbJi/N8NjMDIwiu561FllXW0nhP9uVxb97qAdf+hcH+dJTikr4J3dTOJfoOaNuAoz
 8PztmvySg+/OLHx7gEkyz+pJDKgFCqdVVvHiK5/rNIZd5l8U7AqiMrthl048ShMYj633
 /D4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WzDzrg/pch1EgVKcPwg7I2YaiPXfTbbhSV+G88b8TxU=;
 b=YtdLt5LI5eoptLUv4WsJXE38or+WYHvkeCsdndidhGydrOcaWDwnvKD7Ou7jWzSfzQ
 1GFMP11IJpv+FdrhABo0gGobQ3sB1eoRUjHoGYMpJ770mRKAQ1MBSt+Oup0fRqsXXDxr
 /mBhbHHx9mT8bkdYwcObpfIFI9mYWW0Ggv76reIdaIbTv7dUYiEau1PVcvmRsJTJpgD9
 2WpgIo+pwWI2jT0PQzJk1gWd0DMbnPtvCmso5GfdYdF5KkNxIF11M/uoR/KxhiY6IjY5
 SftgZ9pWRNQ432JkCwPdPQqWeB01Pzghv5sNZVhHJQyyqa/2dPfKexX+YswtpLN3SYaN
 MS+g==
X-Gm-Message-State: AOAM53346dJ5iCZ5iw1ZRZd4Ev9bSqOnZp34+h6Ybu7hNstABqjOoF34
 ERs5gv5pmh9w2Lw/khI5bI4=
X-Google-Smtp-Source: ABdhPJw5y8pVGRO9YS9EL2B22De7BqsHzxNEVwiayIQ15BCyd9Z7GI041VolqqPSR2j7lDxhzqFXOQ==
X-Received: by 2002:a63:d317:: with SMTP id b23mr12566402pgg.132.1592826266721; 
 Mon, 22 Jun 2020 04:44:26 -0700 (PDT)
Received: from varodek.localdomain ([2401:4900:b8b:123e:d7ae:5602:b3d:9c0])
 by smtp.gmail.com with ESMTPSA id j17sm14081032pjy.22.2020.06.22.04.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:44:26 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Mon, 22 Jun 2020 17:12:27 +0530
Message-Id: <20200622114228.60027-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622114228.60027-1-vaibhavgupta40@gmail.com>
References: <20200622114228.60027-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-parisc@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 4/5] tulip: tulip_core: use
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

With the support of generic PM callbacks, drivers no longer need to use
legacy .suspend() and .resume() in which they had to maintain PCI
states changes and device's power state themselves.

Earlier, .suspend() and .resume() were invoking pci_disable_device()
and pci_enable_device() respectively to manage the device's power state.
driver also invoked pci_save/restore_state() and pci_set_power_sitate().
With generic PM, it is no longer needed. The driver is expected to just
implement driver-specific operations and leave power transitions to PCI
core.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/dec/tulip/tulip_core.c | 51 +++++----------------
 1 file changed, 12 insertions(+), 39 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/tulip_core.c b/drivers/net/ethernet/dec/tulip/tulip_core.c
index 15efc294f513..9db23527275a 100644
--- a/drivers/net/ethernet/dec/tulip/tulip_core.c
+++ b/drivers/net/ethernet/dec/tulip/tulip_core.c
@@ -1803,13 +1803,9 @@ static void tulip_set_wolopts (struct pci_dev *pdev, u32 wolopts)
 	}
 }
 
-#ifdef CONFIG_PM
-
-
-static int tulip_suspend (struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused tulip_suspend(struct device *dev_d)
 {
-	pci_power_t pstate;
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct tulip_private *tp = netdev_priv(dev);
 
 	if (!dev)
@@ -1825,45 +1821,27 @@ static int tulip_suspend (struct pci_dev *pdev, pm_message_t state)
 	free_irq(tp->pdev->irq, dev);
 
 save_state:
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pstate = pci_choose_state(pdev, state);
-	if (state.event == PM_EVENT_SUSPEND && pstate != PCI_D0) {
-		int rc;
-
-		tulip_set_wolopts(pdev, tp->wolinfo.wolopts);
-		rc = pci_enable_wake(pdev, pstate, tp->wolinfo.wolopts);
-		if (rc)
-			pr_err("pci_enable_wake failed (%d)\n", rc);
-	}
-	pci_set_power_state(pdev, pstate);
+	tulip_set_wolopts(to_pci_dev(dev_d), tp->wolinfo.wolopts);
+	device_set_wakeup_enable(dev_d, !!tp->wolinfo.wolopts);
 
 	return 0;
 }
 
-
-static int tulip_resume(struct pci_dev *pdev)
+static int __maybe_unused tulip_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct pci_dev *pdev = to_pci_dev(dev_d);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct tulip_private *tp = netdev_priv(dev);
 	void __iomem *ioaddr = tp->base_addr;
-	int retval;
 	unsigned int tmp;
+	int retval = 0;
 
 	if (!dev)
 		return -EINVAL;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
 	if (!netif_running(dev))
 		return 0;
 
-	if ((retval = pci_enable_device(pdev))) {
-		pr_err("pci_enable_device failed in resume\n");
-		return retval;
-	}
-
 	retval = request_irq(pdev->irq, tulip_interrupt, IRQF_SHARED,
 			     dev->name, dev);
 	if (retval) {
@@ -1872,8 +1850,7 @@ static int tulip_resume(struct pci_dev *pdev)
 	}
 
 	if (tp->flags & COMET_PM) {
-		pci_enable_wake(pdev, PCI_D3hot, 0);
-		pci_enable_wake(pdev, PCI_D3cold, 0);
+		device_set_wakeup_enable(dev_d, 0);
 
 		/* Clear the PMES flag */
 		tmp = ioread32(ioaddr + CSR20);
@@ -1891,9 +1868,6 @@ static int tulip_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-#endif /* CONFIG_PM */
-
-
 static void tulip_remove_one(struct pci_dev *pdev)
 {
 	struct net_device *dev = pci_get_drvdata (pdev);
@@ -1937,15 +1911,14 @@ static void poll_tulip (struct net_device *dev)
 }
 #endif
 
+static SIMPLE_DEV_PM_OPS(tulip_pm_ops, tulip_suspend, tulip_resume);
+
 static struct pci_driver tulip_driver = {
 	.name		= DRV_NAME,
 	.id_table	= tulip_pci_tbl,
 	.probe		= tulip_init_one,
 	.remove		= tulip_remove_one,
-#ifdef CONFIG_PM
-	.suspend	= tulip_suspend,
-	.resume		= tulip_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= &tulip_pm_ops,
 };
 
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
