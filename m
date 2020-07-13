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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01151C43458
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C63F62072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRAKL+ar"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C63F62072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 971278908C;
	Mon, 13 Jul 2020 13:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHZM6+eotCwS; Mon, 13 Jul 2020 13:23:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1D7F88FFC;
	Mon, 13 Jul 2020 13:23:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1133C0888;
	Mon, 13 Jul 2020 13:23:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63622C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4471921511
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KE3rIGwW27PR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 4996D20379
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:58 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id d16so13648015edz.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SZWhEQhdAshrEKOg1OdeBySM/iJl7P0u/Wtd+OUZgXk=;
 b=fRAKL+ar0mP3quTtvn/VpmyE8ofupZbeB8r47gxq5b/gxvL3G1VqC9LYDGni8Tlx5I
 0qsw3fcJ+cb5IZKC4h24+hvVIbdMcms3VyUgaBvoAaECnfjkgmnLIHQHjTIBMriAiTlY
 3akPM+5JCmyP+/gaM3gU5ANiOKopU6jAzN/DU2LtxeAXgN49CQ3umiX8APk8D3hUIrLx
 kVYrJttsCfxDIsqUozcJwuNsipxmBfwFIKackKL08Am03KDZnQQw2R9aM+I9ePyvdhoq
 zgwreYm3Ofx6rpfGKucbI3B/AWhLiaTD9EPIf9zTJkR/J+jjAzees1l65pkjG6gNZ+u5
 fwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SZWhEQhdAshrEKOg1OdeBySM/iJl7P0u/Wtd+OUZgXk=;
 b=BhTqKDDxEBoICM1XIZOWkfaiG2rqmG/dvcL/vCfz80GiYglvjhHnhy37+AYVG7IAnJ
 +9fKFxyNLKi0fBbOMtODDtY8GSzisUjor56WaomD5dPutQqWemBqaaHHT5nVsVPYRjRK
 G2aZpfpXHElasZ3xO9a81KMI/MqZ7bWhPoAU6tH57R5fwFc51aZY0u2OV2+aWnbUyxna
 KI68MOrH3bS2Vf/qpG8CpEL0lPRkRxOBbHZ4ZVKT0rnc90RaQyE3fn56JNsqhv2SNIoI
 oGIU2zbk6HPNBSyGYfv7PxwY8oFPmguatkeDR4DNiQpPVSvrgrxVZyyV7/QPOcbG4An2
 +ojg==
X-Gm-Message-State: AOAM533O3bvznNED7aDk2KAhsTzMNhQzT13vdEUNR+5L9K5PQlRD7WkA
 JjugunLms72J5z+sFXsod5Y=
X-Google-Smtp-Source: ABdhPJxjSkM06k8pRCUPzMRpx17h5RlpCmZfRWCd5RkykmrcYELKqDznF5j3XGqTDyeV2adZguE47A==
X-Received: by 2002:aa7:c341:: with SMTP id j1mr95061530edr.197.1594646576666; 
 Mon, 13 Jul 2020 06:22:56 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:55 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Jean Delvare <jdelvare@suse.com>
Date: Mon, 13 Jul 2020 14:22:26 +0200
Message-Id: <20200713122247.10985-15-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 14/35] i2c/busses: Change
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
 drivers/i2c/busses/i2c-ali15x3.c |  4 ++--
 drivers/i2c/busses/i2c-nforce2.c |  2 +-
 drivers/i2c/busses/i2c-sis5595.c | 10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 02185a1cfa77..359ee3e0864a 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -167,11 +167,11 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
 	if(force_addr) {
 		dev_info(&ALI15X3_dev->dev, "forcing ISA address 0x%04X\n",
 			ali15x3_smba);
-		if (PCIBIOS_SUCCESSFUL != pci_write_config_word(ALI15X3_dev,
+		if (0 != pci_write_config_word(ALI15X3_dev,
 								SMBBA,
 								ali15x3_smba))
 			goto error;
-		if (PCIBIOS_SUCCESSFUL != pci_read_config_word(ALI15X3_dev,
+		if (0 != pci_read_config_word(ALI15X3_dev,
 								SMBBA, &a))
 			goto error;
 		if ((a & ~(ALI15X3_SMB_IOSIZE - 1)) != ali15x3_smba) {
diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index 777278386f58..385f4f446f36 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -328,7 +328,7 @@ static int nforce2_probe_smb(struct pci_dev *dev, int bar, int alt_reg,
 		u16 iobase;
 
 		if (pci_read_config_word(dev, alt_reg, &iobase)
-		    != PCIBIOS_SUCCESSFUL) {
+		    != 0) {
 			dev_err(&dev->dev, "Error reading PCI config for %s\n",
 				name);
 			return -EIO;
diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
index c793a5c14cda..fbe3ee31eae3 100644
--- a/drivers/i2c/busses/i2c-sis5595.c
+++ b/drivers/i2c/busses/i2c-sis5595.c
@@ -176,10 +176,10 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 	if (force_addr) {
 		dev_info(&SIS5595_dev->dev, "forcing ISA address 0x%04X\n", sis5595_base);
 		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base)
-		    != PCIBIOS_SUCCESSFUL)
+		    != 0)
 			goto error;
 		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a)
-		    != PCIBIOS_SUCCESSFUL)
+		    != 0)
 			goto error;
 		if ((a & ~(SIS5595_EXTENT - 1)) != sis5595_base) {
 			/* doesn't work for some chips! */
@@ -189,15 +189,15 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 	}
 
 	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-	    != PCIBIOS_SUCCESSFUL)
+	    != 0)
 		goto error;
 	if ((val & 0x80) == 0) {
 		dev_info(&SIS5595_dev->dev, "enabling ACPI\n");
 		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80)
-		    != PCIBIOS_SUCCESSFUL)
+		    != 0)
 			goto error;
 		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-		    != PCIBIOS_SUCCESSFUL)
+		    != 0)
 			goto error;
 		if ((val & 0x80) == 0) {
 			/* doesn't work for some chips? */
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
