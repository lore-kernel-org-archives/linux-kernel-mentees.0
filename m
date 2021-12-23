Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EFAC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Dec 2021 01:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B8AF405C5;
	Thu, 23 Dec 2021 01:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbYL9GZLH0ym; Thu, 23 Dec 2021 01:11:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1A07D404A9;
	Thu, 23 Dec 2021 01:11:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05C51C001E;
	Thu, 23 Dec 2021 01:11:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CF3BC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C40B409D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UoY4otATfGf2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AB6F40936
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E3E82CE1F10;
 Thu, 23 Dec 2021 01:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3E5C36AE5;
 Thu, 23 Dec 2021 01:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640221886;
 bh=eL22WxVnfWizuXg7JF9XO7PuirwfJH3BG09wKmU3gYY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a6qmGpQ4Z1R+PC0Nzb8OWW8lQu0oF3N4cwXUFNu7vSaIhDnM9fn1gP8qjuhc+D2t/
 yQ9S/d/ARscwNN0t3flXrGyZkiPVwLgeD4WySM4ATxlynnMu/Vr1uP1UA8RPdCavhq
 JmehnTuzMWUdsVMOL9W7cgt2QN+O5SUX6DKB+gD9XRiMiPNRc+H5g4AR4gI0EZNd/A
 am3gghZL2ewa8t18U0MfNNyBjxEPI911dUFapSpb6aV3mrkECqVOsuxP5nw26pX2zI
 MmjMbKG41wu9nEz3C8IuBAwHGojkd9uC6h540FZ7l+pnEAiG2EYuWrgJhVf+VtSxbB
 VAg2rSU6WkJ+g==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org,
	Fan Fei <ffclaire1224@gmail.com>
Subject: [PATCH v2 09/23] PCI: j721e: Drop redundant struct device *
Date: Wed, 22 Dec 2021 19:10:40 -0600
Message-Id: <20211223011054.1227810-10-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223011054.1227810-1-helgaas@kernel.org>
References: <20211223011054.1227810-1-helgaas@kernel.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Tom Joseph <tjoseph@cadence.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org,
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

The struct cdns_pcie already contains the struct device for the j721e PCIe
controller.  There's no need to store another copy in struct j721e_pcie.
Remove the redundant copy from struct j721e_pcie.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tom Joseph <tjoseph@cadence.com>
Cc: linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pci/controller/cadence/pci-j721e.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index cd43d1898482..489586a4cdc7 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -51,11 +51,10 @@ enum link_status {
 #define MAX_LANES			2
 
 struct j721e_pcie {
-	struct device		*dev;
+	struct cdns_pcie	*cdns_pcie;
 	struct clk		*refclk;
 	u32			mode;
 	u32			num_lanes;
-	struct cdns_pcie	*cdns_pcie;
 	void __iomem		*user_cfg_base;
 	void __iomem		*intd_cfg_base;
 	u32			linkdown_irq_regfield;
@@ -99,7 +98,7 @@ static inline void j721e_pcie_intd_writel(struct j721e_pcie *pcie, u32 offset,
 static irqreturn_t j721e_pcie_link_irq_handler(int irq, void *priv)
 {
 	struct j721e_pcie *pcie = priv;
-	struct device *dev = pcie->dev;
+	struct device *dev = pcie->cdns_pcie->dev;
 	u32 reg;
 
 	reg = j721e_pcie_intd_readl(pcie, STATUS_REG_SYS_2);
@@ -165,7 +164,7 @@ static const struct cdns_pcie_ops j721e_pcie_ops = {
 static int j721e_pcie_set_mode(struct j721e_pcie *pcie, struct regmap *syscon,
 			       unsigned int offset)
 {
-	struct device *dev = pcie->dev;
+	struct device *dev = pcie->cdns_pcie->dev;
 	u32 mask = J721E_MODE_RC;
 	u32 mode = pcie->mode;
 	u32 val = 0;
@@ -184,7 +183,7 @@ static int j721e_pcie_set_mode(struct j721e_pcie *pcie, struct regmap *syscon,
 static int j721e_pcie_set_link_speed(struct j721e_pcie *pcie,
 				     struct regmap *syscon, unsigned int offset)
 {
-	struct device *dev = pcie->dev;
+	struct device *dev = pcie->cdns_pcie->dev;
 	struct device_node *np = dev->of_node;
 	int link_speed;
 	u32 val = 0;
@@ -205,7 +204,7 @@ static int j721e_pcie_set_link_speed(struct j721e_pcie *pcie,
 static int j721e_pcie_set_lane_count(struct j721e_pcie *pcie,
 				     struct regmap *syscon, unsigned int offset)
 {
-	struct device *dev = pcie->dev;
+	struct device *dev = pcie->cdns_pcie->dev;
 	u32 lanes = pcie->num_lanes;
 	u32 val = 0;
 	int ret;
@@ -220,7 +219,7 @@ static int j721e_pcie_set_lane_count(struct j721e_pcie *pcie,
 
 static int j721e_pcie_ctrl_init(struct j721e_pcie *pcie)
 {
-	struct device *dev = pcie->dev;
+	struct device *dev = pcie->cdns_pcie->dev;
 	struct device_node *node = dev->of_node;
 	struct of_phandle_args args;
 	unsigned int offset = 0;
@@ -377,7 +376,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	if (!pcie)
 		return -ENOMEM;
 
-	pcie->dev = dev;
 	pcie->mode = mode;
 	pcie->linkdown_irq_regfield = data->linkdown_irq_regfield;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
