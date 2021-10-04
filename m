Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AF0C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:01:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B0AD60F9E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B0AD60F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1FF9404D7;
	Mon,  4 Oct 2021 18:01:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ashKCQllt4Xk; Mon,  4 Oct 2021 18:01:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E4F154044B;
	Mon,  4 Oct 2021 18:01:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D213AC0011;
	Mon,  4 Oct 2021 18:01:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EC84C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D53E4024A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nnd43rXkB3iH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:01:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B881940018
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:01:53 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so52363pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 11:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GKIE676lAIQP3K8bm7VIPKhomAuX7+QEcMrA2aQJQD4=;
 b=AugnioZW9Cfwp3G3sNl3PuDtrwA4HVrVhrt63Bz71r+RGC1t3iLk0OWnjXCn2HzCE6
 5VLLw9uWj8X20O9E6kRZQVDSCzFySiieYyi1go8qwoMWFMlEYInBaj+UetkT5NuiFqF8
 gA1+VS9y3JlY42eo2CfT5sLY4QqJs5cGD8wx+OzuRO6m2iSV0/+GQSoj2OdeM7QMG2fJ
 k4YnZXRFoD+NYvwhBACyAT1vXcybc8AMlZlFQXQZ3uWF4zOcGbE7z2Uw2lfzGdSYT4EE
 pX4uVbEG9xk0yVMjEHx4mXJw9RB3lw2+RDxii46mp35C4vOv2WwthkGOon3yCKWxKLaK
 UrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GKIE676lAIQP3K8bm7VIPKhomAuX7+QEcMrA2aQJQD4=;
 b=uP5WKa6Z2zXbNQjjAOF6YZh/rjfh+IhGLpaafJZvinHBDb8OH9rJ1Yv51EKOBCLEH6
 fgaLbGabRWhQRQvq9MMIbh28hIwZNv510xqWm4ePtanZB4XCjMaxfzo7OzXLnqZMMqWm
 1h0SU4hjbrn/StmA5U1AH6QTV6I8MwSICD7bgOe25rVILf59j0CTAvSPbSYJiVwythA7
 ZN/J4BjV/L00E0zz9NpyBZpXTqg2sBFoVzln1n69qDkhtkBYJtL+OPFNNE9APHnS8Y/h
 /b3yywcgZEX0/pua5BNgd17N+515LRU1CCM5jWzcjS8TAYLfC6ckhs93ywoD77RhTfkN
 NYcg==
X-Gm-Message-State: AOAM5318pzue8PNB1yb54skoSfjrCfei439JQNX2UKZinX0rJcV8n117
 KbeUwURBDHcV2/IGS51WcbI=
X-Google-Smtp-Source: ABdhPJyBFAGowvpqQWLMH1+/Hh4N7CQei+7CS2x8RoVdpaytMm113MtrGmeFWEovPG7dbGJUjiueFQ==
X-Received: by 2002:a17:902:ee93:b0:13e:c846:c902 with SMTP id
 a19-20020a170902ee9300b0013ec846c902mr972060pld.88.1633370513074; 
 Mon, 04 Oct 2021 11:01:53 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 z2sm3641004pfe.210.2021.10.04.11.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:01:52 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	tsbogend@alpha.franken.de
Subject: [PATCH 2/6] MIPS: OCTEON: Remove redundant clearing of AER status
 registers
Date: Mon,  4 Oct 2021 23:29:28 +0530
Message-Id: <81597ce8ee30ad01da86fe1edf0fab76aa9b9710.1633369560.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633369560.git.naveennaidu479@gmail.com>
References: <cover.1633369560.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

e8635b484f64 ("MIPS: Add Cavium OCTEON PCI support.") added MIPS
specific code to enable PCIe and AER error reporting (*irrespective
of CONFIG_PCIEAER value*) because PCI core didn't do that at the time.

Currently when CONFIG_PCIEAER=y, the Uncorrectable Error status,
Correctable Error status and Root status registers are cleared
during the PCI Bus enumeration path by pci_aer_init() via
pci_init_capabilities()

It is now no longer necessary for Octeon code to clear AER status
registers since it's done by PCI core.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 arch/mips/pci/pci-octeon.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/mips/pci/pci-octeon.c b/arch/mips/pci/pci-octeon.c
index fc29b85cfa92..8e8b282226cc 100644
--- a/arch/mips/pci/pci-octeon.c
+++ b/arch/mips/pci/pci-octeon.c
@@ -124,11 +124,6 @@ int pcibios_plat_dev_init(struct pci_dev *dev)
 	/* Find the Advanced Error Reporting capability */
 	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
 	if (pos) {
-		/* Clear Uncorrectable Error Status */
-		pci_read_config_dword(dev, pos + PCI_ERR_UNCOR_STATUS,
-				      &dconfig);
-		pci_write_config_dword(dev, pos + PCI_ERR_UNCOR_STATUS,
-				       dconfig);
 		/* Enable reporting of all uncorrectable errors */
 		/* Uncorrectable Error Mask - turned on bits disable errors */
 		pci_write_config_dword(dev, pos + PCI_ERR_UNCOR_MASK, 0);
@@ -138,9 +133,6 @@ int pcibios_plat_dev_init(struct pci_dev *dev)
 		 * correctable, not if the error is reported.
 		 */
 		/* PCI_ERR_UNCOR_SEVER - Uncorrectable Error Severity */
-		/* Clear Correctable Error Status */
-		pci_read_config_dword(dev, pos + PCI_ERR_COR_STATUS, &dconfig);
-		pci_write_config_dword(dev, pos + PCI_ERR_COR_STATUS, dconfig);
 		/* Enable reporting of all correctable errors */
 		/* Correctable Error Mask - turned on bits disable errors */
 		pci_write_config_dword(dev, pos + PCI_ERR_COR_MASK, 0);
@@ -159,9 +151,6 @@ int pcibios_plat_dev_init(struct pci_dev *dev)
 				       PCI_ERR_ROOT_CMD_COR_EN |
 				       PCI_ERR_ROOT_CMD_NONFATAL_EN |
 				       PCI_ERR_ROOT_CMD_FATAL_EN);
-		/* Clear the Root status register */
-		pci_read_config_dword(dev, pos + PCI_ERR_ROOT_STATUS, &dconfig);
-		pci_write_config_dword(dev, pos + PCI_ERR_ROOT_STATUS, dconfig);
 	}
 
 	return 0;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
