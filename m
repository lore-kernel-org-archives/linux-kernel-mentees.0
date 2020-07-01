Return-Path: <SRS0=WnLp=AM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E33BC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 16:54:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E82E520748
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 16:54:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9wGn45Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E82E520748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D99B38ABDE;
	Wed,  1 Jul 2020 16:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDdCeE2qjqtA; Wed,  1 Jul 2020 16:54:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6C0D38ABEC;
	Wed,  1 Jul 2020 16:54:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A5A7C0865;
	Wed,  1 Jul 2020 16:54:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02D41C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E58828ABDE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mAc3jgPlk3VH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:54:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 863EE8ABDD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:54:03 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id c1so4022322pja.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 09:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EKYZXzZpvGyQZUTSB7ZSTs6hRzQBV8VsnesAValvrlI=;
 b=D9wGn45YpgPA9W1hNv3PDO7MFoG+i4XyR7rEvEGxLEK5UxsrRmkL7mGNZ1kU1TDfbb
 oG9KZmbNokSDsFHcYqrzFrvdEbt5w+Mqg4eA5aHHnSjkGb/wdM30WZ77qy2xIesKYqG8
 x+fJktS6LUjjwFkR5nbwjkNM2ckekgLpqkLmvNFXnWxV0zX57UaM/Q9b827t+bixP+G2
 lCoA1w6FOHItH9+ivKP5noXATe5TdBHxWNs/5T3OoYgMXE7YTtiHhtSG9Wq8isedaL2n
 fauGkZ/nNUy7+lP/BQ+aqEK7sLieZxOOR/Jgi23B261ZCvxabYHZYFMNw18qHM4FZ6o3
 nuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EKYZXzZpvGyQZUTSB7ZSTs6hRzQBV8VsnesAValvrlI=;
 b=cwLShSgkn/+zCFYIRqZlqRgLRlzXP1TU+BPvwvHG4f+KMtF9y4PsExmMPquHlTf5QO
 9qz0uIwWHWp9OWsfN7WRI/0qUUh9TYLKi33AnMnDrFFEJhHDrYuJ0jnU3++v5lA2jyr9
 /TSCU0mHPWT+X6325a8ZIoPhT6USqBeSQxqF61of4qvAIeUE1U+/izOiv5iZu1iVtwFN
 AYi0Gay9NcK9qP33/1M3TjEBGldqmMczBWcwL47ak9NeeJm3sJOxhGXdtOOnTuLRMOv+
 Mu26/ObBIZfAlfN+3CIQeD1QtMC8ctYc98VhaJR1NDpVnb4dA1RcHPDkK3AASulPL1Tu
 Zqaw==
X-Gm-Message-State: AOAM5315WVtsypmb3rExFxIjcUyZ+TejvGBFs6IVfN18tncxE/PK7A7R
 k88pVPeRqM+MdbFzKUhvNNg=
X-Google-Smtp-Source: ABdhPJzbqvCjkS3i9SKAN4JvhTqU0cHTWG8FXIo2HWKrocdp4Pctuy82rSqkf8ua0qByYRDC/nkWfw==
X-Received: by 2002:a17:90a:7107:: with SMTP id
 h7mr28786115pjk.210.1593622443103; 
 Wed, 01 Jul 2020 09:54:03 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id g140sm6297437pfb.48.2020.07.01.09.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 09:54:02 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 David Dillow <dave@thedillows.org>, Ion Badulescu <ionut@badula.org>,
 Netanel Belgazal <netanel@amazon.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Guy Tzalik <gtzalik@amazon.com>,
 Saeed Bishara <saeedb@amazon.com>, Zorik Machulsky <zorik@amazon.com>,
 Derek Chickles <dchickles@marvell.com>,
 Satanand Burla <sburla@marvell.com>,
 Felix Manlunas <fmanlunas@marvell.com>,
 Denis Kirjanov <kda@linux-powerpc.org>,
 Ajit Khaparde <ajit.khaparde@broadcom.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 Somnath Kotur <somnath.kotur@broadcom.com>,
 Tariq Toukan <tariqt@mellanox.com>, Jon Mason <jdmason@kudzu.us>
Date: Wed,  1 Jul 2020 22:20:57 +0530
Message-Id: <20200701165057.667799-12-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701165057.667799-1-vaibhavgupta40@gmail.com>
References: <20200701165057.667799-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 11/11] natsemi: use generic power
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

Thus, there is no need to call the PCI helper functions like
pci_enable_device, which is not recommended. Hence, removed.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/natsemi/natsemi.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/natsemi/natsemi.c b/drivers/net/ethernet/natsemi/natsemi.c
index d21d706b83a7..c2867fe995bc 100644
--- a/drivers/net/ethernet/natsemi/natsemi.c
+++ b/drivers/net/ethernet/natsemi/natsemi.c
@@ -3247,8 +3247,6 @@ static void natsemi_remove1(struct pci_dev *pdev)
 	free_netdev (dev);
 }
 
-#ifdef CONFIG_PM
-
 /*
  * The ns83815 chip doesn't have explicit RxStop bits.
  * Kicking the Rx or Tx process for a new packet reenables the Rx process
@@ -3275,9 +3273,9 @@ static void natsemi_remove1(struct pci_dev *pdev)
  * Interrupts must be disabled, otherwise hands_off can cause irq storms.
  */
 
-static int natsemi_suspend (struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused natsemi_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata (pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct netdev_private *np = netdev_priv(dev);
 	void __iomem * ioaddr = ns_ioaddr(dev);
 
@@ -3326,11 +3324,10 @@ static int natsemi_suspend (struct pci_dev *pdev, pm_message_t state)
 }
 
 
-static int natsemi_resume (struct pci_dev *pdev)
+static int __maybe_unused natsemi_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata (pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct netdev_private *np = netdev_priv(dev);
-	int ret = 0;
 
 	rtnl_lock();
 	if (netif_device_present(dev))
@@ -3339,12 +3336,6 @@ static int natsemi_resume (struct pci_dev *pdev)
 		const int irq = np->pci_dev->irq;
 
 		BUG_ON(!np->hands_off);
-		ret = pci_enable_device(pdev);
-		if (ret < 0) {
-			dev_err(&pdev->dev,
-				"pci_enable_device() failed: %d\n", ret);
-			goto out;
-		}
 	/*	pci_power_on(pdev); */
 
 		napi_enable(&np->napi);
@@ -3364,20 +3355,17 @@ static int natsemi_resume (struct pci_dev *pdev)
 	netif_device_attach(dev);
 out:
 	rtnl_unlock();
-	return ret;
+	return 0;
 }
 
-#endif /* CONFIG_PM */
+static SIMPLE_DEV_PM_OPS(natsemi_pm_ops, natsemi_suspend, natsemi_resume);
 
 static struct pci_driver natsemi_driver = {
 	.name		= DRV_NAME,
 	.id_table	= natsemi_pci_tbl,
 	.probe		= natsemi_probe1,
 	.remove		= natsemi_remove1,
-#ifdef CONFIG_PM
-	.suspend	= natsemi_suspend,
-	.resume		= natsemi_resume,
-#endif
+	.driver.pm	= &natsemi_pm_ops,
 };
 
 static int __init natsemi_init_mod (void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
