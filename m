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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8819CC4347E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CC8820773
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0hv7peU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CC8820773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 28ACF876F7;
	Mon, 13 Jul 2020 13:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_RpCPsFqSs3; Mon, 13 Jul 2020 13:23:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B052876E6;
	Mon, 13 Jul 2020 13:23:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87048C0888;
	Mon, 13 Jul 2020 13:23:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71F89C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 61672226F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elanIfrlJGM9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 533292002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:21 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id lx13so17144047ejb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oKjzi2ECxC66M2cq5pSDhTnWy5R7cPGASuD1MUUpNKk=;
 b=m0hv7peUSoEu1HaED1ilH8q2Yvulbgnr8sEk5ujyQpvD2p2giyiLRwEFXl2DmoMR1L
 XpcpPwScY6D58mgiZ/Ioslm2LleFhnPHY4LNRAaYlXM0gQLIXclEPx8E9LZTylNuIdoi
 gppHKD9BY4vUbMYQ1S5C5e/enekD0lYTju5DkXO12ZsDuacG6qrYtX33osQMsQPPi1xL
 fSx/AgLZCj+tZr81MFm0dlzvtuPxHL6e69BGtQkAgmNfQx7rYukjqvgrlWhLTejMylPX
 DDluL/N8T+pb9MgV1jSM43ngBwL9/AwqgSSU9XHNcC10szF7x10BAZe3IB9lZmNTYc2a
 17kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oKjzi2ECxC66M2cq5pSDhTnWy5R7cPGASuD1MUUpNKk=;
 b=TzE9v4bFw3Z20KijeSfgwxkTal8GdD91GIF3lecIy9GOH0hH1Wh0okL0Vg5i/ELkSl
 LphF1PZk6oqeE3MdRMtckuAz9z+gCNVQrepO702MQlpvk2qZPjpOjhlxqhs7elfWWPCU
 FgVUgnA3g4y6z0Mq4Rw9mYIieDDvx44PjX77m/0Hv+M11W14gAL3Ok2ttPXhw2LTKbPF
 9UoDBSW6sKKterPFR8qqX7hqcUo3Hmbj4dLJXJYo9vU1xlXDDZjod/rLz6LbJsjA8HNk
 05urQpIJQnpgIRpPw5vB+r5VVgmXrFR/fT5peAG0yPsgq1g8xmDBDPj1Q01Xi28hUwNM
 m/xw==
X-Gm-Message-State: AOAM532XrKlnQRD4E7jyon9h4r1Y6Zq5i3xXvYvhZdVQI3fbS50apwll
 hX6Pnsx0dAQJm3QC3EQ6hNg=
X-Google-Smtp-Source: ABdhPJw9vhhuR0dTOcWCGfHHtV7ehKWAbkfQuFQnlHmgFmQHxUAxscgm05NwJQ/bOktQDl+dNWLj/A==
X-Received: by 2002:a17:906:1756:: with SMTP id
 d22mr7116853eje.29.1594646599804; 
 Mon, 13 Jul 2020 06:23:19 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:19 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Russell King <linux@armlinux.org.uk>
Date: Mon, 13 Jul 2020 14:22:44 +0200
Message-Id: <20200713122247.10985-33-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 32/35] arm/PCI: Change
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
 arch/arm/common/it8152.c           | 4 ++--
 arch/arm/mach-cns3xxx/pcie.c       | 2 +-
 arch/arm/mach-footbridge/dc21285.c | 4 ++--
 arch/arm/mach-iop32x/pci.c         | 6 +++---
 arch/arm/mach-ixp4xx/common-pci.c  | 8 ++++----
 arch/arm/mach-orion5x/pci.c        | 4 ++--
 arch/arm/plat-orion/pcie.c         | 8 ++++----
 7 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm/common/it8152.c b/arch/arm/common/it8152.c
index 9ec740cac469..331911b627c4 100644
--- a/arch/arm/common/it8152.c
+++ b/arch/arm/common/it8152.c
@@ -186,7 +186,7 @@ static int it8152_pci_read_config(struct pci_bus *bus,
 
 	*value = v;
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int it8152_pci_write_config(struct pci_bus *bus,
@@ -216,7 +216,7 @@ static int it8152_pci_write_config(struct pci_bus *bus,
 	__raw_writel((addr + where), IT8152_PCI_CFG_ADDR);
 	__raw_writel((v | vtemp), IT8152_PCI_CFG_DATA);
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 struct pci_ops it8152_ops = {
diff --git a/arch/arm/mach-cns3xxx/pcie.c b/arch/arm/mach-cns3xxx/pcie.c
index e92fbd679dfb..7020071a2dc5 100644
--- a/arch/arm/mach-cns3xxx/pcie.c
+++ b/arch/arm/mach-cns3xxx/pcie.c
@@ -92,7 +92,7 @@ static int cns3xxx_pci_read_config(struct pci_bus *bus, unsigned int devfn,
 
 	ret = pci_generic_config_read(bus, devfn, where, size, val);
 
-	if (ret == PCIBIOS_SUCCESSFUL && !bus->number && !devfn &&
+	if (ret == 0 && !bus->number && !devfn &&
 	    (where & 0xffc) == PCI_CLASS_REVISION)
 		/*
 		 * RC's class is 0xb, but Linux PCI driver needs 0x604
diff --git a/arch/arm/mach-footbridge/dc21285.c b/arch/arm/mach-footbridge/dc21285.c
index 416462e3f5d6..5ad78b38c659 100644
--- a/arch/arm/mach-footbridge/dc21285.c
+++ b/arch/arm/mach-footbridge/dc21285.c
@@ -86,7 +86,7 @@ dc21285_read_config(struct pci_bus *bus, unsigned int devfn, int where,
 		return -1;
 	}
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int
@@ -121,7 +121,7 @@ dc21285_write_config(struct pci_bus *bus, unsigned int devfn, int where,
 		return -1;
 	}
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 struct pci_ops dc21285_ops = {
diff --git a/arch/arm/mach-iop32x/pci.c b/arch/arm/mach-iop32x/pci.c
index ab0010dc3145..a29d33ce20c8 100644
--- a/arch/arm/mach-iop32x/pci.c
+++ b/arch/arm/mach-iop32x/pci.c
@@ -118,7 +118,7 @@ iop3xx_read_config(struct pci_bus *bus, unsigned int devfn, int where,
 
 	*value = val;
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int
@@ -131,7 +131,7 @@ iop3xx_write_config(struct pci_bus *bus, unsigned int devfn, int where,
 	if (size != 4) {
 		val = iop3xx_read(addr);
 		if (iop3xx_pci_status())
-			return PCIBIOS_SUCCESSFUL;
+			return 0;
 
 		where = (where & 3) * 8;
 
@@ -154,7 +154,7 @@ iop3xx_write_config(struct pci_bus *bus, unsigned int devfn, int where,
 			  "r" (IOP3XX_OCCAR), "r" (IOP3XX_OCCDR));
 	}
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 struct pci_ops iop3xx_ops = {
diff --git a/arch/arm/mach-ixp4xx/common-pci.c b/arch/arm/mach-ixp4xx/common-pci.c
index 893c19c254e3..f7cd535d4971 100644
--- a/arch/arm/mach-ixp4xx/common-pci.c
+++ b/arch/arm/mach-ixp4xx/common-pci.c
@@ -208,7 +208,7 @@ static int local_read_config(int where, int size, u32 *value)
 	crp_read(where & ~3, &data);
 	*value = (data >> (8*n)) & bytemask[size];
 	pr_debug("local_read_config read %#x\n", *value);
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int local_write_config(int where, int size, u32 value)
@@ -221,7 +221,7 @@ static int local_write_config(int where, int size, u32 value)
 		return PCIBIOS_BAD_REGISTER_NUMBER;
 	data = value << (8*n);
 	crp_write((where & ~3) | byte_enables, data);
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static u32 byte_lane_enable_bits(u32 n, int size)
@@ -255,7 +255,7 @@ static int ixp4xx_pci_read_config(struct pci_bus *bus, unsigned int devfn, int w
 
 	*value = (data >> (8*n)) & bytemask[size];
 	pr_debug("read_config_byte read %#x\n", *value);
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int ixp4xx_pci_write_config(struct pci_bus *bus,  unsigned int devfn, int where, int size, u32 value)
@@ -276,7 +276,7 @@ static int ixp4xx_pci_write_config(struct pci_bus *bus,  unsigned int devfn, int
 	if (ixp4xx_pci_write(addr, byte_enables | NP_CMD_CONFIGWRITE, data))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 struct pci_ops ixp4xx_ops = {
diff --git a/arch/arm/mach-orion5x/pci.c b/arch/arm/mach-orion5x/pci.c
index 76951bfbacf5..2b587225e244 100644
--- a/arch/arm/mach-orion5x/pci.c
+++ b/arch/arm/mach-orion5x/pci.c
@@ -289,14 +289,14 @@ static int orion5x_pci_hw_rd_conf(int bus, int dev, u32 func,
 
 	spin_unlock_irqrestore(&orion5x_pci_lock, flags);
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int orion5x_pci_hw_wr_conf(int bus, int dev, u32 func,
 					u32 where, u32 size, u32 val)
 {
 	unsigned long flags;
-	int ret = PCIBIOS_SUCCESSFUL;
+	int ret = 0;
 
 	spin_lock_irqsave(&orion5x_pci_lock, flags);
 
diff --git a/arch/arm/plat-orion/pcie.c b/arch/arm/plat-orion/pcie.c
index 8b8c06d2e9c4..6fb142f893ac 100644
--- a/arch/arm/plat-orion/pcie.c
+++ b/arch/arm/plat-orion/pcie.c
@@ -221,7 +221,7 @@ int orion_pcie_rd_conf(void __iomem *base, struct pci_bus *bus,
 	else if (size == 2)
 		*val = (*val >> (8 * (where & 3))) & 0xffff;
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 int orion_pcie_rd_conf_tlp(void __iomem *base, struct pci_bus *bus,
@@ -244,7 +244,7 @@ int orion_pcie_rd_conf_tlp(void __iomem *base, struct pci_bus *bus,
 	else if (size == 2)
 		*val = (*val >> (8 * (where & 3))) & 0xffff;
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 int orion_pcie_rd_conf_wa(void __iomem *wa_base, struct pci_bus *bus,
@@ -260,13 +260,13 @@ int orion_pcie_rd_conf_wa(void __iomem *wa_base, struct pci_bus *bus,
 	else if (size == 2)
 		*val = (*val >> (8 * (where & 3))) & 0xffff;
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 int orion_pcie_wr_conf(void __iomem *base, struct pci_bus *bus,
 		       u32 devfn, int where, int size, u32 val)
 {
-	int ret = PCIBIOS_SUCCESSFUL;
+	int ret = 0;
 
 	writel(PCIE_CONF_BUS(bus->number) |
 		PCIE_CONF_DEV(PCI_SLOT(devfn)) |
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
