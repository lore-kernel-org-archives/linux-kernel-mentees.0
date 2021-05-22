Return-Path: <SRS0=hd2V=KR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5BBC2B9F2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 11:44:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A85D61183
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 11:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A85D61183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0086B4029A;
	Sat, 22 May 2021 11:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rvjh2YpY9qMH; Sat, 22 May 2021 11:44:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA5C7402D2;
	Sat, 22 May 2021 11:44:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F980C000E;
	Sat, 22 May 2021 11:44:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1FC3C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D353840385
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r_USBvxLeaaB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:44:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 514694036E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:44:04 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id i5so16369736pgm.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 04:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NYrmw5RMTV2aEThz0kjImVo1vw9pbKW0fAr4kqrkC5U=;
 b=FS/Gl1Fewy5oyhiSGr7ZZMYAGTWOr5VtIkUwhWPkdngRV0eRo6u71ya9tTqQ+pUXu8
 UgoAvaBYxbLuC0ZBWgOoqQqbm5YcYd0yvIDOO1rLIVkXqHAnpTk5nXZ7aCaYEoKn5eHZ
 AxrK5332IAVsKQQ2df7TDEyyy0bv1WPfUvc2H1URset8B9nvGIX36gxyHLt1K0k4W9VT
 lM391jrsV+edzNtMvqBqhFqigNLS6n5kwvHcvE0/WL8TAA7mLpLy8uPi0+zZkFDK5ItT
 OHpeWx2Nz+Mttz8kRrkB0D+hMnZOpX6pXR2Pk3dxsL2xGl+HAuwkYKWd7oMv+5osN+qc
 SfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NYrmw5RMTV2aEThz0kjImVo1vw9pbKW0fAr4kqrkC5U=;
 b=umY6Vc8CeMuYK2D7OH63ngq9PCg58MGZfDFjAD1Wzvi0HgFykTIYMwU5XlguyuY5zG
 gtg3ctBZdjliqhPQSi3pT1F4h/u2/p9IYC0LdwlvtRshzOkFHOsno20fbvL4tvk6ID8u
 bp1jcAbJ3bgNpx+6Ho7mpwF3sN685wCRvxCDNyVGmAAN37vrhv6oJPCPnhRacybAZ0S0
 FoQzPY9VoU7yu6df+d/ZGZoJPtCGkUFUZSrCqSEe1JBHSIdikAOPyXWoqWSMpvCtuTr7
 em5JZtnIwG38H5TynOfkjC+41SNkXv8e6YbfvYopRXhGL3HQq1dRRaAhzwcqeCIdfly+
 0veQ==
X-Gm-Message-State: AOAM531MFmztstdwMLgFpDui0qHdfFBwT3v1p2yhebrwAA0Sh2rKE2Ub
 B8bHMM8wtuyvRlw/LKt9Gk8=
X-Google-Smtp-Source: ABdhPJwoGHtGQ7e19/ifanrSR37U7sgfx1ePhQ9yHTJ5Quj/3sn448HDDTa5HMl5L8sl0Wza5fDXkQ==
X-Received: by 2002:a63:4b52:: with SMTP id k18mr3790275pgl.190.1621683843669; 
 Sat, 22 May 2021 04:44:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:d9c2:4477:9177:8c76])
 by smtp.googlemail.com with ESMTPSA id t25sm6459270pfl.68.2021.05.22.04.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 04:44:03 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: jaegeuk@kernel.org
Subject: [PATCH v2] f2fs: fix kernel-doc syntax and remove file name from file
 header
Date: Sat, 22 May 2021 17:13:51 +0530
Message-Id: <20210522114351.9538-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <d1e7aaa1-4f59-2480-003d-5a5a37443c75@infradead.org>
References: <d1e7aaa1-4f59-2480-003d-5a5a37443c75@infradead.org>
Cc: chao@kernel.org, yashsri421@gmail.com, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
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
The header for include/linux/f2fs_fs.h follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * include/linux/f2fs_fs.h

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Also remove the redundant file name from the comment headers.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2:
- Remove file name information from header comments, as suggested by Randy

 include/linux/f2fs_fs.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 5487a80617a3..b5a081aa86c4 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
- * include/linux/f2fs_fs.h
- *
+/*
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
  */
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
