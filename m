Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8B2C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 17:39:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F254860E78
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 17:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F254860E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C75AA40281;
	Mon, 11 Oct 2021 17:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSwBp9tE5CJu; Mon, 11 Oct 2021 17:39:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CF64540211;
	Mon, 11 Oct 2021 17:39:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF8FFC000F;
	Mon, 11 Oct 2021 17:39:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E44AC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DBA5605D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EN-cEMBqMGeA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:39:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 666FF600C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:39:00 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so506923pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 10:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uG5YGH1HQhNqI6Rs9B6rHyRWKh0Ji0hRKGqWlkWjVmw=;
 b=ZTMkXOs4RrOGSszqIfzgTMk40on6vGxBESpWNkSlxPsTuOrMYLrvfRIOBcjzBYwjBF
 aEWCeQto/K909hUQpon72h6xYWPfgfQnh8n738ZsmlTUjbVGzakQkeevSVhF/zWXEDQY
 Daw/NL19GwHuG5WCyhdmciQcFgh7ldoE/QHbDRP9mC5l5Cb6LnQI9fAcDrlJri5664CC
 s/PqtGapp06/k2acCLHkBF/k02bb+uWDc9S9o1pWMlSbOZkXWWdZ4A21Lyz6cxXUbIeo
 NCGxaPdtidgdRPEL4rm5ZtbD2TdiBi73ulmPim/QXXhqKaYtMU2skRz9S9HcEKQVCcl3
 0oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uG5YGH1HQhNqI6Rs9B6rHyRWKh0Ji0hRKGqWlkWjVmw=;
 b=7eo4trf+fMDJYXybMscAgP/MvIXit4lUrk+YB+hK3RbZosrjg8qYKdXSJxRGMbx6Y+
 1bA7XSF4G77hCTQzW26dxkkFQJmSqq4QrXCND/FPK0/byaGMDKGlTrMRlYOqM65zGbnE
 TnnwCLFnXEMZQvFKiHP4B3HffgIGPOefq4XXl4Ti2dUI50+jLtIpbu3BwCJjanWxWDDz
 HfZdAyZp3ylu8h8wjg00gWcQN2GiJd09OcgMfp3NDKnYDlkW0o/b4Wz+4IEOuFqdE7ll
 sEMzmsoK1X7il2BQCsQ+mR+EwDNX+62o3g6F3XYWKU70qN91YUty7txBAdm1ZzEE8o8p
 Vrdw==
X-Gm-Message-State: AOAM532zDP6rhT3HagRt1T8hHShr+AGpPHubugEZbLT8F7JpD0rBUUWV
 mKrdzc1Qln6hYkhmZKRyUIE=
X-Google-Smtp-Source: ABdhPJxKbI/iqEe2pHkz+/Uc7eaiYQWFEaZEu4mQ1/aniGv566n8kDeeJO20tnAmbtimzV8JFOvZRA==
X-Received: by 2002:a17:90a:190:: with SMTP id 16mr379232pjc.152.1633973939735; 
 Mon, 11 Oct 2021 10:38:59 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 b23sm8804907pgn.83.2021.10.11.10.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:38:59 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 02/22] PCI: Unify PCI error response checking
Date: Mon, 11 Oct 2021 23:08:32 +0530
Message-Id: <c632b07eb1b08cc7d4346455a55641436a379abd.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
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

Use SET_PCI_ERROR_RESPONSE() to set the error response and
RESPONSE_IS_PCI_ERROR() to check the error response during hardware
read.

These definitions make error checks consistent and easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/access.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index 46935695cfb9..e1954bbbd137 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -81,7 +81,7 @@ int pci_generic_config_read(struct pci_bus *bus, unsigned int devfn,
 
 	addr = bus->ops->map_bus(bus, devfn, where);
 	if (!addr) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
@@ -123,7 +123,7 @@ int pci_generic_config_read32(struct pci_bus *bus, unsigned int devfn,
 
 	addr = bus->ops->map_bus(bus, devfn, where & ~0x3);
 	if (!addr) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
@@ -411,10 +411,10 @@ int pcie_capability_read_word(struct pci_dev *dev, int pos, u16 *val)
 		ret = pci_read_config_word(dev, pci_pcie_cap(dev) + pos, val);
 		/*
 		 * Reset *val to 0 if pci_read_config_word() fails, it may
-		 * have been written as 0xFFFF if hardware error happens
-		 * during pci_read_config_word().
+		 * have been written as 0xFFFF (PCI_ERROR_RESPONSE) if hardware error
+		 * happens during pci_read_config_word().
 		 */
-		if (ret)
+		if (RESPONSE_IS_PCI_ERROR(val))
 			*val = 0;
 		return ret;
 	}
@@ -446,10 +446,10 @@ int pcie_capability_read_dword(struct pci_dev *dev, int pos, u32 *val)
 		ret = pci_read_config_dword(dev, pci_pcie_cap(dev) + pos, val);
 		/*
 		 * Reset *val to 0 if pci_read_config_dword() fails, it may
-		 * have been written as 0xFFFFFFFF if hardware error happens
-		 * during pci_read_config_dword().
+		 * have been written as 0xFFFFFFFF (PCI_ERROR_RESPONSE) if hardware
+		 * error happens during pci_read_config_dword().
 		 */
-		if (ret)
+		if (RESPONSE_IS_PCI_ERROR(val))
 			*val = 0;
 		return ret;
 	}
@@ -523,7 +523,7 @@ EXPORT_SYMBOL(pcie_capability_clear_and_set_dword);
 int pci_read_config_byte(const struct pci_dev *dev, int where, u8 *val)
 {
 	if (pci_dev_is_disconnected(dev)) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 	return pci_bus_read_config_byte(dev->bus, dev->devfn, where, val);
@@ -533,7 +533,7 @@ EXPORT_SYMBOL(pci_read_config_byte);
 int pci_read_config_word(const struct pci_dev *dev, int where, u16 *val)
 {
 	if (pci_dev_is_disconnected(dev)) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 	return pci_bus_read_config_word(dev->bus, dev->devfn, where, val);
@@ -544,7 +544,7 @@ int pci_read_config_dword(const struct pci_dev *dev, int where,
 					u32 *val)
 {
 	if (pci_dev_is_disconnected(dev)) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 	return pci_bus_read_config_dword(dev->bus, dev->devfn, where, val);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
