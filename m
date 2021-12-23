Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AE1C43217
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Dec 2021 01:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D7D410CF;
	Thu, 23 Dec 2021 01:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnMJ8fFkqHPu; Thu, 23 Dec 2021 01:11:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8FA9D410AA;
	Thu, 23 Dec 2021 01:11:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6DA20C001E;
	Thu, 23 Dec 2021 01:11:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8402C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A800E410B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lC-OHk6qi1O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABF9B409D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 36401CE1F19;
 Thu, 23 Dec 2021 01:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7077C36AE5;
 Thu, 23 Dec 2021 01:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640221890;
 bh=y3pxRiX+qtgtCOGnhVvNZl0hOJWzWrcEKk0/Nd0XPes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mSJxMrBnD05miAkVZqHAOo3r5V+Has0Fw5v5bB8h4TLDi182/0nzK989zg+rpidjy
 3jbny0Ta/y/7bRXdrDeHzLw4WI6BWhdfTvdjKOoUL7wBYJGH2UC4teVAiwTSf8xVxu
 tvJp8rSYPXxbJHdz6sSh44A4+2h/f+vzApWTT8rDElcElzYyxxg6AGxfAjWcK7OlHa
 aJPwKFduLkEETH/rpffSVVMiBj6dbw2wyyHLhg7Yh9yS8TUYhkIyI3DLx8jSfZEjRH
 AebagG5gTVBvX2pKzjOWVMavmC1iGfqxAQN/NKi2tzmyMqY5pua6689Rf7JTBEdEO6
 cld1P7lFwwamQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org,
	Fan Fei <ffclaire1224@gmail.com>
Subject: [PATCH v2 11/23] PCI: iproc: Rename iproc_pcie_bcma_ to
 iproc_bcma_pcie_
Date: Wed, 22 Dec 2021 19:10:42 -0600
Message-Id: <20211223011054.1227810-12-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223011054.1227810-1-helgaas@kernel.org>
References: <20211223011054.1227810-1-helgaas@kernel.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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

From: Bjorn Helgaas <bhelgaas@google.com>

Rename iproc_pcie_bcma_* to iproc_bcma_pcie_* for consistency with other
drivers.  No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pci/controller/pcie-iproc-bcma.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc-bcma.c b/drivers/pci/controller/pcie-iproc-bcma.c
index f918c713afb0..54b6e6d5bc64 100644
--- a/drivers/pci/controller/pcie-iproc-bcma.c
+++ b/drivers/pci/controller/pcie-iproc-bcma.c
@@ -23,7 +23,7 @@ static void bcma_pcie2_fixup_class(struct pci_dev *dev)
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_BROADCOM, 0x8011, bcma_pcie2_fixup_class);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_BROADCOM, 0x8012, bcma_pcie2_fixup_class);
 
-static int iproc_pcie_bcma_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
+static int iproc_bcma_pcie_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 {
 	struct iproc_pcie *pcie = dev->sysdata;
 	struct bcma_device *bdev = container_of(pcie->dev, struct bcma_device, dev);
@@ -31,7 +31,7 @@ static int iproc_pcie_bcma_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 	return bcma_core_irq(bdev, 5);
 }
 
-static int iproc_pcie_bcma_probe(struct bcma_device *bdev)
+static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
 {
 	struct device *dev = &bdev->dev;
 	struct iproc_pcie *pcie;
@@ -64,33 +64,33 @@ static int iproc_pcie_bcma_probe(struct bcma_device *bdev)
 	if (ret)
 		return ret;
 
-	pcie->map_irq = iproc_pcie_bcma_map_irq;
+	pcie->map_irq = iproc_bcma_pcie_map_irq;
 
 	bcma_set_drvdata(bdev, pcie);
 
 	return iproc_pcie_setup(pcie, &bridge->windows);
 }
 
-static void iproc_pcie_bcma_remove(struct bcma_device *bdev)
+static void iproc_bcma_pcie_remove(struct bcma_device *bdev)
 {
 	struct iproc_pcie *pcie = bcma_get_drvdata(bdev);
 
 	iproc_pcie_remove(pcie);
 }
 
-static const struct bcma_device_id iproc_pcie_bcma_table[] = {
+static const struct bcma_device_id iproc_bcma_pcie_table[] = {
 	BCMA_CORE(BCMA_MANUF_BCM, BCMA_CORE_NS_PCIEG2, BCMA_ANY_REV, BCMA_ANY_CLASS),
 	{},
 };
-MODULE_DEVICE_TABLE(bcma, iproc_pcie_bcma_table);
+MODULE_DEVICE_TABLE(bcma, iproc_bcma_pcie_table);
 
-static struct bcma_driver iproc_pcie_bcma_driver = {
+static struct bcma_driver iproc_bcma_pcie_driver = {
 	.name		= KBUILD_MODNAME,
-	.id_table	= iproc_pcie_bcma_table,
-	.probe		= iproc_pcie_bcma_probe,
-	.remove		= iproc_pcie_bcma_remove,
+	.id_table	= iproc_bcma_pcie_table,
+	.probe		= iproc_bcma_pcie_probe,
+	.remove		= iproc_bcma_pcie_remove,
 };
-module_bcma_driver(iproc_pcie_bcma_driver);
+module_bcma_driver(iproc_bcma_pcie_driver);
 
 MODULE_AUTHOR("Hauke Mehrtens");
 MODULE_DESCRIPTION("Broadcom iProc PCIe BCMA driver");
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
