Return-Path: <SRS0=JS1J=52=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FD6C2BA2B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Apr 2020 12:46:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F8920769
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Apr 2020 12:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbS6VdjN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53F8920769
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1926121FAC;
	Fri, 10 Apr 2020 12:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cNGCkQj4n4qh; Fri, 10 Apr 2020 12:46:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 518DB2048A;
	Fri, 10 Apr 2020 12:46:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45D7AC1D74;
	Fri, 10 Apr 2020 12:46:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5391EC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Apr 2020 12:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4764E204F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Apr 2020 12:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yt0RpAjU1BXE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Apr 2020 12:46:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 855CC2048A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Apr 2020 12:46:08 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id c5so946548pgi.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Apr 2020 05:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nNPduYVQjNVZzgR5nwzP5R8JVK808bmPpVd3AT8HHNc=;
 b=HbS6VdjNZCH6GJC6z3yfT0qOpW8Jmblk7r6QHk5Di6+TWYmgdT4YFs0VPwXBrG7KDl
 Y4/BrLaSJUdPmtlWUkiA1F5aJTDl2qYxtZuRB8fkvJbQFtGr1jDeF5tsCjEfwJGqNYJ7
 Yveo/iZRpCenZN4N9kEXIQoJRhb8ihE+5+wPXQcp+zihKOguw05WdO2m2EAAtA7PgNLe
 rjbEfQwlkl/RYsSVYuRUsF3Q1jh0z4vhjAiwUGbguXKgQhEGJt9dNzXpf0Nl12FtaU8t
 WybFwNHgbymtUVDKPpdM1F0OvMPIMqwgOyQVdCpMt1XgE2wEt23O/DYcCtzFUam+E4BA
 NylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nNPduYVQjNVZzgR5nwzP5R8JVK808bmPpVd3AT8HHNc=;
 b=Ge/eBztC2Hwk5hU1qvx1mPuWtaUiu+L7zGX6wpLoWehwnkuEjbDbOrm76QcJmT/Pbb
 E3twLsjIur3ADASX0SePBZhxVT9TuVAeyW2OMrO0cuO3936Dpopgrc//ORw9+KVTe9Cf
 i7upZ6lBWH+0Vb4OKg1BNBRCZ6MfI/CmBetmEaYdY40EghTE7xsLnMtXlo0Kjaoc/llN
 WSvLJmyXN5E2QDVMTymojI0658T9CH+S2xriEgBkJCLu+ScuUQVOWIp/hrgqcFoCVDo8
 DVzcInsT0UfPxIZVdoFhGSihh+fC7cEcJcrfv/e8jpjUgitwFm1eMhpxQo77+S+h12Tc
 6AoQ==
X-Gm-Message-State: AGi0PuZ07RtLSSRwLeoWlVDLP7XssRipWiKixEB5hHp1hBFhOhNCc5rt
 PmNQHTdfZrcLBhUsyeMjXPT4/D2Zgpw=
X-Google-Smtp-Source: APiQypIa8EAp/nDe4DW5a2ZDAEr6CHefSgPhK507kYZs69Jx5vFwoe97hQ5LR7iKHSS1bfbomzA/5Q==
X-Received: by 2002:a63:784f:: with SMTP id t76mr4618246pgc.204.1586522767630; 
 Fri, 10 Apr 2020 05:46:07 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.47])
 by smtp.gmail.com with ESMTPSA id e187sm1679524pfe.143.2020.04.10.05.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 05:46:06 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org, bjorn@helgaas.com,
 skhan@linuxfoundation.org, rjw@rjwysocki.net
Date: Fri, 10 Apr 2020 18:14:19 +0530
Message-Id: <20200410124418.34640-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] ethernet: intel: e1000: Convert
	to dev_pm_ops
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

Convert the legacy callback .suspend() and .resume()
to the generic ones.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/intel/e1000/e1000_main.c | 47 +++++--------------
 1 file changed, 12 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
index 2bced34c19ba..09a6ef46be96 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
@@ -152,8 +152,8 @@ static int e1000_vlan_rx_kill_vid(struct net_device *netdev,
 static void e1000_restore_vlan(struct e1000_adapter *adapter);
 
 #ifdef CONFIG_PM
-static int e1000_suspend(struct pci_dev *pdev, pm_message_t state);
-static int e1000_resume(struct pci_dev *pdev);
+static int e1000_suspend(struct device *dev);
+static int e1000_resume(struct device *dev);
 #endif
 static void e1000_shutdown(struct pci_dev *pdev);
 
@@ -179,16 +179,16 @@ static const struct pci_error_handlers e1000_err_handler = {
 	.resume = e1000_io_resume,
 };
 
+static SIMPLE_DEV_PM_OPS(e1000_pm_ops, e1000_suspend, e1000_resume);
+
 static struct pci_driver e1000_driver = {
 	.name     = e1000_driver_name,
 	.id_table = e1000_pci_tbl,
 	.probe    = e1000_probe,
 	.remove   = e1000_remove,
-#ifdef CONFIG_PM
-	/* Power Management Hooks */
-	.suspend  = e1000_suspend,
-	.resume   = e1000_resume,
-#endif
+	.driver = {
+		.pm = &e1000_pm_ops,
+	},
 	.shutdown = e1000_shutdown,
 	.err_handler = &e1000_err_handler
 };
@@ -5052,9 +5052,6 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
 	struct e1000_hw *hw = &adapter->hw;
 	u32 ctrl, ctrl_ext, rctl, status;
 	u32 wufc = adapter->wol;
-#ifdef CONFIG_PM
-	int retval = 0;
-#endif
 
 	netif_device_detach(netdev);
 
@@ -5068,12 +5065,6 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
 		e1000_down(adapter);
 	}
 
-#ifdef CONFIG_PM
-	retval = pci_save_state(pdev);
-	if (retval)
-		return retval;
-#endif
-
 	status = er32(STATUS);
 	if (status & E1000_STATUS_LU)
 		wufc &= ~E1000_WUFC_LNKC;
@@ -5135,36 +5126,22 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
 }
 
 #ifdef CONFIG_PM
-static int e1000_suspend(struct pci_dev *pdev, pm_message_t state)
+static int e1000_suspend(struct device *dev)
 {
-	int retval;
+	struct pci_dev *pdev = to_pci_dev(dev);
 	bool wake;
 
-	retval = __e1000_shutdown(pdev, &wake);
-	if (retval)
-		return retval;
-
-	if (wake) {
-		pci_prepare_to_sleep(pdev);
-	} else {
-		pci_wake_from_d3(pdev, false);
-		pci_set_power_state(pdev, PCI_D3hot);
-	}
-
-	return 0;
+	return __e1000_shutdown(pdev, &wake);
 }
 
-static int e1000_resume(struct pci_dev *pdev)
+static int e1000_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct net_device *netdev = pci_get_drvdata(pdev);
 	struct e1000_adapter *adapter = netdev_priv(netdev);
 	struct e1000_hw *hw = &adapter->hw;
 	u32 err;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	pci_save_state(pdev);
-
 	if (adapter->need_ioport)
 		err = pci_enable_device(pdev);
 	else
-- 
2.26.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
