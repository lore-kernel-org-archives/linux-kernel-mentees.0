Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187E4C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E23AA2078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoUb477V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E23AA2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B97D320507;
	Sat, 22 Aug 2020 21:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRIO+wQ7MhrU; Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9AED420656;
	Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8751BC08A8;
	Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10CE5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0DE1887E3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hGchVhz6uZAe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4FE1087E2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f18so3511458wmc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=31nMg/YY3uRl8RBptXnA3YRrJRPGzHHz23ex0FgcU40=;
 b=DoUb477VnD2R7JR2MpwSMYZVLfO2y9up5iTtOoixuMoic7/1DyEMjlkJ9bKH+auHyI
 AzK4SHmJFmo6tRpZ0QgG615LBFn5gkxIrsgJU9QZu7O9tzmmAHk5UUR/U1hL0+QOdwGK
 l5xYl2vxtFCVDfPfK6wecZqMPHDdVmbyPG1hC3cFQy09atNkCzI3RxBr4cP9sW0ul/8J
 m+rOOLticQYQ+LxYzZJfIy15oqDwBF6it8/M8h6rRgqMozJ/Es6OUogyJKdQZQ6kS1oH
 IVwteQK4480w0nt2HdZG5VkFPkc4lcjC5nFWYRbRc1V9W0XFw6HUJHm+IBuma5NPXdEP
 1KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=31nMg/YY3uRl8RBptXnA3YRrJRPGzHHz23ex0FgcU40=;
 b=T0EJjY0IOBreGyyTeBY4GYD3vbgWxtxwGc8FmIMiwq2dZ6LQn8A6D0lSbBbTUhzsNb
 JsU/r8eMATj4bP/0HvV/5B36KjMG9rwo6GFDj4hEJqGWl3h/LMJaYK51OTn07wrRiq9J
 914xg9DaTWJZwrxeLwyMO/x2zf4jeKa7+vwLXrMjgLdmvtwc1wXiD1RGzOs1viM6fZGZ
 9FfU1ga11+EbXLxx3Sd34GX8QPkxs/EanIPXsCEoBlkQXkPaBJSyHfo+qOE+Taw2tQxb
 1PWGSFZJFpESoUpuQwJJlV8VzD5RyuarGSBrIa+IfVFXkFGC0CbeE2MEm6SkpCjPhLJI
 u5bg==
X-Gm-Message-State: AOAM532A3DwSs4TaeEfiuc1A2luHuUOVNstCFopXK+cMSD9s3wJ/J+JM
 E0OatUGTu30Af5Aaaok7EA8=
X-Google-Smtp-Source: ABdhPJx/zJUfqWE/TL4tAU2xV5iGPckzpmGY8jdM+XdZiN0lZAzgqQrMMaqcd+dLHZAm94PWMeky+w==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr8890515wmz.119.1598130226881;
 Sat, 22 Aug 2020 14:03:46 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:46 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:45 +0200
Message-Id: <20200822200358.252967-11-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 10/23] PCI: Relocate call to
	aspm_calc_l1ss_info
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

This function calculates pcie_link_state.l1ss.{ctl1, ctl2} which are
only used inside pcie_config_aspm_l1ss().

Move call to aspm_calc_l1ss_info from pcie_aspm_cap_init() to
pcie_config_aspm_l1ss().

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index bf728c82158f..89f3f3a6d007 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -578,9 +578,6 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 	if (up_l1ss_ctl1 & dw_l1ss_ctl1 & PCI_L1SS_CTL1_PCIPM_L1_2)
 		link->aspm_enabled |= ASPM_STATE_L1_2_PCIPM;
 
-	if (link->aspm_support & ASPM_STATE_L1SS)
-		aspm_calc_l1ss_info(link);
-
 	/* Save default state */
 	link->aspm_default = link->aspm_enabled;
 
@@ -628,7 +625,8 @@ static void pcie_config_aspm_l1ss(struct pcie_link_state *link, u32 state)
 	u32 up_cap_ptr = link->l1ss.up_cap_ptr;
 	u32 dw_cap_ptr = link->l1ss.dw_cap_ptr;
 
-	enable_req = (link->aspm_enabled ^ state) & state;
+	enable_req = (parent->aspm_enabled ^ state) & state;
+	aspm_calc_l1ss_info(link);
 
 	/*
 	 * Here are the rules specified in the PCIe spec for enabling L1SS:
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
