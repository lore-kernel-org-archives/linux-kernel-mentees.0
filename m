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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4D6C433FB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 22:20:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D2EA2068F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 22:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igXknrAx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D2EA2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E388A899BB;
	Fri, 10 Jul 2020 22:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMaKWjkyHaS1; Fri, 10 Jul 2020 22:20:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 576B689802;
	Fri, 10 Jul 2020 22:20:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53D60C077B;
	Fri, 10 Jul 2020 22:20:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68A95C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 650D589FC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u+Yow4uflYtF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2E58E89FC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:25 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g10so9335473wmc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 15:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RPlXxwxC87uaq64nnqw5MANvLol+4JOrpjsVdPBxD3o=;
 b=igXknrAx+ieLXkXBcEVFyoWfoYs+N5dQQI59AiDzZ1RrQb2nMVrxJB3zRBeI5nLuP0
 xiQ+T1T30ezIW8OnSvFK8+//wKnlQDz7NjoE+g3+5UWx9KODFbIMb6vTsi8Y4tRi1wDH
 CmWoJfru5cZ/yAaIZc7sNTHKl8keBtYbmZLuHZRNyV6v/0R05rkDitki9YMfdSOTG61j
 Ru/MJmcLzXsKbMe9gRKUnFajnt/kNutKehlRM2ZGzB63l85mPpADGL9tXAt1oTS4hb8O
 MeHpRsE86DJf/E5NSkfQWwLoI8gNcwh2hwt8Y8r5+g2KZ0moALU1wlXRl0H4ZkZiMsS9
 WY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RPlXxwxC87uaq64nnqw5MANvLol+4JOrpjsVdPBxD3o=;
 b=NPmIO3vXIVIunGCUQ0XovMFloOetaVjK6hS4PZWB2viJMpVjmDH2emWwruYs+Anvs2
 H47GsXFvPaZo9ca6J9UDnP49N4Yhfg4U32fSkC008zVYS/1uQ09IXUzJqAQ+UWfLIxN6
 dHdmtVUGJyXQTySMxxuZCPZKV4kX4KLlOiGmXo8k4AklEW+CNHZN+Jxm6mg4sTedFEnQ
 /kEr8+Ybxrpw4hgfRbad+rJEFP/Hbsavcly2n6MjIhFxRh3TBgoyzA2BgI+37kzonNbS
 MlxQ0KEYgMvejdBaiWIFvHQRNR2G0bv8qD52qkYc5UI/IjGmwlKzaUkUO+7vaw4iK/ly
 qwZw==
X-Gm-Message-State: AOAM5335hB+E9v06LhLPcL3Q3638BWPd+fWyIzE47oqgYVi0HKEE7+7N
 ah6ZUqOsDzDv/KTzfGa6qDM=
X-Google-Smtp-Source: ABdhPJw7prCE9OQvuQ0E1c9jwZDnLvGW1QVsVB0xRmxoIUNhwpjMs85LIeoQU/ueNJLJo1JwN/DhIw==
X-Received: by 2002:a7b:ca52:: with SMTP id m18mr7036373wml.92.1594419623608; 
 Fri, 10 Jul 2020 15:20:23 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id l18sm12170281wrm.52.2020.07.10.15.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 15:20:23 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Fri, 10 Jul 2020 23:20:25 +0200
Message-Id: <20200710212026.27136-14-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200710212026.27136-1-refactormyself@gmail.com>
References: <20200710212026.27136-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 13/14] PCI/ASPM: Check the return
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
However, with Patch 14/14, it is possible that val is set to ~0 on
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
