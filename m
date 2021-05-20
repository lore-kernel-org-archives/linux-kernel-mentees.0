Return-Path: <SRS0=G2n4=KP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7BEC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 18:29:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BDBB611AE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 18:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BDBB611AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3363404D3;
	Thu, 20 May 2021 18:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpf-mtrb8rS4; Thu, 20 May 2021 18:29:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1377E401B4;
	Thu, 20 May 2021 18:29:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFB10C000E;
	Thu, 20 May 2021 18:29:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7318C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9567040F1E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqzK8c5gYupZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:29:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB7B240EFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:29:43 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id t21so9610157plo.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 11:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=A5d5aXdYt4hUl4+OV6UCI0Ehr+lwjM7hULNb+KOTJBk=;
 b=mHfOQeUu443DNLDYLp+xnnQrdjLJ9NJVfNCnG8FbZQmy/mHxwfnSZrF6h3w2bB/FGG
 4/LGzuyWtTWnFozYltQlLTcWw45iYC/cMWdv2yw2wwOAU7AK8Qiad11ZkSYEc2mQSLDk
 RIquag+KH3ks4SDPhJZYEYhjEtxJ/4A0AEoDAG0kLVPHPFlS93ce8HmwDhPEyuezmHYi
 a5V6gsuwKD7TSWzTB2iauRm9pgKf3dbjQHracgbofMh4Ybnm8hmb9sJA3g9vecOe0PgC
 aExfunlVz8ZmyC8qwRMRQr0cX1lrogoITi2Tb+FoATqys39dHsZuXM3fyDKAwBAIougB
 qLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=A5d5aXdYt4hUl4+OV6UCI0Ehr+lwjM7hULNb+KOTJBk=;
 b=uL0p/ObPzJ/O7cUnuvio5qsyVr/87xJ86git17Ee3NNKfz95VRQZ1gZO5myPi8xaFU
 /PA2pTGIvS5RAgRCKesPuaWg6ZR1p9V12+0b+x56rWwrjNc1pEASyORaenV0kJuqkN2q
 816omCcOzDX3Ty1Lm1HPqLadADxoyHpnZ8HKAvljYtlUB1EW1E7lYUkl6oC3YhMy4LDp
 sTfkZApoLMN29FF+l9647NI1h2QjOHOYoHuc+yzzl9Gt64pnyTTEVVPsR4fytmvt8WFz
 SB9VpH/LlqDoYBJMvCG+SfVMGjDC5VbirD97fqfbHbSEB0aXkm7NibXkG+Nt/HYrBiWT
 xVrw==
X-Gm-Message-State: AOAM532kF9COK2QPnXJmT+2VFxyBbKlceWU6D3JXtvcY3eb/zTWjY3YG
 GcVXvWnt+tlicC4qFQ8EKxI=
X-Google-Smtp-Source: ABdhPJxOsKiisPY6gD0XTtm54BHxN5/X6kqG62g5FH1fZk9hUMPUlWOM4/wQPAZ7w0t0LCRDV5Vt8Q==
X-Received: by 2002:a17:902:8d83:b029:ef:9dd8:4d9 with SMTP id
 v3-20020a1709028d83b02900ef9dd804d9mr7421444plo.40.1621535383183; 
 Thu, 20 May 2021 11:29:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:4822:12f2:8c52:6d8b])
 by smtp.googlemail.com with ESMTPSA id 66sm2764268pgj.9.2021.05.20.11.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 11:29:42 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: jaegeuk@kernel.org
Subject: [PATCH] f2fs: fix kernel-doc syntax in file header
Date: Thu, 20 May 2021 23:59:33 +0530
Message-Id: <20210520182933.31965-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: chao@kernel.org, yashsri421@gmail.com, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
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
The header for include/linux/f2fs_fs.h follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * include/linux/f2fs_fs.h

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 include/linux/f2fs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 5487a80617a3..028d1b18f0e7 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * include/linux/f2fs_fs.h
  *
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
