Return-Path: <SRS0=qUvW=AF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6EBC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 17:54:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5121E2145D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 17:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5fFtF0j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5121E2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F171C8780E;
	Wed, 24 Jun 2020 17:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1okofIc8VXsX; Wed, 24 Jun 2020 17:54:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 55241877A8;
	Wed, 24 Jun 2020 17:54:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B53FC088E;
	Wed, 24 Jun 2020 17:54:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CB0EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 05B62883C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GvLA7WWBRJaj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:54:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 78DDF88386
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 17:54:45 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l63so1738736pge.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 10:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXUyv238pekzvkTdjE9jyItW1AvND5eE/li17UD93Hs=;
 b=e5fFtF0jMZYIgT3luOiqnzFW2YP9PpyUp+U4k8GRA6E7KgKR2m/i4RQV1/HpHcL0Q/
 dinTdZXPrHeVM39tf0OZoXnDcBa/2kfQ1YYJaOxqG/PkBVc6mfX6UCW1PEgcYZO/6acf
 D0SBG3gMjaGkXn9R3yDagJFUsFJ0XGP1E/REf6SgORIpXZKSHDGfcq9e6cqCId2Tay7A
 g7wwMRwwkUMdoVN4MUd01EIsP/bJc1pE8UVVEsTSbXpcgwkSS0TdtAxH5XWurQ9Yauw2
 10uEvxitaHi5LF+Ij1e/10/nsG8SXQl8wRD8p0Hu+FX1N/9ferNyi+3cjpbjPFJg6n+P
 mDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXUyv238pekzvkTdjE9jyItW1AvND5eE/li17UD93Hs=;
 b=P4vvrPBEdOsiYhiVjf9xtBkqaHMvX4k82GubS0wWp1GNmqNw7vbGjbTSEOCVIJkwx/
 LKX0eMvsKJGs5RgnOC1daYOubuvvj0wrqef1x7swGwsVpXRRcGollbJ4IH+VT1O5Io+z
 uEB5YR3OBaSht7xKyDd7D/p/hCrV2g6S2I7HfKaGw1WWSeNw9OadkkmejjZqXP5c3A1R
 hJFBOwIDYCVFjP1qJ8gV3s2n/w7ct5qlLn+ngYJsD/tn2GB8ItDCbFpHxdhtGNYVqt/O
 AOHbBOzHEFLmhn2zXHKCCUhoLAJHP449VKgcUARy0A+j0X9d6x2VzUAyeXn3Kt0ePBEn
 4d/w==
X-Gm-Message-State: AOAM532gqJbWywamc+xqXCjE4j33T/YZwwEylx9HT3m9WsYLqziI0lLP
 YVvFUwtU3EafdEgr572qbFg=
X-Google-Smtp-Source: ABdhPJwjwtudzAkECBQj2lyFbOWQQy8jgJjFUjeBzolsSYY2bFu6/gVDhyxlUSKuLFxKpBySL1Ki4w==
X-Received: by 2002:a63:dc13:: with SMTP id s19mr22361547pgg.53.1593021285045; 
 Wed, 24 Jun 2020 10:54:45 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id ia13sm1233712pjb.42.2020.06.24.10.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 10:54:44 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ariel Elior <aelior@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 GR-everest-linux-l2@marvell.com
Date: Wed, 24 Jun 2020 23:21:17 +0530
Message-Id: <20200624175116.67911-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] bnx2x: use generic power
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
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

The driver was also calling bnx2x_set_power_state() to set the power state
of the device by changing the device's registers' value. It is no more
needed.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c  | 15 ++++++---------
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h  |  4 +---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c |  3 +--
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
index ee9e9290f112..e3d92e4f2193 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
@@ -4988,8 +4988,9 @@ void bnx2x_tx_timeout(struct net_device *dev, unsigned int txqueue)
 	bnx2x_schedule_sp_rtnl(bp, BNX2X_SP_RTNL_TX_TIMEOUT, 0);
 }
 
-int bnx2x_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused bnx2x_suspend(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct net_device *dev = pci_get_drvdata(pdev);
 	struct bnx2x *bp;
 
@@ -5001,8 +5002,6 @@ int bnx2x_suspend(struct pci_dev *pdev, pm_message_t state)
 
 	rtnl_lock();
 
-	pci_save_state(pdev);
-
 	if (!netif_running(dev)) {
 		rtnl_unlock();
 		return 0;
@@ -5012,15 +5011,14 @@ int bnx2x_suspend(struct pci_dev *pdev, pm_message_t state)
 
 	bnx2x_nic_unload(bp, UNLOAD_CLOSE, false);
 
-	bnx2x_set_power_state(bp, pci_choose_state(pdev, state));
-
 	rtnl_unlock();
 
 	return 0;
 }
 
-int bnx2x_resume(struct pci_dev *pdev)
+static int __maybe_unused bnx2x_resume(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct net_device *dev = pci_get_drvdata(pdev);
 	struct bnx2x *bp;
 	int rc;
@@ -5038,14 +5036,11 @@ int bnx2x_resume(struct pci_dev *pdev)
 
 	rtnl_lock();
 
-	pci_restore_state(pdev);
-
 	if (!netif_running(dev)) {
 		rtnl_unlock();
 		return 0;
 	}
 
-	bnx2x_set_power_state(bp, PCI_D0);
 	netif_device_attach(dev);
 
 	rc = bnx2x_nic_load(bp, LOAD_OPEN);
@@ -5055,6 +5050,8 @@ int bnx2x_resume(struct pci_dev *pdev)
 	return rc;
 }
 
+SIMPLE_DEV_PM_OPS(bnx2x_pm_ops, bnx2x_suspend, bnx2x_resume);
+
 void bnx2x_set_ctx_validation(struct bnx2x *bp, struct eth_context *cxt,
 			      u32 cid)
 {
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h
index 6f1352d51cb2..a9817cd283fe 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h
@@ -541,9 +541,7 @@ int bnx2x_change_mac_addr(struct net_device *dev, void *p);
 /* NAPI poll Tx part */
 int bnx2x_tx_int(struct bnx2x *bp, struct bnx2x_fp_txdata *txdata);
 
-/* suspend/resume callbacks */
-int bnx2x_suspend(struct pci_dev *pdev, pm_message_t state);
-int bnx2x_resume(struct pci_dev *pdev);
+extern const struct dev_pm_ops bnx2x_pm_ops;
 
 /* Release IRQ vectors */
 void bnx2x_free_irq(struct bnx2x *bp);
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index db5107e7937c..ea60cd436f5e 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -14462,8 +14462,7 @@ static struct pci_driver bnx2x_pci_driver = {
 	.id_table    = bnx2x_pci_tbl,
 	.probe       = bnx2x_init_one,
 	.remove      = bnx2x_remove_one,
-	.suspend     = bnx2x_suspend,
-	.resume      = bnx2x_resume,
+	.driver.pm   = &bnx2x_pm_ops,
 	.err_handler = &bnx2x_err_handler,
 #ifdef CONFIG_BNX2X_SRIOV
 	.sriov_configure = bnx2x_sriov_configure,
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
