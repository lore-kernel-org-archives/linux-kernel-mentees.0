Return-Path: <SRS0=keMi=AS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0B7C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 23:04:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 503A22065D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 23:04:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNi1QyID"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 503A22065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 23599226C2;
	Tue,  7 Jul 2020 23:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujwSihOw56G9; Tue,  7 Jul 2020 23:04:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2777F227E1;
	Tue,  7 Jul 2020 23:04:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13CC3C08A5;
	Tue,  7 Jul 2020 23:04:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82A60C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 71C438939B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9TOY6-tW1BAy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8EC8F89388
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:58 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id a1so48441739ejg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jul 2020 16:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zyI7dGHcWxL5eZIzek4DRLHDe+LxmqM1HBHRwkB+vBg=;
 b=rNi1QyIDolFeJ+HB/5i2r5Ow1H+/X0si1NXLlguXjKTpjIsvtYuEqCtqlJVRguOwts
 ticG98sWnx9Yk1/KwQJ3u7AIigR5PQlFM9zK6Vcsz6WCa83C5F2rUV0sdXMYQnhLi7A5
 nBLzHhvevGRqwmxIudv88KU94WRM7IlYsg4P3EOeCT6ym8ON3WgN2jVm1JokL0peKAKu
 rF4SM2+AHa6PmGAv6wrEV6Lrdm/RnBBD1bWQaos7sKt20c3Jah6yp+psTLOF4jVGD2Hi
 zyzlFXH5de2Ve84dDuMJIUuGcDt57/Lj1rX/eqzVKx+U9TYGt/MiQP+xJzh118a//Jfo
 9pWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zyI7dGHcWxL5eZIzek4DRLHDe+LxmqM1HBHRwkB+vBg=;
 b=nq9ZLCaup9M0HkUxgjwz/i80qvMqHaizCdCLNXIgstoo2KdAl/FLAcqmpz6d/vM4NH
 PJ+NcJ4Gt6JybLCd+u2XYnmf1v/dzFKxJ0JjjShP8Q/fJOnPboHHNljfT/P+vp7HS81s
 56EC5RacUrucVe+/dqHWR3rzG+MlSLcd1uVprogcSjAQRK8Zw9bEcBOKduQ0p9pB2X0T
 ZxUpFVUPOiaq3ciAtkNMNmHtAQ7UteV/JhVjCoeVPTTRKda/R7Zfv6oTsTQu8XR7GKwn
 jhb3BvHb+C8ORqMhrm1YiU0XLQGGAM4RqX1QK6FXys4CjCWn2s2ntPylpsroxKIfyp2Q
 khiA==
X-Gm-Message-State: AOAM532/wsdU9VfkF8zK39eJRGy6mIfHUR68CelqNF3YG2/Bm18FR/Ln
 QGu6WcLVRGMGB2/uZ+Gw6uo=
X-Google-Smtp-Source: ABdhPJwzZujteTN89D0kqoJsaDiQFM33Fe+QmfkWVcFnVysbzBmCcMO7m6PMyYuLx1B0xhAQ5RZhrQ==
X-Received: by 2002:a17:906:1491:: with SMTP id
 x17mr50675187ejc.416.1594163037117; 
 Tue, 07 Jul 2020 16:03:57 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id f10sm27096310edx.5.2020.07.07.16.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 16:03:56 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Wed,  8 Jul 2020 00:03:23 +0200
Message-Id: <20200707220324.8425-13-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200707220324.8425-1-refactormyself@gmail.com>
References: <20200707220324.8425-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 12/13] PCI/ASPM: Check the return
	value of pcie_capability_read_*()
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
However, with Patch 13/13, it is possible that val is set to ~0 on
failure. This would introduce a bug because (x & x) == (~0 & x).

This bug can be avoided if the return value of pcie_capability_read_dword
is checked to confirm success.

Check the return value of pcie_capability_read_dword() to ensure success.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index b17e5ffd31b1..32aa9d57672a 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -176,7 +176,7 @@ static void pcie_set_clkpm(struct pcie_link_state *link, int enable)
 
 static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
 {
-	int capable = 1, enabled = 1;
+	int ret, capable = 1, enabled = 1;
 	u32 reg32;
 	u16 reg16;
 	struct pci_dev *child;
@@ -184,14 +184,14 @@ static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
 
 	/* All functions should have the same cap and state, take the worst */
 	list_for_each_entry(child, &linkbus->devices, bus_list) {
-		pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &reg32);
-		if (!(reg32 & PCI_EXP_LNKCAP_CLKPM)) {
+		ret = pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &reg32);
+		if (ret || !(reg32 & PCI_EXP_LNKCAP_CLKPM)) {
 			capable = 0;
 			enabled = 0;
 			break;
 		}
-		pcie_capability_read_word(child, PCI_EXP_LNKCTL, &reg16);
-		if (!(reg16 & PCI_EXP_LNKCTL_CLKREQ_EN))
+		ret = pcie_capability_read_word(child, PCI_EXP_LNKCTL, &reg16);
+		if (ret || !(reg16 & PCI_EXP_LNKCTL_CLKREQ_EN))
 			enabled = 0;
 	}
 	link->clkpm_enabled = enabled;
@@ -205,6 +205,7 @@ static bool pcie_retrain_link(struct pcie_link_state *link)
 	struct pci_dev *parent = link->pdev;
 	unsigned long end_jiffies;
 	u16 reg16;
+	int ret;
 
 	pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &reg16);
 	reg16 |= PCI_EXP_LNKCTL_RL;
@@ -222,8 +223,8 @@ static bool pcie_retrain_link(struct pcie_link_state *link)
 	/* Wait for link training end. Break out after waiting for timeout */
 	end_jiffies = jiffies + LINK_RETRAIN_TIMEOUT;
 	do {
-		pcie_capability_read_word(parent, PCI_EXP_LNKSTA, &reg16);
-		if (!(reg16 & PCI_EXP_LNKSTA_LT))
+		ret = pcie_capability_read_word(parent, PCI_EXP_LNKSTA, &reg16);
+		if (ret || !(reg16 & PCI_EXP_LNKSTA_LT))
 			break;
 		msleep(1);
 	} while (time_before(jiffies, end_jiffies));
@@ -237,7 +238,7 @@ static bool pcie_retrain_link(struct pcie_link_state *link)
  */
 static void pcie_aspm_configure_common_clock(struct pcie_link_state *link)
 {
-	int same_clock = 1;
+	int ret, same_clock = 1;
 	u16 reg16, parent_reg, child_reg[8];
 	struct pci_dev *child, *parent = link->pdev;
 	struct pci_bus *linkbus = parent->subordinate;
@@ -249,24 +250,24 @@ static void pcie_aspm_configure_common_clock(struct pcie_link_state *link)
 	BUG_ON(!pci_is_pcie(child));
 
 	/* Check downstream component if bit Slot Clock Configuration is 1 */
-	pcie_capability_read_word(child, PCI_EXP_LNKSTA, &reg16);
-	if (!(reg16 & PCI_EXP_LNKSTA_SLC))
+	ret = pcie_capability_read_word(child, PCI_EXP_LNKSTA, &reg16);
+	if (ret || !(reg16 & PCI_EXP_LNKSTA_SLC))
 		same_clock = 0;
 
 	/* Check upstream component if bit Slot Clock Configuration is 1 */
-	pcie_capability_read_word(parent, PCI_EXP_LNKSTA, &reg16);
-	if (!(reg16 & PCI_EXP_LNKSTA_SLC))
+	ret = pcie_capability_read_word(parent, PCI_EXP_LNKSTA, &reg16);
+	if (ret || !(reg16 & PCI_EXP_LNKSTA_SLC))
 		same_clock = 0;
 
 	/* Port might be already in common clock mode */
-	pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &reg16);
-	if (same_clock && (reg16 & PCI_EXP_LNKCTL_CCC)) {
+	ret = pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &reg16);
+	if (!ret && same_clock && (reg16 & PCI_EXP_LNKCTL_CCC)) {
 		bool consistent = true;
 
 		list_for_each_entry(child, &linkbus->devices, bus_list) {
-			pcie_capability_read_word(child, PCI_EXP_LNKCTL,
+			ret = pcie_capability_read_word(child, PCI_EXP_LNKCTL,
 						  &reg16);
-			if (!(reg16 & PCI_EXP_LNKCTL_CCC)) {
+			if (ret || !(reg16 & PCI_EXP_LNKCTL_CCC)) {
 				consistent = false;
 				break;
 			}
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
