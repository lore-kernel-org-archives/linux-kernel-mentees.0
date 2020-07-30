Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DCDC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 06:55:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A66DA20656
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 06:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8Ml+Xnk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A66DA20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7B6CB8608B;
	Thu, 30 Jul 2020 06:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbUex5++ZVLH; Thu, 30 Jul 2020 06:55:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF6628550D;
	Thu, 30 Jul 2020 06:55:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBF12C004F;
	Thu, 30 Jul 2020 06:55:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0853CC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EACFE8608B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSibOuty3M77
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:55:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 845278550D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:55:36 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z188so6634289pfc.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 23:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxW9b/q+4sJNPVzuIBcNVUFU45uGZZ5i5gNq3WgDQXk=;
 b=V8Ml+Xnk/3Sx7gR5456fsIVmPbCiTzHSXcgcEIj5PZjGhlix6IoZkqR3umOoImk8uq
 njbzH7HCbMc50IcFtseFfnFD4zoZNoFYNL2Uw0avOkcKtddgmbqhJXn30LX1PKbmw12V
 47fOXMGVW71YoNh0AEMqOpaMHwH6WOKxJ3OVF2tbvUGj0MtF9HYEECrU1/sWuvyvcySN
 geePm0m+keM9ES9ExYdTO2KpYUcg8bF5er0Q7Uu5IZPHeulhVqrosdha8hml7f7KUrl4
 jS7EMAEK0Rd27A2992XeqhoTa4vBBgv+4R+u63QYckmLe0NYuWep1wpAT4QUPYDj7keT
 kCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FxW9b/q+4sJNPVzuIBcNVUFU45uGZZ5i5gNq3WgDQXk=;
 b=dsC/M/p8UgP1pYk6XlvRk/1izMqWqbhcTOU80wIjsQrMIdk8TeUsyPLFHuPSlgKrRE
 TiMv/YnkBgijsCJJn+nZmZYsaEva4S3ln3QgHm8l08Csboa10gs9eAlB2LfUcw8fuUeR
 eBAjGy//Ef2seSGTOzd+G9oUmS31v1jHqqpuDD8O5UbTLPNj2oGH9v1CZ+ZPF1V0rQHM
 5SYGFeBeG+WNh2/ZOFTJhmRgqUJ6lHWrfxC1291sztIa1A/rICSBd4sxxQm9Uh0ImsYq
 CBVT9SIjJElFNSRKW3ADHVGto/EFwO/NofutKSA4WGNMK0CwOOst3iyzASMqdvc5wKrI
 V7ag==
X-Gm-Message-State: AOAM530d54msiZdkPBY1KZY5u/HEMFYmKDwaObw7kQ1NjuMAAeN3bTDp
 opR5sEuSIJTIKpoIK+9XcaU=
X-Google-Smtp-Source: ABdhPJxOE5s0tndKBfHkuFL0NM6Oz2rP0sYzx/wQfhvMQgLEEwymbZO6LPqTZTuIeE0DgdO9JtlV4A==
X-Received: by 2002:a63:cf49:: with SMTP id b9mr31966967pgj.31.1596092136120; 
 Wed, 29 Jul 2020 23:55:36 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id v2sm4232299pje.19.2020.07.29.23.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 23:55:35 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Daniele Venzano <venza@brownhat.org>, Samuel Chessman <chessman@tux.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 30 Jul 2020 12:23:35 +0530
Message-Id: <20200730065336.198315-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730065336.198315-1-vaibhavgupta40@gmail.com>
References: <20200730065336.198315-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 2/3] sis900: use generic power
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
 drivers/net/ethernet/sis/sis900.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/sis/sis900.c b/drivers/net/ethernet/sis/sis900.c
index 81ed7589e33c..2af2c9816dfc 100644
--- a/drivers/net/ethernet/sis/sis900.c
+++ b/drivers/net/ethernet/sis/sis900.c
@@ -2493,11 +2493,9 @@ static void sis900_remove(struct pci_dev *pci_dev)
 	pci_release_regions(pci_dev);
 }
 
-#ifdef CONFIG_PM
-
-static int sis900_suspend(struct pci_dev *pci_dev, pm_message_t state)
+static int __maybe_unused sis900_suspend(struct device *dev)
 {
-	struct net_device *net_dev = pci_get_drvdata(pci_dev);
+	struct net_device *net_dev = dev_get_drvdata(dev);
 	struct sis900_private *sis_priv = netdev_priv(net_dev);
 	void __iomem *ioaddr = sis_priv->ioaddr;
 
@@ -2510,22 +2508,17 @@ static int sis900_suspend(struct pci_dev *pci_dev, pm_message_t state)
 	/* Stop the chip's Tx and Rx Status Machine */
 	sw32(cr, RxDIS | TxDIS | sr32(cr));
 
-	pci_set_power_state(pci_dev, PCI_D3hot);
-	pci_save_state(pci_dev);
-
 	return 0;
 }
 
-static int sis900_resume(struct pci_dev *pci_dev)
+static int __maybe_unused sis900_resume(struct device *dev)
 {
-	struct net_device *net_dev = pci_get_drvdata(pci_dev);
+	struct net_device *net_dev = dev_get_drvdata(dev);
 	struct sis900_private *sis_priv = netdev_priv(net_dev);
 	void __iomem *ioaddr = sis_priv->ioaddr;
 
 	if(!netif_running(net_dev))
 		return 0;
-	pci_restore_state(pci_dev);
-	pci_set_power_state(pci_dev, PCI_D0);
 
 	sis900_init_rxfilter(net_dev);
 
@@ -2549,17 +2542,15 @@ static int sis900_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
+
+static SIMPLE_DEV_PM_OPS(sis900_pm_ops, sis900_suspend, sis900_resume);
 
 static struct pci_driver sis900_pci_driver = {
 	.name		= SIS900_MODULE_NAME,
 	.id_table	= sis900_pci_tbl,
 	.probe		= sis900_probe,
 	.remove		= sis900_remove,
-#ifdef CONFIG_PM
-	.suspend	= sis900_suspend,
-	.resume		= sis900_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= &sis900_pm_ops,
 };
 
 static int __init sis900_init_module(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
