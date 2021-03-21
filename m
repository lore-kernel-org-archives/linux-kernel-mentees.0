Return-Path: <SRS0=OT4g=IT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F27C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Mar 2021 12:30:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A56661944
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Mar 2021 12:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A56661944
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33123403E6;
	Sun, 21 Mar 2021 12:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id txZOnplzJ1of; Sun, 21 Mar 2021 12:30:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0C21403C8;
	Sun, 21 Mar 2021 12:30:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95ACEC000B;
	Sun, 21 Mar 2021 12:30:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 472E6C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 12:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3492C60766
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 12:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnZ2bhuqCBro
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 12:30:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BFEE606E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 12:30:21 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so9971200pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 05:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KfMzPZjWj4vEWxC64jkBmTku/Bg4RYDhn1mRma2jDt8=;
 b=hegytKpYdRSuP2KRtRXvnXoxRL6o5TUG6vOY4yeXASkte2gkTvZzYhTtSmPnxAq+v9
 9Hcn68jY5tETkaXali7jJZwmv0qJJ4qKDuqsQ8a/7ddrRCBVr6rqHtAjCCWEmMoSxQ8C
 xj4AvwuHiarQk0OF3AUhT21yIOgrguIaVndkjaXXDmonXpLrs+xulUoFFlHr7JvvfuqQ
 ag67lyTseGR3cQkkgmZO5w9Kb3IY4mII+7z3Mz3U8K+LLGglSTA5zny0fZLXhXRrIChW
 GDcrbjaL8URhLtnkfkr4BuqnJBntGZJ1y1NI4r8LA9fGb9CHVhb0KibU1KZ7Z6Jt34zb
 AAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KfMzPZjWj4vEWxC64jkBmTku/Bg4RYDhn1mRma2jDt8=;
 b=jpoWoqdVO9LVJIf0nud1sXECloElLzc0jHbTIaiBu/sEat1sdBzNchF6743le/759T
 gdUblRTIFwKCA4WGCEIGrgszfm/ShMTcfrMpAw9ZxnD/5ZygYugo1LP3h40QxuM5c1tp
 x6YuKiFBstkGYRv0yEiqR7oWEpSVx1EN4DN9iCVrA4TVInJ0G6pS7TJ8plsNfv89m2zs
 go2Q7OY6OHoisFz2KEcdsklccMsyBP5r/HrHC3fnVvSxWMsi7KBjuERG8NsIykjbFTme
 hridu53ZsghPvjok65Xe9705xfK25qcJsodlbYO9frHXi+CviNB6jVFTvMLc2CX6jwEJ
 qCUw==
X-Gm-Message-State: AOAM532sIjj64ZwU8BXOvsDkzvRMC3JBcl/eb67F7ywiIMCOiSpXDbh8
 WwMWfFjePPaBARAaBb1Tcgg=
X-Google-Smtp-Source: ABdhPJxrZpRtLJ/jkSAjBSxfQgEgy62uvjYCzEAtSUy2I9ELjZgwt4OUC4GFVa3L3gPwSN14gkfhNg==
X-Received: by 2002:a17:90a:8c08:: with SMTP id
 a8mr8252584pjo.136.1616329820543; 
 Sun, 21 Mar 2021 05:30:20 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:4cb7:d0cb:1241:5cf8])
 by smtp.googlemail.com with ESMTPSA id
 f135sm10627171pfa.102.2021.03.21.05.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 05:30:20 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: nx: fix incorrect kernel-doc comment syntax in files
Date: Sun, 21 Mar 2021 18:00:07 +0530
Message-Id: <20210321123007.15505-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: nayna@linux.ibm.com, herbert@gondor.apana.org.au, corbet@lwn.net,
 mpe@ellerman.id.au, rdunlap@infradead.org, linuxppc-dev@lists.ozlabs.org,
 yashsri421@gmail.com, pfsmorigo@gmail.com, linux-crypto@vger.kernel.org,
 benh@kernel.crashing.org, leitao@debian.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 paulus@samba.org
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
There are certain files in drivers/crypto/nx, which follow this syntax,
but the content inside does not comply with kernel-doc.
Such lines were probably not meant for kernel-doc parsing, but are parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc.

E.g., presence of kernel-doc like comment in the header lines for
drivers/crypto/nx/nx-sha256.c at header causes these warnings:
"warning: Function parameter or member 'tfm' not described in 'nx_crypto_ctx_sha256_init'"
"warning: expecting prototype for SHA(). Prototype was for nx_crypto_ctx_sha256_init() instead"

Similarly for other files too.

Provide a simple fix by replacing such occurrences with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210319

 drivers/crypto/nx/nx-aes-cbc.c  | 2 +-
 drivers/crypto/nx/nx-aes-ccm.c  | 2 +-
 drivers/crypto/nx/nx-aes-ctr.c  | 2 +-
 drivers/crypto/nx/nx-aes-ecb.c  | 2 +-
 drivers/crypto/nx/nx-aes-gcm.c  | 2 +-
 drivers/crypto/nx/nx-aes-xcbc.c | 2 +-
 drivers/crypto/nx/nx-sha256.c   | 2 +-
 drivers/crypto/nx/nx-sha512.c   | 2 +-
 drivers/crypto/nx/nx.c          | 2 +-
 drivers/crypto/nx/nx_debugfs.c  | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/crypto/nx/nx-aes-cbc.c b/drivers/crypto/nx/nx-aes-cbc.c
index 92e921eceed7..d6314ea9ae89 100644
--- a/drivers/crypto/nx/nx-aes-cbc.c
+++ b/drivers/crypto/nx/nx-aes-cbc.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES CBC routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2011-2012 International Business Machines Inc.
diff --git a/drivers/crypto/nx/nx-aes-ccm.c b/drivers/crypto/nx/nx-aes-ccm.c
index 4c9362eebefd..e7384d107573 100644
--- a/drivers/crypto/nx/nx-aes-ccm.c
+++ b/drivers/crypto/nx/nx-aes-ccm.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES CCM routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2012 International Business Machines Inc.
diff --git a/drivers/crypto/nx/nx-aes-ctr.c b/drivers/crypto/nx/nx-aes-ctr.c
index 6d5ce1a66f1e..13f518802343 100644
--- a/drivers/crypto/nx/nx-aes-ctr.c
+++ b/drivers/crypto/nx/nx-aes-ctr.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES CTR routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2011-2012 International Business Machines Inc.
diff --git a/drivers/crypto/nx/nx-aes-ecb.c b/drivers/crypto/nx/nx-aes-ecb.c
index 77e338dc33f1..7a729dc2bc17 100644
--- a/drivers/crypto/nx/nx-aes-ecb.c
+++ b/drivers/crypto/nx/nx-aes-ecb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES ECB routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2011-2012 International Business Machines Inc.
diff --git a/drivers/crypto/nx/nx-aes-gcm.c b/drivers/crypto/nx/nx-aes-gcm.c
index 19c6ed5baea4..fc9baca13920 100644
--- a/drivers/crypto/nx/nx-aes-gcm.c
+++ b/drivers/crypto/nx/nx-aes-gcm.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES GCM routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2012 International Business Machines Inc.
diff --git a/drivers/crypto/nx/nx-aes-xcbc.c b/drivers/crypto/nx/nx-aes-xcbc.c
index 48dc1c98ca52..eb5c8f689360 100644
--- a/drivers/crypto/nx/nx-aes-xcbc.c
+++ b/drivers/crypto/nx/nx-aes-xcbc.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES XCBC routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2011-2012 International Business Machines Inc.
diff --git a/drivers/crypto/nx/nx-sha256.c b/drivers/crypto/nx/nx-sha256.c
index 90d9a37a57f6..b0ad665e4bda 100644
--- a/drivers/crypto/nx/nx-sha256.c
+++ b/drivers/crypto/nx/nx-sha256.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * SHA-256 routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2011-2012 International Business Machines Inc.
diff --git a/drivers/crypto/nx/nx-sha512.c b/drivers/crypto/nx/nx-sha512.c
index eb8627a0f317..c29103a1a0b6 100644
--- a/drivers/crypto/nx/nx-sha512.c
+++ b/drivers/crypto/nx/nx-sha512.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * SHA-512 routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2011-2012 International Business Machines Inc.
diff --git a/drivers/crypto/nx/nx.c b/drivers/crypto/nx/nx.c
index 1d0e8a1ba160..13bb705ba6a4 100644
--- a/drivers/crypto/nx/nx.c
+++ b/drivers/crypto/nx/nx.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2011-2012 International Business Machines Inc.
diff --git a/drivers/crypto/nx/nx_debugfs.c b/drivers/crypto/nx/nx_debugfs.c
index 1975bcbee997..ee7cd88bb10a 100644
--- a/drivers/crypto/nx/nx_debugfs.c
+++ b/drivers/crypto/nx/nx_debugfs.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * debugfs routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2011-2012 International Business Machines Inc.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
