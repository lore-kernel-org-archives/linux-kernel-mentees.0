Return-Path: <SRS0=CGmO=AO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16868C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 03:03:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0CC220890
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 03:03:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoC4LipQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0CC220890
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9755125DCD;
	Fri,  3 Jul 2020 03:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rwglCn2nQjtM; Fri,  3 Jul 2020 03:03:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B63C125877;
	Fri,  3 Jul 2020 03:03:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF0F4C0888;
	Fri,  3 Jul 2020 03:03:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B7C9C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9333A89868
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BKtDhRNBQHox
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:03:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1F5FB882A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:03:16 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id j19so7565237pgm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Jul 2020 20:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7/Ul8qd4qCPb+R/S6l8vvX2AsnTM3XBhH8ONOb+qXLQ=;
 b=YoC4LipQqqn/jldCWdIAwlgUZTF9gieKYuAKku9Tnv3zXhPkcnjN5Ex4YHMxCRg+Tz
 JFR3MBx0V8NkcXOW1tdInY6/PkI4mOD+mJ0y3sxH9WY8mSwoBg8xTjcb22CP7SIqnMQL
 Gnskco/ZvZAZRUlXIcGNJxaP/X2udS9Eb/usJtqYHydr9TT8ZK27jLqN09QX8P+VTIHx
 mAXZ3sP0jVw0wksFjjqFwD3AvTZdY/06V12rjtwPDYgQBvaw3dqHNAKwkF9zYc5MEIRA
 UPLVa0CtmW3dEUAjIida+NqmzndBgaGCkpkJguc0YN+1r/0yNgQvLzqlGVYhkFgIo2NL
 +uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7/Ul8qd4qCPb+R/S6l8vvX2AsnTM3XBhH8ONOb+qXLQ=;
 b=mqdsA3qQD5/C/XLJo/UEcXot7WB3qlb+Rqcx9fqTRimTI4M8km0RMHI0j2ZMwT4Vbv
 ZqynbMtwjtnL7z4R5X/7DRF1jaVXxFzaf2S8dNjdKAw34R5PLxRDm3fCzqppu2hB4sBN
 rmqalFKr9LEqz3ZSi8/efibSMDq8OdMKUo84MZxmRzuv+WwqJGV2zVF+b21jP/E15cka
 Jr9dxagruS2ekNGvP1uwxxxQJxTBM/eNP902xPPeU1/j7xB5ZkfUfMvd2SN3we6m3Uhi
 oC+Ben4h/mPTly4nCYOuAM4U3VyVCB9mHNTiWmIRrLD0UpjpUpPeg8XuhRXMecO5geE0
 nc5Q==
X-Gm-Message-State: AOAM531JC+6nWSDa0q66mOO4UAl9CKYuhhHUoYJz/ZK0otcyNqrjEbxA
 E9eKl2n95bRiE5LbhOOYWhM=
X-Google-Smtp-Source: ABdhPJwzVlWrSFL5uLiWLLBMd9oA1y/5jtIF2yAs0j4cPWQ5Io1OPeP+h7Tg01cSpuYLMNCue8Xo3Q==
X-Received: by 2002:a63:ca11:: with SMTP id n17mr26926924pgi.439.1593745395573; 
 Thu, 02 Jul 2020 20:03:15 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id h194sm9903223pfe.201.2020.07.02.20.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 20:03:15 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Steve Glendinning <steve.glendinning@shawell.net>
Date: Fri,  3 Jul 2020 08:31:38 +0530
Message-Id: <20200703030138.25724-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703030138.25724-1-vaibhavgupta40@gmail.com>
References: <20200703030138.25724-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 2/2] smsc9420: use generic power
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

Drivers should not use legacy power management as they have to manage power
states and related operations, for the device, themselves. This driver was
handling them with the help of PCI helper functions.

With generic PM, all essentials will be handled by the PCI core. Driver
needs to do only device-specific operations.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/smsc/smsc9420.c | 40 ++++++++--------------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smsc9420.c b/drivers/net/ethernet/smsc/smsc9420.c
index 7312e522c022..42bef04d65ba 100644
--- a/drivers/net/ethernet/smsc/smsc9420.c
+++ b/drivers/net/ethernet/smsc/smsc9420.c
@@ -1422,11 +1422,9 @@ static int smsc9420_open(struct net_device *dev)
 	return result;
 }
 
-#ifdef CONFIG_PM
-
-static int smsc9420_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused smsc9420_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct smsc9420_pdata *pd = netdev_priv(dev);
 	u32 int_cfg;
 	ulong flags;
@@ -1451,34 +1449,21 @@ static int smsc9420_suspend(struct pci_dev *pdev, pm_message_t state)
 		netif_device_detach(dev);
 	}
 
-	pci_save_state(pdev);
-	pci_enable_wake(pdev, pci_choose_state(pdev, state), 0);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
+	device_wakeup_disable(dev_d);
 
 	return 0;
 }
 
-static int smsc9420_resume(struct pci_dev *pdev)
+static int __maybe_unused smsc9420_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
-	struct smsc9420_pdata *pd = netdev_priv(dev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	int err;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	err = pci_enable_device(pdev);
-	if (err)
-		return err;
+	pci_set_master(to_pci_dev(dev_d));
 
-	pci_set_master(pdev);
-
-	err = pci_enable_wake(pdev, PCI_D0, 0);
-	if (err)
-		netif_warn(pd, ifup, pd->dev, "pci_enable_wake failed: %d\n",
-			   err);
+	device_wakeup_disable(dev_d);
 
+	err = 0;
 	if (netif_running(dev)) {
 		/* FIXME: gross. It looks like ancient PM relic.*/
 		err = smsc9420_open(dev);
@@ -1487,8 +1472,6 @@ static int smsc9420_resume(struct pci_dev *pdev)
 	return err;
 }
 
-#endif /* CONFIG_PM */
-
 static const struct net_device_ops smsc9420_netdev_ops = {
 	.ndo_open		= smsc9420_open,
 	.ndo_stop		= smsc9420_stop,
@@ -1658,15 +1641,14 @@ static void smsc9420_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
+static SIMPLE_DEV_PM_OPS(smsc9420_pm_ops, smsc9420_suspend, smsc9420_resume);
+
 static struct pci_driver smsc9420_driver = {
 	.name = DRV_NAME,
 	.id_table = smsc9420_id_table,
 	.probe = smsc9420_probe,
 	.remove = smsc9420_remove,
-#ifdef CONFIG_PM
-	.suspend = smsc9420_suspend,
-	.resume = smsc9420_resume,
-#endif /* CONFIG_PM */
+	.driver.pm = &smsc9420_pm_ops,
 };
 
 static int __init smsc9420_init_module(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
