Return-Path: <SRS0=ODNG=IM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53DFC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 20:18:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DA5064E6B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 20:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DA5064E6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29A9B42DAD;
	Sun, 14 Mar 2021 20:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oE0iK5Rxsxxj; Sun, 14 Mar 2021 20:18:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1910044B8D;
	Sun, 14 Mar 2021 20:18:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06E01C000B;
	Sun, 14 Mar 2021 20:18:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F02CC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C6FC42DAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id weLJrU5VG7oK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:18:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D782B450E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 20:18:47 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so13630177pjv.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 13:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LMOZ5bqQ3Szyc7EP1T4fNl5+jni0DiT4SGvTYn0pp0Y=;
 b=Cyu/NbUhH0j5I44WU5uciWYm6U9iYSllJJt+Ku6eJ05wGic8HnHUnNGMSxNLsnONYY
 NJeWcq9LnLAVpURX+qCJqhnq6bSrGrw+GcPA8OmFEg4DKrzNpY4XmYNEDaCi62RYrsDL
 Stj0aiEAMaUXZ0cxoE2KDe0oUFsqHOIjZ7NyLEDFZT20OJwz3qlYrCLTr4upjhR0oPJn
 rT/s0Q2hmPeiihFxE1+B+0HJ7lvWmSzMkE5hK7eFBjZlfe1OA85uoQKRlmAnFB4NQ1jr
 HhyV6sVTd+wrz2cZvyjKGfAhZep6KZDcmYjEFr0om6szy3KisNPvSFOlo+mGQ1mioLBF
 wNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LMOZ5bqQ3Szyc7EP1T4fNl5+jni0DiT4SGvTYn0pp0Y=;
 b=PMaTzCn4pqfPNPcWYDoUDNWSm+JEGvq5+vKzCKJ48WT4hyuB9e5bGsgeNt33MGxpk9
 /VqeK4l89yg9j9UYz4ajK3Qb2lpQcRUcVAN3QABj2CrQ+5GNyClP8Uzw9Wu5x6jYgqbt
 ME6fIyM8CcQXnMZHtERb6tUv3HVE1QFeGeGAIMmNAVaHeOl53xz03f9UeezJYt1Z2d6f
 E0NFDmy4q2OD7ut8/m4qkGw1Fw6wPLf4/WSX9UPPbCVri6QHT4TMMnGxgo58VU5AaXMN
 j9LnFeHAdKl1dBWBx94XRSDhMmsL1Fc1GaLyCUzvSa6tcXnghdKC0x04HLggIbrFGXow
 KfCQ==
X-Gm-Message-State: AOAM532vYnf6yj3qakAm7odWECSCNHOZqFVvVLJq7tf+WbWmDGVDhWHZ
 EROkVGL2R173cKHpa8HS0j4=
X-Google-Smtp-Source: ABdhPJwtOw9V0Yu40j87PGSatoAiFOu24FzdmKgHWEVlV64fg4+fSJYdbekbImh4eOl/QV+8+Xs2pA==
X-Received: by 2002:a17:90a:5b0b:: with SMTP id
 o11mr9310975pji.18.1615753127338; 
 Sun, 14 Mar 2021 13:18:47 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:acdc:a5a5:c438:c1e3])
 by smtp.googlemail.com with ESMTPSA id n10sm10943793pgk.91.2021.03.14.13.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 13:18:47 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: siva8118@gmail.com
Subject: [PATCH 04/10] rsi: rsi_common: fix file header comment syntax
Date: Mon, 15 Mar 2021 01:48:12 +0530
Message-Id: <20210314201818.27380-5-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210314201818.27380-1-yashsri421@gmail.com>
References: <20210314201818.27380-1-yashsri421@gmail.com>
Cc: yashsri421@gmail.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 amitkarwar@gmail.com, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 kvalo@codeaurora.org
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

The header comment used in drivers/net/wireless/rsi/rsi_common.h
follows kernel-doc syntax, i.e. starts with '/**'. But the content
inside the comment does not comply with kernel-doc specifications (i.e.,
function, struct, etc).

This causes unwelcomed warning from kernel-doc:
"warning: wrong kernel-doc identifier on line:
 * Copyright (c) 2014 Redpine Signals Inc."

Replace this comment syntax with general comment format, i.e. '/*' to
prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/net/wireless/rsi/rsi_common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/rsi/rsi_common.h b/drivers/net/wireless/rsi/rsi_common.h
index 60f1f286b030..7aa5124575cf 100644
--- a/drivers/net/wireless/rsi/rsi_common.h
+++ b/drivers/net/wireless/rsi/rsi_common.h
@@ -1,4 +1,4 @@
-/**
+/*
  * Copyright (c) 2014 Redpine Signals Inc.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
