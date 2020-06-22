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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11087C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:44:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7AEC20716
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 11:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9WgbAOK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7AEC20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D00A87E57;
	Mon, 22 Jun 2020 11:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWFZzsSiXZAI; Mon, 22 Jun 2020 11:44:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2097687DEF;
	Mon, 22 Jun 2020 11:44:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D00BC0891;
	Mon, 22 Jun 2020 11:44:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A8A1C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 242DC887E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNvB8CJ68WcU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B4A91886FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 11:44:21 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id u8so8040293pje.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 04:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BPbjKYMHm32Cbq8mcRL1k19s011F/vdrw1Z/1h/BoFI=;
 b=W9WgbAOKoQ9vJ+KfjZt44yCSuN6FjFvqzAiNjUlfhV7txGEG3vtw3b3rD86ksCnkrx
 G/Oz1KBaCQbtLY9yPTT4aT1aQx4Qk+27aKmrCxjltwg6tWVd/PxOhEGaorD0XbV4+3y5
 T+pLGjjW5tjiRifgebT9pvqspqhMPNh1zTSKJVzQO1t3ADjp8Jvnc4TbyW9YZg8ePr2/
 6I6Foa55k4QvKyvch1mjgcR/ppgH1DBjV2iCXCMyXEUBVX96CpT6XrBsczUeTvJJkkiP
 RWytvzzjbTMt30hkiIDbfuFPRixxftMVR1Wg8pS7rcTdsfmk8iEIgKlMmwpDjP2BKstB
 GaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPbjKYMHm32Cbq8mcRL1k19s011F/vdrw1Z/1h/BoFI=;
 b=DkcvYbEyHbAq72ZU+fwdFw2o0OxYKJ3HcG/Bm9BW36lSHJ2Fh0nnRONhn/YXLEe3p/
 Q5UZbu0WqrHGiEtmhgAWwTFyYjzg+UMZZfWC3MO0vh/0sULU9wECYPcFtc5f5VCWSGaA
 EG8PUpSUwS3gyIR89b6GDAjSDWJQEuD5IFn63cky2Cq/CZxsEVPFXRFNER6/uW45L+s6
 ZAJ/uZML1UTVsGS7bFdmKQX8PNk0qBAKw9bwMNAzQCKzM9DKPib4j/e17qpMqM1uSyHX
 49xhKntixtWF1Sn01EZ0R1OIBfhGw5Q53AOc2A7sfgTphdMuRFi9At0vDxZx77xraKKp
 RPjg==
X-Gm-Message-State: AOAM53126Xuv82yvtBgdPAzewVZwIcdfI81QfDKMqlDTmRWiduqVQJ8c
 VPdQ5lEAHiagVhRf14omLKuTtKGeY2w=
X-Google-Smtp-Source: ABdhPJyxLKscGneV+xX9/87Zow8KbCDQ5hwGFnKH5GJFjesozVOayiLOZjXNm6HA4MgkJm5vYIvmOw==
X-Received: by 2002:a17:902:3:: with SMTP id 3mr17681289pla.120.1592826261334; 
 Mon, 22 Jun 2020 04:44:21 -0700 (PDT)
Received: from varodek.localdomain ([2401:4900:b8b:123e:d7ae:5602:b3d:9c0])
 by smtp.gmail.com with ESMTPSA id j17sm14081032pjy.22.2020.06.22.04.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 04:44:20 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Mon, 22 Jun 2020 17:12:26 +0530
Message-Id: <20200622114228.60027-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622114228.60027-1-vaibhavgupta40@gmail.com>
References: <20200622114228.60027-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-parisc@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 3/5] tulip: de2104x: use generic
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

Earlier, .suspend() and .resume() were invoking pci_disable_device()
and pci_enable_device() respectively to manage the device's power state.
With generic PM, it is no longer needed. The driver is expected to just
implement driver-specific operations and leave power transitions to PCI
core.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/dec/tulip/de2104x.c | 25 ++++++++----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index 592454f444ce..cb116b530f5e 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -2105,11 +2105,10 @@ static void de_remove_one(struct pci_dev *pdev)
 	free_netdev(dev);
 }
 
-#ifdef CONFIG_PM
-
-static int de_suspend (struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused de_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata (pdev);
+	struct pci_dev *pdev = to_pci_dev(dev_d);
+	struct net_device *dev = pci_get_drvdata(pdev);
 	struct de_private *de = netdev_priv(dev);
 
 	rtnl_lock();
@@ -2136,7 +2135,6 @@ static int de_suspend (struct pci_dev *pdev, pm_message_t state)
 		de_clean_rings(de);
 
 		de_adapter_sleep(de);
-		pci_disable_device(pdev);
 	} else {
 		netif_device_detach(dev);
 	}
@@ -2144,21 +2142,17 @@ static int de_suspend (struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-static int de_resume (struct pci_dev *pdev)
+static int __maybe_unused de_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata (pdev);
+	struct pci_dev *pdev = to_pci_dev(dev_d);
+	struct net_device *dev = pci_get_drvdata(pdev);
 	struct de_private *de = netdev_priv(dev);
-	int retval = 0;
 
 	rtnl_lock();
 	if (netif_device_present(dev))
 		goto out;
 	if (!netif_running(dev))
 		goto out_attach;
-	if ((retval = pci_enable_device(pdev))) {
-		netdev_err(dev, "pci_enable_device failed in resume\n");
-		goto out;
-	}
 	pci_set_master(pdev);
 	de_init_rings(de);
 	de_init_hw(de);
@@ -2169,17 +2163,14 @@ static int de_resume (struct pci_dev *pdev)
 	return 0;
 }
 
-#endif /* CONFIG_PM */
+static SIMPLE_DEV_PM_OPS(de_pm_ops, de_suspend, de_resume);
 
 static struct pci_driver de_driver = {
 	.name		= DRV_NAME,
 	.id_table	= de_pci_tbl,
 	.probe		= de_init_one,
 	.remove		= de_remove_one,
-#ifdef CONFIG_PM
-	.suspend	= de_suspend,
-	.resume		= de_resume,
-#endif
+	.driver.pm	= &de_pm_ops,
 };
 
 static int __init de_init (void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
