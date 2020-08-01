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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E415C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D42D42076A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tE/fjtx1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D42D42076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8164388686;
	Sat,  1 Aug 2020 12:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pluBuoDL4ZAU; Sat,  1 Aug 2020 12:24:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1DF84886E1;
	Sat,  1 Aug 2020 12:24:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BE70C0052;
	Sat,  1 Aug 2020 12:24:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 161CFC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F3FAD203E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vDwW-qyTSpap
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 165E6203D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:40 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id jp10so7456908ejb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3Ef8IUcnocHoCROk98NuQIVshhmZka7ZCelapJAaYyI=;
 b=tE/fjtx1OYaqRRakblDmsU7Cnv83ftTXHcpBU2sObAMVsHdeeD511d9uE4CQXW/ML4
 9ou6kcbOTCYlmoJ0BO9fpP7W3JJjmWv949Gl3o20KOci/t0eNHJAqYZ2Gxk5TopcRyvh
 XLrXHaTzRgX1modYGbrCQebf06ionlzqNcQDrvnR7iTys9rnsAiAjUDK29lVQ0B44zV/
 xLk1t7R97tRvTLpCRVbiLlyZiSK49nLlimS8r/LHu8RKfg7euo0rzECAOimgYpZk2+B7
 QVbgypX/3v6luzZE15+a7OoNY9AhGTRacKHp3DnL+ZdWO2O7gG/HZVrRUPIAMzfjSFbQ
 0qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3Ef8IUcnocHoCROk98NuQIVshhmZka7ZCelapJAaYyI=;
 b=E9Iq6XzaxN6XExk4IJ4oJHmG+I4NxOBavPn0nvi4McnUejKkzBYaEpfPkbaBfslGwA
 rPp3njduEciUdU96VPqne/I8eCS7SGE39b560pUC1I091NImKHwTKXVxr8KvjaUO4OTt
 JE2PJjPHxAPyR9MRznaemChk3wetbS0dDiFxaPeTA80+kFX9tAOWrDo5WKP/0F/Bd3Wq
 PAnrr37s+hj2WGPR4DRD686k5A04deywQyEnlLSBm+F0AtDyfA3mLD0XJW/Jf2uaDZpz
 WVrbR3P6SuJv+nFYfqOyKtIsAsQFzYK94YQFnrRdDXEisj2cQ24bIEcS+iJB496BGeRy
 uEtg==
X-Gm-Message-State: AOAM533tJWSgWt7rL4Au/DM3G+W1zVCPIHycxaQtSM+KLws4i75uDa7r
 zu1mf6xoJRLVg1KXaYbCcrE=
X-Google-Smtp-Source: ABdhPJz01/oRMdN4kVKWwAkYQUYeZyQfsFmTxzv+VPQbHpGFpIXoIwXAq4Azmv82DQf/ASMIkfxYUw==
X-Received: by 2002:a17:906:eb90:: with SMTP id
 mh16mr8170598ejb.10.1596284678498; 
 Sat, 01 Aug 2020 05:24:38 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:38 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>
Date: Sat,  1 Aug 2020 13:24:40 +0200
Message-Id: <20200801112446.149549-12-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 11/17] intel_th: pci: Drop uses
	of pci_read_config_*() return value
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
 drivers/hwtracing/intel_th/pci.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/intel_th/pci.c b/drivers/hwtracing/intel_th/pci.c
index 21fdf0b93516..176c9088038e 100644
--- a/drivers/hwtracing/intel_th/pci.c
+++ b/drivers/hwtracing/intel_th/pci.c
@@ -32,13 +32,13 @@ static int intel_th_pci_activate(struct intel_th *th)
 {
 	struct pci_dev *pdev = to_pci_dev(th->dev);
 	u32 npkdsc;
-	int err;
+	int err = -ENODEV;
 
 	if (!INTEL_TH_CAP(th, tscu_enable))
 		return 0;
 
-	err = pci_read_config_dword(pdev, PCI_REG_NPKDSC, &npkdsc);
-	if (!err) {
+	pci_read_config_dword(pdev, PCI_REG_NPKDSC, &npkdsc);
+	if (npkdsc != (u32)~0) {
 		npkdsc |= NPKDSC_TSACT;
 		err = pci_write_config_dword(pdev, PCI_REG_NPKDSC, npkdsc);
 	}
@@ -53,13 +53,13 @@ static void intel_th_pci_deactivate(struct intel_th *th)
 {
 	struct pci_dev *pdev = to_pci_dev(th->dev);
 	u32 npkdsc;
-	int err;
+	int err = -ENODEV;
 
 	if (!INTEL_TH_CAP(th, tscu_enable))
 		return;
 
-	err = pci_read_config_dword(pdev, PCI_REG_NPKDSC, &npkdsc);
-	if (!err) {
+	pci_read_config_dword(pdev, PCI_REG_NPKDSC, &npkdsc);
+	if (npkdsc != (u32)~0) {
 		npkdsc |= NPKDSC_TSACT;
 		err = pci_write_config_dword(pdev, PCI_REG_NPKDSC, npkdsc);
 	}
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
