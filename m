Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72DDC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 09:00:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CCFD20775
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 09:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emxPU/TI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CCFD20775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8142187880;
	Tue, 28 Jul 2020 09:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zwT7nEeIjT4R; Tue, 28 Jul 2020 09:00:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8BE59877FA;
	Tue, 28 Jul 2020 09:00:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73158C0050;
	Tue, 28 Jul 2020 09:00:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1598EC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F15522284F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KajQfLXvHiWC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:00:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id A4BD122849
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:00:12 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id m8so3706856pfh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 02:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXWDEkg4433DRZvcoGLFZLwDxOJJX9Wg+/QFW7sV+OE=;
 b=emxPU/TIzPfj1TTUnuwUbMvATPs5XLnweOqB7/KY0b/Q41TG/uOC57PgMlZ7HE8UPp
 VzhUlN0h8hJW8SZiX+cuwGOQoOeOm/kBDw/W7lf46h+xL5kcsNgomTpkwhYdovIRlp3f
 fvGGba+i3cc82fgMGZ3DGf5BnnwD6UyQn8v5iaUgtnu/ULswv2CwuyeY393zna07UOTH
 E3iT4FvwNUm1bWVWfvRWuD8R4YCTG9E9TU5nbn73oZVZ/+w7YPLc7Cm6Y2bRupbzKyWM
 bkq7nLfljswYuCP8P1PbXzVG/MJoc9yY+f//Cls2C9IIsYdHvE/2eAdm2R4+KcfwQVl2
 Q/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXWDEkg4433DRZvcoGLFZLwDxOJJX9Wg+/QFW7sV+OE=;
 b=U+Zgq5961uIYJfzCgzZf88n8P383Q7vZ/YzmDoWJ/P3i2rZsAdTFhlyx7/7ACWeEeq
 oFP1Z/xwGIOo4YrKHGurEzAb5gNsDvwvzNJswY5KTagTakuxza8QoBHFZTrsvLnrbB3D
 xnv0HHY7YUIbG53F5Tl1CTrvn6JWYgqJaG9OUw4mPvKM1+uxBYjCg/rOS09ZkVc2z9U6
 UyCM4I4Z3NYEQjnEfifmK7pINwN0BSLS0S+t+hoRovyg6GMoshPXR/PdwALvuvCDNDtl
 VeYJam5eHwXFHi5nU90x0rKPKNJ1/h5JBtZfHddaOOV+w6u1Z5ib5EMBSLIIq/x+qw3H
 8dAQ==
X-Gm-Message-State: AOAM531suHSXP+zyTYjHKybpmmPJTNRxr9cOuCX26w8n5gCrg9rfIllX
 fKA2Gm1Rg+SF8OCCdy+EOiA=
X-Google-Smtp-Source: ABdhPJwofzJqI96SNcAW3qc+RKA54AqcQwu88f1RTCsajCDXpWPqPEh74QJSWZ0ijFUX9TKSrful8w==
X-Received: by 2002:a63:3541:: with SMTP id c62mr833395pga.127.1595926812125; 
 Tue, 28 Jul 2020 02:00:12 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t11sm9306174pfh.35.2020.07.28.02.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 02:00:11 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 28 Jul 2020 14:27:57 +0530
Message-Id: <20200728085757.888620-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1] pch_can: use generic power
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
 drivers/net/can/pch_can.c | 63 +++++++++++++--------------------------
 1 file changed, 21 insertions(+), 42 deletions(-)

diff --git a/drivers/net/can/pch_can.c b/drivers/net/can/pch_can.c
index db41dddd5771..ca54a6e1c810 100644
--- a/drivers/net/can/pch_can.c
+++ b/drivers/net/can/pch_can.c
@@ -957,8 +957,7 @@ static void pch_can_remove(struct pci_dev *pdev)
 	free_candev(priv->ndev);
 }
 
-#ifdef CONFIG_PM
-static void pch_can_set_int_custom(struct pch_can_priv *priv)
+static void __maybe_unused pch_can_set_int_custom(struct pch_can_priv *priv)
 {
 	/* Clearing the IE, SIE and EIE bits of Can control register. */
 	pch_can_bit_clear(&priv->regs->cont, PCH_CTRL_IE_SIE_EIE);
@@ -969,14 +968,14 @@ static void pch_can_set_int_custom(struct pch_can_priv *priv)
 }
 
 /* This function retrieves interrupt enabled for the CAN device. */
-static u32 pch_can_get_int_enables(struct pch_can_priv *priv)
+static u32 __maybe_unused pch_can_get_int_enables(struct pch_can_priv *priv)
 {
 	/* Obtaining the status of IE, SIE and EIE interrupt bits. */
 	return (ioread32(&priv->regs->cont) & PCH_CTRL_IE_SIE_EIE) >> 1;
 }
 
-static u32 pch_can_get_rxtx_ir(struct pch_can_priv *priv, u32 buff_num,
-			       enum pch_ifreg dir)
+static u32 __maybe_unused pch_can_get_rxtx_ir(struct pch_can_priv *priv,
+					      u32 buff_num, enum pch_ifreg dir)
 {
 	u32 ie, enable;
 
@@ -997,8 +996,8 @@ static u32 pch_can_get_rxtx_ir(struct pch_can_priv *priv, u32 buff_num,
 	return enable;
 }
 
-static void pch_can_set_rx_buffer_link(struct pch_can_priv *priv,
-				       u32 buffer_num, int set)
+static void __maybe_unused pch_can_set_rx_buffer_link(struct pch_can_priv *priv,
+						      u32 buffer_num, int set)
 {
 	iowrite32(PCH_CMASK_RX_TX_GET, &priv->regs->ifregs[0].cmask);
 	pch_can_rw_msg_obj(&priv->regs->ifregs[0].creq, buffer_num);
@@ -1013,7 +1012,8 @@ static void pch_can_set_rx_buffer_link(struct pch_can_priv *priv,
 	pch_can_rw_msg_obj(&priv->regs->ifregs[0].creq, buffer_num);
 }
 
-static u32 pch_can_get_rx_buffer_link(struct pch_can_priv *priv, u32 buffer_num)
+static u32 __maybe_unused pch_can_get_rx_buffer_link(struct pch_can_priv *priv,
+						     u32 buffer_num)
 {
 	u32 link;
 
@@ -1027,20 +1027,19 @@ static u32 pch_can_get_rx_buffer_link(struct pch_can_priv *priv, u32 buffer_num)
 	return link;
 }
 
-static int pch_can_get_buffer_status(struct pch_can_priv *priv)
+static int __maybe_unused pch_can_get_buffer_status(struct pch_can_priv *priv)
 {
 	return (ioread32(&priv->regs->treq1) & 0xffff) |
 	       (ioread32(&priv->regs->treq2) << 16);
 }
 
-static int pch_can_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused pch_can_suspend(struct device *dev_d)
 {
 	int i;
-	int retval;
 	u32 buf_stat;	/* Variable for reading the transmit buffer status. */
 	int counter = PCH_COUNTER_LIMIT;
 
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct pch_can_priv *priv = netdev_priv(dev);
 
 	/* Stop the CAN controller */
@@ -1058,7 +1057,7 @@ static int pch_can_suspend(struct pci_dev *pdev, pm_message_t state)
 		udelay(1);
 	}
 	if (!counter)
-		dev_err(&pdev->dev, "%s -> Transmission time out.\n", __func__);
+		dev_err(dev_d, "%s -> Transmission time out.\n", __func__);
 
 	/* Save interrupt configuration and then disable them */
 	priv->int_enables = pch_can_get_int_enables(priv);
@@ -1081,35 +1080,16 @@ static int pch_can_suspend(struct pci_dev *pdev, pm_message_t state)
 
 	/* Disable all Receive buffers */
 	pch_can_set_rx_all(priv, 0);
-	retval = pci_save_state(pdev);
-	if (retval) {
-		dev_err(&pdev->dev, "pci_save_state failed.\n");
-	} else {
-		pci_enable_wake(pdev, PCI_D3hot, 0);
-		pci_disable_device(pdev);
-		pci_set_power_state(pdev, pci_choose_state(pdev, state));
-	}
 
-	return retval;
+	return 0;
 }
 
-static int pch_can_resume(struct pci_dev *pdev)
+static int __maybe_unused pch_can_resume(struct device *dev_d)
 {
 	int i;
-	int retval;
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct pch_can_priv *priv = netdev_priv(dev);
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	retval = pci_enable_device(pdev);
-	if (retval) {
-		dev_err(&pdev->dev, "pci_enable_device failed.\n");
-		return retval;
-	}
-
-	pci_enable_wake(pdev, PCI_D3hot, 0);
-
 	priv->can.state = CAN_STATE_ERROR_ACTIVE;
 
 	/* Disabling all interrupts. */
@@ -1146,12 +1126,8 @@ static int pch_can_resume(struct pci_dev *pdev)
 	/* Restore Run Mode */
 	pch_can_set_run_mode(priv, PCH_CAN_RUN);
 
-	return retval;
+	return 0;
 }
-#else
-#define pch_can_suspend NULL
-#define pch_can_resume NULL
-#endif
 
 static int pch_can_get_berr_counter(const struct net_device *dev,
 				    struct can_berr_counter *bec)
@@ -1252,13 +1228,16 @@ static int pch_can_probe(struct pci_dev *pdev,
 	return rc;
 }
 
+static SIMPLE_DEV_PM_OPS(pch_can_pm_ops,
+			 pch_can_suspend,
+			 pch_can_resume);
+
 static struct pci_driver pch_can_pci_driver = {
 	.name = "pch_can",
 	.id_table = pch_pci_tbl,
 	.probe = pch_can_probe,
 	.remove = pch_can_remove,
-	.suspend = pch_can_suspend,
-	.resume = pch_can_resume,
+	.driver.pm = &pch_can_pm_ops,
 };
 
 module_pci_driver(pch_can_pci_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
