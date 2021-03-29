Return-Path: <SRS0=0o+h=I3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA26C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 14:03:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBFBC61584
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 14:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBFBC61584
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CC39402BB;
	Mon, 29 Mar 2021 14:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNjPK7Yq7qMl; Mon, 29 Mar 2021 14:03:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80F07400FE;
	Mon, 29 Mar 2021 14:03:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 606F7C000B;
	Mon, 29 Mar 2021 14:03:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5230AC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 14:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3376E8376D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 14:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFF3i6rNjLWB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 14:03:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3547383770
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 14:03:42 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso5955471pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 07:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Cf0NNvh47dChgP3j4zNoZHInMqCN/9vYPVY+E6bHrQs=;
 b=Z2gYkc3U5Zhl7zDWCo6YlOy71NL1T7SEzccpf2919AIxGGmOB/RZQiK5ax4eJPTNIw
 +KH7pH0Nzs7QUo+SS1CDL5dcIkqTiM9L8TJ7u8iljZUNvNWV24N9rlUG6rmTNy5A+n4I
 qyzzhjK8iFJi3m4OAMWiHPc0sKnRhryYAL/jtJWorT7a/emlOMD1QTTFnHUct9O75KDs
 cs7ylXR1BFuPLi/IgYqetg2dm3V0rwnfgpASlw0gJziDeITl5MiVosHF26mL0H+oJejM
 1+5dWuig2yUvjofe2MzyIE+UlVd8O6Jco2u3CSLE4FXrYZbso0dG/PP7EZ64uBRtcRq9
 7mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Cf0NNvh47dChgP3j4zNoZHInMqCN/9vYPVY+E6bHrQs=;
 b=sDAm546FEaVW12uGGIsYvWNV+0vRVX8UH9NZ4TxRUW7u68gEYZWWF2mUYNYSGp9FEo
 1HdAcLGIGV+t8KZEgFwTqLJy+jLwWkUbNB6k8O1oPtwFMNuWPpghMgHVO2/kkOzGUVLb
 CbSdQ+H1XUVxbDZWwRVyZTB5c12MVhU0EOpM5a14ivUGQc1T10ie4u4NGKoX7FrUzLeP
 a/kuCZN/luap6Susvu7unVtOlbAKju3djeOSWAV2nWlBV/pEcZcJ/JzrawuIUrOmmORK
 tfVVX7/kHiBf5p5ZK2I6Ya/PU24bRAtZQaEjA9qHbqf8FAyAsK821Kl+DC6CLeJZQP2U
 Yxqw==
X-Gm-Message-State: AOAM533VvIAKQg0B1FiIWwtpBNTxUA7hJcCxmOauV/u5KPIjD+GurRTz
 OC/wekFZd5SkpfvZGW4VlJc=
X-Google-Smtp-Source: ABdhPJzbGV11FRlYScAIalAmnglofusziOLm209WvMmkMR6J84X/EyLxqq6fcnKU6jcLENB95q7C7Q==
X-Received: by 2002:a17:90a:5b11:: with SMTP id
 o17mr27793616pji.32.1617026621403; 
 Mon, 29 Mar 2021 07:03:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:4ed:8f53:adc7:b574])
 by smtp.googlemail.com with ESMTPSA id
 i10sm204271pjm.1.2021.03.29.07.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 07:03:40 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: balbi@kernel.org
Subject: [PATCH] usb: dwc3: exynos: fix incorrect kernel-doc comment syntax
Date: Mon, 29 Mar 2021 19:33:18 +0530
Message-Id: <20210329140318.27742-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-usb@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 rdunlap@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 yashsri421@gmail.com, linux-samsung-soc@vger.kernel.org,
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
The header for drivers/usb/dwc3/dwc3-exynos.c follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
"warning: expecting prototype for dwc3(). Prototype was for DWC3_EXYNOS_MAX_CLOCKS() instead"

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 drivers/usb/dwc3/dwc3-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 90bb022737da..0ecf20eeceee 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * dwc3-exynos.c - Samsung Exynos DWC3 Specific Glue layer
  *
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
