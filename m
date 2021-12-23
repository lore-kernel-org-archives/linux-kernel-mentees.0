Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8198DC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Dec 2021 01:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4238C813F1;
	Thu, 23 Dec 2021 01:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y95JZvzKwgxr; Thu, 23 Dec 2021 01:11:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 74D7681410;
	Thu, 23 Dec 2021 01:11:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 530CAC001E;
	Thu, 23 Dec 2021 01:11:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CFF3C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CB1160AC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lq6jKCwFpxj7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5ED9560A84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 01:11:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3BCB5CE1EFC;
 Thu, 23 Dec 2021 01:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F11C36AEB;
 Thu, 23 Dec 2021 01:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640221891;
 bh=f04xaSCWCbCEFfwG/HFC1grHJ9t6oRK/Bi24pKjCZyI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nvMXfI+W4QtXhYQ0wlO4ZGP5oRI/bDTLIiZQCZnxqDYqFZHNNnvNRAJgUP/uHpaFI
 Rn9nowg/KHh9eBZDc4XPV4b069qKgcgPjfIA56aihCYeI4vpGn1krWcUf+B9HwT/8f
 cs88HTW+jpYAcDiX0IZ9ewhy0+kTetN/aimbDjRNsCaxvXtwjjRo+e48zsZJLV//nb
 eXxp3z8Yo6XzfIEbH6RVTJDc0/GyPVgFJce7STlxmkrxaIh+c33YHrHPtYLWol9c0V
 R6weAMgfvq+8wnxzxkHdsGsul/2lD09fHFT/az/+xOiphMyohTyTI5RB5W36StJ512
 yzvjwvNWecxFw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org,
	Fan Fei <ffclaire1224@gmail.com>
Subject: [PATCH v2 12/23] PCI: iproc: Rename iproc_pcie_pltfm_ to
 iproc_pltfm_pcie_
Date: Wed, 22 Dec 2021 19:10:43 -0600
Message-Id: <20211223011054.1227810-13-helgaas@kernel.org>
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

Rename iproc_pcie_pltfm_* to iproc_pltfm_pcie_* for consistency with other
drivers.  No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pci/controller/pcie-iproc-platform.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/pci/controller/pcie-iproc-platform.c
index b93e7bda101b..538115246c79 100644
--- a/drivers/pci/controller/pcie-iproc-platform.c
+++ b/drivers/pci/controller/pcie-iproc-platform.c
@@ -37,7 +37,7 @@ static const struct of_device_id iproc_pcie_of_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, iproc_pcie_of_match_table);
 
-static int iproc_pcie_pltfm_probe(struct platform_device *pdev)
+static int iproc_pltfm_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct iproc_pcie *pcie;
@@ -115,30 +115,30 @@ static int iproc_pcie_pltfm_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int iproc_pcie_pltfm_remove(struct platform_device *pdev)
+static int iproc_pltfm_pcie_remove(struct platform_device *pdev)
 {
 	struct iproc_pcie *pcie = platform_get_drvdata(pdev);
 
 	return iproc_pcie_remove(pcie);
 }
 
-static void iproc_pcie_pltfm_shutdown(struct platform_device *pdev)
+static void iproc_pltfm_pcie_shutdown(struct platform_device *pdev)
 {
 	struct iproc_pcie *pcie = platform_get_drvdata(pdev);
 
 	iproc_pcie_shutdown(pcie);
 }
 
-static struct platform_driver iproc_pcie_pltfm_driver = {
+static struct platform_driver iproc_pltfm_pcie_driver = {
 	.driver = {
 		.name = "iproc-pcie",
 		.of_match_table = of_match_ptr(iproc_pcie_of_match_table),
 	},
-	.probe = iproc_pcie_pltfm_probe,
-	.remove = iproc_pcie_pltfm_remove,
-	.shutdown = iproc_pcie_pltfm_shutdown,
+	.probe = iproc_pltfm_pcie_probe,
+	.remove = iproc_pltfm_pcie_remove,
+	.shutdown = iproc_pltfm_pcie_shutdown,
 };
-module_platform_driver(iproc_pcie_pltfm_driver);
+module_platform_driver(iproc_pltfm_pcie_driver);
 
 MODULE_AUTHOR("Ray Jui <rjui@broadcom.com>");
 MODULE_DESCRIPTION("Broadcom iPROC PCIe platform driver");
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
