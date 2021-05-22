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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169D6C2B9FB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 11:34:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CEE761261
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 11:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CEE761261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58B1D6064C;
	Sat, 22 May 2021 11:34:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xysmO-hx-ket; Sat, 22 May 2021 11:34:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7861660656;
	Sat, 22 May 2021 11:34:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58F66C000E;
	Sat, 22 May 2021 11:34:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75801C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59FBB60656
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YglZbp2L3td5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:34:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4F3A6064C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 11:34:18 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id d78so16016126pfd.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 04:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bgUWkCDqcn8rn8EVjMGY9qbgt9aD2gR/He6gdEJMpaA=;
 b=pNob/g57qUIhlmbaSaWjftxJsLdRX4guzY0/tekGisr5kdZH8dT32tbVeBhxfXK12Y
 iI3Zh6iMREvBlC5tQMVoNjIK4ti3MweQRtWy6tlpp3vUGfVvVf3VtdWAEKXwgrDTn2Te
 WgRgnYdMgzuCsqO+wfZRL7dDgLglQ6GVEkBRC4yOAkdo1py5KEDhv35Z8F346Qummq+w
 rv11gAi2U4PrgJp23JtyyfAbPZNGLpC+m5ZMEvNse/uIAPEZeFMO2FVAV1Hg1FO9GNP6
 0lw9fJAOqcfN2gB37Wvx4/Hb/s9pRUlfU9wJ0ViyxmqOfG6oSgKEy59EdTRvPJDG784e
 9evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bgUWkCDqcn8rn8EVjMGY9qbgt9aD2gR/He6gdEJMpaA=;
 b=bzLgEykZ04l0ds/Ru4sd+G1tlGD/yAOqZsjfFidnxnnra/xQTnAXXD7LPsPZoaXPMF
 xfLgdIL6leon/AZVfnxJXsyIkGbiH0LA1HVZZnRkos3P5EwUTxfFspP9vLv6apFpSa36
 3xsSKIS9Y9W8n6hTR515E5UosCkVZ7pQMKrMgx8naExCVk6Gq+s4bhRHD//sj2sa51N8
 L3+EbHLz4nX2Xgl7flwcZF++HnIDZOhRiLBxDdW9bSVs/eI3mBbEGsdt0W3wORdoMDeE
 4cS9MYn0S6TKeZxj1A6VSAuKxdwKWJocHv8USVozWiTeVF0RAofGFtrxEVwj9/o0jlQN
 bKRQ==
X-Gm-Message-State: AOAM530fwocr1OOqJcGPHwwOk/W3wSifDAG8YffJAHe8A4MO9s6Hupak
 965bhK1JQKEUllbmQgO/9Xo=
X-Google-Smtp-Source: ABdhPJyVa8KNBd5sjjDaXi6GuW9UOGFzXNj+COS9vwf/JLmc+QdQDZIr3G0RDT/SlS6dZQyBsGz0Hw==
X-Received: by 2002:a62:7e41:0:b029:249:287:3706 with SMTP id
 z62-20020a627e410000b029024902873706mr14472123pfc.76.1621683258045; 
 Sat, 22 May 2021 04:34:18 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:d9c2:4477:9177:8c76])
 by smtp.googlemail.com with ESMTPSA id
 d131sm6530491pfd.176.2021.05.22.04.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 04:34:17 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: courmisch@gmail.com
Subject: [PATCH v2] Phonet: fix kernel-doc syntax in file headers and remove
 file names
Date: Sat, 22 May 2021 17:04:08 +0530
Message-Id: <20210522113408.8766-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <52313028.m8L9TnScQ9@philogene>
References: <52313028.m8L9TnScQ9@philogene>
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
For e.g., the header for include/linux/phonet.h follows this syntax, but
the content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * file phonet.h

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Also remove the redundant file name from the comment headers.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2:
- Remove file name information from comment headers as well, as suggested by Randy and Remi

 include/linux/phonet.h      | 4 +---
 include/uapi/linux/phonet.h | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/phonet.h b/include/linux/phonet.h
index bc7d1e529efc..6117a0e462d3 100644
--- a/include/linux/phonet.h
+++ b/include/linux/phonet.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
- * file phonet.h
- *
+/*
  * Phonet sockets kernel interface
  *
  * Copyright (C) 2008 Nokia Corporation. All rights reserved.
diff --git a/include/uapi/linux/phonet.h b/include/uapi/linux/phonet.h
index a2f6b37a5937..e7e14b5e59c6 100644
--- a/include/uapi/linux/phonet.h
+++ b/include/uapi/linux/phonet.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/**
- * file phonet.h
- *
+/*
  * Phonet sockets kernel interface
  *
  * Copyright (C) 2008 Nokia Corporation. All rights reserved.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
