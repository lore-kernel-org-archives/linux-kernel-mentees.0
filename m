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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3894C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8722E2078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKEhR/cL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8722E2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 089B884F48;
	Sat, 22 Aug 2020 21:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuKirMi8zaCX; Sat, 22 Aug 2020 21:03:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0898B84E5D;
	Sat, 22 Aug 2020 21:03:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 054C6C07FF;
	Sat, 22 Aug 2020 21:03:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99666C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 83FF887E30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWgSSBackwNV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A0B1487E2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:41 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g75so4890083wme.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QtFLCNI246XEo30eMorO6BZLjW9a5OmMUXJH2C8o35I=;
 b=DKEhR/cLfloXzyJDfmA2dgzl7OgxHsHQzhbaVxoontinDmoRXJl3CcFsFwt+5EkUjh
 0VFHc0jew/a6K6wWD/186ww8JGrXmN5L+dpiyTMNIW/ccyuXtKxcpbQ6r8o4JpL+Ytfs
 SS0pj4FXdZ8b1Uk412wjOEuwxcNVAj1qXc5Y8ivKqzvJQI3oHbpNFe1BehwN95/H+/jK
 /NI83T4ThlwWzynzH1e0p8u6TVrwlAZJPkSQqStquHQSd4W3uRuC2mriNjoNzXuIJKaE
 7V5uAFqzvYWXEURJHTJnzlD8bHBSj3DOzqkAn8QvT23dFydvdSOg3d05vpzJLkjWeWeO
 v3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QtFLCNI246XEo30eMorO6BZLjW9a5OmMUXJH2C8o35I=;
 b=ov3aA8wa94chVUNClqUf+7ElPt2wlMNHA5ORpMU7bew8vvc87xNePCzaj50iadMbMm
 C4pful1CdnJGTb3jj3+DTprdBvpVR7V/XYTTAD6xC1sOOsD2N74QEf4rnZcBrU5pXbEp
 V4yBvhqwF8b3M1VzcNTEcRIjkVJaWV4FLJ6+RJsjfaioievKkO2P8gm3XLSEkzFv6Zg0
 U+0URdqLlai1vbTo1K2ECVHX0U465tOKXSN5PvPS+ko6VA4rg1dCvwvNrD8Zz8xYZC7r
 79uXnDPlejLkrdvo0I0h7Qhh3Z2+O6y8Lt/WzERRvdaXyLZWbdRUjW3Hr91IWg71anFJ
 bbwA==
X-Gm-Message-State: AOAM530bPlSkOD8z3XAKxUMuGEw1LctEuNt6iiHuXxNkl9Bn/mGyvCtx
 wqL6T9fXPKTTKH9l4IXhibo=
X-Google-Smtp-Source: ABdhPJwor+g019/6231UEAOmgMd3BirMjDzKD1nWvwFkaM7O5mUjtYEnxVr1FyDBkUXle83C5X13eg==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr9906910wmj.86.1598130219972;
 Sat, 22 Aug 2020 14:03:39 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:39 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:39 +0200
Message-Id: <20200822200358.252967-5-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 04/23] PCI: Compute
	aspm_register_info.support directly
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

Replace all references to aspm_register_info.support with its
computation.

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 629737125b36..64224be52435 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -565,7 +565,8 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	 * If ASPM not supported, don't mess with the clocks and link,
 	 * bail out now.
 	 */
-	if (!(upreg.support & dwreg.support))
+	if (!(((parent->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
+		((child->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10)))
 		return;
 
 	/* Configure common clock before checking latencies */
@@ -585,8 +586,11 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	 * given link unless components on both sides of the link each
 	 * support L0s.
 	 */
-	if (dwreg.support & upreg.support & PCIE_LINK_STATE_L0S)
+	if (((parent->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
+			((child->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
+			PCIE_LINK_STATE_L0S)
 		link->aspm_support |= ASPM_STATE_L0S;
+
 	if (dwreg.enabled & PCIE_LINK_STATE_L0S)
 		link->aspm_enabled |= ASPM_STATE_L0S_UP;
 	if (upreg.enabled & PCIE_LINK_STATE_L0S)
@@ -595,7 +599,9 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	link->latency_dw.l0s = calc_l0s_latency(child);
 
 	/* Setup L1 state */
-	if (upreg.support & dwreg.support & PCIE_LINK_STATE_L1)
+	if (((parent->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
+			((child->lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10) &
+			PCIE_LINK_STATE_L1)
 		link->aspm_support |= ASPM_STATE_L1;
 	if (upreg.enabled & dwreg.enabled & PCIE_LINK_STATE_L1)
 		link->aspm_enabled |= ASPM_STATE_L1;
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
