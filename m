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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CE6C433EC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 22:20:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A25920725
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 22:20:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5cw7rCE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A25920725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 03E5588B1F;
	Fri, 10 Jul 2020 22:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJMr8FETyIGj; Fri, 10 Jul 2020 22:20:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0059088AF3;
	Fri, 10 Jul 2020 22:20:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4259C0895;
	Fri, 10 Jul 2020 22:20:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00125C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E0ECD2E967
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mz0tew7LjW9T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 1F45C2DF58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 22:20:16 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f7so7361927wrw.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 15:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4W35ujYJlxKgHmJjOxh/l83E+9wVDyy9zXN8EsZkeBk=;
 b=s5cw7rCE0EWbF55kNa6MNaVUq9gxiw+DyerLx6J8txZcNXN19MIjAyBDqnoBlEoP1h
 OV4Jf4zPg4eoXxh6lRNIg//4gI/0L4lpCXVaKg5TBN6L/9m+NiW8BwXmYlbEzuabJ0te
 jLOZiyK1vLPR9AiJmAiEZeCWWxf8niZ1CEI90IICoBeecmKquzqhTb1PltP2NHM98Sob
 iIIlbZMhMCt3Ylsgi/MEpQujQAYKFP49Dk7kQkX//ko9E6xQs24vUmNBF397HgFDKadZ
 g9eVCpQO3O6FhhbMsdJrFi1Ufvy7Mfr1Xbev5QW4v2Y1ZBAWUEP5gqmyE9qse3fqBdfQ
 zCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4W35ujYJlxKgHmJjOxh/l83E+9wVDyy9zXN8EsZkeBk=;
 b=kV8xfNuwL7Axoa/wV6ZeC6uTCcBzejOc5k0Ryo/QvmPky+cVPLguGTww+vtyA3w1et
 GTAborhGBFVLyfoW5mVERT/fKbKGbCO/SiODHOdFeYzl2+U8+krlRmFBpUB0VElPz4Qx
 HwL+MIU7n2S3iJT3QByjuxWrhUpV/GNwkpvc4UjIz2OFKRHxowARCBPB26ah9g6aoiDl
 CZRtNL5l042Hw6+LgRqWN2gTbrIask8S6C701CZFVvjKjefJt+GevP18hVEf70hhlK5+
 uVquM9Z0sSUGe/w8A4iPp/coO+vlRVIl74Y6RLlqOnsOkM0/FRzBAcwRLVK9Zt1fC+Xp
 MXIQ==
X-Gm-Message-State: AOAM531mmHSgE5kCx/b6Llt2J9Zq7lX7jXAqE3XAtcuHD11GECuzeupV
 hGlfvXJireFzabkf4bh1I4Y=
X-Google-Smtp-Source: ABdhPJzPwatony6Cjt8uiw1I+bb2q4igHjoQj2S+/ZwwO9vnHpqlg5m64LJZADjKjjMfX4mcscdugQ==
X-Received: by 2002:a5d:464e:: with SMTP id j14mr69427633wrs.393.1594419614348; 
 Fri, 10 Jul 2020 15:20:14 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id l18sm12170281wrm.52.2020.07.10.15.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 15:20:13 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Fri, 10 Jul 2020 23:20:17 +0200
Message-Id: <20200710212026.27136-6-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200710212026.27136-1-refactormyself@gmail.com>
References: <20200710212026.27136-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 5/14 v3] PCI: pciehp: Check the
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

On any failure pcie_capability_read_word() sets it's last parameter,
*val to 0, this value may have be earlier set by pci_config_read_word()
to ~0. So, any function which check only for a frabricated ~0 will fail
in this case.

Checking for the return value of pcie_capability_read_dword() will help
assert failure or success of this function. But more checks may be needed
to assure the validity of the value.

Include a check on the return value of pcie_capability_read_word() to
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
