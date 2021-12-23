Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49FFC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Dec 2021 01:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76489405DE;
	Thu, 23 Dec 2021 01:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nH0erslRzjRJ; Thu, 23 Dec 2021 01:11:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 36BE44062D;
	Thu, 23 Dec 2021 01:11:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1544DC001E;
	Thu, 23 Dec 2021 01:11:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92987C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70561405DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f90WkDzJYyzy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 136DF405F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DC692CE1F0D;
 Thu, 23 Dec 2021 01:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7BEC36AEA;
 Thu, 23 Dec 2021 01:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640221908;
 bh=nS4jZXintt2/E8Abk/nP0Fk/9b5PD0tHeYSlLq6cHOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MUvff4NOpoMHiKn9owcavbgXndI9pASWDCl9B285UyXHqdoSbo6qPW4Z9MsyvTiDQ
 bd9kL/nfDFHosHieTg58wCePz9FGJLioHc7HEq2GWSAH8fYV51dTu7hottYqZwN8KT
 R/kzDUomx0ZPFiYpYN7Gl4tKrYbcGYnwMU8YbkN9usgJVgXzDvC6SpGEfkQMtzfQJJ
 okMa7epMeY2E3jrtkKcQkZyCPwEBhu4/GK3S5Xcbvv420dz90ctsy6rM0s8D5cp8SQ
 PHWM6+wGzZXKdBzA37/t+AGbsI/qYA/1h96nSJRP/pl/kwrcoS2DD4Ed9m43/9RkJW
 v3c7WSEl6j2CA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org,
	Fan Fei <ffclaire1224@gmail.com>
Subject: [PATCH v2 21/23] PCI: xgene: Rename xgene_pcie_port to xgene_pcie
Date: Wed, 22 Dec 2021 19:10:52 -0600
Message-Id: <20211223011054.1227810-22-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223011054.1227810-1-helgaas@kernel.org>
References: <20211223011054.1227810-1-helgaas@kernel.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Toan Le <toan@os.amperecomputing.com>,
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

From: Fan Fei <ffclaire1224@gmail.com>

Rename struct xgene_pcie_port to xgene_pcie to match the convention of
<driver>_pcie. No functional change intended.

Signed-off-by: Fan Fei <ffclaire1224@gmail.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Toan Le <toan@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pci/controller/pci-xgene.c | 46 +++++++++++++++---------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index 56d0d50338c8..ba11f369a1c9 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -60,7 +60,7 @@
 #define XGENE_PCIE_IP_VER_2		2
 
 #if defined(CONFIG_PCI_XGENE) || (defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS))
-struct xgene_pcie_port {
+struct xgene_pcie {
 	struct device_node	*node;
 	struct device		*dev;
 	struct clk		*clk;
@@ -71,12 +71,12 @@ struct xgene_pcie_port {
 	u32			version;
 };
 
-static u32 xgene_pcie_readl(struct xgene_pcie_port *port, u32 reg)
+static u32 xgene_pcie_readl(struct xgene_pcie *port, u32 reg)
 {
 	return readl(port->csr_base + reg);
 }
 
-static void xgene_pcie_writel(struct xgene_pcie_port *port, u32 reg, u32 val)
+static void xgene_pcie_writel(struct xgene_pcie *port, u32 reg, u32 val)
 {
 	writel(val, port->csr_base + reg);
 }
@@ -86,15 +86,15 @@ static inline u32 pcie_bar_low_val(u32 addr, u32 flags)
 	return (addr & PCI_BASE_ADDRESS_MEM_MASK) | flags;
 }
 
-static inline struct xgene_pcie_port *pcie_bus_to_port(struct pci_bus *bus)
+static inline struct xgene_pcie *pcie_bus_to_port(struct pci_bus *bus)
 {
 	struct pci_config_window *cfg;
 
 	if (acpi_disabled)
-		return (struct xgene_pcie_port *)(bus->sysdata);
+		return (struct xgene_pcie *)(bus->sysdata);
 
 	cfg = bus->sysdata;
-	return (struct xgene_pcie_port *)(cfg->priv);
+	return (struct xgene_pcie *)(cfg->priv);
 }
 
 /*
@@ -103,7 +103,7 @@ static inline struct xgene_pcie_port *pcie_bus_to_port(struct pci_bus *bus)
  */
 static void __iomem *xgene_pcie_get_cfg_base(struct pci_bus *bus)
 {
-	struct xgene_pcie_port *port = pcie_bus_to_port(bus);
+	struct xgene_pcie *port = pcie_bus_to_port(bus);
 
 	if (bus->number >= (bus->primary + 1))
 		return port->cfg_base + AXI_EP_CFG_ACCESS;
@@ -117,7 +117,7 @@ static void __iomem *xgene_pcie_get_cfg_base(struct pci_bus *bus)
  */
 static void xgene_pcie_set_rtdid_reg(struct pci_bus *bus, uint devfn)
 {
-	struct xgene_pcie_port *port = pcie_bus_to_port(bus);
+	struct xgene_pcie *port = pcie_bus_to_port(bus);
 	unsigned int b, d, f;
 	u32 rtdid_val = 0;
 
@@ -164,7 +164,7 @@ static void __iomem *xgene_pcie_map_bus(struct pci_bus *bus, unsigned int devfn,
 static int xgene_pcie_config_read32(struct pci_bus *bus, unsigned int devfn,
 				    int where, int size, u32 *val)
 {
-	struct xgene_pcie_port *port = pcie_bus_to_port(bus);
+	struct xgene_pcie *port = pcie_bus_to_port(bus);
 
 	if (pci_generic_config_read32(bus, devfn, where & ~0x3, 4, val) !=
 	    PCIBIOS_SUCCESSFUL)
@@ -227,7 +227,7 @@ static int xgene_pcie_ecam_init(struct pci_config_window *cfg, u32 ipversion)
 {
 	struct device *dev = cfg->parent;
 	struct acpi_device *adev = to_acpi_device(dev);
-	struct xgene_pcie_port *port;
+	struct xgene_pcie *port;
 	struct resource csr;
 	int ret;
 
@@ -281,7 +281,7 @@ const struct pci_ecam_ops xgene_v2_pcie_ecam_ops = {
 #endif
 
 #if defined(CONFIG_PCI_XGENE)
-static u64 xgene_pcie_set_ib_mask(struct xgene_pcie_port *port, u32 addr,
+static u64 xgene_pcie_set_ib_mask(struct xgene_pcie *port, u32 addr,
 				  u32 flags, u64 size)
 {
 	u64 mask = (~(size - 1) & PCI_BASE_ADDRESS_MEM_MASK) | flags;
@@ -307,7 +307,7 @@ static u64 xgene_pcie_set_ib_mask(struct xgene_pcie_port *port, u32 addr,
 	return mask;
 }
 
-static void xgene_pcie_linkup(struct xgene_pcie_port *port,
+static void xgene_pcie_linkup(struct xgene_pcie *port,
 			      u32 *lanes, u32 *speed)
 {
 	u32 val32;
@@ -322,7 +322,7 @@ static void xgene_pcie_linkup(struct xgene_pcie_port *port,
 	}
 }
 
-static int xgene_pcie_init_port(struct xgene_pcie_port *port)
+static int xgene_pcie_init_port(struct xgene_pcie *port)
 {
 	struct device *dev = port->dev;
 	int rc;
@@ -342,7 +342,7 @@ static int xgene_pcie_init_port(struct xgene_pcie_port *port)
 	return 0;
 }
 
-static int xgene_pcie_map_reg(struct xgene_pcie_port *port,
+static int xgene_pcie_map_reg(struct xgene_pcie *port,
 			      struct platform_device *pdev)
 {
 	struct device *dev = port->dev;
@@ -362,7 +362,7 @@ static int xgene_pcie_map_reg(struct xgene_pcie_port *port,
 	return 0;
 }
 
-static void xgene_pcie_setup_ob_reg(struct xgene_pcie_port *port,
+static void xgene_pcie_setup_ob_reg(struct xgene_pcie *port,
 				    struct resource *res, u32 offset,
 				    u64 cpu_addr, u64 pci_addr)
 {
@@ -394,7 +394,7 @@ static void xgene_pcie_setup_ob_reg(struct xgene_pcie_port *port,
 	xgene_pcie_writel(port, offset + 0x14, upper_32_bits(pci_addr));
 }
 
-static void xgene_pcie_setup_cfg_reg(struct xgene_pcie_port *port)
+static void xgene_pcie_setup_cfg_reg(struct xgene_pcie *port)
 {
 	u64 addr = port->cfg_addr;
 
@@ -403,7 +403,7 @@ static void xgene_pcie_setup_cfg_reg(struct xgene_pcie_port *port)
 	xgene_pcie_writel(port, CFGCTL, EN_REG);
 }
 
-static int xgene_pcie_map_ranges(struct xgene_pcie_port *port)
+static int xgene_pcie_map_ranges(struct xgene_pcie *port)
 {
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(port);
 	struct resource_entry *window;
@@ -444,7 +444,7 @@ static int xgene_pcie_map_ranges(struct xgene_pcie_port *port)
 	return 0;
 }
 
-static void xgene_pcie_setup_pims(struct xgene_pcie_port *port, u32 pim_reg,
+static void xgene_pcie_setup_pims(struct xgene_pcie *port, u32 pim_reg,
 				  u64 pim, u64 size)
 {
 	xgene_pcie_writel(port, pim_reg, lower_32_bits(pim));
@@ -478,7 +478,7 @@ static int xgene_pcie_select_ib_reg(u8 *ib_reg_mask, u64 size)
 	return -EINVAL;
 }
 
-static void xgene_pcie_setup_ib_reg(struct xgene_pcie_port *port,
+static void xgene_pcie_setup_ib_reg(struct xgene_pcie *port,
 				    struct resource_entry *entry,
 				    u8 *ib_reg_mask)
 {
@@ -529,7 +529,7 @@ static void xgene_pcie_setup_ib_reg(struct xgene_pcie_port *port,
 	xgene_pcie_setup_pims(port, pim_reg, pci_addr, ~(size - 1));
 }
 
-static int xgene_pcie_parse_map_dma_ranges(struct xgene_pcie_port *port)
+static int xgene_pcie_parse_map_dma_ranges(struct xgene_pcie *port)
 {
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(port);
 	struct resource_entry *entry;
@@ -542,7 +542,7 @@ static int xgene_pcie_parse_map_dma_ranges(struct xgene_pcie_port *port)
 }
 
 /* clear BAR configuration which was done by firmware */
-static void xgene_pcie_clear_config(struct xgene_pcie_port *port)
+static void xgene_pcie_clear_config(struct xgene_pcie *port)
 {
 	int i;
 
@@ -550,7 +550,7 @@ static void xgene_pcie_clear_config(struct xgene_pcie_port *port)
 		xgene_pcie_writel(port, i, 0);
 }
 
-static int xgene_pcie_setup(struct xgene_pcie_port *port)
+static int xgene_pcie_setup(struct xgene_pcie *port)
 {
 	struct device *dev = port->dev;
 	u32 val, lanes = 0, speed = 0;
@@ -588,7 +588,7 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *dn = dev->of_node;
-	struct xgene_pcie_port *port;
+	struct xgene_pcie *port;
 	struct pci_host_bridge *bridge;
 	int ret;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
