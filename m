Return-Path: <SRS0=keMi=AS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71212C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 23:03:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43EED2065D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 23:03:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1wMkPbj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43EED2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1BDA589413;
	Tue,  7 Jul 2020 23:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id naMwaHLGXqEn; Tue,  7 Jul 2020 23:03:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B30189387;
	Tue,  7 Jul 2020 23:03:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 973E4C0893;
	Tue,  7 Jul 2020 23:03:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3B98C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DF758873AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id URQKlavmnDaI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1D8AE87394
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:50 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id w6so48465542ejq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jul 2020 16:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x34hXCcOq59WMJYswPIxPqVvlEOUWxWGz29l8+4Mdjw=;
 b=d1wMkPbjCRoYy7TJn/HYtJHqbPRdbaCl9YnetgtC3UW52u/JOaVgwix9/i2yGw77LC
 r50eNX0fUNjMOiVj+XEKZMjAaQp+qT93i5Db/X5tSN7V1YnKbTgnV2wn2afqodBgRClN
 CBbGjwiNWrGSsfBhxIWybQZvDfdzbRisgvH4XWGSI5qPpF2UU9iH20AzzjEWhFColZEO
 87QIjpQz2rzfXjNXlX1ZIL6fqUReVqNcuJtUFIwXMRceNd509uB0tszSaSNrgDwHOYa5
 BIi4wMmyG0MAMbl1p5Ue8tXRTmMN4Lgik+gsr0QN1FIBXhMjv+h/pZR7CnXO00h1GbG0
 KV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x34hXCcOq59WMJYswPIxPqVvlEOUWxWGz29l8+4Mdjw=;
 b=V2sGthzNZBqLm22cs9+00xIdlckOYfnlschp/RfUkra6PaCC5ZzCdNil4+5IAUw+ka
 bhBmmmALyYnMUENmoyDAFS+1+2xqLJ3eGwflTJUEhlHGqpiRP9ubFSkktkxVLKYDdSzw
 Icb4tdiyBux6O4nof1FmM/bhg/ufzq0pT/MCXmERw0NsybbG+YWvKsDpand4uzO5orVn
 xij99GWfFFRNjZNF+8yx3CQ8V+Gyw+AVfYoBmz04FWRYTOCFHdB3vk65GwfctcTA3wWw
 gft+Dnwlx9bHPVuI1OhmBdSWVL58nAS7nWff9ukVQ3BntkYmk+DosqO/X9lD58wHDQKh
 r8yA==
X-Gm-Message-State: AOAM530QbhkocgMvhLgpkt/8mWHHbPtuVCgkQIJvAG4SeHKOxyEASGd+
 zOIxlgYPdsp27RSxeJQSsGg=
X-Google-Smtp-Source: ABdhPJwMi5t8+SwOH4qQAhVQzCugy87cSLNBZoVzPV8TP8kjpAMnP7DLxA+3/V4kzTpmayrI9WZM0w==
X-Received: by 2002:a17:906:95d9:: with SMTP id
 n25mr50823340ejy.437.1594163028584; 
 Tue, 07 Jul 2020 16:03:48 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id f10sm27096310edx.5.2020.07.07.16.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 16:03:48 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Wed,  8 Jul 2020 00:03:16 +0200
Message-Id: <20200707220324.8425-6-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200707220324.8425-1-refactormyself@gmail.com>
References: <20200707220324.8425-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 5/13] PCI: pciehp: Check the return
	value of pcie_capability_read_*()
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
