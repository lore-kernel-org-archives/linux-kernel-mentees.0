Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A8FC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B8F72078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iD36xYUD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B8F72078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6633E8839E;
	Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEW5lGFsId5J; Sat, 22 Aug 2020 21:04:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 37A69883C1;
	Sat, 22 Aug 2020 21:04:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24B40C07FF;
	Sat, 22 Aug 2020 21:04:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D98E0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C940485F92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vCO15PhHs_pO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7AE3284E49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:00 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u18so4934625wmc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z+AZ+XQ9i8uHA/Mp58NMXcLLZEQgmWcSlsPASdwTqI4=;
 b=iD36xYUDUKCa/fZD68gHav7UeVkdCfEadsHpC2SJ+xL42/GRO3YX7oeUrxmguj3xFR
 brFDO9LkPNQSZu/y9JS7dH1S441wgRCKoIWtFHlEbAkBrrEEEce2yDB5nK7YDlavSxcm
 zCLlfJ3WhsuItggYjSQJcX6GksgTepaXh/uQm8W74qL5H4Vkh4M/2v6+6bAU/lZH3pc3
 xoNDRTOnDAaeVBVxdkkRhAzVeeSEh9DjSmMyymXk/iE5LYlrEF15zmP4Rp1w1W2vblTR
 +8lV2UrZZzASnLU5KpkAVhvB6IVh4gqODuB7Vass0RFRH9wuA+ZLyLMjohitj2i5ZZHQ
 ZbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z+AZ+XQ9i8uHA/Mp58NMXcLLZEQgmWcSlsPASdwTqI4=;
 b=nwvjlynSS1NlSbUb96MejSwftHOA8kJorTSByUDhe+6ONBTMfCHxCTKsF76+lpIZ9o
 GJRKVm9MfNDQo8gwacaJfiBCXR7tRC8J8sl5Rl1lcWfmVY3q6vKghZcesJ4iVL/ScO8o
 lI34yypjb2Lc/QCO8NGf59Fm30OSRmSYkCsPS9ffmn4V0DD9HqSFjCjDo4f/jkx0j1b3
 yMlsJogYG18PAw3hfwzI3PHaAnMNW+KigAm6noCMjIKelAHfQqBexo/6A6C4GdNxMzAY
 m/+OjDDLArzbrSlqnQYuYUulvcdnlwO+lz/eewvbqpGMVHoixdGKfHJjW8F4N3iudDFT
 i22A==
X-Gm-Message-State: AOAM533CkcCCZ1v26bPv76/Z3A+C017zbkrliDLp33Lm5VbEO7k5vT8i
 5RGHIj4//xSbiN2XCn6xui0=
X-Google-Smtp-Source: ABdhPJxb/rCZ19ku5W/y6F43M6SCLDIC2aPKsDIvoNvVO3b6bqw2JZbWuBUYFBQkFa9M5QFZmWSYkQ==
X-Received: by 2002:a1c:740c:: with SMTP id p12mr8677116wmc.53.1598130238545; 
 Sat, 22 Aug 2020 14:03:58 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:58 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:53 +0200
Message-Id: <20200822200358.252967-19-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 18/23] PCI: Remove .aspm_*
	from struct pcie_link_state
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

 - Remove initiations of pcie_link_state.aspm_*
 - Replace all access to pcie_link_state.aspm_* with pci_pdev.aspm_*
 - Remove pcie_link_state.aspm_*
 - Do few cleaups

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 137 +++++++++++-----------------------------
 1 file changed, 38 insertions(+), 99 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 27a590fe6b23..8d5a38081753 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -46,13 +46,6 @@ struct pcie_link_state {
 	struct pci_dev *downstream;	/* Downstream component, function 0 */
 	struct pcie_link_state *root;	/* pointer to the root port link */
 	struct pcie_link_state *parent;	/* pointer to the parent Link state */
-
-	/* ASPM state */
-	u32 aspm_support:7;		/* Supported ASPM state */
-	u32 aspm_enabled:7;		/* Enabled ASPM state */
-	u32 aspm_capable:7;		/* Capable ASPM state with latency */
-	u32 aspm_default:7;		/* Default ASPM state by BIOS */
-	u32 aspm_disable:7;		/* Disabled ASPM state */
 };
 
 static int aspm_disabled, aspm_force;
@@ -97,7 +90,7 @@ static int policy_to_aspm_state(struct pci_dev *pdev)
 		/* Enable Everything */
 		return ASPM_STATE_ALL;
 	case POLICY_DEFAULT:
-		return pdev->link_state->aspm_default;
+		return pdev->aspm_default;
 	}
 	return 0;
 }
@@ -373,18 +366,14 @@ static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 
 	while (link) {
 		/* Check upstream direction L0s latency */
-		if ((link->aspm_capable & ASPM_STATE_L0S_UP) &&
-		    (link->pdev->latency_up.l0s > acceptable->l0s)) {
-			link->aspm_capable &= ~ASPM_STATE_L0S_UP;
+		if ((link->pdev->aspm_capable & ASPM_STATE_L0S_UP) &&
+		    (link->pdev->latency_up.l0s > acceptable->l0s))
 			pdev->aspm_capable &= ~ASPM_STATE_L0S_UP;
-		}
 
 		/* Check downstream direction L0s latency */
-		if ((link->aspm_capable & ASPM_STATE_L0S_DW) &&
-		    (link->pdev->latency_dw.l0s > acceptable->l0s)) {
-			link->aspm_capable &= ~ASPM_STATE_L0S_DW;
+		if ((link->pdev->aspm_capable & ASPM_STATE_L0S_DW) &&
+		    (link->pdev->latency_dw.l0s > acceptable->l0s))
 			pdev->aspm_capable &= ~ASPM_STATE_L0S_DW;
-		}
 
 		/*
 		 * Check L1 latency.
@@ -401,11 +390,9 @@ static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 		 */
 		latency = max_t(u32, link->pdev->latency_up.l1,
 						link->pdev->latency_dw.l1);
-		if ((link->aspm_capable & ASPM_STATE_L1) &&
-		    (latency + l1_switch_latency > acceptable->l1)) {
-			link->aspm_capable &= ~ASPM_STATE_L1;
+		if ((link->pdev->aspm_capable & ASPM_STATE_L1) &&
+		    (latency + l1_switch_latency > acceptable->l1))
 			pdev->aspm_capable &= ~ASPM_STATE_L1;
-		}
 
 		l1_switch_latency += 1000;
 
@@ -438,7 +425,7 @@ static void aspm_calc_l1ss_ctl_values(struct pci_dev *pdev,
 	struct pci_dev *dw_pdev = link->downstream;
 	struct pci_dev *up_pdev = link->pdev;
 
-	if (!(link->aspm_support & ASPM_STATE_L1_2_MASK))
+	if (!(link->pdev->aspm_support & ASPM_STATE_L1_2_MASK))
 		return;
 
 	/* Choose the greater of the two Port Common_Mode_Restore_Times */
@@ -493,8 +480,6 @@ static void pcie_aspm_cap_init(struct pci_dev *pdev, int blacklist)
 
 	if (blacklist) {
 		/* Set enabled/disable so that we will disable ASPM later */
-		link->aspm_enabled = ASPM_STATE_ALL;
-		link->aspm_disable = ASPM_STATE_ALL;
 		parent->aspm_enabled = ASPM_STATE_ALL;
 		parent->aspm_disable = ASPM_STATE_ALL;
 		return;
@@ -525,20 +510,14 @@ static void pcie_aspm_cap_init(struct pci_dev *pdev, int blacklist)
 	 */
 	if (((parent->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
 			((child->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
-			PCIE_LINK_STATE_L0S) {
-		link->aspm_support |= ASPM_STATE_L0S;
+			PCIE_LINK_STATE_L0S)
 		parent->aspm_support |= ASPM_STATE_L0S;
-	}
 
-	if (get_aspm_enable(child) & PCIE_LINK_STATE_L0S) {
-		link->aspm_enabled |= ASPM_STATE_L0S_UP;
+	if (get_aspm_enable(child) & PCIE_LINK_STATE_L0S)
 		parent->aspm_enabled |= ASPM_STATE_L0S_UP;
-	}
 
-	if (get_aspm_enable(parent) & PCIE_LINK_STATE_L0S) {
-		link->aspm_enabled |= ASPM_STATE_L0S_DW;
+	if (get_aspm_enable(parent) & PCIE_LINK_STATE_L0S)
 		parent->aspm_enabled |= ASPM_STATE_L0S_DW;
-	}
 
 	parent->latency_up.l0s = calc_l0s_latency(parent);
 	parent->latency_dw.l0s = calc_l0s_latency(child);
@@ -546,61 +525,39 @@ static void pcie_aspm_cap_init(struct pci_dev *pdev, int blacklist)
 	/* Setup L1 state */
 	if (((parent->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
 			((child->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
-			PCIE_LINK_STATE_L1) {
-		link->aspm_support |= ASPM_STATE_L1;
+			PCIE_LINK_STATE_L1)
 		parent->aspm_support |= ASPM_STATE_L1;
-	}
 
 	if (get_aspm_enable(parent) & get_aspm_enable(child) &
-			    PCIE_LINK_STATE_L1) {
-		link->aspm_enabled |= ASPM_STATE_L1;
+			    PCIE_LINK_STATE_L1)
 		parent->aspm_enabled |= ASPM_STATE_L1;
-	}
 
 	parent->latency_up.l1 = calc_l1_latency(parent);
 	parent->latency_dw.l1 = calc_l1_latency(child);
 
 	/* Setup L1 substate */
-	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_ASPM_L1_1) {
-		link->aspm_support |= ASPM_STATE_L1_1;
+	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_ASPM_L1_1)
 		parent->aspm_support |= ASPM_STATE_L1_1;
-	}
-	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_ASPM_L1_2) {
-		link->aspm_support |= ASPM_STATE_L1_2;
+	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_ASPM_L1_2)
 		parent->aspm_support |= ASPM_STATE_L1_2;
-	}
-	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_1) {
-		link->aspm_support |= ASPM_STATE_L1_1_PCIPM;
+	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_1)
 		parent->aspm_support |= ASPM_STATE_L1_1_PCIPM;
-	}
-	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_2) {
-		link->aspm_support |= ASPM_STATE_L1_2_PCIPM;
+	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_2)
 		parent->aspm_support |= ASPM_STATE_L1_2_PCIPM;
-	}
 
-	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_1) {
-		link->aspm_enabled |= ASPM_STATE_L1_1;
+	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_1)
 		parent->aspm_enabled |= ASPM_STATE_L1_1;
-	}
-	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_2) {
-		link->aspm_enabled |= ASPM_STATE_L1_2;
+	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_2)
 		parent->aspm_enabled |= ASPM_STATE_L1_2;
-	}
-	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_1) {
-		link->aspm_enabled |= ASPM_STATE_L1_1_PCIPM;
+	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_1)
 		parent->aspm_enabled |= ASPM_STATE_L1_1_PCIPM;
-	}
-	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_2) {
-		link->aspm_enabled |= ASPM_STATE_L1_2_PCIPM;
+	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_2)
 		parent->aspm_enabled |= ASPM_STATE_L1_2_PCIPM;
-	}
 
 	/* Save default state */
-	link->aspm_default = link->aspm_enabled;
 	parent->aspm_default = parent->aspm_enabled;
 
 	/* Setup initial capable state. Will be updated later */
-	link->aspm_capable = link->aspm_support;
 	parent->aspm_capable = parent->aspm_support;
 
 	/* Get and check endpoint acceptable latencies */
@@ -729,7 +686,7 @@ static void pcie_config_aspm_link(struct pci_dev *pdev, u32 state)
 	struct pci_bus *linkbus = parent->subordinate;
 
 	/* Enable only the states that were not explicitly disabled */
-	state &= (link->aspm_capable & ~link->aspm_disable);
+	state &= (link->pdev->aspm_capable & ~link->pdev->aspm_disable);
 
 	/* Can't enable any substates if L1 is not enabled */
 	if (!(state & ASPM_STATE_L1))
@@ -738,11 +695,11 @@ static void pcie_config_aspm_link(struct pci_dev *pdev, u32 state)
 	/* Spec says both ports must be in D0 before enabling PCI PM substates*/
 	if (parent->current_state != PCI_D0 || child->current_state != PCI_D0) {
 		state &= ~ASPM_STATE_L1_SS_PCIPM;
-		state |= (link->aspm_enabled & ASPM_STATE_L1_SS_PCIPM);
+		state |= (link->pdev->aspm_enabled & ASPM_STATE_L1_SS_PCIPM);
 	}
 
 	/* Nothing to do if the link is already in the requested state */
-	if (link->aspm_enabled == state)
+	if (link->pdev->aspm_enabled == state)
 		return;
 	/* Convert ASPM state to upstream/downstream ASPM register state */
 	if (state & ASPM_STATE_L0S_UP)
@@ -754,7 +711,7 @@ static void pcie_config_aspm_link(struct pci_dev *pdev, u32 state)
 		dwstream |= PCI_EXP_LNKCTL_ASPM_L1;
 	}
 
-	if (link->aspm_capable & ASPM_STATE_L1SS)
+	if (link->pdev->aspm_capable & ASPM_STATE_L1SS)
 		pcie_config_aspm_l1ss(parent, state);
 
 	/*
@@ -770,7 +727,6 @@ static void pcie_config_aspm_link(struct pci_dev *pdev, u32 state)
 	if (!(state & ASPM_STATE_L1))
 		pcie_config_aspm_dev(parent, upstream);
 
-	link->aspm_enabled = state;
 	parent->aspm_enabled = state;
 }
 
@@ -1085,31 +1041,20 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 	if (sem)
 		down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
-	if (state & PCIE_LINK_STATE_L0S) {
-		link->aspm_disable |= ASPM_STATE_L0S;
+	if (state & PCIE_LINK_STATE_L0S)
 		bridge->aspm_disable |= ASPM_STATE_L0S;
-	}
-	if (state & PCIE_LINK_STATE_L1) {
+	if (state & PCIE_LINK_STATE_L1)
 		/* L1 PM substates require L1 */
-		link->aspm_disable |= ASPM_STATE_L1 | ASPM_STATE_L1SS;
 		bridge->aspm_disable |= ASPM_STATE_L1 | ASPM_STATE_L1SS;
-	}
-	if (state & PCIE_LINK_STATE_L1_1) {
-		link->aspm_disable |= ASPM_STATE_L1_1;
+	if (state & PCIE_LINK_STATE_L1_1)
 		bridge->aspm_disable |= ASPM_STATE_L1_1;
-	}
-	if (state & PCIE_LINK_STATE_L1_2) {
-		link->aspm_disable |= ASPM_STATE_L1_2;
+	if (state & PCIE_LINK_STATE_L1_2)
 		bridge->aspm_disable |= ASPM_STATE_L1_2;
-	}
-	if (state & PCIE_LINK_STATE_L1_1_PCIPM) {
-		link->aspm_disable |= ASPM_STATE_L1_1_PCIPM;
+	if (state & PCIE_LINK_STATE_L1_1_PCIPM)
 		bridge->aspm_disable |= ASPM_STATE_L1_1_PCIPM;
-	}
-	if (state & PCIE_LINK_STATE_L1_2_PCIPM) {
-		link->aspm_disable |= ASPM_STATE_L1_2_PCIPM;
+	if (state & PCIE_LINK_STATE_L1_2_PCIPM)
 		bridge->aspm_disable |= ASPM_STATE_L1_2_PCIPM;
-	}
+
 	pcie_config_aspm_link(link->pdev, policy_to_aspm_state(link->pdev));
 
 	if (state & PCIE_LINK_STATE_CLKPM) {
@@ -1200,7 +1145,7 @@ bool pcie_aspm_enabled(struct pci_dev *pdev)
 	if (!dev)
 		return false;
 
-	return dev->link_state->aspm_enabled;
+	return dev->aspm_enabled;
 }
 EXPORT_SYMBOL_GPL(pcie_aspm_enabled);
 
@@ -1211,7 +1156,7 @@ static ssize_t aspm_attr_show_common(struct device *dev,
 	struct pci_dev *pdev = pcie_aspm_get_link(to_pci_dev(dev));
 
 	return sprintf(buf, "%d\n",
-		(pdev->link_state->aspm_enabled & state) ? 1 : 0);
+		(pdev->aspm_enabled & state) ? 1 : 0);
 }
 
 static ssize_t aspm_attr_store_common(struct device *dev,
@@ -1230,17 +1175,12 @@ static ssize_t aspm_attr_store_common(struct device *dev,
 	mutex_lock(&aspm_lock);
 
 	if (state_enable) {
-		link->aspm_disable &= ~state;
 		bridge->aspm_disable &= ~state;
 		/* need to enable L1 for substates */
-		if (state & ASPM_STATE_L1SS) {
-			link->aspm_disable &= ~ASPM_STATE_L1;
+		if (state & ASPM_STATE_L1SS)
 			bridge->aspm_disable &= ~ASPM_STATE_L1;
-		}
-	} else {
-		link->aspm_disable |= state;
+	} else
 		bridge->aspm_disable |= state;
-	}
 
 	pcie_config_aspm_link(link->pdev, policy_to_aspm_state(link->pdev));
 
@@ -1322,7 +1262,6 @@ static umode_t aspm_ctrl_attrs_are_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct pci_dev *pdev = pcie_aspm_get_link(to_pci_dev(dev));
-	struct pcie_link_state *link = pdev->link_state;
 	static const u8 aspm_state_map[] = {
 		ASPM_STATE_L0S,
 		ASPM_STATE_L1,
@@ -1332,13 +1271,13 @@ static umode_t aspm_ctrl_attrs_are_visible(struct kobject *kobj,
 		ASPM_STATE_L1_2_PCIPM,
 	};
 
-	if (aspm_disabled || !link)
+	if (aspm_disabled || !pdev)
 		return 0;
 
 	if (n == 0)
 		return pdev->clkpm_capable ? a->mode : 0;
 
-	return link->aspm_capable & aspm_state_map[n - 1] ? a->mode : 0;
+	return pdev->aspm_capable & aspm_state_map[n - 1] ? a->mode : 0;
 }
 
 const struct attribute_group aspm_ctrl_attr_group = {
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
