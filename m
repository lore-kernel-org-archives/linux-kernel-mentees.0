Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E54C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B1E5214F1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4ao2n+d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B1E5214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB09687E61;
	Sat, 22 Aug 2020 21:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybGl2o19eiEf; Sat, 22 Aug 2020 21:04:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B0CEB87E75;
	Sat, 22 Aug 2020 21:04:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AF1BC08A5;
	Sat, 22 Aug 2020 21:04:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97763C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7CEFE20395
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYnyksfixWcT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 1AA87207EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u18so4934546wmc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uqbuDmEQI+tIfB/SmbniaBcKGMNT9EHPvDJfsNffdAE=;
 b=Y4ao2n+dsIGj7a1siNswuV/X9R4hXAWxNkaluvDWD5rEsOkh3CPLPsQ48Je/kps68u
 eOlDnypmUGIULeELmlL3strUTLEhbMoBYRuKb3ZPrndVfHb/nOhtXok0t5TVmTnNDxNS
 emZCQQk21xdJl0l0iaabhS31XaWmvWUzmX28DD+BqXPzJxNBHWDmVU1JG/gV4bsH7xm/
 FH5GCGLeMpZXx9nH8YKM57QAkEraUjZNTPeXkPZF4Kio4sHZPqmdb77Smnc9hSDl1rEq
 ibuY5j3oJsKT4+ZzwmTN6rGuECOJH/SWFMdwOoPVzcaWAyeG0irC3fzOYtRBtmnBSmeM
 FNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uqbuDmEQI+tIfB/SmbniaBcKGMNT9EHPvDJfsNffdAE=;
 b=pxbYjvwkvEkp5Sb5NWDTvDadl4jPU/a4of73pHXUBOhebWnS0AwDR26Qt0uTLPFy9g
 oNM4qYn4cOVOmcJ3ENTUCwk0QWFUAFkO8lTsgZ15MGkdiQ19bvOPJCfBhdQ4YTPm9cNB
 x+2QawIMIkWaPS6SwZJLzwDqRoSjneFQhLYftFXUujkjUBaBg0Wkz035K+1iMM1WP5KF
 KNuEYmFUh8EMIgMmMPL27Aj+zG4XSn2Bf9puhuaqXc/SAdQ8kkzt9ggYvqyUYWoaRf6e
 +eaITntIXfKxZwRKp/QDa7T9K2CoA10pjI/VfIaKcT2TByAFoQ5dciLsJYA4b5lEA4Z9
 Hs1w==
X-Gm-Message-State: AOAM533ubR3QnMY3w25mfrqtaEPw4kng7GlSFKmbCdBSoeORkW4QEBvz
 i25JkxytVLVGhaN6CrzfYiE=
X-Google-Smtp-Source: ABdhPJzYRGiI8mOS2gMGBCeZlE1qBZrEUEsUHXmd4yYExPAzKchHN3YVBiIWgjQx8B6andk3SOcvhw==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr6807wmd.10.1598130233609;
 Sat, 22 Aug 2020 14:03:53 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:53 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:51 +0200
Message-Id: <20200822200358.252967-17-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 16/23] PCI: Remove Exit
	latencies from struct pcie_link_state
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

 - Initialise pci_dev.acceptable instead of pcie_link_state.acceptable
 - Replace all access to pcie_link_state.(acceptable && latency_*)
   with the versions in struct pci_dev
 - Remove pcie_link_state.(acceptable && latency_*)

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 9ca06f00e98d..56fdf2e7c98a 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -59,15 +59,6 @@ struct pcie_link_state {
 	u32 clkpm_enabled:1;		/* Current Clock PM state */
 	u32 clkpm_default:1;		/* Default Clock PM state by BIOS */
 	u32 clkpm_disable:1;		/* Clock PM disabled */
-
-	/* Exit latencies */
-	struct aspm_latency latency_up;	/* Upstream direction exit latency */
-	struct aspm_latency latency_dw;	/* Downstream direction exit latency */
-	/*
-	 * Endpoint acceptable latencies. A pcie downstream port only
-	 * has one slot under it, so at most there are 8 functions.
-	 */
-	struct aspm_latency acceptable[8];
 };
 
 static int aspm_disabled, aspm_force;
@@ -389,19 +380,19 @@ static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 
 	link = endpoint->bus->self->link_state;
 	pdev = endpoint->bus->self;
-	acceptable = &link->acceptable[PCI_FUNC(endpoint->devfn)];
+	acceptable = &link->pdev->acceptable[PCI_FUNC(endpoint->devfn)];
 
 	while (link) {
 		/* Check upstream direction L0s latency */
 		if ((link->aspm_capable & ASPM_STATE_L0S_UP) &&
-		    (link->latency_up.l0s > acceptable->l0s)) {
+		    (link->pdev->latency_up.l0s > acceptable->l0s)) {
 			link->aspm_capable &= ~ASPM_STATE_L0S_UP;
 			pdev->aspm_capable &= ~ASPM_STATE_L0S_UP;
 		}
 
 		/* Check downstream direction L0s latency */
 		if ((link->aspm_capable & ASPM_STATE_L0S_DW) &&
-		    (link->latency_dw.l0s > acceptable->l0s)) {
+		    (link->pdev->latency_dw.l0s > acceptable->l0s)) {
 			link->aspm_capable &= ~ASPM_STATE_L0S_DW;
 			pdev->aspm_capable &= ~ASPM_STATE_L0S_DW;
 		}
@@ -419,7 +410,8 @@ static void pcie_aspm_check_latency(struct pci_dev *endpoint)
 		 * L1 exit latencies advertised by a device include L1
 		 * substate latencies (and hence do not do any check).
 		 */
-		latency = max_t(u32, link->latency_up.l1, link->latency_dw.l1);
+		latency = max_t(u32, link->pdev->latency_up.l1,
+						link->pdev->latency_dw.l1);
 		if ((link->aspm_capable & ASPM_STATE_L1) &&
 		    (latency + l1_switch_latency > acceptable->l1)) {
 			link->aspm_capable &= ~ASPM_STATE_L1;
@@ -559,8 +551,6 @@ static void pcie_aspm_cap_init(struct pci_dev *pdev, int blacklist)
 		parent->aspm_enabled |= ASPM_STATE_L0S_DW;
 	}
 
-	link->latency_up.l0s = calc_l0s_latency(parent);
-	link->latency_dw.l0s = calc_l0s_latency(child);
 	parent->latency_up.l0s = calc_l0s_latency(parent);
 	parent->latency_dw.l0s = calc_l0s_latency(child);
 
@@ -578,8 +568,6 @@ static void pcie_aspm_cap_init(struct pci_dev *pdev, int blacklist)
 		parent->aspm_enabled |= ASPM_STATE_L1;
 	}
 
-	link->latency_up.l1 = calc_l1_latency(parent);
-	link->latency_dw.l1 = calc_l1_latency(child);
 	parent->latency_up.l1 = calc_l1_latency(parent);
 	parent->latency_dw.l1 = calc_l1_latency(child);
 
@@ -630,7 +618,7 @@ static void pcie_aspm_cap_init(struct pci_dev *pdev, int blacklist)
 	list_for_each_entry(child, &linkbus->devices, bus_list) {
 		u32 reg32, encoding;
 		struct aspm_latency *acceptable =
-			&link->acceptable[PCI_FUNC(child->devfn)];
+			&parent->acceptable[PCI_FUNC(child->devfn)];
 
 		if (pci_pcie_type(child) != PCI_EXP_TYPE_ENDPOINT &&
 		    pci_pcie_type(child) != PCI_EXP_TYPE_LEG_END)
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
