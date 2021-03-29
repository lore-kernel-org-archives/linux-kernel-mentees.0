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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98464C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 14:26:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 292F761964
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 14:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 292F761964
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE483402C7;
	Mon, 29 Mar 2021 14:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4GGXJ1654_1r; Mon, 29 Mar 2021 14:26:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6EF7402C5;
	Mon, 29 Mar 2021 14:26:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B409C000C;
	Mon, 29 Mar 2021 14:26:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F281CC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 14:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D89BE402C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 14:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xz8jIfKm8UfA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 14:26:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 379DC402C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 14:26:18 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d8so4474012plh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 07:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=m9ZlEf9Kme4mbiO6IFR/gcxIg4Oa3HNlqB5nKLE2L8M=;
 b=dXh0pE9ejqskpD303Y1mDRnLk7vI6Qrmn8vnLQmo3iktYK//4gKuXsu519xhB6vrt+
 FcldxO2/JmAFjmEvO6BHDEMnsMPfGuqx3TULWCWkZeNirZOFgq0ycvJOX3vFfetdnK+G
 AmM25a4jqMhNOlYySGUkKfN0P5Ua0JBhlizTjgd801Ca92jjxj1MRlEDy/2gTzM1rzcv
 IPNJ83xVdf2Ae3e6cIRn80CaQsKjqGbS022Ve0T2wvkZJXds4hL7dsUob+0yx2nbK8b6
 rTDt+XKSdvkfuzohF9vioVpZQkH+CK+zyh0rreTGX4ExWjwIXYQLSmCiaYjRRwMgu6XF
 dBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=m9ZlEf9Kme4mbiO6IFR/gcxIg4Oa3HNlqB5nKLE2L8M=;
 b=U3Q6mnWI7IwS0Xvww6GGlmq2h1NsJdeffMGNllGLeWemC081wcKqo/7JRLJ3Qpy3Z3
 jQhh0emMOUdy8pJTFDQMctIWnK8ip6CZV0vF/aGs8yO4QYYhnf2DYKJtrDpeosE7hCy9
 Y9YVzTB6MDxGsdOvw5DLpMPUOYQkgNJnYWLTGU/QqQx4JUYLT1FDBZtNQpG8LFdoqhqL
 dqVLd/Onqpwrt+nnIVpJImkRGEygnpj89DhiPLj6aFNxktfA890OdD1NZoG+Wrf40sAh
 WGt2kJu7Tf6ntMhJlaW6+92fMGe2rlErHsf/BNyeU9g81pVlRii0MS1Ng6sdPfQp0T1U
 pngA==
X-Gm-Message-State: AOAM532hd1nzEcSMHRto7BMj4Ew24jh0Nfwwubw0Hmd4aN9EV1PY8xm9
 8RIp7BV1zkcVkMWS7PoaamA=
X-Google-Smtp-Source: ABdhPJxiyW8fdmbzHiJw0DVGGzwsumamMCVvqh9OAV5jj6j1DU2bfOuMpz8NnNKqu111rrzl/ViQiQ==
X-Received: by 2002:a17:903:228d:b029:e7:1f01:bab0 with SMTP id
 b13-20020a170903228db02900e71f01bab0mr16660231plh.80.1617027977531; 
 Mon, 29 Mar 2021 07:26:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:4ed:8f53:adc7:b574])
 by smtp.googlemail.com with ESMTPSA id
 f65sm9641341pgc.19.2021.03.29.07.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 07:26:17 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: balbi@kernel.org
Subject: [PATCH] usb: dwc3: imx8mp: fix incorrect kernel-doc comment syntax
Date: Mon, 29 Mar 2021 19:56:04 +0530
Message-Id: <20210329142604.28737-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: festevam@gmail.com, yashsri421@gmail.com, s.hauer@pengutronix.de,
 rdunlap@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
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
The header for drivers/usb/dwc3/dwc3-imx8mp.c follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
"warning: expecting prototype for dwc3(). Prototype was for USB_WAKEUP_CTRL() instead"

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 drivers/usb/dwc3/dwc3-imx8mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 75f0042b998b..b13cfab89d53 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * dwc3-imx8mp.c - NXP imx8mp Specific Glue layer
  *
  * Copyright (c) 2020 NXP.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
