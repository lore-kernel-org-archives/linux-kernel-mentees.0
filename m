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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD03C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 302BB214F1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJlC25oL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 302BB214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED6B187E3E;
	Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rwcYpi94xTyS; Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 78C8F87E30;
	Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67059C07FF;
	Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C219C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B612284F7A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EPkhZLkHCeJK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 326D884E5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:46 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a65so1346803wme.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=opiBh2CP8dvQ0sGVAAJraXm9r07x5zCrMBarNXuR/yU=;
 b=XJlC25oL1vvn3nJkIwoGbcU+J8F+NNBn7oaFyyFRbAgTcNBsR/k+A1jbJeqzvuONQS
 NOGtQNd9nouQDtpfpysGTEXZCg7/bcLI1CgE/4MGIm2DVSxXwBKqtRrHsKDAnaWXTAX4
 RXp6DnpPaLeg59iTHVEbhB8BaFVRYZCqIwAW0mSm7FYAx1FkpIL7A8FSkkD0Doi8VIiD
 ONoQKQm5c3TLtT9ZockywJrC4r7q6jpzZACyDikZBYP8/A0AXEDOGwTxYr4iX1IvYZgz
 6XbCktHszo8Ek7zPw0cxdvVmsVwFxxwbecicVflzb9St7OtDnlB8/l116dygi2mvKhbn
 UydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=opiBh2CP8dvQ0sGVAAJraXm9r07x5zCrMBarNXuR/yU=;
 b=ZWLxT2ecb5okZkmjnANKaxoGqO4d9a1yqfLmBk0/wMJU0bP8hbUojTaNYTC1K+nZ8E
 qmMB9yYAOP2JRn+s2kqrb3CFUVcUXRScMw2XX5pTAO1bAhDVekjGavvuJN6HfbCl/vLR
 2xjFGyrhQjapvlUc38BEgfnmgpE+rv5wgK0j17zcAjpSushUzATeRWmI/RnuQBkxXbNn
 lqVCk2PIUEPsqK8vN5v9vWrVXFwOrA2GrgV01+iiIbxWMwh17G0m4fdFWfHaVhfbRt6Z
 o1doj08EPvCxaeEW/Lr2DopoExY8KPTId2lzVIA+CAkL+Te20fi+QCWsFjcDlEkb/V5N
 HKkQ==
X-Gm-Message-State: AOAM5302xbU++IyTpA62V2KChoOMr7pcHneIFRSUYoCvslOTG19cUIGG
 c2mOG3zT7iCaS018mXYc7OU=
X-Google-Smtp-Source: ABdhPJwZqYXpAnJfZUz7/CADBCKAnTfKyFXmAeD3Y1KHlHcYhpom4Tr+TV2eJyYkzrNATkNju1tvdg==
X-Received: by 2002:a7b:c384:: with SMTP id s4mr9256047wmj.138.1598130223292; 
 Sat, 22 Aug 2020 14:03:43 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:42 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:42 +0200
Message-Id: <20200822200358.252967-8-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 07/23] PCI: Compute
	aspm_register_info.enable directly
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

 - Create helper function to comute aspm_register_info.enable directly
 - Replace all references with call to the helper function

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 0657cad5f290..c5f18d280892 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -546,6 +546,14 @@ static void aspm_calc_l1ss_info(struct pcie_link_state *link,
 	link->l1ss.ctl1 |= t_common_mode << 8 | scale << 29 | value << 16;
 }
 
+static u32 get_aspm_enable(struct pci_dev *pdev)
+{
+	u16 reg16;
+
+	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &reg16);
+	return (reg16 & PCI_EXP_LNKCTL_ASPMC);
+}
+
 static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 {
 	struct pci_dev *child = link->downstream, *parent = link->pdev;
@@ -599,9 +607,9 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 			PCIE_LINK_STATE_L0S)
 		link->aspm_support |= ASPM_STATE_L0S;
 
-	if (dwreg.enabled & PCIE_LINK_STATE_L0S)
+	if (get_aspm_enable(child) & PCIE_LINK_STATE_L0S)
 		link->aspm_enabled |= ASPM_STATE_L0S_UP;
-	if (upreg.enabled & PCIE_LINK_STATE_L0S)
+	if (get_aspm_enable(parent) & PCIE_LINK_STATE_L0S)
 		link->aspm_enabled |= ASPM_STATE_L0S_DW;
 	link->latency_up.l0s = calc_l0s_latency(parent);
 	link->latency_dw.l0s = calc_l0s_latency(child);
@@ -611,7 +619,7 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 			((child->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
 			PCIE_LINK_STATE_L1)
 		link->aspm_support |= ASPM_STATE_L1;
-	if (upreg.enabled & dwreg.enabled & PCIE_LINK_STATE_L1)
+	if (get_aspm_enable(parent) & get_aspm_enable(child) & PCIE_LINK_STATE_L1)
 		link->aspm_enabled |= ASPM_STATE_L1;
 	link->latency_up.l1 = calc_l1_latency(parent);
 	link->latency_dw.l1 = calc_l1_latency(child);
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
