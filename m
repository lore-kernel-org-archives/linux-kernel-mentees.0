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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADFBC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 12:11:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D587160235
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 12:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D587160235
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8919C607AF;
	Mon, 29 Mar 2021 12:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYuAikGGXMTq; Mon, 29 Mar 2021 12:11:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D329607A9;
	Mon, 29 Mar 2021 12:11:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78670C000C;
	Mon, 29 Mar 2021 12:11:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C515EC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 12:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1E6A40105
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 12:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7Tc17BqZX-h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 12:11:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C8D8400E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 12:11:02 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id w10so4950723pgh.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 05:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8rbrNA2DMWFVv62Fqnm4Yc2a4037zO3cB4baJDc6bEc=;
 b=qoSs0FMzNCVEbDg6NUQJg9n4d/xYpPF1W9NejWfJWh5K5dR0NxrUnigbJ+U98eVlvR
 q5Dh3O48xlqs9MgLbEmJXjPWj/p14/tfSchx6hwM8WUuRhI8d8dbv0capAwaXsnR94EZ
 KPt/1YKrybPEOjUuC0/4m1ddq9zrn7Sk8FgRoEr8UVHkCB1WK3Ro+5jAZnB8hjwaXopt
 jMGebC/DQn17C+vvObyNkOKMxzgXoFWj079sCBpgsrMgF3ra9AslzTM/TeVLJ7vSGDuE
 uThCqlWqAMSz+7jdLq60GagsIA0suOGRG/mVDw1KRJyP5m9FWZwHo3lhP6+61opllTi+
 cgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8rbrNA2DMWFVv62Fqnm4Yc2a4037zO3cB4baJDc6bEc=;
 b=JBrwhcsPap4bLQNjEmwJSfCB2O+7CSYDU0DpCblXBcCbSQXtiAGglDAQ6loUpbmSHU
 DPr/3X3JCNVfyRDRF1O5e9qypII98YncocoKlMRtYlMqdeZt4kb8h+mf9U9I8jPLIyv4
 aTBiHLSEvnS4bOAab2TwMRES3DLiHfTLHrS352GAsZ3yqh5gdA28A+vlhcnwCGUXm2bo
 a0fcAcjtjXKQfdcBHw0AGGfwqHgJqfNLyceU4hR8lS8asQVBOx/3jtUqVvlL+RgwkB1U
 DJATuwL8aq2DOJClEgew5LIds53AyaB7p4Rj9nH2G8R6U3hz7mfVQZYhaZr5sIJ6uINq
 j6xw==
X-Gm-Message-State: AOAM530f/zvlYpQgkKk+h5/LWHl5hVvgBmbNHH6dyxH/EVjDEwASiK5A
 KrmNRWnlyWSImlhI5xMgTso=
X-Google-Smtp-Source: ABdhPJyl85VK5ySg2j2c2AXwiguB6VVIepe85EWSVIu8DMrHzDo6vXI0+CLG6GUwDa7E1cR7IUUnSQ==
X-Received: by 2002:a05:6a00:7c5:b029:21d:2ea5:a684 with SMTP id
 n5-20020a056a0007c5b029021d2ea5a684mr24431242pfu.36.1617019861811; 
 Mon, 29 Mar 2021 05:11:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:4ed:8f53:adc7:b574])
 by smtp.googlemail.com with ESMTPSA id
 s17sm15012322pjn.44.2021.03.29.05.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 05:11:01 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] lib: fix incorrect kernel-doc comment syntax in file
Date: Mon, 29 Mar 2021 17:40:54 +0530
Message-Id: <20210329121054.20474-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, rdunlap@infradead.org, gustavoars@kernel.org,
 yashsri421@gmail.com, ojeda@kernel.org,
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
There are certain files in lib and lib/zstd, which follow this syntax,
but the content inside does not comply with kernel-doc.
Such lines were probably not meant for kernel-doc parsing, but are parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc.

E.g., presence of kernel-doc like comment in lib/zstd/compress.c at
header causes these warnings by kernel-doc:
"warning: cannot understand function prototype: 'const U32 g_searchStrength = 8;  '"

Similarly for other files too.

Provide a simple fix by replacing such occurrences with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 lib/win_minmax.c         | 2 +-
 lib/zstd/compress.c      | 2 +-
 lib/zstd/decompress.c    | 2 +-
 lib/zstd/error_private.h | 2 +-
 lib/zstd/mem.h           | 2 +-
 lib/zstd/zstd_common.c   | 2 +-
 lib/zstd/zstd_internal.h | 2 +-
 lib/zstd/zstd_opt.h      | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/win_minmax.c b/lib/win_minmax.c
index 6bdc1cd15f76..ec10506834b6 100644
--- a/lib/win_minmax.c
+++ b/lib/win_minmax.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * lib/minmax.c: windowed min/max tracker
  *
  * Kathleen Nichols' algorithm for tracking the minimum (or maximum)
diff --git a/lib/zstd/compress.c b/lib/zstd/compress.c
index b080264ed3ad..42604785c4f2 100644
--- a/lib/zstd/compress.c
+++ b/lib/zstd/compress.c
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
  * All rights reserved.
  *
diff --git a/lib/zstd/decompress.c b/lib/zstd/decompress.c
index 66cd487a326a..b28f10f21a6c 100644
--- a/lib/zstd/decompress.c
+++ b/lib/zstd/decompress.c
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
  * All rights reserved.
  *
diff --git a/lib/zstd/error_private.h b/lib/zstd/error_private.h
index 1a60b31f706c..f7dfa4a18f27 100644
--- a/lib/zstd/error_private.h
+++ b/lib/zstd/error_private.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
  * All rights reserved.
  *
diff --git a/lib/zstd/mem.h b/lib/zstd/mem.h
index 93d7a2c377fe..97d92eb431a5 100644
--- a/lib/zstd/mem.h
+++ b/lib/zstd/mem.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
  * All rights reserved.
  *
diff --git a/lib/zstd/zstd_common.c b/lib/zstd/zstd_common.c
index a282624ee155..ebf848c1f348 100644
--- a/lib/zstd/zstd_common.c
+++ b/lib/zstd/zstd_common.c
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
  * All rights reserved.
  *
diff --git a/lib/zstd/zstd_internal.h b/lib/zstd/zstd_internal.h
index dac753397f86..5f02411bded1 100644
--- a/lib/zstd/zstd_internal.h
+++ b/lib/zstd/zstd_internal.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
  * All rights reserved.
  *
diff --git a/lib/zstd/zstd_opt.h b/lib/zstd/zstd_opt.h
index 55e1b4cba808..b4a02b9f76d8 100644
--- a/lib/zstd/zstd_opt.h
+++ b/lib/zstd/zstd_opt.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2016-present, Przemyslaw Skibinski, Yann Collet, Facebook, Inc.
  * All rights reserved.
  *
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
