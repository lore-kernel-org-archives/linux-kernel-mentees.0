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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9E8C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BA8E2078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNBX9fhF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BA8E2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2025685F8E;
	Sat, 22 Aug 2020 21:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YoB9X1VL8Ce; Sat, 22 Aug 2020 21:03:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 04D6F84E49;
	Sat, 22 Aug 2020 21:03:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 017F7C07FF;
	Sat, 22 Aug 2020 21:03:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7AA9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A5325883CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vYgkeisbeXlb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DDCC6883E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:53 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c19so3509953wmd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yL+Ff6dQBH298D+wBeVGXjcKqNG2r4mNBQ64eQjDT0w=;
 b=JNBX9fhFmOB5Bw5sWTOg1V9O8jHW75Mq8k2WkwCjbdrwuF40ad53ls412TQGI3jKwO
 xDb8OzxRDVWKdA9oCXP8uEtXP8CRYPt3wxXmERCOSLpwWT80Y3IQFVHNJKRB3oyAxkwH
 U1R3PczU8VY5M5BqrWTqnZo9OEoP49UkLTHr4CEhvCj7sGiVcMjXppmLj7OtebZl4zos
 8mg6/Xn1/+8qPPncN1ZzILRHYZ2xBagU0W1OvaXsj2+Br2rL6JZ/UWt6NrIeAVA8gz5q
 NKNh8razFAmyMY7qsJbXrvvDo5PRXcQf6CO2id2mcoBX85BeCy+qxzMJQyc9NCGfF68j
 qGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yL+Ff6dQBH298D+wBeVGXjcKqNG2r4mNBQ64eQjDT0w=;
 b=QD43EVgaxMqhSqegp5zbA7VBK4xWOeW8gyV6Op5DUliEd+kqL0rTC1XO1bQpl6Bo47
 QuNcdPe2H9vhJ9JVby4yOCe72ekz0vjTIjmDa5YrltqvOBEIde4Vfvp0lQzTH8m6F1ar
 U/+atcdQbSA/GtVHZEV/bgMXe/wxaNc2X3Op/GxCPvekmi1BLryuJ2GLv8INU6YKq0cQ
 U1ZCg0z8nGWVB/NwWuSoRt4ykLr88ctAqPuFHklinGEHs+auo3/mfVg4UMsIAnRWWSXX
 KAIpvLyuhmZJjgcwoihZYvofSYV6h1aCnGHUSfJQaxFsuslv8+1Q1CuuFqbpdLjOMtR4
 OlLw==
X-Gm-Message-State: AOAM532HxDx6bII4huknDgqadamavoxYNMTloiLdExJbJfkCgrjmu7Lq
 BxlqaNrDhtPvLzKhJfUTN0Y=
X-Google-Smtp-Source: ABdhPJxJFUnkBVCyu4U8gYSFcpDGAeSft1G/F8HVsjSrJhVqqE7nEacaUN8dM6nj7dGuMANS2y6LYw==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr3708501wmj.154.1598130231271; 
 Sat, 22 Aug 2020 14:03:51 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:50 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:49 +0200
Message-Id: <20200822200358.252967-15-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 14/23] PCI: Change Return and
	Argument values from pcie_link_state to pci_dev
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

 - Change Return and Argument values from pcie_link_state to pci_dev
 - Refactor callers accordingly

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 145 +++++++++++++++++++++-------------------
 1 file changed, 76 insertions(+), 69 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index e869e7faaac5..6f73eb2ca0bd 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -101,7 +101,7 @@ static const char *policy_str[] = {
 
 #define LINK_RETRAIN_TIMEOUT HZ
 
-static int policy_to_aspm_state(struct pcie_link_state *link)
+static int policy_to_aspm_state(struct pci_dev *pdev)
 {
 	switch (aspm_policy) {
 	case POLICY_PERFORMANCE:
@@ -114,12 +114,12 @@ static int policy_to_aspm_state(struct pcie_link_state *link)
 		/* Enable Everything */
 		return ASPM_STATE_ALL;
 	case POLICY_DEFAULT:
-		return link->aspm_default;
+		return pdev->link_state->aspm_default;
 	}
 	return 0;
 }
 
-static int policy_to_clkpm_state(struct pcie_link_state *link)
+static int policy_to_clkpm_state(struct pci_dev *pdev)
 {
 	switch (aspm_policy) {
 	case POLICY_PERFORMANCE:
@@ -130,13 +130,14 @@ static int policy_to_clkpm_state(struct pcie_link_state *link)
 		/* Enable Clock PM */
 		return 1;
 	case POLICY_DEFAULT:
-		return link->clkpm_default;
+		return pdev->link_state->clkpm_default;
 	}
 	return 0;
 }
 
-static void pcie_set_clkpm_nocheck(struct pcie_link_state *link, int enable)
+static void pcie_set_clkpm_nocheck(struct pci_dev *pdev, int enable)
 {
+	struct pcie_link_state *link = pdev->link_state;
 	struct pci_dev *child;
 	struct pci_bus *linkbus = link->pdev->subordinate;
 	u32 val = enable ? PCI_EXP_LNKCTL_CLKREQ_EN : 0;
@@ -149,8 +150,9 @@ static void pcie_set_clkpm_nocheck(struct pcie_link_state *link, int enable)
 	link->pdev->clkpm_enabled = !!enable;
 }
 
-static void pcie_set_clkpm(struct pcie_link_state *link, int enable)
+static void pcie_set_clkpm(struct pci_dev *pdev, int enable)
 {
+	struct pcie_link_state *link = pdev->link_state;
 	/*
 	 * Don't enable Clock PM if the link is not Clock PM capable
 	 * or Clock PM is disabled
@@ -160,11 +162,12 @@ static void pcie_set_clkpm(struct pcie_link_state *link, int enable)
 	/* Need nothing if the specified equals to current state */
 	if (link->clkpm_enabled == enable)
 		return;
-	pcie_set_clkpm_nocheck(link, enable);
+	pcie_set_clkpm_nocheck(link->pdev, enable);
 }
 
-static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
+static void pcie_clkpm_cap_init(struct pci_dev *pdev, int blacklist)
 {
+	struct pcie_link_state *link = pdev->link_state;
 	int capable = 1, enabled = 1;
 	u16 reg16;
 	struct pci_dev *child;
@@ -191,9 +194,8 @@ static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
 	link->pdev->clkpm_disable = blacklist ? 1 : 0;
 }
 
-static bool pcie_retrain_link(struct pcie_link_state *link)
+static bool pcie_retrain_link(struct pci_dev *parent)
 {
-	struct pci_dev *parent = link->pdev;
 	unsigned long end_jiffies;
 	u16 reg16;
 
@@ -226,11 +228,11 @@ static bool pcie_retrain_link(struct pcie_link_state *link)
  *   could use common clock. If they are, configure them to use the
  *   common clock. That will reduce the ASPM state exit latency.
  */
-static void pcie_aspm_configure_common_clock(struct pcie_link_state *link)
+static void pcie_aspm_configure_common_clock(struct pci_dev *parent)
 {
 	int same_clock = 1;
 	u16 reg16, parent_reg, child_reg[8];
-	struct pci_dev *child, *parent = link->pdev;
+	struct pci_dev *child;
 	struct pci_bus *linkbus = parent->subordinate;
 	/*
 	 * All functions of a slot should have the same Slot Clock
@@ -287,7 +289,7 @@ static void pcie_aspm_configure_common_clock(struct pcie_link_state *link)
 		reg16 &= ~PCI_EXP_LNKCTL_CCC;
 	pcie_capability_write_word(parent, PCI_EXP_LNKCTL, reg16);
 
-	if (pcie_retrain_link(link))
+	if (pcie_retrain_link(parent))
 		return;
 
 	/* Training failed. Restore common clock configurations */
@@ -503,8 +505,9 @@ static u32 get_aspm_enable(struct pci_dev *pdev)
 	return (reg16 & PCI_EXP_LNKCTL_ASPMC);
 }
 
-static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
+static void pcie_aspm_cap_init(struct pci_dev *pdev, int blacklist)
 {
+	struct pcie_link_state *link = pdev->link_state;
 	struct pci_dev *child = link->downstream, *parent = link->pdev;
 	struct pci_bus *linkbus = parent->subordinate;
 	u32 up_l1ss_ctl1, dw_l1ss_ctl1;
@@ -527,7 +530,7 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 		return;
 
 	/* Configure common clock before checking latencies */
-	pcie_aspm_configure_common_clock(link);
+	pcie_aspm_configure_common_clock(parent);
 
 	pci_read_config_dword(parent, parent->l1ss_cap_ptr + PCI_L1SS_CTL1,
 				&up_l1ss_ctl1);
@@ -659,8 +662,9 @@ static void pci_clear_and_set_dword(struct pci_dev *pdev, int pos,
 }
 
 /* Configure the ASPM L1 substates */
-static void pcie_config_aspm_l1ss(struct pcie_link_state *link, u32 state)
+static void pcie_config_aspm_l1ss(struct pci_dev *pdev, u32 state)
 {
+	struct pcie_link_state *link = pdev->link_state;
 	u32 val, enable_req, ctl1, ctl2;
 	struct pci_dev *child = link->downstream, *parent = link->pdev;
 	int up_cap_ptr = parent->l1ss_cap_ptr;
@@ -742,8 +746,9 @@ static void pcie_config_aspm_dev(struct pci_dev *pdev, u32 val)
 					   PCI_EXP_LNKCTL_ASPMC, val);
 }
 
-static void pcie_config_aspm_link(struct pcie_link_state *link, u32 state)
+static void pcie_config_aspm_link(struct pci_dev *pdev, u32 state)
 {
+	struct pcie_link_state *link = pdev->link_state;
 	u32 upstream = 0, dwstream = 0;
 	struct pci_dev *child = link->downstream, *parent = link->pdev;
 	struct pci_bus *linkbus = parent->subordinate;
@@ -775,7 +780,7 @@ static void pcie_config_aspm_link(struct pcie_link_state *link, u32 state)
 	}
 
 	if (link->aspm_capable & ASPM_STATE_L1SS)
-		pcie_config_aspm_l1ss(link, state);
+		pcie_config_aspm_l1ss(parent, state);
 
 	/*
 	 * Spec 2.0 suggests all functions should be configured the
@@ -794,18 +799,18 @@ static void pcie_config_aspm_link(struct pcie_link_state *link, u32 state)
 	parent->aspm_enabled = state;
 }
 
-static void pcie_config_aspm_path(struct pcie_link_state *link)
+static void pcie_config_aspm_path(struct pci_dev *pdev)
 {
-	while (link) {
-		pcie_config_aspm_link(link, policy_to_aspm_state(link));
-		link = link->parent;
+	while (pdev) {
+		pcie_config_aspm_link(pdev, policy_to_aspm_state(pdev));
+		pdev = pdev->parent;
 	}
 }
 
-static void free_link_state(struct pcie_link_state *link)
+static void free_link_state(struct pci_dev *pdev)
 {
-	link->pdev->link_state = NULL;
-	kfree(link);
+	pdev->link_state = NULL;
+	kfree(pdev->link_state);
 }
 
 static int pcie_aspm_sanity_check(struct pci_dev *pdev)
@@ -843,13 +848,13 @@ static int pcie_aspm_sanity_check(struct pci_dev *pdev)
 	return 0;
 }
 
-static struct pcie_link_state *alloc_pcie_link_state(struct pci_dev *pdev)
+static int alloc_pcie_link_state(struct pci_dev *pdev)
 {
 	struct pcie_link_state *link;
 
 	link = kzalloc(sizeof(*link), GFP_KERNEL);
 	if (!link)
-		return NULL;
+		return -1;
 
 	INIT_LIST_HEAD(&link->sibling);
 	INIT_LIST_HEAD(&pdev->sibling);
@@ -875,7 +880,7 @@ static struct pcie_link_state *alloc_pcie_link_state(struct pci_dev *pdev)
 		parent = pdev->bus->parent->self->link_state;
 		if (!parent) {
 			kfree(link);
-			return NULL;
+			return -1;
 		}
 
 		link->parent = parent;
@@ -887,7 +892,7 @@ static struct pcie_link_state *alloc_pcie_link_state(struct pci_dev *pdev)
 	list_add(&link->sibling, &link_list);
 	list_add(&pdev->sibling, &pdev_link_list);
 	pdev->link_state = link;
-	return link;
+	return 0;
 }
 
 static void pcie_aspm_update_sysfs_visibility(struct pci_dev *pdev)
@@ -932,18 +937,20 @@ void pcie_aspm_init_link_state(struct pci_dev *pdev)
 		goto out;
 
 	mutex_lock(&aspm_lock);
-	link = alloc_pcie_link_state(pdev);
-	if (!link)
+	if (!(alloc_pcie_link_state(pdev)))
 		goto unlock;
+
+	link = pdev->link_state;
+
 	/*
 	 * Setup initial ASPM state. Note that we need to configure
 	 * upstream links also because capable state of them can be
 	 * update through pcie_aspm_cap_init().
 	 */
-	pcie_aspm_cap_init(link, blacklist);
+	pcie_aspm_cap_init(link->pdev, blacklist);
 
 	/* Setup initial Clock PM state */
-	pcie_clkpm_cap_init(link, blacklist);
+	pcie_clkpm_cap_init(link->pdev, blacklist);
 
 	/*
 	 * At this stage drivers haven't had an opportunity to change the
@@ -955,8 +962,8 @@ void pcie_aspm_init_link_state(struct pci_dev *pdev)
 	 */
 	if (aspm_policy != POLICY_POWERSAVE &&
 	    aspm_policy != POLICY_POWER_SUPERSAVE) {
-		pcie_config_aspm_path(link);
-		pcie_set_clkpm(link, policy_to_clkpm_state(link));
+		pcie_config_aspm_path(link->pdev);
+		pcie_set_clkpm(link->pdev, policy_to_clkpm_state(link->pdev));
 	}
 
 	pcie_aspm_update_sysfs_visibility(pdev);
@@ -968,8 +975,9 @@ void pcie_aspm_init_link_state(struct pci_dev *pdev)
 }
 
 /* Recheck latencies and update aspm_capable for links under the root */
-static void pcie_update_aspm_capable(struct pcie_link_state *root)
+static void pcie_update_aspm_capable(struct pci_dev *root_pdev)
 {
+	struct pcie_link_state *root = root_pdev->link_state;
 	struct pcie_link_state *link;
 	BUG_ON(root->parent);
 	list_for_each_entry(link, &link_list, sibling) {
@@ -1015,15 +1023,15 @@ void pcie_aspm_exit_link_state(struct pci_dev *pdev)
 	parent_link = link->parent;
 
 	/* All functions are removed, so just disable ASPM for the link */
-	pcie_config_aspm_link(link, 0);
+	pcie_config_aspm_link(parent, 0);
 	list_del(&link->sibling);
 	/* Clock PM is for endpoint device */
-	free_link_state(link);
+	free_link_state(parent);
 
 	/* Recheck latencies and configure upstream links */
 	if (parent_link) {
-		pcie_update_aspm_capable(root);
-		pcie_config_aspm_path(parent_link);
+		pcie_update_aspm_capable(root->pdev);
+		pcie_config_aspm_path(parent_link->pdev);
 	}
 out:
 	mutex_unlock(&aspm_lock);
@@ -1043,8 +1051,8 @@ void pcie_aspm_pm_state_change(struct pci_dev *pdev)
 	 */
 	down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
-	pcie_update_aspm_capable(link->root);
-	pcie_config_aspm_path(link);
+	pcie_update_aspm_capable(link->root->pdev);
+	pcie_config_aspm_path(pdev);
 	mutex_unlock(&aspm_lock);
 	up_read(&pci_bus_sem);
 }
@@ -1062,13 +1070,13 @@ void pcie_aspm_powersave_config_link(struct pci_dev *pdev)
 
 	down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
-	pcie_config_aspm_path(link);
-	pcie_set_clkpm(link, policy_to_clkpm_state(link));
+	pcie_config_aspm_path(pdev);
+	pcie_set_clkpm(pdev, policy_to_clkpm_state(pdev));
 	mutex_unlock(&aspm_lock);
 	up_read(&pci_bus_sem);
 }
 
-static struct pcie_link_state *pcie_aspm_get_link(struct pci_dev *pdev)
+static struct pci_dev *pcie_aspm_get_link(struct pci_dev *pdev)
 {
 	struct pci_dev *bridge;
 
@@ -1079,13 +1087,13 @@ static struct pcie_link_state *pcie_aspm_get_link(struct pci_dev *pdev)
 	if (!bridge || !pci_is_pcie(bridge))
 		return NULL;
 
-	return bridge->link_state;
+	return bridge;
 }
 
 static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 {
-	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
-	struct pci_dev *bridge = link->pdev;
+	struct pci_dev *bridge = pcie_aspm_get_link(pdev);
+	struct pcie_link_state *link = bridge->link_state;
 
 	if (!link)
 		return -EINVAL;
@@ -1130,13 +1138,13 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 		link->aspm_disable |= ASPM_STATE_L1_2_PCIPM;
 		bridge->aspm_disable |= ASPM_STATE_L1_2_PCIPM;
 	}
-	pcie_config_aspm_link(link, policy_to_aspm_state(link));
+	pcie_config_aspm_link(link->pdev, policy_to_aspm_state(link->pdev));
 
 	if (state & PCIE_LINK_STATE_CLKPM) {
 		link->clkpm_disable = 1;
 		bridge->clkpm_disable = 1;
 	}
-	pcie_set_clkpm(link, policy_to_clkpm_state(link));
+	pcie_set_clkpm(link->pdev, policy_to_clkpm_state(link->pdev));
 	mutex_unlock(&aspm_lock);
 	if (sem)
 		up_read(&pci_bus_sem);
@@ -1183,8 +1191,8 @@ static int pcie_aspm_set_policy(const char *val,
 	mutex_lock(&aspm_lock);
 	aspm_policy = i;
 	list_for_each_entry(link, &link_list, sibling) {
-		pcie_config_aspm_link(link, policy_to_aspm_state(link));
-		pcie_set_clkpm(link, policy_to_clkpm_state(link));
+		pcie_config_aspm_link(link->pdev, policy_to_aspm_state(link->pdev));
+		pcie_set_clkpm(link->pdev, policy_to_clkpm_state(link->pdev));
 	}
 	mutex_unlock(&aspm_lock);
 	up_read(&pci_bus_sem);
@@ -1216,12 +1224,12 @@ module_param_call(policy, pcie_aspm_set_policy, pcie_aspm_get_policy,
  */
 bool pcie_aspm_enabled(struct pci_dev *pdev)
 {
-	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
+	struct pci_dev *dev = pcie_aspm_get_link(pdev);
 
-	if (!link)
+	if (!dev)
 		return false;
 
-	return link->aspm_enabled;
+	return dev->link_state->aspm_enabled;
 }
 EXPORT_SYMBOL_GPL(pcie_aspm_enabled);
 
@@ -1229,10 +1237,10 @@ static ssize_t aspm_attr_show_common(struct device *dev,
 				     struct device_attribute *attr,
 				     char *buf, u8 state)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
+	struct pci_dev *pdev = pcie_aspm_get_link(to_pci_dev(dev));
 
-	return sprintf(buf, "%d\n", (link->aspm_enabled & state) ? 1 : 0);
+	return sprintf(buf, "%d\n",
+		(pdev->link_state->aspm_enabled & state) ? 1 : 0);
 }
 
 static ssize_t aspm_attr_store_common(struct device *dev,
@@ -1240,8 +1248,8 @@ static ssize_t aspm_attr_store_common(struct device *dev,
 				      const char *buf, size_t len, u8 state)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
-	struct pci_dev *bridge = link->pdev;
+	struct pci_dev *bridge = pcie_aspm_get_link(pdev);
+	struct pcie_link_state *link = bridge->link_state;
 	bool state_enable;
 
 	if (strtobool(buf, &state_enable) < 0)
@@ -1263,7 +1271,7 @@ static ssize_t aspm_attr_store_common(struct device *dev,
 		bridge->aspm_disable |= state;
 	}
 
-	pcie_config_aspm_link(link, policy_to_aspm_state(link));
+	pcie_config_aspm_link(link->pdev, policy_to_aspm_state(link->pdev));
 
 	mutex_unlock(&aspm_lock);
 	up_read(&pci_bus_sem);
@@ -1291,18 +1299,17 @@ ASPM_ATTR(l1_2_pcipm, L1_2_PCIPM)
 static ssize_t clkpm_show(struct device *dev,
 			  struct device_attribute *attr, char *buf)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
+	struct pci_dev *pdev = pcie_aspm_get_link(to_pci_dev(dev));
 
-	return sprintf(buf, "%d\n", link->clkpm_enabled);
+	return sprintf(buf, "%d\n", pdev->link_state->clkpm_enabled);
 }
 
 static ssize_t clkpm_store(struct device *dev,
 			   struct device_attribute *attr,
 			   const char *buf, size_t len)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
+	struct pci_dev *pdev = pcie_aspm_get_link(to_pci_dev(dev));
+	struct pcie_link_state *link = pdev->link_state;
 	bool state_enable;
 
 	if (strtobool(buf, &state_enable) < 0)
@@ -1313,7 +1320,7 @@ static ssize_t clkpm_store(struct device *dev,
 
 	link->clkpm_disable = !state_enable;
 	link->pdev->clkpm_disable = !state_enable;
-	pcie_set_clkpm(link, policy_to_clkpm_state(link));
+	pcie_set_clkpm(link->pdev, policy_to_clkpm_state(link->pdev));
 
 	mutex_unlock(&aspm_lock);
 	up_read(&pci_bus_sem);
@@ -1344,8 +1351,8 @@ static umode_t aspm_ctrl_attrs_are_visible(struct kobject *kobj,
 					   struct attribute *a, int n)
 {
 	struct device *dev = kobj_to_dev(kobj);
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
+	struct pci_dev *pdev = pcie_aspm_get_link(to_pci_dev(dev));
+	struct pcie_link_state *link = pdev->link_state;
 	static const u8 aspm_state_map[] = {
 		ASPM_STATE_L0S,
 		ASPM_STATE_L1,
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
