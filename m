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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2F7C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F34C62086A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iz7E9olZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F34C62086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D75C8883B8;
	Sat, 22 Aug 2020 21:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZ7B+7sDt5gz; Sat, 22 Aug 2020 21:04:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE386883C1;
	Sat, 22 Aug 2020 21:04:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA4AAC07FF;
	Sat, 22 Aug 2020 21:04:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EDB4C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0D3DC883DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09CprSTHYfzy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 38709883B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:05 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id k20so4887268wmi.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OGI0/v9nKgvY+65XwvUyPRmmeITg8LFwHVHRVWyD68U=;
 b=Iz7E9olZS2I3cCJklTlc9sQs3GtpDt5XVU6WE6AyYEomdEh1qr+9bm7HLW4oCz9Idp
 xzr5SHo8THU2o/b2Xrq7WPy3tUrnhGT6KDovafVxwSZ8n1OuX/P+M//87vm9l5RNE2Nx
 p0gBGKo3Z1zZqWGHU1MgqtUojTLcCkn3B8ul7jJY2Od6rBm78v3wX8hO8tDeGlBMWCIk
 tFQkRju5aBScejYfqW7doaB65rS+/WjF69VAvcubzYxQTFw0quVOKDhG6ikR4pG6Xzox
 UjpYkk0J/igtLIgzDB0Kmhtmz22qQImR7eUjsGoV9a0Y+wL+zYNZqW/CDMkfMcSAXtK+
 rbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OGI0/v9nKgvY+65XwvUyPRmmeITg8LFwHVHRVWyD68U=;
 b=SnUGOYnCK1NQ6ajhZXrhHCNiXzGK1jIrrMzdE/2JNUok+3xVie1UHnbmUpp4gwL6Ws
 BO2SRgaL4aAuOw2W0eRfGTOatCRwjQVm2T2cHSat9gkux38lxjWyKNUQWMmsSFTUhwCx
 buyf3kDxB4e9v8Jxrmof4VMNr2pJxWLSUXf1THnTPRczXaOsHqs3zbyK+AsqS6l9GZNu
 S/o8iF6oAUmNTJYfo7D99Z8oSn5Ssyhlz7GQBEfabuTbzQBItOYCvt7q/ZC/V6v6vUx/
 LaLzJvwdm8pMQZCtTFgr4fXbqP2SdKsOl3QXI82kjg0biUKLTRPdBmWaTvpBrTHcpCTa
 hiZw==
X-Gm-Message-State: AOAM5324FeluuYoCJ56tDho8fBzDO7wrDeZZs9KW/0DkGcaqgpI5mmor
 L21PYohADq4APjkQAXUdDYE=
X-Google-Smtp-Source: ABdhPJyA9EtRVHlyT3hDV+8NYDJMX4hQIpIAbOAofABgxO8FLHmP+crkMauwAqBvzhBFKN6tDinYnw==
X-Received: by 2002:a7b:c384:: with SMTP id s4mr9256790wmj.138.1598130243380; 
 Sat, 22 Aug 2020 14:04:03 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:04:02 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:57 +0200
Message-Id: <20200822200358.252967-23-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 22/23] PCI: Remove .pdev from
	struct pcie_link_state
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

 - Remove initiations of pcie_link_state.pdev
 - Replace all access to pcie_link_state.pdev with pci_pdev.pdev
 - Remove pcie_link_state.pdev
 - Fix bug if(!alloc_pcie_link_state())

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 137 +++++++++++++++-------------------------
 1 file changed, 52 insertions(+), 85 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index dd21c17296d7..2fc2b958e6d2 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -42,7 +42,6 @@
 				 ASPM_STATE_L1SS)
 
 struct pcie_link_state {
-	struct pci_dev *pdev;		/* Upstream component of the Link */
 };
 
 static int aspm_disabled, aspm_force;
@@ -110,21 +109,19 @@ static int policy_to_clkpm_state(struct pci_dev *pdev)
 
 static void pcie_set_clkpm_nocheck(struct pci_dev *pdev, int enable)
 {
-	struct pcie_link_state *link = pdev->link_state;
 	struct pci_dev *child;
-	struct pci_bus *linkbus = link->pdev->subordinate;
+	struct pci_bus *linkbus = pdev->subordinate;
 	u32 val = enable ? PCI_EXP_LNKCTL_CLKREQ_EN : 0;
 
 	list_for_each_entry(child, &linkbus->devices, bus_list)
 		pcie_capability_clear_and_set_word(child, PCI_EXP_LNKCTL,
 						   PCI_EXP_LNKCTL_CLKREQ_EN,
 						   val);
-	link->pdev->clkpm_enabled = !!enable;
+	pdev->clkpm_enabled = !!enable;
 }
 
 static void pcie_set_clkpm(struct pci_dev *pdev, int enable)
 {
-	struct pcie_link_state *link = pdev->link_state;
 	/*
 	 * Don't enable Clock PM if the link is not Clock PM capable
 	 * or Clock PM is disabled
@@ -134,16 +131,15 @@ static void pcie_set_clkpm(struct pci_dev *pdev, int enable)
 	/* Need nothing if the specified equals to current state */
 	if (pdev->clkpm_enabled == enable)
 		return;
-	pcie_set_clkpm_nocheck(link->pdev, enable);
+	pcie_set_clkpm_nocheck(pdev, enable);
 }
 
 static void pcie_clkpm_cap_init(struct pci_dev *pdev, int blacklist)
 {
-	struct pcie_link_state *link = pdev->link_state;
 	int capable = 1, enabled = 1;
 	u16 reg16;
 	struct pci_dev *child;
-	struct pci_bus *linkbus = link->pdev->subordinate;
+	struct pci_bus *linkbus = pdev->subordinate;
 
 	/* All functions should have the same cap and state, take the worst */
 	list_for_each_entry(child, &linkbus->devices, bus_list) {
@@ -156,10 +152,10 @@ static void pcie_clkpm_cap_init(struct pci_dev *pdev, int blacklist)
 		if (!(reg16 & PCI_EXP_LNKCTL_CLKREQ_EN))
 			enabled = 0;
 	}
-	link->pdev->clkpm_enabled = enabled;
-	link->pdev->clkpm_default = enabled;
-	link->pdev->clkpm_capable = capable;
-	link->pdev->clkpm_disable = blacklist ? 1 : 0;
+	pdev->clkpm_enabled = enabled;
+	pdev->clkpm_default = enabled;
+	pdev->clkpm_capable = capable;
+	pdev->clkpm_disable = blacklist ? 1 : 0;
 }
 
 static bool pcie_retrain_link(struct pci_dev *parent)
@@ -349,7 +345,6 @@ static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 {
 	u32 latency, l1_switch_latency = 0;
 	struct aspm_latency *acceptable;
-	struct pcie_link_state *link;
 	struct pci_dev *pdev;
 
 	/* Device not in D0 doesn't need latency check */
@@ -357,19 +352,18 @@ static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 	    (endpoint->current_state != PCI_UNKNOWN))
 		return;
 
-	link = endpoint->bus->self->link_state;
 	pdev = endpoint->bus->self;
-	acceptable = &link->pdev->acceptable[PCI_FUNC(endpoint->devfn)];
+	acceptable = &pdev->acceptable[PCI_FUNC(endpoint->devfn)];
 
-	while (link) {
+	while (pdev) {
 		/* Check upstream direction L0s latency */
-		if ((link->pdev->aspm_capable & ASPM_STATE_L0S_UP) &&
-		    (link->pdev->latency_up.l0s > acceptable->l0s))
+		if ((pdev->aspm_capable & ASPM_STATE_L0S_UP) &&
+		    (pdev->latency_up.l0s > acceptable->l0s))
 			pdev->aspm_capable &= ~ASPM_STATE_L0S_UP;
 
 		/* Check downstream direction L0s latency */
-		if ((link->pdev->aspm_capable & ASPM_STATE_L0S_DW) &&
-		    (link->pdev->latency_dw.l0s > acceptable->l0s))
+		if ((pdev->aspm_capable & ASPM_STATE_L0S_DW) &&
+		    (pdev->latency_dw.l0s > acceptable->l0s))
 			pdev->aspm_capable &= ~ASPM_STATE_L0S_DW;
 
 		/*
@@ -385,9 +379,8 @@ static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 		 * L1 exit latencies advertised by a device include L1
 		 * substate latencies (and hence do not do any check).
 		 */
-		latency = max_t(u32, link->pdev->latency_up.l1,
-						link->pdev->latency_dw.l1);
-		if ((link->pdev->aspm_capable & ASPM_STATE_L1) &&
+		latency = max_t(u32, pdev->latency_up.l1, pdev->latency_dw.l1);
+		if ((pdev->aspm_capable & ASPM_STATE_L1) &&
 		    (latency + l1_switch_latency > acceptable->l1))
 			pdev->aspm_capable &= ~ASPM_STATE_L1;
 
@@ -412,16 +405,14 @@ static struct pci_dev *pci_function_0(struct pci_bus *linkbus)
 }
 
 /* Calculate L1.2 PM substate timing parameters */
-static void aspm_calc_l1ss_ctl_values(struct pci_dev *pdev,
+static void aspm_calc_l1ss_ctl_values(struct pci_dev *up_pdev,
 						u32 *ctl1, u32 *ctl2)
 {
-	struct pcie_link_state *link = pdev->link_state;
 	u32 val1, val2, scale1, scale2;
 	u32 t_common_mode, t_power_on, l1_2_threshold, scale, value;
-	struct pci_dev *dw_pdev = link->pdev->downstream;
-	struct pci_dev *up_pdev = link->pdev;
+	struct pci_dev *dw_pdev = up_pdev->downstream;
 
-	if (!(link->pdev->aspm_support & ASPM_STATE_L1_2_MASK))
+	if (!(up_pdev->aspm_support & ASPM_STATE_L1_2_MASK))
 		return;
 
 	/* Choose the greater of the two Port Common_Mode_Restore_Times */
@@ -467,10 +458,9 @@ static u32 get_aspm_enable(struct pci_dev *pdev)
 	return (reg16 & PCI_EXP_LNKCTL_ASPMC);
 }
 
-static void pcie_aspm_cap_init(struct pci_dev *pdev, int blacklist)
+static void pcie_aspm_cap_init(struct pci_dev *parent, int blacklist)
 {
-	struct pcie_link_state *link = pdev->link_state;
-	struct pci_dev *child = link->pdev->downstream, *parent = link->pdev;
+	struct pci_dev *child = parent->downstream;
 	struct pci_bus *linkbus = parent->subordinate;
 	u32 up_l1ss_ctl1, dw_l1ss_ctl1;
 
@@ -590,11 +580,10 @@ static void pci_clear_and_set_dword(struct pci_dev *pdev, int pos,
 }
 
 /* Configure the ASPM L1 substates */
-static void pcie_config_aspm_l1ss(struct pci_dev *pdev, u32 state)
+static void pcie_config_aspm_l1ss(struct pci_dev *parent, u32 state)
 {
-	struct pcie_link_state *link = pdev->link_state;
 	u32 val, enable_req, ctl1, ctl2;
-	struct pci_dev *child = link->pdev->downstream, *parent = link->pdev;
+	struct pci_dev *child = parent->downstream;
 	int up_cap_ptr = parent->l1ss_cap_ptr;
 	int dw_cap_ptr = child->l1ss_cap_ptr;
 
@@ -674,15 +663,14 @@ static void pcie_config_aspm_dev(struct pci_dev *pdev, u32 val)
 					   PCI_EXP_LNKCTL_ASPMC, val);
 }
 
-static void pcie_config_aspm_link(struct pci_dev *pdev, u32 state)
+static void pcie_config_aspm_link(struct pci_dev *parent, u32 state)
 {
-	struct pcie_link_state *link = pdev->link_state;
 	u32 upstream = 0, dwstream = 0;
-	struct pci_dev *child = link->pdev->downstream, *parent = link->pdev;
+	struct pci_dev *child = parent->downstream;
 	struct pci_bus *linkbus = parent->subordinate;
 
 	/* Enable only the states that were not explicitly disabled */
-	state &= (link->pdev->aspm_capable & ~link->pdev->aspm_disable);
+	state &= (parent->aspm_capable & ~parent->aspm_disable);
 
 	/* Can't enable any substates if L1 is not enabled */
 	if (!(state & ASPM_STATE_L1))
@@ -691,11 +679,11 @@ static void pcie_config_aspm_link(struct pci_dev *pdev, u32 state)
 	/* Spec says both ports must be in D0 before enabling PCI PM substates*/
 	if (parent->current_state != PCI_D0 || child->current_state != PCI_D0) {
 		state &= ~ASPM_STATE_L1_SS_PCIPM;
-		state |= (link->pdev->aspm_enabled & ASPM_STATE_L1_SS_PCIPM);
+		state |= (parent->aspm_enabled & ASPM_STATE_L1_SS_PCIPM);
 	}
 
 	/* Nothing to do if the link is already in the requested state */
-	if (link->pdev->aspm_enabled == state)
+	if (parent->aspm_enabled == state)
 		return;
 	/* Convert ASPM state to upstream/downstream ASPM register state */
 	if (state & ASPM_STATE_L0S_UP)
@@ -707,7 +695,7 @@ static void pcie_config_aspm_link(struct pci_dev *pdev, u32 state)
 		dwstream |= PCI_EXP_LNKCTL_ASPM_L1;
 	}
 
-	if (link->pdev->aspm_capable & ASPM_STATE_L1SS)
+	if (parent->aspm_capable & ASPM_STATE_L1SS)
 		pcie_config_aspm_l1ss(parent, state);
 
 	/*
@@ -777,15 +765,7 @@ static int pcie_aspm_sanity_check(struct pci_dev *pdev)
 
 static int alloc_pcie_link_state(struct pci_dev *pdev)
 {
-	struct pcie_link_state *link;
-
-	link = kzalloc(sizeof(*link), GFP_KERNEL);
-	if (!link)
-		return -1;
-
 	INIT_LIST_HEAD(&pdev->sibling);
-	link->pdev = pdev;
-	pdev->downstream = pci_function_0(pdev->subordinate);
 
 	/*
 	 * Root Ports and PCI/PCI-X to PCIe Bridges are roots of PCIe
@@ -799,17 +779,15 @@ static int alloc_pcie_link_state(struct pci_dev *pdev)
 	    !pdev->bus->parent->self) {
 		pdev->root = pdev;
 	} else {
-		if (!pdev->bus->parent->self) {
-			kfree(link);
+		if (!pdev->bus->parent->self)
 			return -1;
-		}
 
 		pdev->parent = pdev->bus->parent->self;
 		pdev->root = pdev->parent->root;
 	}
 
+	pdev->downstream = pci_function_0(pdev->subordinate);
 	list_add(&pdev->sibling, &pdev_link_list);
-	pdev->link_state = link;
 	return 0;
 }
 
@@ -828,13 +806,13 @@ static void pcie_aspm_update_sysfs_visibility(struct pci_dev *pdev)
  */
 void pcie_aspm_init_link_state(struct pci_dev *pdev)
 {
-	struct pcie_link_state *link;
 	int blacklist = !!pcie_aspm_sanity_check(pdev);
 
 	if (!aspm_support_enabled)
 		return;
 
-	if (pdev->link_state)
+	if (pdev->downstream)
+	    /* Initialised already */
 		return;
 
 	/*
@@ -855,20 +833,18 @@ void pcie_aspm_init_link_state(struct pci_dev *pdev)
 		goto out;
 
 	mutex_lock(&aspm_lock);
-	if (!(alloc_pcie_link_state(pdev)))
+	if (alloc_pcie_link_state(pdev))
 		goto unlock;
 
-	link = pdev->link_state;
-
 	/*
 	 * Setup initial ASPM state. Note that we need to configure
 	 * upstream links also because capable state of them can be
 	 * update through pcie_aspm_cap_init().
 	 */
-	pcie_aspm_cap_init(link->pdev, blacklist);
+	pcie_aspm_cap_init(pdev, blacklist);
 
 	/* Setup initial Clock PM state */
-	pcie_clkpm_cap_init(link->pdev, blacklist);
+	pcie_clkpm_cap_init(pdev, blacklist);
 
 	/*
 	 * At this stage drivers haven't had an opportunity to change the
@@ -880,8 +856,8 @@ void pcie_aspm_init_link_state(struct pci_dev *pdev)
 	 */
 	if (aspm_policy != POLICY_POWERSAVE &&
 	    aspm_policy != POLICY_POWER_SUPERSAVE) {
-		pcie_config_aspm_path(link->pdev);
-		pcie_set_clkpm(link->pdev, policy_to_clkpm_state(link->pdev));
+		pcie_config_aspm_path(pdev);
+		pcie_set_clkpm(pdev, policy_to_clkpm_state(pdev));
 	}
 
 	pcie_aspm_update_sysfs_visibility(pdev);
@@ -921,9 +897,8 @@ static void pcie_update_aspm_capable(struct pci_dev *root)
 void pcie_aspm_exit_link_state(struct pci_dev *pdev)
 {
 	struct pci_dev *parent = pdev->bus->self;
-	struct pcie_link_state *link, *root, *parent_link;
 
-	if (!parent || !parent->link_state)
+	if (!parent)
 		return;
 
 	down_read(&pci_bus_sem);
@@ -935,20 +910,16 @@ void pcie_aspm_exit_link_state(struct pci_dev *pdev)
 	if (!list_empty(&parent->subordinate->devices))
 		goto out;
 
-	link = parent->link_state;
-	root = link->pdev->root->link_state;
-	parent_link = link->pdev->parent->link_state;
-
 	/* All functions are removed, so just disable ASPM for the link */
 	pcie_config_aspm_link(parent, 0);
-	list_del(&link->pdev->sibling);
+	list_del(&parent->sibling);
 	/* Clock PM is for endpoint device */
 	free_link_state(parent);
 
 	/* Recheck latencies and configure upstream links */
-	if (parent_link) {
-		pcie_update_aspm_capable(root->pdev);
-		pcie_config_aspm_path(parent_link->pdev);
+	if (parent->parent) {
+		pcie_update_aspm_capable(parent->root);
+		pcie_config_aspm_path(parent->parent);
 	}
 out:
 	mutex_unlock(&aspm_lock);
@@ -1008,9 +979,8 @@ static struct pci_dev *pcie_aspm_get_link(struct pci_dev *pdev)
 static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 {
 	struct pci_dev *bridge = pcie_aspm_get_link(pdev);
-	struct pcie_link_state *link = bridge->link_state;
 
-	if (!link)
+	if (!bridge)
 		return -EINVAL;
 	/*
 	 * A driver requested that ASPM be disabled on this device, but
@@ -1042,12 +1012,12 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 	if (state & PCIE_LINK_STATE_L1_2_PCIPM)
 		bridge->aspm_disable |= ASPM_STATE_L1_2_PCIPM;
 
-	pcie_config_aspm_link(link->pdev, policy_to_aspm_state(link->pdev));
+	pcie_config_aspm_link(bridge, policy_to_aspm_state(bridge));
 
-	if (state & PCIE_LINK_STATE_CLKPM) {
+	if (state & PCIE_LINK_STATE_CLKPM)
 		bridge->clkpm_disable = 1;
-	}
-	pcie_set_clkpm(link->pdev, policy_to_clkpm_state(link->pdev));
+
+	pcie_set_clkpm(bridge, policy_to_clkpm_state(bridge));
 	mutex_unlock(&aspm_lock);
 	if (sem)
 		up_read(&pci_bus_sem);
@@ -1150,9 +1120,7 @@ static ssize_t aspm_attr_store_common(struct device *dev,
 				      struct device_attribute *attr,
 				      const char *buf, size_t len, u8 state)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pci_dev *bridge = pcie_aspm_get_link(pdev);
-	struct pcie_link_state *link = bridge->link_state;
+	struct pci_dev *bridge = pcie_aspm_get_link(to_pci_dev(dev));
 	bool state_enable;
 
 	if (strtobool(buf, &state_enable) < 0)
@@ -1169,7 +1137,7 @@ static ssize_t aspm_attr_store_common(struct device *dev,
 	} else
 		bridge->aspm_disable |= state;
 
-	pcie_config_aspm_link(link->pdev, policy_to_aspm_state(link->pdev));
+	pcie_config_aspm_link(bridge, policy_to_aspm_state(bridge));
 
 	mutex_unlock(&aspm_lock);
 	up_read(&pci_bus_sem);
@@ -1207,7 +1175,6 @@ static ssize_t clkpm_store(struct device *dev,
 			   const char *buf, size_t len)
 {
 	struct pci_dev *pdev = pcie_aspm_get_link(to_pci_dev(dev));
-	struct pcie_link_state *link = pdev->link_state;
 	bool state_enable;
 
 	if (strtobool(buf, &state_enable) < 0)
@@ -1216,8 +1183,8 @@ static ssize_t clkpm_store(struct device *dev,
 	down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
 
-	link->pdev->clkpm_disable = !state_enable;
-	pcie_set_clkpm(link->pdev, policy_to_clkpm_state(link->pdev));
+	pdev->clkpm_disable = !state_enable;
+	pcie_set_clkpm(pdev, policy_to_clkpm_state(pdev));
 
 	mutex_unlock(&aspm_lock);
 	up_read(&pci_bus_sem);
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
