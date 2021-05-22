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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0BBC4707E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 12:41:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E2361164
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 12:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E2361164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2D39402E5;
	Sat, 22 May 2021 12:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kelaBIxTIMm8; Sat, 22 May 2021 12:41:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0500E402D4;
	Sat, 22 May 2021 12:41:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC750C000D;
	Sat, 22 May 2021 12:41:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 271C7C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 12:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F321440569
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 12:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lc-zgXttNDCc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 12:41:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 274BF40558
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 12:41:04 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id m124so16385561pgm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/oLh8QQEu9IbViO8GBt8jcTMTvvy9pU87rouSOET/to=;
 b=MjyfcplkUAvE2v0WCTF3dR+0HwunqK32tpesvAJdPbn149deALZ8TwGD7MSXugto8i
 eLeznkHFaYETGYRxb5VHIJTFJa9S9eBZV47KkrunJo5sGtac6jqenASIJsewToItWVfI
 fGPH4rXjdTuVdV4VD4onyg8ESrRSDJuuLLzRIg+HHK878G2xVJU3CMm9NnjlshfkiUjj
 5FI8Cd+KGCgoUCBHFsSacroxDINZ/yA5wAbRo/5lR0ObA+bFjpXDR9zqijEsk6bu+kLV
 KZdc9NAE0s5e9ZG+APPtBarqkWqPjT267gH3Y+fhJ5FIMtJKPAVj1aanorusd3At8hB/
 yQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/oLh8QQEu9IbViO8GBt8jcTMTvvy9pU87rouSOET/to=;
 b=TIAhwXwMJ2QfWmgDl36mouT0I6HLYnTiRE1SeY3p09GTUPhZD9KcHxa3eORkapItF3
 fvcN8PQs2T7o7U7IkwQj6y/2Mq6Mq45QaSwICtq5pVSpjSdGxqeMtaZW2rpqUycwt9ia
 aQYRn3nv+cRxX+E3GeBwa1MsfYfwlXCCHLqEKHUT+YkAQxIpgTf7zebw6QHn+pRlWXQp
 Y+I0DF5IjPzRXStsFzGziqXWRz/TkWt3OF9uBY9vuBGmFn7xapQINenAk+qOl5qyf0Ws
 LJnCoJcrJ836LdaBVr3oeu3zL+F6wi+RlutOfaMnEkHP4aPSQ2jrEnMtD+FNmHs1hAkc
 /cXQ==
X-Gm-Message-State: AOAM531Xu1PxxRDrcF2q8TPO4KCn1G7ek0eQjbtozd4M++fkDYkAsysD
 5bYLkK1iEAUtC0bWAyb8nQ0=
X-Google-Smtp-Source: ABdhPJzZSFVrXPc2rEQh3CUG0Hq0TM+eGnAJZ8HxM1di5dh3cwuMGRWLxFtZK9IZCYZp5nxfcUY4Gg==
X-Received: by 2002:aa7:88c3:0:b029:2e3:d6dc:7c6f with SMTP id
 k3-20020aa788c30000b02902e3d6dc7c6fmr11234412pff.35.1621687263445; 
 Sat, 22 May 2021 05:41:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:d9c2:4477:9177:8c76])
 by smtp.googlemail.com with ESMTPSA id f7sm6706109pfq.8.2021.05.22.05.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 05:41:03 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: siglesias@igalia.com
Subject: [PATCH] ipac: tpci200: fix kernel-doc syntax and remove filename from
 file header
Date: Sat, 22 May 2021 18:10:51 +0530
Message-Id: <20210522124051.12540-1-yashsri421@gmail.com>
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
The header for drivers/ipack/carriers/tpci200 follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc.

For e.g., running scripts/kernel-doc -none on
drivers/ipack/carriers/tpci200.c emits:
warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * tpci200.c

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Also remove the redundant file name from the comment headers.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/ipack/carriers/tpci200.c | 4 +---
 drivers/ipack/carriers/tpci200.h | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/ipack/carriers/tpci200.c b/drivers/ipack/carriers/tpci200.c
index ec71063fff76..a867906777bd 100644
--- a/drivers/ipack/carriers/tpci200.c
+++ b/drivers/ipack/carriers/tpci200.c
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
- * tpci200.c
- *
+/*
  * driver for the TEWS TPCI-200 device
  *
  * Copyright (C) 2009-2012 CERN (www.cern.ch)
diff --git a/drivers/ipack/carriers/tpci200.h b/drivers/ipack/carriers/tpci200.h
index 2619f827e33f..e79ac64abcff 100644
--- a/drivers/ipack/carriers/tpci200.h
+++ b/drivers/ipack/carriers/tpci200.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
- * tpci200.h
- *
+/*
  * driver for the carrier TEWS TPCI-200
  *
  * Copyright (C) 2009-2012 CERN (www.cern.ch)
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
