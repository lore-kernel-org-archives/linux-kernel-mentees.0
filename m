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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5364EC433F4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 22:20:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2634620674
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 22:20:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG717Mh+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2634620674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D9BDB89FB9;
	Fri, 10 Jul 2020 22:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dkwqTod60ZYV; Fri, 10 Jul 2020 22:20:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 332FF89FC7;
	Fri, 10 Jul 2020 22:20:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F0C0C1798;
	Fri, 10 Jul 2020 22:20:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30E8CC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F26DC2E967
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsUmkMxcIPMd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 78CAC2DF58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:20 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b6so7321818wrs.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Aw1VsrtSYtcq2poBq51sXMfz6dSvwXJUJRkwZAWrd10=;
 b=aG717Mh+yfnVzffccC3T0g+foEBFsfS7f2qjhmFbKfu/ee4DvajkEXLibWdoOSN7Gy
 O2NlqE/yED1WCoVri14mxo1nA/DhbC4TfFlh+gDBhkTm1i++nEIvYhUnzX75RuLHVhxn
 N5qjIWWQTLGympOy6JJWc3WCP5U9JJE8x4rilTRv6CObWA2Npbxl8MILdn1cGUsg8uSf
 IcFSnILXaC+/DetMjFrcZg99zlfx/4nMgcNCPUU1OEUwYVeKbACTIARFV52P8VyaIUjL
 xRZYffbDwY9H9ssJZP1M7fjNvV9Hb7XepWAyzFgoN8RL4oGs+tKFrYDoFvFNAalnk/1b
 xxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Aw1VsrtSYtcq2poBq51sXMfz6dSvwXJUJRkwZAWrd10=;
 b=ppuvey/Le/S64N7LYQqeLPBG9fammrW6ZDxdUeL+61dgXVlDXJsyYUaqbcLcNPs6Hq
 gM6lvyaICpEiWENU4sod/alzzzPiT7jrErBXlBaEmcl0G/SKQzC2XaGMac+gYlXrOtFl
 +trSvXI3cMHMyVX8d+kuEdhBf9+4QRbbm4fmIkSp2JddcBlUv+rpPN5q0EawGncAMLbj
 gGAbAZ2VJ+fjOUizfIKQ/sdCKYS0O7lXvcg/W9NgkBIAklO2vJKaqsGuVBBVijs3tANB
 gpGHQD/DEcL7Jsr0LB1cdbTmWI6oPGcy8IE/DwxOObKPi1AZ52v8v9tl8/A89MxmK+gQ
 IBYQ==
X-Gm-Message-State: AOAM533mWhtzJH0YAI7I0LCrVIF36b1bevLmOXpm9su6gmSLiXcQQaZK
 HD4COCS9Lka6YYT1ax8F+mI=
X-Google-Smtp-Source: ABdhPJyv0JZcNwPCwOQC9NfYv6P2Yb1NOOR9kLooOJDcTnXEuQTTkqbzAPMkpAORzJE7k8uyZ+FXmg==
X-Received: by 2002:a5d:66ca:: with SMTP id k10mr58545944wrw.244.1594419619001; 
 Fri, 10 Jul 2020 15:20:19 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id l18sm12170281wrm.52.2020.07.10.15.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 15:20:18 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Fri, 10 Jul 2020 23:20:21 +0200
Message-Id: <20200710212026.27136-10-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200710212026.27136-1-refactormyself@gmail.com>
References: <20200710212026.27136-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 9/14 v3] PCI: pciehp: Check return
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

This bug can be avoided if the return value of pcie_capability_read_word
is checked to confirm success.

Check the return value of pcie_capability_read_dword() to ensure success.
Return a value that indicate the result of pcie_capability_read_word().

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/hotplug/pciehp_hpc.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 5af281d97d4f..0b691e37fd04 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -277,10 +277,11 @@ static void pcie_wait_for_presence(struct pci_dev *pdev)
 {
 	int timeout = 1250;
 	u16 slot_status;
+	int ret;
 
 	do {
-		pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
-		if (slot_status & PCI_EXP_SLTSTA_PDS)
+		ret = pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
+		if (!ret && (slot_status & PCI_EXP_SLTSTA_PDS))
 			return;
 		msleep(10);
 		timeout -= 10;
@@ -354,12 +355,13 @@ int pciehp_get_raw_indicator_status(struct hotplug_slot *hotplug_slot,
 	struct controller *ctrl = to_ctrl(hotplug_slot);
 	struct pci_dev *pdev = ctrl_dev(ctrl);
 	u16 slot_ctrl;
+	int ret;
 
 	pci_config_pm_runtime_get(pdev);
-	pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
+	ret = pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
 	pci_config_pm_runtime_put(pdev);
 	*status = (slot_ctrl & (PCI_EXP_SLTCTL_AIC | PCI_EXP_SLTCTL_PIC)) >> 6;
-	return 0;
+	return pcibios_err_to_errno(ret);
 }
 
 int pciehp_get_attention_status(struct hotplug_slot *hotplug_slot, u8 *status)
@@ -367,9 +369,10 @@ int pciehp_get_attention_status(struct hotplug_slot *hotplug_slot, u8 *status)
 	struct controller *ctrl = to_ctrl(hotplug_slot);
 	struct pci_dev *pdev = ctrl_dev(ctrl);
 	u16 slot_ctrl;
+	int ret;
 
 	pci_config_pm_runtime_get(pdev);
-	pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
+	ret = pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
 	pci_config_pm_runtime_put(pdev);
 	ctrl_dbg(ctrl, "%s: SLOTCTRL %x, value read %x\n", __func__,
 		 pci_pcie_cap(ctrl->pcie->port) + PCI_EXP_SLTCTL, slot_ctrl);
@@ -389,7 +392,7 @@ int pciehp_get_attention_status(struct hotplug_slot *hotplug_slot, u8 *status)
 		break;
 	}
 
-	return 0;
+	return pcibios_err_to_errno(ret);
 }
 
 void pciehp_get_power_status(struct controller *ctrl, u8 *status)
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
