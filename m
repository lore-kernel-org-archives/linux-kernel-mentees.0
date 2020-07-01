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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2B0C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:03:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2A9620780
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:03:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1McC+uu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2A9620780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D12448BF7B;
	Wed,  1 Jul 2020 13:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o21bJnpzG9dK; Wed,  1 Jul 2020 13:03:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 924FB8BF60;
	Wed,  1 Jul 2020 13:03:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80D63C0865;
	Wed,  1 Jul 2020 13:03:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A949C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EDEB08AAC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bOMI2Q7Fq21f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:03:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 786428AA9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:03:15 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id a14so6411534pfi.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VpvTkVw9gP0gieUNtOeeRSACQ5wHhf9d1RaVLsH798Y=;
 b=k1McC+uu7nj4ISuq9Y20EQZwJHfUrE9VXTBdZ/GgVc/7vJzwXXJ8Fu/bVpJkkmlDWD
 GEUyriGV4Y+cINuWbZwYJznYROCn5vrTBS0nZXCRfQ7OVDxam6CBQYD7mVZkDef/HZ0o
 GA+GstrCzoGxvbKDdTLxeF1/GLEqqMKCPm0dlWpHN+Em1g4/+eDVeGwf1zK5rnx5OQkO
 qIDsJWSdknP6hC+9hk4ihjqRCoSMIEx9Fk9TvGFBBzePSPTlj5Opt8Z/YrVgG0Q7fiwp
 tc3sD+6ats1VYQ2Zfi5hesLbRtN2LCr53SHXZ83EX5UfvhTTr5oLPGpvk+2rFCF8TIOT
 oTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VpvTkVw9gP0gieUNtOeeRSACQ5wHhf9d1RaVLsH798Y=;
 b=i49e+pNFPtRIinFrT282QypNIzIXBzYh4FRl07LepzEYjg+1KU+X7hh2ZrEc5CyA5v
 YKu4o9EJVbeTzQpRyhpPIqSjDCKypvDEciY92EwvNkJW5gkHh9oPtza5PgQFIXF5omJN
 wmFHz+U6p6HHt5FJ8ZQISU9nylRCBoZo+K6hw07Dimg33Mm7LyTQYnxVnx81nxYeoEFT
 buGv01psOAQf5KZbI/sgd/fFEC/2KrFXX7IvTcfCzNIphbWa2mQvDClJg2IcRPeVKFQ3
 p4X9YWMlEb8ciGxP/DEMQ+LBKzGd7e8pDglTFFnT1dzCQ4OWqWqS4zqrDsXnxmWoF77r
 QT0w==
X-Gm-Message-State: AOAM533fygUSXlANoM6Y9MdQiEOPb7DycHYIavPNqf6NuIIl1VHNv6Jy
 W8of/EJKq+PHMNQjwNV/Its=
X-Google-Smtp-Source: ABdhPJz6ZrFOXBR9dREAbWbhMUIj0dzuUBcf/vwaTMzgBpNU+oVONqT9e8UhU+3GNlhKwBJUdkxJog==
X-Received: by 2002:a63:6e4c:: with SMTP id j73mr19273764pgc.182.1593608595035; 
 Wed, 01 Jul 2020 06:03:15 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id d9sm6070908pgv.45.2020.07.01.06.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 06:03:14 -0700 (PDT)
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
Date: Wed,  1 Jul 2020 18:29:36 +0530
Message-Id: <20200701125938.639447-10-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
References: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 09/11] ksz884x: use generic power
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
pci_enable_wake(), pci_save/restore_sate() and
pci_set_power_state().

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/micrel/ksz884x.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/micrel/ksz884x.c
index 4fe6aedca22f..24901342ecc0 100644
--- a/drivers/net/ethernet/micrel/ksz884x.c
+++ b/drivers/net/ethernet/micrel/ksz884x.c
@@ -7155,17 +7155,14 @@ static void pcidev_exit(struct pci_dev *pdev)
 	kfree(info);
 }
 
-#ifdef CONFIG_PM
-static int pcidev_resume(struct pci_dev *pdev)
+static int __maybe_unused pcidev_resume(struct device *dev_d)
 {
 	int i;
-	struct platform_info *info = pci_get_drvdata(pdev);
+	struct platform_info *info = dev_get_drvdata(dev_d);
 	struct dev_info *hw_priv = &info->dev_info;
 	struct ksz_hw *hw = &hw_priv->hw;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	pci_enable_wake(pdev, PCI_D0, 0);
+	device_wakeup_disable(dev_d);
 
 	if (hw_priv->wol_enable)
 		hw_cfg_wol_pme(hw, 0);
@@ -7182,10 +7179,10 @@ static int pcidev_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-static int pcidev_suspend(struct pci_dev *pdev, pm_message_t state)
+static int pcidev_suspend(struct device *dev_d)
 {
 	int i;
-	struct platform_info *info = pci_get_drvdata(pdev);
+	struct platform_info *info = dev_get_drvdata(dev_d);
 	struct dev_info *hw_priv = &info->dev_info;
 	struct ksz_hw *hw = &hw_priv->hw;
 
@@ -7207,12 +7204,9 @@ static int pcidev_suspend(struct pci_dev *pdev, pm_message_t state)
 		hw_cfg_wol_pme(hw, 1);
 	}
 
-	pci_save_state(pdev);
-	pci_enable_wake(pdev, pci_choose_state(pdev, state), 1);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
+	device_wakeup_enable(dev_d);
 	return 0;
 }
-#endif
 
 static char pcidev_name[] = "ksz884xp";
 
@@ -7226,11 +7220,10 @@ static const struct pci_device_id pcidev_table[] = {
 
 MODULE_DEVICE_TABLE(pci, pcidev_table);
 
+static SIMPLE_DEV_PM_OPS(pcidev_pm_ops, pcidev_suspend, pcidev_resume);
+
 static struct pci_driver pci_device_driver = {
-#ifdef CONFIG_PM
-	.suspend	= pcidev_suspend,
-	.resume		= pcidev_resume,
-#endif
+	.driver.pm	= &pcidev_pm_ops,
 	.name		= pcidev_name,
 	.id_table	= pcidev_table,
 	.probe		= pcidev_init,
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
