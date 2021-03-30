Return-Path: <SRS0=Bfkk=I4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15861C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 21:18:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC32619B1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 21:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC32619B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55F7360877;
	Tue, 30 Mar 2021 21:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ifyRQP7a5_dl; Tue, 30 Mar 2021 21:18:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7695D6005E;
	Tue, 30 Mar 2021 21:18:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 541ABC000C;
	Tue, 30 Mar 2021 21:18:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B12CEC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A031E403A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fq_gbZW6Hrs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:18:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BB6D4039F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:18:25 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id o2so6815933plg.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 14:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0hCCH2XK2WKc3/NMTfTJuxcj4iYhKKtGeh0w+rMsGRA=;
 b=dIAmtZX6QLMB6nyPGjJOJvsE0+5UFuoN2sjoVsv84n6468OtA/tdw2KijUZ/IuIgPm
 l8Qvshf7gdeQBaDvsrjK+D5EMpl7BcT18eByXcNhhrS7ADByI5DWF8fXTZBszvH0zz23
 mBZqV/W6MWQ7MnbzC5gCyTVwzYpab58DywaB+Ni4Y+Jp7bZWDFG8tvHVbmE3C5UH9+z+
 W0fL6h0VaQZXclsmYZvbg6T8e3MHup2uIeExe0yuKVFYC0WR88zTeFi6nXiDD6ef9lO7
 PsnX/R/skQww7x1yHN562BAOrCvNwaRq59MgZoRBhut9F87V5dhq4+w9ZPD3bWxI7ifv
 FbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0hCCH2XK2WKc3/NMTfTJuxcj4iYhKKtGeh0w+rMsGRA=;
 b=OQR5lhf44yMwtCWMK3ATa5XmqUFnYmAbqlAfLpz9GmHdJrFgYDzNL7T+AvdPa4aN2Z
 X+YN3Py76fmcSALHly+wtu63LNxUo6W7NqvzdAHrenpBuXWb/SNDoa+2Je8l8YVIxFZ+
 uXwGTorOuwKtq0RjPDc3bTcJfQQi1g0CvWBBoRyhvmUs9UlPZFoCfntfkStnW5jBs/e0
 RQpNuFjKUF7V0LbZa89Ah0vpl/0b+nq9+rHYuDTsikq8sGv6Lr+LuJKrqcuJ1JLS4CkT
 AjrLq7NCYb3brTCVA5x64Qr3BLjl4Gz6ehHGWqa41gPMOR7aJyc5GJTTuJT2dop+UArv
 Au8w==
X-Gm-Message-State: AOAM533znX3dA4G5AyUqPUziTO/ejDBK05ux1nFTPRSN9mb52GU9hrpe
 lJWoJkKsqpztjDlcjOLC8mA=
X-Google-Smtp-Source: ABdhPJwOetdP5TPzQGombkkWqjSdYSU7TMN0l0/R8PKVcYlRfiqQzkdzhuZrDqQYrOGFa/wLX/KP8g==
X-Received: by 2002:a17:902:e74e:b029:e5:bde4:2b80 with SMTP id
 p14-20020a170902e74eb02900e5bde42b80mr193920plf.44.1617139105273; 
 Tue, 30 Mar 2021 14:18:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:d1c0:d79d:e260:a650])
 by smtp.googlemail.com with ESMTPSA id e9sm120387pgk.69.2021.03.30.14.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 14:18:24 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] x86/sgx: fix incorrect kernel-doc comment syntax in files
Date: Wed, 31 Mar 2021 02:48:13 +0530
Message-Id: <20210330211813.28030-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: dave.hansen@linux.intel.com, yashsri421@gmail.com, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, x86@kernel.org, jarkko@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-sgx@vger.kernel.org
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
There are certain files in arch/x86/kernel/cpu/sgx, which follow this
syntax, but the content inside does not comply with kernel-doc.
Such lines were probably not meant for kernel-doc parsing, but are parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc.

E.g., presence of kernel-doc like comment in the header lines for
arch/x86/kernel/cpu/sgx/encl.h causes this warning:
"warning: expecting prototype for 2016(). Prototype was for _X86_ENCL_H() instead"

Similarly for arch/x86/kernel/cpu/sgx/arch.h too.

Provide a simple fix by replacing these occurrences with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 arch/x86/kernel/cpu/sgx/arch.h | 2 +-
 arch/x86/kernel/cpu/sgx/encl.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/sgx/arch.h b/arch/x86/kernel/cpu/sgx/arch.h
index 26315bea1cb4..70b84bbdaa1d 100644
--- a/arch/x86/kernel/cpu/sgx/arch.h
+++ b/arch/x86/kernel/cpu/sgx/arch.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
  * Copyright(c) 2016-20 Intel Corporation.
  *
  * Contains data structures defined by the SGX architecture.  Data structures
diff --git a/arch/x86/kernel/cpu/sgx/encl.h b/arch/x86/kernel/cpu/sgx/encl.h
index d8d30ccbef4c..76b9bc1c5c30 100644
--- a/arch/x86/kernel/cpu/sgx/encl.h
+++ b/arch/x86/kernel/cpu/sgx/encl.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
  * Copyright(c) 2016-20 Intel Corporation.
  *
  * Contains the software defined data structures for enclaves.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
