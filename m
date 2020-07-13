Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB137C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A4FF206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFjmoNKL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A4FF206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5C60F8907F;
	Mon, 13 Jul 2020 13:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZE5tedEFIEe; Mon, 13 Jul 2020 13:22:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE9CF88F86;
	Mon, 13 Jul 2020 13:22:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5F45C0733;
	Mon, 13 Jul 2020 13:22:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E901DC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CEBB020367
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l2Iqy76LkkyW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by silver.osuosl.org (Postfix) with ESMTPS id A66212002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:41 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id p20so17105853ejd.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kVHWYWvPcZhbbCSVf176+HxbB/imYoYR0qAJmfiByxM=;
 b=QFjmoNKLVNjf3U2P646R/7d2KQk03W7jh/TBjE8hGf6d/jlTCNbiJYpksALoO1lpbB
 c6jGZAv25Va9Vv/meTYwQnEFX+I6e4TriXoajmfjzFcQSGKGoE+apHWx+tgRorVGcYQF
 SFFr7QltezJy570u5Rz+xX65t01O5FRzMr+Q7ApZgfWoQcSBlD5Poi0oizwBwLff2/M9
 4CSVY6TAhIj17xfVDFNCpNgApblJEBWUYePn62g9j5cmua23mA+L0W3MhA0LBFHCbnfm
 WpHPPKG6P6zKvD/p4Uftc8vQwXREU0foxzYAoSBJlS60kzuARgryaULGAdN3pGaa4pRD
 FjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kVHWYWvPcZhbbCSVf176+HxbB/imYoYR0qAJmfiByxM=;
 b=mNpQ9OLv37IaWrb60FEzoCtRwwSMxhhjjkK6b20xNXpVXqk1DMoaRWa4o52Hx7vu3A
 lcTmn1/1GS3/l0dWOedUjscU0Ej1X+1hpeIqoW9Mtf29CD7LUoPwxAZ0akjem890sjp2
 GFkJ1cER0g515/egohnxR6XhPsLoP+IELCs0jyDZzQkJyaty3vOoZ0jPub1kc8wiTxfP
 HYWLiYnl2z9pDVTUHRcRL0VQOjgkBOjyJTAQE/NKRvseRfJj5psL96rwecjts5m7L213
 NsaaapTR+jG69w0pTnhUxwq4UtxJ+kKjTNYKWXnzpSoj2ApiHK3x6XADlhtEq4D/zaYq
 B6Lg==
X-Gm-Message-State: AOAM5312O4VFsd3ZFL8LQlzZmSfMRsrsUzrLaVPnMDz8ieSAA8y3AG1a
 hHvZoCDg+VYddUBVTqeg1gE=
X-Google-Smtp-Source: ABdhPJzejmxGBjJ0fiS9zehGy/8XQ4P0gWhbmgIO8mnaoPpL56MEc2+mI7hVAr8MrmwimXgYioGUVA==
X-Received: by 2002:a17:906:7f90:: with SMTP id
 f16mr72707884ejr.507.1594646560025; 
 Mon, 13 Jul 2020 06:22:40 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:39 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Brian King <brking@us.ibm.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 13 Jul 2020 14:22:15 +0200
Message-Id: <20200713122247.10985-4-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: linux-scsi@vger.kernel.org,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 03/35] scsi: ipr: Change
	PCIBIOS_SUCCESSFUL to 0
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

In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
Their scope should be limited within arch/x86.

Change all PCIBIOS_SUCCESSFUL to 0

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
 drivers/scsi/ipr.c     | 16 ++++++++--------
 drivers/scsi/pmcraid.c |  6 +++---
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
index 7d86f4ca266c..b6c52a04cf52 100644
--- a/drivers/scsi/ipr.c
+++ b/drivers/scsi/ipr.c
@@ -775,7 +775,7 @@ static int ipr_save_pcix_cmd_reg(struct ipr_ioa_cfg *ioa_cfg)
 		return 0;
 
 	if (pci_read_config_word(ioa_cfg->pdev, pcix_cmd_reg + PCI_X_CMD,
-				 &ioa_cfg->saved_pcix_cmd_reg) != PCIBIOS_SUCCESSFUL) {
+				 &ioa_cfg->saved_pcix_cmd_reg) != 0) {
 		dev_err(&ioa_cfg->pdev->dev, "Failed to save PCI-X command register\n");
 		return -EIO;
 	}
@@ -797,7 +797,7 @@ static int ipr_set_pcix_cmd_reg(struct ipr_ioa_cfg *ioa_cfg)
 
 	if (pcix_cmd_reg) {
 		if (pci_write_config_word(ioa_cfg->pdev, pcix_cmd_reg + PCI_X_CMD,
-					  ioa_cfg->saved_pcix_cmd_reg) != PCIBIOS_SUCCESSFUL) {
+					  ioa_cfg->saved_pcix_cmd_reg) != 0) {
 			dev_err(&ioa_cfg->pdev->dev, "Failed to setup PCI-X command register\n");
 			return -EIO;
 		}
@@ -8739,7 +8739,7 @@ static int ipr_reset_bist_done(struct ipr_cmnd *ipr_cmd)
 static int ipr_reset_start_bist(struct ipr_cmnd *ipr_cmd)
 {
 	struct ipr_ioa_cfg *ioa_cfg = ipr_cmd->ioa_cfg;
-	int rc = PCIBIOS_SUCCESSFUL;
+	int rc = 0;
 
 	ENTER;
 	if (ioa_cfg->ipr_chip->bist_method == IPR_MMIO)
@@ -8748,7 +8748,7 @@ static int ipr_reset_start_bist(struct ipr_cmnd *ipr_cmd)
 	else
 		rc = pci_write_config_byte(ioa_cfg->pdev, PCI_BIST, PCI_BIST_START);
 
-	if (rc == PCIBIOS_SUCCESSFUL) {
+	if (rc == 0) {
 		ipr_cmd->job_step = ipr_reset_bist_done;
 		ipr_reset_start_timer(ipr_cmd, IPR_WAIT_FOR_BIST_TIMEOUT);
 		rc = IPR_RC_JOB_RETURN;
@@ -8946,7 +8946,7 @@ static int ipr_reset_alert(struct ipr_cmnd *ipr_cmd)
 	ENTER;
 	rc = pci_read_config_word(ioa_cfg->pdev, PCI_COMMAND, &cmd_reg);
 
-	if ((rc == PCIBIOS_SUCCESSFUL) && (cmd_reg & PCI_COMMAND_MEMORY)) {
+	if ((rc == 0) && (cmd_reg & PCI_COMMAND_MEMORY)) {
 		ipr_mask_and_clear_interrupts(ioa_cfg, ~0);
 		writel(IPR_UPROCI_RESET_ALERT, ioa_cfg->regs.set_uproc_interrupt_reg32);
 		ipr_cmd->job_step = ipr_reset_wait_to_start_bist;
@@ -10154,7 +10154,7 @@ static int ipr_probe_ioa(struct pci_dev *pdev,
 	struct Scsi_Host *host;
 	unsigned long ipr_regs_pci;
 	void __iomem *ipr_regs;
-	int rc = PCIBIOS_SUCCESSFUL;
+	int rc = 0;
 	volatile u32 mask, uproc, interrupts;
 	unsigned long lock_flags, driver_lock_flags;
 	unsigned int irq_flag;
@@ -10256,7 +10256,7 @@ static int ipr_probe_ioa(struct pci_dev *pdev,
 	rc = pci_write_config_byte(pdev, PCI_CACHE_LINE_SIZE,
 				   ioa_cfg->chip_cfg->cache_line_size);
 
-	if (rc != PCIBIOS_SUCCESSFUL) {
+	if (rc != 0) {
 		dev_err(&pdev->dev, "Write of cache line size failed\n");
 		ipr_wait_for_pci_err_recovery(ioa_cfg);
 		rc = -EIO;
@@ -10337,7 +10337,7 @@ static int ipr_probe_ioa(struct pci_dev *pdev,
 	/* Save away PCI config space for use following IOA reset */
 	rc = pci_save_state(pdev);
 
-	if (rc != PCIBIOS_SUCCESSFUL) {
+	if (rc != 0) {
 		dev_err(&pdev->dev, "Failed to save PCI config space\n");
 		rc = -EIO;
 		goto cleanup_nolog;
diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index aa9ae2ae8579..5f6e440f0dcd 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -553,7 +553,7 @@ static void pmcraid_bist_done(struct timer_list *t)
 	rc = pci_read_config_word(pinstance->pdev, PCI_COMMAND, &pci_reg);
 
 	/* If PCI config space can't be accessed wait for another two secs */
-	if ((rc != PCIBIOS_SUCCESSFUL || (!(pci_reg & PCI_COMMAND_MEMORY))) &&
+	if ((rc != 0 || (!(pci_reg & PCI_COMMAND_MEMORY))) &&
 	    cmd->time_left > 0) {
 		pmcraid_info("BIST not complete, waiting another 2 secs\n");
 		cmd->timer.expires = jiffies + cmd->time_left;
@@ -649,7 +649,7 @@ static void pmcraid_reset_alert(struct pmcraid_cmd *cmd)
 	 * BIST or slot_reset
 	 */
 	rc = pci_read_config_word(pinstance->pdev, PCI_COMMAND, &pci_reg);
-	if ((rc == PCIBIOS_SUCCESSFUL) && (pci_reg & PCI_COMMAND_MEMORY)) {
+	if ((rc == 0) && (pci_reg & PCI_COMMAND_MEMORY)) {
 
 		/* wait for IOA permission i.e until CRITICAL_OPERATION bit is
 		 * reset IOA doesn't generate any interrupts when CRITICAL
@@ -5651,7 +5651,7 @@ static int pmcraid_probe(struct pci_dev *pdev,
 	struct pmcraid_instance *pinstance;
 	struct Scsi_Host *host;
 	void __iomem *mapped_pci_addr;
-	int rc = PCIBIOS_SUCCESSFUL;
+	int rc = 0;
 
 	if (atomic_read(&pmcraid_adapter_count) >= PMCRAID_MAX_ADAPTERS) {
 		pmcraid_err
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
