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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940ECC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 17:03:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65AD7206E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 17:03:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rR2FPZsD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65AD7206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 357528A6BE;
	Thu,  2 Jul 2020 17:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kghYt-+YU2e0; Thu,  2 Jul 2020 17:03:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 145408A6BA;
	Thu,  2 Jul 2020 17:03:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0387BC0890;
	Thu,  2 Jul 2020 17:03:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50BB0C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 395C524FFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwapkpXkVv+d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:03:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 001D424F51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:03:17 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id l6so9608642pjq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Jul 2020 10:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LY/w241/d9JF4jCwCG8Wm7cMXoPEghkgFcvunUWO2ig=;
 b=rR2FPZsD9YMhCyXj+2OP3gNFRK/ErkBRg8o1mknW/1EFoNy82bMu0Rsmm/EOVGBSpr
 lvl16+C5y4h0YOaurOjWWgU3ySh3K1XyKD7eafU/kcZBVLoXQqn1KqLq3znX51zwK4h9
 04BdNFj2x/DqhJ/inrJDgBnha1UGRZUUCle+b6Hs6GzkBLmUUDNSPjQoO/sM1mwvX+RW
 0bGv5dqzAY975CyQuZb45cSikwDpkDYKwHbhtwLrpfA1PmE2yYmZ2E2kqqsEayiPgjbr
 NAhEG/vv9LOgnc8r00fDcJvloy2oCElxiVGNM24kRt22+1ueQhczlVFL93CS3PJLWzgK
 hFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LY/w241/d9JF4jCwCG8Wm7cMXoPEghkgFcvunUWO2ig=;
 b=NzUj5SAHIfWpMDDH1deO8I6YlnPvn7GwJ11CSgFsbtPo6wQe8MPADF+3n+akh/G5CW
 N4znics78hAsM1MDha0iJCRf4RZlBuV7b62OgQEg3/KB+lmjnzFia9pU5zpY5gdFR9xK
 K9FF4RfmyOxnf5ZpE2LfC4Hq/ba1Gtv2AW7QgW4ZK23fmrDU/I0gB2ZjZQujxfRyIrTx
 EBgX1VTEspVOK/5FBEZY5f6kJrFbfRUx6tBmkrnYuvOkxuW8Kx0fWuQPlLbbrAkXSV9o
 zqVaddqHZU4bLRr3ySXt2+88+9sUzLwKfwqTXPeaVzsUFC06WQp0HLleLMN9IFoPpcBk
 UfJA==
X-Gm-Message-State: AOAM530hlrc+p3qrWhjpZKSHXEJfBr+gWU7eI17VeR/RQCS+nuF+aSFb
 C0tmxSd7eKTQPxdAKLX9Da0=
X-Google-Smtp-Source: ABdhPJzY+HluNAegr7HutZimRl/CglxDxsBCSMdfdT06bjh0ot4LIOuPj+ajTR79Sr1x4m4TsRUHjA==
X-Received: by 2002:a17:902:b18b:: with SMTP id
 s11mr11507490plr.152.1593709397475; 
 Thu, 02 Jul 2020 10:03:17 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id j21sm9230429pfa.133.2020.07.02.10.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 10:03:17 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>
Date: Thu,  2 Jul 2020 22:31:43 +0530
Message-Id: <20200702170143.27201-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702170143.27201-1-vaibhavgupta40@gmail.com>
References: <20200702170143.27201-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 2/2] qlcninc: use generic power
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and taking care of register states. And they use PCI
helper functions to do it.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

.suspend() calls __qlcnic_shutdown, which then calls qlcnic_82xx_shutdown;
.resume()  calls __qlcnic_resume,   which then calls qlcnic_82xx_resume;

Both ...82xx..() are define in
drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c and are used only in
drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c.

Hence upgrade them and remove PCI function calls, like pci_save_state() and
pci_enable_wake(), inside them

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 .../net/ethernet/qlogic/qlcnic/qlcnic_hw.c    | 11 ++-----
 .../net/ethernet/qlogic/qlcnic/qlcnic_main.c  | 33 ++++---------------
 2 files changed, 9 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c
index 822aa393c370..35d891f4655a 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c
@@ -1649,7 +1649,6 @@ int qlcnic_82xx_shutdown(struct pci_dev *pdev)
 {
 	struct qlcnic_adapter *adapter = pci_get_drvdata(pdev);
 	struct net_device *netdev = adapter->netdev;
-	int retval;
 
 	netif_device_detach(netdev);
 
@@ -1662,14 +1661,8 @@ int qlcnic_82xx_shutdown(struct pci_dev *pdev)
 
 	clear_bit(__QLCNIC_RESETTING, &adapter->state);
 
-	retval = pci_save_state(pdev);
-	if (retval)
-		return retval;
-
-	if (qlcnic_wol_supported(adapter)) {
-		pci_enable_wake(pdev, PCI_D3cold, 1);
-		pci_enable_wake(pdev, PCI_D3hot, 1);
-	}
+	if (qlcnic_wol_supported(adapter))
+		device_wakeup_enable(&pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
index 9dd6cb36f366..e52af092a793 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
@@ -2811,35 +2811,17 @@ static void qlcnic_shutdown(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-#ifdef CONFIG_PM
-static int qlcnic_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused qlcnic_suspend(struct device *dev_d)
 {
-	int retval;
-
-	retval = __qlcnic_shutdown(pdev);
-	if (retval)
-		return retval;
-
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-	return 0;
+	return __qlcnic_shutdown(to_pci_dev(dev_d));
 }
 
-static int qlcnic_resume(struct pci_dev *pdev)
+static int __maybe_unused qlcnic_resume(struct device *dev_d)
 {
-	struct qlcnic_adapter *adapter = pci_get_drvdata(pdev);
-	int err;
-
-	err = pci_enable_device(pdev);
-	if (err)
-		return err;
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_set_master(pdev);
-	pci_restore_state(pdev);
+	struct qlcnic_adapter *adapter = dev_get_drvdata(dev_d);
 
 	return  __qlcnic_resume(adapter);
 }
-#endif
 
 static int qlcnic_open(struct net_device *netdev)
 {
@@ -4258,15 +4240,14 @@ static const struct pci_error_handlers qlcnic_err_handler = {
 	.resume = qlcnic_io_resume,
 };
 
+static SIMPLE_DEV_PM_OPS(qlcnic_pm_ops, qlcnic_suspend, qlcnic_resume);
+
 static struct pci_driver qlcnic_driver = {
 	.name = qlcnic_driver_name,
 	.id_table = qlcnic_pci_tbl,
 	.probe = qlcnic_probe,
 	.remove = qlcnic_remove,
-#ifdef CONFIG_PM
-	.suspend = qlcnic_suspend,
-	.resume = qlcnic_resume,
-#endif
+	.driver.pm = &qlcnic_pm_ops,
 	.shutdown = qlcnic_shutdown,
 	.err_handler = &qlcnic_err_handler,
 #ifdef CONFIG_QLCNIC_SRIOV
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
