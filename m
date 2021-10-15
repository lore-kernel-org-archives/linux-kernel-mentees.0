Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD066C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:43:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66EE161181
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66EE161181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3859583B6D;
	Fri, 15 Oct 2021 14:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5GafD97Vu2r; Fri, 15 Oct 2021 14:43:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 67E6883B5D;
	Fri, 15 Oct 2021 14:43:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41FD7C000D;
	Fri, 15 Oct 2021 14:43:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04D93C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CADB6084F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AMBtLMlzT66r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:43:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C39E760846
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:43:24 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id 187so8521167pfc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2kMW7De0WUTFR8R6pbmw+v+DfoEFjJfFZEPmx6TpIo=;
 b=eMtI6REOFWix9KtW5tFZKnYJASMZfWRLSZnk5Z3YHrAZfJHAzvFnr8ylXwPFqc2a/a
 sSZ8UvQq1tqytMA7xvcnnsiLWefZHtOIvyR4w48y0+/FL2UKgIHln+v2qE2m/w+JTFM1
 5/mXXW1NrvfbNEM0Kxme6uJJEBTs38ZYlbTHW6Re7rHSajvVurS8Uq1V2v4NCeWCfPhp
 0AMJSPYYm2sBLxJatPIFmiVJT/Oh5NHr53JmOewoMKlOnjkfBC7TBlY4MypeOeGa17pJ
 HGEAOs0d5LPR7Euvw8ZGAQvAt0r8Wbzm43Xw5FKSEaUKTN3vn6bLTxu6DfAsFds4nbK0
 6Xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E2kMW7De0WUTFR8R6pbmw+v+DfoEFjJfFZEPmx6TpIo=;
 b=6+mwiY5Uy7MpZ1Gp6M/xH9y6SeQiAuYJTmnMvq7G2VWbZdAjy9eToP00srrJa9gcuo
 1LRkwuwH94w9OjRvLNSSks0LjlpNkd5WpdHQWxTlWS9UkJLa8Atav11fV3eTfXG0UYdo
 g1HnTu4vmaYGoSrL/QaJ24ZCgPpkovXLJDO1HNftORERNoExaDz11L0Ca2vH6y53fx2G
 xuwLKTnGF7EqMonnZ70/sCoPT8Nzmq4p3GTQGqQpGQ863Rlrat1A0vmYFxQf8Jxn8qet
 ygBKwKJfVmhOsKrphUSAmv+l7E+Y2QTiapiGw+l94dCsR5kTZ7rFO0U07RBL4hC6Vm1d
 3xVw==
X-Gm-Message-State: AOAM532o4t3eMsmXl5Dgn4b4k/9kNCsTJkiTZwet1bUaRESEwEapufGG
 Dx8YYpf5lZDdL1QHrVkYx6TEoed8avujIlZq
X-Google-Smtp-Source: ABdhPJznv5Me0M33f8HkD/iBEPi7jNhXlMeZY3pyG0z8AuGV93euaOSAW3r29nVl5vtoWE0qzOFOmg==
X-Received: by 2002:a62:2f81:0:b0:44b:b390:956b with SMTP id
 v123-20020a622f81000000b0044bb390956bmr12110659pfv.30.1634309004189; 
 Fri, 15 Oct 2021 07:43:24 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:43:23 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 07/24] PCI: mediatek: Remove redundant error fabrication
 when device read fails
Date: Fri, 15 Oct 2021 20:08:48 +0530
Message-Id: <4aa74ccd31c42b108b61f2ad274bae59a1d25114.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "open list:PCIE DRIVER FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
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
causes a PCI error. There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

The host controller drivers sets the error response values (~0) and
returns an error when faulty hardware read occurs. But the error
response value (~0) is already being set in PCI_OP_READ and
PCI_USER_READ_CONFIG whenever a read by host controller driver fails.

Thus, it's no longer necessary for the host controller drivers to
fabricate any error response.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 2f3f974977a3..a19f8ec5d392 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -365,19 +365,12 @@ static int mtk_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 {
 	struct mtk_pcie_port *port;
 	u32 bn = bus->number;
-	int ret;
 
 	port = mtk_pcie_find_port(bus, devfn);
-	if (!port) {
-		*val = ~0;
+	if (!port)
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
-
-	ret = mtk_pcie_hw_rd_cfg(port, bn, devfn, where, size, val);
-	if (ret)
-		*val = ~0;
 
-	return ret;
+	return mtk_pcie_hw_rd_cfg(port, bn, devfn, where, size, val);
 }
 
 static int mtk_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
