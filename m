Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C524BC43217
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:02:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A11060FBF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A11060FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55B914057B;
	Mon,  4 Oct 2021 18:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zDMtEvnv2XlP; Mon,  4 Oct 2021 18:02:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 912BD4057A;
	Mon,  4 Oct 2021 18:02:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70896C0011;
	Mon,  4 Oct 2021 18:02:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DD8AC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F5944016A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qexze9Nu9mbG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CBFC40018
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:39 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id t4so496215plo.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 11:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=25oPhBAQkpYHQtBYswx+vS6+yZtQwuBWM057qnMpNgo=;
 b=a+i/D2I2zafjFRyVlx3zfqTHD/dvxl0+TVAzlmofD0s5Qm7DQxny3W3HPYBfFYfg7U
 DPQwS1MXFkOlOEpIdsFNgW8RFIwa5dUjs31vNl+2J46pcKEmEZJJO6cHIAAfEXRsgpHg
 7SwyOHal9fLukzQPAoo44doJJpZoZSEa8MLs0kOFAtuH+etLAEp3iHhVG3baosWkdLjq
 4mMw8HON7jV2S6toLxJWlPp/fmwhz5Yh+8izA9POP5P7hU1PGWxFjBJiB4w2TPhM/Vi4
 m5L3pOMuyKVbbnUWI2LL6mA8/H5aPbRdQ5dJQSCCj5/1kq4gAWl/sn6rxKpJORaP1S+d
 Jkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=25oPhBAQkpYHQtBYswx+vS6+yZtQwuBWM057qnMpNgo=;
 b=yVri0u/ABDQgpMRNgJi0qO672rPhtbqdjDi36BMSU+yIYI5BcwO7JL4jdIjBlcYlU8
 SRcOwTieBE+AkeI0rRNnv05MIE4LibdnJkDxX7QJBpf6lzZyZMXtoxKgbhgf0AHvd+pk
 Opv9ZAZpTycmSIPbNiuxXiKEm4AkZpk5gMrQnqzjT4Wr7vvbhiw6kOIpu+7F1YeBZvY5
 t44oI8eBXfgpb/Z6SbE1nDgFmCNfLhbfCsmGGfGfUSMApx9WWHQ/sNU9b928fvSkYP29
 UP5TwNjOZdrUtgV2WY08QkLnezJlzxvTcIIibV1Dq+L24dmoCVxnWaK27PYTBTK4ypER
 zQPw==
X-Gm-Message-State: AOAM532Moh/41DNzx/1hazoQGNJs0KtVIdy+BGh/D7viwzgKH5uWhg6z
 d7ONsTkQ91knXbn2XKMptt8=
X-Google-Smtp-Source: ABdhPJxv6QIzFS3p/UlJANVCJKP+PWKnIFZqL4BNZk5cQPC6u6+nGacnfaojYfhuU38H2X9HnRDehA==
X-Received: by 2002:a17:90a:428e:: with SMTP id
 p14mr38364317pjg.92.1633370558785; 
 Mon, 04 Oct 2021 11:02:38 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 z2sm3641004pfe.210.2021.10.04.11.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:02:38 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	tsbogend@alpha.franken.de
Subject: [PATCH 5/6] MIPS: OCTEON: Remove redundant ECRC Generation Enable
Date: Mon,  4 Oct 2021 23:29:31 +0530
Message-Id: <6d0856b6953765463aac43fbd641d26f19dc7e11.1633369560.git.naveennaidu479@gmail.com>
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

Currently when CONFIG_PCIEAER=y, ECRC generation is enabled by
pcie_set_ecrc_checking() in the aer_probe() path.

It is now no longer necessary for Octeon code to enable ECRC since
it's done when PCIe bus loads the AER service driver.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 arch/mips/pci/pci-octeon.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/mips/pci/pci-octeon.c b/arch/mips/pci/pci-octeon.c
index a82cf48f00ab..b973fc464c21 100644
--- a/arch/mips/pci/pci-octeon.c
+++ b/arch/mips/pci/pci-octeon.c
@@ -124,15 +124,6 @@ int pcibios_plat_dev_init(struct pci_dev *dev)
 		 */
 		/* PCI_ERR_UNCOR_SEVER - Uncorrectable Error Severity */
 
-		/* Advanced Error Capabilities */
-		pci_read_config_dword(dev, pos + PCI_ERR_CAP, &dconfig);
-		/* ECRC Generation Enable */
-		if (config & PCI_ERR_CAP_ECRC_GENC)
-			config |= PCI_ERR_CAP_ECRC_GENE;
-		/* ECRC Check Enable */
-		if (config & PCI_ERR_CAP_ECRC_CHKC)
-			config |= PCI_ERR_CAP_ECRC_CHKE;
-		pci_write_config_dword(dev, pos + PCI_ERR_CAP, dconfig);
 		/* PCI_ERR_HEADER_LOG - Header Log Register (16 bytes) */
 		/* Report all errors to the root complex */
 		pci_write_config_dword(dev, pos + PCI_ERR_ROOT_COMMAND,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
