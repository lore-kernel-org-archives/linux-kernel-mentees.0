Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406FEC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1556420FC3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpGG2FbJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1556420FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F398188395;
	Sat, 22 Aug 2020 21:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RAY20ucOC04m; Sat, 22 Aug 2020 21:03:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EC152883DC;
	Sat, 22 Aug 2020 21:03:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAC57C07FF;
	Sat, 22 Aug 2020 21:03:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C71CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1B86787E3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ge-LP1Qx7SCn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C308C87E30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:51 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t2so4708222wma.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1oAHINtg5Rwm418qrGF1c+x/jMl9ddhgkuK+/dJw5GI=;
 b=PpGG2FbJG03abLj4uwk+ZefvcKtaahzcvD3IF0/1bUByIyoDp84ygDblR+s0rYANPd
 UQ2LjIn6AoGAWZ115G5/4z4HeTnPrRiosKnyIL2+OOUGVpnXiP2D3dH/A8K3Mye/+kt+
 Wj+0kfNsnXPzgXSQSxrPoJajtqMWKE1hLwJwecSAbX9vbYUFanMg7G8T4ai5vYWN/UMK
 je64SOXeBBf7g27BS4xRGxWbFB0z7USpbeeKvlN5UVB54lg/1Uy6h8943u+MljH8A6NT
 EAig8/ve+Zxab9/2ZjGQHi33BQ2ad/IbL5zasoRwLiSr44AJdesIOhHpI2yt/dISKAST
 T/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1oAHINtg5Rwm418qrGF1c+x/jMl9ddhgkuK+/dJw5GI=;
 b=aJHWivtjsPT1B7VsQs//C6AbxWi+MqeYaMdJSMFxaLiq/DVY1VSw+vbjoQRH9SzM4C
 i753VwyaqMlPnYZgZboovvvTrMNltpfTo5zgu3OhErgdlxpjNAuGCp1rcpq5Os+1MTw6
 Szj8HlSielJxTN+YXvJ0vkKIXsZk0vdiYV5S4djkUJg7Qu9PanR6ZHYHtUvtz4dfoSrg
 RZXvkkRJK7KWQGRWcFanRBX96/BxIbJwJny8FCeZqMnc3v2GYlrKQNJijG6XOUFDW43a
 polayt6ECL+Jz1k6z/JGqAgPLA3liXLZEt63BDbc7yVC/nq+OuPmdPW22ym8hpCFhELW
 twHg==
X-Gm-Message-State: AOAM533Yo+PVBkCxETq0U8P+3AVktx9Pd+HhD1PYgrZcKmTedbY2qwYo
 AX85meCgETW78Zj5832dMqoZXx5zL444gg==
X-Google-Smtp-Source: ABdhPJwkUfTggE9Skzp4RNdZwmNkjmd+TA5GoAyob5PXM2nx/QABK98YThtJ2sdVyMEWjzYAcc5r6Q==
X-Received: by 2002:a1c:6a18:: with SMTP id f24mr8955035wmc.100.1598130230243; 
 Sat, 22 Aug 2020 14:03:50 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:49 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:48 +0200
Message-Id: <20200822200358.252967-14-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 13/23] PCI: Initialise and
	Update values of pci_dev's PCIe link info
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

The PCIe link state information defined in struct pci_dev are
initialised alongside with those of struct pcie_link_state.

The redundancy introduced is cleared out in later patches.

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 133 ++++++++++++++++++++++++++++++++--------
 1 file changed, 109 insertions(+), 24 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index d9c17093b250..e869e7faaac5 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -75,6 +75,7 @@ static int aspm_disabled, aspm_force;
 static bool aspm_support_enabled = true;
 static DEFINE_MUTEX(aspm_lock);
 static LIST_HEAD(link_list);
+static LIST_HEAD(pdev_link_list);
 
 #define POLICY_DEFAULT 0	/* BIOS default setting */
 #define POLICY_PERFORMANCE 1	/* high performance */
@@ -145,6 +146,7 @@ static void pcie_set_clkpm_nocheck(struct pcie_link_state *link, int enable)
 						   PCI_EXP_LNKCTL_CLKREQ_EN,
 						   val);
 	link->clkpm_enabled = !!enable;
+	link->pdev->clkpm_enabled = !!enable;
 }
 
 static void pcie_set_clkpm(struct pcie_link_state *link, int enable)
@@ -183,6 +185,10 @@ static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
 	link->clkpm_default = enabled;
 	link->clkpm_capable = capable;
 	link->clkpm_disable = blacklist ? 1 : 0;
+	link->pdev->clkpm_enabled = enabled;
+	link->pdev->clkpm_default = enabled;
+	link->pdev->clkpm_capable = capable;
+	link->pdev->clkpm_disable = blacklist ? 1 : 0;
 }
 
 static bool pcie_retrain_link(struct pcie_link_state *link)
@@ -374,6 +380,7 @@ static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 	u32 latency, l1_switch_latency = 0;
 	struct aspm_latency *acceptable;
 	struct pcie_link_state *link;
+	struct pci_dev *pdev;
 
 	/* Device not in D0 doesn't need latency check */
 	if ((endpoint->current_state != PCI_D0) &&
@@ -381,18 +388,24 @@ static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 		return;
 
 	link = endpoint->bus->self->link_state;
+	pdev = endpoint->bus->self;
 	acceptable = &link->acceptable[PCI_FUNC(endpoint->devfn)];
 
 	while (link) {
 		/* Check upstream direction L0s latency */
 		if ((link->aspm_capable & ASPM_STATE_L0S_UP) &&
-		    (link->latency_up.l0s > acceptable->l0s))
+		    (link->latency_up.l0s > acceptable->l0s)) {
 			link->aspm_capable &= ~ASPM_STATE_L0S_UP;
+			pdev->aspm_capable &= ~ASPM_STATE_L0S_UP;
+		}
 
 		/* Check downstream direction L0s latency */
 		if ((link->aspm_capable & ASPM_STATE_L0S_DW) &&
-		    (link->latency_dw.l0s > acceptable->l0s))
+		    (link->latency_dw.l0s > acceptable->l0s)) {
 			link->aspm_capable &= ~ASPM_STATE_L0S_DW;
+			pdev->aspm_capable &= ~ASPM_STATE_L0S_DW;
+		}
+
 		/*
 		 * Check L1 latency.
 		 * Every switch on the path to root complex need 1
@@ -408,11 +421,15 @@ static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 		 */
 		latency = max_t(u32, link->latency_up.l1, link->latency_dw.l1);
 		if ((link->aspm_capable & ASPM_STATE_L1) &&
-		    (latency + l1_switch_latency > acceptable->l1))
+		    (latency + l1_switch_latency > acceptable->l1)) {
 			link->aspm_capable &= ~ASPM_STATE_L1;
+			pdev->aspm_capable &= ~ASPM_STATE_L1;
+		}
+
 		l1_switch_latency += 1000;
 
 		link = link->parent;
+		pdev = pdev->parent;
 	}
 }
 
@@ -496,6 +513,8 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 		/* Set enabled/disable so that we will disable ASPM later */
 		link->aspm_enabled = ASPM_STATE_ALL;
 		link->aspm_disable = ASPM_STATE_ALL;
+		parent->aspm_enabled = ASPM_STATE_ALL;
+		parent->aspm_disable = ASPM_STATE_ALL;
 		return;
 	}
 
@@ -524,50 +543,87 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	 */
 	if (((parent->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
 			((child->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
-			PCIE_LINK_STATE_L0S)
+			PCIE_LINK_STATE_L0S) {
 		link->aspm_support |= ASPM_STATE_L0S;
+		parent->aspm_support |= ASPM_STATE_L0S;
+	}
 
-	if (get_aspm_enable(child) & PCIE_LINK_STATE_L0S)
+	if (get_aspm_enable(child) & PCIE_LINK_STATE_L0S) {
 		link->aspm_enabled |= ASPM_STATE_L0S_UP;
-	if (get_aspm_enable(parent) & PCIE_LINK_STATE_L0S)
+		parent->aspm_enabled |= ASPM_STATE_L0S_UP;
+	}
+
+	if (get_aspm_enable(parent) & PCIE_LINK_STATE_L0S) {
 		link->aspm_enabled |= ASPM_STATE_L0S_DW;
+		parent->aspm_enabled |= ASPM_STATE_L0S_DW;
+	}
+
 	link->latency_up.l0s = calc_l0s_latency(parent);
 	link->latency_dw.l0s = calc_l0s_latency(child);
+	parent->latency_up.l0s = calc_l0s_latency(parent);
+	parent->latency_dw.l0s = calc_l0s_latency(child);
 
 	/* Setup L1 state */
 	if (((parent->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
 			((child->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
-			PCIE_LINK_STATE_L1)
+			PCIE_LINK_STATE_L1) {
 		link->aspm_support |= ASPM_STATE_L1;
-	if (get_aspm_enable(parent) & get_aspm_enable(child) & PCIE_LINK_STATE_L1)
+		parent->aspm_support |= ASPM_STATE_L1;
+	}
+
+	if (get_aspm_enable(parent) & get_aspm_enable(child) &
+			    PCIE_LINK_STATE_L1) {
 		link->aspm_enabled |= ASPM_STATE_L1;
+		parent->aspm_enabled |= ASPM_STATE_L1;
+	}
+
 	link->latency_up.l1 = calc_l1_latency(parent);
 	link->latency_dw.l1 = calc_l1_latency(child);
+	parent->latency_up.l1 = calc_l1_latency(parent);
+	parent->latency_dw.l1 = calc_l1_latency(child);
 
 	/* Setup L1 substate */
-	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_ASPM_L1_1)
+	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_ASPM_L1_1) {
 		link->aspm_support |= ASPM_STATE_L1_1;
-	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_ASPM_L1_2)
+		parent->aspm_support |= ASPM_STATE_L1_1;
+	}
+	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_ASPM_L1_2) {
 		link->aspm_support |= ASPM_STATE_L1_2;
-	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_1)
+		parent->aspm_support |= ASPM_STATE_L1_2;
+	}
+	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_1) {
 		link->aspm_support |= ASPM_STATE_L1_1_PCIPM;
-	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_2)
+		parent->aspm_support |= ASPM_STATE_L1_1_PCIPM;
+	}
+	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_2) {
 		link->aspm_support |= ASPM_STATE_L1_2_PCIPM;
+		parent->aspm_support |= ASPM_STATE_L1_2_PCIPM;
+	}
 
-	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_1)
+	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_1) {
 		link->aspm_enabled |= ASPM_STATE_L1_1;
-	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_2)
+		parent->aspm_enabled |= ASPM_STATE_L1_1;
+	}
+	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_2) {
 		link->aspm_enabled |= ASPM_STATE_L1_2;
-	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_1)
+		parent->aspm_enabled |= ASPM_STATE_L1_2;
+	}
+	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_1) {
 		link->aspm_enabled |= ASPM_STATE_L1_1_PCIPM;
-	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_2)
+		parent->aspm_enabled |= ASPM_STATE_L1_1_PCIPM;
+	}
+	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_2) {
 		link->aspm_enabled |= ASPM_STATE_L1_2_PCIPM;
+		parent->aspm_enabled |= ASPM_STATE_L1_2_PCIPM;
+	}
 
 	/* Save default state */
 	link->aspm_default = link->aspm_enabled;
+	parent->aspm_default = parent->aspm_enabled;
 
 	/* Setup initial capable state. Will be updated later */
 	link->aspm_capable = link->aspm_support;
+	parent->aspm_capable = parent->aspm_support;
 
 	/* Get and check endpoint acceptable latencies */
 	list_for_each_entry(child, &linkbus->devices, bus_list) {
@@ -735,6 +791,7 @@ static void pcie_config_aspm_link(struct pcie_link_state *link, u32 state)
 		pcie_config_aspm_dev(parent, upstream);
 
 	link->aspm_enabled = state;
+	parent->aspm_enabled = state;
 }
 
 static void pcie_config_aspm_path(struct pcie_link_state *link)
@@ -795,8 +852,10 @@ static struct pcie_link_state *alloc_pcie_link_state(struct pci_dev *pdev)
 		return NULL;
 
 	INIT_LIST_HEAD(&link->sibling);
+	INIT_LIST_HEAD(&pdev->sibling);
 	link->pdev = pdev;
 	link->downstream = pci_function_0(pdev->subordinate);
+	pdev->downstream = pci_function_0(pdev->subordinate);
 
 	/*
 	 * Root Ports and PCI/PCI-X to PCIe Bridges are roots of PCIe
@@ -809,6 +868,7 @@ static struct pcie_link_state *alloc_pcie_link_state(struct pci_dev *pdev)
 	    pci_pcie_type(pdev) == PCI_EXP_TYPE_PCIE_BRIDGE ||
 	    !pdev->bus->parent->self) {
 		link->root = link;
+		pdev->root = pdev;
 	} else {
 		struct pcie_link_state *parent;
 
@@ -820,9 +880,12 @@ static struct pcie_link_state *alloc_pcie_link_state(struct pci_dev *pdev)
 
 		link->parent = parent;
 		link->root = link->parent->root;
+		pdev->parent = pdev->bus->parent->self;
+		pdev->root = pdev->parent->root;
 	}
 
 	list_add(&link->sibling, &link_list);
+	list_add(&pdev->sibling, &pdev_link_list);
 	pdev->link_state = link;
 	return link;
 }
@@ -913,6 +976,7 @@ static void pcie_update_aspm_capable(struct pcie_link_state *root)
 		if (link->root != root)
 			continue;
 		link->aspm_capable = link->aspm_support;
+		link->pdev->aspm_capable = link->aspm_support;
 	}
 	list_for_each_entry(link, &link_list, sibling) {
 		struct pci_dev *child;
@@ -1021,6 +1085,7 @@ static struct pcie_link_state *pcie_aspm_get_link(struct pci_dev *pdev)
 static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 {
 	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
+	struct pci_dev *bridge = link->pdev;
 
 	if (!link)
 		return -EINVAL;
@@ -1040,23 +1105,37 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 	if (sem)
 		down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
-	if (state & PCIE_LINK_STATE_L0S)
+	if (state & PCIE_LINK_STATE_L0S) {
 		link->aspm_disable |= ASPM_STATE_L0S;
-	if (state & PCIE_LINK_STATE_L1)
+		bridge->aspm_disable |= ASPM_STATE_L0S;
+	}
+	if (state & PCIE_LINK_STATE_L1) {
 		/* L1 PM substates require L1 */
 		link->aspm_disable |= ASPM_STATE_L1 | ASPM_STATE_L1SS;
-	if (state & PCIE_LINK_STATE_L1_1)
+		bridge->aspm_disable |= ASPM_STATE_L1 | ASPM_STATE_L1SS;
+	}
+	if (state & PCIE_LINK_STATE_L1_1) {
 		link->aspm_disable |= ASPM_STATE_L1_1;
-	if (state & PCIE_LINK_STATE_L1_2)
+		bridge->aspm_disable |= ASPM_STATE_L1_1;
+	}
+	if (state & PCIE_LINK_STATE_L1_2) {
 		link->aspm_disable |= ASPM_STATE_L1_2;
-	if (state & PCIE_LINK_STATE_L1_1_PCIPM)
+		bridge->aspm_disable |= ASPM_STATE_L1_2;
+	}
+	if (state & PCIE_LINK_STATE_L1_1_PCIPM) {
 		link->aspm_disable |= ASPM_STATE_L1_1_PCIPM;
-	if (state & PCIE_LINK_STATE_L1_2_PCIPM)
+		bridge->aspm_disable |= ASPM_STATE_L1_1_PCIPM;
+	}
+	if (state & PCIE_LINK_STATE_L1_2_PCIPM) {
 		link->aspm_disable |= ASPM_STATE_L1_2_PCIPM;
+		bridge->aspm_disable |= ASPM_STATE_L1_2_PCIPM;
+	}
 	pcie_config_aspm_link(link, policy_to_aspm_state(link));
 
-	if (state & PCIE_LINK_STATE_CLKPM)
+	if (state & PCIE_LINK_STATE_CLKPM) {
 		link->clkpm_disable = 1;
+		bridge->clkpm_disable = 1;
+	}
 	pcie_set_clkpm(link, policy_to_clkpm_state(link));
 	mutex_unlock(&aspm_lock);
 	if (sem)
@@ -1162,6 +1241,7 @@ static ssize_t aspm_attr_store_common(struct device *dev,
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
+	struct pci_dev *bridge = link->pdev;
 	bool state_enable;
 
 	if (strtobool(buf, &state_enable) < 0)
@@ -1172,11 +1252,15 @@ static ssize_t aspm_attr_store_common(struct device *dev,
 
 	if (state_enable) {
 		link->aspm_disable &= ~state;
+		bridge->aspm_disable &= ~state;
 		/* need to enable L1 for substates */
-		if (state & ASPM_STATE_L1SS)
+		if (state & ASPM_STATE_L1SS) {
 			link->aspm_disable &= ~ASPM_STATE_L1;
+			bridge->aspm_disable &= ~ASPM_STATE_L1;
+		}
 	} else {
 		link->aspm_disable |= state;
+		bridge->aspm_disable |= state;
 	}
 
 	pcie_config_aspm_link(link, policy_to_aspm_state(link));
@@ -1228,6 +1312,7 @@ static ssize_t clkpm_store(struct device *dev,
 	mutex_lock(&aspm_lock);
 
 	link->clkpm_disable = !state_enable;
+	link->pdev->clkpm_disable = !state_enable;
 	pcie_set_clkpm(link, policy_to_clkpm_state(link));
 
 	mutex_unlock(&aspm_lock);
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
