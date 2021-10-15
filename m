Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288C2C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:42:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA51061181
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA51061181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A52AE838FB;
	Fri, 15 Oct 2021 14:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ut-Mza4HTIga; Fri, 15 Oct 2021 14:42:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 18B3082EAD;
	Fri, 15 Oct 2021 14:42:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBBE9C000F;
	Fri, 15 Oct 2021 14:42:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F49CC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F86E838FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1LrB4vscTnvq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:42:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AA7582EAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:42:30 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so7468653pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdvW0++TQSaLpnlhn3di6k88yfCHb1cy15TmRrFrgvg=;
 b=Q18vQqndGcurLweRXYc1rzDMAduk8Vh9PTeJJjtfKAvQvmRdB6pW9hy/672gEz9DsG
 z5BeuhxE2+leaaUsJWppbQwR+IC53u/d+AvdY5VDVi8dRRS4f+Ewdl6Hx6VnOK4c/n37
 cE4NFm5dStTlASwg8E1aNNOpftWM0Y5KkWUXrhMtiyOA8PkoYuoTfqW3UjsBTjTVv7uJ
 QLFJn70tRncaKqPvEq8FlDvRzc5TaV+bleHI9gE6pSq8VOzYP2vIlc9OS+LAOy7zUT0F
 TUGfzErI2rpr6gOXaZwKxWMI5zTgPqMMmcTEnmDgAT6qQpWcvnbsx/QsuOW/JqzXApIq
 cJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdvW0++TQSaLpnlhn3di6k88yfCHb1cy15TmRrFrgvg=;
 b=NxqeRsRi+pGgLkcndS+/DNxLul3ArX+666K8H1nuZTafh/QUPG6GJHWyGMieRhQWnM
 ThmB2NH4AAEg7F+FPsf2TNC2umWi2BwX68+GbNhHA971Iao5giocBtn0HMU0oso6nwBZ
 +Ed4zrNtCox5rMTbSzM8wXAcCV8m6QcTSm0K5NF2DG5e4niEFmdXFiQKSFVMQX3KcuUa
 ngD3HuMOb9pJ7+5QrUkNQpOMu4F1lrdwjr3iZAE3CwkTwBcL7mbqsv12HXrKfxNNkAxM
 FdhYGEg5S5OP69/bdiqgZTHdEYvHaa9wJy7CBWfdjwCRsfAPZvVs53RQemBgFLcJIDa1
 h36Q==
X-Gm-Message-State: AOAM531P+iBKty4r9DmA9DbrXVun/ZrJH6v8XQOwXLkFMzPnzQ/6PcYx
 G4RNt3/ulYIrmPqb9VOcr6g=
X-Google-Smtp-Source: ABdhPJxeQ84ojnBBZu2zIQtH1rovbyQgwZWEUn/qQwp5b8CaOXNo2u2bECDDMoMgvIu15OLAyskkig==
X-Received: by 2002:a17:90b:1d0d:: with SMTP id
 on13mr17112610pjb.36.1634308949575; 
 Fri, 15 Oct 2021 07:42:29 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:42:29 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 05/24] PCI: thunder: Remove redundant error fabrication
 when device read fails
Date: Fri, 15 Oct 2021 20:08:46 +0530
Message-Id: <2d825f341b95c2fd91aa749a3901f9c0912a2372.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
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
