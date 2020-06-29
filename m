Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB11C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 09:31:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB7520857
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 09:31:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYzbq7y7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BB7520857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6FB5388832;
	Mon, 29 Jun 2020 09:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E0RasJo6lPth; Mon, 29 Jun 2020 09:31:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C0E1E88839;
	Mon, 29 Jun 2020 09:31:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B092BC07FF;
	Mon, 29 Jun 2020 09:31:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 928A6C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 79BF48761F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HwoA6UBM9b_T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5020E8758A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:27 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d194so4665357pga.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 02:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ywkIyM7V2PjtWkJiS8MsW9js5hP4ibuo2yhx5IWsTOA=;
 b=HYzbq7y7ft+b+SgtlZUKORkLXD8Ox0BEYlONq/fc08nJbzaWhEHray6rrcNVvj3vq3
 QETe5Qt14tj9Qqde3VfFY7V1p+X/OjRGb7RIIUDfxYf+sJeQ2Aqx+n9WO+lRRwzJSEID
 ea+v0EZnOptAUfaa3/MOYbbbGW3EZgtd6RsRk/2ZC0W5sUsuwj6Wag7T0M3Zsc/M2Yrq
 LzhtGOI4lwgKdGPkOwoCuI2TmrIdqNFqxLf+qOCannsKEu2R7HU2IOGCIRs8hd2X4+Z6
 zEHKs0Px4+cpBGIeSKREsUL+0QLT/ZLg3ztZZiI6Xdrqrzc3hUnHSHO6UyBeCKFugOLF
 Tx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ywkIyM7V2PjtWkJiS8MsW9js5hP4ibuo2yhx5IWsTOA=;
 b=N+fYN30NOwgz3Z1l5Yjqx2I0Q1wlzRMU7ur8Vv6kvszVdF49Ob319/j9e89cKxaaPW
 TPPmNdWlG+cpHOkS24sVsEHoN0CkdfSMb+OiU0IhO7in5n5ilNirtd5lF8UbgTDoHhSv
 VJi9U47ZNi6e4r5RSeIkXpgzUuXiegsThYAxmFmiNBHT5oQVOTPhLYiAHcyo+0qCjf2a
 r3Ii0ao82kuCpJKMY0Ip0G/vtuZFB2JEIPMOu+nxwcFeNxykl1VYRyYbm6WYiowbGngG
 kVCJbscuXri+ZLm+k2YPV6xPtB4ciC1PG0fa+6MlqLjalBs1UshtzGdaybBTIEMedK3L
 Xfig==
X-Gm-Message-State: AOAM531WlnOaUM4e08hilJlZnGCBl4/xtokal/2209yqGhpIufgVh+06
 NwUQIspMUYgQQffLUrTHxV4=
X-Google-Smtp-Source: ABdhPJzlRgVbHpNX+XulZrbU31t1gGCVj4aLHjb27mH1TsN3aLjlO4iG3QLYEo7yQtCkNOykRft0Fw==
X-Received: by 2002:a65:62c9:: with SMTP id m9mr9172551pgv.392.1593423086940; 
 Mon, 29 Jun 2020 02:31:26 -0700 (PDT)
Received: from varodek.localdomain ([106.210.40.90])
 by smtp.gmail.com with ESMTPSA id q20sm2921286pfn.111.2020.06.29.02.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 02:31:26 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Mon, 29 Jun 2020 14:59:40 +0530
Message-Id: <20200629092943.227910-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629092943.227910-1-vaibhavgupta40@gmail.com>
References: <20200629092943.227910-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 2/5] igbvf: netdev: use generic
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

Remove legacy PM callbacks and use generic operations. With legacy code,
drivers were responsible for handling PCI PM operations like
pci_save_state(). In generic code, all these hre andled by PCI core.

The generic suspend() and resume() are called at the same point the legacy
ones were called. Thus, it does not affect the normal functioning of the
driver.

__maybe_unused attribute is used with .resume() but not with .suspend(), as
.suspend() is calleb by .shutdown().

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/intel/igbvf/netdev.c | 37 +++++------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/intel/igbvf/netdev.c b/drivers/net/ethernet/intel/igbvf/netdev.c
index 5b1800c3ba82..76285724b1f3 100644
--- a/drivers/net/ethernet/intel/igbvf/netdev.c
+++ b/drivers/net/ethernet/intel/igbvf/netdev.c
@@ -2459,13 +2459,10 @@ static int igbvf_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
 	}
 }
 
-static int igbvf_suspend(struct pci_dev *pdev, pm_message_t state)
+static int igbvf_suspend(struct device *dev_d)
 {
-	struct net_device *netdev = pci_get_drvdata(pdev);
+	struct net_device *netdev = dev_get_drvdata(dev_d);
 	struct igbvf_adapter *adapter = netdev_priv(netdev);
-#ifdef CONFIG_PM
-	int retval = 0;
-#endif
 
 	netif_device_detach(netdev);
 
@@ -2475,31 +2472,16 @@ static int igbvf_suspend(struct pci_dev *pdev, pm_message_t state)
 		igbvf_free_irq(adapter);
 	}
 
-#ifdef CONFIG_PM
-	retval = pci_save_state(pdev);
-	if (retval)
-		return retval;
-#endif
-
-	pci_disable_device(pdev);
-
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int igbvf_resume(struct pci_dev *pdev)
+static int __maybe_unused igbvf_resume(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct net_device *netdev = pci_get_drvdata(pdev);
 	struct igbvf_adapter *adapter = netdev_priv(netdev);
 	u32 err;
 
-	pci_restore_state(pdev);
-	err = pci_enable_device_mem(pdev);
-	if (err) {
-		dev_err(&pdev->dev, "Cannot enable PCI device from suspend\n");
-		return err;
-	}
-
 	pci_set_master(pdev);
 
 	if (netif_running(netdev)) {
@@ -2517,11 +2499,10 @@ static int igbvf_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#endif
 
 static void igbvf_shutdown(struct pci_dev *pdev)
 {
-	igbvf_suspend(pdev, PMSG_SUSPEND);
+	igbvf_suspend(&pdev->dev);
 }
 
 #ifdef CONFIG_NET_POLL_CONTROLLER
@@ -2962,17 +2943,15 @@ static const struct pci_device_id igbvf_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, igbvf_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(igbvf_pm_ops, igbvf_suspend, igbvf_resume);
+
 /* PCI Device API Driver */
 static struct pci_driver igbvf_driver = {
 	.name		= igbvf_driver_name,
 	.id_table	= igbvf_pci_tbl,
 	.probe		= igbvf_probe,
 	.remove		= igbvf_remove,
-#ifdef CONFIG_PM
-	/* Power Management Hooks */
-	.suspend	= igbvf_suspend,
-	.resume		= igbvf_resume,
-#endif
+	.driver.pm	= &igbvf_pm_ops,
 	.shutdown	= igbvf_shutdown,
 	.err_handler	= &igbvf_err_handler
 };
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
