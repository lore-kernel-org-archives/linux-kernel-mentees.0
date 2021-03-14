Return-Path: <SRS0=ODNG=IM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89927C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 20:18:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FC6364E6B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 20:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FC6364E6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CC2283A5F;
	Sun, 14 Mar 2021 20:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHh4TErPioMF; Sun, 14 Mar 2021 20:18:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 394BC83A41;
	Sun, 14 Mar 2021 20:18:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27E61C000B;
	Sun, 14 Mar 2021 20:18:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D74D5C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C621D6F4FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HOKAbHWOQWDl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:18:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A4EF6F4EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:18:52 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so13234428pjq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZsjA6u5KqVwWCVQJoGoMMsT0yRwzlqjV0EQl7XQThrM=;
 b=iKLzYKnGiPUXq/0hntnFz2hjdUzfnQVe7o7Ai7mbltRfC/cQ15Zq9pQgK//Vbduh7O
 P+x26+jWi7WIWopdzaQYJjVzRIckpXI09rs9tLhxYY9hHVOykj30ZE2nC84r1lRZptAf
 oqKzu7txlpF6pzxB3WrxZ5tsf8ofR7Ut2A1sEkp46EnSwyiR6G9pMWZp9eylMXFAfrNE
 ap4X9neccB75KwibFRAZF/pAAqr34TtSOYyPYQRIRBcMhbqsAtphN+YPSE8iext9jVqa
 ggoMsCo/5i75/f+CT8NQU5YKTaUaK619lkAaZd1lncqgeQ87uexNB2W7ZuTkB9GUDg7N
 7r9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZsjA6u5KqVwWCVQJoGoMMsT0yRwzlqjV0EQl7XQThrM=;
 b=ti0178TeRhe1UTVdiWMrZvYTOUWW9GX1ByB2jG6OgTBdjPQdrVrtC6+lzkdalDJkGG
 OGNGxImPt1b7FhQMAQMyfSfQk19rZhBzilFYB/GxhckdBTXSm1hoU9y6Hv2v8+ldaGKA
 7P7x/kdoEZHJXIsFHtHkrOs/gJZA6NInXnUu4DJZEC/tDiuqUUn/5FM0x7GJCh3UmxrG
 EvUYZcx7w+efDU6gU5GVle3tLH3W5VADGwbqOPcEyZDOK4yMSNV1yHslLp7zNl5/by+q
 3i4Hc94BIAc/EgO3nRo0NhTxuCKEqzu/Y7njWJ8UgZo9ibwf7nZlDRgn0N+EkGXnOczH
 r+tQ==
X-Gm-Message-State: AOAM5313+mUVvmt9IMDaBZyn9rUgbwz6IqlAvtrz438PN+m3flMnlmWg
 Z7u1vUZpsSl5Aoc5DEaJe5IlU0qsNCrNPA==
X-Google-Smtp-Source: ABdhPJwNvEjILF4VuJrPUgCWTeMNhxUWAI2rXM0zvdoDtvW/9TA8iGAQbF+JxlXRtUCvvdjpvTwHGQ==
X-Received: by 2002:a17:902:e2d4:b029:e4:be01:1d9a with SMTP id
 l20-20020a170902e2d4b02900e4be011d9amr8247099plc.43.1615753131720; 
 Sun, 14 Mar 2021 13:18:51 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:acdc:a5a5:c438:c1e3])
 by smtp.googlemail.com with ESMTPSA id n10sm10943793pgk.91.2021.03.14.13.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 13:18:51 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: siva8118@gmail.com
Subject: [PATCH 05/10] rsi: rsi_mgmt: fix file header comment syntax
Date: Mon, 15 Mar 2021 01:48:13 +0530
Message-Id: <20210314201818.27380-6-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210314201818.27380-1-yashsri421@gmail.com>
References: <20210314201818.27380-1-yashsri421@gmail.com>
Cc: yashsri421@gmail.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 amitkarwar@gmail.com, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 kvalo@codeaurora.org
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

The header comment used in drivers/net/wireless/rsi/rsi_mgmt.h
follows kernel-doc syntax, i.e. starts with '/**'. But the content
inside the comment does not comply with kernel-doc specifications (i.e.,
function, struct, etc).

This causes unwelcomed warning from kernel-doc:
"warning: wrong kernel-doc identifier on line:
 * Copyright (c) 2014 Redpine Signals Inc."

Replace this comment syntax with general comment format, i.e. '/*' to
prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/net/wireless/rsi/rsi_mgmt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/rsi/rsi_mgmt.h b/drivers/net/wireless/rsi/rsi_mgmt.h
index 2ce2dcf57441..236b21482f38 100644
--- a/drivers/net/wireless/rsi/rsi_mgmt.h
+++ b/drivers/net/wireless/rsi/rsi_mgmt.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2014 Redpine Signals Inc.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
