Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D8AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 15:08:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E302E2073A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 15:08:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvKDwOQ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E302E2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF78C86E3C;
	Tue, 21 Jul 2020 15:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TCFpyU7-bxgZ; Tue, 21 Jul 2020 15:08:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5A04786E2B;
	Tue, 21 Jul 2020 15:08:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43FF1C088E;
	Tue, 21 Jul 2020 15:08:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D16BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 15:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EFBF38868B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 15:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lxxBZLewIY33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 15:08:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 66A638496E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 15:08:38 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t6so10391022plo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 08:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XxArNrsDxK0jgBrFXe5Xugx6neCsoFxEQFgdlLGJALY=;
 b=cvKDwOQ5Q1EfaXBnNKGYSan/gUvJ2Wpuz0IEZBdbEzg7l/oeqXx2Aw2AR/oHEtXxxQ
 JTqdz8qQl1jw0bOSHve9RQyayuss5fTkI4N7E520IR0YTgY8iQN9dt724jK/FNEqAsWb
 uLL1AbWOs7IRs7gxr3gXxH1nGDlJvl7hOdEH64PuXiEq+Qzzpi7awMJWt4SHrBdaUgI/
 wsBWSW2qCPjzH1FbatYCcH/wvFDCXRa+H84MRkGHs8mQuQwe0/X2CTqgFvOMAqaoFzli
 +xeC+8KU1Hh1AAFUeR9Sa2BDb5NUSgKi4GZQcZoHSeWvc3BH75IeRN1Riasw9SH5O+uV
 IGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XxArNrsDxK0jgBrFXe5Xugx6neCsoFxEQFgdlLGJALY=;
 b=KPCiJGzNDMTbceXc4Ulf3Kz0W36gNsoJuMzIO71AYUyiMsFaRmpZIPgKb3Zw+vFgMW
 kggMt6iVJCPETZC9pBmp2Tde1XJnGGx4uQdFHbFpzliM8cqp5UH0YlKektQ9WkzdqB/f
 XFHSjhARsXI594s9/ia2dag0W+pFdXQGL+w2+d/rXZketIq/PGY7ZqTHUNOo1rdfDJAH
 HOi606rIuvCObgJaMCXA1biV9eA4XsIfEIuL36Zm5zJp+2MGVFRPlclTNRiS8YK0hoXC
 RLaJGuyk6nm2KGecZfwf8MmfOt6eDode+0XM26cjAarXdVHW80A+7artstSaKExisSzy
 XnqQ==
X-Gm-Message-State: AOAM532xC8/EDbDlsT6mlfBnZrDTU77O8J11iBfNeDVabgR1w6wEs4gW
 SG7pXSB7zHiJBe5DereM5Co=
X-Google-Smtp-Source: ABdhPJxx6sheP773N2Alf7m5fZ1kBw3d8TYsmk6FDAhB5okg1aq0WfjsN1Rzp3JE1fPsUGQT+7tCaQ==
X-Received: by 2002:a17:90a:6983:: with SMTP id
 s3mr5240415pjj.55.1595344117406; 
 Tue, 21 Jul 2020 08:08:37 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id j3sm20122735pfe.102.2020.07.21.08.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 08:08:36 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jouni Malinen <j@w1.fi>,
 Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 21 Jul 2020 20:35:48 +0530
Message-Id: <20200721150547.371763-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1] hostap: use generic power
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
helper functions and device power state control functions as through
the generic framework, PCI Core takes care of the necessary operations,
and drivers are required to do only device-specific jobs.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 .../net/wireless/intersil/hostap/hostap_hw.c  |  6 ++--
 .../net/wireless/intersil/hostap/hostap_pci.c | 34 ++++++-------------
 2 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/intersil/hostap/hostap_hw.c b/drivers/net/wireless/intersil/hostap/hostap_hw.c
index 2ab34cf74ecc..b6c497ce12e1 100644
--- a/drivers/net/wireless/intersil/hostap/hostap_hw.c
+++ b/drivers/net/wireless/intersil/hostap/hostap_hw.c
@@ -3366,8 +3366,8 @@ static void prism2_free_local_data(struct net_device *dev)
 }
 
 
-#if (defined(PRISM2_PCI) && defined(CONFIG_PM)) || defined(PRISM2_PCCARD)
-static void prism2_suspend(struct net_device *dev)
+#if defined(PRISM2_PCI) || defined(PRISM2_PCCARD)
+static void __maybe_unused prism2_suspend(struct net_device *dev)
 {
 	struct hostap_interface *iface;
 	struct local_info *local;
@@ -3385,7 +3385,7 @@ static void prism2_suspend(struct net_device *dev)
 	/* Disable hardware and firmware */
 	prism2_hw_shutdown(dev, 0);
 }
-#endif /* (PRISM2_PCI && CONFIG_PM) || PRISM2_PCCARD */
+#endif /* PRISM2_PCI || PRISM2_PCCARD */
 
 
 /* These might at some point be compiled separately and used as separate
diff --git a/drivers/net/wireless/intersil/hostap/hostap_pci.c b/drivers/net/wireless/intersil/hostap/hostap_pci.c
index 0c2aa880e32a..101887e6bd0f 100644
--- a/drivers/net/wireless/intersil/hostap/hostap_pci.c
+++ b/drivers/net/wireless/intersil/hostap/hostap_pci.c
@@ -403,36 +403,23 @@ static void prism2_pci_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-
-#ifdef CONFIG_PM
-static int prism2_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused prism2_pci_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 
 	if (netif_running(dev)) {
 		netif_stop_queue(dev);
 		netif_device_detach(dev);
 	}
 	prism2_suspend(dev);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, PCI_D3hot);
 
 	return 0;
 }
 
-static int prism2_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused prism2_pci_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
-	int err;
-
-	err = pci_enable_device(pdev);
-	if (err) {
-		printk(KERN_ERR "%s: pci_enable_device failed on resume\n",
-		       dev->name);
-		return err;
-	}
-	pci_restore_state(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
+
 	prism2_hw_config(dev, 0);
 	if (netif_running(dev)) {
 		netif_device_attach(dev);
@@ -441,20 +428,19 @@ static int prism2_pci_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
-
 
 MODULE_DEVICE_TABLE(pci, prism2_pci_id_table);
 
+static SIMPLE_DEV_PM_OPS(prism2_pci_pm_ops,
+			 prism2_pci_suspend,
+			 prism2_pci_resume);
+
 static struct pci_driver prism2_pci_driver = {
 	.name		= "hostap_pci",
 	.id_table	= prism2_pci_id_table,
 	.probe		= prism2_pci_probe,
 	.remove		= prism2_pci_remove,
-#ifdef CONFIG_PM
-	.suspend	= prism2_pci_suspend,
-	.resume		= prism2_pci_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= &prism2_pci_pm_ops,
 };
 
 module_pci_driver(prism2_pci_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
