Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749FAC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Dec 2021 01:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41BE4817AC;
	Thu, 23 Dec 2021 01:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzofE8-V1K0i; Thu, 23 Dec 2021 01:11:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4DFE781421;
	Thu, 23 Dec 2021 01:11:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15CA5C0071;
	Thu, 23 Dec 2021 01:11:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 238B0C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F72D405DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xd7j_EV-98WX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07907405DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6002A61C1E;
 Thu, 23 Dec 2021 01:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB67C36AE8;
 Thu, 23 Dec 2021 01:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640221900;
 bh=JEMd6rbvAJo5/E0VVbBCtxpY1OwkDouz6ExYkZiuVQU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hW0hvav0Nme8bJkjVlYbJCp4QsLxXxZtPVZphM7W3oFDqz+0Dwc7l6amya0PB4RNc
 9hdMc9o3yDOCsEzZtWGM04BvH+GbSb1qS/dxZNFDYS/3SAIyfSPsY4jTq/9+KDq9ys
 lMG3FQwHF8i8YXznN9YQT7zJSjctduMwkNpRpbytk2IkJFk5qkcI38p2xxfMEyT7er
 owdv/I6d6/oReZn5tuXFKN4xP4GUzQ20V3QRO6CmhP9TIINcey+ZwuZJQPkt3Gm3cV
 g8R8kAHaMKKOz0R0/1H7iMiwdMSImmzIcU1ymEdE0QxsCiRIC7FqTjuF8tqPI736XI
 dHGJ2KzX33Byg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org,
	Fan Fei <ffclaire1224@gmail.com>
Subject: [PATCH v2 17/23] PCI: mt7621: Rename mt7621_pci_ to mt7621_pcie_
Date: Wed, 22 Dec 2021 19:10:48 -0600
Message-Id: <20211223011054.1227810-18-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223011054.1227810-1-helgaas@kernel.org>
References: <20211223011054.1227810-1-helgaas@kernel.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-kernel@vger.kernel.org,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org,
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

Rename mt7621_pci_* structs and functions to mt7621_pcie_* for consistency
with the rest of the file.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/pci/controller/pcie-mt7621.c | 36 ++++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
index 4138c0e83513..b8fea7afdb1b 100644
--- a/drivers/pci/controller/pcie-mt7621.c
+++ b/drivers/pci/controller/pcie-mt7621.c
@@ -93,8 +93,8 @@ struct mt7621_pcie_port {
  * reset lines are inverted.
  */
 struct mt7621_pcie {
-	void __iomem *base;
 	struct device *dev;
+	void __iomem *base;
 	struct list_head ports;
 	bool resets_inverted;
 };
@@ -129,7 +129,7 @@ static inline void pcie_port_write(struct mt7621_pcie_port *port,
 	writel_relaxed(val, port->base + reg);
 }
 
-static inline u32 mt7621_pci_get_cfgaddr(unsigned int bus, unsigned int slot,
+static inline u32 mt7621_pcie_get_cfgaddr(unsigned int bus, unsigned int slot,
 					 unsigned int func, unsigned int where)
 {
 	return (((where & 0xf00) >> 8) << 24) | (bus << 16) | (slot << 11) |
@@ -140,7 +140,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
 					 unsigned int devfn, int where)
 {
 	struct mt7621_pcie *pcie = bus->sysdata;
-	u32 address = mt7621_pci_get_cfgaddr(bus->number, PCI_SLOT(devfn),
+	u32 address = mt7621_pcie_get_cfgaddr(bus->number, PCI_SLOT(devfn),
 					     PCI_FUNC(devfn), where);
 
 	writel_relaxed(address, pcie->base + RALINK_PCI_CONFIG_ADDR);
@@ -148,7 +148,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
 	return pcie->base + RALINK_PCI_CONFIG_DATA + (where & 3);
 }
 
-static struct pci_ops mt7621_pci_ops = {
+static struct pci_ops mt7621_pcie_ops = {
 	.map_bus	= mt7621_pcie_map_bus,
 	.read		= pci_generic_config_read,
 	.write		= pci_generic_config_write,
@@ -156,7 +156,7 @@ static struct pci_ops mt7621_pci_ops = {
 
 static u32 read_config(struct mt7621_pcie *pcie, unsigned int dev, u32 reg)
 {
-	u32 address = mt7621_pci_get_cfgaddr(0, dev, 0, reg);
+	u32 address = mt7621_pcie_get_cfgaddr(0, dev, 0, reg);
 
 	pcie_write(pcie, address, RALINK_PCI_CONFIG_ADDR);
 	return pcie_read(pcie, RALINK_PCI_CONFIG_DATA);
@@ -165,7 +165,7 @@ static u32 read_config(struct mt7621_pcie *pcie, unsigned int dev, u32 reg)
 static void write_config(struct mt7621_pcie *pcie, unsigned int dev,
 			 u32 reg, u32 val)
 {
-	u32 address = mt7621_pci_get_cfgaddr(0, dev, 0, reg);
+	u32 address = mt7621_pcie_get_cfgaddr(0, dev, 0, reg);
 
 	pcie_write(pcie, address, RALINK_PCI_CONFIG_ADDR);
 	pcie_write(pcie, val, RALINK_PCI_CONFIG_DATA);
@@ -505,16 +505,16 @@ static int mt7621_pcie_register_host(struct pci_host_bridge *host)
 {
 	struct mt7621_pcie *pcie = pci_host_bridge_priv(host);
 
-	host->ops = &mt7621_pci_ops;
+	host->ops = &mt7621_pcie_ops;
 	host->sysdata = pcie;
 	return pci_host_probe(host);
 }
 
-static const struct soc_device_attribute mt7621_pci_quirks_match[] = {
+static const struct soc_device_attribute mt7621_pcie_quirks_match[] = {
 	{ .soc_id = "mt7621", .revision = "E2" }
 };
 
-static int mt7621_pci_probe(struct platform_device *pdev)
+static int mt7621_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct soc_device_attribute *attr;
@@ -535,7 +535,7 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pcie);
 	INIT_LIST_HEAD(&pcie->ports);
 
-	attr = soc_device_match(mt7621_pci_quirks_match);
+	attr = soc_device_match(mt7621_pcie_quirks_match);
 	if (attr)
 		pcie->resets_inverted = true;
 
@@ -572,7 +572,7 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int mt7621_pci_remove(struct platform_device *pdev)
+static int mt7621_pcie_remove(struct platform_device *pdev)
 {
 	struct mt7621_pcie *pcie = platform_get_drvdata(pdev);
 	struct mt7621_pcie_port *port;
@@ -583,18 +583,18 @@ static int mt7621_pci_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id mt7621_pci_ids[] = {
+static const struct of_device_id mt7621_pcie_ids[] = {
 	{ .compatible = "mediatek,mt7621-pci" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, mt7621_pci_ids);
+MODULE_DEVICE_TABLE(of, mt7621_pcie_ids);
 
-static struct platform_driver mt7621_pci_driver = {
-	.probe = mt7621_pci_probe,
-	.remove = mt7621_pci_remove,
+static struct platform_driver mt7621_pcie_driver = {
+	.probe = mt7621_pcie_probe,
+	.remove = mt7621_pcie_remove,
 	.driver = {
 		.name = "mt7621-pci",
-		.of_match_table = of_match_ptr(mt7621_pci_ids),
+		.of_match_table = of_match_ptr(mt7621_pcie_ids),
 	},
 };
-builtin_platform_driver(mt7621_pci_driver);
+builtin_platform_driver(mt7621_pcie_driver);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
