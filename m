Return-Path: <SRS0=keMi=AS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99632C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 23:03:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B3872075B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 23:03:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJbEd0Xq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B3872075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 45425893A8;
	Tue,  7 Jul 2020 23:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iFg73shjAh9H; Tue,  7 Jul 2020 23:03:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C95668939C;
	Tue,  7 Jul 2020 23:03:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3730C0893;
	Tue,  7 Jul 2020 23:03:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B3CFC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 550D289388
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6kQa-ypKpXpc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 93DAD89364
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:51 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id ga4so48396117ejb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jul 2020 16:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=e4G/JDoHnmGcmiWO+UuUF925AfFaFCnVB7/GokdCrOY=;
 b=AJbEd0XqvMDu+0bE7N9RmjLOcr0Og7QcFpFp4MUIslagtlDEHgID+7gQjqwiscgzGQ
 UOj49BA0anS6lCCRP7qIzyM9iwXu8Ac9jhUfgW/dbBjH0Rbz5e+v6YH/9yQXtziXRf9q
 z7liwPyqRfbSD+mWIn/SYWtVuuaFsHEvS9Sf5qDAShA7HkRn5/K2KIJBTgCJsMAsJegm
 EZREP6gbXfPoOX9sJWg6yNUdouum4rh63F2S0UCJ0ySG+hx46sNNRjGknMq175wp3iZ2
 7wJtSXlKWXzI0ZWnre9ZTLoPWpaQAa/d1lfnMKkyVSPhhpnLZqLKoXH0hmk1V3ZQ3dT9
 HFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=e4G/JDoHnmGcmiWO+UuUF925AfFaFCnVB7/GokdCrOY=;
 b=kxGnrRMWs0fWKBV6y5xQybul3WxujQFQbOoNDOv+h48+OXzB6TfyEKD047IgHHKiWx
 yDWSuxQU6yo6RJSPTzP7XguFpi/IecI4ojwL3BKtvtlNngbOiMGQ8nFgmZm5k2g6flEp
 tQsFwEy4czefYZ58S05smw8zdP9vvES/P3t74h9JNBJtmK9OSe9JOpVy+f6BP+Wmdifj
 qjTibltsXnEutm+b3NpNHNe2+Bgtvf3g9rnlmDRE0fhj5snUiAmXZlifVTBPDKVHBEXd
 azQvP45pkie/s0ODvCaqzLBPAd20p/zv95p4opeeP3hnDne1c3ViHmeV3ds/1sgpxyU8
 3+HA==
X-Gm-Message-State: AOAM5328ZSP3uwHshEl1FBRV9tuJThbqIu4e9AxCqz/fomuJbTxgFOaL
 tc0t4G025p1bFf16VfDdUOo=
X-Google-Smtp-Source: ABdhPJziO2EooRxmhGRlmXsIplf+xLYmAnXBQg/xCPfOuDZzI1DJIjQoP8x71+sdMX2I61jJCh4nLQ==
X-Received: by 2002:a17:906:4942:: with SMTP id
 f2mr51414548ejt.125.1594163030039; 
 Tue, 07 Jul 2020 16:03:50 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id f10sm27096310edx.5.2020.07.07.16.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 16:03:49 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Wed,  8 Jul 2020 00:03:17 +0200
Message-Id: <20200707220324.8425-7-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200707220324.8425-1-refactormyself@gmail.com>
References: <20200707220324.8425-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 6/13] PCI: pciehp: Make "Power On"
	the default
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
currently causes "On" value to be set if it fails. Patch 13/13
changes the behaviour of pcie_capability_read_word() so on failure the
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
