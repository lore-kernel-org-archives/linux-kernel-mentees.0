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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C221C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E58C2078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgudLSRd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E58C2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0FF47883C9;
	Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mIjT8QZY-5Uw; Sat, 22 Aug 2020 21:04:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4C7CA883CB;
	Sat, 22 Aug 2020 21:04:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B7D7C089F;
	Sat, 22 Aug 2020 21:04:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 032A5C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E79A82050A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHz6uIaeL5zf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 37AF52076B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p14so4959798wmg.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F2IpI55YekRxtMyB8KuDI2X1fQ94JZldeqC/RK+OTRY=;
 b=lgudLSRdEfJhborr9PR36GP6TasPLJwxzS0keYHvVNalEKNkG7ZCGDk/IDtzAI3CfV
 u2eqPB0SO4EvLvUNV6Ngk6qju7LgGTmyUHWaKv13/hbg/2F9JqgZlvgaeuI8GVRcxega
 TC/EDC2lUx4cvx01Fy2m3L4wgOcwBUWqHZIoTqzwCoSH0JWsp7/p9VUU9DeEmSgxJxeT
 AqQhj593AlWrdeTIb8C7EsDAAmq9G+ZCBqEsWWa4VwCbd6yQKhBGaODkrqZW1xi2cf5V
 ZoWfJeW6Qf7GfiUHMP5R0PsTScJAUyWcmwYUK+9fLtHpIQmuv1t9CO0raJ8R0jb+mmgS
 OEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F2IpI55YekRxtMyB8KuDI2X1fQ94JZldeqC/RK+OTRY=;
 b=fBG+D4t5zneT3MawYGH0w8HJjbF9OpR+egm6UqOceym391Z0SiyCIfu3eFmnPszPJR
 xKGK/f1X5DS/tTTVosccFKY64CIdv1suQ+CnKiHraI/qkWwVZH7VoYi/vJ8SqcOMkNG8
 0i6PjQCq4Ulpv7tBF3XbyLiLjGX8vUo/8LH6ZY0Y+toIWr3mhZGvvq45ZiZyz+xqnsNj
 ntYCRh8aw5liCdDAmsjhVEPu1Vewv12tkfx5AKjCOcazmKxKSHmfbxZ6l2ts1Ui2H5PL
 /zsq+rDvH1Jm+zx6Mao5vJF8eM9SAxWEe7aUHjDblDctrhwRnFLDNpfELrBKnpusumR4
 t8CQ==
X-Gm-Message-State: AOAM531Cy6gW1TMCA9/4QltRG10CIfGa2RBzk9YLV+hMuUhk30gbBG0B
 9Z+vllhFRmIRivLBMPfWfhc=
X-Google-Smtp-Source: ABdhPJwXo12aMrA0KfyfUJ1MfSriuUm/0NFy34QUVPBgc/cqICn69rRNlRsko05GKERvjk2U3hlL9g==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr9246106wml.126.1598130232546; 
 Sat, 22 Aug 2020 14:03:52 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:51 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:50 +0200
Message-Id: <20200822200358.252967-16-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 15/23] PCI: Replace
	pcie_link_state based device list with a pci_dev one
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

 - Replace existing pcie_link_state based device list with one
   based on struct pci_dev one.
 - Remove initialisation and declaration of existing list.
 - Replace pcie_link_state.sibling with pci_dev.sibling.
 - Remove pcie_link_state.sibling.

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 6f73eb2ca0bd..9ca06f00e98d 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -46,7 +46,6 @@ struct pcie_link_state {
 	struct pci_dev *downstream;	/* Downstream component, function 0 */
 	struct pcie_link_state *root;	/* pointer to the root port link */
 	struct pcie_link_state *parent;	/* pointer to the parent Link state */
-	struct list_head sibling;	/* node in link_list */
 
 	/* ASPM state */
 	u32 aspm_support:7;		/* Supported ASPM state */
@@ -74,7 +73,6 @@ struct pcie_link_state {
 static int aspm_disabled, aspm_force;
 static bool aspm_support_enabled = true;
 static DEFINE_MUTEX(aspm_lock);
-static LIST_HEAD(link_list);
 static LIST_HEAD(pdev_link_list);
 
 #define POLICY_DEFAULT 0	/* BIOS default setting */
@@ -856,7 +854,6 @@ static int alloc_pcie_link_state(struct pci_dev *pdev)
 	if (!link)
 		return -1;
 
-	INIT_LIST_HEAD(&link->sibling);
 	INIT_LIST_HEAD(&pdev->sibling);
 	link->pdev = pdev;
 	link->downstream = pci_function_0(pdev->subordinate);
@@ -889,7 +886,6 @@ static int alloc_pcie_link_state(struct pci_dev *pdev)
 		pdev->root = pdev->parent->root;
 	}
 
-	list_add(&link->sibling, &link_list);
 	list_add(&pdev->sibling, &pdev_link_list);
 	pdev->link_state = link;
 	return 0;
@@ -975,20 +971,19 @@ void pcie_aspm_init_link_state(struct pci_dev *pdev)
 }
 
 /* Recheck latencies and update aspm_capable for links under the root */
-static void pcie_update_aspm_capable(struct pci_dev *root_pdev)
+static void pcie_update_aspm_capable(struct pci_dev *root)
 {
-	struct pcie_link_state *root = root_pdev->link_state;
-	struct pcie_link_state *link;
+	struct pci_dev *link;
+
 	BUG_ON(root->parent);
-	list_for_each_entry(link, &link_list, sibling) {
+	list_for_each_entry(link, &pdev_link_list, sibling) {
 		if (link->root != root)
 			continue;
 		link->aspm_capable = link->aspm_support;
-		link->pdev->aspm_capable = link->aspm_support;
 	}
-	list_for_each_entry(link, &link_list, sibling) {
+	list_for_each_entry(link, &pdev_link_list, sibling) {
 		struct pci_dev *child;
-		struct pci_bus *linkbus = link->pdev->subordinate;
+		struct pci_bus *linkbus = link->subordinate;
 		if (link->root != root)
 			continue;
 		list_for_each_entry(child, &linkbus->devices, bus_list) {
@@ -1024,7 +1019,7 @@ void pcie_aspm_exit_link_state(struct pci_dev *pdev)
 
 	/* All functions are removed, so just disable ASPM for the link */
 	pcie_config_aspm_link(parent, 0);
-	list_del(&link->sibling);
+	list_del(&link->pdev->sibling);
 	/* Clock PM is for endpoint device */
 	free_link_state(parent);
 
@@ -1177,7 +1172,7 @@ static int pcie_aspm_set_policy(const char *val,
 				const struct kernel_param *kp)
 {
 	int i;
-	struct pcie_link_state *link;
+	struct pci_dev *link;
 
 	if (aspm_disabled)
 		return -EPERM;
@@ -1190,9 +1185,9 @@ static int pcie_aspm_set_policy(const char *val,
 	down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
 	aspm_policy = i;
-	list_for_each_entry(link, &link_list, sibling) {
-		pcie_config_aspm_link(link->pdev, policy_to_aspm_state(link->pdev));
-		pcie_set_clkpm(link->pdev, policy_to_clkpm_state(link->pdev));
+	list_for_each_entry(link, &pdev_link_list, sibling) {
+		pcie_config_aspm_link(link, policy_to_aspm_state(link));
+		pcie_set_clkpm(link, policy_to_clkpm_state(link));
 	}
 	mutex_unlock(&aspm_lock);
 	up_read(&pci_bus_sem);
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
