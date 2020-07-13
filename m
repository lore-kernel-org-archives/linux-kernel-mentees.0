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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D51CC4345E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F2632072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFgUkHYU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F2632072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3283288C73;
	Mon, 13 Jul 2020 13:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NVi7UzClApb; Mon, 13 Jul 2020 13:23:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F26388B48;
	Mon, 13 Jul 2020 13:23:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DEE8C0888;
	Mon, 13 Jul 2020 13:23:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CC93C0888
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EA45D88A60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id boh3GhzW5Nv4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0A7FE88AEF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:01 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id g20so13695137edm.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wedHCIChLPI3W8eJR45NkujB6S4xOXi2tVCNNo2QC2g=;
 b=IFgUkHYUyQ5yQAzQIlZ+QKHSWJi9aV4DKXkMTpCLI8tz4cQXE4ag3ugFeOcFKQDAyg
 EWa9qIrHkYxPAJMSO1gtMhCpe4qELsErSvppuGNJeWxNdWzvDhTiuvD3oVrtf/NAydtg
 MMLlkhS/HPlMjHrJlNIMh2U1vizkVtujUJ2nmM5X4BuI9pCfdNmVNOFQR4NYYZYsC9/4
 sHf+92UmiYhr5XXjzOV0iy3+CXdhk5s1srXZ8SsGqDwta9X7ukdKtB4sJM3DiCjYV3vO
 z6r3AXhLllgg51T6aLGw2V2K7xpabsbgWOYO39XhFApMzMcWe3gwJclj1XZKAsYJ5ncU
 gY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wedHCIChLPI3W8eJR45NkujB6S4xOXi2tVCNNo2QC2g=;
 b=Qj45wjvs6RwaQj217k9bsmTSOQO369yorLFsd4SY2ylMC2JimkBGPsXPFoOZKOg9PZ
 mipdhfzkg93aDfKXDQb/Cb7+XHSHHSM6+1trZCWiMWtsQasIZHfoTkZkuNs0SyKCfEsF
 AHqFR6V0cWwPxK3UaFlmP8g+yg8orGDjri1C9LhGWHi85Ea3EPzkvzRoGlYYHWy93CK8
 5ztj2BxLK6cvL5I/Pa7ef2cvCnnBxHMJRjG9ukJlg7+/dsY8GFDJxDrfFjEsVAM6WIAT
 VgEZbTCIbqtdpKXL2g+AHDnYrBHBZSqP3MFlyhqSwSuGekGsG6QCguGjszWwTaysd2Nc
 7AAw==
X-Gm-Message-State: AOAM531sPDhzggbyjC8tw4kKCYtUs3CoIzs8IP8PbR5EjMSCISR8o6XN
 ZSbnsbGMwzWtE5FC0itv/2k=
X-Google-Smtp-Source: ABdhPJz3+R8EMDUd8r+h17AEUUENNjntQ7SKL3N/QarL0j05KmXQg0LEb8ICq9q0/JqFa1l7NL7ZDg==
X-Received: by 2002:aa7:c504:: with SMTP id o4mr89798702edq.311.1594646579546; 
 Mon, 13 Jul 2020 06:22:59 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:59 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>
Date: Mon, 13 Jul 2020 14:22:28 +0200
Message-Id: <20200713122247.10985-17-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 16/35] hwmon: (sis5595) Change
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
 drivers/hwmon/sis5595.c | 8 ++++----
 drivers/hwmon/via686a.c | 8 ++++----
 drivers/hwmon/vt8231.c  | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/sis5595.c b/drivers/hwmon/sis5595.c
index 0c6741f949f5..0ea174fb3048 100644
--- a/drivers/hwmon/sis5595.c
+++ b/drivers/hwmon/sis5595.c
@@ -825,7 +825,7 @@ static int sis5595_pci_probe(struct pci_dev *dev,
 		pci_write_config_word(dev, SIS5595_BASE_REG, force_addr);
 	}
 
-	if (PCIBIOS_SUCCESSFUL !=
+	if (0 !=
 	    pci_read_config_word(dev, SIS5595_BASE_REG, &address)) {
 		dev_err(&dev->dev, "Failed to read ISA address\n");
 		return -ENODEV;
@@ -843,16 +843,16 @@ static int sis5595_pci_probe(struct pci_dev *dev,
 		return -ENODEV;
 	}
 
-	if (PCIBIOS_SUCCESSFUL !=
+	if (0 !=
 	    pci_read_config_byte(dev, SIS5595_ENABLE_REG, &enable)) {
 		dev_err(&dev->dev, "Failed to read enable register\n");
 		return -ENODEV;
 	}
 	if (!(enable & 0x80)) {
-		if ((PCIBIOS_SUCCESSFUL !=
+		if ((0 !=
 		     pci_write_config_byte(dev, SIS5595_ENABLE_REG,
 					   enable | 0x80))
-		 || (PCIBIOS_SUCCESSFUL !=
+		 || (0 !=
 		     pci_read_config_byte(dev, SIS5595_ENABLE_REG, &enable))
 		 || (!(enable & 0x80))) {
 			/* doesn't work for some chips! */
diff --git a/drivers/hwmon/via686a.c b/drivers/hwmon/via686a.c
index a2eddd2c2538..cffea688878f 100644
--- a/drivers/hwmon/via686a.c
+++ b/drivers/hwmon/via686a.c
@@ -863,11 +863,11 @@ static int via686a_pci_probe(struct pci_dev *dev,
 	if (force_addr) {
 		address = force_addr & ~(VIA686A_EXTENT - 1);
 		dev_warn(&dev->dev, "Forcing ISA address 0x%x\n", address);
-		if (PCIBIOS_SUCCESSFUL !=
+		if (0 !=
 		    pci_write_config_word(dev, VIA686A_BASE_REG, address | 1))
 			return -ENODEV;
 	}
-	if (PCIBIOS_SUCCESSFUL !=
+	if (0 !=
 	    pci_read_config_word(dev, VIA686A_BASE_REG, &val))
 		return -ENODEV;
 
@@ -878,7 +878,7 @@ static int via686a_pci_probe(struct pci_dev *dev,
 		return -ENODEV;
 	}
 
-	if (PCIBIOS_SUCCESSFUL !=
+	if (0 !=
 	    pci_read_config_word(dev, VIA686A_ENABLE_REG, &val))
 		return -ENODEV;
 	if (!(val & 0x0001)) {
@@ -890,7 +890,7 @@ static int via686a_pci_probe(struct pci_dev *dev,
 		}
 
 		dev_warn(&dev->dev, "Enabling sensors\n");
-		if (PCIBIOS_SUCCESSFUL !=
+		if (0 !=
 		    pci_write_config_word(dev, VIA686A_ENABLE_REG,
 					  val | 0x0001))
 			return -ENODEV;
diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
index 2335d440f72d..cc1d24c2a2c8 100644
--- a/drivers/hwmon/vt8231.c
+++ b/drivers/hwmon/vt8231.c
@@ -987,12 +987,12 @@ static int vt8231_pci_probe(struct pci_dev *dev,
 		dev_warn(&dev->dev, "Forcing ISA address 0x%x\n",
 			 address);
 
-		if (PCIBIOS_SUCCESSFUL !=
+		if (0 !=
 		    pci_write_config_word(dev, VT8231_BASE_REG, address | 1))
 			return -ENODEV;
 	}
 
-	if (PCIBIOS_SUCCESSFUL != pci_read_config_word(dev, VT8231_BASE_REG,
+	if (0 != pci_read_config_word(dev, VT8231_BASE_REG,
 							&val))
 		return -ENODEV;
 
@@ -1002,13 +1002,13 @@ static int vt8231_pci_probe(struct pci_dev *dev,
 		return -ENODEV;
 	}
 
-	if (PCIBIOS_SUCCESSFUL != pci_read_config_word(dev, VT8231_ENABLE_REG,
+	if (0 != pci_read_config_word(dev, VT8231_ENABLE_REG,
 							&val))
 		return -ENODEV;
 
 	if (!(val & 0x0001)) {
 		dev_warn(&dev->dev, "enabling sensors\n");
-		if (PCIBIOS_SUCCESSFUL !=
+		if (0 !=
 			pci_write_config_word(dev, VT8231_ENABLE_REG,
 							val | 0x0001))
 			return -ENODEV;
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
