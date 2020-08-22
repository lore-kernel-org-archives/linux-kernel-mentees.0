Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87612C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58CA92078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWfa5XV3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58CA92078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 47364883E4;
	Sat, 22 Aug 2020 21:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2voyjB84aEb; Sat, 22 Aug 2020 21:03:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B6EC4883C1;
	Sat, 22 Aug 2020 21:03:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5AF3C089F;
	Sat, 22 Aug 2020 21:03:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37F09C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 221B284F61
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3G7V2Ee5GP8h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 725E984E49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:49 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y3so5050254wrl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NKu4a+HkX28TNHkgVDVe5TtmWD3OwW+G2J9ctyauT2U=;
 b=UWfa5XV39a6eWf+M9zF+kfhKz7KlB5zJjfxxSCriG4ALHC1AQZApQ9JnWkyd5u2thm
 YI37zcAyotUW3w9zwuR4wYefzLCoGvBSORbnBXZzaXy2RgIUs/r7++Yq+rlW6TbhQhCM
 qp1Zic0Nm0++MCUUokvChr62IQMuws2kl7IYxjXflnB3nPCYINlaGg1+xB6Su2Tku9T9
 avzFKZ1Lwl051NtgdhHMiJXLVZWNztP1scR6KpUeIKuPZMtYphYtB2S5Z4YC89SB3KKS
 XYOtgxxBgpsKO2u5RyNR/nzC22TB06drHs0CPVuRO26/4Jbsug0tSWG+FWbGiHmFtMd4
 rpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NKu4a+HkX28TNHkgVDVe5TtmWD3OwW+G2J9ctyauT2U=;
 b=pdHLH7tXiJzrE9vW5IC8QkhvAKPT8ay3R8UgIgAk70R8Kl4GvLmK8KRfvfF/xVYxvW
 XyAmBqazKIHY/rHD1Td9Y3B5k13sz6WjXLFg5KBqcW/kEcUnF0UhvwXrqnPnEddoYyJc
 /52RiWt7if4HNbSoiZoWnCHbHpZ0ArScMYEgQXqYVqVeE7ZB91FBA0HbUs9E63U+ObRJ
 XTLVmEfRLOb/c8kJFVb6KrNKn+BD+5PUDuCBcVeRnIhMneSjoWyoTrnmIoqrI1eBZsmc
 21+bcH3vpn06s5UdEHW8+epKkt1ZW1S9zUrTFgj+eqJ8kLfY+olq+YocvKc6gbUiSUa2
 d6Gg==
X-Gm-Message-State: AOAM533I4iBMLsR1Eb+B6iYRrDOR/HQVsB8BCoDXsGFfs7ZKeEgW/UHl
 LuyXM7rt35IP5oBQ06KlKt8=
X-Google-Smtp-Source: ABdhPJzqOabYwW23VcRzd1YZFTFZwaoK+xbZ4tWiHxcDMQ3F8WVk3XeQnwM4UF2FumhiiIKDngyeDw==
X-Received: by 2002:a5d:484d:: with SMTP id n13mr8286997wrs.297.1598130227995; 
 Sat, 22 Aug 2020 14:03:47 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:47 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:46 +0200
Message-Id: <20200822200358.252967-12-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 11/23] PCI: Rework and Rename
	aspm_calc_l1ss_info()
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

The value of l1ss_cap_ptr can nw be obtained directly from struct
pci_dev, it is no useful to cache it. So, aspm_calc_l1ss_info()
will only be computing the values of ctl1 and ctl2.

 - Rename aspm_calc_l1ss_info() to aspm_calc_l1ss_ctl_values().
 - Rework the function to take a pci_dev and values' pointer.
 - Remove caching of pdev->l1ss_cap_ptr
 - Change calls to aspm_calc_l1ss_info() into new function.
 - Access pdev->l1ss_cap_ptr directly
 - No more reference to struct pcie_link_state.l1ss, so remove it.

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 43 ++++++++++++++---------------------------
 1 file changed, 15 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 89f3f3a6d007..4cff11dc8d83 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -74,14 +74,6 @@ struct pcie_link_state {
 	 * has one slot under it, so at most there are 8 functions.
 	 */
 	struct aspm_latency acceptable[8];
-
-	/* L1 PM Substate info */
-	struct {
-		u32 up_cap_ptr;		/* L1SS cap ptr in upstream dev */
-		u32 dw_cap_ptr;		/* L1SS cap ptr in downstream dev */
-		u32 ctl1;		/* value to be programmed in ctl1 */
-		u32 ctl2;		/* value to be programmed in ctl2 */
-	} l1ss;
 };
 
 static int aspm_disabled, aspm_force;
@@ -444,17 +436,15 @@ static struct pci_dev *pci_function_0(struct pci_bus *linkbus)
 }
 
 /* Calculate L1.2 PM substate timing parameters */
-static void aspm_calc_l1ss_info(struct pcie_link_state *link)
+static void aspm_calc_l1ss_ctl_values(struct pci_dev *pdev,
+						u32 *ctl1, u32 *ctl2)
 {
+	struct pcie_link_state *link = pdev->link_state;
 	u32 val1, val2, scale1, scale2;
 	u32 t_common_mode, t_power_on, l1_2_threshold, scale, value;
 	struct pci_dev *dw_pdev = link->downstream;
 	struct pci_dev *up_pdev = link->pdev;
 
-	link->l1ss.up_cap_ptr = up_pdev->l1ss_cap_ptr;
-	link->l1ss.dw_cap_ptr = dw_pdev->l1ss_cap_ptr;
-	link->l1ss.ctl1 = link->l1ss.ctl2 = 0;
-
 	if (!(link->aspm_support & ASPM_STATE_L1_2_MASK))
 		return;
 
@@ -471,10 +461,10 @@ static void aspm_calc_l1ss_info(struct pcie_link_state *link)
 
 	if (calc_l1ss_pwron(up_pdev, scale1, val1) >
 	    calc_l1ss_pwron(dw_pdev, scale2, val2)) {
-		link->l1ss.ctl2 |= scale1 | (val1 << 3);
+		*ctl2 |= scale1 | (val1 << 3);
 		t_power_on = calc_l1ss_pwron(up_pdev, scale1, val1);
 	} else {
-		link->l1ss.ctl2 |= scale2 | (val2 << 3);
+		*ctl2 |= scale2 | (val2 << 3);
 		t_power_on = calc_l1ss_pwron(dw_pdev, scale2, val2);
 	}
 
@@ -490,7 +480,7 @@ static void aspm_calc_l1ss_info(struct pcie_link_state *link)
 	 */
 	l1_2_threshold = 2 + 4 + t_common_mode + t_power_on;
 	encode_l12_threshold(l1_2_threshold, &scale, &value);
-	link->l1ss.ctl1 |= t_common_mode << 8 | scale << 29 | value << 16;
+	*ctl1 |= t_common_mode << 8 | scale << 29 | value << 16;
 }
 
 static u32 get_aspm_enable(struct pci_dev *pdev)
@@ -620,13 +610,13 @@ static void pci_clear_and_set_dword(struct pci_dev *pdev, int pos,
 /* Configure the ASPM L1 substates */
 static void pcie_config_aspm_l1ss(struct pcie_link_state *link, u32 state)
 {
-	u32 val, enable_req;
+	u32 val, enable_req, ctl1, ctl2;
 	struct pci_dev *child = link->downstream, *parent = link->pdev;
-	u32 up_cap_ptr = link->l1ss.up_cap_ptr;
-	u32 dw_cap_ptr = link->l1ss.dw_cap_ptr;
+	int up_cap_ptr = parent->l1ss_cap_ptr;
+	int dw_cap_ptr = child->l1ss_cap_ptr;
 
 	enable_req = (parent->aspm_enabled ^ state) & state;
-	aspm_calc_l1ss_info(link);
+	aspm_calc_l1ss_ctl_values(parent, &ctl1, &ctl2);
 
 	/*
 	 * Here are the rules specified in the PCIe spec for enabling L1SS:
@@ -661,24 +651,21 @@ static void pcie_config_aspm_l1ss(struct pcie_link_state *link, u32 state)
 
 		/* Program T_POWER_ON times in both ports */
 		pci_write_config_dword(parent, up_cap_ptr + PCI_L1SS_CTL2,
-				       link->l1ss.ctl2);
+				       ctl2);
 		pci_write_config_dword(child, dw_cap_ptr + PCI_L1SS_CTL2,
-				       link->l1ss.ctl2);
+				       ctl2);
 
 		/* Program Common_Mode_Restore_Time in upstream device */
 		pci_clear_and_set_dword(parent, up_cap_ptr + PCI_L1SS_CTL1,
-					PCI_L1SS_CTL1_CM_RESTORE_TIME,
-					link->l1ss.ctl1);
+					PCI_L1SS_CTL1_CM_RESTORE_TIME, ctl1);
 
 		/* Program LTR_L1.2_THRESHOLD time in both ports */
 		pci_clear_and_set_dword(parent,	up_cap_ptr + PCI_L1SS_CTL1,
 					PCI_L1SS_CTL1_LTR_L12_TH_VALUE |
-					PCI_L1SS_CTL1_LTR_L12_TH_SCALE,
-					link->l1ss.ctl1);
+					PCI_L1SS_CTL1_LTR_L12_TH_SCALE, ctl1);
 		pci_clear_and_set_dword(child, dw_cap_ptr + PCI_L1SS_CTL1,
 					PCI_L1SS_CTL1_LTR_L12_TH_VALUE |
-					PCI_L1SS_CTL1_LTR_L12_TH_SCALE,
-					link->l1ss.ctl1);
+					PCI_L1SS_CTL1_LTR_L12_TH_SCALE, ctl1);
 	}
 
 	val = 0;
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
