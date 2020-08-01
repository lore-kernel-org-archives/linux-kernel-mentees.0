Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AACAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2E232080C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncnCAE+5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2E232080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B871D203E5;
	Sat,  1 Aug 2020 12:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGW-M20emOjX; Sat,  1 Aug 2020 12:24:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 45077203DF;
	Sat,  1 Aug 2020 12:24:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CDCAC0050;
	Sat,  1 Aug 2020 12:24:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6968C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A6ED287040
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3uE7wOfWnCj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A51A587051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:42 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id l4so33946772ejd.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=f7EHkSWbrjhplB2d+YIJIh5vLQH5GmykUiEqLTIStB4=;
 b=ncnCAE+5L7BB5/YjIaWKdov1rz6HP5TvXA9nZA3PXndUUW1xK5+ufbrRdCYCwHcqHm
 t1EMuhi4tuEBdBJ5YsN9BB5sxWFTI0+q//E8z9o5Ck0ZyU+V5BrrZ5nZXdtol4sWPkxZ
 b9MIFjQEbPFh3ySpTdLCOFWSkzspCjS2kD4irjY0YxXuW38z5ndkVpebr288Yek4HTE7
 +2vr3ZHRUJaZVRsq+jCq8P6pvvPOtSBdlH0LEq1DjZSQP5YlhLmDT7iewerLkZWaqc/g
 VR8PYab69Ni5ovDIAYK7FvMde3VGmx+R28fsxL9Zyq9QmFLaLLeo+1pPbnbJL/G3y8oR
 c/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=f7EHkSWbrjhplB2d+YIJIh5vLQH5GmykUiEqLTIStB4=;
 b=TAoLux702StiSRF9beXHZ/XnzrKV449V/vskox4mR+gWSKDiMcZnrP2IiF73eTmpfD
 4pj86Aw2DdSuZZg8koMHExyKJgRs/7NKiyDNP7tbWhbaNd1r+qjLHoETUI7EFMS/NaSX
 3Z6DPYrH10SK4PM9WEW7QgV4kFzw72QB2rL/iaGyb0TuEsalOR20QkA0zUKpDkrCPlfV
 VmF65eTu5zK4xAey/zCE/ipYv0GGr0VKLOOIWDddjbCuaQrzUru/955fxmQWWcbUavrw
 /wdHiJKQQ3HP59m5CbqGswXTx7Y14l1+Iy0gHmh+YUBxS5Q26rwFFWTM5ZjQZKSecYx1
 lzQw==
X-Gm-Message-State: AOAM530RJJA9fKpe0bRFQbAfIjR9kTJ6eWQSJgCWVcL7M+XxmSzz2eWE
 VeM6478NZWUwsf0A2gJIgj8=
X-Google-Smtp-Source: ABdhPJxK6QsCLubg/13FQ7axRtOuPxj8lfRiykbHYiquSlkMilSMcUUDzaC4VkaClUghhqDZwK4BZw==
X-Received: by 2002:a17:906:c002:: with SMTP id
 e2mr8812396ejz.244.1596284681233; 
 Sat, 01 Aug 2020 05:24:41 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:40 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	"David S. Miller" <davem@davemloft.net>
Date: Sat,  1 Aug 2020 13:24:42 +0200
Message-Id: <20200801112446.149549-14-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 13/17] ide: Drop uses of
	pci_read_config_*() return value
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

The return value of pci_read_config_*() may not indicate a device error.
However, the value read by these functions is more likely to indicate
this kind of error. This presents two overlapping ways of reporting
errors and complicates error checking.

It is possible to move to one single way of checking for error if the
dependency on the return value of these functions is removed, then it
can later be made to return void.

Remove all uses of the return value of pci_read_config_*().
Check the actual value read for ~0. In this case, ~0 is an invalid value
thus it indicates some kind of error.

drivers/ide/cs5536.c cs5536_read() :
None of the callers of cs5536_read() uses the return value. The obtained
value can be checked for validity to confirm success.

Change the return type of cs5536_read() to void.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/ide/cs5536.c    |  6 +++---
 drivers/ide/rz1000.c    |  3 ++-
 drivers/ide/setup-pci.c | 26 ++++++++++++++++----------
 3 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/ide/cs5536.c b/drivers/ide/cs5536.c
index 8b5ca145191b..58d1cf37c013 100644
--- a/drivers/ide/cs5536.c
+++ b/drivers/ide/cs5536.c
@@ -55,16 +55,16 @@ enum {
 
 static int use_msr;
 
-static int cs5536_read(struct pci_dev *pdev, int reg, u32 *val)
+static void cs5536_read(struct pci_dev *pdev, int reg, u32 *val)
 {
 	if (unlikely(use_msr)) {
 		u32 dummy;
 
 		rdmsr(MSR_IDE_CFG + reg, *val, dummy);
-		return 0;
+		return;
 	}
 
-	return pci_read_config_dword(pdev, PCI_IDE_CFG + reg * 4, val);
+	pci_read_config_dword(pdev, PCI_IDE_CFG + reg * 4, val);
 }
 
 static int cs5536_write(struct pci_dev *pdev, int reg, int val)
diff --git a/drivers/ide/rz1000.c b/drivers/ide/rz1000.c
index fce2b7de5a19..19ac4328e707 100644
--- a/drivers/ide/rz1000.c
+++ b/drivers/ide/rz1000.c
@@ -27,7 +27,8 @@ static int rz1000_disable_readahead(struct pci_dev *dev)
 {
 	u16 reg;
 
-	if (!pci_read_config_word (dev, 0x40, &reg) &&
+	pci_read_config_word(dev, 0x40, &reg);
+	if ((reg != (u16)~0) &&
 	    !pci_write_config_word(dev, 0x40, reg & 0xdfff)) {
 		printk(KERN_INFO "%s: disabled chipset read-ahead "
 			"(buggy RZ1000/RZ1001)\n", pci_name(dev));
diff --git a/drivers/ide/setup-pci.c b/drivers/ide/setup-pci.c
index fdc8e813170c..a7b93ccd55d1 100644
--- a/drivers/ide/setup-pci.c
+++ b/drivers/ide/setup-pci.c
@@ -37,7 +37,8 @@ static int ide_setup_pci_baseregs(struct pci_dev *dev, const char *name)
 	/*
 	 * Place both IDE interfaces into PCI "native" mode:
 	 */
-	if (pci_read_config_byte(dev, PCI_CLASS_PROG, &progif) ||
+	pci_read_config_byte(dev, PCI_CLASS_PROG, &progif);
+	if ((progif == (u8)~0) ||
 			 (progif & 5) != 5) {
 		if ((progif & 0xa) != 0xa) {
 			printk(KERN_INFO "%s %s: device not capable of full "
@@ -47,7 +48,8 @@ static int ide_setup_pci_baseregs(struct pci_dev *dev, const char *name)
 		printk(KERN_INFO "%s %s: placing both ports into native PCI "
 			"mode\n", name, pci_name(dev));
 		(void) pci_write_config_byte(dev, PCI_CLASS_PROG, progif|5);
-		if (pci_read_config_byte(dev, PCI_CLASS_PROG, &progif) ||
+		pci_read_config_byte(dev, PCI_CLASS_PROG, &progif);
+		if ((progif == (u8)~0) ||
 		    (progif & 5) != 5) {
 			printk(KERN_ERR "%s %s: rewrite of PROGIF failed, "
 				"wanted 0x%04x, got 0x%04x\n",
@@ -251,7 +253,8 @@ static int ide_pci_configure(struct pci_dev *dev, const struct ide_port_info *d)
 			d->name, pci_name(dev));
 		return -ENODEV;
 	}
-	if (pci_read_config_word(dev, PCI_COMMAND, &pcicmd)) {
+	pci_read_config_word(dev, PCI_COMMAND, &pcicmd);
+	if (pcicmd == (u16)~0) {
 		printk(KERN_ERR "%s %s: error accessing PCI regs\n",
 			d->name, pci_name(dev));
 		return -EIO;
@@ -415,8 +418,8 @@ static int ide_setup_pci_controller(struct pci_dev *dev, int bars,
 	if (ret < 0)
 		goto out;
 
-	ret = pci_read_config_word(dev, PCI_COMMAND, &pcicmd);
-	if (ret < 0) {
+	pci_read_config_word(dev, PCI_COMMAND, &pcicmd);
+	if (pcicmd == (u16)~0) {
 		printk(KERN_ERR "%s %s: error accessing PCI regs\n",
 			d->name, pci_name(dev));
 		goto out_free_bars;
@@ -466,11 +469,14 @@ void ide_pci_setup_ports(struct pci_dev *dev, const struct ide_port_info *d,
 	for (port = 0; port < channels; ++port) {
 		const struct ide_pci_enablebit *e = &d->enablebits[port];
 
-		if (e->reg && (pci_read_config_byte(dev, e->reg, &tmp) ||
-		    (tmp & e->mask) != e->val)) {
-			printk(KERN_INFO "%s %s: IDE port disabled\n",
-				d->name, pci_name(dev));
-			continue;	/* port not enabled */
+		if (e->reg) {
+			pci_read_config_byte(dev, e->reg, &tmp);
+
+			if ((tmp == (u8)~0) || ((tmp & e->mask) != e->val)) {
+				printk(KERN_INFO "%s %s: IDE port disabled\n",
+					d->name, pci_name(dev));
+				continue;	/* port not enabled */
+			}
 		}
 
 		if (ide_hw_configure(dev, d, port, hw + port))
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
