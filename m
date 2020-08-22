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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72242C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 464D12078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbQcth8z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 464D12078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2218B20656;
	Sat, 22 Aug 2020 21:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1Vdnf-itSdh; Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7DE3820395;
	Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78DABC08A2;
	Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD4B5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8AFED883D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lsmd7p7HPDRL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 396768816B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x9so1010203wmi.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zomoLV0+ed8J3CRGvC3cWaoiuwYFLEmBikD4ztF4YgU=;
 b=gbQcth8zUyER5UOn/tnqgtf9iNOwVQVNvmDuPFhSOLQe181jX7aRXsyT2L5hn5k1bV
 nrSdsViHiEyvg6Wdstibop+LoZtd0wSDeDDv1UU7+nE6yIPN/TyvvWPayWt8gcnaVYTO
 9LGyjQ03If8s9PeVXgWb4N/AZW4Eh4LS/UNJ6BU3uxnrHYkAQBPCri0P8yPYzjYykjFA
 hP3LykX5Z9fk7wdaC4C2D4gXyW6HgQu+gDmELBIlGGdliMxtiAXfr6RYdgiYInJxXuCC
 GD+ra95J2SOUOr1Zm6RcBRnwSzR8rvTUoHN8JJhYwviaF6OtV+kjpwA2mBsN6TaP5L8M
 51+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zomoLV0+ed8J3CRGvC3cWaoiuwYFLEmBikD4ztF4YgU=;
 b=CS3bQL0eI+79a6S0gAdG8RgVthI0ndI2oVSIOlSFGjbr+t6MbX4QBRpvF9FkiMoxJr
 36F4ldLQlAk2WWZDB9CWeEVPRA0WczNOiE7pDGKsMRiTARUNV++knETlNLBsZjMoJizt
 nzoPFPgd64qAm1uXl64WAK1e+pMs+qUmZJdFMCfThL62LVH6ji1y8KlLUwvxyWvzMF1H
 VyanGRoOmGN2HXzyZXBRZPXrtFpq5+nwFmWBHJ/r28YaRBIntbsn+5YBmpspqWw0hJBL
 iJuiAC+8oK7Fw0UjjQocbJ9uKESfRpx1vr6pvDlr+ge8Ik0qhLHs/rNsdwj6M/ijbQL9
 zqdQ==
X-Gm-Message-State: AOAM5330QLr54WW3dMt2Kx64xJxffSC6+dGTZVoA/dr/559TJy6T97n0
 XF79HqyGslAbuMzOtoZwAR0=
X-Google-Smtp-Source: ABdhPJw9drGDl5O0gyqT/dYnBJvFAAhCOjQuyUw5yNvNerwCr1A3LyiKjhsfbRnsIuQBZnpd/l7plg==
X-Received: by 2002:a7b:c5cf:: with SMTP id n15mr9458496wmk.93.1598130225700; 
 Sat, 22 Aug 2020 14:03:45 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:45 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:44 +0200
Message-Id: <20200822200358.252967-10-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 09/23] PCI: Remove
	pcie_get_aspm_reg() and struct aspm_register_info
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

All members of struct aspm_register_info are now calculated directly.

 - Remove all calls to pcie_get_aspm_reg()
 - Remove pcie_get_aspm_reg()
 - Remove remaining redundant reference to struct aspm_register_info.
 - Remove struct aspm_register_info

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 63 -----------------------------------------
 1 file changed, 63 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 506552f8dd2b..bf728c82158f 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -382,57 +382,6 @@ static void encode_l12_threshold(u32 threshold_us, u32 *scale, u32 *value)
 	}
 }
 
-struct aspm_register_info {
-	u32 support:2;
-	u32 enabled:2;
-	u32 latency_encoding_l0s;
-	u32 latency_encoding_l1;
-
-	/* L1 substates */
-	u32 l1ss_cap_ptr;
-	u32 l1ss_cap;
-	u32 l1ss_ctl1;
-	u32 l1ss_ctl2;
-};
-
-static void pcie_get_aspm_reg(struct pci_dev *pdev,
-			      struct aspm_register_info *info)
-{
-	u16 reg16;
-	u32 reg32 = pdev->lnkcap;
-
-	info->support = (reg32 & PCI_EXP_LNKCAP_ASPMS) >> 10;
-	info->latency_encoding_l0s = (reg32 & PCI_EXP_LNKCAP_L0SEL) >> 12;
-	info->latency_encoding_l1  = (reg32 & PCI_EXP_LNKCAP_L1EL) >> 15;
-	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &reg16);
-	info->enabled = reg16 & PCI_EXP_LNKCTL_ASPMC;
-
-	/* Read L1 PM substate capabilities */
-	info->l1ss_cap = info->l1ss_ctl1 = info->l1ss_ctl2 = 0;
-	info->l1ss_cap_ptr = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_L1SS);
-	if (!info->l1ss_cap_ptr)
-		return;
-	pci_read_config_dword(pdev, info->l1ss_cap_ptr + PCI_L1SS_CAP,
-			      &info->l1ss_cap);
-	if (!(info->l1ss_cap & PCI_L1SS_CAP_L1_PM_SS)) {
-		info->l1ss_cap = 0;
-		return;
-	}
-
-	/*
-	 * If we don't have LTR for the entire path from the Root Complex
-	 * to this device, we can't use ASPM L1.2 because it relies on the
-	 * LTR_L1.2_THRESHOLD.  See PCIe r4.0, secs 5.5.4, 6.18.
-	 */
-	if (!pdev->ltr_path)
-		info->l1ss_cap &= ~PCI_L1SS_CAP_ASPM_L1_2;
-
-	pci_read_config_dword(pdev, info->l1ss_cap_ptr + PCI_L1SS_CTL1,
-			      &info->l1ss_ctl1);
-	pci_read_config_dword(pdev, info->l1ss_cap_ptr + PCI_L1SS_CTL2,
-			      &info->l1ss_ctl2);
-}
-
 static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 {
 	u32 latency, l1_switch_latency = 0;
@@ -556,7 +505,6 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 {
 	struct pci_dev *child = link->downstream, *parent = link->pdev;
 	struct pci_bus *linkbus = parent->subordinate;
-	struct aspm_register_info upreg, dwreg;
 	u32 up_l1ss_ctl1, dw_l1ss_ctl1;
 
 	if (blacklist) {
@@ -566,10 +514,6 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 		return;
 	}
 
-	/* Get upstream/downstream components' register state */
-	pcie_get_aspm_reg(parent, &upreg);
-	pcie_get_aspm_reg(child, &dwreg);
-
 	/*
 	 * If ASPM not supported, don't mess with the clocks and link,
 	 * bail out now.
@@ -586,13 +530,6 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	pci_read_config_dword(child, child->l1ss_cap_ptr + PCI_L1SS_CTL1,
 				&dw_l1ss_ctl1);
 
-	/*
-	 * Re-read upstream/downstream components' register state
-	 * after clock configuration
-	 */
-	pcie_get_aspm_reg(parent, &upreg);
-	pcie_get_aspm_reg(child, &dwreg);
-
 	/*
 	 * Setup L0s state
 	 *
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
