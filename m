Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C445BC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:10:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 809A160F57
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 809A160F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52D1760726;
	Thu, 21 Oct 2021 15:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDPphobrxRGD; Thu, 21 Oct 2021 15:10:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 534FB6067C;
	Thu, 21 Oct 2021 15:10:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 336C4C001C;
	Thu, 21 Oct 2021 15:10:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9F42C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB79F40725
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t_JRlC_BKSPv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:10:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB12A40017
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:10:35 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id w17so614986plg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdvW0++TQSaLpnlhn3di6k88yfCHb1cy15TmRrFrgvg=;
 b=nn6UzH9K9xm3BbgtRQT6//j7LivuHHqgkWvtklOkW7BxcAWXi6Rd3wDo0ZMLlHD6Jl
 NRcnBGrGQ1ZfkNe5rRWEQ0JQ/mM3SVw90rPXXq4UEClymVBFEo2/hYL4S72QvEomDSWW
 oliXHekIGSCz1mEQuSIzvaJAfV+o0Na3hlhpMrArEX0ePY3PIiCA/SbBbVZ8zstP05F3
 4LnrCFGoiSabuUSczr3kkL6WkQMjJsBLXxqzyEbVvTbvHul0SrcUz9JNZX9r5yxgaXVt
 1kinykOuYgmINjXMI/Rrj406Xsjo8n4/P+tO2WTw8CnQGG5HABdOrzMIIvUoSV5bwV2o
 2P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdvW0++TQSaLpnlhn3di6k88yfCHb1cy15TmRrFrgvg=;
 b=KnuDCKRJnlGgR4BvERexRBlMmFo2R8UyBhLrmLtRpRLT+odkCRRjjikH4olPLNx1Us
 X7y12jS1o56C46Z/0FwUonWokDwxMHbf+joCRCxxRMeappM7HTTfifSdP3hSwZlGhfwh
 4jBKGxsTcuIsqFRgXvb/SbR/1SG18FTXOQWKCtY0sGjBlYCC586qsvk85QkVucw4r1dJ
 vMPvIlYe+1JBhmDQlKMMcwzQHYoNDTWO2iP4yglZb4uOhBWlg95qkaTw5Bl6x32mNeQN
 OJDRb7Mh8FxT32QkrIpDPgLdf2ALsU9/2iamAiIPmH58AD3ts+Xzi/zPliI1a4Z6lLBp
 oK0Q==
X-Gm-Message-State: AOAM531VBKG3fvRUs69OsGmgoa56qd2aDjW5achpKffrgZeM50RwYsrQ
 qfpW4cmO350FjZxJrolT3bonyKkbJEsQ616X
X-Google-Smtp-Source: ABdhPJwQAqO9qqsqzDQINhSUMNkWXH1PmXLf2/63QLfNEoLTgPrpMEAnn6+IoPd3F6XdClY7Gx/RiA==
X-Received: by 2002:a17:902:6808:b0:13e:a85b:52bd with SMTP id
 h8-20020a170902680800b0013ea85b52bdmr5630098plk.76.1634829035035; 
 Thu, 21 Oct 2021 08:10:35 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:10:34 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 05/25] PCI: thunder: Remove redundant error fabrication
 when device read fails
Date: Thu, 21 Oct 2021 20:37:30 +0530
Message-Id: <823658699653e78ffe9ff856d0bff5058f5d6a8f.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Robert Richter <rric@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "moderated list:PCIE DRIVER FOR CAVIUM THUNDERX"
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
 drivers/pci/controller/pci-thunder-ecam.c | 46 ++++++++---------------
 drivers/pci/controller/pci-thunder-pem.c  |  4 +-
 2 files changed, 17 insertions(+), 33 deletions(-)

diff --git a/drivers/pci/controller/pci-thunder-ecam.c b/drivers/pci/controller/pci-thunder-ecam.c
index ffd84656544f..a95bb58afd52 100644
--- a/drivers/pci/controller/pci-thunder-ecam.c
+++ b/drivers/pci/controller/pci-thunder-ecam.c
@@ -41,10 +41,9 @@ static int handle_ea_bar(u32 e0, int bar, struct pci_bus *bus,
 	}
 	if (where_a == 0x4) {
 		addr = bus->ops->map_bus(bus, devfn, bar); /* BAR 0 */
-		if (!addr) {
-			*val = ~0;
+		if (!addr)
 			return PCIBIOS_DEVICE_NOT_FOUND;
-		}
+
 		v = readl(addr);
 		v &= ~0xf;
 		v |= 2; /* EA entry-1. Base-L */
@@ -56,10 +55,9 @@ static int handle_ea_bar(u32 e0, int bar, struct pci_bus *bus,
 		u32 barl_rb;
 
 		addr = bus->ops->map_bus(bus, devfn, bar); /* BAR 0 */
-		if (!addr) {
-			*val = ~0;
+		if (!addr)
 			return PCIBIOS_DEVICE_NOT_FOUND;
-		}
+
 		barl_orig = readl(addr + 0);
 		writel(0xffffffff, addr + 0);
 		barl_rb = readl(addr + 0);
@@ -72,10 +70,9 @@ static int handle_ea_bar(u32 e0, int bar, struct pci_bus *bus,
 	}
 	if (where_a == 0xc) {
 		addr = bus->ops->map_bus(bus, devfn, bar + 4); /* BAR 1 */
-		if (!addr) {
-			*val = ~0;
+		if (!addr)
 			return PCIBIOS_DEVICE_NOT_FOUND;
-		}
+
 		v = readl(addr); /* EA entry-3. Base-H */
 		set_val(v, where, size, val);
 		return PCIBIOS_SUCCESSFUL;
@@ -104,10 +101,8 @@ static int thunder_ecam_p2_config_read(struct pci_bus *bus, unsigned int devfn,
 	}
 
 	addr = bus->ops->map_bus(bus, devfn, where_a);
-	if (!addr) {
-		*val = ~0;
+	if (!addr)
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	v = readl(addr);
 
@@ -135,10 +130,8 @@ static int thunder_ecam_config_read(struct pci_bus *bus, unsigned int devfn,
 	int where_a = where & ~3;
 
 	addr = bus->ops->map_bus(bus, devfn, 0xc);
-	if (!addr) {
-		*val = ~0;
+	if (!addr)
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	v = readl(addr);
 
@@ -146,10 +139,8 @@ static int thunder_ecam_config_read(struct pci_bus *bus, unsigned int devfn,
 	cfg_type = (v >> 16) & 0x7f;
 
 	addr = bus->ops->map_bus(bus, devfn, 8);
-	if (!addr) {
-		*val = ~0;
+	if (!addr)
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	class_rev = readl(addr);
 	if (class_rev == 0xffffffff)
@@ -176,10 +167,8 @@ static int thunder_ecam_config_read(struct pci_bus *bus, unsigned int devfn,
 	}
 
 	addr = bus->ops->map_bus(bus, devfn, 0);
-	if (!addr) {
-		*val = ~0;
+	if (!addr)
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	vendor_device = readl(addr);
 	if (vendor_device == 0xffffffff)
@@ -196,10 +185,9 @@ static int thunder_ecam_config_read(struct pci_bus *bus, unsigned int devfn,
 		bool is_tns = (vendor_device == 0xa01f177d);
 
 		addr = bus->ops->map_bus(bus, devfn, 0x70);
-		if (!addr) {
-			*val = ~0;
+		if (!addr)
 			return PCIBIOS_DEVICE_NOT_FOUND;
-		}
+
 		/* E_CAP */
 		v = readl(addr);
 		has_msix = (v & 0xff00) != 0;
@@ -211,10 +199,9 @@ static int thunder_ecam_config_read(struct pci_bus *bus, unsigned int devfn,
 		}
 		if (where_a == 0xb0) {
 			addr = bus->ops->map_bus(bus, devfn, where_a);
-			if (!addr) {
-				*val = ~0;
+			if (!addr)
 				return PCIBIOS_DEVICE_NOT_FOUND;
-			}
+
 			v = readl(addr);
 			if (v & 0xff00)
 				pr_err("Bad MSIX cap header: %08x\n", v);
@@ -268,10 +255,9 @@ static int thunder_ecam_config_read(struct pci_bus *bus, unsigned int devfn,
 
 		if (where_a == 0x70) {
 			addr = bus->ops->map_bus(bus, devfn, where_a);
-			if (!addr) {
-				*val = ~0;
+			if (!addr)
 				return PCIBIOS_DEVICE_NOT_FOUND;
-			}
+
 			v = readl(addr);
 			if (v & 0xff00)
 				pr_err("Bad PCIe cap header: %08x\n", v);
diff --git a/drivers/pci/controller/pci-thunder-pem.c b/drivers/pci/controller/pci-thunder-pem.c
index 0660b9da204f..06a9855cb431 100644
--- a/drivers/pci/controller/pci-thunder-pem.c
+++ b/drivers/pci/controller/pci-thunder-pem.c
@@ -41,10 +41,8 @@ static int thunder_pem_bridge_read(struct pci_bus *bus, unsigned int devfn,
 	struct pci_config_window *cfg = bus->sysdata;
 	struct thunder_pem_pci *pem_pci = (struct thunder_pem_pci *)cfg->priv;
 
-	if (devfn != 0 || where >= 2048) {
-		*val = ~0;
+	if (devfn != 0 || where >= 2048)
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	/*
 	 * 32-bit accesses only.  Write the address to the low order
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
