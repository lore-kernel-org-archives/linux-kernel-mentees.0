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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26622C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 16:52:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F00E320748
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 16:52:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tRJMz9jl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F00E320748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C91728A909;
	Wed,  1 Jul 2020 16:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMX23JjrDGI9; Wed,  1 Jul 2020 16:52:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 600008A871;
	Wed,  1 Jul 2020 16:52:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C4F7C0865;
	Wed,  1 Jul 2020 16:52:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE05FC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A259B2E2F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id poRullcFAjLO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:52:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 8C7682DA5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:52:44 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g17so10130088plq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 09:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9tRb3lcQnQNyqSPd2RUudBp4K9fTszNeoadKdLTyh8Y=;
 b=tRJMz9jl5AJ9/Zbb6b7YSq+9Ph6ohWoWKQvaGzZMgcb3ZbQoZtVjJE9PV+2T2/WTCi
 Zq/UkGEd9nrvIxXDI+QUGXHE74+Ee52f2HOHZ8EPq07k3CB0+3TSPS3pgF1X9dxVMuLy
 eHWjhqykcXc4LPDjsyd+fKiu9drxlBkklvTsslGVKPj10R3Ny4/WcfiBLli6RJiYOBUR
 B3+B66kCHc/CLJIYPiR6lNNwo05xe/DQkkYEFejH6S/R9ROvAeZLn273w58T88gMtJY/
 XU+82e8r22TjIIXJAP5dco5ly1IsK/Xw0uxyGQjhW/EDddOEVDE1DYoKNi3DRXBLF4gg
 Gyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9tRb3lcQnQNyqSPd2RUudBp4K9fTszNeoadKdLTyh8Y=;
 b=iCT756/2DC/fq4HPT7U/bPFe74mk0KgIfEbn2dj95FuhKwc8zD8by38GwPjR3IQBk8
 c0owKiOGb7n/g9WjLedtVRsl5LUbCpRl7xre9GyZcIYJjubZOACwX1g8RUMLQ2adodt0
 kS8GpIArwMzIfx+XmccYK0bcRJ7zJFff5qBZiVcX0O13om0G8Yji/wUNaX0Z2BkF1URz
 iNgI3wMdE7Hecyd8n5I823fO+tffomVm1xahm6fM/mR/FoYMNj3pz3NbuDIZ+U6fu6pI
 aaXkXH4yltRpvP7BCBTT/HqzE9nijfig2+YMHc++hmFybHcFI0629kgcPD7+vvpJIpgq
 Dd1Q==
X-Gm-Message-State: AOAM530t8Bgf8F6ZFLEs0KZf+noQ2Waol8MeE/JHRcJb4jHLdVPVrrkK
 9Rbzp2iyec9KQfMRV0ckLr4=
X-Google-Smtp-Source: ABdhPJwugMoK1EmT/vFW9OZp4D6DavJYdO90BGmWje4KqlO8Z6Q1IvLETcXsu9g1sR/Rlx8sKuljQw==
X-Received: by 2002:a17:90a:ff92:: with SMTP id
 hf18mr22300524pjb.10.1593622364041; 
 Wed, 01 Jul 2020 09:52:44 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id g140sm6297437pfb.48.2020.07.01.09.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 09:52:43 -0700 (PDT)
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
Date: Wed,  1 Jul 2020 22:20:48 +0530
Message-Id: <20200701165057.667799-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701165057.667799-1-vaibhavgupta40@gmail.com>
References: <20200701165057.667799-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 02/11] ne2k-pci: use generic power
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
pci_enable/disable_device(), pci_save/restore_sate() and
pci_set_power_state().

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/8390/ne2k-pci.c | 29 ++++++----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/8390/ne2k-pci.c b/drivers/net/ethernet/8390/ne2k-pci.c
index 77d78b4c59c4..e500f0c05725 100644
--- a/drivers/net/ethernet/8390/ne2k-pci.c
+++ b/drivers/net/ethernet/8390/ne2k-pci.c
@@ -699,30 +699,18 @@ static void ne2k_pci_remove_one(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-#ifdef CONFIG_PM
-static int ne2k_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused ne2k_pci_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 
 	netif_device_detach(dev);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 
 	return 0;
 }
 
-static int ne2k_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused ne2k_pci_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
-	int rc;
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	rc = pci_enable_device(pdev);
-	if (rc)
-		return rc;
+	struct net_device *dev = dev_get_drvdata(dev_d);
 
 	NS8390_init(dev, 1);
 	netif_device_attach(dev);
@@ -730,19 +718,14 @@ static int ne2k_pci_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-#endif /* CONFIG_PM */
-
+static SIMPLE_DEV_PM_OPS(ne2k_pci_pm_ops, ne2k_pci_suspend, ne2k_pci_resume);
 
 static struct pci_driver ne2k_driver = {
 	.name		= DRV_NAME,
 	.probe		= ne2k_pci_init_one,
 	.remove		= ne2k_pci_remove_one,
 	.id_table	= ne2k_pci_tbl,
-#ifdef CONFIG_PM
-	.suspend	= ne2k_pci_suspend,
-	.resume		= ne2k_pci_resume,
-#endif
-
+	.driver.pm	= &ne2k_pci_pm_ops,
 };
 
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
