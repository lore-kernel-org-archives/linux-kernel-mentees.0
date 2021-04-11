Return-Path: <SRS0=6b0c=JI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBCAC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Apr 2021 10:15:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 928A86108F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Apr 2021 10:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 928A86108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5647740324;
	Sun, 11 Apr 2021 10:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6S7AKYQmFia; Sun, 11 Apr 2021 10:15:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5873040323;
	Sun, 11 Apr 2021 10:15:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38576C000C;
	Sun, 11 Apr 2021 10:15:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26383C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Apr 2021 10:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 159C5834E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Apr 2021 10:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3iHvU6_Q6JPG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Apr 2021 10:15:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD23D834BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Apr 2021 10:15:18 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id y32so7113217pga.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Apr 2021 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tALxIC5C2ozJfWNsDIYTLsxHNEVLmhYGZfg3+tBvepQ=;
 b=pcIwI9/JrMck4W4DyRDkp3q5nIlxzt8vlMTzsb4ZuZfUu2HW7qYsKh4YsHn2GU7Uxs
 J4MWVT7NgjfDG0Z0+Zcfd9H+wPqPiAbX0oZOFeW2q2JVsT3ajbtW6QxAanNcZe9yW7Ap
 Pv8sR+m+ov9i5cR3/CGWJP5/khXkXQgX/ODfwhfROMUV3EIG+JSKju0TNt+IWxJ3SpKw
 W9IqrvNnyDJ3FffeZPgqZMSMUis84bVdIFl9ax4lyOQokVw5k/7tvPTbkvJ+M77Z9b0G
 m5oiCTa0LSFklMyWx2l/e0beJ1xaF8JYzg4R/P50/fGK/IlUK/JY6ZH63iUOgQRqW7+8
 BZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tALxIC5C2ozJfWNsDIYTLsxHNEVLmhYGZfg3+tBvepQ=;
 b=kw6yazuofJT1AWA8h0tAJeVQxPpVI9r8kXMYEFE+0qq8omtUqLN8TEZRrZ/kTxmaHL
 DSqDGFZ63t2vZM2Nh1UeySiorgyk9+XubtYCaNVbJtJ8fLTbVf0ghMf9xE4v9/wXSAUm
 wF+95veOdWXZ/XScZEh/QGbPdS3nJEXU3hAStFUM+yhbrLtRTPBEN1/DiismrkEKYrn+
 x05SUAzmV3pgg8AuG39NPC76qknMBC7WVyJovjic7HP/tRoLWjidR8YB83OBP3b+4HTM
 PkFnJWHmLqxRhBKZlVPU8oemcB5UzVW5yCwkMjz1RypIEnsqmldx0QEqzEcE2yWhkDrX
 CFzA==
X-Gm-Message-State: AOAM533xnV7IWkFFbzXvaza7TFXGO/NfL0BBKRoLEKrWn3D54RyJHLzJ
 tnVeHK7hRzlH1bv0UoAWTds=
X-Google-Smtp-Source: ABdhPJyqFYfuQYsq+4KmXf9iSGWkrm32tlH3p1ISbSyLvgz7MrM9S4IT6ni5rF1Gyc8xmC2hqi8JvQ==
X-Received: by 2002:a63:6a41:: with SMTP id f62mr21043660pgc.428.1618136117998; 
 Sun, 11 Apr 2021 03:15:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:d8d9:c3e6:7914:c3d2])
 by smtp.googlemail.com with ESMTPSA id gk20sm7607472pjb.17.2021.04.11.03.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 03:15:17 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH] PCI: endpoint: fix incorrect kernel-doc comment syntax
Date: Sun, 11 Apr 2021 15:45:08 +0530
Message-Id: <20210411101508.11065-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, rdunlap@infradead.org,
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
There are certain files in include/linux/pci*, which follow this syntax,
but the content inside does not comply with kernel-doc.
Such lines were probably not meant for kernel-doc parsing, but are parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc.

E.g., presence of kernel-doc like comment in include/linux/pci-ep-cfs.h at
header causes this warnings by kernel-doc:
"warning: expecting prototype for PCI Endpoint ConfigFS header file(). Prototype was for __LINUX_PCI_EP_CFS_H() instead"

Similarly for other files too.

Provide a simple fix by replacing such occurrences with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 include/linux/pci-ep-cfs.h | 2 +-
 include/linux/pci-epc.h    | 2 +-
 include/linux/pci-epf.h    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/pci-ep-cfs.h b/include/linux/pci-ep-cfs.h
index 662881335c7e..3e2140d7e31d 100644
--- a/include/linux/pci-ep-cfs.h
+++ b/include/linux/pci-ep-cfs.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
-/**
+/*
  * PCI Endpoint ConfigFS header file
  *
  * Copyright (C) 2017 Texas Instruments
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index b82c9b100e97..80197a6df371 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
  * PCI Endpoint *Controller* (EPC) header file
  *
  * Copyright (C) 2017 Texas Instruments
diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
index 6833e2160ef1..c43912b1d2d0 100644
--- a/include/linux/pci-epf.h
+++ b/include/linux/pci-epf.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
  * PCI Endpoint *Function* (EPF) header file
  *
  * Copyright (C) 2017 Texas Instruments
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
