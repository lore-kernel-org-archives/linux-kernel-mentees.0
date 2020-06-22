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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E3DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:15:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D531F20767
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrEn9vJ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D531F20767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A72CF21FF6;
	Mon, 22 Jun 2020 11:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xG4ApEehRkwI; Mon, 22 Jun 2020 11:15:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E6D732155F;
	Mon, 22 Jun 2020 11:15:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3CEAC0891;
	Mon, 22 Jun 2020 11:15:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCCDDC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B9C3D21FF6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SAzQCWlxUq9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 4C8512155F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:45 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x22so8278890pfn.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 04:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2XaRcZP1I/yNj4dxWvPGShRfEGGKyDmu4yyyk3d3G+8=;
 b=BrEn9vJ/G0xuOSNq7YWcdvYWIBmWN99jCzPi+NRx8HZIpSyxsmDNyuHnzqgMauDnp4
 WhQu7fweqY8jTzjEw/SvaKZ1DUCmIDQn6+J6ocZIJ/j10d54OcpEh9r7inP+1bOL4iaZ
 FYjo6jt9rcMrnNJuZ5uKJq7xvHZFPULk+OTVmUf6+Yh3c2TbWpxdGTqWWP1K3EHERnJ3
 JJHyoUcCOP1lbMNY84UvaXktl98iwUsxucgb8YqzZnZauCocFRhpIKMK67w/W4spdHF0
 TXGz9paFEheUeacRfenMhTiouFCtw1dB0ohMahx3QqwEMhc/2HRCcec6m6qPPHKCvK3U
 o0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2XaRcZP1I/yNj4dxWvPGShRfEGGKyDmu4yyyk3d3G+8=;
 b=bmi0Ze3Hy4zqt20xw52OwG9+6LDWadw+jTJP5XKndSN5/XdQ7h8tgr8JjBOANBZtzF
 IA3C64ElGs4C8rw2k8okPVrYTkhJrsCK7OkKEpIaETJehkbHPvTRzZRMN1IZA6A1RlzK
 dxO7TBt3aklQP3t2/mXz5q8UUBQoIGk3IQmy+1oixc7EI/WQUa1HI5o7XqwgJfITzelJ
 Y6pQ5+Cfqod7UOOT/yUIpIkCDW4tnciDrUTfO3POX5bKJh8Rz5C++M9f3FriwDgH53A2
 nM7M3r+qK+n1hcgM2jxUkOl05kGRzLU9IDHrrwi/Hqqbrob9vweiczARoXAW77JsO7dJ
 8BuQ==
X-Gm-Message-State: AOAM5319+99O9k7ZPbRrptOvegh2HJyveh7X5sZlkzm0O8NweglDcodQ
 UuZ/lbjM5D+3tvuEEPlvs1w=
X-Google-Smtp-Source: ABdhPJzQr0DmsdnK/ME7ERsccmB6MxIt/i1mUG6fqIK9c7qaVUgBOqunsOMVOtd/xn/Zed9PgC0UIg==
X-Received: by 2002:a63:ff51:: with SMTP id s17mr10896461pgk.300.1592824544924; 
 Mon, 22 Jun 2020 04:15:44 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id n189sm13950150pfn.108.2020.06.22.04.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:15:44 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Don Fry <pcnet32@frontier.com>, Tom Lendacky <thomas.lendacky@amd.com>
Date: Mon, 22 Jun 2020 16:44:00 +0530
Message-Id: <20200622111400.55956-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622111400.55956-1-vaibhavgupta40@gmail.com>
References: <20200622111400.55956-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 3/3] amd-xgbe: Convert to generic
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

Use dev_pm_ops structure to call generic suspend() and resume() callbacks.

Drivers should avoid saving device register and/or change power states
using PCI helper functions. With the generic approach, all these are handled
by PCI core.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/amd/xgbe/xgbe-pci.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-pci.c b/drivers/net/ethernet/amd/xgbe/xgbe-pci.c
index 7b86240ecd5f..90cb55eb5466 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-pci.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-pci.c
@@ -421,10 +421,9 @@ static void xgbe_pci_remove(struct pci_dev *pdev)
 	xgbe_free_pdata(pdata);
 }
 
-#ifdef CONFIG_PM
-static int xgbe_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused xgbe_pci_suspend(struct device *dev)
 {
-	struct xgbe_prv_data *pdata = pci_get_drvdata(pdev);
+	struct xgbe_prv_data *pdata = dev_get_drvdata(dev);
 	struct net_device *netdev = pdata->netdev;
 	int ret = 0;
 
@@ -438,9 +437,9 @@ static int xgbe_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	return ret;
 }
 
-static int xgbe_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused xgbe_pci_resume(struct device *dev)
 {
-	struct xgbe_prv_data *pdata = pci_get_drvdata(pdev);
+	struct xgbe_prv_data *pdata = dev_get_drvdata(dev);
 	struct net_device *netdev = pdata->netdev;
 	int ret = 0;
 
@@ -460,7 +459,6 @@ static int xgbe_pci_resume(struct pci_dev *pdev)
 
 	return ret;
 }
-#endif /* CONFIG_PM */
 
 static const struct xgbe_version_data xgbe_v2a = {
 	.init_function_ptrs_phy_impl	= xgbe_init_function_ptrs_phy_v2,
@@ -502,15 +500,16 @@ static const struct pci_device_id xgbe_pci_table[] = {
 };
 MODULE_DEVICE_TABLE(pci, xgbe_pci_table);
 
+static SIMPLE_DEV_PM_OPS(xgbe_pci_pm_ops, xgbe_pci_suspend, xgbe_pci_resume);
+
 static struct pci_driver xgbe_driver = {
 	.name = XGBE_DRV_NAME,
 	.id_table = xgbe_pci_table,
 	.probe = xgbe_pci_probe,
 	.remove = xgbe_pci_remove,
-#ifdef CONFIG_PM
-	.suspend = xgbe_pci_suspend,
-	.resume = xgbe_pci_resume,
-#endif
+	.driver = {
+		.pm = &xgbe_pci_pm_ops,
+	}
 };
 
 int xgbe_pci_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
