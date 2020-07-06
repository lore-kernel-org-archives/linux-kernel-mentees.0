Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8778CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 10:32:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B2672073E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 10:32:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcaH530k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B2672073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2847487383;
	Mon,  6 Jul 2020 10:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dS72L9a4R6P2; Mon,  6 Jul 2020 10:32:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A99B28735E;
	Mon,  6 Jul 2020 10:32:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 946B9C0891;
	Mon,  6 Jul 2020 10:32:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 292ADC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6B6F522201
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4iKYpQBIBFz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:32:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id E6A7322234
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k6so40260633wrn.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 03:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=h+kDFiIJUTsKW3n99UHZzrHB6kCAOHxPSRHyJei2C70=;
 b=hcaH530k48yc7s44pzmTgEgAKe9ym1JiRcDUKaoV18znhk84JN+6UTSautPPpn/KG5
 nfAWKFT49ue3SEQWExx2mPrSI3lwqdISJCA+tAfHLR9qo0ANtg9CjpYqWlfgTzDLrtL/
 6wuwGn0C/Q+amjCZ7I1KJdizN+8zBIkb6vzagJnHabiLCafVUDdKFjoWM0MSZoFiPA7H
 b5uPNVJrMStmy/Q3pf1Jvf+GOLEBum7VlB+0LXnPuZG6UX34bJD4/XKXzwREw/7jM2wW
 Su5BSnTS7RGuSww61CwHesVyp4m81v1ME537f62iMgNl8wH/qWgMH9R1YgBFKSwnwEoV
 0W5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=h+kDFiIJUTsKW3n99UHZzrHB6kCAOHxPSRHyJei2C70=;
 b=VrCEcBWWbdrCaPSiIlAajkjR+v8o5SGtLJM5FWully+26T2k0DLVfg8IkM+kd50nLN
 FTFJTq5qud6twlfweMzl5lw3+1IUSnD7sbleusM7O2Q9G7apPcIdRumMi6hZKeyY5ojq
 g8BMnanRqClsklWRnau0pJ+Ijo0UZDna9ulOPPjK0FCr8yj6fNAAwYCvI3xwkAIKHPHc
 ZWiKdzvaAblYR1IXTiB92dYYJaXQqqqOB6SaeZiY+KjISEsu3cLELUnibOqYGsy8aWdL
 RydIVgcanH28xIulRju0denyr7/jfMcI224bQdnPnp8c8LSi54CHqRSC5eHaXAgWaUMP
 YaGw==
X-Gm-Message-State: AOAM533+4J0F2D6c0NuiDW8fOWWk3+vuaBJT2YW8UTtsNHepsssOiwrB
 U/iSzFWGp1uhC6tmTSIQocc=
X-Google-Smtp-Source: ABdhPJwVg1BymNode15ugRIv8aKKBbIQzIjGgGl2HqCXAiJO/2zF3/GZe/M/NE/k4imThhnK3ydmwQ==
X-Received: by 2002:adf:e5d0:: with SMTP id a16mr45907268wrn.48.1594031518242; 
 Mon, 06 Jul 2020 03:31:58 -0700 (PDT)
Received: from net.saheed (51B7C2DF.dsl.pool.telekom.hu. [81.183.194.223])
 by smtp.gmail.com with ESMTPSA id 22sm24216859wmb.11.2020.07.06.03.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 03:31:57 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Mon,  6 Jul 2020 11:31:17 +0200
Message-Id: <20200706093121.9731-8-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200706093121.9731-1-refactormyself@gmail.com>
References: <20200706093121.9731-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 7/11 RFC] PCI: Validate with the
	return value of pcie_capability_read_*()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

On failure pcie_capability_read_dword() sets it's last parameter,
val to 0.
However, with Patch 11/11, it is possible that val is set to ~0 on
failure. This would introduce a bug because (x & x) == (~0 & x).

This bug can be avoided if the return value of pcie_capability_read_dword
is checked to confirm success.

Check the return value of pcie_capability_read_dword() to ensure success.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/probe.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 2f66988cea25..3c87a8a1d4b5 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1121,10 +1121,11 @@ EXPORT_SYMBOL(pci_add_new_bus);
 static void pci_enable_crs(struct pci_dev *pdev)
 {
 	u16 root_cap = 0;
+	int ret;
 
 	/* Enable CRS Software Visibility if supported */
-	pcie_capability_read_word(pdev, PCI_EXP_RTCAP, &root_cap);
-	if (root_cap & PCI_EXP_RTCAP_CRSVIS)
+	ret = pcie_capability_read_word(pdev, PCI_EXP_RTCAP, &root_cap);
+	if (!ret && (root_cap & PCI_EXP_RTCAP_CRSVIS))
 		pcie_capability_set_word(pdev, PCI_EXP_RTCTL,
 					 PCI_EXP_RTCTL_CRSSVE);
 }
@@ -1519,9 +1520,10 @@ void set_pcie_port_type(struct pci_dev *pdev)
 void set_pcie_hotplug_bridge(struct pci_dev *pdev)
 {
 	u32 reg32;
+	int ret;
 
-	pcie_capability_read_dword(pdev, PCI_EXP_SLTCAP, &reg32);
-	if (reg32 & PCI_EXP_SLTCAP_HPC)
+	ret = pcie_capability_read_dword(pdev, PCI_EXP_SLTCAP, &reg32);
+	if (!ret && (reg32 & PCI_EXP_SLTCAP_HPC))
 		pdev->is_hotplug_bridge = 1;
 }
 
@@ -2057,10 +2059,11 @@ int pci_configure_extended_tags(struct pci_dev *dev, void *ign)
 bool pcie_relaxed_ordering_enabled(struct pci_dev *dev)
 {
 	u16 v;
+	int ret;
 
-	pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &v);
+	ret = pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &v);
 
-	return !!(v & PCI_EXP_DEVCTL_RELAX_EN);
+	return (!ret && !!(v & PCI_EXP_DEVCTL_RELAX_EN));
 }
 EXPORT_SYMBOL(pcie_relaxed_ordering_enabled);
 
@@ -2096,16 +2099,17 @@ static void pci_configure_ltr(struct pci_dev *dev)
 	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 	struct pci_dev *bridge;
 	u32 cap, ctl;
+	int ret;
 
 	if (!pci_is_pcie(dev))
 		return;
 
-	pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
-	if (!(cap & PCI_EXP_DEVCAP2_LTR))
+	ret = pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
+	if (ret || !(cap & PCI_EXP_DEVCAP2_LTR))
 		return;
 
-	pcie_capability_read_dword(dev, PCI_EXP_DEVCTL2, &ctl);
-	if (ctl & PCI_EXP_DEVCTL2_LTR_EN) {
+	ret = pcie_capability_read_dword(dev, PCI_EXP_DEVCTL2, &ctl);
+	if (!ret && (ctl & PCI_EXP_DEVCTL2_LTR_EN)) {
 		if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT) {
 			dev->ltr_path = 1;
 			return;
@@ -2142,12 +2146,13 @@ static void pci_configure_eetlp_prefix(struct pci_dev *dev)
 	struct pci_dev *bridge;
 	int pcie_type;
 	u32 cap;
+	int ret;
 
 	if (!pci_is_pcie(dev))
 		return;
 
-	pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
-	if (!(cap & PCI_EXP_DEVCAP2_EE_PREFIX))
+	ret = pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
+	if (ret || !(cap & PCI_EXP_DEVCAP2_EE_PREFIX))
 		return;
 
 	pcie_type = pci_pcie_type(dev);
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
