Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BD8C001E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Aug 2023 06:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25A7541ADE;
	Wed, 16 Aug 2023 06:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25A7541ADE
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fAN3Gcyn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yGBeoLXTT9mT; Wed, 16 Aug 2023 06:04:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E7FCA41921;
	Wed, 16 Aug 2023 06:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7FCA41921
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1A3DC0072;
	Wed, 16 Aug 2023 06:04:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A6C8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 06:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 409D660BBF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 06:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 409D660BBF
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fAN3Gcyn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-HZFNAqvVKW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 06:04:07 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA76B60BA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 06:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA76B60BA7
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bc7b25c699so37920175ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 23:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692165847; x=1692770647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rbPoi4ehPomih+rqf88RiO5h1U0eqpVIVYqKIjGhfGk=;
 b=fAN3GcynkbGimSGd2qlO/ZSNWCeT3xkrYpQcSIIZBCfaZUGK136dTx7VICBO/DLBNy
 n0dLVuxcOvRL8EOHgnJY0tC+nJI26VtMve8hYOh7OH7cNGfBwEwYi5WzXM4hJJPgjG35
 VxpIziT3Ps/7HldFE1PM/AnvsUSIRHHH4yhQxR8Iw/5UNldR37lTpqJtd8AKMR0YNZ4T
 UPo0YFT1KwDdO9b4HEVvyDNpk5COap+IynGbHMU3A1WdN2qDW24XmoKEzFMHDKbI+5F/
 Z+YHLEolVPM9DYCqtH+dllQBx/t7zDoTV3u1Sn9jK4H4qFtvQd4RqE4Ni8rvmkc73QjT
 3rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692165847; x=1692770647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rbPoi4ehPomih+rqf88RiO5h1U0eqpVIVYqKIjGhfGk=;
 b=S6PbJBlhznZhrvplFadTH+pK/hPB4N3kvE8lswhtAmf7XO4tZ0gS5cCl1Dxbi32UdR
 DTiRCMZJMeUKrScC3QiwgsfxyUC/CqOurBbY5AYXSIFu7upLtT1cjBBKL2mgjFLeJxU6
 lk8KqA6eo3OZV5NULsMcSVPLzkoGSStHWPTSWUq6bVCSHA+o/+L4QHfUUr12XXvrjd+1
 9XDzYPdHlkNKr8f9DYxIcfpxbggmrelaI4LT4tzHqzGUdX2n+G/Fzwll/Oh8Uk4Was1G
 qLHq5cSJXLuSJpgTaR9vwFEF9g1scLKqEDYqV3aJcJNxjw1bjxn/NBhsW0ahVMo9jovo
 +98g==
X-Gm-Message-State: AOJu0YzTwbY7tp5wg5g1aPMDQ62WTgydoTgSz4hU17pmtpzjvtc+8uVi
 h243A1qAA58Gi190NoaVKlc=
X-Google-Smtp-Source: AGHT+IHCvKBGYexTHi4GxrfOP23dA+hKP/eU7GIHNxlDSlDm0J0q4sI4luT5s/Z9TtM8wQP8JQZgSA==
X-Received: by 2002:a17:902:e892:b0:1be:f2a1:22d8 with SMTP id
 w18-20020a170902e89200b001bef2a122d8mr484944plg.14.1692165847095; 
 Tue, 15 Aug 2023 23:04:07 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:100b:771e:e5ae:d854:9f75:d38f])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a170902dad000b001b89466a5f4sm12093376plx.105.2023.08.15.23.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 23:04:06 -0700 (PDT)
From: coolrrsh@gmail.com
To: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dma: dmatest: Use div64_s64
Date: Wed, 16 Aug 2023 11:34:00 +0530
Message-Id: <20230816060400.3325-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

In the function do_div, the dividend is evaluated multiple times
so it can cause side effects. Therefore replace it with div64_s64.

This fixes warning such as:
drivers/dma/dmatest.c:496:1-7:
WARNING: do_div() does a 64-by-32 division,
please consider using div64_s64 instead.

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
---
 drivers/dma/dmatest.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index ffe621695e47..07042f239db8 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -9,6 +9,7 @@
 
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <linux/math64.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/freezer.h>
@@ -493,7 +494,7 @@ static unsigned long long dmatest_persec(s64 runtime, unsigned int val)
 
 	per_sec *= val;
 	per_sec = INT_TO_FIXPT(per_sec);
-	do_div(per_sec, runtime);
+	per_sec=div64_s64(per_sec, runtime);
 
 	return per_sec;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
