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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B15C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 20:25:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D2EF61934
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 20:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D2EF61934
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12BCD401E9;
	Sat, 20 Mar 2021 20:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v737ePgJInqz; Sat, 20 Mar 2021 20:25:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CA3A401A4;
	Sat, 20 Mar 2021 20:25:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A5DCC000A;
	Sat, 20 Mar 2021 20:25:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70011C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 20:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A18F60703
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 20:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xURX4SYIPGxo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 20:25:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A97D4605E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 20:25:39 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so9696212pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 13:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vgEHWfJxSnMvNGltZK35bv4lE0nxYTmBjGCCpSZ2qwE=;
 b=B3AQK37gdKNg75CyXMf9iaXlGL9RQhcnBKwEe3Lieo2WwIYNmzGlinRadiAHCpxnc0
 sct6SsVizPmtD0Wz13XUBxHWj29/ihjOzNHPe4vJiFdv+PuZ9wfPxtoMwhHdVCGWAzVp
 ZSQfzus9F+FSLPgr9VCMTCJxxfOWtfmHHWSFicAV61A9v13xWEGqkYXMhlxOGF3l+jcj
 0dtIy+0LVKzVOzD7uBiQQvtz1hK6bEW3K2sBNtsa1cyQIrv2cAQDFgzdEnIFWfc67xoC
 p6PVv4It8kFPdjLMT2sk7c6yxlqJfZCBf5iH0iyF12uz8TEv82fw0JvSqY7bUq6bDFCP
 2sHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vgEHWfJxSnMvNGltZK35bv4lE0nxYTmBjGCCpSZ2qwE=;
 b=eIg7gjk8HxSekRjpb/68cQfmk21/5kRS0KcTpCTH+paS7lZrznQdQjZcscLfyzRbqt
 5Te3fZncn3gPtiUNuYciPg670tjNb9OSE2mzkHAf/ENZPANrvjdghaAMMlC0j+l2W33z
 cfwMudaNJDXHDWKjMmv3W4HAh3CTnMHKj2VzUUgLWYLdgzE2YUzPnxGD0E21JqiOtkku
 f/zd/Cx7LyYLO+/K5I78gqQFtR29e/ZSBqFeYRrqE+vREna8UoHQdOwyV3o2YvggyTuH
 oXKhwRW6ju9R7Z4y+DX7M2AdSjgoRGZoPlm0q8/EIFMA0DCNJzyajzZdk1qIrQZf2t7F
 ma6A==
X-Gm-Message-State: AOAM532RjxZeRfnKqggILE/yrLOXXvOTqKO810iSXJ4K8nCfDvWH+yra
 oczIfPxu75STNb1GgZEjrrs=
X-Google-Smtp-Source: ABdhPJxXOY21EFvd4PI13TZ0reKzvM6BOPt4J0kTB4D7tg4zVYP2zKz48Khz54lVG1zBdJH1yR0q5w==
X-Received: by 2002:a17:90a:b63:: with SMTP id
 90mr5085668pjq.124.1616271938959; 
 Sat, 20 Mar 2021 13:25:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:1ce8:18d9:6e3d:8c29])
 by smtp.googlemail.com with ESMTPSA id t1sm9252938pfc.173.2021.03.20.13.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 13:25:38 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: leitao@debian.org
Subject: [PATCH] crypto: vmx: fix incorrect kernel-doc comment syntax in files
Date: Sun, 21 Mar 2021 01:55:25 +0530
Message-Id: <20210320202525.12562-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rdunlap@infradead.org, herbert@gondor.apana.org.au, corbet@lwn.net,
 mpe@ellerman.id.au, nayna@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com, pfsmorigo@gmail.com,
 linux-crypto@vger.kernel.org, benh@kernel.crashing.org,
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
There are certain files in drivers/crypto/vmx, which follow this syntax,
but the content inside does not comply with kernel-doc.
Such lines were probably not meant for kernel-doc parsing, but are parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc.

E.g., presence of kernel-doc like comment in the header line for
drivers/crypto/vmx/vmx.c causes this warning by kernel-doc:

"warning: expecting prototype for Routines supporting VMX instructions on the Power 8(). Prototype was for p8_init() instead"

Similarly for other files too.

Provide a simple fix by replacing such occurrences with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210319

 drivers/crypto/vmx/aes.c     | 2 +-
 drivers/crypto/vmx/aes_cbc.c | 2 +-
 drivers/crypto/vmx/aes_ctr.c | 2 +-
 drivers/crypto/vmx/aes_xts.c | 2 +-
 drivers/crypto/vmx/ghash.c   | 2 +-
 drivers/crypto/vmx/vmx.c     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/vmx/aes.c b/drivers/crypto/vmx/aes.c
index d05c02baebcf..ec06189fbf99 100644
--- a/drivers/crypto/vmx/aes.c
+++ b/drivers/crypto/vmx/aes.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES routines supporting VMX instructions on the Power 8
  *
  * Copyright (C) 2015 International Business Machines Inc.
diff --git a/drivers/crypto/vmx/aes_cbc.c b/drivers/crypto/vmx/aes_cbc.c
index d88084447f1c..ed0debc7acb5 100644
--- a/drivers/crypto/vmx/aes_cbc.c
+++ b/drivers/crypto/vmx/aes_cbc.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES CBC routines supporting VMX instructions on the Power 8
  *
  * Copyright (C) 2015 International Business Machines Inc.
diff --git a/drivers/crypto/vmx/aes_ctr.c b/drivers/crypto/vmx/aes_ctr.c
index 79ba062ee1c1..9a3da8cd62f3 100644
--- a/drivers/crypto/vmx/aes_ctr.c
+++ b/drivers/crypto/vmx/aes_ctr.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES CTR routines supporting VMX instructions on the Power 8
  *
  * Copyright (C) 2015 International Business Machines Inc.
diff --git a/drivers/crypto/vmx/aes_xts.c b/drivers/crypto/vmx/aes_xts.c
index 9fee1b1532a4..dabbccb41550 100644
--- a/drivers/crypto/vmx/aes_xts.c
+++ b/drivers/crypto/vmx/aes_xts.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES XTS routines supporting VMX In-core instructions on Power 8
  *
  * Copyright (C) 2015 International Business Machines Inc.
diff --git a/drivers/crypto/vmx/ghash.c b/drivers/crypto/vmx/ghash.c
index 14807ac2e3b9..5bc5710a6de0 100644
--- a/drivers/crypto/vmx/ghash.c
+++ b/drivers/crypto/vmx/ghash.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * GHASH routines supporting VMX instructions on the Power 8
  *
  * Copyright (C) 2015, 2019 International Business Machines Inc.
diff --git a/drivers/crypto/vmx/vmx.c b/drivers/crypto/vmx/vmx.c
index a40d08e75fc0..7eb713cc87c8 100644
--- a/drivers/crypto/vmx/vmx.c
+++ b/drivers/crypto/vmx/vmx.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Routines supporting VMX instructions on the Power 8
  *
  * Copyright (C) 2015 International Business Machines Inc.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
