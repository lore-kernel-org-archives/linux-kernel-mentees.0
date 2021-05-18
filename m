Return-Path: <SRS0=n6YR=KN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71340C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 18:23:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B8BA61028
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 18:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B8BA61028
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA47F403E5;
	Tue, 18 May 2021 18:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kGIL0TFy3Oqv; Tue, 18 May 2021 18:23:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34DDA402AC;
	Tue, 18 May 2021 18:23:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1538AC000E;
	Tue, 18 May 2021 18:23:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B9C1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AA95403E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qp3IzbZoVIm5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:23:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DF33402AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:23:25 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id n8so353948plf.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 11:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=VeljYR5alzrAzxkyBn4PSDhx6vZQM78YA3D/fgR2ogo=;
 b=m+6WBC3Znf40Skbt89rEhIlHOmIUpgXzZn/XUviedZFk4DWyq5wY7LXryBqTQ+A/b1
 x/yeRF8GEJtCa2DRUcen0va+ngLaIzXisHptuhAvJSfCYYkzdUk+CwtTVrkdCOnn7YPR
 +uSOcwaqqw99OKg72YKWIrstpow1KF9wZMaXrr6096sH8dZLkQr5e2/NRc1R2BoCYubA
 H8vt2VvfBUzwdrvHrSZthMkmIijSFOvOQtsV1VRFY3/XPR23INEc9qzqI5lUl/5jZYib
 kuQgCbsRMR3ESo+Lvj2WVSdJav1z1TvN/aXuRigWZEv155n66RtkBi1WKkGsj5XnAE0u
 aytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VeljYR5alzrAzxkyBn4PSDhx6vZQM78YA3D/fgR2ogo=;
 b=fxkHX/fC7pkziFDEIP6nr9Pg5yrk082FhEy9WeYSDqv2FAtdNtFPM6t+4418vCFv76
 SnFS03f3oDg3gI5zzObQC5Ov/0qpmdkiV1wIGOyKxPkVdT/7HtBVqr9UzAf1uiE2M8zd
 1+HpoPj9dOV+s9GFdTHcMBMvulD/i9sOuf1khQnjN9KxYviu7S15pHXZqU9stmlCjIOl
 h52ZajgBLLaabrt7i5sq6WkwChDbFhPPpXS2GH6J11KBpX008EeOFvlQz2+9k9Bums9O
 M+zfLY9OpBmQD07pnACXqYwhz0fe30t0KQ9o7lqM5pgxeSFL1rL923NU3SopCtFkQv4K
 RHnA==
X-Gm-Message-State: AOAM532XUzc1X3S2/mBat8nAgCANoZsXVALGAHV5MsogwPD6HAdVYHm7
 aaYoUPQC/egNFriM227NhZw=
X-Google-Smtp-Source: ABdhPJzYmciEiS9phWq+8CRTRf9S4j9y8Uyp+VH94jT6y6a8HYrvhP1f1LjDd7IFjacyNWwdf433/Q==
X-Received: by 2002:a17:90a:ad44:: with SMTP id
 w4mr6766598pjv.71.1621362204745; 
 Tue, 18 May 2021 11:23:24 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:e998:b72d:dcc8:8823])
 by smtp.googlemail.com with ESMTPSA id lj13sm2446661pjb.3.2021.05.18.11.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:23:23 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/irq-omap-intc: fix kernel-doc syntax in file header
Date: Tue, 18 May 2021 23:53:10 +0530
Message-Id: <20210518182310.14461-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: keescook@chromium.org, linux-doc@vger.kernel.org, rdunlap@infradead.org,
 yashsri421@gmail.com, grandmaster@al2klimov.de, akpm@linux-foundation.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for include/linux/irqchip/irq-omap-intc.h follows this syntax,
but the content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
warning: expecting prototype for irq(). Prototype was for __INCLUDE_LINUX_IRQCHIP_IRQ_OMAP_INTC_H() instead

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 include/linux/irqchip/irq-omap-intc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/irqchip/irq-omap-intc.h b/include/linux/irqchip/irq-omap-intc.h
index dca379c0d7eb..e31057e26a00 100644
--- a/include/linux/irqchip/irq-omap-intc.h
+++ b/include/linux/irqchip/irq-omap-intc.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * irq-omap-intc.h - INTC Idle Functions
  *
  * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
