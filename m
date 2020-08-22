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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3CDC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32FDB20FC3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIk9QBfZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32FDB20FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D8C8C20513;
	Sat, 22 Aug 2020 21:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgeX-kZ2cqhg; Sat, 22 Aug 2020 21:03:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E323420395;
	Sat, 22 Aug 2020 21:03:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4269C08A2;
	Sat, 22 Aug 2020 21:03:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 725ECC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6D1B8204AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rkSKXYh1s8Jl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 0CF2C20395
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l2so5039605wrc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kwvxjsZ87n2yImxhHO/VzFTaOQLumZ1kZXBvvX5USXs=;
 b=OIk9QBfZoZZEXgZyI+flpuqDed6vd8x+CnXQtZ5idRZE03xDxYWC2eM74z6uqXYO3l
 RwDGhGwa5X9mq+4340wGA6a/adHqSJ/7jpWzg2CUaONATG+xhSL3xsw1c4g922BaB+Cg
 OSSLGbUIqgD9L7yP9znnzZejL90SMyyK0YIIM3kSo13lekRV7YjaxUff5n1VGwh81ir5
 g4c3w4So47hCSgX/19jilWPj9aef7p3CV6LB5l/pQzob12aa5UVyxluMnMVGyCbwfnLP
 aIJz52XUiplxVNHtCx2uXfo2E9knJVO76rvumEA9VD2lELC+F9z/mWXvXj7XafrXuDmb
 bJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kwvxjsZ87n2yImxhHO/VzFTaOQLumZ1kZXBvvX5USXs=;
 b=jMku9ENPNJp5iq8oBaMIx8YGeMv7qTsEpzdS3mv3olspmD2/fJJJePIlBqvUbeiNS8
 o0yYrGbxKHn989lfShVIWEICVzvjOM4HesDQgD3y2j5W7ttB6tpu8IbBErTOmCSrfsOS
 vgG6Ws9cg8ZLwmt4Vqd8YJixcoiTaFCXj7Mv0LWySiaJ00LkiFWF4iKuaj3EFD5A4224
 uQbq683cnTncvdXzOx43gBEp+hWa9FWwG2Cysd23J/CmymvRdGEQlRwRyLLJSX9TDMQ5
 Itj7gzIoqcA4ziWkgD6ab3xldZnlFzhEuIZDvJjsDPoyDzlDOa4OiRXsSUUISnKBiJ/g
 Nebg==
X-Gm-Message-State: AOAM530nZ11FZXYmJsbNWnuS04L3Uh9U5loL6ZP3EBHkTHs6N1NUgdSO
 0M011T+LgsSZ7DrS/e57Nf/v6bqw8xmNJg==
X-Google-Smtp-Source: ABdhPJzYZUEkrEu7lWKT32xunFUtdmANHx22PqsXUzVlNYbHrZNaPF7B38yu4ylifKZ50NiwHpqLbw==
X-Received: by 2002:a05:6000:162d:: with SMTP id
 v13mr8797807wrb.12.1598130216245; 
 Sat, 22 Aug 2020 14:03:36 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:35 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:36 +0200
Message-Id: <20200822200358.252967-2-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 01/23] PCI: Migrate ASPM info
	from struct pcie_link_state to struct pci_dev
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

pcie_get_aspm_reg() reads LNKCAP to learn whether the device supports
ASPM L0s and/or L1 and L1 substates.

If we cache the entire LNKCAP word early enough, we may be able to
use it in other places that read LNKCAP, e.g. pcie_get_speed_cap(),
pcie_get_width_cap(), pcie_init(), etc.

 - Add struct pci_dev.lnkcap (u32)
 - Read PCI_EXP_LNKCAP in set_pcie_port_type() and save it 
   in pci_dev.lnkcap
 - Use pdev->lnkcap instead of reading PCI_EXP_LNKCAP

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 7 ++-----
 drivers/pci/probe.c     | 1 +
 include/linux/pci.h     | 1 +
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index b17e5ffd31b1..3ada61828014 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -177,15 +177,13 @@ static void pcie_set_clkpm(struct pcie_link_state *link, int enable)
 static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
 {
 	int capable = 1, enabled = 1;
-	u32 reg32;
 	u16 reg16;
 	struct pci_dev *child;
 	struct pci_bus *linkbus = link->pdev->subordinate;
 
 	/* All functions should have the same cap and state, take the worst */
 	list_for_each_entry(child, &linkbus->devices, bus_list) {
-		pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &reg32);
-		if (!(reg32 & PCI_EXP_LNKCAP_CLKPM)) {
+		if (!(child->lnkcap & PCI_EXP_LNKCAP_CLKPM)) {
 			capable = 0;
 			enabled = 0;
 			break;
@@ -397,9 +395,8 @@ static void pcie_get_aspm_reg(struct pci_dev *pdev,
 			      struct aspm_register_info *info)
 {
 	u16 reg16;
-	u32 reg32;
+	u32 reg32 = pdev->lnkcap;
 
-	pcie_capability_read_dword(pdev, PCI_EXP_LNKCAP, &reg32);
 	info->support = (reg32 & PCI_EXP_LNKCAP_ASPMS) >> 10;
 	info->latency_encoding_l0s = (reg32 & PCI_EXP_LNKCAP_L0SEL) >> 12;
 	info->latency_encoding_l1  = (reg32 & PCI_EXP_LNKCAP_L1EL) >> 15;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 2f66988cea25..6cae7230f3b5 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1480,6 +1480,7 @@ void set_pcie_port_type(struct pci_dev *pdev)
 	pdev->pcie_flags_reg = reg16;
 	pci_read_config_word(pdev, pos + PCI_EXP_DEVCAP, &reg16);
 	pdev->pcie_mpss = reg16 & PCI_EXP_DEVCAP_PAYLOAD;
+	pcie_capability_read_dword(pdev, PCI_EXP_LNKCAP, &pdev->lnkcap);
 
 	parent = pci_upstream_bridge(pdev);
 	if (!parent)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 34c1c4f45288..3d30d3650ac9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -375,6 +375,7 @@ struct pci_dev {
 						   bit manually */
 	unsigned int	d3_delay;	/* D3->D0 transition time in ms */
 	unsigned int	d3cold_delay;	/* D3cold->D0 transition time in ms */
+	u32		lnkcap;		/* Link Capabilities */
 
 #ifdef CONFIG_PCIEASPM
 	struct pcie_link_state	*link_state;	/* ASPM link state */
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
