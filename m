Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA17C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 17:45:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE35460F0F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 17:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE35460F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3E3F402C2;
	Mon, 11 Oct 2021 17:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4DLRQZysnFK; Mon, 11 Oct 2021 17:45:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 979F640299;
	Mon, 11 Oct 2021 17:45:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E529C000F;
	Mon, 11 Oct 2021 17:45:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF72FC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A129840282
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryzuzI6OFb8z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:45:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E315040362
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:45:33 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id x4so11846533pln.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 10:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rvyIILinTPLJ5IGz12ZGgmNprHQpAgzhPfKruj1QRTQ=;
 b=JrP1Ohv+cYjrx5Jh/JaA7MwB/9gvY+X1vWCy+bHL75WvvGHkjD9CJL50NjhZAIFjel
 W5Vd5bG4LFgS3+ZaYLS/EccdCLVOWQmE8zFXKq9L9XxrEpD9Ed9OBzeOpnYV8MWVt5m7
 RovxeDrvhFMwn64Ldcfe+yGWQSQFgoqFSBOUS5wMtlPZCeU6300+7LyIS5TCDPt/CuPV
 Z3c+Xrw5aDYy7ivX6Mwnx6Hs79JA+/O1VJyrmjMtNG7vgfCyYpC41G+WQDwijKoIxiLC
 bgJYonkUnoYeHr/pMqT80xLaX/Zv3upaDGR6IG3ul+W3X++nwnJbyRcvjNMSuijQGKSN
 dzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rvyIILinTPLJ5IGz12ZGgmNprHQpAgzhPfKruj1QRTQ=;
 b=xzLCjaYvsxz0FNNIxlaWQWDCAavBE9gwxoy1uvbNNyUrex2uyNb9fFTyC62LtiLrsZ
 4gjTrqZ+6fRfVRGUPUBXOH86g9RHhu6rX+H8kYZOQhLZBNZm8D/y5HG3fs6G7IYJTVit
 pM0HlEzMV1lo9CeoeW8qA9XyMUhUjcgBUGWSkHwz26qKw39pFOMcK+WmUH2lsNPMXZSy
 wLLFLW0U57+opYH8T6JJZCsJzoKa4Gh4KR5WpyhQEkCGCA9RdnjjqHpAM9RV5tRh8bBQ
 a1nDwGj4r15rcUM7UPzkWTGjL5QLqpUix5tLL97/gbEBawKRgDz6c2sOz4ikybd3Kz/p
 21zQ==
X-Gm-Message-State: AOAM532ZTj/INDwUMTRb8HfV3oR7CqnagrMMBupA9PfZIYvpeDgZaVl3
 s6CRWJSbOZK1i736ax4JD5Q=
X-Google-Smtp-Source: ABdhPJxj6ob2ZpfsVy9xfdI99KTdNW8a1qGjYI7I2upgWYUEMQtqA6qVYw3yibmKLLl8AKLPxR4CHQ==
X-Received: by 2002:a17:903:2451:b0:13e:f1ef:d819 with SMTP id
 l17-20020a170903245100b0013ef1efd819mr25566918pls.85.1633974333299; 
 Mon, 11 Oct 2021 10:45:33 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 k22sm8395232pfi.149.2021.10.11.10.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:45:32 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 03/22] PCI: thunder: Use SET_PCI_ERROR_RESPONSE() when device
 not found
Date: Mon, 11 Oct 2021 23:15:10 +0530
Message-Id: <c5f9e140106cd6a38026300a4e5e5e6ad9257fb3.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Robert Richter <rric@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/pci-thunder-ecam.c | 20 ++++++++++----------
 drivers/pci/controller/pci-thunder-pem.c  |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pci-thunder-ecam.c b/drivers/pci/controller/pci-thunder-ecam.c
index ffd84656544f..4c57ad2aa9aa 100644
--- a/drivers/pci/controller/pci-thunder-ecam.c
+++ b/drivers/pci/controller/pci-thunder-ecam.c
@@ -42,7 +42,7 @@ static int handle_ea_bar(u32 e0, int bar, struct pci_bus *bus,
 	if (where_a == 0x4) {
 		addr = bus->ops->map_bus(bus, devfn, bar); /* BAR 0 */
 		if (!addr) {
-			*val = ~0;
+			SET_PCI_ERROR_RESPONSE(val);
 			return PCIBIOS_DEVICE_NOT_FOUND;
 		}
 		v = readl(addr);
@@ -57,7 +57,7 @@ static int handle_ea_bar(u32 e0, int bar, struct pci_bus *bus,
 
 		addr = bus->ops->map_bus(bus, devfn, bar); /* BAR 0 */
 		if (!addr) {
-			*val = ~0;
+			SET_PCI_ERROR_RESPONSE(val);
 			return PCIBIOS_DEVICE_NOT_FOUND;
 		}
 		barl_orig = readl(addr + 0);
@@ -73,7 +73,7 @@ static int handle_ea_bar(u32 e0, int bar, struct pci_bus *bus,
 	if (where_a == 0xc) {
 		addr = bus->ops->map_bus(bus, devfn, bar + 4); /* BAR 1 */
 		if (!addr) {
-			*val = ~0;
+			SET_PCI_ERROR_RESPONSE(val);
 			return PCIBIOS_DEVICE_NOT_FOUND;
 		}
 		v = readl(addr); /* EA entry-3. Base-H */
@@ -105,7 +105,7 @@ static int thunder_ecam_p2_config_read(struct pci_bus *bus, unsigned int devfn,
 
 	addr = bus->ops->map_bus(bus, devfn, where_a);
 	if (!addr) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
@@ -136,7 +136,7 @@ static int thunder_ecam_config_read(struct pci_bus *bus, unsigned int devfn,
 
 	addr = bus->ops->map_bus(bus, devfn, 0xc);
 	if (!addr) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
@@ -147,7 +147,7 @@ static int thunder_ecam_config_read(struct pci_bus *bus, unsigned int devfn,
 
 	addr = bus->ops->map_bus(bus, devfn, 8);
 	if (!addr) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
@@ -177,7 +177,7 @@ static int thunder_ecam_config_read(struct pci_bus *bus, unsigned int devfn,
 
 	addr = bus->ops->map_bus(bus, devfn, 0);
 	if (!addr) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
@@ -197,7 +197,7 @@ static int thunder_ecam_config_read(struct pci_bus *bus, unsigned int devfn,
 
 		addr = bus->ops->map_bus(bus, devfn, 0x70);
 		if (!addr) {
-			*val = ~0;
+			SET_PCI_ERROR_RESPONSE(val);
 			return PCIBIOS_DEVICE_NOT_FOUND;
 		}
 		/* E_CAP */
@@ -212,7 +212,7 @@ static int thunder_ecam_config_read(struct pci_bus *bus, unsigned int devfn,
 		if (where_a == 0xb0) {
 			addr = bus->ops->map_bus(bus, devfn, where_a);
 			if (!addr) {
-				*val = ~0;
+				SET_PCI_ERROR_RESPONSE(val);
 				return PCIBIOS_DEVICE_NOT_FOUND;
 			}
 			v = readl(addr);
@@ -269,7 +269,7 @@ static int thunder_ecam_config_read(struct pci_bus *bus, unsigned int devfn,
 		if (where_a == 0x70) {
 			addr = bus->ops->map_bus(bus, devfn, where_a);
 			if (!addr) {
-				*val = ~0;
+				SET_PCI_ERROR_RESPONSE(val);
 				return PCIBIOS_DEVICE_NOT_FOUND;
 			}
 			v = readl(addr);
diff --git a/drivers/pci/controller/pci-thunder-pem.c b/drivers/pci/controller/pci-thunder-pem.c
index 0660b9da204f..a463a1b61f23 100644
--- a/drivers/pci/controller/pci-thunder-pem.c
+++ b/drivers/pci/controller/pci-thunder-pem.c
@@ -42,7 +42,7 @@ static int thunder_pem_bridge_read(struct pci_bus *bus, unsigned int devfn,
 	struct thunder_pem_pci *pem_pci = (struct thunder_pem_pci *)cfg->priv;
 
 	if (devfn != 0 || where >= 2048) {
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
