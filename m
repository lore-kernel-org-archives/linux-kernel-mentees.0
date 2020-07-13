Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D550C4346D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B099207F9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhqR5FlS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B099207F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4C89F876E9;
	Mon, 13 Jul 2020 13:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeJ7X33y2GjX; Mon, 13 Jul 2020 13:23:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DE0C8876C3;
	Mon, 13 Jul 2020 13:23:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD2A4C0888;
	Mon, 13 Jul 2020 13:23:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F700C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1F4B6876C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AzRylk44iEFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 61F5D876E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:12 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id l12so17130481ejn.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=a4qclUpgkVLODkm3qmb6k0l4x97EWCpj9W69r9J7+M4=;
 b=qhqR5FlSBoF6xGgJ9myL6BEHj3SWp6zu5kQf3Ik4Rr69Vd1gY84Qi4wolwrTt0qgYW
 plapG8w+tVKsouDRp8WFKqpLN6+pXFT173QI0rIgfIm6txt4X73hrtNVlJqsil9mcPHZ
 NQXZcfqCsCGOxQtxhIsBMR/rdNPGE7633fXpVIxFTIrj51dp+3llmstY0ZDnzbZSNE8X
 gWVRu/J5Iyotd+NeBiu+FhV1zTqL09iLZivT8tlxugX9yFAWU/fipl6u5iIi6ocyCcBT
 u+aNZEHAH7qCFKogHZPz0pjyycFT3CC6gU4Ows7yZIUpmdHa6u4qBDHFpopfJgiPZW7d
 5Mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=a4qclUpgkVLODkm3qmb6k0l4x97EWCpj9W69r9J7+M4=;
 b=jEZXCsott40KsrDHIf6vZo9T1AEEyf07jK9FhiAIL29DJ3YfQfizVhXfq36HsGaK/c
 9X4bIQOIy/VYlLr2JP2sG+7oVwsI6FUfwbi8dDZkutLhHmcnB0Zgt5dR/HGC1vduarRV
 7pM4rLsm0yC9LLRGOIUqS8aLx6ZaH2wbFheYQqBOZVGF73wZQWQTGOcXTf+971bRyryd
 4iaticjDiUGJpoq5+4nS0EXGFngQk8XdAeBQbCsCYpMqQWvD56P/7A7tU2gLTA6l3UOL
 r4plkqlkPHzLgOyluZTaBsN5ujsK7jIi17AmAPbBwX1BtP+Ps1hN8hqtt+fL1BhbI6FP
 1i4A==
X-Gm-Message-State: AOAM532HTREV6SEg7cxqLfnz/2X6SEe8OrIDvnx858G9iY2a9A9/pcxn
 DCq6SGuy4QaRti4qgsKhEzk=
X-Google-Smtp-Source: ABdhPJwhwgHzEzV8y9RxY4MQVGO6CwCxft/SH/sDeVCsCsqstTlIeftQpN2hNpcjN9TS7Mn+dSK4Eg==
X-Received: by 2002:a17:906:2b52:: with SMTP id
 b18mr75602949ejg.158.1594646590832; 
 Mon, 13 Jul 2020 06:23:10 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:10 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>
Date: Mon, 13 Jul 2020 14:22:37 +0200
Message-Id: <20200713122247.10985-26-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: linux-sh@vger.kernel.org, "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 25/35] sh: Tidy Success/Failure
	checks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Remove unnecessary check for 0.

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
This patch depends on PATCH 24/35

 arch/sh/drivers/pci/common.c     | 3 +--
 arch/sh/drivers/pci/ops-sh7786.c | 4 ++--
 arch/sh/drivers/pci/pci.c        | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/sh/drivers/pci/common.c b/arch/sh/drivers/pci/common.c
index ee27cdfd3e68..676907e6a514 100644
--- a/arch/sh/drivers/pci/common.c
+++ b/arch/sh/drivers/pci/common.c
@@ -60,8 +60,7 @@ int __init pci_is_66mhz_capable(struct pci_channel *hose,
 		if (PCI_FUNC(pci_devfn))
 			continue;
 		if (early_read_config_word(hose, top_bus, current_bus,
-					   pci_devfn, PCI_VENDOR_ID, &vid) !=
-		    0)
+					   pci_devfn, PCI_VENDOR_ID, &vid))
 			continue;
 		if (vid == 0xffff)
 			continue;
diff --git a/arch/sh/drivers/pci/ops-sh7786.c b/arch/sh/drivers/pci/ops-sh7786.c
index 7c329e467360..c1be0ac2508a 100644
--- a/arch/sh/drivers/pci/ops-sh7786.c
+++ b/arch/sh/drivers/pci/ops-sh7786.c
@@ -101,7 +101,7 @@ static int sh7786_pcie_read(struct pci_bus *bus, unsigned int devfn,
 	raw_spin_lock_irqsave(&pci_config_lock, flags);
 	ret = sh7786_pcie_config_access(PCI_ACCESS_READ, bus,
 					devfn, where, &data);
-	if (ret != 0) {
+	if (ret) {
 		*val = 0xffffffff;
 		goto out;
 	}
@@ -137,7 +137,7 @@ static int sh7786_pcie_write(struct pci_bus *bus, unsigned int devfn,
 	raw_spin_lock_irqsave(&pci_config_lock, flags);
 	ret = sh7786_pcie_config_access(PCI_ACCESS_READ, bus,
 					devfn, where, &data);
-	if (ret != 0)
+	if (ret)
 		goto out;
 
 	dev_dbg(&bus->dev, "pcie-config-write: bus=%3d devfn=0x%04x "
diff --git a/arch/sh/drivers/pci/pci.c b/arch/sh/drivers/pci/pci.c
index 77130f035fdd..19e9a211c23e 100644
--- a/arch/sh/drivers/pci/pci.c
+++ b/arch/sh/drivers/pci/pci.c
@@ -204,7 +204,7 @@ pcibios_bus_report_status_early(struct pci_channel *hose,
 			continue;
 		ret = early_read_config_word(hose, top_bus, current_bus,
 					     pci_devfn, PCI_STATUS, &status);
-		if (ret != 0)
+		if (ret)
 			continue;
 		if (status == 0xffff)
 			continue;
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
