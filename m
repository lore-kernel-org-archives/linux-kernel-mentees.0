Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFD3C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 17:51:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1735960C4A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 17:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1735960C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC1B5402C8;
	Mon, 11 Oct 2021 17:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fn0enaNZq54n; Mon, 11 Oct 2021 17:51:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A70B44029E;
	Mon, 11 Oct 2021 17:51:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8463FC000F;
	Mon, 11 Oct 2021 17:51:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7103C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D566E60899
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B6PfvvTFUBJq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:51:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 567DB6088E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:51:39 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 66so11488922pgc.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 10:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/eCkgBabqgzZMoeU3aBzDcQBc9kpvi2Lrj2FSZUU1HE=;
 b=YHh9+t/+VTBC4s3ntJ//sJ/3/IIr2caH4VqARETHgUCXzk5AJvktpuzm9dE1uaz8JR
 xfjTOD7aZUQWRjbKXiGclanTMy8FIrFMav39XmnhURFykou9MBA41/JZBhSM+7F4oHLA
 SP02gBaRgAi+oh7QRziQfMLDPOty5vvLh/RP3ivWQn6Y2sB6qtOy64EiNbYPGwDrncay
 C+mDaqnykJqY0eIAz2Iz0OW+V+GdMg/ZeNJtD5NKeLGRVzSxqJEP1uOfrPqA3jU0492d
 fW5eUzfXmMfoZsHp372XsnmCWx3xGZMWZOUwL0mzcXIQAAPaFvY1njIycCdWRu30XZ95
 C7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/eCkgBabqgzZMoeU3aBzDcQBc9kpvi2Lrj2FSZUU1HE=;
 b=2t0tFqmHdrMdxO6TiyMSIaHI+knO+pA0XVdOentb91CP47wbQ4r9mOkzFfoMf010zE
 4HuMjO03SMpQnoXvwhWJ0T6FFKd+eGJpz9IDlgmLVpplsoqWyl0CY5UfYY+JPngxu/b7
 o+O1JP6K/FikUZqpRXJImAkxx1EIooh4zzkR6KqkaW9nRTmAUalTvZFK7Y65YCPr5gvQ
 ENpluZUOeUGIjjEuqPjjm0oHTM/+DeBWZGL32y7PseO2ULBcJC76K/hGXzLxZxKIAbFj
 /bGSkix0YVXgGcCD6krKmdcwmWW1AKuhun4pfAYBDAoNFnvpFrCGyHhiwWKjWt2K3PqL
 knMQ==
X-Gm-Message-State: AOAM531ulNQu4i6dt7K2N63Zxrip4baqQnS/3lobX/jPJsPVhCLoihKO
 cOLMP1vS1dQxfSjA+1eq8ws=
X-Google-Smtp-Source: ABdhPJyoiL1u1vbuIv3pXSKqdKMc5JLSJ9ySrHxMnxgboUVF/xihVga0exmAZwG6n8zy5S27LTM1tA==
X-Received: by 2002:aa7:93ca:0:b0:44c:da51:38ac with SMTP id
 y10-20020aa793ca000000b0044cda5138acmr21437391pff.67.1633974698694; 
 Mon, 11 Oct 2021 10:51:38 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id y6sm124618pjw.2.2021.10.11.10.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:51:38 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 05/22] PCI: mediatek: Use SET_PCI_ERROR_RESPONSE() when device
 not found
Date: Mon, 11 Oct 2021 23:21:22 +0530
Message-Id: <01f0c358e3ea05510e04384c3fb5edc577523430.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "open list:PCIE DRIVER FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 p.zabel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>,
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
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Use SET_PCI_ERROR_RESPONSE() to set the error response, when a faulty
read occurs.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Compile tested only.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 2f3f974977a3..aa744ccd1a2a 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -369,13 +369,13 @@ static int mtk_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 
 	port = mtk_pcie_find_port(bus, devfn);
 	if (!port) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
 	ret = mtk_pcie_hw_rd_cfg(port, bn, devfn, where, size, val);
 	if (ret)
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 
 	return ret;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
