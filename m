Return-Path: <SRS0=ZuYk=KS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E16C47082
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 15:14:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FF6A6100C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 15:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FF6A6100C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC434606E3;
	Sun, 23 May 2021 15:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvmB3Sk4R9wR; Sun, 23 May 2021 15:14:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2936260684;
	Sun, 23 May 2021 15:14:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2FD0C000E;
	Sun, 23 May 2021 15:14:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E21A5C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 15:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDF3582D0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 15:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6TmyH4HUiaH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 15:14:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A977882C75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 15:14:23 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id j12so18203142pgh.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 08:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DYAJsKGaNMXlZ5z7Y202JilMErjhQXaG67fAc2NRRFU=;
 b=qtR5tZ4xaAqfTOMolkHMLZoO2fh7YAnIoQIzMxo6UjgYqxugMF70cfTiTARj0xoHlq
 5/vxi7JPoEHBBJpDH5Knx56c+wwpe0KpRgf8TAThPUxE+h21/gWNq4ob2p0+ywWnu2O8
 30qkkFRGcWmB1jVBpC/UlKcSoNOvJbBHWNWS6ldXDSjujElT6a7gOHzpAlvjeLrDfLKz
 sIBdlLJSIx2GeH4lvN22wtOhr6i9fPQZCLRR10YP215yfQy+bsaDsMaf3okCZT57URsH
 dHvXXFNJcKsgDzQ/9kq66FSCt7tvLIiRg0XOp66gH6MgBilkCmYfxng2ht8JK9osXpab
 gbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DYAJsKGaNMXlZ5z7Y202JilMErjhQXaG67fAc2NRRFU=;
 b=Rziq5MPCum2huhXhLFpT02d7d2Pkuc2pB0Y55PYhBsirelhlk9f+H3El9H8lCBpZ/T
 ZEDnJ11lFb12zM/d78VQebhypf3p00sxZBAQGfWBNxyXbiTdML5looQ3Ov4WupYVWTP/
 gREG/h1th1wDz+Iuc+LDcwu2YDoeKgqp1i70wuKFMBk4/FaemgcHUoa4RmueqVO7BMjR
 CYPvkjImWz4rPmbakRc95ZroKkC+ZknxJXGG+WcyXBdRkE/TyK3L5jY8yODoSitbc5A1
 dP0gbWvLY7iJ1RjV0hPtmzRT2r6TqG2de8Rg/fiTIh3tPIMhfE4OcL4DqUWxxtrINqq6
 e8Ug==
X-Gm-Message-State: AOAM5339I+acKDWIwW0WCAUZIbfC6XmAh2tsx3M4wQoeS4ee376VoCMM
 6qcZmtx7VAo2y8pA7neeMNA=
X-Google-Smtp-Source: ABdhPJxgYdsRVQ+3NZpShC24UhLHetz6ER6YC9eSr/QfIL4pfvSraMInmsI+F/aTBbSLDuJHLoqqoA==
X-Received: by 2002:aa7:8d4a:0:b029:2e8:df53:cbd6 with SMTP id
 s10-20020aa78d4a0000b02902e8df53cbd6mr1537572pfe.13.1621782863096; 
 Sun, 23 May 2021 08:14:23 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:c492:941f:bc2a:cc89])
 by smtp.googlemail.com with ESMTPSA id c1sm5050383pfo.181.2021.05.23.08.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 08:14:22 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: kafai@fb.com
Subject: [PATCH v2] samples: bpf: ix kernel-doc syntax in file header
Date: Sun, 23 May 2021 20:44:08 +0530
Message-Id: <20210523151408.22280-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210523150917.21748-1-yashsri421@gmail.com>
References: <20210523150917.21748-1-yashsri421@gmail.com>
Cc: jgg@ziepe.ca, songliubraving@fb.com, daniel@iogearbox.net,
 linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 rdunlap@infradead.org, john.fastabend@gmail.com, linux-kernel@vger.kernel.org,
 ast@kernel.org, yashsri421@gmail.com, dledford@redhat.com, yhs@fb.com,
 andrii@kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org,
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
The header for samples/bpf/ibumad_kern.c follows this syntax, but
the content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc:
warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * ibumad BPF sample kernel side

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2: Include changes for both, samples/bpf/ibumad_kern.c and samples/bpf/ibumad_user.c in the same patch

 samples/bpf/ibumad_kern.c | 2 +-
 samples/bpf/ibumad_user.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/bpf/ibumad_kern.c b/samples/bpf/ibumad_kern.c
index 26dcd4dde946..9b193231024a 100644
--- a/samples/bpf/ibumad_kern.c
+++ b/samples/bpf/ibumad_kern.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
 
-/**
+/*
  * ibumad BPF sample kernel side
  *
  * This program is free software; you can redistribute it and/or
diff --git a/samples/bpf/ibumad_user.c b/samples/bpf/ibumad_user.c
index d83d8102f489..0746ca516097 100644
--- a/samples/bpf/ibumad_user.c
+++ b/samples/bpf/ibumad_user.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
 
-/**
+/*
  * ibumad BPF sample user side
  *
  * This program is free software; you can redistribute it and/or
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
