Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F80CC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:05:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED11A61101
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED11A61101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA63381776;
	Thu, 18 Nov 2021 14:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mMruVNyzRVVV; Thu, 18 Nov 2021 14:05:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E3C1181774;
	Thu, 18 Nov 2021 14:05:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0390C001E;
	Thu, 18 Nov 2021 14:05:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07552C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCFA460767
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HP6g2-sF74Uo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:05:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6376660761
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:05:40 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso5787056pjo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 06:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nZn4SxDZvh+tavMY8+enW7L1nqxNB0bRzV0t3A5PNmg=;
 b=JG5K9Trd1o3s4rrA6V+Ay1LKEJnXRI5kjwDECp3bKxrUj+eDe+iJmCOxM5RXaT7FBj
 wEHlIjohorJgsIIb/ELmE0bh34ntCQCc9Wp6Vmbtq00W4kdPbwQ6n4rCIphJNy7Fju6Q
 4Zpx3SndARG4CvzkOtorq1A1jbfbAR1UKd3x99AELcG7XRA9l2y5lW2KpA3wWXJEJBHb
 OKyIlxB8PqJ9RUWcV89WDhgxB/ptMVQjvisEzBZa7VsepHzxGFkyKJdWXHT6u4GqyuO6
 STb6sTk5n2jjW1HfkB+mxZZlHikXjN73pqTyz7JjsHdJXKPEEuHDwx3tYkTN2fb8yLz3
 Mwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nZn4SxDZvh+tavMY8+enW7L1nqxNB0bRzV0t3A5PNmg=;
 b=GRv0ctKPd771zBR7xDOXyybPgVlda5xqrMPvyjrQIzcctWOgebUb0d09G3J4MXEDj9
 8ZuzNmt82/HOAt7uZDnp8XSD6cl85uuw8OGGB+uXb1Pb9fqAMv+mJRwctiBtBpxemdnn
 lDCumSpU1PGg5D0i3ihv4N0BDLsEexxhESsp5kwVdN+uTXVEUMmLVrc03MBXo4dqiT+q
 ndndAgVXVc05wwFemPM3KwLU91sINTvqr8rr5ZTh5UfgSCeDNPyY/4jk9DwO9e8AKEMP
 yyaNAZg5ijyDdb3TpvXyH6Knd5mI80osKphVwkH2LR01m20u3qoPt9Z3FLcM3ZHkjg2m
 3LDg==
X-Gm-Message-State: AOAM531Z/bc2R64nEqHeEd1eMesgQdRvpgASR+JtKKmLB8lZeje3S7ok
 RCL2lfiT4nHiViC48tX+HJ8=
X-Google-Smtp-Source: ABdhPJz9L+8is2Ip8jLLWfzTNi/us5Q4tilWZCGXKU5MU+FnoFZb+E4/5NFsc5dQ6k9M0TzIAtqBrA==
X-Received: by 2002:a17:90a:d49:: with SMTP id
 9mr11086261pju.115.1637244339812; 
 Thu, 18 Nov 2021 06:05:39 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:05:39 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 06/25] PCI: iproc: Remove redundant error fabrication when
 device read fails
Date: Thu, 18 Nov 2021 19:33:16 +0530
Message-Id: <b95defa3db834789a4207df5d6b0216c8b610524.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
References: <cover.1637243717.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Scott Branden <sbranden@broadcom.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "moderated list:BROADCOM IPROC ARM ARCHITECTURE"
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
 drivers/pci/controller/pcie-iproc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index 36b9d2c46cfa..b3e75bc61ff1 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -659,10 +659,8 @@ static int iproc_pci_raw_config_read32(struct iproc_pcie *pcie,
 	void __iomem *addr;
 
 	addr = iproc_pcie_map_cfg_bus(pcie, 0, devfn, where & ~0x3);
-	if (!addr) {
-		*val = ~0;
+	if (!addr)
 		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
 
 	*val = readl(addr);
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
