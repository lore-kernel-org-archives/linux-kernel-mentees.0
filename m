Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFB0C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF302076A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxoAru1R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF302076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 040F8888C7;
	Sat,  1 Aug 2020 12:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-n1uO3PcCQZ; Sat,  1 Aug 2020 12:24:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 744BB8881E;
	Sat,  1 Aug 2020 12:24:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62805C0052;
	Sat,  1 Aug 2020 12:24:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DDC6C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DFC48203EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SnYe1-cXeNdD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 5B32B203D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:41 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id c16so13635554ejx.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UPMKmQkw5j2Bh/Rizmhe2Km1hW9ddbiX+OSz6ICfDL0=;
 b=lxoAru1R5QoARIY5Zj8IRtaCQjydTdcDfATP28B1jbs7FRLq31y9L/U2SR0zijpXrz
 bwjdGdwpBCY+OL8xy3+j8KOYTQ4iuc9pQ7t1ryeXThG/akFvuU5yTDz4bKRppe3UTI6S
 mVk1U19Sq1sZ5/BFGKbeETK7mgjUoVVrEja3FLOzJB39cha7M1+zv2654sn/ZVjvDKjF
 4pB4sPSLkEAGsjJ7lx/0i9X+FEoPJHHs30BL/XHuibQBDEMQsaMLSnn6J0s4EQ/nuUuK
 JbxLd+JXACbythRSYj8Fo862E0AsZbbp92RxcFiBidmKNrCL1IdKeKAKnnBLqOIqjvx8
 HRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UPMKmQkw5j2Bh/Rizmhe2Km1hW9ddbiX+OSz6ICfDL0=;
 b=Mga/+hXM+CMUowTb9pmgOeK0obgIgoYqDVaWCZuZz4K3FCXkhfqkXpfaQgVV6bWKxx
 pgq2wYfjgxcO76B2Og6DcOysFinxbVKHuU+3/XmEX9XGOthhLxYxPly4t1WbkOO3oG/1
 hdBZ9DNI2DySPyebHOueBwDeV2R16Vmkw5PbJIc3RV94KAhNltpgX6hxbd6uKV6e6S/J
 WfvXBaqkjnGvkK1VoTALvrJmerNqQIbj8glukdwvygVY7spG+MkHkpDedZqBQwEC6o5H
 Hf/MmYtAwfX8P39khRC+VFjspJDated+lhX/Llc006uxq7NLBz4xxpjCw+YU+aINl9l1
 Tm/g==
X-Gm-Message-State: AOAM533n5knaWVokQiiqaZuvCcSTpkVS+QzYGZQwxlv2RwPTVqd1iW0G
 PU1hLTbkbZKmcxOqfXUdHVU=
X-Google-Smtp-Source: ABdhPJyCxIUjb+mwT7ePMCbvB9sb/Y2iHevdo/OKsCbDfX1QEQPPASWDc4dVgABKN92MfYabQCbrqA==
X-Received: by 2002:a17:906:bce9:: with SMTP id
 op9mr8659385ejb.462.1596284679790; 
 Sat, 01 Aug 2020 05:24:39 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:39 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Wolfram Sang <wsa@kernel.org>
Date: Sat,  1 Aug 2020 13:24:41 +0200
Message-Id: <20200801112446.149549-13-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 12/17] i2c: Drop uses of
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
Check the actual value read for ~0. In this case, ~0 is an invalid
value thus it indicates some kind of error.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/i2c/busses/i2c-ali15x3.c |  6 ++++--
 drivers/i2c/busses/i2c-elektor.c |  3 ++-
 drivers/i2c/busses/i2c-nforce2.c |  4 ++--
 drivers/i2c/busses/i2c-sis5595.c | 17 +++++++++++------
 drivers/i2c/busses/i2c-sis630.c  |  7 ++++---
 drivers/i2c/busses/i2c-viapro.c  | 11 ++++++-----
 6 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 02185a1cfa77..fa103131746d 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -171,9 +171,11 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
 								SMBBA,
 								ali15x3_smba))
 			goto error;
-		if (PCIBIOS_SUCCESSFUL != pci_read_config_word(ALI15X3_dev,
-								SMBBA, &a))
+
+		pci_read_config_word(ALI15X3_dev, SMBBA, &a);
+		if (a == (u16)~0)
 			goto error;
+
 		if ((a & ~(ALI15X3_SMB_IOSIZE - 1)) != ali15x3_smba) {
 			/* make sure it works */
 			dev_err(&ALI15X3_dev->dev,
diff --git a/drivers/i2c/busses/i2c-elektor.c b/drivers/i2c/busses/i2c-elektor.c
index 140426db28df..82c8d6d55561 100644
--- a/drivers/i2c/busses/i2c-elektor.c
+++ b/drivers/i2c/busses/i2c-elektor.c
@@ -207,7 +207,8 @@ static int elektor_match(struct device *dev, unsigned int id)
 		if (cy693_dev) {
 			unsigned char config;
 			/* yeap, we've found cypress, let's check config */
-			if (!pci_read_config_byte(cy693_dev, 0x47, &config)) {
+			pci_read_config_byte(cy693_dev, 0x47, &config);
+			if (config != (u8)~0) {
 
 				dev_dbg(dev, "found cy82c693, config "
 					"register 0x47 = 0x%02x\n", config);
diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index 777278386f58..dc5d032c5a1d 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -327,8 +327,8 @@ static int nforce2_probe_smb(struct pci_dev *dev, int bar, int alt_reg,
 		/* Older incarnations of the device used non-standard BARs */
 		u16 iobase;
 
-		if (pci_read_config_word(dev, alt_reg, &iobase)
-		    != PCIBIOS_SUCCESSFUL) {
+		pci_read_config_word(dev, alt_reg, &iobase);
+		if (iobase == (u16)~0) {
 			dev_err(&dev->dev, "Error reading PCI config for %s\n",
 				name);
 			return -EIO;
diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
index c793a5c14cda..9b3fbde9cd9c 100644
--- a/drivers/i2c/busses/i2c-sis5595.c
+++ b/drivers/i2c/busses/i2c-sis5595.c
@@ -178,9 +178,11 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base)
 		    != PCIBIOS_SUCCESSFUL)
 			goto error;
-		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a)
-		    != PCIBIOS_SUCCESSFUL)
+
+		pci_read_config_word(SIS5595_dev, ACPI_BASE, &a);
+		if (a == (u16)~0)
 			goto error;
+
 		if ((a & ~(SIS5595_EXTENT - 1)) != sis5595_base) {
 			/* doesn't work for some chips! */
 			dev_err(&SIS5595_dev->dev, "force address failed - not supported?\n");
@@ -188,17 +190,20 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 		}
 	}
 
-	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-	    != PCIBIOS_SUCCESSFUL)
+	pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val);
+	if (val == (u8)~0)
 		goto error;
+
 	if ((val & 0x80) == 0) {
 		dev_info(&SIS5595_dev->dev, "enabling ACPI\n");
 		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80)
 		    != PCIBIOS_SUCCESSFUL)
 			goto error;
-		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-		    != PCIBIOS_SUCCESSFUL)
+
+		pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val);
+		if (val == (u8)~0)
 			goto error;
+
 		if ((val & 0x80) == 0) {
 			/* doesn't work for some chips? */
 			dev_err(&SIS5595_dev->dev, "ACPI enable failed - not supported?\n");
diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
index cfb8e04a2a83..73b17436f964 100644
--- a/drivers/i2c/busses/i2c-sis630.c
+++ b/drivers/i2c/busses/i2c-sis630.c
@@ -430,7 +430,8 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	   Enable ACPI first , so we can accsess reg 74-75
 	   in acpi io space and read acpi base addr
 	*/
-	if (pci_read_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, &b)) {
+	pci_read_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, &b);
+	if (b == (u8)~0) {
 		dev_err(&sis630_dev->dev, "Error: Can't read bios ctl reg\n");
 		retval = -ENODEV;
 		goto exit;
@@ -444,8 +445,8 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	}
 
 	/* Determine the ACPI base address */
-	if (pci_read_config_word(sis630_dev,
-				 SIS630_ACPI_BASE_REG, &acpi_base)) {
+	pci_read_config_word(sis630_dev, SIS630_ACPI_BASE_REG, &acpi_base);
+	if (acpi_base == (u16)~0) {
 		dev_err(&sis630_dev->dev,
 			"Error: Can't determine ACPI base address\n");
 		retval = -ENODEV;
diff --git a/drivers/i2c/busses/i2c-viapro.c b/drivers/i2c/busses/i2c-viapro.c
index 4abc7771af06..14bfa5401845 100644
--- a/drivers/i2c/busses/i2c-viapro.c
+++ b/drivers/i2c/busses/i2c-viapro.c
@@ -321,12 +321,13 @@ static int vt596_probe(struct pci_dev *pdev,
 		goto found;
 	}
 
-	if ((pci_read_config_word(pdev, id->driver_data, &vt596_smba)) ||
-	    !(vt596_smba & 0x0001)) {
+	pci_read_config_word(pdev, id->driver_data, &vt596_smba);
+	if ((vt596_smba == (u16)~0) || !(vt596_smba & 0x0001)) {
 		/* try 2nd address and config reg. for 596 */
-		if (id->device == PCI_DEVICE_ID_VIA_82C596_3 &&
-		    !pci_read_config_word(pdev, SMBBA2, &vt596_smba) &&
-		    (vt596_smba & 0x0001)) {
+		pci_read_config_word(pdev, SMBBA2, &vt596_smba);
+		if ((id->device == PCI_DEVICE_ID_VIA_82C596_3) &&
+					(vt596_smba != (u16)~0) &&
+					(vt596_smba & 0x0001)) {
 			SMBHSTCFG = 0x84;
 		} else {
 			/* no matches at all */
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
