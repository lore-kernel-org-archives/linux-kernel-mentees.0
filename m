Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A8DC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 10:31:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 776FF20774
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 10:31:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cg2exXge"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 776FF20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5529188409;
	Mon,  6 Jul 2020 10:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTApKYeS7-ax; Mon,  6 Jul 2020 10:31:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 330B88832C;
	Mon,  6 Jul 2020 10:31:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19828C1797;
	Mon,  6 Jul 2020 10:31:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C59DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 298B5887D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sU3KNJ1m0VMO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3CD49887E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:55 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z2so17964397wrp.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zIc+ryXbVspn9u+GSLsSwM5Cff3RjamOLjlQZyxFr+U=;
 b=cg2exXge4dbjo5XG0pFDqzL4EhbxVye2Y2SrCQv/P2Dg2tU+/5QN+wUT5XfILrK669
 StfO6eeTUTyg3zJq2I3CJ+rZAEjFi03MOLGodp2ZjGdKraqFoyDCCQLbp+stXcS0rSGk
 EeJxe8rvAE8Tbp6sce9+rVFKzDBtgvB3d6wCyI5HatgTE2+x3QE6ooHDcRIP0cPGFQp7
 z1A+03J1XT8xTyK3YOYa4o61qT3mqZBb5lSTgp0LNkck2wLm8qRcpiFspO81+BGlBc4Z
 yus+TgOMZRecaarzNx1To3/r7LBqROPWCwgsUF0Y4B8XTureThhh1unrmpXQuys2tGqC
 ihZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zIc+ryXbVspn9u+GSLsSwM5Cff3RjamOLjlQZyxFr+U=;
 b=eKj6bBWsL9NnF8w9UzLP5CsCHMiJn7AX4pbVdEfLKouLqXeXa0baeaUBYH1F8Gy+vz
 XCFuBctdJ2Yh07NXfCPnZ+QnqHq7T/2q9Mhv/pAGp2DLCuZP0UjZXOtst0VdIMbjnlwb
 6b585z0/W1Njw1TPPd/9m5uRYXdHEedZypBqASntYNzJznV/XZJ+ntxIOMeddEhfG/UW
 fxj2Ek754LY+e181c4fTsQeKsyPn5cyxTzs5danAwhOuEFixmOQVZgKg/qQL/kA29EDY
 /tVGI7YeyklwBHcYZNSErPUh4f3YQgoUgA+mNDr+25iwiMIxeSCURZ42AE8rOAltrOIw
 /cKg==
X-Gm-Message-State: AOAM533Oe0z4y2OMcb40uv73NHsUg0gh1C5ShTWcGH9ZqWWxz24cSqvY
 tY1cNcYWK4b4dhU7VJph4Aw=
X-Google-Smtp-Source: ABdhPJxCtqWPmnt50I/FTSU/wExRSzDqqvPU1j31/xL1NsH+jBfN84hjLCyjVT7+LEc9gP3gIrxkeA==
X-Received: by 2002:adf:91e1:: with SMTP id 88mr41365811wri.89.1594031513765; 
 Mon, 06 Jul 2020 03:31:53 -0700 (PDT)
Received: from net.saheed (51B7C2DF.dsl.pool.telekom.hu. [81.183.194.223])
 by smtp.gmail.com with ESMTPSA id 22sm24216859wmb.11.2020.07.06.03.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 03:31:53 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Mon,  6 Jul 2020 11:31:13 +0200
Message-Id: <20200706093121.9731-4-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200706093121.9731-1-refactormyself@gmail.com>
References: <20200706093121.9731-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 3/11 RFC] PCI: pciehp: Validate with
	the return value of pcie_capability_read_*()
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

On any failure pcie_capability_read_word() sets it's last parameter, *val
to 0. If pci_config_read_word() fails the *val is reset to 0. Any function
which check only for a frabricated ~0 which fail in this case.

Include a check on the return value of pcie_capability_read_dword() to
confirm success or failure.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

---
 drivers/pci/hotplug/pciehp_hpc.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 53433b37e181..5af281d97d4f 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -86,10 +86,11 @@ static int pcie_poll_cmd(struct controller *ctrl, int timeout)
 {
 	struct pci_dev *pdev = ctrl_dev(ctrl);
 	u16 slot_status;
+	int ret;
 
 	do {
-		pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
-		if (slot_status == (u16) ~0) {
+		ret = pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
+		if (ret || (slot_status == (u16) ~0)) {
 			ctrl_info(ctrl, "%s: no response from device\n",
 				  __func__);
 			return 0;
@@ -156,6 +157,7 @@ static void pcie_do_write_cmd(struct controller *ctrl, u16 cmd,
 {
 	struct pci_dev *pdev = ctrl_dev(ctrl);
 	u16 slot_ctrl_orig, slot_ctrl;
+	int ret;
 
 	mutex_lock(&ctrl->ctrl_lock);
 
@@ -164,8 +166,8 @@ static void pcie_do_write_cmd(struct controller *ctrl, u16 cmd,
 	 */
 	pcie_wait_cmd(ctrl);
 
-	pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
-	if (slot_ctrl == (u16) ~0) {
+	ret = pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
+	if (ret || (slot_ctrl == (u16) ~0)) {
 		ctrl_info(ctrl, "%s: no response from device\n", __func__);
 		goto out;
 	}
@@ -430,7 +432,7 @@ void pciehp_get_latch_status(struct controller *ctrl, u8 *status)
  * removed immediately after the check so the caller may need to take
  * this into account.
  *
- * It the hotplug controller itself is not available anymore returns
+ * If the hotplug controller itself is not available anymore returns
  * %-ENODEV.
  */
 int pciehp_card_present(struct controller *ctrl)
@@ -591,8 +593,8 @@ static irqreturn_t pciehp_isr(int irq, void *dev_id)
 	}
 
 read_status:
-	pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &status);
-	if (status == (u16) ~0) {
+	ret = pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &status);
+	if (ret || (status == (u16) ~0)) {
 		ctrl_info(ctrl, "%s: no response from device\n", __func__);
 		if (parent)
 			pm_runtime_put(parent);
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
