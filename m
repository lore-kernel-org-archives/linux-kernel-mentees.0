Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3AAC433EA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 16:22:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A15206E9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 16:22:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A17M+Gb9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A15206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2B7B58731C;
	Mon, 20 Jul 2020 16:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZEfocEoCKgv; Mon, 20 Jul 2020 16:22:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3400286C11;
	Mon, 20 Jul 2020 16:22:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FFB6C0894;
	Mon, 20 Jul 2020 16:22:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB8EEC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 16:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B47E186C11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 16:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YbHuxlPMQf7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 16:22:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 259C28696A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 16:22:46 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id m22so10487652pgv.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 09:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nnDDY7IX3v4medtpXGPdXY1iT0mYb0tLN6RrGWdwErQ=;
 b=A17M+Gb9yAQCkiEsHp1GN5Hgm6to1S70lc+I5sny7onNXnTMXpIGw0rxYa3HyRAFTF
 EHzuXZiN0PrVqSXi/QmZ03PpuxD3wqo0Ej0MHbfYpufERXznei6xPYaU2pnpr1hEw/P3
 YXdYohfyeDlnFXpgWw0Gj/3uIueARBVT7JkmuVXfoU+CAYtgBaBBntTcYkNOJtuLAhBS
 3CeUProdPmHFMcuj8pjLxjbKYjndPF4TKbcwUepCmwBSSHdw/1VqtNpJTqu1n7W73/j/
 Ohc2uW7Wkl9CfjwBq4+3cw5TTMOAX/vmAuNeTiC4xAHSGmffrUWcOew6eoDXU29nlS7i
 SgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nnDDY7IX3v4medtpXGPdXY1iT0mYb0tLN6RrGWdwErQ=;
 b=fSNQXPZ6bsq2Jvs4gXkR33inJFUS1c2r2nIQnwl1+zN1VO6q5xrl6k6aGm6USer3HB
 npWMZQIRF/k4X2aeTXQQbnMuBBejdai2Q2AlY3chKoDRoVwV/GxtsxE58C1tB+owIgOS
 +6f3YZnVSYke4vhZYLMWGbEM37mrUS1fksP2uO5kaNuynQ/z80IYGeMyco6bAenfsV3t
 3zje6U9n0406IcOQ3ytostY+37b+Vgjmg+/PfTCFNxMZJcxLRJIZN36HQmNQICy+Xi5x
 oXuttMC+EMAFvCKksHbAt3aLx30YbyhdbDYUg6D4pxYR2xTxfPIxkoT6UmdMn2ZTY5eF
 9cxA==
X-Gm-Message-State: AOAM530wKAkrme3CQ4beKHZOElbr2WOsLwYDLf+joun4JiWo+wkxVmG/
 130mPeLrMELR3xBsqxXzh1c=
X-Google-Smtp-Source: ABdhPJyV19tnS/w6rmKS67FPtr8WvyuBYwXnr0WSfBWxPzcPsoHAVVNX2vFNeLQe7tQxnvt+Ak0Alg==
X-Received: by 2002:a62:7e51:: with SMTP id z78mr20531383pfc.3.1595262165631; 
 Mon, 20 Jul 2020 09:22:45 -0700 (PDT)
Received: from varodek.localdomain ([110.225.71.189])
 by smtp.gmail.com with ESMTPSA id z25sm17314468pfg.140.2020.07.20.09.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 09:22:44 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Chris Lee <christopher.lee@cspi.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Mon, 20 Jul 2020 21:49:31 +0530
Message-Id: <20200720161930.777974-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] ethernet: myri10ge: use generic
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

Drivers using legacy PM have to manage PCI states and device's PM states
themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of
above mentioned, device-independent, jobs.

This driver makes use of PCI helper functions like
pci_save/restore_state(), pci_enable/disable_device(),
pci_set_power_state() and pci_set_master() to do required operations. In
generic mode, they are no longer needed.

Change function parameter in both .suspend() and .resume() to
"struct device*" type. Use to_pci_dev() and dev_get_drvdata() to get
"struct pci_dev*" variable and drv data.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 .../net/ethernet/myricom/myri10ge/myri10ge.c  | 37 ++++---------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
index e1e1f4e3639e..4a5beafa0493 100644
--- a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
+++ b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
@@ -3257,13 +3257,12 @@ static void myri10ge_mask_surprise_down(struct pci_dev *pdev)
 	}
 }
 
-#ifdef CONFIG_PM
-static int myri10ge_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused myri10ge_suspend(struct device *dev)
 {
 	struct myri10ge_priv *mgp;
 	struct net_device *netdev;
 
-	mgp = pci_get_drvdata(pdev);
+	mgp = dev_get_drvdata(dev);
 	if (mgp == NULL)
 		return -EINVAL;
 	netdev = mgp->dev;
@@ -3276,14 +3275,13 @@ static int myri10ge_suspend(struct pci_dev *pdev, pm_message_t state)
 		rtnl_unlock();
 	}
 	myri10ge_dummy_rdma(mgp, 0);
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
 
-	return pci_set_power_state(pdev, pci_choose_state(pdev, state));
+	return 0;
 }
 
-static int myri10ge_resume(struct pci_dev *pdev)
+static int __maybe_unused myri10ge_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct myri10ge_priv *mgp;
 	struct net_device *netdev;
 	int status;
@@ -3293,7 +3291,6 @@ static int myri10ge_resume(struct pci_dev *pdev)
 	if (mgp == NULL)
 		return -EINVAL;
 	netdev = mgp->dev;
-	pci_set_power_state(pdev, PCI_D0);	/* zeros conf space as a side effect */
 	msleep(5);		/* give card time to respond */
 	pci_read_config_word(mgp->pdev, PCI_VENDOR_ID, &vendor);
 	if (vendor == 0xffff) {
@@ -3301,23 +3298,9 @@ static int myri10ge_resume(struct pci_dev *pdev)
 		return -EIO;
 	}
 
-	pci_restore_state(pdev);
-
-	status = pci_enable_device(pdev);
-	if (status) {
-		dev_err(&pdev->dev, "failed to enable device\n");
-		return status;
-	}
-
-	pci_set_master(pdev);
-
 	myri10ge_reset(mgp);
 	myri10ge_dummy_rdma(mgp, 1);
 
-	/* Save configuration space to be restored if the
-	 * nic resets due to a parity error */
-	pci_save_state(pdev);
-
 	if (netif_running(netdev)) {
 		rtnl_lock();
 		status = myri10ge_open(netdev);
@@ -3331,11 +3314,8 @@ static int myri10ge_resume(struct pci_dev *pdev)
 	return 0;
 
 abort_with_enabled:
-	pci_disable_device(pdev);
 	return -EIO;
-
 }
-#endif				/* CONFIG_PM */
 
 static u32 myri10ge_read_reboot(struct myri10ge_priv *mgp)
 {
@@ -4017,15 +3997,14 @@ static const struct pci_device_id myri10ge_pci_tbl[] = {
 
 MODULE_DEVICE_TABLE(pci, myri10ge_pci_tbl);
 
+static SIMPLE_DEV_PM_OPS(myri10ge_pm_ops, myri10ge_suspend, myri10ge_resume);
+
 static struct pci_driver myri10ge_driver = {
 	.name = "myri10ge",
 	.probe = myri10ge_probe,
 	.remove = myri10ge_remove,
 	.id_table = myri10ge_pci_tbl,
-#ifdef CONFIG_PM
-	.suspend = myri10ge_suspend,
-	.resume = myri10ge_resume,
-#endif
+	.driver.pm = &myri10ge_pm_ops,
 };
 
 #ifdef CONFIG_MYRI10GE_DCA
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
