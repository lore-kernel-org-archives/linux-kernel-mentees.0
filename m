Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B007C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 10:32:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F37FC20774
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 10:32:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNS1AOdh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F37FC20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D4A0B88489;
	Mon,  6 Jul 2020 10:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-E3jVgay17j; Mon,  6 Jul 2020 10:32:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7148F8834C;
	Mon,  6 Jul 2020 10:32:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B641C0891;
	Mon,  6 Jul 2020 10:32:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2303C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ACF1B882F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bTX8U+ZF5l4A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9C7A1882EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:57 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id o8so38657696wmh.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gLOVpKwfnzdqPjeF9FisBhEgOhhTDNWgNNsho9uiBK8=;
 b=PNS1AOdhKTtQLZQyI5JQWqsfSKn6StXnzQ9fS+uIkFKt/eYOI3XsDToqjFRZ8Uquu0
 5aEvnYw7rdO3qku9pKGyrBh4S8b8PdsY48PxlH1g2BODDaHYIdbqj+ZQYHbgRbV9Xfr7
 dVqET9v2e1LhxYB9b6sUSd2yvSB4NGKussrpxDxU84gw5SCZT3xIljO6U7jpLF+C+oZ6
 uQmGF7YTWB7i7ulAKINHdEhfOMstQHpk0/8mjw3IRY9/EiJ/nvuekRLXAL4BFgaxRBEH
 MqLuCoFx4859jBxZP4AqdeBycYg5TURUtuTIkGoiPh1jPxJCIlUdU1gR1+DsQYrhttpK
 Gr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gLOVpKwfnzdqPjeF9FisBhEgOhhTDNWgNNsho9uiBK8=;
 b=C8vFrwfFj9onGmVD2XTys/51VfWrCAYmWpT2l5fJfc8MraQwqMH+AmtErIXp1FbmuS
 nQIKzkYcAu6YnzBrI+JoTCYif+7zO8OSuTV9D/JISdx/ATCc2h26KcDObNiD2Iri059j
 xmnkcEQL+Y0VDNE/H8iSrTR8ojmi3teby/mbvAajxBKMkIhRTOT19/ciho6FEP/gLgHN
 ICLNy+FNeEZQxgUnIzaneM28gz7QyRYsG00nIE04o4hbbFPZwcIvpT6OEuZ6U+ImGRnY
 mnM2QQPIr2+5RCE594z3BxxaPpyVTVYL+455jA+48RYwF8UPtx5hHpaIYtqk96C3bvqM
 Zhww==
X-Gm-Message-State: AOAM531L3FO8P/2ZZ58ApK64eaDEL13d4pQJUj9i+pXGzc9smTOMEVNb
 t9rUDCrcUTZV3MJ/WLUHa1A=
X-Google-Smtp-Source: ABdhPJxwFsuaA1UtVrdWVLhkh7v8Bjopk63guA9Az8X8ssMRTKHtPQSA15Wy/yavGlrGm3dAMS6F+Q==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr19176296wmc.109.1594031515995; 
 Mon, 06 Jul 2020 03:31:55 -0700 (PDT)
Received: from net.saheed (51B7C2DF.dsl.pool.telekom.hu. [81.183.194.223])
 by smtp.gmail.com with ESMTPSA id 22sm24216859wmb.11.2020.07.06.03.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 03:31:55 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Mon,  6 Jul 2020 11:31:15 +0200
Message-Id: <20200706093121.9731-6-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200706093121.9731-1-refactormyself@gmail.com>
References: <20200706093121.9731-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 5/11 RFC] PCI: pciehp: Make "Power
	On" the default
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

The default case of the switch statement is redundant since 
PCI_EXP_SLTCTL_PCC is only a single bit. pcie_capability_read_word()
currently causes "On" value to be set if it fails. Patch 11/11
changes the behaviour of pcie_capability_read_word() so on falure the
"Off" value will be set.

Make the function set status to "Power On" by default and only set to
Set "Power Off" only if pcie_capability_read_word() is successful and
(slot_ctrl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF. 

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/hotplug/pciehp_hpc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 0b691e37fd04..78f806a9c6f1 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -399,22 +399,16 @@ void pciehp_get_power_status(struct controller *ctrl, u8 *status)
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
-	case PCI_EXP_SLTCTL_PWR_ON:
-		*status = 1;	/* On */
-		break;
-	case PCI_EXP_SLTCTL_PWR_OFF:
+	if (!ret &&
+	    ((slot_ctrl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF))
 		*status = 0;	/* Off */
-		break;
-	default:
-		*status = 0xFF;
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
