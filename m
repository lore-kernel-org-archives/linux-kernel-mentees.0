Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87403C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:11:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D4CE60F57
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D4CE60F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ACBE83B61;
	Thu, 21 Oct 2021 15:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TF5zw4JKSWfv; Thu, 21 Oct 2021 15:11:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 49E8183AFB;
	Thu, 21 Oct 2021 15:11:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DC56C001C;
	Thu, 21 Oct 2021 15:11:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4E2DC0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86E5460F0C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WRZpNHSYnBKd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:11:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7EE460628
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:11:55 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id 187so900896pfc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3zEq2AfHmzmiP6iMn6OVsjvfYEnKpi8akIlRzP+t4I8=;
 b=pX96mXwiXPeCcU/ZLXG+82KZ6X1WwZf7RX3Kw1oTJXJycww++ljoclt7YyZKGpMDD+
 5l7uHnUBBtAH9GLNcQIhXR7I/ykoIVERhA0RlU5kuEWYgPTonPpKkAEhltbqXzkLMfnA
 rYYVpWcaqQQQtDXee/oBhUP9Gu6Ht6SlR6A9LzEh4O/+QIMrqFdUz0hY1NGJguRPysU6
 4DLYEssZQTX1tZuyhgkcVMlLKa3vx39CbBG/mb+9U8PJuwX8QNXI1nFrl/1UXWIWiELP
 b6KgYX+FV0mh5PcY7vBfUmlJ8cv4vrqjyLIIyaPLyEKOJvTTbLQAfPNoHGbINcyC30n+
 uklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3zEq2AfHmzmiP6iMn6OVsjvfYEnKpi8akIlRzP+t4I8=;
 b=N7ig3f/E8iUeaKG+TS5bbRBxKgpyBK+sHtNhEFgTeG2l4xkVuosVGV8vor7OVyJnVD
 TiBHJJtpyKw0aJbInxnXkL8aCGErk0oGZ5J50Z2/raCV6DFqo3FHqUQf1uofwtwaVsmh
 OA1bRSopxFLmHavW3PcyyHp2APfED4G9iYnmrwi1VxcsHc393cZ9X6Xy4uzLRt/ug4xa
 LetCVFaPgI8XAKManqCO6mbq6xIffleDoYFb7Yb2ZdJI9yTok+vbLt9Zc4cDkpvNaLFC
 5qMJeRxT4w0ZWEs+FdgNpVeEk+JmJoZKEnP3r1BCppf5766XEO0QWYbviUwo983bakj3
 8JMQ==
X-Gm-Message-State: AOAM530kuR85TfSSrq7EkJ+YOZCDcoIibVaPTaDowuVHpqT2qY5rL6EX
 lqSc8iQw2rLi1A4DqYMzEOE=
X-Google-Smtp-Source: ABdhPJyOLoEwlKV3KvkQhGAg1lxKYQIxIPxhV0ueMTAUdFskUAKjBG6cDkUpWJ/2X1ITIVPBwFiEJQ==
X-Received: by 2002:aa7:9099:0:b0:44c:a3b5:ca52 with SMTP id
 i25-20020aa79099000000b0044ca3b5ca52mr6578798pfa.85.1634829115365; 
 Thu, 21 Oct 2021 08:11:55 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:11:54 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 11/25] PCI: aardvark: Remove redundant error fabrication
 when device read fails
Date: Thu, 21 Oct 2021 20:37:36 +0530
Message-Id: <cbf7437d33551cd267135d2ed2a33bb789369e85.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
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
