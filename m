Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BB4C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D8D2080C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vc2zKFpS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28D8D2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 09DA187051;
	Sat,  1 Aug 2020 12:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOvZBdopwewi; Sat,  1 Aug 2020 12:24:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C0AB8704F;
	Sat,  1 Aug 2020 12:24:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97E01C0050;
	Sat,  1 Aug 2020 12:24:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 072BBC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EBFE687051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEmV_byyI2oy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 241BE87040
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:46 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a14so7153353edx.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9SS/6geyX0ClI4ij6hB9TxwrDh/zKm7zopv5L3r5c8s=;
 b=Vc2zKFpSPflxIgkXb2/9foXDeDygDY7Eh7RBpe+OBhcwG9txlHhUTADSY0zl+WxwY9
 Kfb8ubabl5bXf5t+me8h6LOdOVgNx3RWTh3l9nvD62Hj4C+HVNM0yzL81CZDIgWKuQsM
 1RFCX6qT0RpcjIQnrRuZ+3NoxXgbeGY86tdkUxocr8VnSr4sDLHBSzv4ELIsnoN3tr0L
 hOwCWxwXz+8O/GBTJW2I4CAR3b25+gDsusQFJbca/CnQOa+THu4aXP6LLU9OXqdAxiiZ
 M7CVKh2dwCjyd35SrdHeY97TUAPQMrUxfslEBfgVTDcSjqpTy0I/VAdWHS1thQpVA/Af
 dnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9SS/6geyX0ClI4ij6hB9TxwrDh/zKm7zopv5L3r5c8s=;
 b=Tli1egI+YUJbJyq7FxsrHXRR4mk1i0NSNiO/KDRkMx9svOFVg9kY0OKHhb1zQzZYTB
 Q4H6Klsk/k+qxmChTTnS6PaJv7M/w8+Hxt/WBXCtEUHs6FEfgMab0p6a1R5Sme4ubM6d
 pBISsuNuIIlfoFEgFcivGeoe2401BFafwp30OPUYtBj52gGXzs82+wGTABA6rkJIOHMa
 N45ZfjzUnX8mYf5R5GhY2g+L6n214P9kUF/ERJq9lbJjEfz5JZ+adjaBBeL+0UthHFuH
 3SZp1TfKTt2XiP8VBk6FANrD3wtfuMDsyjUV0BXo3HTWgxbBfPs5dy2OvFFbrjbqB+oi
 GH2A==
X-Gm-Message-State: AOAM531gp548OV/bV+sF0Niyrf1uptVTbscv+uW6EsNbQG5vW2RNu3jc
 McCd+I3FG79sKXTQxvzQpQo=
X-Google-Smtp-Source: ABdhPJxCb6w1gVLD3rEZyWpaLmof4X4XsjraNm+7kSy1/q7MbTUqjWvl5aU3W4jrAAp2UMmQx6JGjA==
X-Received: by 2002:a50:d80c:: with SMTP id o12mr8165291edj.265.1596284684386; 
 Sat, 01 Aug 2020 05:24:44 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:43 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Joerg Roedel <joro@8bytes.org>
Date: Sat,  1 Aug 2020 13:24:44 +0200
Message-Id: <20200801112446.149549-16-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Subject: [Linux-kernel-mentees] [RFC PATCH 15/17] iommu/vt-d: Drop uses of
	pci_read_config_*() return value
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

The return value of pci_read_config_*() may not indicate a device error.
However, the value read by these functions is more likely to indicate
this kind of error. This presents two overlapping ways of reporting
errors and complicates error checking.

It is possible to move to one single way of checking for error if the
dependency on the return value of these functions is removed, then it
can later be made to return void.

Remove all uses of the return value of pci_read_config_*().
Check the actual value read for ~0. In this case, ~0 is an invalid
value thus it indicates some kind of error.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/iommu/intel/iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index d759e7234e98..aad3c065e4a0 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -6165,7 +6165,8 @@ static void quirk_calpella_no_shadow_gtt(struct pci_dev *dev)
 	if (risky_device(dev))
 		return;
 
-	if (pci_read_config_word(dev, GGC, &ggc))
+	pci_read_config_word(dev, GGC, &ggc);
+	if (ggc == (u16)~0)
 		return;
 
 	if (!(ggc & GGC_MEMORY_VT_ENABLED)) {
@@ -6218,7 +6219,8 @@ static void __init check_tylersburg_isoch(void)
 		return;
 	}
 
-	if (pci_read_config_dword(pdev, 0x188, &vtisochctrl)) {
+	pci_read_config_dword(pdev, 0x188, &vtisochctrl);
+	if (vtisochctrl == (uint32_t)~0) {
 		pci_dev_put(pdev);
 		return;
 	}
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
