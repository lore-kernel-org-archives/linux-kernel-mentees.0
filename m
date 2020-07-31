Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981BAC433EB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D71722B40
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHoHf9/m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D71722B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2228A2201C;
	Fri, 31 Jul 2020 12:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bgXhECl4iakA; Fri, 31 Jul 2020 12:02:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A3DA221511;
	Fri, 31 Jul 2020 12:02:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 958F4C0050;
	Fri, 31 Jul 2020 12:02:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A61CC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E979D88318
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YvRgULnMgHBh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E36E487784
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:26 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id a21so31150712ejj.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 05:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MwqyF9CqW8A2iZOP3zewT7pOoo+Y4wjTCBBLr9pFHV8=;
 b=lHoHf9/m1kx7BZ7ww7TnAOjVdHgOjMgE7yLieOTnDqQNJxPrzZpx4X7luLE6X5qwZS
 MSfM/WDG7Z7cYyAiYMXIgsf1/QIs51JUxiIZRyCPeJq5PHrzXYxoL9BclsHkuD1PanUC
 KN2TTvAcBF4bg2m0vXqdzEoStoCvDD/GLmoS+SebIRyOdOr6Eg6ZksoFBxWVKMYxIfo+
 bIEm18ANbRdC7thEM0MAPhXn+OJ1s0C2E7tVzn6L91sQsZhNgOe88CHyvFgroBFxhBlS
 26c6SmuBWXqQk1wEhtz7P/KBka4UMvcRd8VoKGhOPGOWlRPPvTUpLoV1+aGynqXJqYbq
 2UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MwqyF9CqW8A2iZOP3zewT7pOoo+Y4wjTCBBLr9pFHV8=;
 b=V0uZVds3kVlLqUUfmIiVB6ZOvI3Djgh+62Lzmgi7cjy1ebaEM3HIXD/p9LbD2bsTiR
 cRAjlt5DKvV9sXLgSBZXQReYW0Ji5vByAwupqeGv45AqNZ45ytGNFvBXwSNkG9u30s/5
 3rF/iOyqh0opW5cCYPKcH1pbAHU3LbjhzgdmX1IVo5G0HBnMcYw6bzBw4l/Z8/qfrg4R
 JdxaETOZbgEkyUiRSo+ZnvWq2AiEV9BB/chT83pkV67txfhkQYp3eEMXnI3/mwrpDfJB
 /WcwXqczf2BD0BIs/bSCIa4ieY1ogmlumJJukMc0ayrJSsc0r3crOelKodEi1WkbATE3
 lqtA==
X-Gm-Message-State: AOAM530G4pDYZBcyHXKlqueWmx689YeMNfZmCrZ3PF4XY4nOCY7++vv/
 qNot0yYLcP9VX1rKq9ArepE=
X-Google-Smtp-Source: ABdhPJxTrzSFodIyak2PVFdWY/r/1cAygHW7Lv6TgpA0BgOnyI9xtpwXpNfkEtXqEA40584a4tXzpA==
X-Received: by 2002:a17:906:8748:: with SMTP id
 hj8mr3778605ejb.477.1596196945471; 
 Fri, 31 Jul 2020 05:02:25 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id j5sm9091734ejk.87.2020.07.31.05.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:02:24 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Fri, 31 Jul 2020 13:02:34 +0200
Message-Id: <20200731110240.98326-7-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200731110240.98326-1-refactormyself@gmail.com>
References: <20200731110240.98326-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 06/12] PCI: pciehp: Check if
	pcie_capability_read_*() reads ~0
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

On failure pcie_capability_read_word() sets it's last parameter, val
to 0. However, with Patch 12/12, it is possible that val is set to
~0 on failure. This introduces a bug because (x & x) == (~0 & x).

Since ~0 is an invalid value here,

pciehp_get_power_status():
Add an extra check for ~0 on the value read. If found, set status
to 'Power On' and return.

pcie_wait_for_presence():
Add an extra check for no ~0 to the exit condition of the loop

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/hotplug/pciehp_hpc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index b89c9ee4a3b5..39305aabc3a2 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -278,7 +278,7 @@ static void pcie_wait_for_presence(struct pci_dev *pdev)
 
 	do {
 		pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
-		if (slot_status & PCI_EXP_SLTSTA_PDS)
+		if ((slot_status != (u16)~0) && (slot_status & PCI_EXP_SLTSTA_PDS))
 			return;
 		msleep(10);
 		timeout -= 10;
@@ -399,6 +399,11 @@ void pciehp_get_power_status(struct controller *ctrl, u8 *status)
 	ctrl_dbg(ctrl, "%s: SLOTCTRL %x value read %x\n", __func__,
 		 pci_pcie_cap(ctrl->pcie->port) + PCI_EXP_SLTCTL, slot_ctrl);
 
+	if (slot_ctrl == (u16)~0) {
+		*status = 1;    /* On */
+		return;
+	}
+
 	switch (slot_ctrl & PCI_EXP_SLTCTL_PCC) {
 	case PCI_EXP_SLTCTL_PWR_OFF:
 		*status = 0;	/* Off */
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
