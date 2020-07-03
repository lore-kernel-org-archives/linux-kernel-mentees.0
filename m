Return-Path: <SRS0=CGmO=AO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACFCC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 03:03:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51302208FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 03:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbeOyO3A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51302208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22CB888C83;
	Fri,  3 Jul 2020 03:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WCComYsAWaQZ; Fri,  3 Jul 2020 03:03:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B143688C80;
	Fri,  3 Jul 2020 03:03:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9ADA9C0888;
	Fri,  3 Jul 2020 03:03:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98959C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7398E25CFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lfAvcU30wyz1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:03:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 87EA325C83
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 03:03:10 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id gc9so6774678pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Jul 2020 20:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQztFWTnvvCC65swoXT94iI6JJUvW0UB4XPTfh/WW2w=;
 b=AbeOyO3AB9clkR6h04uVOavwnqvrYCoZtcBo+RCO6rYpywWxZCGiCC7VQCXmcEy08s
 K7BjOwxfQVNgJThs4LMXWVk+tol+EJtQad8cSNgiqQr9NGkkG5mAvSlRSgGQFNNOH6Zs
 5C4Nh5KgmunmWPzI4G1/q/pRNuTV3V9APLQGxbhPEIc4CPz7GdRuB5W8tyUbz4KxA2wn
 THQsh2gA18I6TTRiGHb0pw7el9xnMgfb9Gpy+yBDoCaa/L9GbDkfWpryTbuhNW4FtymH
 cbd0D9lnTmmnv5o4/G4iahsRB2WNXeEyVkZ6AOH06a8pZdS7u6QseoxI6S18+uod9KW8
 ZAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qQztFWTnvvCC65swoXT94iI6JJUvW0UB4XPTfh/WW2w=;
 b=O8DBu5/C7kBxbdUHdOu0f+q2yp0567Vr63QAwlN1+CtxB78Kc5JBCGkD0WIDG0qNHv
 RRL+9i5JndW2Y033bjhvyi6SARuL2/l7aseh3hna92JRBD3+l41ePs2obq7wtthZRHQP
 YCF/7j2jyqrfx1g8vAn1LeSqwZp/BDCwvqh1Bt9GdIbku7v9n/Z4cuMys9whAcs9F2Sv
 SLzPow459zlbiQWNPuKQcWUfY56nCh9XFk2MuQaH8RLIrVuk4so6VUtcQI4XpX1biYRY
 uLpnE/OV81xGdxgv5sp+npkee4psU4Y2L/FZ6JQuDFZ7HOvT5HJaXHkAurcgV5dZKTHA
 UOiw==
X-Gm-Message-State: AOAM531H4H3I0RmQ2TK/gfwVC2Daym389/x3ZUi85mWqXHz7zxl9ClCO
 AT2nnWVerkDvFWLX+KfNVCs=
X-Google-Smtp-Source: ABdhPJzyUxIZmx9Fap9uAXWsv4XhEJ/scd+jwPILtyrju0Liv5NQs6RsVcYgi38l4wMv64k21APvoQ==
X-Received: by 2002:a17:902:a511:: with SMTP id
 s17mr28552218plq.37.1593745389988; 
 Thu, 02 Jul 2020 20:03:09 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id h194sm9903223pfe.201.2020.07.02.20.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 20:03:09 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Steve Glendinning <steve.glendinning@shawell.net>
Date: Fri,  3 Jul 2020 08:31:37 +0530
Message-Id: <20200703030138.25724-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703030138.25724-1-vaibhavgupta40@gmail.com>
References: <20200703030138.25724-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 1/2] epic100: use generic power
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
states and related operations, for the device, themselves.

With generic PM, all essentials will be handled by the PCI core. Driver
needs to do only device-specific operations.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/smsc/epic100.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/smsc/epic100.c b/drivers/net/ethernet/smsc/epic100.c
index 61ddee0c2a2e..d950b312c418 100644
--- a/drivers/net/ethernet/smsc/epic100.c
+++ b/drivers/net/ethernet/smsc/epic100.c
@@ -1512,12 +1512,9 @@ static void epic_remove_one(struct pci_dev *pdev)
 	/* pci_power_off(pdev, -1); */
 }
 
-
-#ifdef CONFIG_PM
-
-static int epic_suspend (struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused epic_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct epic_private *ep = netdev_priv(dev);
 	void __iomem *ioaddr = ep->ioaddr;
 
@@ -1531,9 +1528,9 @@ static int epic_suspend (struct pci_dev *pdev, pm_message_t state)
 }
 
 
-static int epic_resume (struct pci_dev *pdev)
+static int __maybe_unused epic_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 
 	if (!netif_running(dev))
 		return 0;
@@ -1542,18 +1539,14 @@ static int epic_resume (struct pci_dev *pdev)
 	return 0;
 }
 
-#endif /* CONFIG_PM */
-
+static SIMPLE_DEV_PM_OPS(epic_pm_ops, epic_suspend, epic_resume);
 
 static struct pci_driver epic_driver = {
 	.name		= DRV_NAME,
 	.id_table	= epic_pci_tbl,
 	.probe		= epic_init_one,
 	.remove		= epic_remove_one,
-#ifdef CONFIG_PM
-	.suspend	= epic_suspend,
-	.resume		= epic_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= &epic_pm_ops,
 };
 
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
