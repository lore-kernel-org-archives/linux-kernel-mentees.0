Return-Path: <SRS0=n6YR=KN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F42DC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 18:04:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1907C611BF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 18:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1907C611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D28CD403E5;
	Tue, 18 May 2021 18:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K9xmxFD0gvLH; Tue, 18 May 2021 18:04:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1BC540003;
	Tue, 18 May 2021 18:04:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCA64C000D;
	Tue, 18 May 2021 18:04:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCAA6C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB3ED6066D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cg7KxiEf9VjF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:04:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 244A3608F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:04:06 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id v12so5538987plo.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 11:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=aSYL3pcR/hm+AB6E8ZocVOOdmI+sax3R1YjjSrPim0Q=;
 b=msX/iV3PaXpMuvYv16n8sm1kVUXR1VCASL7ij/VUywRX2z6VPSy1ckrjSTOt0Q7kzi
 D7CPUQ7uG0bRGuJ6zW4MBWP52e+85KX8s1UFvjUBZnepinyq5N/3cSTm57Q093I9eQDO
 fbWrugDBiDe4ruLEUcMafl2qZKXtXNbimw4Er6gmCGF8HJYJr8qvX5q4dy+4mtQRnIe7
 b0AZD4C6JfOuNz7ai+8EBPP5wPMbfeAFKb3VEDMOAOK9SQFGSjLOD+99LrdcHCt1vvDn
 8QWmZjgHJ93hG/0MSOwKvfGywyUZXS5gA2dCToRibKuxq671zyykTrQmcCulcfyzls0/
 mA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=aSYL3pcR/hm+AB6E8ZocVOOdmI+sax3R1YjjSrPim0Q=;
 b=rM/REyyOJdeCu/t4Y/bcEAkp+qKxLqDig6HUnKozLbbT2ULP4bALzYNiGtcnHyMuk9
 mrlAZDhIstEQhvjjNlugXhPWfHddaYserrpqcFTxq2HuVatAK964xj42AadqIZ1wQwe9
 6KdCIWQBa3BG/DOrS7AEVREPCuE12QHTs6c7NImK3qTLkD+LqJblX0c0oDMNpEvjYoxP
 FbUaHrH8AGwgxt4BNXg1xA98FyBfq/FgsDcexFPFQdNmDAxGzYkdsD9NbotqBCQbzqWo
 3gdemehclW7TcEPHj5vNaa807pm/QhL0onkBnb8QW3PCoKJpjt4dXAlh0MlGNn0mZwMK
 1Q4w==
X-Gm-Message-State: AOAM533u5CU6pJGET6rmsNcR6i831go2D/nKj5NMc4AUCFvg7lUFVvGU
 1htVMsO15wKtwpVV9CJOJss=
X-Google-Smtp-Source: ABdhPJwTdBbXo34uOl7LFiUUM4F9v0Sf1Z28QFEANtjrFKXHbPjOCMlk9qr14UFXSipskYcxZYC4cA==
X-Received: by 2002:a17:902:bc81:b029:ef:3f99:9f76 with SMTP id
 bb1-20020a170902bc81b02900ef3f999f76mr6003422plb.33.1621361045418; 
 Tue, 18 May 2021 11:04:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:e998:b72d:dcc8:8823])
 by smtp.googlemail.com with ESMTPSA id o9sm13573919pfh.217.2021.05.18.11.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:04:04 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] win_minmax: fix kernel-doc syntax in file header
Date: Tue, 18 May 2021 23:33:52 +0530
Message-Id: <20210518180352.13154-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rdunlap@infradead.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-doc@vger.kernel.org, yashsri421@gmail.com
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
The header for include/linux/win_minmax.h follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
warning: expecting prototype for c(). Prototype was for MINMAX_H() instead

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210514

 include/linux/win_minmax.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/win_minmax.h b/include/linux/win_minmax.h
index 4ca2842d2842..54bd6f133fa6 100644
--- a/include/linux/win_minmax.h
+++ b/include/linux/win_minmax.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
  * lib/minmax.c: windowed min/max tracker by Kathleen Nichols.
  *
  */
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
