Return-Path: <SRS0=dZTT=OZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B51C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Oct 2021 17:20:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D120D61502
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Oct 2021 17:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D120D61502
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE46880FFE;
	Tue,  5 Oct 2021 17:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWDsnvSGXeak; Tue,  5 Oct 2021 17:20:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E2E48808B0;
	Tue,  5 Oct 2021 17:20:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0BCCC000F;
	Tue,  5 Oct 2021 17:20:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A45D8C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 944F3404CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:20:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LG8W4KIOOpJx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:20:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7AD440862
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:20:06 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id b22so2785075pls.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Oct 2021 10:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0szOl/Q5keJYQjPtxy9YApfb7ftHWXnTXQ4eoRdC7oM=;
 b=EqpIK1vTXdHM2T3qpKt7B5M72W9yNHp47Ooa5AzhsBqv/LSEr3GylhgEQKGtBbz8aF
 ISkGnHZ77zRoof4FGCAdApmHRV4hxmhkzizSs9NOl/xyHgjEVdTwam86QBgOsUuIcb+J
 MRHmgyoMWSbW56wDErgWeTtD9EB7ErJcD/LDcXR+l+fKPPqx6LUqgKtZ1BGRPPxEfttB
 kQrD7xtiMRRpIOJPGyXtAAcyb0Dvj+ucWvAf6Q9eOTvEiUobNqdLsz4r2NvwflOVZ198
 NleQppPNm4L6lTW5T4nON1Qwp7V7Q6OaU8CaF6s1ggbc5qjIvX2Jv1y2Vhsnc9PenK3Y
 6EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0szOl/Q5keJYQjPtxy9YApfb7ftHWXnTXQ4eoRdC7oM=;
 b=vMglKUj/egKPTCvRR0S02SaGbtPe3utL3HWdMpkrw6BPPSb17X2rbZKw5NUXBf89v4
 s7z1WsKK6FJrrWVVgIEdFUQDZYPnYu0hVC+WwYS21ZA1RM4tf6xqRx2PeO5wVctz0lbc
 5fdE8fXTP0WZ/wno1u37vUyPimATc5/AtDH31R6reDzjvZvsfz//v2EyuskLgp9IQW0M
 Uaglgb8Xhf12PCtp45AIrwa8GdwfIDRNIt+6T7CrBx5JMDE2QTqzzmoj+q6517ivnWlL
 hMIOIIPqNm3piya92j0E+fyUFqzaxtRgbaZxpRT9m/4D8msyDdgyCa6S16ym9BAko4Xt
 6USA==
X-Gm-Message-State: AOAM5301mcVqOrUMvwL04lG+Bjci1WmhAOhuyRXkIcftOqWz2UHMZ5LY
 wO5L6GiDFGxJ7o8qIwAwzZ0=
X-Google-Smtp-Source: ABdhPJzQlgbJ2vipxR8pOXATO00s5SdfAkVzILUymzDybhDIw7JfAUJP3lpRvmIhgSc/zwSufi+TBw==
X-Received: by 2002:a17:90a:19d2:: with SMTP id
 18mr5145011pjj.27.1633454406293; 
 Tue, 05 Oct 2021 10:20:06 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:f69:1127:b4ce:ef67:b718])
 by smtp.gmail.com with ESMTPSA id
 f25sm18476722pge.7.2021.10.05.10.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:20:05 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v4 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
Date: Tue,  5 Oct 2021 22:48:10 +0530
Message-Id: <5ebe87f18339d7567c1d91203e7c5d31f4e65c52.1633453452.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633453452.git.naveennaidu479@gmail.com>
References: <cover.1633453452.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
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

In the dpc_process_error() path, info->id isn't initialized before being
passed to aer_print_error(). In the corresponding AER path, it is
initialized in aer_isr_one_error().

The error message shown during Coverity Scan is:

  Coverity #1461602
  CID 1461602 (#1 of 1): Uninitialized scalar variable (UNINIT)
  8. uninit_use_in_call: Using uninitialized value info.id when calling aer_print_error.

Initialize the "info->id" before passing it to aer_print_error()

Fixes: 8aefa9b0d910 ("PCI/DPC: Print AER status in DPC event handling")
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index c556e7beafe3..df3f3a10f8bc 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -262,14 +262,14 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 
 void dpc_process_error(struct pci_dev *pdev)
 {
-	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
+	u16 cap = pdev->dpc_cap, status, reason, ext_reason;
 	struct aer_err_info info;
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
-	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
+	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &info.id);
 
 	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
-		 status, source);
+		 status, info.id);
 
 	reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
 	ext_reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT) >> 5;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
