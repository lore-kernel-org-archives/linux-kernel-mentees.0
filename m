Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11F5C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 17:55:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9736D61056
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 17:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9736D61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A6AF608A4;
	Mon, 11 Oct 2021 17:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id riZGkA65l755; Mon, 11 Oct 2021 17:55:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8AF0A60899;
	Mon, 11 Oct 2021 17:55:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77C57C000F;
	Mon, 11 Oct 2021 17:55:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1619C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3A034036B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVuIpV6Va9be
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:55:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52CCE402CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:55:47 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id m14so15474243pfc.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 10:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QoYdRdVPFBgzF0byghvbRioEVo6f6dpKTV5r2hTcAdQ=;
 b=ltW+f0rbN/uPUVAH4o8eij4NeHjfvjxzyTIm0z47FLxfPHnHZBDlexL8LeD4scV0A7
 Aq2Cf7SQJzV66QLG2M5xEOE1AuWu7zvm0vRLyRewSZVc68x3FJTTGzkyJSvE7FGrBppJ
 IRIBOMAG424UU4msfXNq0UmXTmgcQ2wUfXTl1zM859G+xKka3Fm+x+JAYa41FJvHGuc1
 0cs0+YgMHG0Pj5l9w4/pIs8lU3RdS1TZqmF7B9QpYzdQUic2UEE6cXJQymDYfh3fTPt8
 CSBJX+aDzkf614T801J9e3/HaVGMt7V5O/1eEFymgEbfpRI4cE8Dm5tvWXNt5nzFq9cA
 fwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QoYdRdVPFBgzF0byghvbRioEVo6f6dpKTV5r2hTcAdQ=;
 b=urj+AocwScOIPBxZIewrOb3ENaiVXdQ/dewq46ZdvII89saFwcMabay88b2CkCFNOq
 ZNTVZXnmrlcAmuQe2t+HRgS003GuVExafvz2yHQyPLPR+EGIfFLoiHQ8b3s0+g0+oYJF
 IwqLtVEl8uGDonrQtp2Y6sQVwO+ASyrLmt/LhWnfnT8kchDpmcoYVnV+J9cDw0cjo34Z
 tf+3NHvx+6c53SiGSL0kYGEAYh2d4AB5l12oqLBmh9gJbh5Xnfa4nV247B/NX9QXrsBq
 HDxEB3uDDLuEm4GJEmH5tb2pTGvTQEVuHiaIeT2JRIHpgc1mKgsW7JHd+1qGTKNQ7o3M
 WCxw==
X-Gm-Message-State: AOAM533uHGaaWrMI+wLunhrQE0Fk5x2jASClOniUy+6LjAM2T1OZxyca
 TfKSgESQ29Tg3sVX3dJM00c=
X-Google-Smtp-Source: ABdhPJw+HCqgfQADOdEGCNm+9dT2i5EQY3JxrTsbW69x0A2NZM7eDjDKBtYYiMr6nM+PiesMRs5mZA==
X-Received: by 2002:a62:1d46:0:b0:44d:1a4d:5d03 with SMTP id
 d67-20020a621d46000000b0044d1a4d5d03mr7882789pfd.55.1633974946582; 
 Mon, 11 Oct 2021 10:55:46 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 y24sm8384653pfo.69.2021.10.11.10.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:55:46 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 08/22] PCI: kirin: Use SET_PCI_ERROR_RESPONSE() when device
 not found
Date: Mon, 11 Oct 2021 23:25:25 +0530
Message-Id: <d8e423386aad3d78bca575a7521b138508638e3b.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, Binghui Wang <wangbinghui@hisilicon.com>,
 linux-kernel@vger.kernel.org, Xiaowei Song <songxiaowei@hisilicon.com>,
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

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Use SET_PCI_ERROR_RESPONSE() to set the error response, when a faulty
read occurs.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Compile tested only.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/dwc/pcie-kirin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 026fd1e42a55..a37b59a9e0be 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -331,7 +331,7 @@ static int kirin_pcie_rd_own_conf(struct pci_bus *bus, unsigned int devfn,
 	struct dw_pcie *pci = to_dw_pcie_from_pp(bus->sysdata);
 
 	if (PCI_SLOT(devfn)) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
