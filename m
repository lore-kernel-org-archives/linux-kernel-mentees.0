Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89A6C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:12:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EE4B603E5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EE4B603E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32E51401E1;
	Mon, 11 Oct 2021 18:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BgeQbefCNuze; Mon, 11 Oct 2021 18:12:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 238E840120;
	Mon, 11 Oct 2021 18:12:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0175EC0011;
	Mon, 11 Oct 2021 18:12:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7617BC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 646FB4036B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4B0DditZVr3m
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:12:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AB9C40221
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:12:08 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id ls18so13846436pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 11:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iKrtrnYSDksMWdgmUznUR/Q64gwdi8mvvQO4UVqOm9E=;
 b=NQPnwh11904uP3h5MegadAiUsEzmbr+NUC4xCBkOzr+acrFXxgnv0RNH7jFvtGanJO
 cBm3WB/xAM+YFWw287it0yRRp3GQf9P9YtTaV4emKba4RjNycwNAHbPLJWdbCy6AFboo
 wx1h+1QQEH8pblTlSf2sG1gOLY1347ErCVOeLsziBXFTWdfwacXEtaMZGrm6Cz7cXtIT
 r4fxsDhs6CBh3LMFrMY1esGlZV5A593L2X8rc6D1w3karLOqVBcqPlGU2CxfW4E18HJo
 8HQOL3ivDL3Zg+gO5ymn8arHG4w8Ls7u5F9UIFzKokeyMim/pCB6kU1GfC0jfHCidAT/
 nIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iKrtrnYSDksMWdgmUznUR/Q64gwdi8mvvQO4UVqOm9E=;
 b=fNzsRH0cPVU9JtfqHmt4W4Pc3Eb8qRug3d+XfU7oMAHx8CREVOGhaPzz0DVU2BIxho
 1At83XwuKsdoV9wQaCM5IymX7eaG3X/fP+VPr4QOcAeycHeKvTABGYbzBvXGrbwN26V+
 U4p2vpj5IIoAFUDUdYkrku/PoDUFuxLRWKuOlz1DYwcS3UZs/SQ9IHj3Fb69Km0sZhdV
 +9ZeigtgKjBsVvWdHojneIWscMHvfjd87HlQhzezeeJHWijy/wPd5vtFS8h3IEuCuj+L
 RB9uzcUnszIE3qQifodTXlqDtGWcUfIz7i1He825mKaXw19o/TgDVgXSyH0cZYH1QE/V
 Z2SA==
X-Gm-Message-State: AOAM533PFtxQi4HAfkzJMFFIdkZEE1JJ6cFKTlFk7BaiZCzLvGCTbcwC
 vNtxNO7SEVHjNgFrHTvBKhU=
X-Google-Smtp-Source: ABdhPJyOTFBZTe7riUZlUFC2nl/siIMfDTnUL5JGaxiyNZmPOd0W33SnqGWyjMYbUnoJELtkDWBwqA==
X-Received: by 2002:a17:90a:e552:: with SMTP id
 ei18mr518809pjb.239.1633975927732; 
 Mon, 11 Oct 2021 11:12:07 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 r130sm8508875pfc.89.2021.10.11.11.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 11:12:07 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 20/22] PCI: keystone: Use PCI_ERROR_RESPONSE to specify
 hardware error
Date: Mon, 11 Oct 2021 23:41:52 +0530
Message-Id: <01c86d23327e28ee6d09daa01538f1a12f9e4d11.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Marc Zyngier <maz@kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Include PCI_ERROR_RESPONSE along with 0xffffffff in the comment to
specify a hardware error. This helps finding where MMIO read error
occurs easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/dwc/pci-keystone.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 865258d8c53c..25b11610b500 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -748,8 +748,8 @@ static int ks_pcie_config_legacy_irq(struct keystone_pcie *ks_pcie)
 #ifdef CONFIG_ARM
 /*
  * When a PCI device does not exist during config cycles, keystone host gets a
- * bus error instead of returning 0xffffffff. This handler always returns 0
- * for this kind of faults.
+ * bus error instead of returning 0xffffffff (PCI_ERROR_RESPONSE).
+ * This handler always returns 0 for this kind of faults.
  */
 static int ks_pcie_fault(unsigned long addr, unsigned int fsr,
 			 struct pt_regs *regs)
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
