Return-Path: <SRS0=4Ypl=AV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8ABC433F2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 22:20:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E29522068F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 22:20:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed5gwn4T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E29522068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B580A2E990;
	Fri, 10 Jul 2020 22:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aMoeaDMGtG0w; Fri, 10 Jul 2020 22:20:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 53F232E987;
	Fri, 10 Jul 2020 22:20:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E70AC08A9;
	Fri, 10 Jul 2020 22:20:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77A27C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 519152E967
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5gev95Un5SP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id DF2A92E8A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:22 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 17so7316841wmo.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 15:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/DGPoUKfitACThlLV4LP7NGjasXKQ1tYflzyCbCjHy8=;
 b=ed5gwn4TL9l6C2hiNge5RZpFsA3eH8Iphd/yN7KO/OEDmm0/OSkvJI4TCYu/rzQnYy
 0hyFq0ogXey3cZKxUvgeTPTs/hHUXW9/Vra3kb4T7oqh4Rq0PKSYLKAZZVD7N0/YdZri
 o4pY0AafSoWv/ld1mPCMM40Ysb1qqNrorEylEsXqfbi8jrrBBvpZkgioI+UbW+pX3KOy
 UGp1uGHS+r5gJJ9cvYLS5usc37+cPk7luqVtbwn9usBa+1oGAAyG+JHvt8mx1q71xuS5
 Qf7uWVrXkrai9JcSXa2KhvDd2u1heIIhby4m4sVfaqwry1ZxAw9wUIQmnDzShMn0ukX3
 PFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/DGPoUKfitACThlLV4LP7NGjasXKQ1tYflzyCbCjHy8=;
 b=icU51g7tNAf0nltqmbUbCBYI49O5+UF1vX8e9m5IQGYU63F24AwX864yaue9uWJ+LW
 1g4tke9SjUiyQGYq3ZzJIMGXXD05WbM9oWUn841Rl3qpvyUxIrdfHP+6hgBSTBJ//Pp9
 bRi76jbN7rvaBDfeqR/2IlJp/uCl5IPcW8wpvU6RCF0Dfpsd4wHCGHbUM6A8rQAkz1Sq
 IZsFaC/MRLDU6G1AsRbEQbLEXGPCY8zLXaGU/CO7cr8oXilTTUYPhpT6W+nTENhCrTx3
 o0QIoO4hk6e0+lfr9T5uaRJSPdp5k5skN3ztzcuI+VeDtkcXUWYdCFrHSbFIgw5qBqF2
 Vfiw==
X-Gm-Message-State: AOAM530tZiUZn/4Wk+F+Osv5f9kBEav54M3+2FBv4rycLdm1BUdiQzyg
 NJ1bREJX8LKkAvF8UhJJO78=
X-Google-Smtp-Source: ABdhPJx1ZcaQfkFJ2dxuru9m9ZjdAi9ZYjp4N9+6ITauNzxYltGNvZLsptAH6OhVGB2ky+/up1DUQQ==
X-Received: by 2002:a1c:6706:: with SMTP id b6mr6726758wmc.167.1594419621287; 
 Fri, 10 Jul 2020 15:20:21 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id l18sm12170281wrm.52.2020.07.10.15.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 15:20:20 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Fri, 10 Jul 2020 23:20:23 +0200
Message-Id: <20200710212026.27136-12-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200710212026.27136-1-refactormyself@gmail.com>
References: <20200710212026.27136-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 11/14 v3] PCI/PM: Check return value
	of pcie_capability_read_*()
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

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

On failure pcie_capability_read_dword() sets it's last parameter,
val to 0.
However, with Patch 14/14, it is possible that val is set to ~0 on
failure. This would introduce a bug because (x & x) == (~0 & x).

This bug can be avoided if the return value of pcie_capability_read_dword
is checked to confirm success.

Check the return value of pcie_capability_read_dword() to ensure success.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/pci.c | 52 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index ce096272f52b..9f18ffbf7bd4 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3207,6 +3207,7 @@ void pci_configure_ari(struct pci_dev *dev)
 {
 	u32 cap;
 	struct pci_dev *bridge;
+	int ret;
 
 	if (pcie_ari_disabled || !pci_is_pcie(dev) || dev->devfn)
 		return;
@@ -3215,8 +3216,8 @@ void pci_configure_ari(struct pci_dev *dev)
 	if (!bridge)
 		return;
 
-	pcie_capability_read_dword(bridge, PCI_EXP_DEVCAP2, &cap);
-	if (!(cap & PCI_EXP_DEVCAP2_ARI))
+	ret = pcie_capability_read_dword(bridge, PCI_EXP_DEVCAP2, &cap);
+	if (ret || !(cap & PCI_EXP_DEVCAP2_ARI))
 		return;
 
 	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ARI)) {
@@ -3606,6 +3607,7 @@ int pci_enable_atomic_ops_to_root(struct pci_dev *dev, u32 cap_mask)
 	struct pci_bus *bus = dev->bus;
 	struct pci_dev *bridge;
 	u32 cap, ctl2;
+	int ret;
 
 	if (!pci_is_pcie(dev))
 		return -EINVAL;
@@ -3629,28 +3631,29 @@ int pci_enable_atomic_ops_to_root(struct pci_dev *dev, u32 cap_mask)
 	while (bus->parent) {
 		bridge = bus->self;
 
-		pcie_capability_read_dword(bridge, PCI_EXP_DEVCAP2, &cap);
+		ret = pcie_capability_read_dword(bridge, PCI_EXP_DEVCAP2,
+								&cap);
 
 		switch (pci_pcie_type(bridge)) {
 		/* Ensure switch ports support AtomicOp routing */
 		case PCI_EXP_TYPE_UPSTREAM:
 		case PCI_EXP_TYPE_DOWNSTREAM:
-			if (!(cap & PCI_EXP_DEVCAP2_ATOMIC_ROUTE))
+			if (ret || !(cap & PCI_EXP_DEVCAP2_ATOMIC_ROUTE))
 				return -EINVAL;
 			break;
 
 		/* Ensure root port supports all the sizes we care about */
 		case PCI_EXP_TYPE_ROOT_PORT:
-			if ((cap & cap_mask) != cap_mask)
+			if (ret || ((cap & cap_mask) != cap_mask))
 				return -EINVAL;
 			break;
 		}
 
 		/* Ensure upstream ports don't block AtomicOps on egress */
 		if (pci_pcie_type(bridge) == PCI_EXP_TYPE_UPSTREAM) {
-			pcie_capability_read_dword(bridge, PCI_EXP_DEVCTL2,
-						   &ctl2);
-			if (ctl2 & PCI_EXP_DEVCTL2_ATOMIC_EGRESS_BLOCK)
+			ret = pcie_capability_read_dword(bridge,
+						PCI_EXP_DEVCTL2, &ctl2);
+			if (!ret && (ctl2 & PCI_EXP_DEVCTL2_ATOMIC_EGRESS_BLOCK)
 				return -EINVAL;
 		}
 
@@ -4507,12 +4510,13 @@ EXPORT_SYMBOL(pci_wait_for_pending_transaction);
 bool pcie_has_flr(struct pci_dev *dev)
 {
 	u32 cap;
+	int ret;
 
 	if (dev->dev_flags & PCI_DEV_FLAGS_NO_FLR_RESET)
 		return false;
 
-	pcie_capability_read_dword(dev, PCI_EXP_DEVCAP, &cap);
-	return cap & PCI_EXP_DEVCAP_FLR;
+	ret = pcie_capability_read_dword(dev, PCI_EXP_DEVCAP, &cap);
+	return (!ret && !!(cap & PCI_EXP_DEVCAP_FLR));
 }
 EXPORT_SYMBOL_GPL(pcie_has_flr);
 
@@ -4672,7 +4676,7 @@ static bool pcie_wait_for_link_delay(struct pci_dev *pdev, bool active,
 		msleep(20);
 	for (;;) {
 		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
-		ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
+		ret = !!(!ret && (lnk_status & PCI_EXP_LNKSTA_DLLLA));
 		if (ret == active)
 			break;
 		if (timeout <= 0)
@@ -5774,6 +5778,7 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
 	enum pci_bus_speed next_speed;
 	enum pcie_link_width next_width;
 	u32 bw, next_bw;
+	int ret;
 
 	if (speed)
 		*speed = PCI_SPEED_UNKNOWN;
@@ -5783,7 +5788,12 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
 	bw = 0;
 
 	while (dev) {
-		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
+		ret = pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
+
+		if (ret) {
+			dev = pci_upstream_bridge(dev);
+			continue;
+		}
 
 		next_speed = pcie_link_speed[lnksta & PCI_EXP_LNKSTA_CLS];
 		next_width = (lnksta & PCI_EXP_LNKSTA_NLW) >>
@@ -5820,6 +5830,7 @@ EXPORT_SYMBOL(pcie_bandwidth_available);
 enum pci_bus_speed pcie_get_speed_cap(struct pci_dev *dev)
 {
 	u32 lnkcap2, lnkcap;
+	int ret;
 
 	/*
 	 * Link Capabilities 2 was added in PCIe r3.0, sec 7.8.18.  The
@@ -5830,16 +5841,18 @@ enum pci_bus_speed pcie_get_speed_cap(struct pci_dev *dev)
 	 * should use the Supported Link Speeds field in Link Capabilities,
 	 * where only 2.5 GT/s and 5.0 GT/s speeds were defined.
 	 */
-	pcie_capability_read_dword(dev, PCI_EXP_LNKCAP2, &lnkcap2);
+	ret = pcie_capability_read_dword(dev, PCI_EXP_LNKCAP2, &lnkcap2);
 
 	/* PCIe r3.0-compliant */
-	if (lnkcap2)
+	if (!ret && lnkcap2)
 		return PCIE_LNKCAP2_SLS2SPEED(lnkcap2);
 
-	pcie_capability_read_dword(dev, PCI_EXP_LNKCAP, &lnkcap);
-	if ((lnkcap & PCI_EXP_LNKCAP_SLS) == PCI_EXP_LNKCAP_SLS_5_0GB)
+	ret = pcie_capability_read_dword(dev, PCI_EXP_LNKCAP, &lnkcap);
+	if (!ret &&
+		((lnkcap & PCI_EXP_LNKCAP_SLS) == PCI_EXP_LNKCAP_SLS_5_0GB))
 		return PCIE_SPEED_5_0GT;
-	else if ((lnkcap & PCI_EXP_LNKCAP_SLS) == PCI_EXP_LNKCAP_SLS_2_5GB)
+	else if (!ret &&
+		((lnkcap & PCI_EXP_LNKCAP_SLS) == PCI_EXP_LNKCAP_SLS_2_5GB))
 		return PCIE_SPEED_2_5GT;
 
 	return PCI_SPEED_UNKNOWN;
@@ -5856,9 +5869,10 @@ EXPORT_SYMBOL(pcie_get_speed_cap);
 enum pcie_link_width pcie_get_width_cap(struct pci_dev *dev)
 {
 	u32 lnkcap;
+	int ret;
 
-	pcie_capability_read_dword(dev, PCI_EXP_LNKCAP, &lnkcap);
-	if (lnkcap)
+	ret = pcie_capability_read_dword(dev, PCI_EXP_LNKCAP, &lnkcap);
+	if (!ret && lnkcap)
 		return (lnkcap & PCI_EXP_LNKCAP_MLW) >> 4;
 
 	return PCIE_LNK_WIDTH_UNKNOWN;
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
