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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE53C83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 14:44:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 224B820746
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 14:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTNPxSCi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 224B820746
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EFF4E84549;
	Tue, 28 Apr 2020 14:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qVoBuRsrs5c8; Tue, 28 Apr 2020 14:44:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 821F884547;
	Tue, 28 Apr 2020 14:44:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D7D1C0864;
	Tue, 28 Apr 2020 14:44:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 026A3C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 14:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EFC4E2046A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 14:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IhqOt9YQ1jsO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 14:44:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 22C222042A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 14:44:28 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y25so10775427pfn.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 07:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JsDPihDIradvM9f3uLrw4TfW583mPkxAjR22PUFbNgw=;
 b=jTNPxSCiyyU0KwKpMbzpSBK4KSkGIk8o1pSKZtwukGLG41ZvNmsGS5VxBVhVsXGGF7
 Y579jbF3hrNbZ7t1P/5xtvo5AJaAr94aSqIKKfTOhKjt/e6f05fj7IdqJid8ZnP22XVM
 pn6dgX1n6cfBOj/wurixACb9gk78J0ilz3cGFS/Sc8bDALFKLmlhU+jpiC+3BfbfDuHz
 Bkpu3URvpdyo02dAiXPfAS/XR6NkkKmJEdbtj+MRgdbQv3uax5VN7GgP/lJnbEzhySLw
 4Mw3gfGC7C5yOgpCKfIstwyEn3QLP6PcjXUa3qIBeXOm/PioypwSCoM7U9945lbZx6sg
 n0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JsDPihDIradvM9f3uLrw4TfW583mPkxAjR22PUFbNgw=;
 b=YYrcqINF376iulfZWNqhwhIkkalMBrFEX9PlKRGPp9v49OKTTq0l5Gqwj1okERA2zG
 y8SjWozA07FANi0JA+kdWmynukGfZiXhhrDqEzctPOIxHdZulBugd0oz1mYwVs45W1RS
 6OQEx+a3XX8Iufu6GT6YT6mZg62zPQNeAnXqE3TbrK3xzeKXnJl/u+sHxvwzJCKIK2yb
 wmTbzMMyG+Kqb9rm6uDOBgqD3oXetWLLnn7ikP6QJ6TnlUN/caVgr8WSgpvnUoyuSMGF
 bspuCA+8MmACiyW0Jr5AN++7CEPpsAhMXjgVokIK0izEjKCzQwdiYYzD1Q+90pSzW+mw
 MYog==
X-Gm-Message-State: AGi0PuaHb1labKGYRbksRiKdna3eFdX23OGZj2mvkEg3Oc8Mn6dXX5HJ
 zP8jOlUOLlChaCRXvnKlpJ0=
X-Google-Smtp-Source: APiQypL3iX01wY2OqSHGJMR8Y4yXNEIVYUlcFdcIISd34gE2G8qCPiXj1wmuiQETuwl5OGVPQq8Yag==
X-Received: by 2002:a63:6f07:: with SMTP id k7mr29916217pgc.274.1588085067622; 
 Tue, 28 Apr 2020 07:44:27 -0700 (PDT)
Received: from varodek.localdomain ([2401:4900:40f3:10a2:97c1:b981:9f1:d7d0])
 by smtp.gmail.com with ESMTPSA id
 d203sm15053203pfd.79.2020.04.28.07.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 07:44:26 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Shannon Nelson <snelson@pensando.io>, Jakub Kicinski <kuba@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Martin Habets <mhabets@solarflare.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, netdev@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, linux-kernel-mentees@lists.linuxfoundation.org,
 rjw@rjwysocki.net
Date: Tue, 28 Apr 2020 20:13:14 +0530
Message-Id: <20200428144314.24533-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200428144314.24533-1-vaibhavgupta40@gmail.com>
References: <20200428144314.24533-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 2/2] realtek/8139cp: Remove Legacy
	Power Management
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

Add "__maybe_unused" attribute to resume() and susend() callbacks
definition to suppress compiler warnings.

Generic callback requires an argument of type "struct device*". Hence,
convert it to "struct net_device*" using "dev_get_drv_data()" to use
it in the callback.

Most of the cleaning part is to remove pci_save_state(),
pci_set_power_state(), etc power management function calls.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/realtek/8139cp.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/realtek/8139cp.c b/drivers/net/ethernet/realtek/8139cp.c
index 60d342f82fb3..4f2fb1393966 100644
--- a/drivers/net/ethernet/realtek/8139cp.c
+++ b/drivers/net/ethernet/realtek/8139cp.c
@@ -2054,10 +2054,9 @@ static void cp_remove_one (struct pci_dev *pdev)
 	free_netdev(dev);
 }
 
-#ifdef CONFIG_PM
-static int cp_suspend (struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused cp_suspend(struct device *device)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(device);
 	struct cp_private *cp = netdev_priv(dev);
 	unsigned long flags;
 
@@ -2075,16 +2074,12 @@ static int cp_suspend (struct pci_dev *pdev, pm_message_t state)
 
 	spin_unlock_irqrestore (&cp->lock, flags);
 
-	pci_save_state(pdev);
-	pci_enable_wake(pdev, pci_choose_state(pdev, state), cp->wol_enabled);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
 	return 0;
 }
 
-static int cp_resume (struct pci_dev *pdev)
+static int __maybe_unused cp_resume(struct device *device)
 {
-	struct net_device *dev = pci_get_drvdata (pdev);
+	struct net_device *dev = dev_get_drvdata(device);
 	struct cp_private *cp = netdev_priv(dev);
 	unsigned long flags;
 
@@ -2093,10 +2088,6 @@ static int cp_resume (struct pci_dev *pdev)
 
 	netif_device_attach (dev);
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	pci_enable_wake(pdev, PCI_D0, 0);
-
 	/* FIXME: sh*t may happen if the Rx ring buffer is depleted */
 	cp_init_rings_index (cp);
 	cp_init_hw (cp);
@@ -2111,7 +2102,6 @@ static int cp_resume (struct pci_dev *pdev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static const struct pci_device_id cp_pci_tbl[] = {
         { PCI_DEVICE(PCI_VENDOR_ID_REALTEK,     PCI_DEVICE_ID_REALTEK_8139), },
@@ -2120,15 +2110,14 @@ static const struct pci_device_id cp_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, cp_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(cp_pm_ops, cp_suspend, cp_resume);
+
 static struct pci_driver cp_driver = {
 	.name         = DRV_NAME,
 	.id_table     = cp_pci_tbl,
 	.probe        =	cp_init_one,
 	.remove       = cp_remove_one,
-#ifdef CONFIG_PM
-	.resume       = cp_resume,
-	.suspend      = cp_suspend,
-#endif
+	.driver.pm    = &cp_pm_ops,
 };
 
 module_pci_driver(cp_driver);
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
