Return-Path: <SRS0=2zBv=7I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAE5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 08:05:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BDF42071A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 08:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3CG+oVN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BDF42071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 550AA8834C;
	Tue, 26 May 2020 08:05:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74iuQ6rvz5X0; Tue, 26 May 2020 08:05:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E9F6787999;
	Tue, 26 May 2020 08:05:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E66A0C0888;
	Tue, 26 May 2020 08:05:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB3C8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A0C8B20788
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ulniq8jGClSA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:05:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 0B606204C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 08:05:11 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r10so9621504pgv.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 01:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ctzNEK9ct3Xheefnk+QOHIxDO7kXYLYdjrWKg/OFEKg=;
 b=X3CG+oVNVMX0lnR1bi1OH2EBx9kaknDBst0b0ZXlD1lfVkqB9xV21QY6KlTOXvqitn
 0smFZVRkdfWyhtq61P49oHA0xGA6wXQ1JLgF1/G4YuiyR7NlsJEKkw158Nc37bGnGIBn
 0uAFuFDVBWHSzmJgM2SnNAEhX4pyBRHMNWuZOz9wy8n2/lQUX843A7Q/oSAjs4x22kyB
 0Ho+PzQcqCnkDcrqqboUJFsG04pfnotwisLoJSeGqAzOrk/klA/a/N6LPb8zyyz5vcaV
 tNpFvwffBFksgUI1WpGWYtkKwHoCUYfl0Yg0zdapn/RkupzOuLVN37cuQ62oKt4Fvl7k
 jd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ctzNEK9ct3Xheefnk+QOHIxDO7kXYLYdjrWKg/OFEKg=;
 b=tBTlfEItDbExmmGk6NrGrJmNgribnvLnNf3rT8U620AX/lGiqFf7QRDR6iu44NUead
 M0OlWt9axn+9dsGvxaAy7fdGaOXi7fZcX5+pbycUYs4W24tlRetRRQ/9kIt+B3W5gptN
 AlvUyYlbC5nUlwYq28M8n/FEfaBbF57lGzowu+IfO5vayCzFf5z0ZX8PYq6QN5P/NiEL
 aKOM1WRJ7O2u24L7Y866aLZSX4YAUjnUAkKpEpk9I6gndOPzMFA5iW3xO5b7s0S0T/aI
 sZi8z5DVjK31JFeRHv5IUIr521cbYeD7in7B1cqKWyBxluOzWsutpN4NGahh5k9h4K4y
 o+wA==
X-Gm-Message-State: AOAM530KISeCAFkXsKejJCLQ4QSv8dGHsqEmHeScQDMIGlIQjOFk9JXh
 KIr34DSlHkP3Xd5Y3LZXUqE=
X-Google-Smtp-Source: ABdhPJztp+CYa62M7C0UA8/be7wZZ+tfVKlbQCJ9G2m7H6/p2rSXV64EhYvePkYTV3VRwa2BU5ITWA==
X-Received: by 2002:a05:6a00:a:: with SMTP id
 h10mr21383389pfk.310.1590480310570; 
 Tue, 26 May 2020 01:05:10 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.209])
 by smtp.gmail.com with ESMTPSA id fa19sm8614477pjb.18.2020.05.26.01.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 01:05:10 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Don Fry <pcnet32@frontier.com>, Tom Lendacky <thomas.lendacky@amd.com>
Date: Tue, 26 May 2020 13:33:24 +0530
Message-Id: <20200526080324.69828-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526080324.69828-1-vaibhavgupta40@gmail.com>
References: <20200526080324.69828-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [RFC PATCH v1 3/3] amd-xgbe: Convert to
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

Use dev_pm_ops structure to call generic suspend() and resume() callbacks.

Drivers should avoid saving device register and/or change power states
using PCI helper functions. With generic approach, all these are handled by
PCI core.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/amd/xgbe/xgbe-pci.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-pci.c b/drivers/net/ethernet/amd/xgbe/xgbe-pci.c
index 7b86240ecd5f..014cee31a1d4 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-pci.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-pci.c
@@ -421,9 +421,9 @@ static void xgbe_pci_remove(struct pci_dev *pdev)
 	xgbe_free_pdata(pdata);
 }
 
-#ifdef CONFIG_PM
-static int xgbe_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused xgbe_pci_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xgbe_prv_data *pdata = pci_get_drvdata(pdev);
 	struct net_device *netdev = pdata->netdev;
 	int ret = 0;
@@ -438,8 +438,9 @@ static int xgbe_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	return ret;
 }
 
-static int xgbe_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused xgbe_pci_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xgbe_prv_data *pdata = pci_get_drvdata(pdev);
 	struct net_device *netdev = pdata->netdev;
 	int ret = 0;
@@ -460,7 +461,6 @@ static int xgbe_pci_resume(struct pci_dev *pdev)
 
 	return ret;
 }
-#endif /* CONFIG_PM */
 
 static const struct xgbe_version_data xgbe_v2a = {
 	.init_function_ptrs_phy_impl	= xgbe_init_function_ptrs_phy_v2,
@@ -502,15 +502,16 @@ static const struct pci_device_id xgbe_pci_table[] = {
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
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
