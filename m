Return-Path: <SRS0=A5MH=7A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC24C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 May 2020 15:03:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90BAF2065F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 May 2020 15:03:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJ+nmeTE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90BAF2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5AF5F21505;
	Mon, 18 May 2020 15:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gY2Ee5rOIsKK; Mon, 18 May 2020 15:03:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 823DA2012D;
	Mon, 18 May 2020 15:03:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D40AC0881;
	Mon, 18 May 2020 15:03:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6805CC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5B74F8861F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UEWJEZUg6xwG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:03:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2DCAB87FEA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 15:03:30 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id p21so4949663pgm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2020 08:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89NAWHbMqaWrTmR4XBFd6RaaE9tXY8/qNz7kfdyAHpo=;
 b=gJ+nmeTEhiidK4lcg/MEpTINIRc47wPb8Rfa82RqD2giHWu25sQf8b1uyzm70ybDDz
 D16A2NhBINLmkvt+H2fL9ckfqyfdEzm7/a880R8ae0F5HGxM1lYxurNkoxBhLQ4+NGj6
 nFI4R1oZhQi5Z4mUOc36TPqvVUfUa33nNYmkfeLewhRNnCCztapf8QXYmD24t8Ioguz3
 AfsIaNVSJF0rs3kAcLuc6EtcGdUf4haM33cvWDys7Ilyt8gdUF6QZfdBQCqWif/r+vdA
 rQsFdzEMrU+LZhXeBDoBJ0Omqf7eEYYDZxZYKbgoNkR/vKlD+FKmmgplCg3oxAbe/6yI
 WMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89NAWHbMqaWrTmR4XBFd6RaaE9tXY8/qNz7kfdyAHpo=;
 b=Hbv4wShe/Uh7h24RGNOb3ZQi8PlQECriWSrj/eRXWCZhh7J7CEl1M2wa77t2/QQaZo
 /0VClST8q4LNrh9H+QD2yZ8CkLcDck263aYQX7OJyaWJxEiw2FE1nxqXiWuADAyPA/RJ
 YCjesnBBM3DopgFZO5MDhDVAwsqNBkXjGusHailMeff+X/3ev94K3OQ9Pj2Qu/cenHg1
 CwRzGjHA69d03JkkD07aM7hO/ru3upaEcGXa0Xijxdho0fiKI2CvcVhxIds/Zg1fggAr
 ffkhC2ICvacCW4u/gx1b0GEWcQt/MWO6yLjqk+8FDOkfbuzAerEbHl7/szdBtoZ72Amm
 nzIw==
X-Gm-Message-State: AOAM530nSzA+JGlK4N2K5Cofz+vTHhEyTNcfe+IP86ten+G5bgjq7Ds1
 tf9qIcvtHJU3ZGZugEpf8kA=
X-Google-Smtp-Source: ABdhPJxgAK2EsPrRzqc+FBc+sNQH5pRWNatd9DrBmJGIAgTAN3kwU45TEYHMqpRVgfECekigyuJ5FQ==
X-Received: by 2002:a63:e70b:: with SMTP id b11mr2270409pgi.88.1589814209675; 
 Mon, 18 May 2020 08:03:29 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.209])
 by smtp.gmail.com with ESMTPSA id k1sm7963142pgh.78.2020.05.18.08.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 08:03:29 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, netdev@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, linux-kernel-mentees@lists.linuxfoundation.org,
 rjw@rjwysocki.net, "David S . Miller" <davem@davemloft.net>
Date: Mon, 18 May 2020 20:32:14 +0530
Message-Id: <20200518150214.100491-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518150214.100491-1-vaibhavgupta40@gmail.com>
References: <20200518150214.100491-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH net-next v3 2/2] realtek/8139cp: use
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

compile-tested only

With legacy PM hooks, it was the responsibility
of a driver to manage PCI states and also
device's power state. The generic approach is
to let PCI core handle the work.

The suspend callback enables/disables PCI wake
on the basis of "cp->wol_enabled" variable
which is unknown to PCI core. To utilise its
need, call device_set_wakeup_enable().

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/realtek/8139cp.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/realtek/8139cp.c b/drivers/net/ethernet/realtek/8139cp.c
index 60d342f82fb3..e291e6ac40cb 100644
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
 
@@ -2075,16 +2074,14 @@ static int cp_suspend (struct pci_dev *pdev, pm_message_t state)
 
 	spin_unlock_irqrestore (&cp->lock, flags);
 
-	pci_save_state(pdev);
-	pci_enable_wake(pdev, pci_choose_state(pdev, state), cp->wol_enabled);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
+	device_set_wakeup_enable(device, cp->wol_enabled);
 
 	return 0;
 }
 
-static int cp_resume (struct pci_dev *pdev)
+static int __maybe_unused cp_resume(struct device *device)
 {
-	struct net_device *dev = pci_get_drvdata (pdev);
+	struct net_device *dev = dev_get_drvdata(device);
 	struct cp_private *cp = netdev_priv(dev);
 	unsigned long flags;
 
@@ -2093,10 +2090,6 @@ static int cp_resume (struct pci_dev *pdev)
 
 	netif_device_attach (dev);
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	pci_enable_wake(pdev, PCI_D0, 0);
-
 	/* FIXME: sh*t may happen if the Rx ring buffer is depleted */
 	cp_init_rings_index (cp);
 	cp_init_hw (cp);
@@ -2111,7 +2104,6 @@ static int cp_resume (struct pci_dev *pdev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static const struct pci_device_id cp_pci_tbl[] = {
         { PCI_DEVICE(PCI_VENDOR_ID_REALTEK,     PCI_DEVICE_ID_REALTEK_8139), },
@@ -2120,15 +2112,14 @@ static const struct pci_device_id cp_pci_tbl[] = {
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
