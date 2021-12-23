Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5798C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Dec 2021 01:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72BE660A7C;
	Thu, 23 Dec 2021 01:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-yKQDHSL5Uo; Thu, 23 Dec 2021 01:11:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9352760A79;
	Thu, 23 Dec 2021 01:11:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72B76C001E;
	Thu, 23 Dec 2021 01:11:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F07AC0074
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0155981B3E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQ6fdDO81k5H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F5AF81B70
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1E79ECE1F0A;
 Thu, 23 Dec 2021 01:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB616C36AE5;
 Thu, 23 Dec 2021 01:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640221877;
 bh=iOkvvyDco++xwaeJXqOOlWMRlL/DkfMGvNa4DoNqUTQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q7E39IHl8weHJkVn1UAIb9+guzhHDgYPnNQzt9wSq/FHdc/97cDonVlM2/hQ/lIUH
 gAdKyWS8xDCLCKNsVflsNlRTbNUkJwrRe7zSgyjDGEm+P2S9D6ehwc/QBtNEnIy7q1
 uMXH6dwvg4J7DacnAsgZosBP+kdDCocgwkWQlLSjgYRl6xtqVLqHC1B8jAY6K9/38L
 B2ShZqx9M15IxpoVcW6YmIyjsyL3wBJJDhud0sNBn+dSmadnnPcZTiUIu8+pMJ/QI8
 kGJQ/ukDXaVFKNKQVRNgF9nKWlQmnS0GoqVfUJbFj65IE+khgHt13OEmVD001RWEAV
 b+DjnCLYnFlGQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org,
	Fan Fei <ffclaire1224@gmail.com>
Subject: [PATCH v2 04/23] PCI: designware-plat: Prefer
 of_device_get_match_data()
Date: Wed, 22 Dec 2021 19:10:35 -0600
Message-Id: <20211223011054.1227810-5-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223011054.1227810-1-helgaas@kernel.org>
References: <20211223011054.1227810-1-helgaas@kernel.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
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

The designware-plat driver only needs the device data, not the whole struct
of_device_id.  Use of_device_get_match_data() instead of of_match_device().
No functional change intended.

[bhelgaas: commit log]
Signed-off-by: Fan Fei <ffclaire1224@gmail.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 drivers/pci/controller/dwc/pcie-designware-plat.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 8851eb161a0e..0c5de87d3cc6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -122,15 +122,13 @@ static int dw_plat_pcie_probe(struct platform_device *pdev)
 	struct dw_plat_pcie *dw_plat_pcie;
 	struct dw_pcie *pci;
 	int ret;
-	const struct of_device_id *match;
 	const struct dw_plat_pcie_of_data *data;
 	enum dw_pcie_device_mode mode;
 
-	match = of_match_device(dw_plat_pcie_of_match, dev);
-	if (!match)
+	data = of_device_get_match_data(dev);
+	if (!data)
 		return -EINVAL;
 
-	data = (struct dw_plat_pcie_of_data *)match->data;
 	mode = (enum dw_pcie_device_mode)data->mode;
 
 	dw_plat_pcie = devm_kzalloc(dev, sizeof(*dw_plat_pcie), GFP_KERNEL);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
