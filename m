Return-Path: <SRS0=sDOq=IS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FA8C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 16:29:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FE7F61934
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 16:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FE7F61934
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36C0F60763;
	Sat, 20 Mar 2021 16:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8VijF6HqpUg; Sat, 20 Mar 2021 16:29:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 351A36067A;
	Sat, 20 Mar 2021 16:29:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F9BFC000A;
	Sat, 20 Mar 2021 16:29:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D2A7C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 16:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4412F8354D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 16:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BjQL-wjAEsVa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 16:29:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 931A28354B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 16:29:53 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id m3so5771706pga.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=adNz31gWLDJnKipBeS3psUT6pbf5Zn26UZ0xNc92lTo=;
 b=TNpz7CbfJPuFdmN4VA992lMaDYNJykgyhtqf/5uhRP2+eduMul71GumqKkoUNwFjh4
 SEyiKB1bIn2GbTYdGLLL3knNSZN8HhvAEXlRsTsJDYQEdeNJmb8FhJI6jXLY7SC1yraH
 NtBeDCVHu38Z1vemyDnE31S7cF+aaUgdYpfFH34+6W7HWkK/HOir6uGtQZCJrW9G8VAu
 /tG/umOGx8LEzZFIDKvk59axJjk/liW2PW/z0gGSPPiKTC1z0NVXWgv17o0meZNsH0i8
 T6/VB1yOlk0/5MvAuyqwmcrsztqXpEsKu0v61dGwoIkbrNmuu18AzYsmRgEoVSvGcbvd
 nBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=adNz31gWLDJnKipBeS3psUT6pbf5Zn26UZ0xNc92lTo=;
 b=OqhPcxMrrhGdiRjPD7vR927CovPfF4S/IwcXzokyXrfrYyZWi1L1N7SX88griSmYtB
 XHC6ZBFCVZU6dYFNRbFNTAQe/B2sEoacGohfR+Fkqmsl2KcXM/WvieHRSE2WZAjkL6xS
 SBTnzkJiepRD5mvtR7zbetJt+L1VUpWS6kefWfJ3dIPDhlfbPUnyw5iqpduHLp8RNIc7
 WOnPJkfNrleWMmNWcxAihhefOAsksS/KW0XXivNM432vPjhyp64sTEtml0Q0oJYiMFdr
 IzEkmFRiZu9NAePpmfsQeWDDuBToYyvOEuYlGEjmAiUUsBTRcCkuNir0qW/RJKaIevH6
 AdPg==
X-Gm-Message-State: AOAM531jh5WiXhMCsCSLZ8HZ1draX8dR/obtw7sU5n2++Uo7VPFmMrt8
 SHC/8lqECl8XEDVrm/Wg28E=
X-Google-Smtp-Source: ABdhPJwhFZI6DBOYuVPsCROsir8j232Inr//PlcZIV9IdgideHzoqzYTiofrr6egsD7vPMo8bVQh1Q==
X-Received: by 2002:a63:356:: with SMTP id 83mr419552pgd.344.1616257792925;
 Sat, 20 Mar 2021 09:29:52 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:1ce8:18d9:6e3d:8c29])
 by smtp.googlemail.com with ESMTPSA id 2sm8740919pfi.116.2021.03.20.09.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 09:29:52 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: anton@tuxera.com
Subject: [PATCH] ntfs: fix incorrect kernel-doc comment syntax in files
Date: Sat, 20 Mar 2021 21:59:39 +0530
Message-Id: <20210320162939.32707-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rdunlap@infradead.org, corbet@lwn.net, linux-ntfs-dev@lists.sourceforge.net,
 yashsri421@gmail.com, linux-kernel@vger.kernel.org,
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
There are certain files in fs/ntfs which follow this syntax, but the
content inside does not comply with kernel-doc.
Such lines were probably not meant for kernel-doc parsing, but are parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc.

E.g., presence of kernel-doc like comment in the header for
fs/ntfs/attrib.c, causes these unexpected warnings by kernel-doc:
"warning: Incorrect use of kernel-doc format:  * ntfs_map_runlist_nolock - map (a part of) a runlist of an ntfs inode"
"warning: Function parameter or member 'ni' not described in 'ntfs_map_runlist_nolock'"
"warning: Function parameter or member 'vcn' not described in 'ntfs_map_runlist_nolock'"
"warning: Function parameter or member 'ctx' not described in 'ntfs_map_runlist_nolock'"
"warning: expecting prototype for c(). Prototype was for ntfs_map_runlist_nolock() instead"

Similarly for other files too.

Provide a simple fix by replacing such occurrences with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210319

 fs/ntfs/aops.c     | 2 +-
 fs/ntfs/aops.h     | 2 +-
 fs/ntfs/attrib.c   | 2 +-
 fs/ntfs/compress.c | 8 ++++----
 fs/ntfs/dir.c      | 4 ++--
 fs/ntfs/inode.c    | 2 +-
 fs/ntfs/mft.c      | 2 +-
 fs/ntfs/runlist.c  | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
index bb0a43860ad2..1024cdec136a 100644
--- a/fs/ntfs/aops.c
+++ b/fs/ntfs/aops.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * aops.c - NTFS kernel address space operations and page cache handling.
  *
  * Copyright (c) 2001-2014 Anton Altaparmakov and Tuxera Inc.
diff --git a/fs/ntfs/aops.h b/fs/ntfs/aops.h
index f0962d46bd67..2dcd46befdff 100644
--- a/fs/ntfs/aops.h
+++ b/fs/ntfs/aops.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-/**
+/*
  * aops.h - Defines for NTFS kernel address space operations and page cache
  *	    handling.  Part of the Linux-NTFS project.
  *
diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index d563abc3e136..2911c04a33e0 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * attrib.c - NTFS attribute operations.  Part of the Linux-NTFS project.
  *
  * Copyright (c) 2001-2012 Anton Altaparmakov and Tuxera Inc.
diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index d2f9d6a0ee32..014dbd079ad5 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * compress.c - NTFS kernel compressed attributes handling.
  *		Part of the Linux-NTFS project.
  *
@@ -18,7 +18,7 @@
 #include "debug.h"
 #include "ntfs.h"
 
-/**
+/*
  * ntfs_compression_constants - enum of constants used in the compression code
  */
 typedef enum {
@@ -41,12 +41,12 @@ typedef enum {
 	NTFS_MAX_CB_SIZE	= 64 * 1024,
 } ntfs_compression_constants;
 
-/**
+/*
  * ntfs_compression_buffer - one buffer for the decompression engine
  */
 static u8 *ntfs_compression_buffer;
 
-/**
+/*
  * ntfs_cb_lock - spinlock which protects ntfs_compression_buffer
  */
 static DEFINE_SPINLOCK(ntfs_cb_lock);
diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index cd96083a12c8..518c3a21a556 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * dir.c - NTFS kernel directory operations. Part of the Linux-NTFS project.
  *
  * Copyright (c) 2001-2007 Anton Altaparmakov
@@ -17,7 +17,7 @@
 #include "debug.h"
 #include "ntfs.h"
 
-/**
+/*
  * The little endian Unicode string $I30 as a global constant.
  */
 ntfschar I30[5] = { cpu_to_le16('$'), cpu_to_le16('I'),
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index f5c058b3192c..4277d0fd7d88 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * inode.c - NTFS kernel inode handling.
  *
  * Copyright (c) 2001-2014 Anton Altaparmakov and Tuxera Inc.
diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 0d62cd5bb7f8..d197d402933a 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * mft.c - NTFS kernel mft record operations. Part of the Linux-NTFS project.
  *
  * Copyright (c) 2001-2012 Anton Altaparmakov and Tuxera Inc.
diff --git a/fs/ntfs/runlist.c b/fs/ntfs/runlist.c
index 97932fb5179c..0d448e9881f7 100644
--- a/fs/ntfs/runlist.c
+++ b/fs/ntfs/runlist.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * runlist.c - NTFS runlist handling code.  Part of the Linux-NTFS project.
  *
  * Copyright (c) 2001-2007 Anton Altaparmakov
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
