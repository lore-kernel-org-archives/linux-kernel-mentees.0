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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D09C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 18:49:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3000611BD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 18:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3000611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 939E240F50;
	Thu, 20 May 2021 18:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xme8Eqf6HMtn; Thu, 20 May 2021 18:49:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92A4B40F30;
	Thu, 20 May 2021 18:49:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67AD2C000E;
	Thu, 20 May 2021 18:49:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0E27C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97BC6401D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id th9H1_Cf0JlE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:49:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E653F401B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:49:26 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id m190so12505055pga.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 11:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3bJ6aCi358D6gLPHam70m7qIlIxiB35FHIyn3aer04k=;
 b=KxTNQW9/gvB1b9rfZC4RriR6oyJ22kiVpjF/C99eettZzJ9DMuNgPCFBEwg7hy14bu
 oOAPzAbGWao69tzW255IDM5PB3HE2nVj5yVUqJLA4cSgeDLry53UIjhSCLVrQMnK6c/i
 a8+BHXE7SzYR443eVXCrmIrabGFhjYPGERcq8YVKxS8625Fb3U8N/tpiqQs0WAaANXhC
 WZ4QDc+5wNdS1wWcd4G0YH8iuIHOTxKqy5+xzw2BUzrmZiBod2L40P45p5WTfXNDiond
 WsLgRV51k41qGOSB0GIPar1wtq+21CqVUytXitppHOSZqAH2Vav3rXsjSpukPTd8Fx6t
 BnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3bJ6aCi358D6gLPHam70m7qIlIxiB35FHIyn3aer04k=;
 b=E5QDkimF5elnBkldZ0P6/1DYdnx7MRbXDXlTQiiWNQZTwsG61nRZXvn+EoVUzULbUP
 QQpupM3X7xFV325aL9jcS7rgFYRBjq2C4teHlMNJZbmihzZXR2KHH9lscUB22RwzViiw
 OqlUp1XBsAsWRppK6PcDs9Z+9bp2hkz4YERDO31xaoGK+9xV4P9UsOo0OO5UkREBaTOS
 CrFrwZyfY6jAd7XKhfYJOpdzzxqGPTslljqU3BSDwy527xgLmJa8lFhXFu+QHR/JXTm6
 6KuDGuygrqQNn5Yj7sz09DPGA6cMD6iEMn2uaaqbFNspx1WbItJzGFwl0Ehq+4Q9tved
 rXiA==
X-Gm-Message-State: AOAM531V1RJu6LXekD2SlcV4LuKhvXdclAqMpwsvp5fJ9kxH+FkucHiH
 HJbxHWJ0ajmzcLwXx0uxzEU=
X-Google-Smtp-Source: ABdhPJxxGJ2l0KhcECjJ8y0p4tXKuyfnCVIopqfN8F2ZIwSg2T93Y2vTlT/+TBnoradgW6ZEMixlYA==
X-Received: by 2002:a62:2e04:0:b029:2db:4c99:614f with SMTP id
 u4-20020a622e040000b02902db4c99614fmr6078229pfu.47.1621536566193; 
 Thu, 20 May 2021 11:49:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:4822:12f2:8c52:6d8b])
 by smtp.googlemail.com with ESMTPSA id n30sm2741230pgd.8.2021.05.20.11.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 11:49:25 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: davem@davemloft.net
Subject: [PATCH] net: encx24j600: fix kernel-doc syntax in file headers
Date: Fri, 21 May 2021 00:19:15 +0530
Message-Id: <20210520184915.588-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: yashsri421@gmail.com, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
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
The header for drivers/net/ethernet/microchip/encx24j600 files follows
this syntax, but the content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc.
For e.g., running scripts/kernel-doc -none
drivers/net/ethernet/microchip/encx24j600_hw.h emits:
warning: expecting prototype for h(). Prototype was for _ENCX24J600_HW_H() instead

Provide a simple fix by replacing such occurrences with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/net/ethernet/microchip/encx24j600.c    | 2 +-
 drivers/net/ethernet/microchip/encx24j600_hw.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/encx24j600.c b/drivers/net/ethernet/microchip/encx24j600.c
index 3658c4ae3c37..ee921a99e439 100644
--- a/drivers/net/ethernet/microchip/encx24j600.c
+++ b/drivers/net/ethernet/microchip/encx24j600.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
+/*
  * Microchip ENCX24J600 ethernet driver
  *
  * Copyright (C) 2015 Gridpoint
diff --git a/drivers/net/ethernet/microchip/encx24j600_hw.h b/drivers/net/ethernet/microchip/encx24j600_hw.h
index f604a260ede7..fac61a8fbd02 100644
--- a/drivers/net/ethernet/microchip/encx24j600_hw.h
+++ b/drivers/net/ethernet/microchip/encx24j600_hw.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
  * encx24j600_hw.h: Register definitions
  *
  */
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
