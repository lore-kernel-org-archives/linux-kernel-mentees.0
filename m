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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EF5C47082
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 15:09:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D8CF611CB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 15:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D8CF611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52EC960684;
	Sun, 23 May 2021 15:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IztmjAkdM25X; Sun, 23 May 2021 15:09:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7419060596;
	Sun, 23 May 2021 15:09:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49515C000E;
	Sun, 23 May 2021 15:09:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC909C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 15:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2E44605BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 15:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VzmC4X0k3kWG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 15:09:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 080F260596
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 15:09:31 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso9725154pji.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Mc7yOhrqVtGGsvyRmdX2MsPwB1LLZVrbl9jBESxilQ0=;
 b=CfJwiQppds25Ljl+i2BlgRJ9Iv7M4b50bCacM4p/aCYP+cxywS3w3MH7W6T1IkZkAK
 /lDgQhaMsJx/64Nk+T7KmQUdrDHkYkn05loST+KkOcmKLqxiXaUy7KNCzCRMF2GFKkEq
 FpJ0AR1Ui6ElHupyFweYu39lIF+LfsobvzAJon1Sr9biqBHh377QlAhATtQmGCf5G+qZ
 nTOFsgZOzfyqOtiOShMLmFDJnViBHRW+R6AYhS/eKMusM7HPnT56IKv86ap1KwfJ35M8
 DYHpf7zPh1ghFjr0QeVsJjifkGT7Nd7JDBVCTOj2gs7Ag1oVH9tyFXb46eMsSLN70qGa
 AY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Mc7yOhrqVtGGsvyRmdX2MsPwB1LLZVrbl9jBESxilQ0=;
 b=joMdeXkU0n1pf8LZqfmbalmjh+Hd6Rri2Emse9pGoYyYYLzgg1gdfmUFgdcAfbGpx1
 YwdJvYAHMeXfBWbyJomvWFocRJN12KfGCzhkRtq6tyHQj0yBa8TF2urIkGVqhGSvhiHL
 n6+R1xSq9WNZuiQJOoGkJnmaE+C0Q4n8N2m4zJ7lcor+ekQGdSWRLi55glUA6b0HSAX5
 ggezn3ifGEDirdoMJY0dUehBN8RoWpjAP1WGcPeJaFWqapBFs0ZL/U70IYZRy+fl6jHr
 +b/fJDTjCJL7Cko6nSi3JPWT9+oAqC0bqn5ux9FDIdRRUVfhP7rU2Njbb3+d1KL/n4mg
 W4bg==
X-Gm-Message-State: AOAM530vWb9rea0eIhEj4ycxtc7JBDpcQPffYNFbC0lJZIci6m6iYVgQ
 id0gT4DwdGP4gr+JNy6kF14=
X-Google-Smtp-Source: ABdhPJzZimt3u5Tj6ZV1xI7hQaedlcZpkQ7FtdkSvjwe8Jf+vozgbKLkQpIafNKt037IFMgKbcpIVw==
X-Received: by 2002:a17:90a:4493:: with SMTP id
 t19mr20118821pjg.217.1621782571290; 
 Sun, 23 May 2021 08:09:31 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:c492:941f:bc2a:cc89])
 by smtp.googlemail.com with ESMTPSA id
 ch24sm13191072pjb.18.2021.05.23.08.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 08:09:30 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: kafai@fb.com
Subject: [PATCH] samples: bpf: ix kernel-doc syntax in file header
Date: Sun, 23 May 2021 20:39:17 +0530
Message-Id: <20210523150917.21748-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
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
 samples/bpf/ibumad_kern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
