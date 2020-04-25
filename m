Return-Path: <SRS0=tsT7=6J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE86C55185
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Apr 2020 07:17:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D4820728
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Apr 2020 07:17:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vxfs2SgO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69D4820728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 42ECF87DF9;
	Sat, 25 Apr 2020 07:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94KQHunK8zue; Sat, 25 Apr 2020 07:17:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C21CD87858;
	Sat, 25 Apr 2020 07:17:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF4F4C1AE8;
	Sat, 25 Apr 2020 07:17:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7E76C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 07:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D462287DF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 07:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2-EkX9lBJ1s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 07:17:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6E91987858
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 07:17:23 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id z6so4619052plk.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 00:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LCiVTM/RrP5MB9UAMWjZafxjJ9w9LQDtySRr0yyUvig=;
 b=Vxfs2SgOrwlgUTh7o+2GWV0wuetYq2LMq+61ij9L5cMqLHWNlSOKSeLk9+Ug5Bs/Zn
 JOMbNlzq9qIQ9qEt/BPJOlBCWaNqu2lJh4x16F2Pc2uvmB64TAL1mhHlSBMFYr5noX9w
 U3ETCipN6An/4EdKjUNUR+ZpoCN6JUX+b6XgpsqOXjkDfQAT6VE313TNgM7DoRu920JG
 ZGVGUtz3fLznKzcbR8FQM/Ps6ZcHhmRJePgYogO82jvVwgboEl7jg8X107yaF5mU3tDw
 PhtIqXaAwxHps8tHhOAPk4RqH+id/5aiHpvYr9hRRY+WhAs6ezv+Lgv/EvvYbPRu/xsA
 6+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LCiVTM/RrP5MB9UAMWjZafxjJ9w9LQDtySRr0yyUvig=;
 b=dM2KgIZChJAoehFQix9Jhxp/qo/dpo3V+ndnMwnbSk3Eo7NcdPrFHFTNpKVTorCnon
 m02grc2/5PI2yl5q/Yqg1jt7OqwSKN7QBl3l58iCanTkuBRKXb+yob5CyHeJPGLjl7Bg
 ygQDQR6c5Snh1UPW5kzcWPeOXxsLHRQL5tLJNVSfM6l5cHmDx32hq7ZZigv3m56Y5pM2
 g/Cg6kr2fwW1nKBHfe0dtLghlS3cQfOoqXhDR3uQ32ggAdxNqx73nYiKHeC3v3bSZJsE
 0ABMaZPlRFHWdSGYKTqbJyN2XKYWr5uUyIWICXufogp7nbCOqxkOZRrr9yXuxNyIkzU5
 VbvQ==
X-Gm-Message-State: AGi0Pua8seGNpklyKnxIUUZESkPgDyTeGkHC/qTB33SHMSUnmBnNXCP8
 9B6eQN/echsL5bYGH2fkEmF55FzwyAU=
X-Google-Smtp-Source: APiQypLwsnFP4j1bMDHWlCUWCyrgF1hWgyXHrZ0I2Bj92TAS+pp9MPzkfrZeRdCfQt8F+aHRUF7OJg==
X-Received: by 2002:a17:90a:324f:: with SMTP id
 k73mr11337480pjb.195.1587799042727; 
 Sat, 25 Apr 2020 00:17:22 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.47])
 by smtp.gmail.com with ESMTPSA id x13sm6668365pgh.63.2020.04.25.00.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2020 00:17:22 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org, bjorn@helgaas.com,
 skhan@linuxfoundation.org, rjw@rjwysocki.net
Date: Sat, 25 Apr 2020 12:45:56 +0530
Message-Id: <20200425071557.84850-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200425071557.84850-1-vaibhavgupta40@gmail.com>
References: <20200425071557.84850-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
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
