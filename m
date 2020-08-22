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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA32C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D476A20FC3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0yZMCBK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D476A20FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7FF062051D;
	Sat, 22 Aug 2020 21:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yieYFe9G6weU; Sat, 22 Aug 2020 21:03:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2A57420513;
	Sat, 22 Aug 2020 21:03:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16C8FC07FF;
	Sat, 22 Aug 2020 21:03:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DC28C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 291E1883B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vviuIGS5QF1O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9531B88378
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k20so4886914wmi.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=njTDdssXDFMgbzpz4L3esGdsSDd+SlWGQt5JQdHS3T4=;
 b=d0yZMCBKJ8lSxWzSB4KhbDP6femkOf7N+Oe/YrgEOXm/iGcg2pe1fkZluPe2E0Ui9A
 vgZzBzBY498WLb5ZJCo3owOodioR16AjxnxV8N0HAylIiddaZjbJ5+f5CRNpgi3QYXC1
 To6NwdxMkFjbbcBCt8ITAQkOzx32ACHtAtSg2lXVHENBQ1eQXzehSQq595KpYJQi+yXZ
 YxNuDweQWDGfHKHLJl5b4Ue8bl40ltRC9PMcCU8tGkPlmFs9Pf5f6KDdSakVPzoKQIbo
 Jl+hB1yenqauP5EiOFhcICTgwqg9CIhE5z0VLCb4K7W5DKMax7Xy20H7CO6ZyPMDLsG0
 II9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=njTDdssXDFMgbzpz4L3esGdsSDd+SlWGQt5JQdHS3T4=;
 b=FOabGuBuWKhytV1P763Pw19oU+NUARMFXPQYOJ/K9qpAnBsCbNuyDubNAHX75YmE71
 3I+f3mIF5oThNCojaNDxADb4QXhqYrob4Bkvd1VAq/gK3unPwAD1poadsYGBZSzgy7Vd
 c1LJKjCFC2IPzpyoo5iDLZDcbY6ngkTOcPwc6Zr5FgDMmDoL4SjeGFvuiOUUayQxYg2M
 sMjfB8Dn0YyUm4tfXxW3c8SxerxGMSLF7CzfS0xCKjbcjlEDQmdt/d+JVtbAq/MjG03N
 5N7LQ/gSEXvkj95L3eJylajGp37UN5NGPFkDW7zhMhQo58dp4lOpCIKFXNFFMD4j5lqe
 CxTw==
X-Gm-Message-State: AOAM533f42o6MIMy7IythInaYeEdAWBIh9hu0/sPRtArUGJ7tOghDdzj
 7QeK3gI7VpBlrGlhdCsWedY=
X-Google-Smtp-Source: ABdhPJw9ooL9fWVRDWvE2hOleX1P3SIyZjLKQ7pTsxZQ5wQIzCYrJ3p8md1OGN15Bl6g4RkGOVifIA==
X-Received: by 2002:a7b:c765:: with SMTP id x5mr6161wmk.14.1598130221122;
 Sat, 22 Aug 2020 14:03:41 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:40 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:40 +0200
Message-Id: <20200822200358.252967-6-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 05/23] PCI: Read value of
	aspm_register_info.l1ss_ctl1 directly
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

Read the value of PCI_L1SS_CTL1 directly and cache in local variables.
Replace references to aspm_register_info.l1ss_ctl1 with the variables.

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 64224be52435..d622affdbbcc 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -549,6 +549,7 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	struct pci_dev *child = link->downstream, *parent = link->pdev;
 	struct pci_bus *linkbus = parent->subordinate;
 	struct aspm_register_info upreg, dwreg;
+	u32 up_l1ss_ctl1, dw_l1ss_ctl1;
 
 	if (blacklist) {
 		/* Set enabled/disable so that we will disable ASPM later */
@@ -572,6 +573,11 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	/* Configure common clock before checking latencies */
 	pcie_aspm_configure_common_clock(link);
 
+	pci_read_config_dword(parent, parent->l1ss_cap_ptr + PCI_L1SS_CTL1,
+				&up_l1ss_ctl1);
+	pci_read_config_dword(child, child->l1ss_cap_ptr + PCI_L1SS_CTL1,
+				&dw_l1ss_ctl1);
+
 	/*
 	 * Re-read upstream/downstream components' register state
 	 * after clock configuration
@@ -618,13 +624,13 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	if (upreg.l1ss_cap & dwreg.l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_2)
 		link->aspm_support |= ASPM_STATE_L1_2_PCIPM;
 
-	if (upreg.l1ss_ctl1 & dwreg.l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_1)
+	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_1)
 		link->aspm_enabled |= ASPM_STATE_L1_1;
-	if (upreg.l1ss_ctl1 & dwreg.l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_2)
+	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_2)
 		link->aspm_enabled |= ASPM_STATE_L1_2;
-	if (upreg.l1ss_ctl1 & dwreg.l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_1)
+	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_1)
 		link->aspm_enabled |= ASPM_STATE_L1_1_PCIPM;
-	if (upreg.l1ss_ctl1 & dwreg.l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_2)
+	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_2)
 		link->aspm_enabled |= ASPM_STATE_L1_2_PCIPM;
 
 	if (link->aspm_support & ASPM_STATE_L1SS)
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
