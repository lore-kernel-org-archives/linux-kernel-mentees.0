Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D42C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:09:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE90361B64
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE90361B64
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADD676087F;
	Thu, 18 Nov 2021 14:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSlfUMPgRPF2; Thu, 18 Nov 2021 14:09:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D2FF960761;
	Thu, 18 Nov 2021 14:09:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3997C001E;
	Thu, 18 Nov 2021 14:09:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADD66C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F78580DF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OBSxIq3ucxKC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:09:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EB6480DDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:09:26 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id 8so6132243pfo.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 06:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tG2Z+jbkFRvw9IYmwc/ViuisLBeS5zDki/9SkrDHf8E=;
 b=ct9yZCQ5VcjePNT24JBl3ImNLFFun3txYvUKafBcydv3zyDa84ktDQQ2ia5k5KpeTh
 ZCiBhggoB3y63rJJWsK7gP5v3mWIppoyd5nlThMhVLLb5G1yepYQzzADNR1syEQmbRF1
 aVQOrkLI6jAFp0gOkI7OSKbiETUZQKqjsa2zSV+rs1FZPT4NX/FRyP8l1/vFf5yQOlAs
 miQDTNz718Gy4ghr1f5tRjgNbOfzvbqPP8We2aXm8L9IEQ94OdoHFktgneA9JR4AjMNe
 j1oP9Oj7+1ZpkRLNqDviue/No0zniTPSayURrAOCqFlioIeUkbb6kw63FgODNF5u71w1
 K1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tG2Z+jbkFRvw9IYmwc/ViuisLBeS5zDki/9SkrDHf8E=;
 b=qnmf0X72YLcfFu7tpQQQEFGSVW38FES8E+htmO+jTBkdhODIViXn950MHoqXagJbt9
 uVLNhGlqf9ouW3sT/TaeqHiJbkx+9P9JXg+/spOiuDqYuthu4ubXkIm7tYqYvmcqV8Fj
 4Ze23nbHIIpExDJmYs4blNW02qzXD/KE7F4Dxp3SK59j51J9Fg3RSjg7q/TgWXCBt5g+
 kgrdbJAB+TqE1A+pW1Yc7ZhUV5PsEEb1oN5gCswguEHWzOSiyGRnj52wjJbkHsmvt+Qx
 ns+VOMzCpZmSwEVWS23DYSlSaMoxbijfPWMUmWuTDusQCD44hIJhGON0b0010D48lHca
 NbwQ==
X-Gm-Message-State: AOAM530yJqEjrFwEaB4v8wJtANMCRW1CZY/TdwKKLH2G/FeukgxidkU7
 7cVYQnk+Q8D40WPpvq8HACE=
X-Google-Smtp-Source: ABdhPJw11oe0nh0XBOBBqnfa0shN0dahRuIrHjoMwAfFlkTwGFIRQ/teuzpWXSmFw87mZvdJ6FFqhw==
X-Received: by 2002:a63:7d01:: with SMTP id y1mr11455196pgc.343.1637244566532; 
 Thu, 18 Nov 2021 06:09:26 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:09:26 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 22/25] PCI: Use PCI_ERROR_RESPONSE to specify hardware error
Date: Thu, 18 Nov 2021 19:33:32 +0530
Message-Id: <866e2db544df45af70df7e64659bf02e03998ae3.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
References: <cover.1637243717.git.naveennaidu479@gmail.com>
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

Include PCI_ERROR_RESPONSE along with 0xFFFF and 0xFFFFFFFF in the
comment to specify a hardware error. This makes MMIO read errors
easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/access.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index a92637627845..a07b76761d74 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -413,8 +413,8 @@ int pcie_capability_read_word(struct pci_dev *dev, int pos, u16 *val)
 		ret = pci_read_config_word(dev, pci_pcie_cap(dev) + pos, val);
 		/*
 		 * Reset *val to 0 if pci_read_config_word() fails, it may
-		 * have been written as 0xFFFF if hardware error happens
-		 * during pci_read_config_word().
+		 * have been written as 0xFFFF (PCI_ERROR_RESPONSE) if hardware error
+		 * happens during pci_read_config_word().
 		 */
 		if (ret)
 			*val = 0;
@@ -448,8 +448,8 @@ int pcie_capability_read_dword(struct pci_dev *dev, int pos, u32 *val)
 		ret = pci_read_config_dword(dev, pci_pcie_cap(dev) + pos, val);
 		/*
 		 * Reset *val to 0 if pci_read_config_dword() fails, it may
-		 * have been written as 0xFFFFFFFF if hardware error happens
-		 * during pci_read_config_dword().
+		 * have been written as 0xFFFFFFFF (PCI_ERROR_RESPONSE) if hardware
+		 * error happens during pci_read_config_dword().
 		 */
 		if (ret)
 			*val = 0;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
