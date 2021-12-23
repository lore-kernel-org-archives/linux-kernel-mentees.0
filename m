Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B4EC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Dec 2021 01:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A28F5409C0;
	Thu, 23 Dec 2021 01:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVP-y5QNxLQJ; Thu, 23 Dec 2021 01:11:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C568F40936;
	Thu, 23 Dec 2021 01:11:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3D5AC001E;
	Thu, 23 Dec 2021 01:11:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD964C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CB3C60AC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A52Yb_dbUxRj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DD7260AE8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC17761D96;
 Thu, 23 Dec 2021 01:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF44C36AEE;
 Thu, 23 Dec 2021 01:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640221882;
 bh=QDle4GEHP+VzIlHo0RChYIQ/WFmjI4YP/x4ESfOQkZo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QpIe8nj+BHPIEcjhMuUSuo6A8TsW92oTiKFaqdg/AzCCbockFTElcFQfG6Sb2eMYk
 4cqyiM+rMqFQ9JsAYIA240RQlVCq+vX1dTp/llDt7FNVubDTaJQi5En7KSqSiMIXng
 7A8xA4Gn2u2U2GwO5vCRjs1JURLMteFoLhTzjkRUsEenFp2o7RK2+78CA3Rgx8IJHE
 JAD0+9GToxQbWszsRZvbbjPW836ltgwMzcnP1LCFdYSozJZbn7svtJt4eKH5VcaB/I
 7hrdmU9yY0nRTYfBGGReyyaI+42+rjVJJKoPqkAg7gdUZegD4NVQR2xk6EQIATxcYy
 cFt0qrk/fsTEw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org,
	Fan Fei <ffclaire1224@gmail.com>
Subject: [PATCH v2 07/23] PCI: kirin: Prefer of_device_get_match_data()
Date: Wed, 22 Dec 2021 19:10:38 -0600
Message-Id: <20211223011054.1227810-8-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223011054.1227810-1-helgaas@kernel.org>
References: <20211223011054.1227810-1-helgaas@kernel.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

The kirin driver only needs the device data, not the whole struct
of_device_id.  Use of_device_get_match_data() instead of of_match_device().
No functional change intended.

[bhelgaas: commit log]
Signed-off-by: Fan Fei <ffclaire1224@gmail.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
---
 drivers/pci/controller/dwc/pcie-kirin.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 095afbccf9c1..8d6e241bd171 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -773,7 +773,6 @@ static const struct of_device_id kirin_pcie_match[] = {
 static int kirin_pcie_probe(struct platform_device *pdev)
 {
 	enum pcie_kirin_phy_type phy_type;
-	const struct of_device_id *of_id;
 	struct device *dev = &pdev->dev;
 	struct kirin_pcie *kirin_pcie;
 	struct dw_pcie *pci;
@@ -784,13 +783,12 @@ static int kirin_pcie_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	of_id = of_match_device(kirin_pcie_match, dev);
-	if (!of_id) {
+	phy_type = (long)of_device_get_match_data(dev);
+	if (!phy_type) {
 		dev_err(dev, "OF data missing\n");
 		return -EINVAL;
 	}
 
-	phy_type = (long)of_id->data;
 
 	kirin_pcie = devm_kzalloc(dev, sizeof(struct kirin_pcie), GFP_KERNEL);
 	if (!kirin_pcie)
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
