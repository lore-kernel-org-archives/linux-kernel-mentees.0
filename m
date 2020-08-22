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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5C2C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F5D12078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqSBQEPy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F5D12078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 15ED620504;
	Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U7RfpSL2yWiC; Sat, 22 Aug 2020 21:03:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3611A204AE;
	Sat, 22 Aug 2020 21:03:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25825C07FF;
	Sat, 22 Aug 2020 21:03:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CF0CC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 44F3920504
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgqwAEhzSfGT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by silver.osuosl.org (Postfix) with ESMTPS id B421F20395
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a15so5027842wrh.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hdvKdXB5nYl/IIjpOs9NVJrPed8Lrl8pjTwDRDZI9q4=;
 b=HqSBQEPykgpl9grV4Kml0fvBBMG4NPNVAWvt7frQ7taW7Np4+V8l4E8wvbdmCTej4D
 6foNLt2P4ruSgQwU5lxKEZUEi5wDnrKQitfa+7rJex/QkO9OiOmDifqeCHLGMzEKsDbn
 KGk2tfogLOyA2TUPsLil8JWk7gEaAAMuZlju/jZk75KXmgiUL//HTpCdz8IFzzApyGdN
 b3b9bszzJx44zwxmU+v3H0fkWNqIg6fHM7Tvtx96YGncQycrLNCkykgQu1q8EAjWrByI
 cjLcyh6tuJtZsMwVdGnbenzw5G2uH9eMIbJJkX7dPJvPPyHgE/HBwerQAnpi1p2NKj98
 R7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hdvKdXB5nYl/IIjpOs9NVJrPed8Lrl8pjTwDRDZI9q4=;
 b=NlCUCu7jwn1NGum/IZP7quIoH324sfK5rNJ5WT59O/FSwAmF9prR8sbd+SoHGFol8/
 5ux76EvOz9K1iQZs+oZMPX3sVofbZoQ3FCdEM4ARlI+Z9RXfgHXrbopM1U5PW8mN6MZP
 KtEIR6h8xCnDSVUutDnuK4fegzhgCnLdIirQt/iIse3sWlBb5xsD2oXkkGbplhJgfTya
 pCnmWE4n0VlMbM05uhknXsCfv7U25MILblINBx55ZVJA9M74yTNWEYN0Yb8xUK+GFIdT
 tmqRbvle9HXwE1TTiTyRnl99mDXICVaWAi8pFk3egmsrlV4OxeorMInhuvtud69aq1Sz
 ocNA==
X-Gm-Message-State: AOAM532QCiSft3gYYZRsqmDy6F1ktj0/qiS6jx3ioXTWxQoiNo0xbHm+
 mzpq9gQ+FsyhoYSI1wLzvZ4=
X-Google-Smtp-Source: ABdhPJzvbCdjrarBrsMxtUgb2jkL6nvGDROk+K2UuIM3fI9Di9RaJdcjzr2ISOZalvFX545MeUZ1mg==
X-Received: by 2002:adf:f785:: with SMTP id q5mr8271334wrp.298.1598130222233; 
 Sat, 22 Aug 2020 14:03:42 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:41 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:41 +0200
Message-Id: <20200822200358.252967-7-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 06/23] PCI: Replace
	aspm_register_info.l1ss_cap* with their pci_dev version
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

Replace all references to aspm_register_info.(l1ss_cap | l1ss_cap_ptr) with
pci_dev.(l1ss_cap | l1ss_cap_ptr)

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index d622affdbbcc..0657cad5f290 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -501,32 +501,34 @@ static void aspm_calc_l1ss_info(struct pcie_link_state *link,
 {
 	u32 val1, val2, scale1, scale2;
 	u32 t_common_mode, t_power_on, l1_2_threshold, scale, value;
+	struct pci_dev *dw_pdev = link->downstream;
+	struct pci_dev *up_pdev = link->pdev;
 
-	link->l1ss.up_cap_ptr = upreg->l1ss_cap_ptr;
-	link->l1ss.dw_cap_ptr = dwreg->l1ss_cap_ptr;
+	link->l1ss.up_cap_ptr = up_pdev->l1ss_cap_ptr;
+	link->l1ss.dw_cap_ptr = dw_pdev->l1ss_cap_ptr;
 	link->l1ss.ctl1 = link->l1ss.ctl2 = 0;
 
 	if (!(link->aspm_support & ASPM_STATE_L1_2_MASK))
 		return;
 
 	/* Choose the greater of the two Port Common_Mode_Restore_Times */
-	val1 = (upreg->l1ss_cap & PCI_L1SS_CAP_CM_RESTORE_TIME) >> 8;
-	val2 = (dwreg->l1ss_cap & PCI_L1SS_CAP_CM_RESTORE_TIME) >> 8;
+	val1 = (up_pdev->l1ss_cap & PCI_L1SS_CAP_CM_RESTORE_TIME) >> 8;
+	val2 = (dw_pdev->l1ss_cap & PCI_L1SS_CAP_CM_RESTORE_TIME) >> 8;
 	t_common_mode = max(val1, val2);
 
 	/* Choose the greater of the two Port T_POWER_ON times */
-	val1   = (upreg->l1ss_cap & PCI_L1SS_CAP_P_PWR_ON_VALUE) >> 19;
-	scale1 = (upreg->l1ss_cap & PCI_L1SS_CAP_P_PWR_ON_SCALE) >> 16;
-	val2   = (dwreg->l1ss_cap & PCI_L1SS_CAP_P_PWR_ON_VALUE) >> 19;
-	scale2 = (dwreg->l1ss_cap & PCI_L1SS_CAP_P_PWR_ON_SCALE) >> 16;
+	val1   = (up_pdev->l1ss_cap & PCI_L1SS_CAP_P_PWR_ON_VALUE) >> 19;
+	scale1 = (up_pdev->l1ss_cap & PCI_L1SS_CAP_P_PWR_ON_SCALE) >> 16;
+	val2   = (dw_pdev->l1ss_cap & PCI_L1SS_CAP_P_PWR_ON_VALUE) >> 19;
+	scale2 = (dw_pdev->l1ss_cap & PCI_L1SS_CAP_P_PWR_ON_SCALE) >> 16;
 
-	if (calc_l1ss_pwron(link->pdev, scale1, val1) >
-	    calc_l1ss_pwron(link->downstream, scale2, val2)) {
+	if (calc_l1ss_pwron(up_pdev, scale1, val1) >
+	    calc_l1ss_pwron(dw_pdev, scale2, val2)) {
 		link->l1ss.ctl2 |= scale1 | (val1 << 3);
-		t_power_on = calc_l1ss_pwron(link->pdev, scale1, val1);
+		t_power_on = calc_l1ss_pwron(up_pdev, scale1, val1);
 	} else {
 		link->l1ss.ctl2 |= scale2 | (val2 << 3);
-		t_power_on = calc_l1ss_pwron(link->downstream, scale2, val2);
+		t_power_on = calc_l1ss_pwron(dw_pdev, scale2, val2);
 	}
 
 	/*
@@ -615,13 +617,13 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	link->latency_dw.l1 = calc_l1_latency(child);
 
 	/* Setup L1 substate */
-	if (upreg.l1ss_cap & dwreg.l1ss_cap & PCI_L1SS_CAP_ASPM_L1_1)
+	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_ASPM_L1_1)
 		link->aspm_support |= ASPM_STATE_L1_1;
-	if (upreg.l1ss_cap & dwreg.l1ss_cap & PCI_L1SS_CAP_ASPM_L1_2)
+	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_ASPM_L1_2)
 		link->aspm_support |= ASPM_STATE_L1_2;
-	if (upreg.l1ss_cap & dwreg.l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_1)
+	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_1)
 		link->aspm_support |= ASPM_STATE_L1_1_PCIPM;
-	if (upreg.l1ss_cap & dwreg.l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_2)
+	if (parent->l1ss_cap & child->l1ss_cap & PCI_L1SS_CAP_PCIPM_L1_2)
 		link->aspm_support |= ASPM_STATE_L1_2_PCIPM;
 
 	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_ASPM_L1_1)
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
