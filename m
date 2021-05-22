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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F127C2B9FB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 12:20:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96D686128A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 12:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96D686128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 568D6402D4;
	Sat, 22 May 2021 12:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGRxzLiuaP5B; Sat, 22 May 2021 12:20:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29DBD4029A;
	Sat, 22 May 2021 12:20:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 133A5C000D;
	Sat, 22 May 2021 12:20:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8E5AC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 12:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7E6A402D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 12:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LFuOVdh2_Dpg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 12:19:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C6D44029A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 12:19:58 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso8370238pjx.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 05:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hIV8EDbMmCN8KJbthhTgUYXX854FbNW5ORmyIMd/TCU=;
 b=TXuk5PaTbqbVchbt02kcbrBC0GDveMFebGMhRJzuPdUIH62CvOj4SpVkXc9b7LNpgX
 kI8kzdn+/Ce4AGlLZIDgkIgMP0o9/AuDmB9b4BJimU9k4RtfWBnfBsjD4anAw5jyo+aw
 mytxyrSAD3ycHMvIHeiydy/HCm0nzC5VhzBM2BrZ6jWaKJNNKNt9yIjteQt2WF7M3oRM
 BzoejR5NSm93dNBgeXA5VEyTV+JAAUg5hrkkZ2cQADmKvsKPRBwahSXb3hRNcY4/bAdS
 cSXNXkrWiJnSRDGPvivL9AcG51U+6ZgkHUAPSJgOP4IiSeAfsM1D1FriBbPnUVG09+Z3
 FEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hIV8EDbMmCN8KJbthhTgUYXX854FbNW5ORmyIMd/TCU=;
 b=I0g6DBGQ78zel0ewvR4cv4Y7dHLM+JvkjW67Pyqb5mpn+GAaTjnZ14bzcUCrm3WeNv
 A6IfprewlXYgDdgEvLp7PVPDVWyTZ7/NbXulT6l7dxtdDx3QXC9IbnGfN9nSzYOrFYfN
 S3Bi5iEgeIDqkSF5xo2DMheYpI6m8ICSheIYJaOd5DcuZ36i8Ez5g+ctexLVdaNrXuiO
 PiCA+isvbw+VijnTdCHVGKGY0ETvzRqPjxi/XSjMon2nEm9HcA67EN/5feqEpGb6Viqj
 n0z4EmfK8Po8Cy4UnaR5FeOpvmoblo7jMLUqC7AVhm4agR6jObpT99wxAOHZz8HRbRkg
 QB/A==
X-Gm-Message-State: AOAM532UdCSp6TgzZ4WF0ybLRuZ3ip5/CQCqNUljzcSTTK48/rQhYIVK
 T/Q0ZexH2YV1xX3qoqmi/Uo=
X-Google-Smtp-Source: ABdhPJzXIf0ow7VfJ33E3E6pz3x4L8UegaDBVhHmjb2taTs2wjE8bH3RqCcZF2EVDAS4LS/a37hqHQ==
X-Received: by 2002:a17:90a:6782:: with SMTP id
 o2mr13524175pjj.1.1621685997896; 
 Sat, 22 May 2021 05:19:57 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:d9c2:4477:9177:8c76])
 by smtp.googlemail.com with ESMTPSA id 23sm6057515pfn.192.2021.05.22.05.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 05:19:57 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: siglesias@igalia.com
Subject: [PATCH] ipac: ipoctal: fix kernel-doc syntax and remove filename from
 file headers
Date: Sat, 22 May 2021 17:49:44 +0530
Message-Id: <20210522121944.11182-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, rdunlap@infradead.org,
 jens.taprogge@taprogge.org, linux-kernel@vger.kernel.org, yashsri421@gmail.com,
 industrypack-devel@lists.sourceforge.net,
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
The header for drivers/ipack/devices/ipoctal follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc.

For e.g., running scripts/kernel-doc -none on
drivers/ipack/devices/ipoctal.h emits:
warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * ipoctal.h

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Also remove the redundant file name from the comment headers.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/ipack/devices/ipoctal.c | 4 +---
 drivers/ipack/devices/ipoctal.h | 6 ++----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/ipack/devices/ipoctal.c b/drivers/ipack/devices/ipoctal.c
index 3940714e4397..2a3a94f72dfb 100644
--- a/drivers/ipack/devices/ipoctal.c
+++ b/drivers/ipack/devices/ipoctal.c
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
- * ipoctal.c
- *
+/*
  * driver for the GE IP-OCTAL boards
  *
  * Copyright (C) 2009-2012 CERN (www.cern.ch)
diff --git a/drivers/ipack/devices/ipoctal.h b/drivers/ipack/devices/ipoctal.h
index 75f83ba774a4..773dc41bd667 100644
--- a/drivers/ipack/devices/ipoctal.h
+++ b/drivers/ipack/devices/ipoctal.h
@@ -1,9 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
- * ipoctal.h
- *
+/*
  * driver for the IPOCTAL boards
-
+ *
  * Copyright (C) 2009-2012 CERN (www.cern.ch)
  * Author: Nicolas Serafini, EIC2 SA
  * Author: Samuel Iglesias Gonsalvez <siglesias@igalia.com>
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
