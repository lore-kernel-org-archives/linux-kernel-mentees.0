Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39B3C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:43:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A410B21744
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:43:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t0dpG410"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A410B21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 83930885D6;
	Fri, 31 Jul 2020 12:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e4HooQFUNyWL; Fri, 31 Jul 2020 12:43:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0A40E88638;
	Fri, 31 Jul 2020 12:43:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA0A6C004F;
	Fri, 31 Jul 2020 12:43:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 031F6C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E31A3203A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zjJ1+u0fXeO1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:43:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by silver.osuosl.org (Postfix) with ESMTPS id D5EEC2010D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:43:10 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id di22so15090990edb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 05:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kTEKWlV4nOSheNgHEWqv/22qBE+Vx8ikH8s2qmj4c7s=;
 b=t0dpG410UoQ/AaCrJfLmpl35pb7gf3W1ueoUC8Kx/JGEDzX7QhXn5oMP733MHTQBAs
 4LHic3AIM6xJiSRqq86G0JWPXwCyYpMFkw1J37Hgzea7FX23P8viHUNdV3GNCMT2+KyH
 30SP4kpBZIQ7kkMIRQBBtv/0a0tqGNdn7OGEPahzFad8ybt4zUqY/+DIhgIkc4MH7WBE
 Ipg+7wJV93OZWFJfr80g3CHPMHWQlOpprwu9VAiS83J2a5O9VqKZzPcK9J7TRQ4wD5Eh
 ClijEVwOSSt5Ab03vnsaD5eKXzsZszfeQxc31WMyDT2QiXIB5oa54S3zN/3m8F1OluCA
 +QkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kTEKWlV4nOSheNgHEWqv/22qBE+Vx8ikH8s2qmj4c7s=;
 b=rx/p5gUAsRfPztZ/7uL44maUNJ5W7rxbvbrZUGTiNzomai2cn6Ml0V11wXG+RVNXny
 0TVVyvSMwkIStlbzna5ldifkvQv0DShyGq5eNPOIaXThnFIe9lO6NowKIIJXTkpmtTUm
 6HyOJUTSorPrXMVlGg0KvWtlDoYlXTmvBqHMDh8Gsbrt6y8aYGuI1ItkF3geqnDVNems
 zXzUvtlDuz09oWvsiPiqHfo/fgXavEveEMhLh03jg/caejq3wqDsY1/6NPSBC9P/lT6+
 KFXtg9iQ+EVIFcgCMk5fbuLDVmI4gON6R6/vE1s/ZuxDZ0Jn/TPhIHrC9qyDFuGpEoLT
 KkKA==
X-Gm-Message-State: AOAM531WgS7T2O397BzDdiUdA7DdENQumRiwadCYG/u0JnL2j2moUV8F
 9PwYvkUeDBtWr+CM3xlkfeI=
X-Google-Smtp-Source: ABdhPJx87fnYc/ryc1eaPTpKu9cM5/FUxmCOhynUIBbPcaF0NGu/M6CJK7gWLKoZuQT408yhWdXUOA==
X-Received: by 2002:aa7:c45a:: with SMTP id n26mr3749694edr.45.1596199389154; 
 Fri, 31 Jul 2020 05:43:09 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id g23sm8668514ejb.24.2020.07.31.05.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:43:08 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Fri, 31 Jul 2020 13:43:25 +0200
Message-Id: <20200731114329.100848-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 08/12] PCI: Check if
	pcie_capability_read_*() reads ~0
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

On failure pcie_capability_read_*() sets it's last parameter, val
to 0. However, with Patch 12/12, it is possible that val is set
to ~0 on failure. This would introduce a bug because
(x & x) == (~0 & x).

Since ~0 is an invalid value in here,

Add extra check for ~0 in the if condition to ensure success or
failure.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/probe.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 2f66988cea25..af95f67c19a7 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1124,7 +1124,7 @@ static void pci_enable_crs(struct pci_dev *pdev)
 
 	/* Enable CRS Software Visibility if supported */
 	pcie_capability_read_word(pdev, PCI_EXP_RTCAP, &root_cap);
-	if (root_cap & PCI_EXP_RTCAP_CRSVIS)
+	if ((root_cap != (u16)~0) && (root_cap & PCI_EXP_RTCAP_CRSVIS))
 		pcie_capability_set_word(pdev, PCI_EXP_RTCTL,
 					 PCI_EXP_RTCTL_CRSSVE);
 }
@@ -1521,7 +1521,7 @@ void set_pcie_hotplug_bridge(struct pci_dev *pdev)
 	u32 reg32;
 
 	pcie_capability_read_dword(pdev, PCI_EXP_SLTCAP, &reg32);
-	if (reg32 & PCI_EXP_SLTCAP_HPC)
+	if ((reg32 != (u32)~0) && (reg32 & PCI_EXP_SLTCAP_HPC))
 		pdev->is_hotplug_bridge = 1;
 }
 
@@ -2060,7 +2060,7 @@ bool pcie_relaxed_ordering_enabled(struct pci_dev *dev)
 
 	pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &v);
 
-	return !!(v & PCI_EXP_DEVCTL_RELAX_EN);
+	return ((v != (u16)~0) && (v & PCI_EXP_DEVCTL_RELAX_EN));
 }
 EXPORT_SYMBOL(pcie_relaxed_ordering_enabled);
 
@@ -2101,11 +2101,11 @@ static void pci_configure_ltr(struct pci_dev *dev)
 		return;
 
 	pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
-	if (!(cap & PCI_EXP_DEVCAP2_LTR))
+	if ((cap == (u32)~0) || !(cap & PCI_EXP_DEVCAP2_LTR))
 		return;
 
 	pcie_capability_read_dword(dev, PCI_EXP_DEVCTL2, &ctl);
-	if (ctl & PCI_EXP_DEVCTL2_LTR_EN) {
+	if ((ctl != (u32)~0) && (ctl & PCI_EXP_DEVCTL2_LTR_EN)) {
 		if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT) {
 			dev->ltr_path = 1;
 			return;
@@ -2147,7 +2147,7 @@ static void pci_configure_eetlp_prefix(struct pci_dev *dev)
 		return;
 
 	pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
-	if (!(cap & PCI_EXP_DEVCAP2_EE_PREFIX))
+	if ((cap == (u32)~0) || !(cap & PCI_EXP_DEVCAP2_EE_PREFIX))
 		return;
 
 	pcie_type = pci_pcie_type(dev);
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
