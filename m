Return-Path: <SRS0=5DCt=AD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B58C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:15:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A2420706
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:15:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRvKW7jp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7A2420706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 62D8121FF6;
	Mon, 22 Jun 2020 11:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Dd5NsycucHC; Mon, 22 Jun 2020 11:15:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BB0342155F;
	Mon, 22 Jun 2020 11:15:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2CBCC0891;
	Mon, 22 Jun 2020 11:15:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E8DFC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1DF6E86D3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAtLv_98hBrn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9F33986D16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:15:19 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h10so7998386pgq.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=boZlC9cES8mgQCV+vpw6dNMvA6C5kwGu41XuL0MFGgA=;
 b=PRvKW7jpjFDQZB+xI+fv7l1+6uyRhIvN+jwRydmIvNXCfTHEFJUgIg7UFP/RCCvpC3
 iheuYvX9zRE9A4DGoFqwHyuGxl2yHCIOGDIFemHkWrJpTF83FSgJnht6I8Q1s6yCyLeu
 L5+v8WzaxYUv2CRjdFQnOlxYYwUwOUY+QiCeLTg+tMJey/+Os8vE9E6pvteqbOuCLdNn
 B/vy/3/GUoGB3p7VTZLaHBiie2hkKxp7LLkBuSelFeM2Lj85kPrNzL8tVQEwh6msaSRW
 gDI0ald+clzrjHgJUFKfp9+BjXv8KmJ8TT9k4mfSQzqgZqwPdFWjA3mvwEMqYQjp6zNS
 n2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=boZlC9cES8mgQCV+vpw6dNMvA6C5kwGu41XuL0MFGgA=;
 b=BTqcQ4skMBHI3HCGhGhx7gWKMQ7zpBUh6qP3GRcsgyS3Omb4jV3AU5djeaM4HEOaT+
 fk61GvXFcI2f29TAfIgBFiQSusvMrC5JnfyzkyGnO9Wvtek5VDOiKSJAFdsQsluT1DyU
 JJh+QiRBjiJKt2E6Jx71OCcr04xtlinZQNL3M910D41d/07nxEfwMfKXM+YPYuQ175nU
 ydAIs8JdxaxayCAAfnouI4qGZoDKiBtWiyrerk0D8ga1MVAyn9jkpvHJTUVdBw7eXaJp
 YMblYdKUBobr5TWVkWatslGCrEtE3aKPOrxreYivYonpS/NVUhLLcLMY4Y/+unGMiL65
 IwWg==
X-Gm-Message-State: AOAM532D4B7QaM4uDnWLQaSCP0aMh8mXov6tlgq3Nb3/EY+fkiJWTwGO
 LTn8U9I3s2j/7/iqtHgMCN8=
X-Google-Smtp-Source: ABdhPJw/taOWEhajmwkCme2jqEzJdtG/AhwlsDmEpk+Ykf4yZTn3KQJ1fZ6y0ECdx3diyFSwpM7XaA==
X-Received: by 2002:a63:c004:: with SMTP id h4mr12497488pgg.385.1592824519235; 
 Mon, 22 Jun 2020 04:15:19 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id n189sm13950150pfn.108.2020.06.22.04.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:15:18 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Don Fry <pcnet32@frontier.com>, Tom Lendacky <thomas.lendacky@amd.com>
Date: Mon, 22 Jun 2020 16:43:58 +0530
Message-Id: <20200622111400.55956-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622111400.55956-1-vaibhavgupta40@gmail.com>
References: <20200622111400.55956-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 1/3] pcnet32: Convert to generic
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
pci_save_state(). In generic code, all these are handled by PCI core.

The generic suspend() and resume() are called at the same point the legacy
ones were called. Thus, it does not affect the normal functioning of the
driver.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/amd/pcnet32.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/amd/pcnet32.c b/drivers/net/ethernet/amd/pcnet32.c
index 07e8211eea51..d32f54d760e7 100644
--- a/drivers/net/ethernet/amd/pcnet32.c
+++ b/drivers/net/ethernet/amd/pcnet32.c
@@ -2913,30 +2913,27 @@ static void pcnet32_watchdog(struct timer_list *t)
 	mod_timer(&lp->watchdog_timer, round_jiffies(PCNET32_WATCHDOG_TIMEOUT));
 }
 
-static int pcnet32_pm_suspend(struct pci_dev *pdev, pm_message_t state)
+static int pcnet32_pm_suspend(struct device *device_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(device_d);
 
 	if (netif_running(dev)) {
 		netif_device_detach(dev);
 		pcnet32_close(dev);
 	}
-	pci_save_state(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
+
 	return 0;
 }
 
-static int pcnet32_pm_resume(struct pci_dev *pdev)
+static int pcnet32_pm_resume(struct device *device_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
+	struct net_device *dev = dev_get_drvdata(device_d);
 
 	if (netif_running(dev)) {
 		pcnet32_open(dev);
 		netif_device_attach(dev);
 	}
+
 	return 0;
 }
 
@@ -2957,13 +2954,16 @@ static void pcnet32_remove_one(struct pci_dev *pdev)
 	}
 }
 
+static SIMPLE_DEV_PM_OPS(pcnet32_pm_ops, pcnet32_pm_suspend, pcnet32_pm_resume);
+
 static struct pci_driver pcnet32_driver = {
 	.name = DRV_NAME,
 	.probe = pcnet32_probe_pci,
 	.remove = pcnet32_remove_one,
 	.id_table = pcnet32_pci_tbl,
-	.suspend = pcnet32_pm_suspend,
-	.resume = pcnet32_pm_resume,
+	.driver = {
+		.pm = &pcnet32_pm_ops,
+	},
 };
 
 /* An additional parameter that may be passed in... */
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
