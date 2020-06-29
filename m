Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1E4C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 09:31:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5070620857
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 09:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6ebBXcZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5070620857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3129F8761F;
	Mon, 29 Jun 2020 09:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CoTUgQms8PaQ; Mon, 29 Jun 2020 09:31:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B46ED8761D;
	Mon, 29 Jun 2020 09:31:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B044CC07FF;
	Mon, 29 Jun 2020 09:31:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06C96C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D74C925D66
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D+6ljt9-pBpy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id AC73325D5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:20 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id a127so7638301pfa.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 02:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y9KYjkbiR1My5Ffq4vIf/Hm4e77c+uBf3NZ5oJyz9ys=;
 b=A6ebBXcZgYVQ4MmoB/nHGk8Jgn7ZEian0Q8zKJFOteyApn8XDBK3mz/j1RRpS3Xkv5
 8tOGySH9jVq3r0NEVP3vVtSDCwCAh+1mMz5DoUYHrzS0QsyFzbSuW7ptHRoRgtwtKVl7
 OqxLMbjiwVUNUHekMWK9GrJr0KljM9lMqsKWYJw+mgCZ5aB8kX8G+064BMMLeXTU6O+B
 q1X9y8gnU2yUc9K1gcn+i9uKnE924tcSnqsWjUC2HLOr4gvTlMd3I1LXbtFMykcHsHZm
 F5ZCgLU9wBfcXRGm8bSDEtcVlxGYB2MUkvYHuavM3G630oOVjc2raTslJAPd4sYGW+og
 QdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y9KYjkbiR1My5Ffq4vIf/Hm4e77c+uBf3NZ5oJyz9ys=;
 b=tXEjjJ5YqansxnaVeoOm0OB/gKFuTAAABBWBu/uG30g738JDMOtz4ycPS/bnOghigu
 zjMGC8uSRZxnYwvKSqJNBP/1v/6y5CU4ziY355d5SXBpvlJCgKBkBcaYkrus4495cSV6
 q72szPn/jASEkWtb30g5JuOlCC4GkmG9Bt7QJVbEL/8Ix+KFDgPyhSZQAC/rCzDC4JmW
 43gEBi+o73Wvw2Yjy6x3fQx9+3x/gYYW3S3OhhOhuRBTmB6lPqxlo9hNur0wZu4SE60K
 RWPPguunvvQCHvJsbdHvmU6dI6yUsQRR6PxqDSqflwSsBJdTXIRMaGlrWYJ0pdVYdHaM
 slDw==
X-Gm-Message-State: AOAM531Ae7S7IvwjQ9f2SACS4wiYPKuQG9lwK6MBZYAAfJTft1Mvw9h3
 VB4gfm/ovzNkcyVJNdgvv44=
X-Google-Smtp-Source: ABdhPJz/nRI7irHgjO0iq6QaoncxuD3EEDuh0r14Hz0DHIyPXF79779I+BckEkrN3/yh9CfuDsdgXg==
X-Received: by 2002:a62:1d81:: with SMTP id d123mr13563954pfd.38.1593423080148; 
 Mon, 29 Jun 2020 02:31:20 -0700 (PDT)
Received: from varodek.localdomain ([106.210.40.90])
 by smtp.gmail.com with ESMTPSA id q20sm2921286pfn.111.2020.06.29.02.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 02:31:19 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Mon, 29 Jun 2020 14:59:39 +0530
Message-Id: <20200629092943.227910-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629092943.227910-1-vaibhavgupta40@gmail.com>
References: <20200629092943.227910-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 1/5] iavf: use generic power
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

With the support of generic PM callbacks, drivers no longer need to use
legacy .suspend() and .resume() in which they had to maintain PCI states
changes and device's power state themselves. The required operations are
done by PCI core.

PCI drivers are not expected to invoke PCI helper functions like
pci_save/restore_state(), pci_enable/disable_device(),
pci_set_power_state(), etc. Their tasks are completed by PCI core itself.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/intel/iavf/iavf_main.c | 45 ++++++---------------
 1 file changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
index fa82768e5eda..93fa0884ca69 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -3772,7 +3772,6 @@ static int iavf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return err;
 }
 
-#ifdef CONFIG_PM
 /**
  * iavf_suspend - Power management suspend routine
  * @pdev: PCI device information struct
@@ -3780,11 +3779,10 @@ static int iavf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
  *
  * Called when the system (VM) is entering sleep/suspend.
  **/
-static int iavf_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused iavf_suspend(struct device *dev_d)
 {
-	struct net_device *netdev = pci_get_drvdata(pdev);
+	struct net_device *netdev = dev_get_drvdata(dev_d);
 	struct iavf_adapter *adapter = netdev_priv(netdev);
-	int retval = 0;
 
 	netif_device_detach(netdev);
 
@@ -3802,12 +3800,6 @@ static int iavf_suspend(struct pci_dev *pdev, pm_message_t state)
 
 	clear_bit(__IAVF_IN_CRITICAL_TASK, &adapter->crit_section);
 
-	retval = pci_save_state(pdev);
-	if (retval)
-		return retval;
-
-	pci_disable_device(pdev);
-
 	return 0;
 }
 
@@ -3817,24 +3809,13 @@ static int iavf_suspend(struct pci_dev *pdev, pm_message_t state)
  *
  * Called when the system (VM) is resumed from sleep/suspend.
  **/
-static int iavf_resume(struct pci_dev *pdev)
+static int __maybe_unused iavf_resume(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct iavf_adapter *adapter = pci_get_drvdata(pdev);
 	struct net_device *netdev = adapter->netdev;
 	u32 err;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	/* pci_restore_state clears dev->state_saved so call
-	 * pci_save_state to restore it.
-	 */
-	pci_save_state(pdev);
-
-	err = pci_enable_device_mem(pdev);
-	if (err) {
-		dev_err(&pdev->dev, "Cannot enable PCI device from suspend.\n");
-		return err;
-	}
 	pci_set_master(pdev);
 
 	rtnl_lock();
@@ -3858,7 +3839,6 @@ static int iavf_resume(struct pci_dev *pdev)
 	return err;
 }
 
-#endif /* CONFIG_PM */
 /**
  * iavf_remove - Device Removal Routine
  * @pdev: PCI device information struct
@@ -3960,16 +3940,15 @@ static void iavf_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
+static SIMPLE_DEV_PM_OPS(iavf_pm_ops, iavf_suspend, iavf_resume);
+
 static struct pci_driver iavf_driver = {
-	.name     = iavf_driver_name,
-	.id_table = iavf_pci_tbl,
-	.probe    = iavf_probe,
-	.remove   = iavf_remove,
-#ifdef CONFIG_PM
-	.suspend  = iavf_suspend,
-	.resume   = iavf_resume,
-#endif
-	.shutdown = iavf_shutdown,
+	.name      = iavf_driver_name,
+	.id_table  = iavf_pci_tbl,
+	.probe     = iavf_probe,
+	.remove    = iavf_remove,
+	.driver.pm = &iavf_pm_ops,
+	.shutdown  = iavf_shutdown,
 };
 
 /**
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
