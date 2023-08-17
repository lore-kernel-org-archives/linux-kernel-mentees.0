Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7544C3DA58
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 17:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 771564192D;
	Thu, 17 Aug 2023 17:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 771564192D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bDyqFsJd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BCc4dUaCkUlt; Thu, 17 Aug 2023 17:36:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 45D2B400D2;
	Thu, 17 Aug 2023 17:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D2B400D2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19627C0071;
	Thu, 17 Aug 2023 17:36:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3816CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 17:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2D3961504
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 17:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2D3961504
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bDyqFsJd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yz1WkP_pV8Aj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 17:36:43 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 645EB60AC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 17:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 645EB60AC0
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bdfb11ea2aso337635ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 10:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692293803; x=1692898603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lkje228NQWYrR/qCRwOjDNFj5AUJFOJz23skZpqsW4g=;
 b=bDyqFsJdJTAycj6jOtpqBOVcXY+KfUrt5c2IumDkVOn6oWGGSFUFAV/mUW4IPFYfy1
 L7rQA5xhfljnCZAwyNqR9vPRx7Z7dYDxak3Jd8fmK494wz21JeY7GK1AcDe4ecxiPU/g
 HWCJ/EfsEAPJFpkCkThm+6iuHNxSehAAXWY7z9CRLBMGVa+UTd9pwLNMc87ZtsjStvYO
 wOp90kTsU57YSDp/xVtbu0N6hxQjbHUxcS2DJWdQJjv5a6iAQL/FszADLQ+8+fI9yTty
 jFdlg91HE0ZYSfIU2Av2efcMdrTT0JpxLAe1gJxZp4POq7a4VOU88els17RIYsZIzgB+
 yzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692293803; x=1692898603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lkje228NQWYrR/qCRwOjDNFj5AUJFOJz23skZpqsW4g=;
 b=ZMr0zzI4d2lxsSweI71v2TnR8IYa/Wfm3atQk4MJjnIUeDxLuj6pUr1w4ECDAFwEqO
 d7rY5Rckzlu4KobGPJXlWFu79baou7UV/U5Hrt6h2MU2VDZVTZPRM8jAaZaePohRc/7n
 isGxqDgiI3GkVdqj/NgIY8nwbLKyx9KNtMT0RmosXMboWrnWS1arHAoXxs7U5rDQSaMj
 Ipw+rRAVOohqGr0zoaKxX0gKTINLRKgIotoH/Jy1BkjuPb1xjIj3YOV1ZntFJuLgkTkA
 iq2PB20vyfxsS6dEUka/pVIMT2+wS3TzKgzo7/dD5GexEPi/M+uh9F3Foj5EzZyCSfcX
 /d1A==
X-Gm-Message-State: AOJu0Yxoyu8kMaaGUaOLiJz+/+IeFtknlSSKs0tOkDNNeUVzGhjx82Uj
 uuwm4SNy4ugTD/NUedt0uoU=
X-Google-Smtp-Source: AGHT+IEKB7h2NPiCo+RacmjVMEfygFsGLetxsL7KqBu1PrZRI7bUsQiZEW58MnXVt367y3dCyEa0gQ==
X-Received: by 2002:a17:902:c451:b0:1bb:e74b:39ff with SMTP id
 m17-20020a170902c45100b001bbe74b39ffmr119206plm.0.1692293802686; 
 Thu, 17 Aug 2023 10:36:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58e9:c155:d912:d62a:88e5])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a170902d4cc00b001b8a00d4f7asm47018plg.9.2023.08.17.10.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 10:36:42 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: stefani@seibold.net
Subject: [PATCH v1] samples: kfifo: Fixes a typo
Date: Thu, 17 Aug 2023 23:06:36 +0530
Message-Id: <20230817173636.78757-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org,
 Atul Kumar Pant <atulpant.linux@gmail.com>, linux-kernel@vger.kernel.org
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

Fixes a typo in a comment.

Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
---
 samples/kfifo/dma-example.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/kfifo/dma-example.c b/samples/kfifo/dma-example.c
index 0cf27483cb36..112b0e427199 100644
--- a/samples/kfifo/dma-example.c
+++ b/samples/kfifo/dma-example.c
@@ -80,7 +80,7 @@ static int __init example_init(void)
 			break;
 	}
 
-	/* put here your code to setup and exectute the dma operation */
+	/* put here your code to setup and execute the dma operation */
 	/* ... */
 
 	/* example: zero bytes received */
@@ -109,7 +109,7 @@ static int __init example_init(void)
 			break;
 	}
 
-	/* put here your code to setup and exectute the dma operation */
+	/* put here your code to setup and execute the dma operation */
 	/* ... */
 
 	/* example: 5 bytes transmitted */
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
