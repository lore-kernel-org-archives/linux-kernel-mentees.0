Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1897C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 14:32:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FEF86124F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 14:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FEF86124F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 725EE40865;
	Mon,  4 Oct 2021 14:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwZdAGIUcMxK; Mon,  4 Oct 2021 14:32:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C713D402DD;
	Mon,  4 Oct 2021 14:32:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B16ACC000F;
	Mon,  4 Oct 2021 14:32:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 830EBC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7190E415A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5uSMDbIt1-G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:32:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F1E7414BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:32:42 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so4087015pjw.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 07:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WgoZ9+KpQrZR7tDkQXfhNUVljLBFuOfZzG3U49+7PlA=;
 b=WJdx7P1TcAyVmEBiXMfx3i9JFf4eNjyW5Vq4oC9/fr/nJcEBpUnxCpI18WECXbYHf/
 KB0FXtM9rD6QyJDHR1zVnlxE6P4XVj8uhGsKSNaP+QdsP3oGBF7fsZcQGjOtCIGFAuZl
 8IyyhVKmRUEZzn8r6VE20PgzYSuV7j4ULaVauXMsqj3kjQetN3trtemqs1QXNMkPh7Ck
 rQEK80gn8TSK+com0w/V2PsVKRY3D5UyJNqo6SPhnAUSfeAhEDsOTWKWQ2ym4UnUGw53
 RLjTjWvlr9RUBdPDUiSj4Tqn6XWMh+eALMls0QIVsiNPuUn6GEDyb4kQ/aYbEJDb0fc5
 ORuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WgoZ9+KpQrZR7tDkQXfhNUVljLBFuOfZzG3U49+7PlA=;
 b=2j3TtRYAUsTYE8LFjzsdIK4mBUrr//RK228yxpBkwHjDBX+NT5IME0MTZDi41jqs4l
 9+ejArYg6d8JYfj+Q6oewRaehF7RSdouCbEsXi3XyxKZULsTqQPkwfmSZ8xkM2QFI8Y8
 9XEvhwvc3ivDbSgmxMDms5q0BCg05Umz8RuZlb5euutB8aIGgEdsN96BF6HWVlltf3SB
 aHdfkgQqxIHsC8baYNAvIMG19Sq8sUiR6tHouNv885sPk+Gd+ZexEwr3apktsq8j1OaX
 A1siJ9k/JoCiGr0cuDRdkrvtnKoRfFSVHHeOCDEMYcBB2y5pRHGP+agz+HVXVow/gJKG
 SOvA==
X-Gm-Message-State: AOAM533JBKnK8GgEjwMSEwGuGxGfwHtYFNR4CsVmnDluGzUBzZPta78E
 tvQLVfsCrn1b/j9OAiIkotA=
X-Google-Smtp-Source: ABdhPJxtTQJnIxU5EdOGKPVOhIsZXoI5Jz8mKWOddwDBmK5s1XWXwrVNaKGUsgVKJPp+b6Hs3D14Jg==
X-Received: by 2002:a17:90a:1db:: with SMTP id
 27mr37619533pjd.106.1633357961959; 
 Mon, 04 Oct 2021 07:32:41 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 q3sm14489146pgf.18.2021.10.04.07.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:32:41 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v3 4/8] PCI/DPC: Use pci_aer_clear_status() in
 dpc_process_error()
Date: Mon,  4 Oct 2021 20:00:00 +0530
Message-Id: <71cec6aef2535b48911bd98bd010012643eb0bd0.1633357368.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633357368.git.naveennaidu479@gmail.com>
References: <cover.1633357368.git.naveennaidu479@gmail.com>
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

dpc_process_error() clears both AER fatal and non fatal status
registers. Instead of clearing each status registers via a different
function call use pci_aer_clear_status().

This helps clean up the code a bit.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index df3f3a10f8bc..faf4a1e77fab 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -288,8 +288,7 @@ void dpc_process_error(struct pci_dev *pdev)
 		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
 		 aer_get_device_error_info(pdev, &info)) {
 		aer_print_error(pdev, &info);
-		pci_aer_clear_nonfatal_status(pdev);
-		pci_aer_clear_fatal_status(pdev);
+		pci_aer_clear_status(pdev);
 	}
 }
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
