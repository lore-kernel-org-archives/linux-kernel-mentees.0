Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A8BC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:44:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8426611C1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8426611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB9F3607BE;
	Fri, 15 Oct 2021 14:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59TanWh2MP6h; Fri, 15 Oct 2021 14:44:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 01D2160794;
	Fri, 15 Oct 2021 14:44:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2D0BC000F;
	Fri, 15 Oct 2021 14:44:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DCEDC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CE16405A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4tkN9_2j0kbc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:44:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E80F405A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:44:25 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id om14so7326720pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3zEq2AfHmzmiP6iMn6OVsjvfYEnKpi8akIlRzP+t4I8=;
 b=dyAZT/p0dT9PasizXG2QMLWP9+YuqIWP99M5ACtaPFSadZhI9m8GHHkk/R4W7hP/5M
 +DNZp8rf5DzYFVHmNz6KFZCw4c7mbbAj9hvFDbEd6rifpLj/XHlbJ0t3iEx/Vi7lia6o
 wtxQwipx6zSrA3RauqaZM5GjsrkJaKrFH4zW4tv7gjYRhV4ePeatlUr2d64wt1+IrTwK
 MPtfpVvhV3iipgHqHHOOLXFg34TM8uHMn4KHgb96uTeftw23YinyaP+JWZ+3IjI3XLpI
 iy2mvee0AmgSDet/bU1TeLGQTGO9upb3jd6JhLmmLfN/I7jqkB7U/URY0+iLAe57JUY7
 Du6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3zEq2AfHmzmiP6iMn6OVsjvfYEnKpi8akIlRzP+t4I8=;
 b=3wiZ6VgZUnsLWngMXEOSf7KYW0Jq06Bk35fAh0Hfp4AZJItXufLV7DRFlzErb6d9jy
 fy6TqKDOsyTp+tRl3jMZvhEwjKrl+A1jPd4dg6VpZunj9okBiHoaJU/Tf9hKuVACZ2Vo
 1YkvldYXRFMtL2hfvwCfyJgPHqYafAwjHXCGYuisJ+o+GoqE8DBzQC5BA53RGG2MTnzF
 NdvqJ+y5FzsCjv4H920G30kRu5uxhhbbK9yX2y7dbMqqaNl9aganq2HP6MXheNiGuMhO
 i/TvCRxFcMrjP8COm4RI/gnEv/9KY2EhDs0fegCZhQxUBzpsIzyyaGjBLZB8+TDkYmVn
 MTsQ==
X-Gm-Message-State: AOAM530dcvZZ9qBLoqYw2hPj3E9wkZxjrArCDod0T8qyV/WN5GeR1XjR
 ps90W59TjGL65JYzdvIzxpg=
X-Google-Smtp-Source: ABdhPJwN5vVjjcYaPoWE1cazSNXn7TZ2gWNzDqGt6lze4Za97JUo8BXigAYTP3PVi53Z4LxVs6VtIQ==
X-Received: by 2002:a17:90a:191a:: with SMTP id
 26mr28519019pjg.118.1634309064982; 
 Fri, 15 Oct 2021 07:44:24 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:44:24 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 11/24] PCI: aardvark: Remove redundant error fabrication
 when device read fails
Date: Fri, 15 Oct 2021 20:08:52 +0530
Message-Id: <f7965c41d74e0efd4f6f01eb19af90f99989346c.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-pci@vger.kernel.org,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 "moderated list:PCI DRIVER FOR AARDVARK Marvell Armada 3700"
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
 drivers/pci/controller/pci-aardvark.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 596ebcfcc82d..1af772c76d06 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -893,10 +893,8 @@ static int advk_pcie_rd_conf(struct pci_bus *bus, u32 devfn,
 	u32 reg;
 	int ret;
 
-	if (!advk_pcie_valid_device(pcie, bus, devfn)) {
-		*val = 0xffffffff;
+	if (!advk_pcie_valid_device(pcie, bus, devfn))
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	if (pci_is_root_bus(bus))
 		return pci_bridge_emul_conf_read(&pcie->bridge, where,
@@ -920,7 +918,6 @@ static int advk_pcie_rd_conf(struct pci_bus *bus, u32 devfn,
 			*val = CFG_RD_CRS_VAL;
 			return PCIBIOS_SUCCESSFUL;
 		}
-		*val = 0xffffffff;
 		return PCIBIOS_SET_FAILED;
 	}
 
@@ -955,16 +952,13 @@ static int advk_pcie_rd_conf(struct pci_bus *bus, u32 devfn,
 			*val = CFG_RD_CRS_VAL;
 			return PCIBIOS_SUCCESSFUL;
 		}
-		*val = 0xffffffff;
 		return PCIBIOS_SET_FAILED;
 	}
 
 	/* Check PIO status and get the read result */
 	ret = advk_pcie_check_pio_status(pcie, allow_crs, val);
-	if (ret < 0) {
-		*val = 0xffffffff;
+	if (ret < 0)
 		return PCIBIOS_SET_FAILED;
-	}
 
 	if (size == 1)
 		*val = (*val >> (8 * (where & 3))) & 0xff;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
