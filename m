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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC959C4346B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EA7820849
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qOy7ElWW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EA7820849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4F030891BC;
	Mon, 13 Jul 2020 13:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-jm1uOeFjR1; Mon, 13 Jul 2020 13:23:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9FABF8908C;
	Mon, 13 Jul 2020 13:23:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C7BAC0888;
	Mon, 13 Jul 2020 13:23:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EC97C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8EC10876E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nyvbgKUgmZ69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B7A55876C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:09 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id w6so17136724ejq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rplWXqoRmMzG/PAypQDSMVo9rsbsvM0HW4mN54VwCPY=;
 b=qOy7ElWW63EuFj1bTCYdyQLghlNDXNsRyywynTNgzD0Gq2x5qrJkewWFkC7exZ3ZK+
 WszpqO334hwMhryyStOXx4Lr6yXFcseq6PMIyjonDk24NsGX1T9MUDI2QUBUjO3LWGbM
 Li9jO95VLMGwEH/ZoYPlMg5XHj1kZ5ppuN+yX9tYvdA/nj3QJiO8zdIXlSNw2qo2a6nH
 sqbqya0t9Apm7UjW5m5M6YLJRGsvsyAdyWdCif1CyKWabSWLz57vj7tLaSDUILABN/76
 3mqzHZzhgpEV/h5XKdKHPT7Sv3o5sk5cKDjcx7xoPTUKFkv62VAV/8RkNo81Aco4xq90
 zLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rplWXqoRmMzG/PAypQDSMVo9rsbsvM0HW4mN54VwCPY=;
 b=VaNw8sShJa7Yw57pZgphmx5Wg57Sdk1g7h7E7M8QOS0C5gHWD5aSOStOMZ3ynfzCEY
 9dKIQHwwcndKuvBH4BxH8F6wSe/vIyNWmgIFoxufsC5MApgNwG1rIOmRgzqT2w9Pn18m
 TNf41ENq75wg/xEvcPRFC3OuO42tW3BJqoo1zVa8gVbNgvqChh1U3e1HpMdLgwbvfxFb
 FICEOw4Wuad9LT4bParwp56/c+DcUEAHUXT5KTArzhdL+O7/BFUTlgbkKHOspaTFiBQ9
 1uGkA53kBUImVsGRG+Qy1eTxkKHer/j8J3PaEjRKRN5zEHu6iYCFCLBgFUwwJ/N5PCpY
 ub1g==
X-Gm-Message-State: AOAM532+0IW2f1UyqxlBBse3DkjqiAHAxeVIvw4pYKUWlNqeCKl+SQf4
 VZiekdzkWUJiVM8amABIcl0=
X-Google-Smtp-Source: ABdhPJwRfcZjb10nMLeLG67GTJhBUEo56JkZJMLUALmO5nYTsFEky+Xkmns5sJRXxh54bY0oHtpWTA==
X-Received: by 2002:a17:906:7115:: with SMTP id
 x21mr71985610ejj.86.1594646588253; 
 Mon, 13 Jul 2020 06:23:08 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:07 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	"David S. Miller" <davem@davemloft.net>
Date: Mon, 13 Jul 2020 14:22:35 +0200
Message-Id: <20200713122247.10985-24-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 23/35] sparc/PCI: Change
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
 arch/sparc/kernel/pci_common.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/sparc/kernel/pci_common.c b/arch/sparc/kernel/pci_common.c
index 4759ccd542fe..39175f26f401 100644
--- a/arch/sparc/kernel/pci_common.c
+++ b/arch/sparc/kernel/pci_common.c
@@ -59,7 +59,7 @@ static int sun4u_read_pci_cfg_host(struct pci_pbm_info *pbm,
 
 	addr = sun4u_config_mkaddr(pbm, bus, devfn, where);
 	if (!addr)
-		return PCIBIOS_SUCCESSFUL;
+		return 0;
 
 	switch (size) {
 	case 1:
@@ -102,7 +102,7 @@ static int sun4u_read_pci_cfg_host(struct pci_pbm_info *pbm,
 		*value |= tmp32 << 16;
 		break;
 	}
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int sun4u_read_pci_cfg(struct pci_bus *bus_dev, unsigned int devfn,
@@ -132,7 +132,7 @@ static int sun4u_read_pci_cfg(struct pci_bus *bus_dev, unsigned int devfn,
 
 	addr = sun4u_config_mkaddr(pbm, bus, devfn, where);
 	if (!addr)
-		return PCIBIOS_SUCCESSFUL;
+		return 0;
 
 	switch (size) {
 	case 1:
@@ -144,7 +144,7 @@ static int sun4u_read_pci_cfg(struct pci_bus *bus_dev, unsigned int devfn,
 		if (where & 0x01) {
 			printk("pci_read_config_word: misaligned reg [%x]\n",
 			       where);
-			return PCIBIOS_SUCCESSFUL;
+			return 0;
 		}
 		pci_config_read16((u16 *)addr, &tmp16);
 		*value = (u32) tmp16;
@@ -154,12 +154,12 @@ static int sun4u_read_pci_cfg(struct pci_bus *bus_dev, unsigned int devfn,
 		if (where & 0x03) {
 			printk("pci_read_config_dword: misaligned reg [%x]\n",
 			       where);
-			return PCIBIOS_SUCCESSFUL;
+			return 0;
 		}
 		pci_config_read32(addr, value);
 		break;
 	}
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int sun4u_write_pci_cfg_host(struct pci_pbm_info *pbm,
@@ -170,7 +170,7 @@ static int sun4u_write_pci_cfg_host(struct pci_pbm_info *pbm,
 
 	addr = sun4u_config_mkaddr(pbm, bus, devfn, where);
 	if (!addr)
-		return PCIBIOS_SUCCESSFUL;
+		return 0;
 
 	switch (size) {
 	case 1:
@@ -206,7 +206,7 @@ static int sun4u_write_pci_cfg_host(struct pci_pbm_info *pbm,
 					 where + 2, 2, value >> 16);
 		break;
 	}
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int sun4u_write_pci_cfg(struct pci_bus *bus_dev, unsigned int devfn,
@@ -222,7 +222,7 @@ static int sun4u_write_pci_cfg(struct pci_bus *bus_dev, unsigned int devfn,
 
 	addr = sun4u_config_mkaddr(pbm, bus, devfn, where);
 	if (!addr)
-		return PCIBIOS_SUCCESSFUL;
+		return 0;
 
 	switch (size) {
 	case 1:
@@ -233,7 +233,7 @@ static int sun4u_write_pci_cfg(struct pci_bus *bus_dev, unsigned int devfn,
 		if (where & 0x01) {
 			printk("pci_write_config_word: misaligned reg [%x]\n",
 			       where);
-			return PCIBIOS_SUCCESSFUL;
+			return 0;
 		}
 		pci_config_write16((u16 *)addr, value);
 		break;
@@ -242,11 +242,11 @@ static int sun4u_write_pci_cfg(struct pci_bus *bus_dev, unsigned int devfn,
 		if (where & 0x03) {
 			printk("pci_write_config_dword: misaligned reg [%x]\n",
 			       where);
-			return PCIBIOS_SUCCESSFUL;
+			return 0;
 		}
 		pci_config_write32(addr, value);
 	}
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 struct pci_ops sun4u_pci_ops = {
@@ -284,7 +284,7 @@ static int sun4v_read_pci_cfg(struct pci_bus *bus_dev, unsigned int devfn,
 	}
 
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int sun4v_write_pci_cfg(struct pci_bus *bus_dev, unsigned int devfn,
@@ -307,7 +307,7 @@ static int sun4v_write_pci_cfg(struct pci_bus *bus_dev, unsigned int devfn,
 				     HV_PCI_DEVICE_BUILD(bus, device, func),
 				     where, size, value);
 	}
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 struct pci_ops sun4v_pci_ops = {
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
