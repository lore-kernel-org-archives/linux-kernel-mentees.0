Return-Path: <SRS0=Bfkk=I4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F75CC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 20:59:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A571F6199A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 20:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A571F6199A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DD686063B;
	Tue, 30 Mar 2021 20:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-im2RlIx7Un; Tue, 30 Mar 2021 20:59:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D860600B8;
	Tue, 30 Mar 2021 20:59:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6266DC000B;
	Tue, 30 Mar 2021 20:59:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5943DC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 20:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 534ED4054D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 20:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yfDPjZm9lRYJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 20:59:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98D8B40547
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 20:59:18 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id t18so8389804pjs.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 13:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=GLVkZwPkKaRhPJAPLLORTSkvh5Dd5Uiq8r8OTjAPxPc=;
 b=WBBjcNxBrdR0V3i2ef1toyctyQAFtQgrWPCC/tX5suEjlhqxd/gA0sTJmNdfz2srkd
 +LEPMX1tPGGrskXKKAvgrf1FM8qzNRpQ2mS96ZRQX9Itc0Kz+iN06Ij0evj/cN/ccxMF
 sQAPXlwWMhgCWBr5opBlnfagUqjRMYll9VXbCi8NzotvcjSwWXH/F4TkCWkIkb86rXpq
 ZtLhrvSsTcuSs4Fthz/NO9N5zNXFO3sfWJd+6i/Slr6szVXbp8YTS/z+/TvfMj7uTUeB
 N1w5LTtkSNT+G2vkhVEIe+fYfjhQPZbgnz78hbCC9xm7H+bpSOFwpHSzHMMktX/v3XnO
 ay/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GLVkZwPkKaRhPJAPLLORTSkvh5Dd5Uiq8r8OTjAPxPc=;
 b=sJG6sSSfMrGu++Cg/cF2vIifGUqnPzr34vxEvnGuSH+UU3yEG4vqbESISj5k5xhW9l
 Yz3LPvN4GzXaWSR8H2KU6tc4UR0Xd7BjWp75jhb0uymTb2dGhwLIPdjGQTC9R1h3GwIp
 3nxQCy8N8bdPRYW/qoMeHBI0kLw9UgbnTX5FymVDcKzRWD4zR3YFraCdvq2yGz+vzgV4
 xcVmhA+JeHib22kkqVGC6R+DsrgEkWHCGaIzKK8G9oaoY+ZTfSuA41oOVz3MNvzU/QDa
 lt3Gnv/Lx1q3D0TMQckwAOiQLafwwGWG1u5AbgP85lWZRAX/TVovyEl+Z5i37rKvSZR0
 oE2w==
X-Gm-Message-State: AOAM532TVBMI84c4PZhMZMgUCLsMzaBuF2YrcnFcPJ8PLRDxMGxPNhb/
 7PTVACCQfPlRpghFmXEnnAo=
X-Google-Smtp-Source: ABdhPJwGSaV9UaiRWx8RbovjUc9n+Gl1cLC6IYIky0o8D7pfB7CjSOhacJgjovEs0g7gxZXC6rTKeg==
X-Received: by 2002:a17:90a:f82:: with SMTP id 2mr205467pjz.196.1617137957991; 
 Tue, 30 Mar 2021 13:59:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:d1c0:d79d:e260:a650])
 by smtp.googlemail.com with ESMTPSA id
 u24sm22431017pfm.214.2021.03.30.13.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 13:59:17 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: OMAP2+: fix incorrect kernel-doc comment syntax in file
Date: Wed, 31 Mar 2021 02:29:08 +0530
Message-Id: <20210330205908.26800-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: yashsri421@gmail.com, tony@atomide.com, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux@armlinux.org.uk, linux-omap@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for arch/arm/mach-omap2/omap_twl.c follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
"warning: wrong kernel-doc identifier on line:
 * OMAP and TWL PMIC specific initializations."

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 arch/arm/mach-omap2/omap_twl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_twl.c b/arch/arm/mach-omap2/omap_twl.c
index a642d3b39e50..d4dab041324d 100644
--- a/arch/arm/mach-omap2/omap_twl.c
+++ b/arch/arm/mach-omap2/omap_twl.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * OMAP and TWL PMIC specific initializations.
  *
  * Copyright (C) 2010 Texas Instruments Incorporated.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
