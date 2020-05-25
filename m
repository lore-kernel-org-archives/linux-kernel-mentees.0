Return-Path: <SRS0=Bb3l=7H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBB6C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 May 2020 12:28:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D9420812
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 May 2020 12:28:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbHF0I8l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D9420812
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AC6938614E;
	Mon, 25 May 2020 12:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_Lsn-KrEtDc; Mon, 25 May 2020 12:28:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3448B85FA4;
	Mon, 25 May 2020 12:28:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B768C0865;
	Mon, 25 May 2020 12:28:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8F3FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 12:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CF0708614E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 12:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbS3JNJQ2TYo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 12:28:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3537085F7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 12:28:07 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j21so8622926pgb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 05:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+E+o+aNk0CHjmIBkGKHgmosMQQyVO/7BF9hxr8UpXao=;
 b=gbHF0I8l8bVjcUzFdEYW48thV0WucozZhYw8JGmAmLv4MFXm2Fo/2sG9J+9swMgfJB
 H8BvwFudl25lv3J9Vmr4L1PuMaOjt6AVEnwVJFQQ3ojsKBPtbvLyh9Nv3KtvpEo/63LX
 UOatZ58ylsIBXCED3SJtycPD+z5Q6GWuuweu12iBZAOfBPtEPrqgmzQDRDTMtpeRyznV
 SrlXp+Z8rDnWUcbHCeY0tWOpLRBboBWQHzfJJf5YuBHRtM8LfPJC1lkajYImz3bNIHUw
 eV/JTX6Vx0pwj6HSA9f2yrrYhAxX7HNhMuZXiWlTh3kZQqBCR9zyY4fLlEEFksTgqyfO
 XsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+E+o+aNk0CHjmIBkGKHgmosMQQyVO/7BF9hxr8UpXao=;
 b=MthfDygsxax9Zru11/U7jbk0LSdbpBTwKJyhFjDhF9g/69AGzYDCMX4kf4ffxNGoUs
 n+ZNlKiZSQ7CCVmjrPRgjmCbCV41wdI1N4eZonZ4qUDJltkiYNWTxUpsA4jN09cuYqfF
 QXmPSwVUn6BeeFU9PFT9nBSyNUFJC0zXbgxACxdDqBJWh3cylsgFC5X6mJ3NAXr/BaW+
 aqR+XhkbizBwuAk5el4Y9HykTLQJalyCrklXJZeHgNxCYLhJgGIObcNKDpxgqN8UQ3gq
 h8wNuZ4qeVtul3JnyKg0wgydG9HdQuWfcTJendkupTGlFo67GeF9F29ABDaZ2S+L83sR
 XE7g==
X-Gm-Message-State: AOAM533gCAGf77AeZLgdiJNIL5XbQMvC1d73NMlBmWRb40LLVCYeMgQh
 wY+darrcHy08DsLlPU21Rfw=
X-Google-Smtp-Source: ABdhPJwTEJ27OYACa1+AlYAvcPMWB9JsfTWTgmrQEgc6lVISLR09tt4cnP0umhCR/NNEkHAOniSX1Q==
X-Received: by 2002:a05:6a00:150c:: with SMTP id
 q12mr16628282pfu.270.1590409686633; 
 Mon, 25 May 2020 05:28:06 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.209])
 by smtp.gmail.com with ESMTPSA id r21sm12635055pjo.2.2020.05.25.05.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 05:28:05 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 "David S. Miller" <davem@davemloft.net>, rjw@rjwysocki.net
Date: Mon, 25 May 2020 17:57:10 +0530
Message-Id: <20200525122710.25064-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 jesse.brandeburg@intel.com, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] e1000: use generic power
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

compile-tested only

With legacy PM hooks, it was the responsibility of a driver to manage PCI
states and also the device's power state. The generic approach is to let PCI
core handle the work.

e1000_suspend() calls __e1000_shutdown() to perform intermediate tasks.
__e1000_shutdown() modifies the value of "wake" (device should be wakeup
enabled or not), responsible for controlling the flow of legacy PM.

Since, PCI core has no idea about the value of "wake", new code for generic
PM may produce unexpected results. Thus, use "device_set_wakeup_enable()"
to wakeup-enable the device accordingly.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/intel/e1000/e1000_main.c | 49 +++++--------------
 1 file changed, 13 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
index 0d51cbc88028..011509709b3f 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
@@ -151,10 +151,8 @@ static int e1000_vlan_rx_kill_vid(struct net_device *netdev,
 				  __be16 proto, u16 vid);
 static void e1000_restore_vlan(struct e1000_adapter *adapter);
 
-#ifdef CONFIG_PM
-static int e1000_suspend(struct pci_dev *pdev, pm_message_t state);
-static int e1000_resume(struct pci_dev *pdev);
-#endif
+static int __maybe_unused e1000_suspend(struct device *dev);
+static int __maybe_unused e1000_resume(struct device *dev);
 static void e1000_shutdown(struct pci_dev *pdev);
 
 #ifdef CONFIG_NET_POLL_CONTROLLER
@@ -179,16 +177,16 @@ static const struct pci_error_handlers e1000_err_handler = {
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
@@ -5048,9 +5046,6 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
 	struct e1000_hw *hw = &adapter->hw;
 	u32 ctrl, ctrl_ext, rctl, status;
 	u32 wufc = adapter->wol;
-#ifdef CONFIG_PM
-	int retval = 0;
-#endif
 
 	netif_device_detach(netdev);
 
@@ -5064,12 +5059,6 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
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
@@ -5130,37 +5119,26 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int e1000_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused e1000_suspend(struct device *dev)
 {
 	int retval;
+	struct pci_dev *pdev = to_pci_dev(dev);
 	bool wake;
 
 	retval = __e1000_shutdown(pdev, &wake);
-	if (retval)
-		return retval;
-
-	if (wake) {
-		pci_prepare_to_sleep(pdev);
-	} else {
-		pci_wake_from_d3(pdev, false);
-		pci_set_power_state(pdev, PCI_D3hot);
-	}
+	device_set_wakeup_enable(dev, wake);
 
-	return 0;
+	return retval;
 }
 
-static int e1000_resume(struct pci_dev *pdev)
+static int __maybe_unused e1000_resume(struct device *dev)
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
@@ -5197,7 +5175,6 @@ static int e1000_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#endif
 
 static void e1000_shutdown(struct pci_dev *pdev)
 {
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
