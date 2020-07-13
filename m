Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2187EC4345A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E645820773
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7fqTYEe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E645820773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D5A7B2002A;
	Mon, 13 Jul 2020 13:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6e2YLtgTulT; Mon, 13 Jul 2020 13:23:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F3F1620764;
	Mon, 13 Jul 2020 13:23:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF53DC08A5;
	Mon, 13 Jul 2020 13:23:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1738C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 90F9921511
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RxFdwgs2OBXD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by silver.osuosl.org (Postfix) with ESMTPS id ABF3D2002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:59 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id rk21so17148982ejb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tczYCFdS3/cJq1nOdmzHC0tWFoQ+QsE/iL94vlXviGU=;
 b=R7fqTYEesFmsZR8cnid/s+sdOfqo+j8ibuFpW6vdh+YRJ4gFsdHihYvV7hMXEzRzNr
 rK3uboChKJI7yf3viTPCBaYKlheR1K2wc/wMdcX2HSqtpwuBxu0tebqqqOOIoKKpgx+5
 D1VNntZQRD0d3UDkQBYV52zN2qtwENMN+7O/Cj0Z8NSmPYtH8UubaeaauJJT/6ouVBrc
 Po7kfwVfE7DiPOIjQ8rutCzl81VQLaiFYGVNDSkVvGAXzwIBy0aS8DQ9g2JYwc0wl8iq
 hy/o1FYEnUYXOAKctA5QN4uPHAoi9IVixu+b57RxQJcYwxUljfR7YDA2zk5ew9UqaIUv
 J43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tczYCFdS3/cJq1nOdmzHC0tWFoQ+QsE/iL94vlXviGU=;
 b=VK0YnVzNoeNZYJVoCIIBWbuoDxDl/OG3iNJ2ux+g1Kl1aAdoXCTk6FBuVxd3lF+S1P
 I9a889TwQnDPGJTZb2hF2uO7Qwj8J69SOOJRA1oFn9xDEuHFY+4As3Rd8lJ/SRRYgTmQ
 9CHasnkeR6/OmUUu3WuBC3mM+EFRzeUTKBywwQZGO2wXJhVovaABiSsd/Q48JJ2TRsFW
 PH5rJqmJwSNGnC6kqYvKmX0+laUfqYkA1WlCEvkKchK1f5lxtZbWIbHu9BSuLshpvl3X
 swtwTLXU+N/Htfzox77oa0hJv95Z61O06HCvzijyHYkAe/UaeJwmqGkQzrt/7sw6kyL+
 1UwA==
X-Gm-Message-State: AOAM530evdVEifA9EmFt5teRq2d3VQBgm9p5O86ohY/p1v6m1Qw6ZSC4
 8gn4wuL1C7Gwg+x4cPlc9GE=
X-Google-Smtp-Source: ABdhPJyi7kdKnWKidhuD/7S0rUnuO695mifL4kwQQRb/qclwiEU741xbCG8OqefW8KfutA+tJMt2Xg==
X-Received: by 2002:a17:906:ef2:: with SMTP id
 x18mr71342560eji.547.1594646578134; 
 Mon, 13 Jul 2020 06:22:58 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:57 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Jean Delvare <jdelvare@suse.com>
Date: Mon, 13 Jul 2020 14:22:27 +0200
Message-Id: <20200713122247.10985-16-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 15/35] i2c/busses: Tidy
	Success/Failure checks
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

Remove unnecessary check for 0.

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
This patch depends on PATCH 15/35

 drivers/i2c/busses/i2c-ali15x3.c |  5 ++---
 drivers/i2c/busses/i2c-nforce2.c |  3 +--
 drivers/i2c/busses/i2c-sis5595.c | 15 +++++----------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 359ee3e0864a..c9e779cc184e 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -167,11 +167,10 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
 	if(force_addr) {
 		dev_info(&ALI15X3_dev->dev, "forcing ISA address 0x%04X\n",
 			ali15x3_smba);
-		if (0 != pci_write_config_word(ALI15X3_dev,
-								SMBBA,
+		if (pci_write_config_word(ALI15X3_dev, SMBBA,
 								ali15x3_smba))
 			goto error;
-		if (0 != pci_read_config_word(ALI15X3_dev,
+		if (pci_read_config_word(ALI15X3_dev,
 								SMBBA, &a))
 			goto error;
 		if ((a & ~(ALI15X3_SMB_IOSIZE - 1)) != ali15x3_smba) {
diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index 385f4f446f36..54d2985b7aaf 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -327,8 +327,7 @@ static int nforce2_probe_smb(struct pci_dev *dev, int bar, int alt_reg,
 		/* Older incarnations of the device used non-standard BARs */
 		u16 iobase;
 
-		if (pci_read_config_word(dev, alt_reg, &iobase)
-		    != 0) {
+		if (pci_read_config_word(dev, alt_reg, &iobase)) {
 			dev_err(&dev->dev, "Error reading PCI config for %s\n",
 				name);
 			return -EIO;
diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
index fbe3ee31eae3..b016f48519d3 100644
--- a/drivers/i2c/busses/i2c-sis5595.c
+++ b/drivers/i2c/busses/i2c-sis5595.c
@@ -175,11 +175,9 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 
 	if (force_addr) {
 		dev_info(&SIS5595_dev->dev, "forcing ISA address 0x%04X\n", sis5595_base);
-		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base)
-		    != 0)
+		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base))
 			goto error;
-		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a)
-		    != 0)
+		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a))
 			goto error;
 		if ((a & ~(SIS5595_EXTENT - 1)) != sis5595_base) {
 			/* doesn't work for some chips! */
@@ -188,16 +186,13 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 		}
 	}
 
-	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-	    != 0)
+	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val))
 		goto error;
 	if ((val & 0x80) == 0) {
 		dev_info(&SIS5595_dev->dev, "enabling ACPI\n");
-		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80)
-		    != 0)
+		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80))
 			goto error;
-		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-		    != 0)
+		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val))
 			goto error;
 		if ((val & 0x80) == 0) {
 			/* doesn't work for some chips? */
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
