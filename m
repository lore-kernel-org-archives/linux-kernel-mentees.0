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
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB08C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:44:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CCF6206BE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeazGPCw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CCF6206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 59D9F86D2D;
	Mon, 22 Jun 2020 11:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJq8HE5S2xpf; Mon, 22 Jun 2020 11:44:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5FADA863F2;
	Mon, 22 Jun 2020 11:44:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EA39C0891;
	Mon, 22 Jun 2020 11:44:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57F09C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 471EE87F35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4b1jOZD2c3u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 41A4587EE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:34 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id i12so8041801pju.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 04:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fPbZUQT1VbLR1XExkOHhJDqfB6VA400G+a21PYV/3fs=;
 b=EeazGPCwfh2zRSycCdzNh59i+CgRWTtwh5JVoLDA7o2ZIBQc7oJHD5YpMHIsIG0o1d
 qtCXNe6U+RlUEu12o/GMl2OESvR0StKwfq2WWB3YFurqkjsel1BLQvbEmwJo2MVBdHse
 STvv2P3lgLHUS9GWfYMk+gt2KcYT4PgTOXo5ALKGDihYq0tiuW5AI0t/Knr2dWqEJIu6
 3Cxn3B3sD1qxzbAdZ2weHc5fx/UuvNusplgz4CLxXIO8dp9s9yfVB3A2SbYCEX3GLNTU
 lgDl6UXt0Hh+zYqReIR0P//hRTGNRrP+xXrHM17H6Js0MASNVBPxscuSIyJfcg660cLL
 tPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fPbZUQT1VbLR1XExkOHhJDqfB6VA400G+a21PYV/3fs=;
 b=hzQZcx/mn5PiIdKffKq1x+vwW4+zcG68quXO0gTWCLIH8Xn5vG0cfRyOFrZcJtZlUQ
 Q6o3vWHvog9WnhXMdqWzq4rmtq3vpetqw8eszNb0Xm/c2oSAm7m7OuTUdti7DmzvvKC5
 LRQHrZqOqwX2Wjn61pfYMyN70XywfQyixubDfVMLqNCOrHYYOTT9KNDSDvf6NixeViDA
 jC+eD52+hC/hdB9DQxbN7RpZfZJNj5LHOSbyty/eX20yKV1wZZ/h4eXp3gdEZcts27xN
 afmc4n16inE+yt2eZwssWiyNFJq7GUyszxM0+JmM0XDb3zqjjaBt4UI8LLqhVErmfGeL
 eKYQ==
X-Gm-Message-State: AOAM532pfqEKQDLl25R1usdYTQQsAWd+iUQ8KXeL/ZaeBXw894hoofkE
 GHFdSqlJmeacBsSIArG3mMI=
X-Google-Smtp-Source: ABdhPJwNzqwp+OTurFYW2OqobXmnFONIUpFUSOsdLqGPvxoglUQTXM7D0MROKehtPSHZWTfKKGGaaw==
X-Received: by 2002:a17:90a:f198:: with SMTP id
 bv24mr18192326pjb.206.1592826273778; 
 Mon, 22 Jun 2020 04:44:33 -0700 (PDT)
Received: from varodek.localdomain ([2401:4900:b8b:123e:d7ae:5602:b3d:9c0])
 by smtp.gmail.com with ESMTPSA id j17sm14081032pjy.22.2020.06.22.04.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:44:33 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Mon, 22 Jun 2020 17:12:28 +0530
Message-Id: <20200622114228.60027-6-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622114228.60027-1-vaibhavgupta40@gmail.com>
References: <20200622114228.60027-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-parisc@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 5/5] tulip: uli526x: use generic
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
changes and device's power state themselves.

Legacy PM involves usage of PCI helper functions like pci_enable_wake()
which is no longer recommended.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/dec/tulip/uli526x.c | 48 ++++--------------------
 1 file changed, 8 insertions(+), 40 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/uli526x.c b/drivers/net/ethernet/dec/tulip/uli526x.c
index f726436b1985..f942399f0f32 100644
--- a/drivers/net/ethernet/dec/tulip/uli526x.c
+++ b/drivers/net/ethernet/dec/tulip/uli526x.c
@@ -1163,65 +1163,41 @@ static void uli526x_dynamic_reset(struct net_device *dev)
 	netif_wake_queue(dev);
 }
 
-
-#ifdef CONFIG_PM
-
 /*
  *	Suspend the interface.
  */
 
-static int uli526x_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused uli526x_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
-	pci_power_t power_state;
-	int err;
+	struct net_device *dev = dev_get_drvdata(dev_d);
 
 	ULI526X_DBUG(0, "uli526x_suspend", 0);
 
-	pci_save_state(pdev);
-
 	if (!netif_running(dev))
 		return 0;
 
 	netif_device_detach(dev);
 	uli526x_reset_prepare(dev);
 
-	power_state = pci_choose_state(pdev, state);
-	pci_enable_wake(pdev, power_state, 0);
-	err = pci_set_power_state(pdev, power_state);
-	if (err) {
-		netif_device_attach(dev);
-		/* Re-initialize ULI526X board */
-		uli526x_init(dev);
-		/* Restart upper layer interface */
-		netif_wake_queue(dev);
-	}
+	device_set_wakeup_enable(dev_d, 0);
 
-	return err;
+	return 0;
 }
 
 /*
  *	Resume the interface.
  */
 
-static int uli526x_resume(struct pci_dev *pdev)
+static int __maybe_unused uli526x_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
-	int err;
+	struct net_device *dev = dev_get_drvdata(dev_d);
 
 	ULI526X_DBUG(0, "uli526x_resume", 0);
 
-	pci_restore_state(pdev);
 
 	if (!netif_running(dev))
 		return 0;
 
-	err = pci_set_power_state(pdev, PCI_D0);
-	if (err) {
-		netdev_warn(dev, "Could not put device into D0\n");
-		return err;
-	}
-
 	netif_device_attach(dev);
 	/* Re-initialize ULI526X board */
 	uli526x_init(dev);
@@ -1231,14 +1207,6 @@ static int uli526x_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-#else /* !CONFIG_PM */
-
-#define uli526x_suspend	NULL
-#define uli526x_resume	NULL
-
-#endif /* !CONFIG_PM */
-
-
 /*
  *	free all allocated rx buffer
  */
@@ -1761,14 +1729,14 @@ static const struct pci_device_id uli526x_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, uli526x_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(uli526x_pm_ops, uli526x_suspend, uli526x_resume);
 
 static struct pci_driver uli526x_driver = {
 	.name		= "uli526x",
 	.id_table	= uli526x_pci_tbl,
 	.probe		= uli526x_init_one,
 	.remove		= uli526x_remove_one,
-	.suspend	= uli526x_suspend,
-	.resume		= uli526x_resume,
+	.driver.pm	= &uli526x_pm_ops,
 };
 
 MODULE_AUTHOR("Peer Chen, peer.chen@uli.com.tw");
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
