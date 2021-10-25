Return-Path: <SRS0=xjH5=PN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF838C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Oct 2021 17:02:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92BA660187
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Oct 2021 17:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92BA660187
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69A8F80F04;
	Mon, 25 Oct 2021 17:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZ_gDvZwW1Va; Mon, 25 Oct 2021 17:02:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9170980EF0;
	Mon, 25 Oct 2021 17:02:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71D08C0019;
	Mon, 25 Oct 2021 17:02:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3174CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13E3880F0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jSIpq-1G0Co
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:02:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B54480F04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:02:22 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id m21so11540766pgu.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 10:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IP7bg1XxqK5dXg//yE9NcJiabkbw2qPuKs1z85ZWNME=;
 b=A406sfTrXh8GMkSFquNuEPUPbjXrxLZbOVCF4bYpKdMv8ShllAqdbJdQb04lVxhhHC
 NKkoeX83bwle+wOS3SOVstoXdO16KEasww9oDGJfCUsjGE+DjaeiNTYWvT74nieEka1N
 K9m4PrHtdH1pmfWFdizj9JYhifV5yhsxqg5B2nEfXZTlzb1FIiswefawc0O2iMM8q21n
 2VdIMqT36zQmkVdUYJLMaFyxVljy8JP/WNfT9KkTRKj1UPdytBECAF68jGLrlBj6FB57
 L5pp6txUxHnZJtWsBWKRJm57CWn0g/mevx9sY+YHInLJ4anBMRAhda4Zyo/IHjmIQ/dr
 23eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IP7bg1XxqK5dXg//yE9NcJiabkbw2qPuKs1z85ZWNME=;
 b=7ZcWHMa6rkDvciFUcTaWk/p2i+D6DHr7L/z5hlWBNCHJN0QVdtWitZ4cnS5L5nyFBY
 YBqlJlj+sADuMgcBVmoegEgs5bXO04tXyE5YRZoCH60wAddPa3swxvvEZRykYvNHtVUg
 cDvxTLKjfQF4tb82S/t+79Q3ci7RMusPd+h6Q0JmDcBe1G4enty9THp5QvSLky6BL7LG
 YSAT14TXgh3rjXKWvLvBwcZlTmCiOIJkERe2q9pHmpbcZ97+uJi4/ktVyJDm4spTrJBd
 LYG/VYaiUCkNRbsd8NV5x2DMT7Yx3+ElgK+1fKwXOsU43/nETnqBHyr4oDGvlGQmgqvQ
 Mihw==
X-Gm-Message-State: AOAM531A5OXwG8nzyCjZppqeAxYbjYhMkeaydjE1tTBXafbW1NHduLeS
 7gTf0kNgW61QmoOUlFC/cNc=
X-Google-Smtp-Source: ABdhPJwVXGCGM66S42ZGCsnkfum3D4CcEQwiQH5P2pomnEuWRSCqLNJFiZU0F8DC/4n6/2A7JXHjoA==
X-Received: by 2002:a63:2a88:: with SMTP id
 q130mr14468449pgq.169.1635181341692; 
 Mon, 25 Oct 2021 10:02:21 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:df8b:7255:8580:2394:764c])
 by smtp.gmail.com with ESMTPSA id
 g18sm5100858pfj.67.2021.10.25.10.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:02:21 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v5 3/5] PCI/DPC: Initialize info.id in dpc_process_error()
Date: Mon, 25 Oct 2021 22:31:02 +0530
Message-Id: <b486768a365ccef665b52fd9a1a2132006ab0f92.1635179600.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635179600.git.naveennaidu479@gmail.com>
References: <cover.1635179600.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Oza Pawandeep <poza@codeaurora.org>, linux-pci@vger.kernel.org,
 Sinan Kaya <okaya@kernel.org>, linux-kernel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

In the dpc_process_error() path, info.id isn't initialized before being
passed to aer_print_error(). In the corresponding AER path, it is
initialized in aer_isr_one_error().

The error message shown during Coverity Scan is:

  Coverity #1461602
  CID 1461602 (#1 of 1): Uninitialized scalar variable (UNINIT)
  8. uninit_use_in_call: Using uninitialized value info.id when calling aer_print_error.

Also Per PCIe r5.0, sec 7.9.15.5, the Source ID is defined only when the
Trigger Reason indicates ERR_NONFATAL or ERR_FATAL. Initialize the
"info.id" based on the trigger reason before passing it to
aer_print_error()

Fixes: 8aefa9b0d910 ("PCI/DPC: Print AER status in DPC event handling")
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index c556e7beafe3..6fa1b1eb4671 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -262,16 +262,24 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 
 void dpc_process_error(struct pci_dev *pdev)
 {
-	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
+	u16 cap = pdev->dpc_cap, status, reason, ext_reason;
 	struct aer_err_info info;
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
-	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
+	reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
+
+	/*
+	 * Per PCIe r5.0, sec 7.9.15.5, the Source ID is defined only when the
+	 * Trigger Reason indicates ERR_NONFATAL or ERR_FATAL.
+	 */
+	if (reason == 1 || reason == 2)
+		pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &info.id);
+	else
+		info.id = 0;
 
 	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
-		 status, source);
+		 status, info.id);
 
-	reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
 	ext_reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT) >> 5;
 	pci_warn(pdev, "%s detected\n",
 		 (reason == 0) ? "unmasked uncorrectable error" :
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
