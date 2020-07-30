Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370F5C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 06:44:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C125206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 06:44:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7pn/vdU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C125206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A2876883B1;
	Thu, 30 Jul 2020 06:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXzrtHQfSblW; Thu, 30 Jul 2020 06:44:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AF05A883AA;
	Thu, 30 Jul 2020 06:44:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BD38C004F;
	Thu, 30 Jul 2020 06:44:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EF42C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 688BC20347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NmK8uc4v0TQN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 9F2742012D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:44:31 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id l2so8133969pff.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 23:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vlI3SS5LvqfdvM+r/BRxyq9xbnF0HtDqy+K6GhzXBQ=;
 b=F7pn/vdUGyHNpJ5LnexqOBDYKQKnF9QfMCXyYdInmVdp/JzJFLcckKFTcjH4VrilYf
 4Hps7LsNc7soNYUtMGpnJvaJ/QDfve7hrlv0drmnkXAd/ZMBjoG2SdkiMkh0bsjtjBWv
 qGPDar5x1XpLn8qm+Oze1B+bLhBwIT2WbBG7Knd7rWSDUnsfPhyDufVLNpnjHK9ttk9v
 vQwqG2gVx0HXMUNe9eJRkWOdr/O5YJOdxThjDrlkRcW4bXx1OSePfnc590ZRMJ9B3N6Y
 9p7K3fLtkAtE0QqHYkDIQRzhXTWgcnUUbW1emabD//5o8sr7RN77juR2DATWiUFNNGAm
 2qKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vlI3SS5LvqfdvM+r/BRxyq9xbnF0HtDqy+K6GhzXBQ=;
 b=beLnCha7xZ5v6H0Ej+c7HEciLDmLnUrhxnVFHI/a2hyRdIxqYSkMXyB24DaKHK26Mq
 ftqBE5PkNbt7ApNGyTfWbNITeoXZqvZrBN5lNPt4skpzNw9J0Jv7tidDdeiI5L3gmNcG
 vhcAPq7PIkyZvqvBeKNGcFBVk+AEHQUJAmopuubNd+Ewsnn/Oc294hXPSCH7fgaO2EU5
 m8O/KamnNhZ6jiv/M5PxdVApgNkvedkwjz21XhTE973LWAJVA4UERidUuQI8pdnrBJSB
 qre4jtyFl19vPTfshVgZJlBKZvVc2HqTSbjPMGXXbtSufQG6KXU/zKjhW2ECNbbUzdYA
 j3aA==
X-Gm-Message-State: AOAM530FxBeYZfENL0w4Bvdoedd4phtWFc/wYzohtwCCTI7/wVa+L6aL
 zhm9f+5Lp0/KRulgsVjCeSUUDS1pGRJnVg==
X-Google-Smtp-Source: ABdhPJz1aeKVWZX4u2w6g489ELA8fTkpKQMu1PBdZ0IduIPpWXPqOwdj8qn5V8VqMIG1A4eaWOEvBw==
X-Received: by 2002:a63:417:: with SMTP id 23mr31435392pge.44.1596091471237;
 Wed, 29 Jul 2020 23:44:31 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t19sm4456942pgg.19.2020.07.29.23.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 23:44:30 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Daniele Venzano <venza@brownhat.org>, Samuel Chessman <chessman@tux.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 30 Jul 2020 12:12:29 +0530
Message-Id: <20200730064229.174933-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730064229.174933-1-vaibhavgupta40@gmail.com>
References: <20200730051733.113652-1-vaibhavgupta40@gmail.com>
 <20200730064229.174933-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 3/3] tlan: use generic power
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

Drivers using legacy power management .suspen()/.resume() callbacks
have to manage PCI states and device's PM states themselves. They also
need to take care of standard configuration registers.

Switch to generic power management framework using a single
"struct dev_pm_ops" variable to take the unnecessary load from the driver.
This also avoids the need for the driver to directly call most of the PCI
helper functions and device power state control functions, as through
the generic framework PCI Core takes care of the necessary operations,
and drivers are required to do only device-specific jobs.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/ti/tlan.c | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/ti/tlan.c b/drivers/net/ethernet/ti/tlan.c
index 857709828058..c799945a39ef 100644
--- a/drivers/net/ethernet/ti/tlan.c
+++ b/drivers/net/ethernet/ti/tlan.c
@@ -345,33 +345,21 @@ static void tlan_stop(struct net_device *dev)
 	}
 }
 
-#ifdef CONFIG_PM
-
-static int tlan_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused tlan_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 
 	if (netif_running(dev))
 		tlan_stop(dev);
 
 	netif_device_detach(dev);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_wake_from_d3(pdev, false);
-	pci_set_power_state(pdev, PCI_D3hot);
 
 	return 0;
 }
 
-static int tlan_resume(struct pci_dev *pdev)
+static int __maybe_unused tlan_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
-	int rc = pci_enable_device(pdev);
-
-	if (rc)
-		return rc;
-	pci_restore_state(pdev);
-	pci_enable_wake(pdev, PCI_D0, 0);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	netif_device_attach(dev);
 
 	if (netif_running(dev))
@@ -380,21 +368,14 @@ static int tlan_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-#else /* CONFIG_PM */
-
-#define tlan_suspend   NULL
-#define tlan_resume    NULL
-
-#endif /* CONFIG_PM */
-
+static SIMPLE_DEV_PM_OPS(tlan_pm_ops, tlan_suspend, tlan_resume);
 
 static struct pci_driver tlan_driver = {
 	.name		= "tlan",
 	.id_table	= tlan_pci_tbl,
 	.probe		= tlan_init_one,
 	.remove		= tlan_remove_one,
-	.suspend	= tlan_suspend,
-	.resume		= tlan_resume,
+	.driver.pm	= &tlan_pm_ops,
 };
 
 static int __init tlan_probe(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
