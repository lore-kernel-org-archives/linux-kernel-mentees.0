Return-Path: <SRS0=oG7b=AA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7450BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Jun 2020 21:12:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 499CC21527
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Jun 2020 21:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xt+ERAcz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 499CC21527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E7B885EF0;
	Fri, 19 Jun 2020 21:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Jm3EBgqT60l; Fri, 19 Jun 2020 21:12:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BD20086FF0;
	Fri, 19 Jun 2020 21:12:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC3FCC07FF;
	Fri, 19 Jun 2020 21:12:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 597F9C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 21:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 567B489B33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 21:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BuR5DJXC2N4S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 21:12:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0093B89B01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 21:12:07 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id o15so11592169ejm.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 14:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KMBNaqmBbj9htNDag97z0bn7cN5DmjB31K/2q35ybKs=;
 b=Xt+ERAczMjZ5VwzchOiLz2WSckbRaMvRMHmHlkReP29Uod92e0e1ioG8V+RkzSEgWJ
 V3GXll6AHBebYlNtGn8Y7vr3xKZgY+Q15a5kdw3I0KGzFfUevDuvQbLf0/A8tbew17H7
 HAhJENkAawKNsnVCqTrA2Ky5TRisZXzzcF9UcGhSrVTuVBN2DgQQZJQVp4mkR5cP7MQO
 O4MUeE8X1kUgc9lz8/iwEeoKEyOt+8vQd3HIJoAqYvjdPJkqf40Uo7WIqiE7F5YaZBvV
 NNEo7fNmqIZY0ABGTXXp+Q60EGeLbeJobHd5NMY4nyfJlKGd0vdpImuh//P+baFQ+vk6
 oXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KMBNaqmBbj9htNDag97z0bn7cN5DmjB31K/2q35ybKs=;
 b=j1PboETcP1EOj3z4xceQQuV0PO+m6g4O3VdSDz2DE6OTzEvPxlLadA5xgbQ9+6xPqb
 c9Hao2930VG8S9A/9LRZdC1hXV1fC2OmVweOHnVtLWOWcgl6PduiAJBRy4J1elI1uCDN
 /omUw9GQ7c0uVWTp/nn2P7kiSRppzlgmIpAEw/39mdapa8TVd6ByO2TSsldBPL4Qa1de
 DdL2wIKexqUXSuIHTjMKnrLnBB/PjbMiXRbNO9WOJlM2YKCo+Hm11PE3t+cTQnAjr463
 OxKfMLq5jNiXLJ6V1WNIKVKW3dVxPZGK3omx0owy86KgA7gaKcg2jLy4e14LqIuq6gyO
 wk0Q==
X-Gm-Message-State: AOAM5313ertR06orSMvK/qO/KFhsUP9q88OQ1q4zodgvpcIQV+WBj2ru
 a3GEtXjIQYrZch5fgd5Hguw=
X-Google-Smtp-Source: ABdhPJyhe2+WW0hS1ywIY94bX4KQCWNto2I3Plf2M3dquuOAxpUzYIJyWAHUvLTbyMt1mGxsoLKAKA==
X-Received: by 2002:a17:907:7294:: with SMTP id
 dt20mr5300331ejc.355.1592601126447; 
 Fri, 19 Jun 2020 14:12:06 -0700 (PDT)
Received: from net.saheed (54001B7F.dsl.pool.telekom.hu. [84.0.27.127])
 by smtp.gmail.com with ESMTPSA id kt10sm5485833ejb.54.2020.06.19.14.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 14:12:05 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Date: Fri, 19 Jun 2020 22:12:19 +0200
Message-Id: <20200619201219.32126-3-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200619201219.32126-1-refactormyself@gmail.com>
References: <20200619201219.32126-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] PCI: pciehp: Fix wrong failure
	check on pcie_capability_read_*()
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

On failure, pcie_capabiility_read_*() will set the status value,
its last parameter to 0 and not ~0.
This bug fix checks for the proper value.

Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/hotplug/pciehp_hpc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 53433b37e181..c1a67054948a 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -89,7 +89,7 @@ static int pcie_poll_cmd(struct controller *ctrl, int timeout)
 
 	do {
 		pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
-		if (slot_status == (u16) ~0) {
+		if (slot_status == (u16)0) {
 			ctrl_info(ctrl, "%s: no response from device\n",
 				  __func__);
 			return 0;
@@ -165,7 +165,7 @@ static void pcie_do_write_cmd(struct controller *ctrl, u16 cmd,
 	pcie_wait_cmd(ctrl);
 
 	pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
-	if (slot_ctrl == (u16) ~0) {
+	if (slot_ctrl == (u16)0) {
 		ctrl_info(ctrl, "%s: no response from device\n", __func__);
 		goto out;
 	}
@@ -236,7 +236,7 @@ int pciehp_check_link_active(struct controller *ctrl)
 	int ret;
 
 	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
-	if (ret == PCIBIOS_DEVICE_NOT_FOUND || lnk_status == (u16)~0)
+	if (ret == PCIBIOS_DEVICE_NOT_FOUND || lnk_status == (u16)0)
 		return -ENODEV;
 
 	ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
@@ -440,7 +440,7 @@ int pciehp_card_present(struct controller *ctrl)
 	int ret;
 
 	ret = pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
-	if (ret == PCIBIOS_DEVICE_NOT_FOUND || slot_status == (u16)~0)
+	if (ret == PCIBIOS_DEVICE_NOT_FOUND || slot_status == (u16)0)
 		return -ENODEV;
 
 	return !!(slot_status & PCI_EXP_SLTSTA_PDS);
@@ -592,7 +592,7 @@ static irqreturn_t pciehp_isr(int irq, void *dev_id)
 
 read_status:
 	pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &status);
-	if (status == (u16) ~0) {
+	if (status == (u16)0) {
 		ctrl_info(ctrl, "%s: no response from device\n", __func__);
 		if (parent)
 			pm_runtime_put(parent);
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
