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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF59EC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4B552078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYQbuj31"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4B552078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 96D1F860B2;
	Sat, 22 Aug 2020 21:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYB3DssWkDEI; Sat, 22 Aug 2020 21:04:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0CAD086214;
	Sat, 22 Aug 2020 21:04:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDC83C089E;
	Sat, 22 Aug 2020 21:04:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B46FC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4553F883B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J94HHqb1CUf3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6B071883C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:06 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id k20so4887288wmi.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fwTvFFFBn1/sHjhdlaT0GWfyymonR0y9OpYLhHk591I=;
 b=hYQbuj31EO5nEFyKgCn8kQI1ChUKE4IxOcoLL7ipbpl98ZSGuvwyGEZPW0W1j5kiUl
 v+FhYurHKalyNGNF+lZSHhylQ0wx8Pcz1RuOnQrKhzF39lTMBviitBLvXFRuU5RteXNd
 ENnGupulpGd3savwT7QjwE18U/9CZ7UJBn/bjsmGDuqDaEODV2pRtJiuSaAxsYG6Czyu
 lL2uIRD7rdJIK6KKMjLIaPC9J+q+nL+ZEOMJuB8ds/vOA89GyYZnD1zT/HEgcYxfveca
 AInYDwifcfr+5iQmYkQkrrQLXooNxdM7vmlSRa/Jzl6ddqS8pK03wSs7WTCpcBk7sLe8
 IdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fwTvFFFBn1/sHjhdlaT0GWfyymonR0y9OpYLhHk591I=;
 b=DjPcum1TnPjVlGnR/6qOjs6jex7jdSDOqYtp5uO0zkpV5gXpEQaphv2ri+oP1JrA6O
 cSNTpuDtxbAUVObEvknaz3gwl+Pmt5MsF6cV3KeaBcNmCzqRUPhZ906278YSR1PsulFX
 GkBhY9KBLJOICuO3LbdYZFsszOHr0C80ANiUe0eVqEHHEdHZatjGWNACqxpsqXXIPD+o
 FAYHU/vWUaPqaY7RfcJ2o+ceWEwk2ypn+hBH63n4HfEWHzzrc4+V7Wy3S1bR9ohF1ZTi
 XCvQh+NWyGI/f9TlfV8ZhEJ1IDD3GDNcjZco9W3r9HI/PfPmhUJXQjQ2GnLQos42CUFx
 B3qQ==
X-Gm-Message-State: AOAM531YQ0e5AU1PtxzX4KTl2JHS/tJRrjbLwDOZiTamgZOu8VuynMBg
 EmJChjsjbxaZtjlbS8BpkrM=
X-Google-Smtp-Source: ABdhPJwYyB8kkDKeIDpPTyo9spvCAWbpJPBWJS95xeJ78KIlNTuByJeCDmkzSe5Jykz0UIzRdWCXlA==
X-Received: by 2002:a1c:6a03:: with SMTP id f3mr9349238wmc.181.1598130244741; 
 Sat, 22 Aug 2020 14:04:04 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:04:04 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:58 +0200
Message-Id: <20200822200358.252967-24-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 23/23] PCI: Remove struct
	pcie_link_state
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

 - Remove free_link_state() and all calls to it
 - Remove pci_dev.link_state
 - Remove remaining referenced to struct pcie_link_state
 - Remove struct pcie_link_state

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 15 +--------------
 include/linux/pci.h     |  2 --
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 2fc2b958e6d2..0330b10faa29 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -41,9 +41,6 @@
 #define ASPM_STATE_ALL		(ASPM_STATE_L0S | ASPM_STATE_L1 |	\
 				 ASPM_STATE_L1SS)
 
-struct pcie_link_state {
-};
-
 static int aspm_disabled, aspm_force;
 static bool aspm_support_enabled = true;
 static DEFINE_MUTEX(aspm_lock);
@@ -722,12 +719,6 @@ static void pcie_config_aspm_path(struct pci_dev *pdev)
 	}
 }
 
-static void free_link_state(struct pci_dev *pdev)
-{
-	pdev->link_state = NULL;
-	kfree(pdev->link_state);
-}
-
 static int pcie_aspm_sanity_check(struct pci_dev *pdev)
 {
 	struct pci_dev *child;
@@ -913,8 +904,6 @@ void pcie_aspm_exit_link_state(struct pci_dev *pdev)
 	/* All functions are removed, so just disable ASPM for the link */
 	pcie_config_aspm_link(parent, 0);
 	list_del(&parent->sibling);
-	/* Clock PM is for endpoint device */
-	free_link_state(parent);
 
 	/* Recheck latencies and configure upstream links */
 	if (parent->parent) {
@@ -945,9 +934,7 @@ void pcie_aspm_pm_state_change(struct pci_dev *pdev)
 
 void pcie_aspm_powersave_config_link(struct pci_dev *pdev)
 {
-	struct pcie_link_state *link = pdev->link_state;
-
-	if (aspm_disabled || !link)
+	if (aspm_disabled || !pdev)
 		return;
 
 	if (aspm_policy != POLICY_POWERSAVE &&
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1daf5fe0b913..b0742ee8ebd2 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -300,7 +300,6 @@ struct pci_cap_saved_state {
 };
 
 struct irq_affinity;
-struct pcie_link_state;
 struct pci_vpd;
 struct pci_sriov;
 struct pci_p2pdma;
@@ -383,7 +382,6 @@ struct pci_dev {
 	u32		lnkcap;		/* Link Capabilities */
 
 #ifdef CONFIG_PCIEASPM
-	struct pcie_link_state	*link_state;	/* ASPM link state */
 	unsigned int	ltr_path:1;	/* Latency Tolerance Reporting
 					   supported from root to here */
 	int		l1ss_cap_ptr;	/* L1SS cap ptr, 0 if not supported */
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
