Return-Path: <SRS0=G2n4=KP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1035C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 18:22:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 400A961001
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 18:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 400A961001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 030AF405D2;
	Thu, 20 May 2021 18:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id deejJ8EHD9Ai; Thu, 20 May 2021 18:22:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C0474049E;
	Thu, 20 May 2021 18:22:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBDDAC000E;
	Thu, 20 May 2021 18:22:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96EA8C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 855E38443A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id irjqV2WTvDhL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:22:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79CB88443F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:22:10 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id v13so9572908ple.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 11:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lpcKnO9tQEe0BuksEsXPkwREUyfxw2fzAVZOQGH8To8=;
 b=R1ox8Omaa5KTdyS7M07a8tB1wjyruLTadLN3eNZ85U/J7/uJPQ5FAAPd1Y6j3ZaYz1
 EeBX11PD5uNJE/2rGSSJV80k/SVwDho3dzRklg6HRloqr3KF2xoyEWXpVb+1lX3t7M8i
 lKWPH4jz3X/IhUrcmh5Yxjo3IhFb3GnIbUZ+i0HDZGqSpnFxw/3nUL+OrVl7Wh9YbKrJ
 b7BkXzs6MLqD8z8TfuwdylWyd12azPnf1tTW9se8gLcLQN0YhetMBn9z9FJQoBF4E1Uz
 fcu1HlDkcc2ACKBTj2XXaPtDmplTPQrF0w3NKw9l9HiOsw7ALu3I/kK36XFhuajMiYIz
 kzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lpcKnO9tQEe0BuksEsXPkwREUyfxw2fzAVZOQGH8To8=;
 b=X0F5WRmEamEPyRe6E8mbUtOoh0fwk7FbsC4juRMkIx4ndeCVJ+eC8/E24cD6v3LxiE
 k820/ZnfLgPqtr4zCD9WBySj4lv1LfzhypQGWPsESfrsR9yUKvpAzzO5wsVxk514Ia7K
 ZbRvKQvu+NgHUcTdDz2Mo/4+NgkIAGCjDRvyKVRNbKcRV0ikDn22TLr0tajMyYIiuEBz
 X4d4UFWslvE9QBvE5NLVID4nbTQO95RYbbMp0ZtiujZALRifMt4X75s5cluEx0HYzjv7
 O7RCF6QhUfTr2+xzkXKphV5et2OqnUnrn8QghiLRYZnD0QUGlMiRcmmFV+3kBwrLqwLQ
 5/fg==
X-Gm-Message-State: AOAM531UuasLDml6a2q4WoPsg7vxO5DEjX1uD+Zbf8Y5SEuDYDYy8YVK
 XzIuxI7ZJ37F4N7k/Kqpv98=
X-Google-Smtp-Source: ABdhPJx5IJioORIThYoSAt1q0q1qSZkrfMObM6ASvt7sKGIXVBm3whG4VdKzWLBYun1RP6G/lVNO0A==
X-Received: by 2002:a17:90a:17ad:: with SMTP id
 q42mr6509831pja.181.1621534929660; 
 Thu, 20 May 2021 11:22:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:4822:12f2:8c52:6d8b])
 by smtp.googlemail.com with ESMTPSA id
 q196sm2643751pfc.208.2021.05.20.11.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 11:22:09 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: courmisch@gmail.com
Subject: [PATCH] Phonet: fix kernel-doc syntax in file headers
Date: Thu, 20 May 2021 23:51:59 +0530
Message-Id: <20210520182159.31462-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com,
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
The header for include/*/linux/phonet.h files follows this syntax, but
the content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc.
For e.g., running scripts/kernel-doc -none include/linux/phonet.h emits:
warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * file phonet.h

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 include/linux/phonet.h      | 2 +-
 include/uapi/linux/phonet.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/phonet.h b/include/linux/phonet.h
index bc7d1e529efc..09ecb1f94c5e 100644
--- a/include/linux/phonet.h
+++ b/include/linux/phonet.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * file phonet.h
  *
  * Phonet sockets kernel interface
diff --git a/include/uapi/linux/phonet.h b/include/uapi/linux/phonet.h
index a2f6b37a5937..6b873c460994 100644
--- a/include/uapi/linux/phonet.h
+++ b/include/uapi/linux/phonet.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/**
+/*
  * file phonet.h
  *
  * Phonet sockets kernel interface
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
