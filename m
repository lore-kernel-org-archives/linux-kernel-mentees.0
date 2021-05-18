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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860D7C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 17:53:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21F19611B0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 17:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21F19611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D821A403CF;
	Tue, 18 May 2021 17:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6V1LA7BMoQy; Tue, 18 May 2021 17:53:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFE6340003;
	Tue, 18 May 2021 17:53:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9816C000D;
	Tue, 18 May 2021 17:53:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D3EFC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 17:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00343605F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 17:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pBDHSw1yiVLO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 17:53:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0539660585
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 17:53:50 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id k15so7536123pgb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 10:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=zW7NFRkMuQE7Xcq1YVWOhyvBHrzp8Wh/Vsrhh71Nr7o=;
 b=d/HbfcBLVMUPSoYprjKvKAih7Yl55sbm9MPj2sScdzp9a0m2pJwmob8D2o90qEFmwR
 Pxg6Ad4VxXWfEBb8cPYbhATavazADnfrXM8B5x1I4jbzRgXTU1bLTBULOzEwzDc/7sQx
 JGQbtfoULKNYwz9xaC7PP0KCuXQev6ikaa+PELQMz18X/Cv8G2AdiOzyW+6CfEizZl5x
 QpLWmHhVwjkKvLLZ/uCWmK1xbPMcuUc9PF2HOQ0GbYkhlVA4/4JmhZLxxzHePHQ/o/gA
 bEGTIce+psg9LkdV539q7C30aQ3nbe+cRz6uIlOuEVxUf5d0uCIvk2g6mKrIPmaoT7zi
 WSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zW7NFRkMuQE7Xcq1YVWOhyvBHrzp8Wh/Vsrhh71Nr7o=;
 b=LcbBaxyarbOsqdAJkRV7bE+lOCjldPMvMTSRHZerhBmekThGSGXnwc6XRJJi44L8vp
 Z+y8EXnFPBvyAXYk8FyZ5LJjKSvaO2mnQDVXeXyredJnejbiqq68NpNLOnqZS0Fqa3hf
 E7TQYPNcCyFJBTWTnSUuZQnZi+gJASWf3ilAIFfFYdqYtWbE1PnewxehreHFN2HvxnXZ
 l7RWXsfYyxiFved8FNac9SKs3SVVSH0usPjBmoBB0Z/yKA0uYXkx27KoUUcxypFVLZYe
 LhPmMqppilNCzMb2HzRd1nyFIwbpgtlxnY09Ak/Epj4j9HDqeaTSTAqM+3oCjXC3HkCx
 syWA==
X-Gm-Message-State: AOAM5300yxGOTOngTHrGhEX71GRltiCZ5DLA2XyHkAF9PYHFiczMkMEa
 3+xtmjvO3XrRMKEmXg46wkY=
X-Google-Smtp-Source: ABdhPJyH9El/7sLZfmceVPhBkIm4R1WySdPKPd+coyyg0WR6fxUM6uoP7k7yh0LcfxsWTpkv4kTGYA==
X-Received: by 2002:a63:652:: with SMTP id 79mr6354688pgg.293.1621360430387;
 Tue, 18 May 2021 10:53:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:e998:b72d:dcc8:8823])
 by smtp.googlemail.com with ESMTPSA id n8sm12429908pff.167.2021.05.18.10.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 10:53:49 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: fix kernel-doc syntax in file header
Date: Tue, 18 May 2021 23:23:39 +0530
Message-Id: <20210518175339.12399-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rdunlap@infradead.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-doc@vger.kernel.org, yashsri421@gmail.com
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
The header for include/linux/nsc_gpio.h follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
warning: Cannot understand    nsc_gpio.c
 on line 3 - I thought it was a doc line

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210514

 include/linux/nsc_gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/nsc_gpio.h b/include/linux/nsc_gpio.h
index d7a04a6e3783..342ce97975e8 100644
--- a/include/linux/nsc_gpio.h
+++ b/include/linux/nsc_gpio.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
    nsc_gpio.c
 
    National Semiconductor GPIO common access methods.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
