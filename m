Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C329C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:40:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E18556120D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E18556120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF966401BE;
	Fri, 15 Oct 2021 14:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKNEyRPlmUlc; Fri, 15 Oct 2021 14:40:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 93BD24011B;
	Fri, 15 Oct 2021 14:40:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F176C000F;
	Fri, 15 Oct 2021 14:40:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AECBC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A98B40470
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CmeT_1ckP2O0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:40:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8108640464
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:40:35 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id y7so8525348pfg.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hguH+4h8WJZAQBX6bFk6OLcEE3ensFHbc7yyj62NPUU=;
 b=UZsKQuYMXgZnOPY6/63KM7U41g68pmtEWjrEE4tpt357waPxLydOwrnypYJEaKRGuo
 M42jcPkZuQiKIGmjB3Bf57gNRwXQk5LGwM0w+2D1NHkw8JI1nbuFaA96hEFQJY+3uWAo
 gjALKCDUKhbRgSXCU3D62aG1T45oBE5PivX0G34X+7990sxrTAKReDPSF+IvihVNttLD
 WHKI6bGHVpJ959fLrnmN34o94DpH1P4qnoaYYmhXjlfIRWqiSfJAZ0Z7ERFQHfvDIjE8
 X56PjFySwjbeYg0KiA3GA2t+wI5v71ZRvNbKTE8v/VIofU3hsNTIUkDMvv7yDdBhTjUB
 TCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hguH+4h8WJZAQBX6bFk6OLcEE3ensFHbc7yyj62NPUU=;
 b=tUcEpQnywDSWZsUl4PziDvcuotH0vf4D8xU2NXUZPZM7yS7XUXmd1lulUC4aqiMDOQ
 qJ9kznu7N/9iY28RRnspnScTy75qz8tdp6GqkAvWEDVOCKTXiDnrLujX3OVJaHgo86bJ
 UIzdw87pteVc7tyu6BDogEA9DPjTloVc1L+2MQTZe1F3WLSUrr0elGv6uQBo0unX1LV6
 Q+GZm0QRezXtCGBrAVZUUIMauI48AzQCThrDFdSzkKKrd/c8RnGOdSC0jtCdLZitPrQd
 0bnXWNjl045X7liRSz817RY2ZC/I7K7oiJYV61Vo/lGKLWbe8KUvF6LI1r+jsSdmOuij
 qQ/w==
X-Gm-Message-State: AOAM532nl1vxH/fxmnLxvivDfAvW9ZpZ02VnyOAzr+1PqINLhYL2O46R
 oCBFI6M3snueFLJ64getCi0=
X-Google-Smtp-Source: ABdhPJwCXWgoqc04OqC3Fg9GRl74v/rvPzegKA4beG0/OZmUoAxuGOVBOx/Kgl4WgCs0NKvY8Oqaig==
X-Received: by 2002:a63:cd09:: with SMTP id i9mr9644131pgg.129.1634308834766; 
 Fri, 15 Oct 2021 07:40:34 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:40:34 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 03/24] PCI: Unify PCI error response checking
Date: Fri, 15 Oct 2021 20:08:44 +0530
Message-Id: <da939a6cdb2dea96d16392ae152e1232212877d1.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
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
 drivers/pci/access.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index b3b2006ed1d2..03712866c818 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -417,10 +417,10 @@ int pcie_capability_read_word(struct pci_dev *dev, int pos, u16 *val)
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
@@ -452,10 +452,10 @@ int pcie_capability_read_dword(struct pci_dev *dev, int pos, u32 *val)
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
@@ -529,7 +529,7 @@ EXPORT_SYMBOL(pcie_capability_clear_and_set_dword);
 int pci_read_config_byte(const struct pci_dev *dev, int where, u8 *val)
 {
 	if (pci_dev_is_disconnected(dev)) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 	return pci_bus_read_config_byte(dev->bus, dev->devfn, where, val);
@@ -539,7 +539,7 @@ EXPORT_SYMBOL(pci_read_config_byte);
 int pci_read_config_word(const struct pci_dev *dev, int where, u16 *val)
 {
 	if (pci_dev_is_disconnected(dev)) {
-		*val = ~0;
+		SET_PCI_ERROR_RESPONSE(val);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 	return pci_bus_read_config_word(dev->bus, dev->devfn, where, val);
@@ -550,7 +550,7 @@ int pci_read_config_dword(const struct pci_dev *dev, int where,
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
