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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CAEC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 08:16:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DC6619B5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 08:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51DC6619B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10EBA4034B;
	Sat, 20 Mar 2021 08:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6sYwaBoSdK6; Sat, 20 Mar 2021 08:16:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B66D40348;
	Sat, 20 Mar 2021 08:16:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F1AAC000A;
	Sat, 20 Mar 2021 08:16:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19729C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 08:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA0B860727
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 08:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PE6vFNeAMROf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 08:16:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD97160726
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 08:16:01 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so9370094pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 01:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4vy1aMcR3fimLYV9+ZsVOuid4FN44Gd0gT+R621B+Uw=;
 b=ssJSnoWCzd8gD9ybCXBjYNfc82DVY/10RRlXc7xizp6QgSrwLzX/d021O6qwO37IFz
 eY9IvYEUM49QCtqJds1ZqnybZiHX/wTH69uqskAZJh5l3oE7UVwztXy+oLQ8hSZCfpZ1
 b4ta1OEiBsINgi/Dk3+7DFZlMbDXHvJjX8tOUpoPPQ1oYI/gKD+EkEceOn/jEJedaO1T
 Hfg8PakIc+vPhdEGUQA48GUiqKav2CmeqKCDeFD40q/lArfXNviJc8mlxot4Nd8+mUzc
 pxo+E+lpBKH3jKh1qo2opusHaOTFU8s7vFoTSE41OKot/2pBpVVmTldlFSfYqGoVCi0n
 0NrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4vy1aMcR3fimLYV9+ZsVOuid4FN44Gd0gT+R621B+Uw=;
 b=QRuMTd+5K76CjvJwDu6aLihZCDIUc0pQPI0jD+MkGMSF49osBoGj6mvbB1kn+sVkrB
 4/Sqqw3zoJiBw3NbRu96m7PfupKVUxjpLKGgKdZ6G9cRNt1ymTJNM9fJYo4oWgfnquNq
 W6o5mCVR8U4vLR+H9374TyCaqtGoZQLOt+BIvXIL52eOHw2fUNkDC3pCp6D+qM6nxRYe
 CHKI2BEsylnFypix99ZqoFelrevPIOrMIZDa1jToNmkBzpKefDr2gAIct8Cr47tRWJZL
 RKlYeaWGhrlNMoqV1/AgidIT+oH4zbvHjC6huNd903NzovjNeYsWKWdEREl0W2BHKrPZ
 YE5g==
X-Gm-Message-State: AOAM531bMvCCFFeBpwCe9EyD0vSYvt/7crCWBuXU8k9J5D+mJg+7o8V9
 OCqN2EfmmHXAso/y3uL1XQc=
X-Google-Smtp-Source: ABdhPJw3GR8zVb+vu6tHKI2Wkarip5L+OUxGtfyITidfvhyOEKOB5US/4pNBzdmC6ygSj4v/DNz34Q==
X-Received: by 2002:a17:902:9786:b029:e6:508a:7b8c with SMTP id
 q6-20020a1709029786b02900e6508a7b8cmr17705676plp.44.1616228161099; 
 Sat, 20 Mar 2021 01:16:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:1ce8:18d9:6e3d:8c29])
 by smtp.googlemail.com with ESMTPSA id 4sm7422117pjl.51.2021.03.20.01.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 01:16:00 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: code@tyhicks.com
Subject: [PATCH] ecryptfs: fix incorrect kernel-doc comment syntax in files
Date: Sat, 20 Mar 2021 13:45:51 +0530
Message-Id: <20210320081551.13954-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rdunlap@infradead.org, corbet@lwn.net, ecryptfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com,
 christian.brauner@ubuntu.com, linux-kernel-mentees@lists.linuxfoundation.org
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

The opening comment mark '/**' is used for kernel-doc comments.
There are files in fs/encrypts which follows this syntax, but the content
inside does not comply with kernel-doc.
This causes unexpected warnings from kernel-doc.

E.g., header comment for fs/ecryptfs/dentry.c follows kernel-doc syntax
for comments(i.e., '/**'), but the content inside does not.

Running kernel-doc -none on fs/ecryptfs/dentry.c causes these
unexpected warnings:
"warning: Incorrect use of kernel-doc format:  * ecryptfs_d_revalidate - revalidate an ecryptfs dentry"
"warning: Function parameter or member 'dentry' not described in 'ecryptfs_d_revalidate'"
"warning: Function parameter or member 'flags' not described in 'ecryptfs_d_revalidate'"
"warning: expecting prototype for eCryptfs(). Prototype was for ecryptfs_d_revalidate() instead"

Similarly for other files too.

Provide a simple fix by replacing such occurrences with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210312

 fs/ecryptfs/crypto.c          |  2 +-
 fs/ecryptfs/debug.c           |  2 +-
 fs/ecryptfs/dentry.c          |  2 +-
 fs/ecryptfs/ecryptfs_kernel.h |  2 +-
 fs/ecryptfs/file.c            |  2 +-
 fs/ecryptfs/inode.c           |  2 +-
 fs/ecryptfs/keystore.c        |  6 +++---
 fs/ecryptfs/kthread.c         |  2 +-
 fs/ecryptfs/main.c            | 10 +++++-----
 fs/ecryptfs/messaging.c       |  2 +-
 fs/ecryptfs/miscdev.c         |  2 +-
 fs/ecryptfs/mmap.c            |  6 +++---
 fs/ecryptfs/read_write.c      |  2 +-
 fs/ecryptfs/super.c           |  2 +-
 14 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 7671412b8f0b..48184ff65f90 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  *
  * Copyright (C) 1997-2004 Erez Zadok
diff --git a/fs/ecryptfs/debug.c b/fs/ecryptfs/debug.c
index 1f65e99f9a41..65702d7fc4b9 100644
--- a/fs/ecryptfs/debug.c
+++ b/fs/ecryptfs/debug.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  * Functions only useful for debugging.
  *
diff --git a/fs/ecryptfs/dentry.c b/fs/ecryptfs/dentry.c
index 44606f079efb..acaa0825e9bb 100644
--- a/fs/ecryptfs/dentry.c
+++ b/fs/ecryptfs/dentry.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  *
  * Copyright (C) 1997-2003 Erez Zadok
diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 4a62a7dcc4f5..f8aa99e41c48 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  * Kernel declarations.
  *
diff --git a/fs/ecryptfs/file.c b/fs/ecryptfs/file.c
index 5fb45d865ce5..2d8344774885 100644
--- a/fs/ecryptfs/file.c
+++ b/fs/ecryptfs/file.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  *
  * Copyright (C) 1997-2004 Erez Zadok
diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 18e9285fbb4c..541b46d76f89 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  *
  * Copyright (C) 1997-2004 Erez Zadok
diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 2abd219cfeec..475d939ff695 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  * In-kernel key management code.  Includes functions to parse and
  * write authentication token-related packets with the underlying
@@ -21,7 +21,7 @@
 #include <linux/slab.h>
 #include "ecryptfs_kernel.h"
 
-/**
+/*
  * request_key returned an error instead of a valid key address;
  * determine the type of error, make appropriate log entries, and
  * return an error code.
@@ -576,7 +576,7 @@ ecryptfs_find_auth_tok_for_sig(
 	return rc;
 }
 
-/**
+/*
  * write_tag_70_packet can gobble a lot of stack space. We stuff most
  * of the function's parameters in a kmalloc'd struct to help reduce
  * eCryptfs' overall stack usage.
diff --git a/fs/ecryptfs/kthread.c b/fs/ecryptfs/kthread.c
index a7c903cb01a0..d1b1c3546972 100644
--- a/fs/ecryptfs/kthread.c
+++ b/fs/ecryptfs/kthread.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  *
  * Copyright (C) 2008 International Business Machines Corp.
diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index cdf40a54a35d..9bc19a092917 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  *
  * Copyright (C) 1997-2003 Erez Zadok
@@ -24,7 +24,7 @@
 #include <linux/magic.h>
 #include "ecryptfs_kernel.h"
 
-/**
+/*
  * Module parameter that defines the ecryptfs_verbosity level.
  */
 int ecryptfs_verbosity = 0;
@@ -34,7 +34,7 @@ MODULE_PARM_DESC(ecryptfs_verbosity,
 		 "Initial verbosity level (0 or 1; defaults to "
 		 "0, which is Quiet)");
 
-/**
+/*
  * Module parameter that defines the number of message buffer elements
  */
 unsigned int ecryptfs_message_buf_len = ECRYPTFS_DEFAULT_MSG_CTX_ELEMS;
@@ -43,7 +43,7 @@ module_param(ecryptfs_message_buf_len, uint, 0);
 MODULE_PARM_DESC(ecryptfs_message_buf_len,
 		 "Number of message buffer elements");
 
-/**
+/*
  * Module parameter that defines the maximum guaranteed amount of time to wait
  * for a response from ecryptfsd.  The actual sleep time will be, more than
  * likely, a small amount greater than this specified value, but only less if
@@ -57,7 +57,7 @@ MODULE_PARM_DESC(ecryptfs_message_wait_timeout,
 		 "sleep while waiting for a message response from "
 		 "userspace");
 
-/**
+/*
  * Module parameter that is an estimate of the maximum number of users
  * that will be concurrently using eCryptfs. Set this to the right
  * value to balance performance and memory use.
diff --git a/fs/ecryptfs/messaging.c b/fs/ecryptfs/messaging.c
index c0dfd9647627..9f42fca7fc36 100644
--- a/fs/ecryptfs/messaging.c
+++ b/fs/ecryptfs/messaging.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  *
  * Copyright (C) 2004-2008 International Business Machines Corp.
diff --git a/fs/ecryptfs/miscdev.c b/fs/ecryptfs/miscdev.c
index 742ece22c1d4..7e741e36dfe7 100644
--- a/fs/ecryptfs/miscdev.c
+++ b/fs/ecryptfs/miscdev.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  *
  * Copyright (C) 2008 International Business Machines Corp.
diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
index 2f333a40ff4d..485f6c1e19b5 100644
--- a/fs/ecryptfs/mmap.c
+++ b/fs/ecryptfs/mmap.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  * This is where eCryptfs coordinates the symmetric encryption and
  * decryption of the file data as it passes between the lower
@@ -78,7 +78,7 @@ static void strip_xattr_flag(char *page_virt,
 	}
 }
 
-/**
+/*
  *   Header Extent:
  *     Octets 0-7:        Unencrypted file size (big-endian)
  *     Octets 8-15:       eCryptfs special marker
@@ -229,7 +229,7 @@ static int ecryptfs_readpage(struct file *file, struct page *page)
 	return rc;
 }
 
-/**
+/*
  * Called with lower inode mutex held.
  */
 static int fill_zeros_to_end_of_page(struct page *page, unsigned int to)
diff --git a/fs/ecryptfs/read_write.c b/fs/ecryptfs/read_write.c
index 0438997ac9d8..384b383b4a48 100644
--- a/fs/ecryptfs/read_write.c
+++ b/fs/ecryptfs/read_write.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  *
  * Copyright (C) 2007 International Business Machines Corp.
diff --git a/fs/ecryptfs/super.c b/fs/ecryptfs/super.c
index 6b1853f1c06a..cc16d044165d 100644
--- a/fs/ecryptfs/super.c
+++ b/fs/ecryptfs/super.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * eCryptfs: Linux filesystem encryption layer
  *
  * Copyright (C) 1997-2003 Erez Zadok
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
