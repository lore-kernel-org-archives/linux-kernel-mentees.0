Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF1FC001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Aug 2023 06:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF0C7817AD;
	Mon, 14 Aug 2023 06:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF0C7817AD
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KhDw23MP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f361qtMBTvDv; Mon, 14 Aug 2023 06:22:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DBFE3817A9;
	Mon, 14 Aug 2023 06:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBFE3817A9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72C23C0072;
	Mon, 14 Aug 2023 06:22:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CB03C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 06:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 525D960FA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 06:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 525D960FA1
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KhDw23MP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80QDNPnnNGjM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 06:22:52 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 464BA60F95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 06:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 464BA60F95
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bdaeb0f29aso18229665ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 23:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691994172; x=1692598972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rbPoi4ehPomih+rqf88RiO5h1U0eqpVIVYqKIjGhfGk=;
 b=KhDw23MPuanlxAjuOO9NR13Z2WYuW3raUWEz4gIyh50I7S9W6COU84lhou/islhuWG
 JSx1EdP5rUQ3HOxdGBLpqirzE99ZgMAYgbX8x8oGoqV1ji/NhTp+mhJtiY0l75uA+ey1
 l+P6LErd6YseDOnBrum+aHGJFn4hM9kHv45mTXp3WTfX+2/JiV7xri8y+AJ7eMBl7tcB
 15lOshmWIrGSCgi7f2W0zY0Sl64bW/DTBmkHWfdOjDfBlDmqHTUdINaKD9xw6BOuVO+e
 F4VqOvUd2DK5uPI8wczYxmc31wK+Zx3nY33dGPlzuX2WsQOBUHqolD3hyjNnJegTQFcR
 SLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691994172; x=1692598972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rbPoi4ehPomih+rqf88RiO5h1U0eqpVIVYqKIjGhfGk=;
 b=EA1nTMMLSriKhE0wvrGaQEWgDAe+mQN16UIuK/vkDlzgxtoL+rIWB+HbMNJ4RW5hjy
 3hnhxAzsHI7T8L1X+DeeIqSr+LEw6+A53L9ciTlHk4MrZSJX+zDWKH1dIhyFMYrsrEJ9
 aLt35dQhrKlPu+yhfj/+3CWnrmqg52yvEn3dZUMgI+g0AupVL1Xj8uvzwjFqlgNWCQld
 pADQRihV9dUJJKwGmfBNfO3i4xoM3Co6GEQ6CFe/YuFOaWXwTXkk6K9KaL3f8y4BOayv
 vviwHugAkc6wBh8brBuZd7h4eQQCdSvO1qUHXzGxRLPAwRYtXaehBLfhUTRz9tCFHMJs
 hKKw==
X-Gm-Message-State: AOJu0Yzd2Wf72wlawXKwe96c0qmf3KE0dE6OcYITAmx8K3yjzF9ksJK6
 w69XiYI2AFqjPEt2sQd7wfg=
X-Google-Smtp-Source: AGHT+IF+hhw4+dNlT2tD/DxR4eF682l4n3CUzSyipbEn7gbo8Ubv6r7h5vVViuR8MLR8LniVrE9L/w==
X-Received: by 2002:a17:902:e550:b0:1bb:809d:ae72 with SMTP id
 n16-20020a170902e55000b001bb809dae72mr8763076plf.33.1691994171421; 
 Sun, 13 Aug 2023 23:22:51 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:103c:3fe4:b95c:5882:bac7:2668])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170902ab8200b001b9da42cd7dsm8434571plr.279.2023.08.13.23.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Aug 2023 23:22:50 -0700 (PDT)
From: coolrrsh@gmail.com
To: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dma: dmatest: Use div64_s64
Date: Mon, 14 Aug 2023 11:52:46 +0530
Message-Id: <20230814062246.4636-1-coolrrsh@gmail.com>
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
