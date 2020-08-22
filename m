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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEEFC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D22CE2078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAQ2FLbW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D22CE2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A0CF520395;
	Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id syaB0AhN2oY1; Sat, 22 Aug 2020 21:04:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 26A6920553;
	Sat, 22 Aug 2020 21:04:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15D21C07FF;
	Sat, 22 Aug 2020 21:04:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9DF5BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 872BB87E30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x41LPoLAMBuc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AFDC587E2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:58 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x9so1010386wmi.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XDD2D+x1p5QjZyLe+q1DAHVYfAyMxrKDPczSy8YZkj0=;
 b=OAQ2FLbWSSrCpG6QBYQvrA1UiGuRGBld4me+voOItjFNEkHSnAuRMhbr+nW638+qSU
 rBh6CD9wpHfLIr+Ch1Y9KBh882tcL+3kEtLAdrj+21r90EqJXo+NDxajFzz3NyaPmHpR
 /5NHQ/tobGsELDIPTEmtM4DEzpe5CID37GA49AJCjMqfpk0pSfAaq/Qkt3utC6qB9Vu5
 +koRrVHcr25VBgSXqPbw7rzYPByREIe7dsxGl+UixgM3+L36kjLiecWKFcAmCa+39tp/
 p1sXTPosat0VSBTuW3PKkiRqPOAnCigGO0QFzqXdsOqL+RP9YOZfGBcGTocebVnhmpHw
 g4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XDD2D+x1p5QjZyLe+q1DAHVYfAyMxrKDPczSy8YZkj0=;
 b=O/SJoSIkUMpF+r7a9eIq0rTmyXEF3mq50Ot2XsjH2DEqIVmxB8A512grthUIxtcj/J
 YCNMa/7TEsNSMAw3mATFRs0/HNKmafWdnynO/mE/n/O4u5ZdsTk+l6N2A5tIW/av0mK1
 /OxGm8xAE2dcoTo0iCH4npq4zPNFcEdYfjPBBuKveYaOjDOGIGXGZZnN6Oi+15lG79u4
 yrGq9LQWcxlecLAxtylVuvIgDmFIAH7rcbgnPbcGksdd4nJuppLUM1tjSTVWp4jPIL2f
 iwuAVT6j8q4Xi4p7AChjCbCsvWDmAudd5b93OlME3vYglfFuALg1rP6WmhJhAtvpBsg5
 z9Vw==
X-Gm-Message-State: AOAM530/W7UgPKZHpANBzOO4x4PrEPZjv2lTs8ivVpWWP9ZVIRll4axI
 xNsCzdYEgf4Agf8emIjko+Y=
X-Google-Smtp-Source: ABdhPJw8pV324X7ihYUtRVoiQ1o3gk7ihacu92iHvySh9rQteNJdJ4H42h7dhzUKbwQ2qwJYJx9avg==
X-Received: by 2002:a7b:c056:: with SMTP id u22mr9603819wmc.188.1598130237250; 
 Sat, 22 Aug 2020 14:03:57 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:56 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:52 +0200
Message-Id: <20200822200358.252967-18-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 17/23] PCI: Remove .clkpm_*
	from struct pcie_link_state
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

 - Remove initiations of pcie_link_state.clkpm_*
 - Replace all access to pcie_link_state.clkpm_* with pci_pdev.clkpm_*
 - Remove pcie_link_state.clkpm_*

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 56fdf2e7c98a..27a590fe6b23 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -53,12 +53,6 @@ struct pcie_link_state {
 	u32 aspm_capable:7;		/* Capable ASPM state with latency */
 	u32 aspm_default:7;		/* Default ASPM state by BIOS */
 	u32 aspm_disable:7;		/* Disabled ASPM state */
-
-	/* Clock PM state */
-	u32 clkpm_capable:1;		/* Clock PM capable? */
-	u32 clkpm_enabled:1;		/* Current Clock PM state */
-	u32 clkpm_default:1;		/* Default Clock PM state by BIOS */
-	u32 clkpm_disable:1;		/* Clock PM disabled */
 };
 
 static int aspm_disabled, aspm_force;
@@ -119,7 +113,7 @@ static int policy_to_clkpm_state(struct pci_dev *pdev)
 		/* Enable Clock PM */
 		return 1;
 	case POLICY_DEFAULT:
-		return pdev->link_state->clkpm_default;
+		return pdev->clkpm_default;
 	}
 	return 0;
 }
@@ -135,7 +129,6 @@ static void pcie_set_clkpm_nocheck(struct pci_dev *pdev, int enable)
 		pcie_capability_clear_and_set_word(child, PCI_EXP_LNKCTL,
 						   PCI_EXP_LNKCTL_CLKREQ_EN,
 						   val);
-	link->clkpm_enabled = !!enable;
 	link->pdev->clkpm_enabled = !!enable;
 }
 
@@ -146,10 +139,10 @@ static void pcie_set_clkpm(struct pci_dev *pdev, int enable)
 	 * Don't enable Clock PM if the link is not Clock PM capable
 	 * or Clock PM is disabled
 	 */
-	if (!link->clkpm_capable || link->clkpm_disable)
+	if (!pdev->clkpm_capable || pdev->clkpm_disable)
 		enable = 0;
 	/* Need nothing if the specified equals to current state */
-	if (link->clkpm_enabled == enable)
+	if (pdev->clkpm_enabled == enable)
 		return;
 	pcie_set_clkpm_nocheck(link->pdev, enable);
 }
@@ -173,10 +166,6 @@ static void pcie_clkpm_cap_init(struct pci_dev *pdev, int blacklist)
 		if (!(reg16 & PCI_EXP_LNKCTL_CLKREQ_EN))
 			enabled = 0;
 	}
-	link->clkpm_enabled = enabled;
-	link->clkpm_default = enabled;
-	link->clkpm_capable = capable;
-	link->clkpm_disable = blacklist ? 1 : 0;
 	link->pdev->clkpm_enabled = enabled;
 	link->pdev->clkpm_default = enabled;
 	link->pdev->clkpm_capable = capable;
@@ -1124,7 +1113,6 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 	pcie_config_aspm_link(link->pdev, policy_to_aspm_state(link->pdev));
 
 	if (state & PCIE_LINK_STATE_CLKPM) {
-		link->clkpm_disable = 1;
 		bridge->clkpm_disable = 1;
 	}
 	pcie_set_clkpm(link->pdev, policy_to_clkpm_state(link->pdev));
@@ -1284,7 +1272,7 @@ static ssize_t clkpm_show(struct device *dev,
 {
 	struct pci_dev *pdev = pcie_aspm_get_link(to_pci_dev(dev));
 
-	return sprintf(buf, "%d\n", pdev->link_state->clkpm_enabled);
+	return sprintf(buf, "%d\n", pdev->clkpm_enabled);
 }
 
 static ssize_t clkpm_store(struct device *dev,
@@ -1301,7 +1289,6 @@ static ssize_t clkpm_store(struct device *dev,
 	down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
 
-	link->clkpm_disable = !state_enable;
 	link->pdev->clkpm_disable = !state_enable;
 	pcie_set_clkpm(link->pdev, policy_to_clkpm_state(link->pdev));
 
@@ -1349,7 +1336,7 @@ static umode_t aspm_ctrl_attrs_are_visible(struct kobject *kobj,
 		return 0;
 
 	if (n == 0)
-		return link->clkpm_capable ? a->mode : 0;
+		return pdev->clkpm_capable ? a->mode : 0;
 
 	return link->aspm_capable & aspm_state_map[n - 1] ? a->mode : 0;
 }
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
