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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBF1C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 11:40:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A3F22CAF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 11:40:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgFDZByi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9A3F22CAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 747E02050E;
	Mon, 20 Jul 2020 11:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ZzQpzu2x5YI; Mon, 20 Jul 2020 11:40:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2F39320445;
	Mon, 20 Jul 2020 11:40:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FDD9C089F;
	Mon, 20 Jul 2020 11:40:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EFC5C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 11:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6456E85DC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 11:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcSUx6PEJZhi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 11:40:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DFC1785DA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 11:40:01 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id m9so8930414pfh.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 04:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ydUkxccpldgiDYqKvhXSUOUhAioZWR9Lw+8lusKjv0=;
 b=BgFDZByinpOxZ38qajfri4IVASZaQbqNn3xQlgqO5+WLJKENmfGAJScC1n2EgkPMY8
 xa8MsYYh+lFA/8zNAh94CGvxNm3l6YHIbhPY3nQBy/k+BlYvMDctWeXPo//vzivmr5Ni
 5DXWg5LcTlbzGykAIDew2X0P5rmqiVjMsvT0Bs6XBiujPXaKE5aBmP+pDU4iCf7x3HrK
 Q1LikTjRMygbayjDDoRqUQq4glc0fC2VEV3CwFDhhMwpSexqhxuWZx09mgi5a05L4B82
 EVtd6NQZS0BA+Edr5RJdfGdR0/Tg4KPnjgYaar0LBWTYAA1+x8rDNd8wS5MxjzpdQwxi
 Vgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ydUkxccpldgiDYqKvhXSUOUhAioZWR9Lw+8lusKjv0=;
 b=FPBbcqTCrwSs637A7p5Wfkv8RqKo+L1kb9CPX9cJpA3p2CMMp1kIBqxaJCfmWEL3sm
 ZwmsHFne9oH1IN9lQkw5qvDt0XgQjO6o/T5CSHDgn4yi7NOhK/sWzlyUSeB4BkjtXvBj
 e5MXmrk6mGeSib09b2H5e7juPPWUohjP5paC2hT+Xo0LSTcUUIXox51k8t3OKMASYP/o
 /J5jp3WXB4WvUsLO/IFEQPfMUSbCBnARaXeY8v3BNE8Flcp/PRiA2aERirwTWY0F2TeM
 pudL0iCAe0SXBHsgVfIVYW/cdUDibxyk3L0qNkZdjKrye2R/tzbKGmZLCkDvPMUaxeTx
 6oDA==
X-Gm-Message-State: AOAM5325ROuwJWrB4RRA/kxagodeZ0CCGuFRZeAsZr1ACIdjCD3IFC9V
 ck9iFE6+RSAuSlP16x0Iu/g=
X-Google-Smtp-Source: ABdhPJzn4/Nkjxymf/WNDQhYvjrNU7KoFMAW3Hpf2OEMoq7mFr4jtW2Lu4qzp5HEX54aNZfjTp1pzQ==
X-Received: by 2002:a63:b74f:: with SMTP id w15mr7259245pgt.314.1595245201447; 
 Mon, 20 Jul 2020 04:40:01 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id 83sm16680114pfu.60.2020.07.20.04.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 04:40:00 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>
Date: Mon, 20 Jul 2020 17:07:41 +0530
Message-Id: <20200720113740.353479-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dmaengine@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] dmaengine: pch_dma: use generic
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
and pci_set_power_state() to do required operations. In generic mode, they
are no longer needed.

Change function parameter in both .suspend() and .resume() to
"struct device*" type. Use dev_get_drvdata() to get drv data.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/dma/pch_dma.c | 35 +++++++++--------------------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
index a3b0b4c56a19..e93005837e3f 100644
--- a/drivers/dma/pch_dma.c
+++ b/drivers/dma/pch_dma.c
@@ -735,8 +735,7 @@ static irqreturn_t pd_irq(int irq, void *devid)
 	return ret0 | ret2;
 }
 
-#ifdef	CONFIG_PM
-static void pch_dma_save_regs(struct pch_dma *pd)
+static void __maybe_unused pch_dma_save_regs(struct pch_dma *pd)
 {
 	struct pch_dma_chan *pd_chan;
 	struct dma_chan *chan, *_c;
@@ -759,7 +758,7 @@ static void pch_dma_save_regs(struct pch_dma *pd)
 	}
 }
 
-static void pch_dma_restore_regs(struct pch_dma *pd)
+static void __maybe_unused pch_dma_restore_regs(struct pch_dma *pd)
 {
 	struct pch_dma_chan *pd_chan;
 	struct dma_chan *chan, *_c;
@@ -782,40 +781,25 @@ static void pch_dma_restore_regs(struct pch_dma *pd)
 	}
 }
 
-static int pch_dma_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused pch_dma_suspend(struct device *dev)
 {
-	struct pch_dma *pd = pci_get_drvdata(pdev);
+	struct pch_dma *pd = dev_get_drvdata(dev);
 
 	if (pd)
 		pch_dma_save_regs(pd);
 
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
 	return 0;
 }
 
-static int pch_dma_resume(struct pci_dev *pdev)
+static int __maybe_unused pch_dma_resume(struct device *dev)
 {
-	struct pch_dma *pd = pci_get_drvdata(pdev);
-	int err;
-
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-
-	err = pci_enable_device(pdev);
-	if (err) {
-		dev_dbg(&pdev->dev, "failed to enable device\n");
-		return err;
-	}
+	struct pch_dma *pd = dev_get_drvdata(dev);
 
 	if (pd)
 		pch_dma_restore_regs(pd);
 
 	return 0;
 }
-#endif
 
 static int pch_dma_probe(struct pci_dev *pdev,
 				   const struct pci_device_id *id)
@@ -993,15 +977,14 @@ static const struct pci_device_id pch_dma_id_table[] = {
 	{ 0, },
 };
 
+static SIMPLE_DEV_PM_OPS(pch_dma_pm_ops, pch_dma_suspend, pch_dma_resume);
+
 static struct pci_driver pch_dma_driver = {
 	.name		= DRV_NAME,
 	.id_table	= pch_dma_id_table,
 	.probe		= pch_dma_probe,
 	.remove		= pch_dma_remove,
-#ifdef CONFIG_PM
-	.suspend	= pch_dma_suspend,
-	.resume		= pch_dma_resume,
-#endif
+	.driver.pm	= &pch_dma_pm_ops,
 };
 
 module_pci_driver(pch_dma_driver);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
