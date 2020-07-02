Return-Path: <SRS0=sA50=AN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67E5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 10:55:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88CC920772
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 10:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eupQ18VF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88CC920772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4268D8A5BD;
	Thu,  2 Jul 2020 10:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzk7ZTVLJzA7; Thu,  2 Jul 2020 10:55:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D6E7F89F67;
	Thu,  2 Jul 2020 10:55:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE377C0890;
	Thu,  2 Jul 2020 10:55:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B704C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 10:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 685F588EAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 10:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNqtUbvRbQ8v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 10:55:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1401388EA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 10:55:18 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d10so11173850pls.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Jul 2020 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQztFWTnvvCC65swoXT94iI6JJUvW0UB4XPTfh/WW2w=;
 b=eupQ18VFDu/AqLHsApIR/AXryJVxCGDoso/+wFL3dozCbdBHuCJEYInE+14uYLsLig
 f/DMKq0c1QX1Pzr6k9KmaX1zZAMVjesSnuqY+zfCVNpWxA99wqAxZJpTePzvH5N3wZP5
 HOjERzU7jFG2IHw/02HV8gPRsSeL0whjPdP50bW0RQfhRfjyUI+VadZ6HsOBHk5Ym4ve
 MqtjRvspMPHDnD1MdFTvWaxhvC4p696ZTD5OXCSe+V4lj31O+8NLDyPXxFeLPHXKE4+U
 rFjyoIiTl6yUt0E/O6C8uGYr7bPaL8psQYaZggLIjKdfQdAJqulyzRdxuluLgSj52AxP
 rXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qQztFWTnvvCC65swoXT94iI6JJUvW0UB4XPTfh/WW2w=;
 b=aFdvTP2aRW+U+dX7v6/BPTA8rjsSeEcjuwk4c7IWWgLOVAYpcmBg/vi2iivnhYgiGq
 UnKVllv86hrucN2ez5vpuhCOpKORk04tO22k5j266EXtMUDRFqcLuF3tXcE26Le0PuvH
 yOPcjsjb+N0AJquHRMimfoQheb9pnvjctENhRxYkbSk6MUqiK2nA5OhB92DpY96OAp6U
 Syw/yJIFhqAOL7vDbcv21mXta9rVMpgispIi7DHuUZS6UTH3+3RlKkPjSrNoYZjARDAR
 aEcNGKu7S123YwaXV4GoyCv4R8/ELxmad9eGgoWfXfE2zNx2BAKS9A9wj0g6gb4V0KKc
 H6Lg==
X-Gm-Message-State: AOAM5318UiB4B1Fzv9n3g/K/rBpEuQfuwj3w8m7WVZB3Q7M4xLUStfBN
 xzYrw5JqWwoYKcvhaIVXO3U=
X-Google-Smtp-Source: ABdhPJzVPBbmkC4b0myZ5JB6fAfqNBf1wDyxDCENndpW13VJ3FygOeJ0bkkLWWk7K+/QskGs8FhshA==
X-Received: by 2002:a17:902:a40c:: with SMTP id
 p12mr17143434plq.51.1593687317660; 
 Thu, 02 Jul 2020 03:55:17 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id z13sm8702393pfq.220.2020.07.02.03.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 03:55:17 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Steve Glendinning <steve.glendinning@shawell.net>
Date: Thu,  2 Jul 2020 16:23:50 +0530
Message-Id: <20200702105351.363880-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702105351.363880-1-vaibhavgupta40@gmail.com>
References: <20200702105351.363880-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 1/2] epic100: use generic power
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
