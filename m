Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9D7C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:05:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64F4360EFD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64F4360EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D4A740195;
	Thu, 18 Nov 2021 14:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54JmW0xi9nQX; Thu, 18 Nov 2021 14:05:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D59D9400E1;
	Thu, 18 Nov 2021 14:05:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B33FAC001E;
	Thu, 18 Nov 2021 14:05:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6ADEEC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D3D681776
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yM9U18So0iZl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:05:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A14CE81774
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:05:33 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so6739198pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 06:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/1DR3OOSzZuxfUtlUJMZJiGVE0NaIRWqbUvxoOW0jlM=;
 b=jdSkECp3SP2RSmPMNet1SnMVaDyeo8yKkV5XHhVCvBhepg39GB2PfKzHjI+JTCDOEd
 guMiR3Jz/cAYlAQZmKlQjSrTuQ9GsLk6ntRuvGW+LNSHWj9DGA+EH+dJZwkDmB0upCqa
 KoQ/F8hvOOqHkXQTqf7ey2jAwYO4YZd1QWmdlxXb+nJgU7oLMjbGVJrms2xRStItbWqS
 3wrwCSjD6xcmyik3lX3vTdmKuYBwqZTqmuUIFJqS/pM6qeS+PreJLe/cVu0HL1hF2qdh
 Ys5BoxlLTUTsYytDVQhE6LH5h/6F+1Qme6HtPpolIQAk3KfkWJr7PuZ8rVhw5aitmm7D
 3+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/1DR3OOSzZuxfUtlUJMZJiGVE0NaIRWqbUvxoOW0jlM=;
 b=K4On5JFNmGYN5GURHZXVikF60MYwI8xy6R4lCljGa8JJSd+4fwuL3tX8vyaaM5MAsD
 5rHFQ8ZXCVg7LWeJdw/KrtC2vSdzPEo/rt9gTDc0fL2vUTnbQ9OBRKUmc9VKWMj+P8Ki
 /K1+/PdTEM6S9zdDT8zIe6cw7+ojDWtodpdkxSyBGLScw5zUNvLrBG1OCsR5TFmF/LXA
 k+jknhTSZS7jkXTsIumXR0xRMbCmM7D0aV3PQkEfKYF7rfT0Ik0LzvD5y4cV/1rc3azR
 52LQvADa7xEjAbn57AnUhjcfN1WlI9B7D0mtYeQ1rUM96d4SK7D1PYiu2b0AUD61IPyT
 9Rdw==
X-Gm-Message-State: AOAM533If7QCud+ZhbR54qDAUiJpKaCGnybMlzAPZnpjwkYsXm3Bm0rZ
 hxddHc6MW4Jr/4ih44b4PgU=
X-Google-Smtp-Source: ABdhPJylY1j0PXT0hDdZWfRI0y02595GqGzG4pRAVnMOmOXr655gaWX9MhLwp3Tgo0soIDQbH4IMtQ==
X-Received: by 2002:a17:902:9303:b0:143:d6c7:babc with SMTP id
 bc3-20020a170902930300b00143d6c7babcmr21577067plb.58.1637244333020; 
 Thu, 18 Nov 2021 06:05:33 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:05:32 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 05/25] PCI: thunder: Remove redundant error fabrication
 when device read fails
Date: Thu, 18 Nov 2021 19:33:15 +0530
Message-Id: <22f471b638276422926c49f3d42ac41bc7b28b3d.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
References: <cover.1637243717.git.naveennaidu479@gmail.com>
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
index e9d5ca245f5e..b5bd10a62adb 100644
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
