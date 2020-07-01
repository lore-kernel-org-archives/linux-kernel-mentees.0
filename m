Return-Path: <SRS0=WnLp=AM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99566C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:02:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F40E20760
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTrFLI6W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F40E20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 623BF8C073;
	Wed,  1 Jul 2020 13:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c14L0ic6sT0b; Wed,  1 Jul 2020 13:02:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E26398BF60;
	Wed,  1 Jul 2020 13:02:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0156C0865;
	Wed,  1 Jul 2020 13:02:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8D79C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D017F8AA9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XaPN8u7+XaJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5CBE38A9AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:32 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id l6so7864848pjq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSd7xHW0v3feamfrhjVTkN6nApBkwLgvxLmLLLtPadE=;
 b=nTrFLI6WYPLCwU+CrpdvrfX0LvHTn+t2U+SbMCIPRJo5YaVA+nZawFfgZKvHpRlOY3
 RgnBWR1zPzroXhIhzFVBSdQa+nvUFuYTz8AVEcCx1FJ8aV5n+Xo7VXrTpX68uVnjJlcx
 zNmeFJTkwyw8PXrmXvP1i/yqs9gk6wj3OdWm3ZAmPkrQ7/dMYUiz8S73V5dXZuzKiz6X
 BjEc+1R7y6DpQeltscfbnMbFZu5TdjND1EdOUNSOTukPGGzQPI9/kMkH1AxlT2chzZ4z
 D2q/ZWBsu7xwEsaXuctpy61YwNnO7qJvhWtzuPmcbmGXtsxDSLv0gUObspK7oSPVt5zG
 1zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YSd7xHW0v3feamfrhjVTkN6nApBkwLgvxLmLLLtPadE=;
 b=SZUv1LiteqttY+3Puh91VEBRlNP/H/6eqMEDhqhb8JIXz9sS01MXV1DH8wNWONP9ts
 LuuKBGwCfYjV6ysQ4FJ6LpqMRCntOUHfee2sgVXHVA0AVaTj8mfnYbUpTKnjfgLRtDlZ
 7mR+Fm+sgm/WhcHRvJZYGnthU2Ok0tnDmIjyKefBZFyXDWgqxhYNc5emMox49x0qlHaT
 jxtHZUrFoMFnkPrijtu7pUFpsTzlgGHh0kUcRPrUbgbRdIuQBotWsxgRv00Sj/CFI/eu
 BKKD2HNBsEC8wpIFqBTxdsqWqpX2AHjsPcb5Kp4j/K8gQo8jV7xiU4ZPYOpNXMhoF/cF
 98Fg==
X-Gm-Message-State: AOAM5303fQw0joa2veLVD3P03Gaom9vTc+o7fMmOEG5jWOcu/mX727sb
 YbDwqcuBTljkDfoBRYjFlYA=
X-Google-Smtp-Source: ABdhPJyG4zlKvfXAs+jLp35G3XHfILwx4P0BEmEJbilD9ajN5lFPfq3fEV2IXuYW8D7wu6wvx+nuIQ==
X-Received: by 2002:a17:902:26f:: with SMTP id
 102mr21561130plc.226.1593608551872; 
 Wed, 01 Jul 2020 06:02:31 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id d9sm6070908pgv.45.2020.07.01.06.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 06:02:31 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 David Dillow <dave@thedillows.org>, Ion Badulescu <ionut@badula.org>,
 Netanel Belgazal <netanel@amazon.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Guy Tzalik <gtzalik@amazon.com>,
 Saeed Bishara <saeedb@amazon.com>, Zorik Machulsky <zorik@amazon.com>,
 Derek Chickles <dchickles@marvell.com>,
 Satanand Burla <sburla@marvell.com>,
 Felix Manlunas <fmanlunas@marvell.com>,
 Denis Kirjanov <kda@linux-powerpc.org>,
 Ajit Khaparde <ajit.khaparde@broadcom.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 Somnath Kotur <somnath.kotur@broadcom.com>,
 Tariq Toukan <tariqt@mellanox.com>, Jon Mason <jdmason@kudzu.us>
Date: Wed,  1 Jul 2020 18:29:31 +0530
Message-Id: <20200701125938.639447-5-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
References: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 04/11] ena_netdev: use generic
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/amazon/ena/ena_netdev.c | 21 ++++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index dda4b8fc9525..92e6d244550c 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -4420,13 +4420,12 @@ static void ena_shutdown(struct pci_dev *pdev)
 	__ena_shutoff(pdev, true);
 }
 
-#ifdef CONFIG_PM
 /* ena_suspend - PM suspend callback
- * @pdev: PCI device information struct
- * @state:power state
+ * @dev_d: Device information struct
  */
-static int ena_suspend(struct pci_dev *pdev,  pm_message_t state)
+static int __maybe_unused ena_suspend(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct ena_adapter *adapter = pci_get_drvdata(pdev);
 
 	u64_stats_update_begin(&adapter->syncp);
@@ -4445,12 +4444,11 @@ static int ena_suspend(struct pci_dev *pdev,  pm_message_t state)
 }
 
 /* ena_resume - PM resume callback
- * @pdev: PCI device information struct
- *
+ * @dev_d: Device information struct
  */
-static int ena_resume(struct pci_dev *pdev)
+static int __maybe_unused ena_resume(struct device *dev_d)
 {
-	struct ena_adapter *adapter = pci_get_drvdata(pdev);
+	struct ena_adapter *adapter = dev_get_drvdata(dev_d);
 	int rc;
 
 	u64_stats_update_begin(&adapter->syncp);
@@ -4462,7 +4460,8 @@ static int ena_resume(struct pci_dev *pdev)
 	rtnl_unlock();
 	return rc;
 }
-#endif
+
+static SIMPLE_DEV_PM_OPS(ena_pm_ops, ena_suspend, ena_resume);
 
 static struct pci_driver ena_pci_driver = {
 	.name		= DRV_MODULE_NAME,
@@ -4470,10 +4469,6 @@ static struct pci_driver ena_pci_driver = {
 	.probe		= ena_probe,
 	.remove		= ena_remove,
 	.shutdown	= ena_shutdown,
-#ifdef CONFIG_PM
-	.suspend    = ena_suspend,
-	.resume     = ena_resume,
-#endif
 	.sriov_configure = pci_sriov_configure_simple,
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
