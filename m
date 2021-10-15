Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A2AC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:46:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAF5C61181
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAF5C61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8440D607C8;
	Fri, 15 Oct 2021 14:46:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwRzG4eG6sdH; Fri, 15 Oct 2021 14:46:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id ADDFF607B1;
	Fri, 15 Oct 2021 14:46:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B267C000F;
	Fri, 15 Oct 2021 14:46:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C531C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FBA1607B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7NOY48GORyB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FD8360794
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:07 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id y1so6524559plk.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EXqQzO1oSewfqo9sAbFeLWFXnz/W3EVi0EQdPEI6sRE=;
 b=K53e7Oe+f9+7D7WpNDUco3qWePYRLXAYCersP6n2gPnyhNdVyIE3Wu1/0wXNvCeD4h
 GQwrZ1Ch9tnNznJLjY2BCfcuNx29Ntzjkp1QpG5TUU7MSzTzCmUOq1NHcaxBCGoxZxyy
 zIfAW+IH/LqvtfiGH23oImVF4unRFwnBN9vExy/ehbxrgFRX7YYyzxkVcc9KuA+iIEVN
 x8UujC0F/DA4KmjgsLX7BCsyrLN09joYUMjO/XpoZHl2nnyh0BtSo/Ujt9fhazeGrq2+
 bwvDDRhHpWmQtgwA4fSn8mw4uZYf066PvrVj1XtJxZlAJNneDe5bOTB1mzHAalmdDjLy
 q8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EXqQzO1oSewfqo9sAbFeLWFXnz/W3EVi0EQdPEI6sRE=;
 b=yvPkQmiyH9JcGln8vsIkHBlsdbQ3kHuXrmfSC223wrzShLyyfXS3ZRoYhLi+26mcx1
 xDAXrm6wWK2nac+oye88Zd6+1XokagFpixoTBnHVF+DbhjquuG+cFUDXRxalYrOF8UFb
 Kl0ySD2MIeb0DCyG0qfnSA5I00iK4KxFjtjcSMvnatmXJ7LRVLDzDHWxg0omcIkn4mEf
 zhG4bCCLh+LMkuwexhQaM3QigCfWjlmjEPo9ktfQD/g54tTLpRbMCRx+J5DPYV1yHA9q
 Haepr2lkAuuPbwZbuD/mqO/U5WaP7z5KLAG3r4L2h7rApepFFRqvcHa1d3kv6/unNfXb
 il3g==
X-Gm-Message-State: AOAM530mLCHL9odHlzmWSWi05W7sZypJCmlT2pLgQg2IyHSL9ddOT47R
 rlD5PIr2wQs4gel5GXPNQR8=
X-Google-Smtp-Source: ABdhPJzsMZqm+frY+X1rHzGEJNsNKsVIy7dntkjRCaKaKKSNaCGslbffodRrOi1845tZSOiFoJhUTA==
X-Received: by 2002:a17:90a:bb82:: with SMTP id
 v2mr28357103pjr.57.1634309167032; 
 Fri, 15 Oct 2021 07:46:07 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:46:06 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 18/24] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to check
 read from hardware
Date: Fri, 15 Oct 2021 20:08:59 +0530
Message-Id: <2bc987dc1dfb753c37a65b6c8c98c32e66a4d2a0.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, linux-kernel-mentees@lists.linuxfoundation.org
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

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Use RESPONSE_IS_PCI_ERROR() to check the response we get when we read
data from hardware.

This helps unify PCI error response checking and make error checks
consistent and easier to find.

Compile tested only.

Acked-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/hotplug/pciehp_hpc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 3024d7e85e6a..8a2f6bb643b5 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -89,7 +89,7 @@ static int pcie_poll_cmd(struct controller *ctrl, int timeout)
 
 	do {
 		pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
-		if (slot_status == (u16) ~0) {
+		if (RESPONSE_IS_PCI_ERROR(&slot_status)) {
 			ctrl_info(ctrl, "%s: no response from device\n",
 				  __func__);
 			return 0;
@@ -165,7 +165,7 @@ static void pcie_do_write_cmd(struct controller *ctrl, u16 cmd,
 	pcie_wait_cmd(ctrl);
 
 	pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
-	if (slot_ctrl == (u16) ~0) {
+	if (RESPONSE_IS_PCI_ERROR(&slot_ctrl)) {
 		ctrl_info(ctrl, "%s: no response from device\n", __func__);
 		goto out;
 	}
@@ -236,7 +236,7 @@ int pciehp_check_link_active(struct controller *ctrl)
 	int ret;
 
 	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
-	if (ret == PCIBIOS_DEVICE_NOT_FOUND || lnk_status == (u16)~0)
+	if (ret == PCIBIOS_DEVICE_NOT_FOUND || RESPONSE_IS_PCI_ERROR(&lnk_status))
 		return -ENODEV;
 
 	ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
@@ -443,7 +443,7 @@ int pciehp_card_present(struct controller *ctrl)
 	int ret;
 
 	ret = pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
-	if (ret == PCIBIOS_DEVICE_NOT_FOUND || slot_status == (u16)~0)
+	if (ret == PCIBIOS_DEVICE_NOT_FOUND || RESPONSE_IS_PCI_ERROR(&slot_status))
 		return -ENODEV;
 
 	return !!(slot_status & PCI_EXP_SLTSTA_PDS);
@@ -621,7 +621,7 @@ static irqreturn_t pciehp_isr(int irq, void *dev_id)
 
 read_status:
 	pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &status);
-	if (status == (u16) ~0) {
+	if (RESPONSE_IS_PCI_ERROR(&status)) {
 		ctrl_info(ctrl, "%s: no response from device\n", __func__);
 		if (parent)
 			pm_runtime_put(parent);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
