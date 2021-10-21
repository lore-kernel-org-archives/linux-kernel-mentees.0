Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776F5C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:14:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 339D7611BD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 339D7611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F09D4072A;
	Thu, 21 Oct 2021 15:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tD0GTb_QKbHS; Thu, 21 Oct 2021 15:14:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 14E3740017;
	Thu, 21 Oct 2021 15:14:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 005A6C001C;
	Thu, 21 Oct 2021 15:14:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC806C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA0684072A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJPVy2VDb6-7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:14:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2575A40017
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:14:36 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id np13so725400pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+grG83XrHCBepZfPJFFdEnHFlsALdbCTTo16jghra4=;
 b=k2YxjrVdUyT6a9mQTulZsMADoQNPR0aEjOM2l8Nefwzj49jPdG7PMzP+Djh8LqMPFS
 4Y2D2rFclGUV/Yw4tW0DjmZCSvgkJTLH4cuR8qs/PGV0deaffN5woFOBylwqPkmPsMCi
 zw1Jiea3qvbGASUN6gUlEQ515asnyGh/rm+avjBYvDqUuFb0JYuQd0wm+uGnCVfWeOpm
 xFivKrxIhLrpwsicd8PBEp0H/k5YuJjPgU9JViFGvoz5Ai8nR2phWXKKrlGFJ0GVLnFD
 bMs566lmMTB3Jc5PWDcpV9O2tbmSY3+jcAc6mMiJ3NJQSnrqjM2GBaRlfH8GQpFIxkNo
 j+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+grG83XrHCBepZfPJFFdEnHFlsALdbCTTo16jghra4=;
 b=8FrynfmxSK7AtAr7g2tDNnZIJjDNusUHkQOcVmBtq+FjlzyrDq4BDmOUg+m+xk1gOw
 Zfi4rPw8rPprJwuBTg1O+lVeMOpVdcG9s6/aMFdAnZu5qvssYaTwSg/bxa8Yj/zCOHqP
 4q9zz0fXuo9+pNiaeFi+N86JGcYVJIaWA0DI2tF8x5ADcM2vsMPnJER06hslmNuEHSUc
 zHBLMwihcQAXu2PbKHBa5z4au2knjg+polLf0Znaj15qLCV+2iM7o+AWZH8Ejzt5LV67
 9hQs+3APAdEhCrfq+mUYil8CZvqCT/2UGwuR4i95jLP1rigcoCGVN4h2iBb880p1/VlJ
 LShQ==
X-Gm-Message-State: AOAM532cUj1L1k7/7w/bA7zJKnWruWJw3ArN6VnTJt+mpaZOP5EG87Tx
 vVYQsRzFDKZWfgaXJ7vWmLk=
X-Google-Smtp-Source: ABdhPJzAnJbpgVe2j8+IaDzkyiZYmscRfLlNZfOxZxm73HJbbJg8/yRu1BEritTBQ0SQnOcbuVcIsw==
X-Received: by 2002:a17:90a:600d:: with SMTP id
 y13mr7405347pji.84.1634829275558; 
 Thu, 21 Oct 2021 08:14:35 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:14:35 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 22/25] PCI: Use PCI_ERROR_RESPONSE to specify hardware error
Date: Thu, 21 Oct 2021 20:37:47 +0530
Message-Id: <eac42e773a543a866f0b675195576307141f6a7b.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
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
index 2705a4412e69..baff68916f17 100644
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
