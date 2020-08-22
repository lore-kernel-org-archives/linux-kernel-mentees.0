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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27689C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F10712078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9C7EdsX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F10712078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C2DA6883E4;
	Sat, 22 Aug 2020 21:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQHa4OYxPgK0; Sat, 22 Aug 2020 21:04:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A6415883DC;
	Sat, 22 Aug 2020 21:04:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83B0DC088B;
	Sat, 22 Aug 2020 21:04:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67962C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 542DD87E3E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vq7aDZoEWA9O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6C76587E2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:02 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l2so5040104wrc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uQLAC8mkcMUaAURI2OWAN4BPz+HqMjBWRaiJCkPHLUY=;
 b=C9C7EdsXPPZMoiuQhnD7/kLa+6jQOYcWetL15ZE4QgWTzJ1xgL+3YLcCtIKTr+Xl+X
 R+twU7sbWxYHMswsg8xUC6WSC1jKTkRMMJAUpdBBCrUIMcbTQOB3AZV6VWtrDrbvuewN
 wAxB8G0OlTtN/mhw7rvggLonwmRCme4Xeh6xNb0hJGzeLZdxzVuTPRYrlFctpJnf8UBS
 IXv3I7IAqaVyLhNtFiFozBkQfptRiVqc5y5GMYctMLRkAmR1OSNE+x4GJeKGdqT7YF3J
 CnZa9nxp0ROl7NBDfZf+V13rCEuEEL2AGjh7S6f9HA4e08lSRfFlsKGRfYttQOoBtE+w
 VkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uQLAC8mkcMUaAURI2OWAN4BPz+HqMjBWRaiJCkPHLUY=;
 b=NfohsUNfig1DD8EnQj/jSaM/piUqJCO9nhZiOCdkFBY/OckaeMBQjcHnxnAVDgl5lM
 B64PR6rHG7gtJPvGgQBpmbkzkjMNcDhia4dKOno4EN8wKVaSiEDarULkaE02rVyZ5erK
 D27AkC5o3E1ngxSW3IyLEc95YOWkzkp54je3QWzTkp7czgqy3caXgsYQXYkq8DAeH9PE
 f8uuuuMLzydQD25ACt+sxqG+kKCNLDZiM0KACONQHcbFMjmRnSLOUpdaDAnkqyz0t+Rd
 dI+Vi2gBDoWWMgW6C4uhb/NMytOn1UqC5/xO7eaQK2D24zmbXfdXJ4uC37EWOnwkqhAS
 bShg==
X-Gm-Message-State: AOAM533KC7xlzOhexMf31jyLFFtvhA/FRSoGBKVl2QP+w4TG4VZGgMZb
 OdGkLgkK8FtgJsPeaw2Kr60=
X-Google-Smtp-Source: ABdhPJx9nX41R07xap7meSIyedJwUDMCWIFfDd+Ha27MCRnb0+ZMMPTsNn2JlJSO+yXBsTmk/RmZWQ==
X-Received: by 2002:adf:9463:: with SMTP id 90mr8103104wrq.223.1598130240946; 
 Sat, 22 Aug 2020 14:04:00 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:04:00 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:55 +0200
Message-Id: <20200822200358.252967-21-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 20/23] PCI: Remove .root from
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

 - Remove initiations of pcie_link_state.root
 - Replace all access to pcie_link_state.root with pci_pdev.root
 - Remove pcie_link_state.root
 - Do few cleanups

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 14b9da0a4efd..244b28534e7f 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -44,7 +44,6 @@
 struct pcie_link_state {
 	struct pci_dev *pdev;		/* Upstream component of the Link */
 	struct pci_dev *downstream;	/* Downstream component, function 0 */
-	struct pcie_link_state *root;	/* pointer to the root port link */
 };
 
 static int aspm_disabled, aspm_force;
@@ -800,18 +799,13 @@ static int alloc_pcie_link_state(struct pci_dev *pdev)
 	if (pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT ||
 	    pci_pcie_type(pdev) == PCI_EXP_TYPE_PCIE_BRIDGE ||
 	    !pdev->bus->parent->self) {
-		link->root = link;
 		pdev->root = pdev;
 	} else {
-		struct pcie_link_state *parent;
-
-		parent = pdev->bus->parent->self->link_state;
-		if (!parent) {
+		if (!pdev->bus->parent->self) {
 			kfree(link);
 			return -1;
 		}
 
-		link->root = link->pdev->parent->link_state->root;
 		pdev->parent = pdev->bus->parent->self;
 		pdev->root = pdev->parent->root;
 	}
@@ -944,7 +938,7 @@ void pcie_aspm_exit_link_state(struct pci_dev *pdev)
 		goto out;
 
 	link = parent->link_state;
-	root = link->root;
+	root = link->pdev->root->link_state;
 	parent_link = link->pdev->parent->link_state;
 
 	/* All functions are removed, so just disable ASPM for the link */
@@ -966,9 +960,7 @@ void pcie_aspm_exit_link_state(struct pci_dev *pdev)
 /* @pdev: the root port or switch downstream port */
 void pcie_aspm_pm_state_change(struct pci_dev *pdev)
 {
-	struct pcie_link_state *link = pdev->link_state;
-
-	if (aspm_disabled || !link)
+	if (aspm_disabled || !pdev)
 		return;
 	/*
 	 * Devices changed PM state, we should recheck if latency
@@ -976,7 +968,7 @@ void pcie_aspm_pm_state_change(struct pci_dev *pdev)
 	 */
 	down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
-	pcie_update_aspm_capable(link->root->pdev);
+	pcie_update_aspm_capable(pdev->root);
 	pcie_config_aspm_path(pdev);
 	mutex_unlock(&aspm_lock);
 	up_read(&pci_bus_sem);
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
