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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56313C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 279952078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUAWkMv7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 279952078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E14F2883C9;
	Sat, 22 Aug 2020 21:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nk1xeEJCdn9D; Sat, 22 Aug 2020 21:03:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3EE8788395;
	Sat, 22 Aug 2020 21:03:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 360A6C08A2;
	Sat, 22 Aug 2020 21:03:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4250CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5687584F48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D1YZTMONQg_W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EB41E84E6B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:41 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a5so5054757wrm.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F9s6VEDKP02m9dkcReoClAIp0sUIe1v7UKyJLxqbwkk=;
 b=HUAWkMv7GaSIxfjyVE2ZSu+zAUyL9I5HjjX7u4A2iZjh7rh81vobwd72LlLerQuPVn
 8nGFYs9Fi74UJJbYNmJ9mRS73FKiCKxLsQ95yIUvfJzz/9WAP4kvFeAVme+kUusSu7x7
 NXWFm7kzP3B5lbtdyuPwoCxsKnzUfoWQh0JHLHV89ESX7BVD1/yENCRKCdaoOWoTvmSj
 VAlzwtOW4kkZeGX5Se+zhdSxsRcHiQadpfuVzBSSk3T7qKgrcuCibr49883fe0Z8gHPa
 8IqXXus33Gq6dNQxQB9gpk855Tx4TrD/AdVoLRr8euwqFjp2W9fBS8z3wo+YkAzGTrYz
 i/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F9s6VEDKP02m9dkcReoClAIp0sUIe1v7UKyJLxqbwkk=;
 b=nlJE9+7/wvaJE5oXcvRpdOplsTITfVOb2zaaATmYXFaJpcY2pQhznQ2GlToJgphRIm
 ltvzKAgPViqFbVHSNa7z87b2E7VntjHu/1qcOMTCJAqbRhv1+uePoNHd9WTNibyi1DAR
 Rz4OeNHViS2mCzBLx/8xtYBkWir2JxHEHcV/i5ALzSCH8tMOZdw5T+enC3zH2vIQwfSg
 JbMQBk9HZK/r5HSsOVq6jSbQK8XMnDImtyMykXmNiOmEEguKEDQYMK6ifwGrR9UCGm9v
 BjT9Ogncf1EZKafSmO5V+ipfisoAX1APIWQWsrKyGznwB7z07EWMAKbubaoDErUgl5cx
 EmQA==
X-Gm-Message-State: AOAM531cx2XgRImEByuInltqRZAq875AjDolNuinfG5aHjnSmrs3dwCz
 7pBiKwbOOwZ7Ecuw+72NweA=
X-Google-Smtp-Source: ABdhPJy/g5X/7zxL1m16CI0roBpswJQSupLGQ2TXMUxuSvM4OJPc1TGlUGe7bca+Keg0goQ4b+fiRQ==
X-Received: by 2002:a5d:5486:: with SMTP id h6mr7887001wrv.136.1598130218825; 
 Sat, 22 Aug 2020 14:03:38 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:38 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:38 +0200
Message-Id: <20200822200358.252967-4-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 03/23] PCI: Rework
	calc_l*_latency() to take a pci_dev *
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

 - Change the argument of calc_l0s_latency() to  pci_dev *,
 - Change the argument of calc_l1_latency() to  pci_dev *,
 - Compute encodings inside the function
 - Change callers to pass in pci_dev *

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 3ada61828014..629737125b36 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -306,8 +306,10 @@ static void pcie_aspm_configure_common_clock(struct pcie_link_state *link)
 }
 
 /* Convert L0s latency encoding to ns */
-static u32 calc_l0s_latency(u32 encoding)
+static u32 calc_l0s_latency(struct pci_dev *pdev)
 {
+	u32 encoding = (pdev->lnkcap & PCI_EXP_LNKCAP_L0SEL) >> 12;
+
 	if (encoding == 0x7)
 		return (5 * 1000);	/* > 4us */
 	return (64 << encoding);
@@ -322,8 +324,10 @@ static u32 calc_l0s_acceptable(u32 encoding)
 }
 
 /* Convert L1 latency encoding to ns */
-static u32 calc_l1_latency(u32 encoding)
+static u32 calc_l1_latency(struct pci_dev *pdev)
 {
+	u32 encoding = (pdev->lnkcap & PCI_EXP_LNKCAP_L1EL) >> 15;
+
 	if (encoding == 0x7)
 		return (65 * 1000);	/* > 64us */
 	return (1000 << encoding);
@@ -587,16 +591,16 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 		link->aspm_enabled |= ASPM_STATE_L0S_UP;
 	if (upreg.enabled & PCIE_LINK_STATE_L0S)
 		link->aspm_enabled |= ASPM_STATE_L0S_DW;
-	link->latency_up.l0s = calc_l0s_latency(upreg.latency_encoding_l0s);
-	link->latency_dw.l0s = calc_l0s_latency(dwreg.latency_encoding_l0s);
+	link->latency_up.l0s = calc_l0s_latency(parent);
+	link->latency_dw.l0s = calc_l0s_latency(child);
 
 	/* Setup L1 state */
 	if (upreg.support & dwreg.support & PCIE_LINK_STATE_L1)
 		link->aspm_support |= ASPM_STATE_L1;
 	if (upreg.enabled & dwreg.enabled & PCIE_LINK_STATE_L1)
 		link->aspm_enabled |= ASPM_STATE_L1;
-	link->latency_up.l1 = calc_l1_latency(upreg.latency_encoding_l1);
-	link->latency_dw.l1 = calc_l1_latency(dwreg.latency_encoding_l1);
+	link->latency_up.l1 = calc_l1_latency(parent);
+	link->latency_dw.l1 = calc_l1_latency(child);
 
 	/* Setup L1 substate */
 	if (upreg.l1ss_cap & dwreg.l1ss_cap & PCI_L1SS_CAP_ASPM_L1_1)
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
