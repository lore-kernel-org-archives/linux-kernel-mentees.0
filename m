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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB6AC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 22:20:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A04F820674
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 22:20:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vBecEFbh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A04F820674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E4F289802;
	Fri, 10 Jul 2020 22:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HDfPRYxuftsn; Fri, 10 Jul 2020 22:20:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 103498991B;
	Fri, 10 Jul 2020 22:20:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2F04C077B;
	Fri, 10 Jul 2020 22:20:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBE75C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BA61589938
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdvfAAEEsx3I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 741C689802
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:18 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id o8so7581417wmh.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 15:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zBfQN+vRaGSFliSIC9sUYYBlJBWdf+Mc3nVjYABa6uc=;
 b=vBecEFbh/d0jSef2GGDkawA1rYeo7al4di1WqcRGBfvnRrTP2sQxtQ0PJwcAgiO5qe
 MGsc06bJHFGxcuKxJEQnwXXsbhVhwXOIFkM7N/BdSw7KytVkbUqwRgCgR0jvV4AXKVCM
 mNRjwHqEUbOHu7JVc+2DOTngEfZFUvsXnoFl99OezVwXeJ+rXwhReatDgo1Ck2JO/kxY
 UZ11NYvdsJyVUZJKJSsdFaD8sfkVHxddqoSvWwfDuAQZt6rXeBv1fUkNJRmaR3d9rvUQ
 1wa5IR6Xo1ZY7GKo7UgBdWpgkGe3f+hZpgf596QE3g6SXnBHKtk8tP0bakSwc4saynAE
 fqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zBfQN+vRaGSFliSIC9sUYYBlJBWdf+Mc3nVjYABa6uc=;
 b=cNbzUJmmD2anxALh8vL3NgaCdoMOWxVFa0UHkGL01VeoZAGfy3mT0RzMOweOwTgtVc
 8sfyrAVqG0A9q2HpkT9MRqLGsZUbi5jDedNQQg/mHp9M5Cf4am3z0CouBgHM+AgKwqEF
 NZmaeJ55wXpTGr7/wR2mG6viI9jixutgdGe/JU3Be1XBnjQ8FrRA+DQsVi/EkmEbXfRz
 BCduuOitCEB62H7Uk9ZjdgsWMB92uDjugUQ/E9jcLIwAIEldq/1mdgvhYlM1anueSTvP
 PqdyCB9bEYNo3AiVn3XJ1dDzBm2LbtB0tzB/6Z2AwTaBACR3869zlLkaljODn+3W6/6k
 7dHA==
X-Gm-Message-State: AOAM530BfD0FLIaiGgml9c8U03a8fXoFosL1ejZ98iZ6LlPYqnDdAsmQ
 3Ig+/Ak7dsi4jWW10wgGlXU=
X-Google-Smtp-Source: ABdhPJyfeh9pQCHsK+AR0ZiTfubZZSMON0PFLNp3rQLm4JcDpLNUMt2j2BpVH5xqfzX/lX304gQmIg==
X-Received: by 2002:a1c:4086:: with SMTP id n128mr7445658wma.118.1594419616792; 
 Fri, 10 Jul 2020 15:20:16 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id l18sm12170281wrm.52.2020.07.10.15.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 15:20:16 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Fri, 10 Jul 2020 23:20:19 +0200
Message-Id: <20200710212026.27136-8-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200710212026.27136-1-refactormyself@gmail.com>
References: <20200710212026.27136-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 7/14 v3] PCI: pciehp: Check the
	return value of pcie_capability_read_*()
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

If pcie_capability_read_word() fail, slot_ctrl will be 0 and the switch
expression evaluates to 0. So *status = 1 "ON". However, with Patch 14/14
it is possible that slot_ctrl is set to ~0 on failure. This would 
introduce a bug because (x & x) == (~0 & x), so the switch expression
evaluates to PCI_EXP_SLTCTL_PCC. This means that on failure *status = 1
"OFF", since PCI_EXP_SLTCTL_PCC = PCI_EXP_SLTCTL_PWR_OFF.

Use an if-statement and include a check on the return value of
pcie_capability_read_word() to confirm success or failure.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

---
 drivers/pci/hotplug/pciehp_hpc.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index b89c9ee4a3b5..f5ef3fbace69 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -394,20 +394,16 @@ void pciehp_get_power_status(struct controller *ctrl, u8 *status)
 {
 	struct pci_dev *pdev = ctrl_dev(ctrl);
 	u16 slot_ctrl;
+	int ret;
 
-	pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
+	*status = 1;	/* On */
+	ret = pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
 	ctrl_dbg(ctrl, "%s: SLOTCTRL %x value read %x\n", __func__,
 		 pci_pcie_cap(ctrl->pcie->port) + PCI_EXP_SLTCTL, slot_ctrl);
 
-	switch (slot_ctrl & PCI_EXP_SLTCTL_PCC) {
-	case PCI_EXP_SLTCTL_PWR_OFF:
+	if (!ret &&
+		((slot_ctrl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF))
 		*status = 0;	/* Off */
-		break;
-	case PCI_EXP_SLTCTL_PWR_ON:
-	default:
-		*status = 1;	/* On */
-		break;
-	}
 }
 
 void pciehp_get_latch_status(struct controller *ctrl, u8 *status)
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
