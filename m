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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0087CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:02:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52F220780
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:02:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8x39Fr5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C52F220780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A03CB8AAC6;
	Wed,  1 Jul 2020 13:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bjo9VXvz8NJs; Wed,  1 Jul 2020 13:02:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2D4C48AA9B;
	Wed,  1 Jul 2020 13:02:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17B45C0865;
	Wed,  1 Jul 2020 13:02:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B153BC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9ECF78AAC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETK4q8py3xkg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 808428AA9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:49 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w2so10885688pgg.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GxBM9njwc9t+8wZt245O1720nVEKK0kOwVAxz9sX+f4=;
 b=E8x39Fr5eOXD+lvhdVdIYJZUjHwCPfPjh9s8afGYaGwdfF9LGGiDosxKMlHtPSdlai
 4vICc1ddM3/RDbNvPeFDuR2Es5u/ozrZDvV/CrIi2DtIhwBOXhh0UWqBAIEj7+7fQO/T
 ToUp2cU7mZnlbR1wbQ7ZTMsY7YmqJRVYAC7Ww0nYwaC6cl4Yxwbvr8Kos4OAEORmTzTO
 GEd4KzeTKDom0SdZU0VMQsB7UsP3Gr2NgUhrWJmDNuseXtHDC6cDKLmtx5/d24SCpIsF
 E7ohljt1W4EGTgxzVW0YhExDcfKEq0/Qr0gFL981Ft1ytvn70HOU+W6O02gxfrL2tMUO
 e8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GxBM9njwc9t+8wZt245O1720nVEKK0kOwVAxz9sX+f4=;
 b=Z13hXDo6cX4zzapSN/yXWMiKyN0jRzGGgwD+YuKWITUoBM6dmBoO28MvIds0yOwsae
 C1JQLXKM2PWk3vYxII6Gnmrs/IJlsDP22AhGcD18mCMq2fTXkP/8BSTE6ZE1VJ9SjVVA
 yf5Wwqu45pLCwgDD/G/Y4TEwTJuQWlx4bR9ej1XEhjHQOTohjK9WteF/7VFTUPUNnwrf
 c+ocymstx8bIMcJ16kYEotRKzcsKHn2c+6DFE4AjooQgj8NFwjdnFmlMw7K7iqDYfIiM
 oZBRX1IFLpSXeiHSkaf0ch3jb5D56Ys2uME9qlfhx/SBtRrzc6iTQYv9slUagWsA6B8s
 SaNg==
X-Gm-Message-State: AOAM533H4w6XnWU+tgTn+9SdvD1kaw8CcbnHthK1yRe/XIr8TFcWtNu/
 RLSKLDPWUp9GmmDJ8DS5kZo=
X-Google-Smtp-Source: ABdhPJxcjJk8LSveiZ5+SpT0XFa0GpHtb6e9ktduqAI563qQExBRxsecPBKk59ONk3hjy9yEw04fQQ==
X-Received: by 2002:aa7:8f08:: with SMTP id x8mr8291854pfr.41.1593608568921;
 Wed, 01 Jul 2020 06:02:48 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id d9sm6070908pgv.45.2020.07.01.06.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 06:02:48 -0700 (PDT)
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
Date: Wed,  1 Jul 2020 18:29:33 +0530
Message-Id: <20200701125938.639447-7-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
References: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 06/11] sundance: use generic power
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

Thus, there is no need to call the PCI helper functions like
pci_enable/disable_device(), pci_save/restore_sate() and
pci_set_power_state().

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/dlink/sundance.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/dlink/sundance.c b/drivers/net/ethernet/dlink/sundance.c
index dc566fcc3ba9..ca97e321082d 100644
--- a/drivers/net/ethernet/dlink/sundance.c
+++ b/drivers/net/ethernet/dlink/sundance.c
@@ -1928,11 +1928,9 @@ static void sundance_remove1(struct pci_dev *pdev)
 	}
 }
 
-#ifdef CONFIG_PM
-
-static int sundance_suspend(struct pci_dev *pci_dev, pm_message_t state)
+static int __maybe_unused sundance_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pci_dev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct netdev_private *np = netdev_priv(dev);
 	void __iomem *ioaddr = np->base;
 
@@ -1942,30 +1940,24 @@ static int sundance_suspend(struct pci_dev *pci_dev, pm_message_t state)
 	netdev_close(dev);
 	netif_device_detach(dev);
 
-	pci_save_state(pci_dev);
 	if (np->wol_enabled) {
 		iowrite8(AcceptBroadcast | AcceptMyPhys, ioaddr + RxMode);
 		iowrite16(RxEnable, ioaddr + MACCtrl1);
 	}
-	pci_enable_wake(pci_dev, pci_choose_state(pci_dev, state),
-			np->wol_enabled);
-	pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
+
+	device_set_wakeup_enable(dev_d, np->wol_enabled);
 
 	return 0;
 }
 
-static int sundance_resume(struct pci_dev *pci_dev)
+static int __maybe_unused sundance_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pci_dev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	int err = 0;
 
 	if (!netif_running(dev))
 		return 0;
 
-	pci_set_power_state(pci_dev, PCI_D0);
-	pci_restore_state(pci_dev);
-	pci_enable_wake(pci_dev, PCI_D0, 0);
-
 	err = netdev_open(dev);
 	if (err) {
 		printk(KERN_ERR "%s: Can't resume interface!\n",
@@ -1979,17 +1971,14 @@ static int sundance_resume(struct pci_dev *pci_dev)
 	return err;
 }
 
-#endif /* CONFIG_PM */
+static SIMPLE_DEV_PM_OPS(sundance_pm_ops, sundance_suspend, sundance_resume);
 
 static struct pci_driver sundance_driver = {
 	.name		= DRV_NAME,
 	.id_table	= sundance_pci_tbl,
 	.probe		= sundance_probe1,
 	.remove		= sundance_remove1,
-#ifdef CONFIG_PM
-	.suspend	= sundance_suspend,
-	.resume		= sundance_resume,
-#endif /* CONFIG_PM */
+	.driver.pm	= &sundance_pm_ops,
 };
 
 static int __init sundance_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
