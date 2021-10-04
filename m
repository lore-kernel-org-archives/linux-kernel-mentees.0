Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423D8C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:02:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62F060F9E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D62F060F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9F67404F4;
	Mon,  4 Oct 2021 18:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjiAHlBAUl6Q; Mon,  4 Oct 2021 18:02:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D43B34044B;
	Mon,  4 Oct 2021 18:02:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BECBC0011;
	Mon,  4 Oct 2021 18:02:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8346DC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73896405C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zWJGW4GfA8G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5B464055A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:05 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id s11so17308785pgr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gPh5qiPFI3S0XIvBtJdJh517PYOVsE4NLDG4oIGpMoo=;
 b=mzYG7nKQV4n2HxRXM9fB7rETP3sJkX4/Rn82nC53JPOMhlckHng8L/wMMqqYreUoVU
 1q0yC+5vomo21R4lPjPJCW6sO3brNvQ5NmyQ7oSHweT1yCJ5zDn2fwH+v4osk9SIqI/b
 F64BEgmapf4JRVbxncKTSykF2ePnFj806kvrXZ5IZpw9pmpuxPq0jR65C+tcAi3wXKGx
 ra3gpTCW0HCK5Cyuyucs/yCDjdojuIeSMYc6X6ZGG9rZSEHpoVVEuM/CuD22yHO2i3tH
 +wX7xYaYDFO54xAJwJ2DCy+4YQro7wCRvKBqJiERX8FnrZt+qkx/nVbgMV+JMuzUM31u
 WFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gPh5qiPFI3S0XIvBtJdJh517PYOVsE4NLDG4oIGpMoo=;
 b=XvlD/Qc3NbgDuTbxchPbm3UAc/KV+L96DRDhWGiUCMcqJ4mdGrSjivkgneIbH8IzmI
 hgydpEcgUMWq83zzf4BUww3JXTZfkCp5yK4O+Y9eKA8azupHBwcqHgVRQm+sPauKMDHN
 xTnqzTzb8GdGXp4HtQXmjDPaAAU669JmO9sQRZta4SHznwBUXMaaGXtuFOwI2csraRe8
 0UmNdBhO+PgJcUiTNtzH7OwrxuKCffxpzbsGzAMSQKyNrMc4T4UZaSGl+CCMmpCIN4Dv
 xf0VbznskNHRaF2+8tq+i4UWiQn0Ho8BB81cHBRey6MT5l8lIY/4NXmlhnUfbZMIZRjB
 qnGA==
X-Gm-Message-State: AOAM530gImDffG8W7SOo6suSMwkIeax63uzbfy6yo89B2DRwCFtmJzWK
 4pf7Oda7NaeTDYLFEPihaj4=
X-Google-Smtp-Source: ABdhPJzerTveTTqnmsEBHMgmpX4JByTTvA8Nw57fjbDy07nms6vrNcoekHMr7OeeNEK5XeDdbB4wQw==
X-Received: by 2002:a05:6a00:1789:b0:43d:ea98:7ea8 with SMTP id
 s9-20020a056a00178900b0043dea987ea8mr27393301pfg.67.1633370525385; 
 Mon, 04 Oct 2021 11:02:05 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 z2sm3641004pfe.210.2021.10.04.11.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:02:05 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	tsbogend@alpha.franken.de
Subject: [PATCH 3/6] MIPS: OCTEON: Remove redundant enable of PCIe normal
 error reporting
Date: Mon,  4 Oct 2021 23:29:29 +0530
Message-Id: <b7eb2cae4f81648a8df5885d5d5f7371a6c436e2.1633369560.git.naveennaidu479@gmail.com>
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

Currently when CONFIG_PCIEAER=y, the PCIe normal error reporting is
enabled by pci_enable_pcie_error_reporting() in the aer_probe() path.

It is now no longer necessary for Octeon code to enable PCIe normal
error since it's done when PCIe bus loads the AER service driver.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 arch/mips/pci/pci-octeon.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/mips/pci/pci-octeon.c b/arch/mips/pci/pci-octeon.c
index 8e8b282226cc..2c251018075c 100644
--- a/arch/mips/pci/pci-octeon.c
+++ b/arch/mips/pci/pci-octeon.c
@@ -114,13 +114,6 @@ int pcibios_plat_dev_init(struct pci_dev *dev)
 		pci_write_config_word(dev, PCI_BRIDGE_CONTROL, config);
 	}
 
-	/* Enable the PCIe normal error reporting */
-	config = PCI_EXP_DEVCTL_CERE; /* Correctable Error Reporting */
-	config |= PCI_EXP_DEVCTL_NFERE; /* Non-Fatal Error Reporting */
-	config |= PCI_EXP_DEVCTL_FERE;	/* Fatal Error Reporting */
-	config |= PCI_EXP_DEVCTL_URRE;	/* Unsupported Request */
-	pcie_capability_set_word(dev, PCI_EXP_DEVCTL, config);
-
 	/* Find the Advanced Error Reporting capability */
 	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
 	if (pos) {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
