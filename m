Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA317C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:02:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A569960FBF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A569960FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BD1D40463;
	Mon,  4 Oct 2021 18:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FofA8KlKwf7J; Mon,  4 Oct 2021 18:02:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 64CEB40018;
	Mon,  4 Oct 2021 18:02:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 510FDC0011;
	Mon,  4 Oct 2021 18:02:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB5ADC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99C584028E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I4EdBeZQEvL0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD41540018
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:21 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id 187so10795824pfc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 11:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KXqbMrl5ji7P3WLEqvYvyx/g2tHqF5Pvsy98EpcbEmA=;
 b=dK+/OiASR7/FhhaAZ1YS1MI0vNDY5l52Cxz3No+1sg7HRJnIdcgAq2YwESOyPBn6U2
 ylQrlDPi0zET4PEkuZZaCD2aMFfQFJd5zq6AkC0uFi2S2rmimoy07cpRoQDo08+j3TlM
 mm82LwXdWRtUirmQLHAQH5mBG4+PmSS85QwdWqcPmhfkFCN/BNttISWbcw9IBCdZK339
 /ZZSwBhc414AE9lM7y7WmavuWwWVzavo+q3xY267R/GbDxwoAsITSos7CCXOGaq/BVj6
 IPbA+CMtTg7ClhaFo/okYXOLZ8iemQ8vLlIPKr3K54As7GRT2CBtzx3b8o6HhtlMgguf
 rAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KXqbMrl5ji7P3WLEqvYvyx/g2tHqF5Pvsy98EpcbEmA=;
 b=mAgkyBcw3QtFjMBdpFR6N1FTFunwoaqpPIrz+9b+gV+tEMpMlpyEIZJqdvcmTZRiJb
 R4/67W06JNNj241p6QIy496J9ClJxvet9yQ8JP6pWDtk2CsdTOWFP875pqyFyKhhBhpS
 I/asp3KdwjTgbr+4UqH2Q/8qCqAq4dkmazQX/of8StVI7LqgEPsTa7elHhRRvtCzJZaJ
 eNtMg+ke59O4yrX1sKRkFy8mudMECo9QrdWg6Y1wX9ybiElLMHzcHzRmfiYDow7t3vrz
 VzjMBxD3aAYXQjZ3+oWi6THJdW4rx/PxcOMGB2qBXOwfSX24LrZyq9CTxADjg3upPgol
 sqvg==
X-Gm-Message-State: AOAM530aaiIhc8MuEOSW76VZH3UUVG919zc3zCOVPYdTJn0jnOLsbHiy
 2Rk/KjyIuq6B6yY/ceUfYw8=
X-Google-Smtp-Source: ABdhPJzbBvEjkhQa/NIXLQN94nJSDDapaLKAaUE41cWvqwkMormTval0zeWCNCkCWwbjm9h9m6LR6Q==
X-Received: by 2002:a65:44c4:: with SMTP id g4mr12117582pgs.254.1633370541031; 
 Mon, 04 Oct 2021 11:02:21 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 z2sm3641004pfe.210.2021.10.04.11.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:02:20 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	tsbogend@alpha.franken.de
Subject: [PATCH 4/6] MIPS: OCTEON: Remove redundant enable of COR/UNCOR error
Date: Mon,  4 Oct 2021 23:29:30 +0530
Message-Id: <ba79bae65a1955cd7f7e005f352b1b32799a1781.1633369560.git.naveennaidu479@gmail.com>
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

Currently when CONFIG_PCIEAER=y, correctable/uncorrectable errors
are enabled by set_device_error_reporting() in the aer_probe()
path.

It is now no longer necessary for Octeon code to enable PCIe COR/UNCOR
errors since it's done when PCIe bus loads the AER service driver.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 arch/mips/pci/pci-octeon.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/mips/pci/pci-octeon.c b/arch/mips/pci/pci-octeon.c
index 2c251018075c..a82cf48f00ab 100644
--- a/arch/mips/pci/pci-octeon.c
+++ b/arch/mips/pci/pci-octeon.c
@@ -117,18 +117,13 @@ int pcibios_plat_dev_init(struct pci_dev *dev)
 	/* Find the Advanced Error Reporting capability */
 	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
 	if (pos) {
-		/* Enable reporting of all uncorrectable errors */
-		/* Uncorrectable Error Mask - turned on bits disable errors */
-		pci_write_config_dword(dev, pos + PCI_ERR_UNCOR_MASK, 0);
 		/*
 		 * Leave severity at HW default. This only controls if
 		 * errors are reported as uncorrectable or
 		 * correctable, not if the error is reported.
 		 */
 		/* PCI_ERR_UNCOR_SEVER - Uncorrectable Error Severity */
-		/* Enable reporting of all correctable errors */
-		/* Correctable Error Mask - turned on bits disable errors */
-		pci_write_config_dword(dev, pos + PCI_ERR_COR_MASK, 0);
+
 		/* Advanced Error Capabilities */
 		pci_read_config_dword(dev, pos + PCI_ERR_CAP, &dconfig);
 		/* ECRC Generation Enable */
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
