Return-Path: <SRS0=qUvW=AF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A20CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 17:30:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10E6C20768
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 17:30:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG9nr2JY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10E6C20768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E89D9864E6;
	Wed, 24 Jun 2020 17:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x_lVbaKhrjuf; Wed, 24 Jun 2020 17:30:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 823C8864D0;
	Wed, 24 Jun 2020 17:30:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 721ECC088E;
	Wed, 24 Jun 2020 17:30:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BA96C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6B4D0883C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gYdG5ttj0c8a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F0D06883B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:30:32 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id h22so1432863pjf.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 10:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xJozJ1j72j2TPhbNEWh15qJXYyA6M4xq/pVyTeWMQoY=;
 b=OG9nr2JYFkHQeALLtyTKcxsbgE7wCbLEiBdPfxHp10CmN1aBLQERA1m+bNX5N4F3Pg
 m7y5Esmy4AXqqIj6ynXenmNmWaZKi6lZJZgnKwPPr06VZXfgvDhEwBfIpts8Q/J9EFvy
 ajgp9LX83oXGuRoLijPkz4SM7zvdMb/zuga4Wnga7fvnUeibCRAOO4hmbNdHgiDiISO+
 YugxogygMh9AmaRiQzsnBe+jPQY1a4+fbDP0VE8A6NEv8WK/PHfgEm+VxHjq2z4b3P7K
 NjMRsZZFfnWrmGkvk7/Y6No11mxjPkQSk/L0GHqUsSopN4EhKYSfw3hDVfaQ8h//WSQ9
 om2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xJozJ1j72j2TPhbNEWh15qJXYyA6M4xq/pVyTeWMQoY=;
 b=j5/j1Aq+HZ9Ew7yUZPc3qhWDhWBTrhtKfC3Dk28HHg09nmVH1HNzoIwC4Qio8qc7VN
 YuMTpnjJDALycn23a5GA7xPjCiIGxVg9e/7htAR/ePWbvletChCdsWtSfaw1QE7ocfAb
 G6nJw532AtQ47CHOuUAv5qkqHRFwKa2of60jHeO5ZAXBNlLypYZMhbOR6dpyHtwUbZdN
 FaVd9/Mperwlk3SEfc/hsTvGMTI68fFkGhIaVutCewd4gt5gCglt3xCmOs38UXGtC5si
 TJ4x9BnRvnx4KWpb1/Xyf6uKGyCD7ur77EQwvbERyYjQbmF3GxFC7sfmdHYgu07aPAJW
 jReg==
X-Gm-Message-State: AOAM533bMPNgsnG8QCKmKXgml1+aS23in7+K1cg4ssKQWCFZ8a94CfiB
 pdFFBQ+MkcgKHUdUNAuyw+E=
X-Google-Smtp-Source: ABdhPJz239rrFDKODjZnmMjv567clz1XhGbUtxzIf/rRXiatnuQRf92A5OuBWGvTApB3hN+B8cU1JA==
X-Received: by 2002:a17:902:a60e:: with SMTP id
 u14mr4275213plq.238.1593019832464; 
 Wed, 24 Jun 2020 10:30:32 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id z11sm21187215pfk.141.2020.06.24.10.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 10:30:31 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Date: Wed, 24 Jun 2020 22:58:56 +0530
Message-Id: <20200624172857.60915-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624172857.60915-1-vaibhavgupta40@gmail.com>
References: <20200624172857.60915-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-ide@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 3/4] ide: sc1200: use generic
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

With the support of generic PM callbacks, drivers no longer need to use
legacy .suspend() and .resume() in which they had to maintain PCI states
changes and device's power state themselves. The required operations are
done by PCI core.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/ide/sc1200.c | 43 ++++++++++++++-----------------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/ide/sc1200.c b/drivers/ide/sc1200.c
index a5b701818405..91a197832d1f 100644
--- a/drivers/ide/sc1200.c
+++ b/drivers/ide/sc1200.c
@@ -222,46 +222,33 @@ static void sc1200_set_pio_mode(ide_hwif_t *hwif, ide_drive_t *drive)
 	sc1200_tunepio(drive, pio);
 }
 
-#ifdef CONFIG_PM
 struct sc1200_saved_state {
 	u32 regs[8];
 };
 
-static int sc1200_suspend (struct pci_dev *dev, pm_message_t state)
+static int __maybe_unused sc1200_suspend(struct device *dev_d)
 {
-	printk("SC1200: suspend(%u)\n", state.event);
+	struct pci_dev *dev = to_pci_dev(dev_d);
+	struct ide_host *host = pci_get_drvdata(dev);
+	struct sc1200_saved_state *ss = host->host_priv;
+	unsigned int r;
 
 	/*
-	 * we only save state when going from full power to less
+	 * save timing registers
+	 * (this may be unnecessary if BIOS also does it)
 	 */
-	if (state.event == PM_EVENT_ON) {
-		struct ide_host *host = pci_get_drvdata(dev);
-		struct sc1200_saved_state *ss = host->host_priv;
-		unsigned int r;
-
-		/*
-		 * save timing registers
-		 * (this may be unnecessary if BIOS also does it)
-		 */
-		for (r = 0; r < 8; r++)
-			pci_read_config_dword(dev, 0x40 + r * 4, &ss->regs[r]);
-	}
+	for (r = 0; r < 8; r++)
+		pci_read_config_dword(dev, 0x40 + r * 4, &ss->regs[r]);
 
-	pci_disable_device(dev);
-	pci_set_power_state(dev, pci_choose_state(dev, state));
 	return 0;
 }
 
-static int sc1200_resume (struct pci_dev *dev)
+static int __maybe_unused sc1200_resume(struct device *dev_d)
 {
+	struct pci_dev *dev = to_pci_dev(dev_d);
 	struct ide_host *host = pci_get_drvdata(dev);
 	struct sc1200_saved_state *ss = host->host_priv;
 	unsigned int r;
-	int i;
-
-	i = pci_enable_device(dev);
-	if (i)
-		return i;
 
 	/*
 	 * restore timing registers
@@ -272,7 +259,6 @@ static int sc1200_resume (struct pci_dev *dev)
 
 	return 0;
 }
-#endif
 
 static const struct ide_port_ops sc1200_port_ops = {
 	.set_pio_mode		= sc1200_set_pio_mode,
@@ -326,15 +312,14 @@ static const struct pci_device_id sc1200_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, sc1200_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(sc1200_pm_ops, sc1200_suspend, sc1200_resume);
+
 static struct pci_driver sc1200_pci_driver = {
 	.name		= "SC1200_IDE",
 	.id_table	= sc1200_pci_tbl,
 	.probe		= sc1200_init_one,
 	.remove		= ide_pci_remove,
-#ifdef CONFIG_PM
-	.suspend	= sc1200_suspend,
-	.resume		= sc1200_resume,
-#endif
+	.driver.pm	= &sc1200_pm_ops,
 };
 
 static int __init sc1200_ide_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
